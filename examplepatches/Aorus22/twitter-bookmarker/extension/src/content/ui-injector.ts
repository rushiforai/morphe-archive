/**
 * Placement and lifecycle of the per-tweet organizer root (PRD §31, §51).
 *
 * Responsibilities:
 *  - find the tweet's action area and insert exactly one root on its own row
 *    directly above it (never the page header — XI-08);
 *  - keep injection idempotent: an article that already owns a root is updated
 *    in place, never duplicated (XI-04);
 *  - re-render every visible root when categories/settings/the saved set change
 *    (PRD §51);
 *  - expose the Phase-4 `setSaving`/`setSaved` state transitions.
 */

import type { Category, DisplayMode, Settings } from "../shared/types.ts";
import {
  INJECTED_ATTRIBUTE,
  INJECTED_VALUE,
  ROOT_ATTRIBUTE,
  ROOT_TWEET_ID_ATTRIBUTE,
  closestArticle,
  queryAll,
  queryFirst,
} from "./selectors.ts";
import {
  closeOpenPopover,
  isPopoverOpen,
  renderOrganizer,
  resetOrganizerState,
  updateOrganizerSaved,
  updateOrganizerSaving,
} from "./organizer.ts";
import type { OrganizerCallbacks } from "./organizer.ts";

/** Input for {@link injectOrganizer}. */
export interface InjectOrganizerOptions {
  /** The tweet container (from {@link closestArticle}). */
  article: HTMLElement;
  /** X status id of the tweet. */
  tweetId: string;
  /** All categories, in storage order. */
  categories: readonly Category[];
  /** Popover or inline rendering. */
  displayMode: DisplayMode;
  /** When true, render `✓ Saved` and no category controls. */
  saved: boolean;
  /** Phase-4 callback seam. */
  callbacks: OrganizerCallbacks;
}

/** Input for {@link rerenderAll}. */
export interface RerenderAllInput {
  /** All categories, in storage order. */
  categories: readonly Category[];
  /** Current settings (drives the display mode). */
  settings: Settings;
  /** Cached saved-tweet ids (O(1) lookups). */
  savedIds: ReadonlySet<string>;
  /** Phase-4 callback seam. */
  callbacks: OrganizerCallbacks;
}

function defaultDocument(): Document {
  return document;
}

/**
 * The tweet's action area: the element matched by the `actionBar` selector that
 * also contains X's native bookmark control, falling back to the last such
 * element in the article. Returns `null` when there is no action area, so
 * nothing is ever placed in the header.
 */
function findActionBar(article: Element): Element | null {
  const groups = queryAll(article, "actionBar");
  for (const group of groups) {
    if (queryFirst(group, "bookmarkButton") || queryFirst(group, "unbookmarkButton")) return group;
  }
  return groups.length > 0 ? (groups[groups.length - 1] ?? null) : null;
}

/** Give the popover a positioned ancestor without disturbing X's own layout. */
function makePositioningSafe(article: HTMLElement): void {
  const view = article.ownerDocument?.defaultView;
  if (!view || typeof view.getComputedStyle !== "function") return;
  if (view.getComputedStyle(article).position === "static") article.style.position = "relative";
}

/**
 * The element the organizer root is inserted *before*, so the controls occupy
 * their own row instead of sharing X's action bar with the native
 * reply/repost/like/bookmark buttons.
 *
 * X wraps the native `div[role="group"]` in one or more layout wrappers. We climb
 * from that group while the parent is a pure wrapper: it must not contain tweet
 * body content (`User-Name` / `tweetText`) and must not be the article's own
 * direct child (the avatar + content flex row). The highest wrapper that passes
 * is the action-bar row, so inserting before it lands the root directly above the
 * tools, inside the tweet's content column. When the group is already a direct
 * child of the content column, the group itself is returned and the root still
 * gets its own row above it.
 */
function findRowAnchor(article: Element, actionBar: Element): Element {
  let anchor: Element = actionBar;
  for (let depth = 0; depth < 4; depth += 1) {
    const parent = anchor.parentElement;
    if (!parent || parent === article) break;
    // Never climb into a container that holds tweet body content.
    if (queryFirst(parent, "userName") || queryFirst(parent, "tweetText")) break;
    // Never climb to the article's direct child (the avatar + content row).
    if (parent.parentElement === article) break;
    anchor = parent;
  }
  return anchor;
}

