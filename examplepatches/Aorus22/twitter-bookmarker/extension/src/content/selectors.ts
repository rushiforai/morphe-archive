/**
 * Every X DOM selector and every attribute this extension writes into the page
 * lives here (PRD §28: "DOM selector logic harus dikapsulasi dalam module
 * terpisah karena struktur DOM X dapat berubah").
 *
 * Rules enforced by this module:
 *  - no other content-script module may hardcode an X selector or attribute;
 *  - each X anchor has an ordered fallback list, so a single X DOM change is a
 *    one-file fix;
 *  - metadata lookups are always rooted at a tweet container, never at
 *    `document` (PRD §28).
 */

/* -------------------------------------------------------------------------- */
/* X DOM anchors (primary selector + ordered fallbacks)                        */
/* -------------------------------------------------------------------------- */

/** An X tweet container. */
export interface SelectorSpec {
  /** Selector tried first. */
  readonly primary: string;
  /** Selectors tried in order when {@link primary} matches nothing. */
  readonly fallbacks: readonly string[];
}

/**
 * All X DOM coupling. Keys are stable, domain-meaningful names; values are the
 * selector cascade used by {@link queryFirst} / {@link queryAll}.
 */
export const X_SELECTORS = {
  /** The tweet container (article). */
  tweetArticle: { primary: 'article[data-testid="tweet"]', fallbacks: ['article[role="article"]'] },
  /** The tweet's main text block. */
  tweetText: { primary: '[data-testid="tweetText"]', fallbacks: [] },
  /** The author header (display name + @handle + relative time). */
  userName: { primary: '[data-testid="User-Name"]', fallbacks: [] },
  /** Absolute timestamp element inside the tweet header. */
  time: { primary: "time[datetime]", fallbacks: [] },
  /** The status permalink (its subtree contains the tweet's `time`). */
  statusLink: { primary: 'a[href*="/status/"]', fallbacks: [] },
  /** The tweet action bar (native Reply/Retweet/Like/Bookmark row). */
  actionBar: { primary: 'div[role="group"]', fallbacks: [] },
  /** Native "bookmark" control (tweet not yet bookmarked). */
  bookmarkButton: { primary: '[data-testid="bookmark"]', fallbacks: [] },
  /** Native "removeBookmark" control (tweet already bookmarked). */
  unbookmarkButton: { primary: '[data-testid="removeBookmark"]', fallbacks: [] },
  /**
   * A card wrapper around an embedded quoted tweet. Any `tweetText` inside one of
   * these belongs to the quoted tweet and must be excluded (PRD §29).
   */
  quotedCard: { primary: '[data-testid="card.wrapper"]', fallbacks: [] },
  /**
   * A `role="link"` wrapper. Only treated as a quoted wrapper when it also owns
   * its own author/timestamp, so a generic link wrapper cannot hide main text.
   */
  quotedLink: { primary: 'div[role="link"]', fallbacks: [] },
  /** A profile link; its first path segment is the @handle. */
  profileLink: { primary: 'a[href^="/"]', fallbacks: [] },
  /**
   * One photo of the main tweet (PRD §14). The primary form is X's own
   * `tweetPhoto` test id; the fallbacks match any pbs media image, which keeps
   * the extraction working if X renames the container.
   */
  tweetPhoto: {
    primary: '[data-testid="tweetPhoto"] img',
    fallbacks: ['img[src*="pbs.twimg.com/media/"]', 'img[src*="amplify_video_thumb"]', 'img[src*="tweet_video_thumb"]'],
  },
  /**
   * The video/GIF player of the main tweet. Its `poster` frame is the media URL
   * that gets stored (see PRD §14: mp4 blob URLs are deliberately not used).
   */
  videoPlayer: {
    primary: '[data-testid="videoPlayer"] video',
    fallbacks: ['video[poster]', '[data-testid="videoComponent"] img'],
  },
  /** The extension's own per-tweet root (used only to find/replace our nodes). */
  organizerRoot: { primary: "[data-twitter-bookmarker-root]", fallbacks: [] },
  /** The popover trigger inside an organizer root. */
  organizerTrigger: { primary: "[data-twitter-bookmarker-trigger]", fallbacks: [] },
  /** The popover panel inside an organizer root. */
  organizerPanel: { primary: "[data-twitter-bookmarker-panel]", fallbacks: [] },
  /** One category control inside an organizer root. */
  categoryButton: { primary: "[data-category-id]", fallbacks: [] },
} as const satisfies Record<string, SelectorSpec>;

/** Every key of {@link X_SELECTORS}. */
export type SelectorKey = keyof typeof X_SELECTORS;

