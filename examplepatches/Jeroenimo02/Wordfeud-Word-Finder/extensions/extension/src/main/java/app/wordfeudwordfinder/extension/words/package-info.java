/**
 * Word lists: downloading the list of a ruleset from this repository ({@code WordListSources}, generated from
 * wordlists/manifest.json; {@code WordListManager}), turning it into a compact word graph ({@code WordGraph}), words
 * the server rejected ({@code RejectedWords}) and the reports to the maintainer ({@code WordReporter},
 * {@code MissingWords}, {@code UsagePing}).
 *
 * <p>Wordfeud dependency: {@code tile_points} of a ruleset (the alphabet) and the rejection response
 * ({@code illegal_words}).
 */
package app.wordfeudwordfinder.extension.words;
