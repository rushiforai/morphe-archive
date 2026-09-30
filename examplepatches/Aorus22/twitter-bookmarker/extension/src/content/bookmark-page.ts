/**
 * Bookmarks-page lifecycle: route-entry startup, the single `MutationObserver`
 * that discovers dynamically loaded tweets, idempotent per-tweet processing, the
 * once-per-entry saved-index cache, and teardown on route leave
 * (PRD §26–§28, §34, §54; XI-02/XI-03/XI-04).
 */

import { DEFAULT_SETTINGS, createDefaultStore } from "../shared/constants.ts";
import { sendExtensionMessage } from "../shared/messages.ts";
import type { GetSavedIndexResponse } from "../shared/messages.ts";
import { getStore } from "../shared/storage.ts";
import type { Category, Settings, Store } from "../shared/types.ts";
import {
  createResilientObserver,
  createSavedIndexRefresher,
  runBoundedCleanup,
} from "./hardening.ts";
import type { ResilientObserver, SavedIndexRefresher } from "./hardening.ts";
import { closeStalePopover } from "./organizer.ts";
import type { OrganizerCallbacks } from "./organizer.ts";
import { dismissAllToasts } from "./toast.ts";
import { EXTRACTION_ERROR, extractTweet } from "./tweet-extractor.ts";
import type { ExtractionResult } from "./tweet-extractor.ts";
import { injectOrganizer, removeAllOrganizers, rerenderAll, setSaved, setSaving } from "./ui-injector.ts";
import type { InjectOrganizerOptions, RerenderAllInput } from "./ui-injector.ts";
import {
  INJECTED_ATTRIBUTE,
  INJECTED_VALUE,
  closestAny,
  isElement,
  matchesAny,
  queryAll,
  queryFirst,
} from "./selectors.ts";

/** Debounce for the "any unmarked tweet articles?" sweep (PRD §54). */
export const SWEEP_DEBOUNCE_MS = 120;

/** Minimal observer surface, injectable for tests. */
export interface MutationObserverLike {
  observe(target: Node, options: MutationObserverInit): void;
  disconnect(): void;
}

/** Builds the single page observer. */
export type MutationObserverFactory = (callback: (records: MutationRecord[]) => void) => MutationObserverLike;

/** Injectable dependencies for {@link startBookmarksPage}. */
export interface BookmarksPageDeps {
  /** Document to observe and inject into. */
  document?: Document;
  /** Observer factory (defaults to the global `MutationObserver`). */
  createObserver?: MutationObserverFactory;
  /** Timer primitives (defaults to the global ones). */
  setTimeout?: (handler: () => void, timeout: number) => number;
  /** Timer primitive matching {@link setTimeout}. */
  clearTimeout?: (id: number) => void;
  /** Reads categories + settings (defaults to `getStore`). */
  loadStore?: () => Promise<Store>;
  /** Fetches the saved index once per page entry (defaults to the message contract). */
  loadSavedIndex?: () => Promise<ReadonlySet<string>>;
  /** Container-scoped extractor (defaults to `extractTweet`). */
  extract?: (article: HTMLElement) => ExtractionResult;
  /** Organizer injector (defaults to `injectOrganizer`). */
  inject?: (options: InjectOrganizerOptions) => HTMLElement | null;
  /** Removes every organizer + marker on teardown. */
  removeAll?: (doc: Document) => void;
  /** Re-renders every visible organizer. */
  rerenderAll?: (doc: Document, input: RerenderAllInput) => void;
  /** Saved/un-saved state transition (Phase 4 seam). */
  setSavedState?: (doc: Document, tweetId: string, saved: boolean) => void;
  /** Saving state transition (Phase 4 seam). */
  setSavingState?: (doc: Document, tweetId: string, saving: boolean) => void;
  /** Phase-3 no-op / Phase-4 real category selection handler. */
  onSelect?: OrganizerCallbacks["onSelect"];
  /** Surfaces extraction failures (defaults to `console.warn`). */
  onExtractionError?: (article: HTMLElement, reason: string) => void;
  /** Removes every visible toast on route leave (defaults to `dismissAllToasts`). */
  dismissToasts?: () => void;
  /** Debounce override, default {@link SWEEP_DEBOUNCE_MS}. */
  sweepDebounceMs?: number;
}