/** Selector cascade for one {@link SelectorKey}, primary first. */
export function selectorsFor(key: SelectorKey): readonly string[] {
  const spec: SelectorSpec = X_SELECTORS[key];
  return [spec.primary, ...spec.fallbacks];
}

/* -------------------------------------------------------------------------- */
/* Attributes written into the page (the extension's own DOM contract)         */
/* -------------------------------------------------------------------------- */

/** Marker proving a tweet container was already processed (PRD §27, XI-04). */
export const INJECTED_ATTRIBUTE = "data-twitter-bookmarker-injected";
/** Value stored in {@link INJECTED_ATTRIBUTE}. */
export const INJECTED_VALUE = "true";
/** Marks the extension's root element inside a tweet. */
export const ROOT_ATTRIBUTE = "data-twitter-bookmarker-root";
/** Selector for {@link ROOT_ATTRIBUTE} (own-node lookup only). */
export const ROOT_SELECTOR = `[${ROOT_ATTRIBUTE}]`;
/** Stores the tweet id on the root so rerenders/saved-state stay O(1). */
export const ROOT_TWEET_ID_ATTRIBUTE = "data-twitter-bookmarker-tweet-id";
/** Marks the popover trigger button. */
export const TRIGGER_ATTRIBUTE = "data-twitter-bookmarker-trigger";
/** Marks the popover panel. */
export const PANEL_ATTRIBUTE = "data-twitter-bookmarker-panel";
/** Marks the "✓ Saved" element. */
export const SAVED_ATTRIBUTE = "data-twitter-bookmarker-saved";
/** Organizer state machine marker (`ready` | `saving` | `saved`). */
export const STATE_ATTRIBUTE = "data-twitter-bookmarker-state";
/** Marks a category colour indicator and carries its hex value. */
export const COLOR_ATTRIBUTE = "data-twitter-bookmarker-color";
/** Carries a category's id on its control (PRD §32/§33 plumbing). */
export const CATEGORY_ID_ATTRIBUTE = "data-category-id";
/** Timestamp of the last click on a category control (double-click guard). */
export const CLICK_TS_ATTRIBUTE = "data-twitter-bookmarker-click-ts";
/** Marks a root whose popover is currently open. */
export const POPOVER_OPEN_ATTRIBUTE = "data-twitter-bookmarker-popover-open";

/* -------------------------------------------------------------------------- */
/* Query helpers                                                              */
/* -------------------------------------------------------------------------- */

function isElementNode(value: unknown): value is Element {
  return typeof value === "object" && value !== null && (value as { nodeType?: unknown }).nodeType === 1;
}

function toArray<T extends Element>(collection: ArrayLike<T>): T[] {
  const out: T[] = [];
  for (let index = 0; index < collection.length; index += 1) out.push(collection[index]);
  return out;
}

/** True when `element` matches any selector in `key`'s cascade. */
export function matchesAny(element: Element, key: SelectorKey): boolean {
  return selectorsFor(key).some((selector) => element.matches(selector));
}

/** First match for `key`'s cascade under `root`, or `null`. */
export function queryFirst<T extends Element = Element>(root: ParentNode, key: SelectorKey): T | null {
  for (const selector of selectorsFor(key)) {
    const found = root.querySelector(selector);
    if (found) return found as T;
  }
  return null;
}

/** All matches for `key`'s cascade under `root`, deduplicated, in DOM order. */
export function queryAll<T extends Element = Element>(root: ParentNode, key: SelectorKey): T[] {
  const seen = new Set<Element>();
  const out: T[] = [];
  for (const selector of selectorsFor(key)) {
    for (const element of toArray(root.querySelectorAll(selector))) {
      if (seen.has(element)) continue;
      seen.add(element);
      out.push(element as T);
    }
  }
  return out;
}

/** Nearest ancestor-or-self matching `key`'s cascade, or `null`. */
export function closestAny(node: Element | null, key: SelectorKey): Element | null {
  let current: Element | null = node;
  while (current) {
    if (matchesAny(current, key)) return current;
    current = current.parentElement;
  }
  return null;
}

/** The tweet container enclosing `node`, or `null` when there is none. */
export function closestArticle(node: Element | null): HTMLElement | null {
  if (node !== null && matchesAny(node, "tweetArticle")) return node as HTMLElement;
  return closestAny(node, "tweetArticle") as HTMLElement | null;
}

/** Duck-typed element guard shared with the observer (fake-DOM friendly). */
export function isElement(value: unknown): value is Element {
  return isElementNode(value);
}
