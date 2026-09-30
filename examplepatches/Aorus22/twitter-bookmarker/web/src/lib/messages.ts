/**
 * Exact user-facing copy prescribed by PRD-2 §59/§61.
 *
 * These strings are contract, not styling: the acceptance harness and the
 * product requirements both match them literally. Keep every consumer importing
 * from here so there is exactly one source of truth.
 */

/** PRD-2 §61 — the backend is unreachable (transport failure). */
export const COULD_NOT_CONNECT_MESSAGE =
  "Could not connect to Twitter Bookmarker backend"

/** PRD-2 §61 — the gallery API failed for any other reason. */
export const COULD_NOT_LOAD_COLLECTION_MESSAGE =
  "Could not load this collection"

/** PRD-2 §59 — no collections exist yet. */
export const NO_COLLECTIONS_TITLE = "No collections yet"

/** PRD-2 §59 — the supporting line for the empty gallery state. */
export const NO_COLLECTIONS_MESSAGE =
  "Saved tweets will appear here after you organize them with the extension."

/** PRD-2 §61 — the retry action label. */
export const RETRY_LABEL = "Retry"

/** PRD-2 §60 — a valid collection that contains no posts. */
export const EMPTY_COLLECTION_TITLE = "This collection is empty"

/** Design spec §3.6 — the supporting line for the empty-collection state. */
export const EMPTY_COLLECTION_MESSAGE =
  "This folder is quiet. The next bookmark will bring it to life."

/** PRD-2 §60 — zero results because the active filters match nothing. */
export const NO_FILTER_MATCH_TITLE = "No posts match your filters"

/** PRD-2 §60 — the action that clears the active filters. */
export const CLEAR_FILTERS_LABEL = "Clear filters"

/** Design spec §3.3 — the collection page back link. */
export const BACK_TO_COLLECTIONS_LABEL = "← Collections"

/** Design spec §3.3 — the collection toolbar search placeholder. */
export const COLLECTION_SEARCH_PLACEHOLDER = "⌕ Search this collection…"

/** Design spec §3.3 — the filter control label. */
export const FILTER_LABEL = "Filter"

/**
 * Design spec §3.3 — the accessible name of the sort control.
 *
 * The control's *visible* text is the selected mode ("Newest Bookmarked"), so it
 * needs a name that says what the control is rather than what it currently
 * holds; without this a screen reader announces only the value.
 */
export const SORT_LABEL = "Sort"

/** Design spec §3.4 — the filter popover/sheet title. */
export const FILTER_TITLE = "Filter your archive"

/** Design spec §3.4 — the filter popover/sheet subtitle. */
export const FILTER_SUBTITLE = "Mix posted and bookmarked dates together."

/** Design spec §3.4 — the two date-range section labels. */
export const TWEET_DATE_LABEL = "Tweet date"
export const BOOKMARKED_DATE_LABEL = "Bookmarked date"

/** Design spec §3.4 — the quick-preset section label. */
export const QUICK_RANGES_LABEL = "Quick ranges"

/** Design spec §3.4 — the filter panel actions. */
export const FILTER_RESET_LABEL = "Reset"
export const FILTER_APPLY_LABEL = "Apply"

/** Accessible names for the four manually-editable date fields (PRD-2 §30). */
export const TWEET_DATE_FROM_LABEL = "Tweet date from"
export const TWEET_DATE_TO_LABEL = "Tweet date to"
export const BOOKMARKED_DATE_FROM_LABEL = "Bookmarked date from"
export const BOOKMARKED_DATE_TO_LABEL = "Bookmarked date to"
export const DATE_RANGE_FROM_LABEL = "From"
export const DATE_RANGE_TO_LABEL = "To"

/** Neutral range-summary text when neither bound is set (design spec §3.4). */
export const ANY_DATE_LABEL = "Any date"

/** Shown (and announced) when a `from` date falls after its `to` date. */
export const INVERTED_RANGE_MESSAGE = "From must be on or before To."

/** PRD-2 §24 — the link that opens the original post on X. */
export const OPEN_ON_X_LABEL = "Open on X ↗"

/** PRD-2 §23 — the controlled-clamp affordance. */
export const SHOW_MORE_LABEL = "Show more"

/** The inverse of {@link SHOW_MORE_LABEL}, once the text is expanded. */
export const SHOW_LESS_LABEL = "Show less"

/** PRD-2 §35 — announced while the first page of a collection is in flight. */
export const LOADING_POSTS_LABEL = "Loading posts"

/** PRD-2 §35 — announced while an additional page is being appended. */
export const LOADING_MORE_POSTS_LABEL = "Loading more posts"

/** Design spec §3.5 — the lightbox panel's three meta-line prefixes. */
export const POSTED_META_LABEL = "Posted"
export const SAVED_META_LABEL = "Saved"
export const COLLECTION_META_LABEL = "Collection"

/** Design spec §3.5 — the lightbox navigation controls' accessible names. */
export const LIGHTBOX_PREVIOUS_LABEL = "Previous media"
export const LIGHTBOX_NEXT_LABEL = "Next media"

/**
 * Design spec §3.5 — the outer pair of controls, which move between **tweets**
 * rather than between the media inside one tweet. Named separately from the
 * inner pair: the two sit close together on screen, and a shared "previous"
 * would leave a screen-reader user unable to tell them apart.
 */
export const LIGHTBOX_PREVIOUS_POST_LABEL = "Previous post"
export const LIGHTBOX_NEXT_POST_LABEL = "Next post"

/** Design spec §3.5 — the info panel's `×` close control. */
export const LIGHTBOX_CLOSE_LABEL = "Close lightbox"

/**
 * Design spec §3.5 — the dialog's accessible-name prefix. Composed with the
 * active post's author and username so the dialog announces *whose* media is
 * open rather than a generic "dialog".
 */
export const LIGHTBOX_TITLE_PREFIX = "Post media by"

/** PRD-2 §27 — the keyboard hint exposed as the dialog's description. */
export const LIGHTBOX_KEYBOARD_HINT =
  "Use the left and right arrow keys to browse the media in this post, the up and down arrow keys to move between posts, and Escape to close."

/** Builds the lightbox counter's assistive-tech name (`Media 2 of 4`). */
export function formatLightboxCounter(current: number, total: number): string {
  return `Media ${current} of ${total}`
}

/**
 * Curation failures.
 *
 * Both say "nothing was changed" because that is the contract: the request either
 * completed, or the database was left exactly as it was. Without that sentence a
 * failed delete reads as "maybe it half-worked", which is the one thing a user
 * cannot check for themselves.
 */
export const DELETE_POST_FAILED_MESSAGE =
  "Could not delete this bookmark. Nothing was changed."
export const MOVE_POST_FAILED_MESSAGE =
  "Could not move this bookmark. Nothing was changed."