interface ResolvedDeps {
  document: Document;
  createObserver: MutationObserverFactory;
  setTimeout: (handler: () => void, timeout: number) => number;
  clearTimeout: (id: number) => void;
  loadStore: () => Promise<Store>;
  loadSavedIndex: () => Promise<ReadonlySet<string>>;
  extract: (article: HTMLElement) => ExtractionResult;
  inject: (options: InjectOrganizerOptions) => HTMLElement | null;
  removeAll: (doc: Document) => void;
  rerenderAll: (doc: Document, input: RerenderAllInput) => void;
  setSavedState: (doc: Document, tweetId: string, saved: boolean) => void;
  setSavingState: (doc: Document, tweetId: string, saving: boolean) => void;
  onSelect: OrganizerCallbacks["onSelect"];
  onExtractionError: (article: HTMLElement, reason: string) => void;
  dismissToasts: () => void;
  sweepDebounceMs: number;
}

interface PageState {
  /** Identity token, so a stop/restart during an `await` cannot cross wires. */
  token: object;
  deps: ResolvedDeps;
  observer: ResilientObserver | null;
  timer: number | null;
  categories: Category[];
  settings: Settings;
  savedIds: Set<string>;
  /** Coalescing saved-index fetch (PRD §54). */
  refresher: SavedIndexRefresher;
}

let state: PageState | null = null;

/** Extraction failures are surfaced once per article node, then retried silently. */
const reportedExtractionErrors = new WeakSet<Element>();

/* -------------------------------------------------------------------------- */
/* Defaults                                                                   */
/* -------------------------------------------------------------------------- */

function defaultOnSelect(_category: Category, context: { tweetId: string }): void {
  // Phase 3 only logs; Phase 4 replaces this with the real save flow.
  console.info(`[twitter-bookmarker] category selected for tweet ${context.tweetId}`);
}

function defaultOnExtractionError(_article: HTMLElement, reason: string): void {
  console.warn(`[twitter-bookmarker] ${EXTRACTION_ERROR} (${reason})`);
}

/**
 * Fetch the saved index exactly once per Bookmarks entry. Any failure — a stub
 * service worker, `ok:false`, a thrown messaging error — degrades to an empty
 * Set with a warning; injection is never blocked (PRD §34, §54).
 */
export async function loadSavedIndexFromServiceWorker(): Promise<ReadonlySet<string>> {
  try {
    const response = await sendExtensionMessage<GetSavedIndexResponse>({ type: "GET_SAVED_INDEX" });
    if (!response.ok || response.index === null) {
      console.warn(
        `[twitter-bookmarker] saved index unavailable (${response.error ?? "unknown"}); treating every tweet as unsaved`,
      );
      return new Set<string>();
    }
    return new Set<string>(Object.keys(response.index.items));
  } catch (error) {
    console.warn("[twitter-bookmarker] saved index request failed; treating every tweet as unsaved", error);
    return new Set<string>();
  }
}

/**
 * Strict variant used by the page lifecycle: a failed fetch **throws** so the
 * saved-index refresher stays stale and can retry once the backend is back
 * (PRD §64 "backend stopped", TEST-05). {@link loadSavedIndexFromServiceWorker}
 * remains the lenient, never-throwing variant for callers that cannot handle a
 * rejection.
 */
export async function fetchSavedIndex(): Promise<ReadonlySet<string>> {
  const response = await sendExtensionMessage<GetSavedIndexResponse>({ type: "GET_SAVED_INDEX" });
  if (!response.ok || response.index === null) {
    throw new Error(response.error ?? "saved_index_unavailable");
  }
  return new Set<string>(Object.keys(response.index.items));
}

