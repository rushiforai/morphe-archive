/**
 * Verified native X unbookmark (PRD §37, §38; UNB-01, UNB-02).
 *
 * Phase 5's one-way destructive action. The contract is deliberately narrow:
 *
 * ```
 * locate native bookmark control (action bar first, then the article)
 *   ↓
 * record the pre-click state (only an already-bookmarked tweet is clickable)
 *   ↓
 * dispatch the native click
 *   ↓
 * verify the state actually changed (scoped MutationObserver + ~2s timeout)
 * ```
 *
 * A click alone is never treated as success (UNB-02): the tweet counts as
 * removed only when the control flips to the unbookmarked representation
 * (`[data-testid="bookmark"]` replacing `removeBookmark`) or the whole article
 * detaches from the document (X removed the row from the timeline).
 *
 * The module never throws into X's page and never rolls anything back: it
 * resolves `"removed"` or `"failed"` and leaves all persistence decisions to the
 * caller.
 */

import { matchesAny, queryFirst } from "./selectors.ts";

/** Outcome of one verified unbookmark attempt. */
export type UnbookmarkResult = "removed" | "failed";

/** How long the state change is awaited before declaring failure (PRD §38). */
export const UNBOOKMARK_VERIFY_TIMEOUT_MS = 2000;

/** Minimal structural `MutationObserver` surface, so the fake DOM can stand in. */
export interface MutationObserverLike {
  /** Start watching `target` for `options`. */
  observe(target: Node, options: MutationObserverInit): void;
  /** Stop watching every target. */
  disconnect(): void;
}

/** Factory for {@link MutationObserverLike}; `null` when the platform lacks one. */
export type MutationObserverFactory = (callback: () => void) => MutationObserverLike | null;

/** Injectable primitives (tests pass a fake observer and a tiny timer). */
export interface UnbookmarkDeps {
  /** Verification budget in milliseconds; defaults to {@link UNBOOKMARK_VERIFY_TIMEOUT_MS}. */
  timeoutMs?: number;
  /** Timer primitive; defaults to the global `setTimeout`. */
  setTimer?: (handler: () => void, timeout: number) => number;
  /** Timer primitive matching {@link UnbookmarkDeps.setTimer}. */
  clearTimer?: (id: number) => void;
  /** Observer factory; defaults to the platform `MutationObserver`. */
  createObserver?: MutationObserverFactory;
}

/** Watches mutations inside the article, including an in-place `data-testid` flip. */
const OBSERVE_ARTICLE: MutationObserverInit = {
  childList: true,
  subtree: true,
  attributes: true,
  attributeFilter: ["data-testid"],
};

/** Watches the article's parent, so an X-driven row removal is seen immediately. */
const OBSERVE_PARENT: MutationObserverInit = { childList: true };

function defaultObserverFactory(callback: () => void): MutationObserverLike | null {
  const ctor = (globalThis as { MutationObserver?: new (cb: () => void) => MutationObserverLike }).MutationObserver;
  if (typeof ctor !== "function") return null;
  return new ctor(callback);
}

function defaultSetTimer(handler: () => void, timeout: number): number {
  return globalThis.setTimeout(handler, timeout);
}

function defaultClearTimer(id: number): void {
  globalThis.clearTimeout(id);
}

/** Duck-typed connectivity check that works on the fake DOM too. */
function isConnected(node: Node): boolean {
  const flag = (node as { isConnected?: unknown }).isConnected;
  if (typeof flag === "boolean") return flag;
  const doc = node.ownerDocument;
  return doc !== null && typeof doc.contains === "function" && doc.contains(node);
}

/**
 * Find the tweet's native bookmark control. The action bar is preferred, then
 * the whole article is used as a fallback so a moved control is still found.
 */
