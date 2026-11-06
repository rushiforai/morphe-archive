/**
 * Game data: parsing Wordfeud's API responses ({@code ResponseParser}), replaying a game log into board and rack
 * ({@code GameReplay}) and keeping the latest state per game ({@code GameStore}).
 *
 * <p>Wordfeud dependency: the JSON of {@code user/games/detail/} and move responses. Parsing is strict on purpose: an
 * unknown log event type or field makes that one game unreadable (error GS-DATA / GS-EVENT-&lt;type&gt; with the details
 * in "Copy details") instead of showing wrong moves. A new API field is fixed by adding it to the field sets in
 * {@code GameReplay}.
 */
package app.wordfeudwordfinder.extension.game;