function resolveDeps(user: BookmarksPageDeps): ResolvedDeps {
  return {
    document: user.document ?? document,
    createObserver: user.createObserver ?? ((callback) => new MutationObserver(callback)),
    setTimeout: user.setTimeout ?? ((handler, timeout) => globalThis.setTimeout(handler, timeout)),
    clearTimeout: user.clearTimeout ?? ((id) => globalThis.clearTimeout(id)),
    loadStore: user.loadStore ?? getStore,
    loadSavedIndex: user.loadSavedIndex ?? fetchSavedIndex,
    extract: user.extract ?? ((article) => extractTweet(article)),
    inject: user.inject ?? injectOrganizer,
    removeAll: user.removeAll ?? removeAllOrganizers,
    rerenderAll: user.rerenderAll ?? rerenderAll,
    setSavedState: user.setSavedState ?? ((doc, tweetId, saved) => setSaved(tweetId, saved, doc)),
    setSavingState: user.setSavingState ?? ((doc, tweetId, saving) => setSaving(tweetId, saving, doc)),
    onSelect: user.onSelect ?? defaultOnSelect,
    onExtractionError: user.onExtractionError ?? defaultOnExtractionError,
    dismissToasts: user.dismissToasts ?? dismissAllToasts,
    sweepDebounceMs: user.sweepDebounceMs ?? SWEEP_DEBOUNCE_MS,
  };
}

/* -------------------------------------------------------------------------- */
/* Internals                                                                  */
/* -------------------------------------------------------------------------- */

function callbacksFor(current: PageState): OrganizerCallbacks {
  return {
    isSaved: (tweetId) => current.savedIds.has(tweetId),
    onSelect: current.deps.onSelect,
    onExtractionError: current.deps.onExtractionError,
  };
}

function reportExtractionError(article: HTMLElement, reason: string, current: PageState): void {
  if (reportedExtractionErrors.has(article)) return;
  reportedExtractionErrors.add(article);
  try {
    current.deps.onExtractionError(article, reason);
  } catch (error) {
    console.warn("[twitter-bookmarker] extraction error handler failed", error);
  }
}

/**
 * Process one tweet container at most once: the marker is written *before*
 * injection so a throw can never produce a second root (XI-04). A failed
 * extraction/injection removes the marker so a later sweep can retry once X's
 * DOM is complete; the error itself is reported only once per node.
 */
function processArticle(article: HTMLElement, current: PageState): void {
  if (article.getAttribute(INJECTED_ATTRIBUTE) === INJECTED_VALUE) return;
  article.setAttribute(INJECTED_ATTRIBUTE, INJECTED_VALUE);

  try {
    const result = current.deps.extract(article);
    if (!result.ok) {
      article.removeAttribute(INJECTED_ATTRIBUTE);
      reportExtractionError(article, result.reason, current);
      return;
    }

    const root = current.deps.inject({
      article,
      tweetId: result.tweet.tweetId,
      categories: current.categories,
      displayMode: current.settings.displayMode,
      saved: current.savedIds.has(result.tweet.tweetId),
      callbacks: callbacksFor(current),
    });
    if (!root) article.removeAttribute(INJECTED_ATTRIBUTE);
  } catch (error) {
    article.removeAttribute(INJECTED_ATTRIBUTE);
    console.warn("[twitter-bookmarker] failed to inject organizer for a tweet", error);
  }
}

/** One debounced pass over every unmarked tweet article in the document. */
function sweep(): void {
  const current = state;
  if (!current) return;
  closeStalePopover();
  for (const article of queryAll<HTMLElement>(current.deps.document, "tweetArticle")) {
    // Self-heal: a marked article with no root means X wiped our DOM without
    // replacing the container. Clearing the marker lets us inject once again.
    if (
      article.getAttribute(INJECTED_ATTRIBUTE) === INJECTED_VALUE &&
      queryFirst(article, "organizerRoot") === null
    ) {
      article.removeAttribute(INJECTED_ATTRIBUTE);
    }
    processArticle(article, current);
  }
}

function scheduleSweep(current: PageState): void {
  if (current.timer !== null) return;
  current.timer = current.deps.setTimeout(() => {
    if (state !== current) return;
    current.timer = null;
    try {
      sweep();
    } catch (error) {
      console.warn("[twitter-bookmarker] debounced sweep failed", error);
    }
  }, current.deps.sweepDebounceMs);
}

