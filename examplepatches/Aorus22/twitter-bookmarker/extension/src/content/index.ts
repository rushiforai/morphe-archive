/**
 * X bookmarks content script — bootstrap (Phase 4 + Phase 5).
 *
 * Wires the SPA route watcher to the bookmarks-page lifecycle, supplies the real
 * save controller as `onSelect`, routes extraction failures to a toast, and
 * subscribes to `chrome.storage.onChanged` so visible controls re-render without
 * a reload (PRD §26, §40, §51).
 *
 * `onSaved` is the one place auto-unbookmark lives (PRD §37, §38). It is invoked
 * by the save controller only after a confirmed `201`, gated on
 * `settings.unbookmarkAfterSave`, and never rolls back a confirmed save.
 */

import { DEFAULT_SETTINGS } from "../shared/constants.ts";
import { getStore, onStoreChanged } from "../shared/storage.ts";
import type { Settings, Store } from "../shared/types.ts";
import {
  refreshBookmarksPage,
  refreshSavedIndexIfStale,
  startBookmarksPage,
  stopBookmarksPage,
} from "./bookmark-page.ts";
import { createSaveController } from "./save-controller.ts";
import type { SavedTweetContext } from "./save-controller.ts";
import { watchRoute } from "./route.ts";
import { showToast } from "./toast.ts";
import type { ToastKind } from "./toast.ts";
import { EXTRACTION_ERROR } from "./tweet-extractor.ts";
import { unbookmarkTweet } from "./unbookmark.ts";
import type { UnbookmarkResult } from "./unbookmark.ts";

/**
 * Latest known settings. Kept fresh here so the `unbookmarkAfterSave` gate is
 * never stale when the user flips the toggle.
 */
let currentSettings: Settings = { ...DEFAULT_SETTINGS };

/** Warning copy when the save succeeded but X still holds the bookmark (PRD §38). */
export function unbookmarkFailedToast(categoryName: string): string {
  return `Saved to ${categoryName}, but failed to remove from X bookmarks`;
}

/** Dependencies for {@link createSavedHook}; injected so the gate is unit-testable. */
export interface SavedHookDeps {
  /** Reads the live settings at click resolution time. */
  settings: () => Settings;
  /** The verified native unbookmark; defaults to {@link unbookmarkTweet} in wiring. */
  unbookmark: (article: HTMLElement) => Promise<UnbookmarkResult>;
  /** Toast surface for the warning copy. */
  toast: (kind: ToastKind, message: string) => void;
  /** Diagnostic sink for an unexpected verification throw. */
  onVerificationError?: (error: unknown) => void;
}

/**
 * Build the post-success hook: the only auto-unbookmark entry point (PRD §37).
 *
 * The gate is deliberately first: with `unbookmarkAfterSave === false` the
 * native bookmark control is never queried, observed, or clicked (UNB-01).
 * When enabled, a `"failed"` verification or an unexpected throw emits the
 * warning toast and leaves the saved record and `✓ Saved` untouched (UNB-03).
 * Nothing in this hook ever rolls back or re-enables controls, and it never
 * rethrows.
 */
export function createSavedHook(deps: SavedHookDeps): (context: SavedTweetContext) => Promise<void> {
  return async (context: SavedTweetContext): Promise<void> => {
    // UNB-01 gate: setting off means zero bookmark-control interaction.
    if (!deps.settings().unbookmarkAfterSave) return;

    const warning = unbookmarkFailedToast(context.category.name);
    try {
      const outcome = await deps.unbookmark(context.article);
      // UNB-03: "removed" needs nothing further. "failed" warns and changes
      // nothing else — the save already happened and is never rolled back.
      if (outcome === "failed") deps.toast("warning", warning);
    } catch (error) {
      // A verification error must never change persisted state or escape into
      // the save controller.
      deps.onVerificationError?.(error);
      deps.toast("warning", warning);
    }
  };
}

const runSavedHook = createSavedHook({
  settings: () => currentSettings,
  unbookmark: unbookmarkTweet,
  toast: showToast,
  onVerificationError: (error) => {
    console.warn("[twitter-bookmarker] unbookmark verification threw", error);
  },
});

/**
 * Post-success hook — invoked by the save controller exactly once, only after a
 * confirmed `201` (UNB-01). The save is logged, then the gated unbookmark runs;
 * the controller does not await it.
 *
 * A confirmed `201` also proves the backend is reachable, so it is the natural
 * "backend became available" retry point for a saved-index fetch that failed at
 * page entry (PRD §54, TEST-05). The refresh is stale-gated and coalesced, so
 * the normal case costs zero extra requests.
 */
function onSaved(context: SavedTweetContext): Promise<void> {
  console.info(
    `[twitter-bookmarker] saved tweet ${context.tweetId} to "${context.category.name}" at ${context.savedAt}`,
  );
  void refreshSavedIndexIfStale();
  return runSavedHook(context);
}

/**
 * Injection-time extraction failure (reported by `bookmark-page`): surface the
 * canonical PRD §40 copy as a toast. The save-flow extraction failure is toasted
 * by the controller itself.
 */
function reportExtractionError(_article: HTMLElement, reason: string): void {
  console.warn(`[twitter-bookmarker] ${EXTRACTION_ERROR} (${reason})`);
  showToast("error", EXTRACTION_ERROR);
}

function bootstrap(): void {
  try {
    const onSelect = createSaveController({
      settings: () => currentSettings,
      onSaved,
      onExtractionError: (_article, reason) => {
        console.warn(`[twitter-bookmarker] save aborted: ${EXTRACTION_ERROR} (${reason})`);
      },
    });

    watchRoute(
      () => {
        void startBookmarksPage({ onSelect, onExtractionError: reportExtractionError });
      },
      () => {
        stopBookmarksPage();
      },
    );

    // Keep the settings seam warm; `refreshBookmarksPage` owns categories.
    void getStore()
      .then((store: Store) => {
        currentSettings = { ...store.settings };
      })
      .catch(() => {
        /* Defaults are already applied. */
      });

    onStoreChanged((store: Store) => {
      currentSettings = { ...store.settings };
      refreshBookmarksPage(store);
    });
  } catch (error) {
    // The content script must never throw into X's page.
    console.warn("[twitter-bookmarker] bootstrap failed", error);
  }
}

// Importing this module under `node --test` must not start the page lifecycle;
// the extension context always has both globals.
if (typeof chrome !== "undefined" && typeof document !== "undefined") {
  bootstrap();
}
