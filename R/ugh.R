#' Print a Random Inspirational Quote
#'
#' The `ugh()` function prints a random inspirational quote to lift your spirits!
#' It reads quotes from a JSON file included in the package.
#' @export
ugh <- function() {
  # Load jsonlite library
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("The 'jsonlite' package is required but not installed. Please install it.")
  }

  # Read quotes from the JSON file
  quotes_path <- system.file("extdata", "quotes.json", package = "ugh")
  quotes <- jsonlite::fromJSON(quotes_path)

  # Select a random quote
  random_index <- sample(seq_len(nrow(quotes)), 1)
  quote <- quotes$quoteText[random_index]
  author <- quotes$quoteAuthor[random_index]

  # Print the quote and author
  cat(quote, "-", author, "\n")
}