/**
 * The one and only observer callback. Mutations originating inside our own
 * roots are ignored. The body is deliberately **not** wrapped in its own
 * try/catch: it runs behind the resilient observer from `hardening.ts`, which
 * contains any unexpected throw, re-arms observation, and reschedules a sweep
 * so a bad mutation set cannot kill observation (XI-03, TEST-05).
 */
function handleMutations(records: MutationRecord[]): void {
  const current = state;
  if (!current) return;

  let needsSweep = false;
  for (const record of records) {
    if (isElement(record.target) && closestAny(record.target, "organizerRoot")) continue;

    // A removed tweet may have owned the open popover.
    if (record.removedNodes !== undefined && record.removedNodes.length > 0) closeStalePopover();

    for (const node of Array.from(record.addedNodes ?? [])) {
      if (!isElement(node)) continue;
      if (closestAny(node, "organizerRoot")) continue;
      needsSweep = true;

      if (matchesAny(node, "tweetArticle")) {
        processArticle(node as HTMLElement, current);
      } else {
        for (const article of queryAll<HTMLElement>(node, "tweetArticle")) processArticle(article, current);
      }
    }
  }

  if (needsSweep) scheduleSweep(current);
}

/* -------------------------------------------------------------------------- */
/* Public lifecycle                                                           */
/* -------------------------------------------------------------------------- */

/**
 * Enter the Bookmarks page: load config, fetch the saved index once, inject for
 * everything already rendered, then attach the single observer. Idempotent —
 * a second call while running is a no-op.
 */
export async function startBookmarksPage(userDeps: BookmarksPageDeps = {}): Promise<void> {
  if (state !== null) return;

  const deps = resolveDeps(userDeps);
  const token = {};
  // One coalescing index fetch per page entry. `apply` is guarded by the token
  // so a fetch that resolves after a route change cannot touch dead state.
  const refresher = createSavedIndexRefresher({
    load: deps.loadSavedIndex,
    apply: (savedIds) => {
      const current = state;
      if (!current || current.token !== token) return;
      current.savedIds = new Set<string>(savedIds);
      current.deps.rerenderAll(current.deps.document, {
        categories: current.categories,
        settings: current.settings,
        savedIds: current.savedIds,
        callbacks: callbacksFor(current),
      });
    },
    onError: (error) => {
      console.warn("[twitter-bookmarker] saved index unavailable; treating every tweet as unsaved", error);
    },
  });
  state = {
    token,
    deps,
    observer: null,
    timer: null,
    categories: [],
    settings: { ...DEFAULT_SETTINGS },
    savedIds: new Set<string>(),
    refresher,
  };

  const running = (): boolean => state !== null && state.token === token;

  try {
    let store: Store = createDefaultStore();
    try {
      store = await deps.loadStore();
    } catch (error) {
      console.warn("[twitter-bookmarker] could not read the stored config; using defaults", error);
    }
    if (!running()) return;
    state.categories = [...store.categories];
    state.settings = { ...store.settings };

    // A failed fetch stays stale, so a later retry can re-fetch exactly once
    // without any per-tweet GET (PRD §54, TEST-05).
    await refresher.refreshIfStale();
    if (!running()) return;

    const target = deps.document.body ?? deps.document.documentElement;
    if (!target) return;

    // Attach the single observer *before* the initial sweep so tweets added
    // while we scan cannot slip through the gap between scan and observe. The
    // resilient wrapper keeps observation alive if a mutation callback throws.
    const observer = createResilientObserver({
      createObserver: deps.createObserver,
      handler: handleMutations,
      onError: (error) => console.warn("[twitter-bookmarker] observer callback failed", error),
      onReschedule: () => {
        const current = state;
        if (current !== null && current.token === token) scheduleSweep(current);
      },
    });
    observer.observe(target, { childList: true, subtree: true });
    if (!running()) {
      observer.disconnect();
      return;
    }
    state.observer = observer;

    sweep();
  } catch (error) {
    console.warn("[twitter-bookmarker] failed to start bookmarks page", error);
    if (running()) stopBookmarksPage();
  }
}