function findBookmarkControl(article: HTMLElement): Element | null {
  const scopes: ParentNode[] = [];
  const actionBar = queryFirst(article, "actionBar");
  if (actionBar) scopes.push(actionBar);
  scopes.push(article);

  for (const scope of scopes) {
    const control = queryFirst(scope, "unbookmarkButton") ?? queryFirst(scope, "bookmarkButton");
    if (control) return control;
  }
  return null;
}

/**
 * Positive-evidence check for the unbookmarked state (UNB-02).
 *
 * Success requires either the article detaching from the document, or the
 * unbookmarked representation (`[data-testid="bookmark"]`) actually appearing
 * while no `removeBookmark` control remains. "Both controls gone" is not
 * evidence, so it stays a failure.
 */
function isUnbookmarked(article: HTMLElement): boolean {
  if (!isConnected(article)) return true;
  if (queryFirst(article, "unbookmarkButton")) return false;
  return queryFirst(article, "bookmarkButton") !== null;
}

/** Dispatch the native control's own click — the same entry point a user hit uses. */
function dispatchClick(control: Element): void {
  const clickable = (control as { click?: unknown }).click;
  if (typeof clickable === "function") {
    clickable.call(control);
    return;
  }
  control.dispatchEvent(new Event("click", { bubbles: true, cancelable: true, composed: true }));
}

/**
 * Remove one tweet from X Bookmarks through X's own control and verify it.
 *
 * Resolves `"removed"` only when the unbookmarked state is observed, and
 * `"failed"` for a missing control, an unclickable control, or a state that
 * never changes before the timeout. Never rejects and never rolls anything back.
 */
export async function unbookmarkTweet(
  article: HTMLElement,
  deps: UnbookmarkDeps = {},
): Promise<UnbookmarkResult> {
  let observer: MutationObserverLike | null = null;
  let timer: number | null = null;

  try {
    // X may already have dropped the row: the goal state already holds.
    if (!isConnected(article)) return "removed";

    const control = findBookmarkControl(article);
    if (control === null) return "failed";

    // Record the pre-click state. Only an already-bookmarked tweet may be
    // clicked: clicking a `[data-testid="bookmark"]` control would *add* a
    // bookmark, which is the opposite of this phase's job.
    if (!matchesAny(control, "unbookmarkButton")) return "removed";

    let settled = false;
    let settle: (result: UnbookmarkResult) => void = () => {};
    const outcome = new Promise<UnbookmarkResult>((resolve) => {
      settle = (result) => {
        if (settled) return;
        settled = true;
        resolve(result);
      };
    });

    const verify = (): void => {
      if (isUnbookmarked(article)) settle("removed");
    };

    try {
      observer = (deps.createObserver ?? defaultObserverFactory)(verify);
      if (observer) {
        observer.observe(article, OBSERVE_ARTICLE);
        const parent = article.parentNode;
        if (parent) observer.observe(parent, OBSERVE_PARENT);
      }
    } catch {
      // Observation is best-effort; the timeout below is the backstop.
      observer = null;
    }

    try {
      dispatchClick(control);
    } catch {
      return "failed";
    }

    // Covers an in-place flip that happened synchronously during the click.
    verify();

    const timeoutMs = deps.timeoutMs ?? UNBOOKMARK_VERIFY_TIMEOUT_MS;
    timer = (deps.setTimer ?? defaultSetTimer)(() => {
      // Final verification at the deadline: this is what makes the result a
      // state observation rather than an assumption (UNB-02).
      if (isUnbookmarked(article)) settle("removed");
      else settle("failed");
    }, timeoutMs);

    return await outcome;
  } catch {
    // The content script must never throw into X's page.
    return "failed";
  } finally {
    if (timer !== null) {
      try {
        (deps.clearTimer ?? defaultClearTimer)(timer);
      } catch {
        /* Defensive: cleanup must never mask the outcome. */
      }
    }
    if (observer) {
      try {
        observer.disconnect();
      } catch {
        /* Defensive. */
      }
    }
  }
}