function renderOptionsFor(
  options: InjectOrganizerOptions,
): Parameters<typeof renderOrganizer>[1] {
  return {
    tweetId: options.tweetId,
    categories: options.categories,
    displayMode: options.displayMode,
    saved: options.saved,
    callbacks: options.callbacks,
  };
}

/**
 * Inject (or update) the single organizer root for `article`.
 *
 * Returns the root, or `null` when there is nothing to render (no categories and
 * not saved) or no action area exists.
 */
export function injectOrganizer(options: InjectOrganizerOptions): HTMLElement | null {
  const { article } = options;

  const existing = queryFirst<HTMLElement>(article, "organizerRoot");
  if (existing) {
    renderOrganizer(existing, renderOptionsFor(options));
    return existing;
  }

  // A saved tweet is worth marking even with zero categories; an unsaved tweet
  // with zero categories has nothing to offer.
  if (!options.saved && options.categories.length === 0) return null;

  const actionBar = findActionBar(article);
  if (!actionBar) return null;

  const doc = article.ownerDocument;
  if (!doc) return null;

  const root = doc.createElement("div");
  root.setAttribute(ROOT_ATTRIBUTE, INJECTED_VALUE);
  root.setAttribute(ROOT_TWEET_ID_ATTRIBUTE, options.tweetId);
  root.className = "twb-root";
  // Its own full-width row above the native action bar.
  root.style.display = "flex";
  root.style.flexWrap = "wrap";
  root.style.alignItems = "center";
  root.style.gap = "2px";
  root.style.width = "100%";
  root.style.boxSizing = "border-box";
  root.style.margin = "4px 0 2px";
  root.style.position = "relative";

  renderOrganizer(root, renderOptionsFor(options));
  makePositioningSafe(article);

  const anchor = findRowAnchor(article, actionBar);
  const parent = anchor.parentElement;
  if (parent) parent.insertBefore(root, anchor);
  else actionBar.appendChild(root);
  return root;
}

/** Remove the organizer root (and any open popover) from one article. */
export function removeOrganizer(article: HTMLElement): void {
  const root = queryFirst<HTMLElement>(article, "organizerRoot");
  if (!root) return;
  if (isPopoverOpen(root)) closeOpenPopover();
  root.remove();
}

/**
 * Remove every injected root and every injection marker. Called when the route
 * leaves the bookmarks timeline so returning can inject fresh (XI-02).
 */
export function removeAllOrganizers(doc: Document = defaultDocument()): void {
  for (const root of queryAll<HTMLElement>(doc, "organizerRoot")) root.remove();
  for (const article of queryAll<HTMLElement>(doc, "tweetArticle")) {
    article.removeAttribute(INJECTED_ATTRIBUTE);
  }
  resetOrganizerState();
}

/**
 * Re-render every visible organizer in place from the new categories/settings/
 * saved set. Never creates a second root (PRD §51).
 */
export function rerenderAll(doc: Document, input: RerenderAllInput): void {
  for (const root of queryAll<HTMLElement>(doc, "organizerRoot")) {
    const tweetId = root.getAttribute(ROOT_TWEET_ID_ATTRIBUTE) ?? "";
    const article = closestArticle(root);
    if (!article) {
      if (isPopoverOpen(root)) closeOpenPopover();
      root.remove();
      continue;
    }

    const saved = input.savedIds.has(tweetId) || input.callbacks.isSaved(tweetId);
    if (!saved && input.categories.length === 0) {
      if (isPopoverOpen(root)) closeOpenPopover();
      root.remove();
      article.removeAttribute(INJECTED_ATTRIBUTE);
      continue;
    }

    renderOrganizer(root, {
      tweetId,
      categories: input.categories,
      displayMode: input.settings.displayMode,
      saved,
      callbacks: input.callbacks,
    });
  }
}

function rootsFor(doc: Document, tweetId: string): HTMLElement[] {
  return queryAll<HTMLElement>(doc, "organizerRoot").filter(
    (root) => root.getAttribute(ROOT_TWEET_ID_ATTRIBUTE) === tweetId,
  );
}

/** Disable/enable every control on a tweet while a save is in flight (PRD §35). */
export function setSaving(tweetId: string, saving: boolean, doc: Document = defaultDocument()): void {
  for (const root of rootsFor(doc, tweetId)) updateOrganizerSaving(root, saving);
}

/** Switch a tweet between the category controls and `✓ Saved` (PRD §34, §41). */
export function setSaved(tweetId: string, saved: boolean, doc: Document = defaultDocument()): void {
  for (const root of rootsFor(doc, tweetId)) updateOrganizerSaved(root, saved);
}