/**
 * Explicit "backend became available" retry (PRD §54, TEST-05): re-fetch the
 * saved index once when the entry fetch failed, then re-render every visible
 * organizer in place. A no-op while off-route, fresh, or already fetching, so
 * it never degrades into a `GET /v1/index` per tweet.
 */
export function refreshSavedIndexIfStale(): Promise<boolean> {
  const current = state;
  if (!current) return Promise.resolve(false);
  return current.refresher.refreshIfStale();
}

/**
 * Leave the Bookmarks page: one bounded teardown pass that disconnects the
 * observer, cancels pending work, removes every injected control + marker, and
 * dismisses any toasts. Every step is attempted even if an earlier one throws,
 * so returning to the page always injects fresh (XI-02, TEST-05).
 */
export function stopBookmarksPage(): void {
  const current = state;
  if (!current) return;
  // Null the state first so a timer already queued sees a dead token and no-ops.
  state = null;

  const result = runBoundedCleanup(
    [
      { name: "disconnect-observer", run: () => current.observer?.disconnect() },
      {
        name: "clear-sweep-timer",
        run: () => {
          if (current.timer === null) return;
          const timer = current.timer;
          current.timer = null;
          current.deps.clearTimeout(timer);
        },
      },
      { name: "remove-organizers", run: () => current.deps.removeAll(current.deps.document) },
      { name: "dismiss-toasts", run: () => current.deps.dismissToasts() },
      { name: "clear-saved-index", run: () => current.savedIds.clear() },
    ],
    (error) => console.warn("[twitter-bookmarker] route-leave cleanup step failed", error),
  );

  if (result.failures.length > 0) {
    console.warn(
      "[twitter-bookmarker] route-leave cleanup finished with failures",
      result.failures.map((failure) => failure.name),
    );
  }
}

/**
 * Apply a store change (PRD §51): adopt the new categories/settings, re-render
 * every visible organizer in place, then sweep for tweets that had no organizer
 * yet (for example because there were no categories at the time).
 */
export function refreshBookmarksPage(store: Store): void {
  const current = state;
  if (!current) return;

  current.categories = [...store.categories];
  current.settings = { ...store.settings };

  try {
    current.deps.rerenderAll(current.deps.document, {
      categories: current.categories,
      settings: current.settings,
      savedIds: current.savedIds,
      callbacks: callbacksFor(current),
    });

    for (const article of queryAll<HTMLElement>(current.deps.document, "tweetArticle")) {
      if (queryFirst(article, "organizerRoot")) continue;
      article.removeAttribute(INJECTED_ATTRIBUTE);
    }
    sweep();
  } catch (error) {
    console.warn("[twitter-bookmarker] failed to refresh organizers", error);
  }
}

/* -------------------------------------------------------------------------- */
/* Phase-4 seams                                                              */
/* -------------------------------------------------------------------------- */

/** Snapshot of the saved-tweet ids for the current Bookmarks entry. */
export function getSavedTweetIds(): ReadonlySet<string> {
  return state?.savedIds ?? new Set<string>();
}

/** O(1) saved lookup for the current Bookmarks entry (XI-03). */
export function isTweetSaved(tweetId: string): boolean {
  return state?.savedIds.has(tweetId) ?? false;
}

/** Move a tweet into the saved state and render `✓ Saved` (PRD §34, §41). */
export function markTweetSaved(tweetId: string): void {
  const current = state;
  if (!current) return;
  current.savedIds.add(tweetId);
  current.deps.setSavedState(current.deps.document, tweetId, true);
}

/** Return a tweet to the category controls (used when a save fails). */
export function markTweetUnsaved(tweetId: string): void {
  const current = state;
  if (!current) return;
  current.savedIds.delete(tweetId);
  current.deps.setSavedState(current.deps.document, tweetId, false);
}

/** Disable/enable a tweet's controls while a save is in flight (PRD §35). */
export function setTweetSaving(tweetId: string, saving: boolean): void {
  const current = state;
  if (!current) return;
  current.deps.setSavingState(current.deps.document, tweetId, saving);
}
