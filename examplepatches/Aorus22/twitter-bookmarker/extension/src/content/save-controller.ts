/**
 * The content-side save state machine (PRD §35, §36, §39–§42; SAVE-03..SAVE-07).
 *
 * One category click drives exactly one request. While that request is in
 * flight the tweet's organizer controls are disabled and the tweet id is held in
 * an in-flight `Set`, so a second click cannot start a second request
 * (PRD §35, §64).
 *
 * ```
 * idle ──category click──▶ saving  (controls disabled, "Saving…", click guard)
 * saving ──201──────────▶ saved   (cache.add, ✓ Saved, success toast, onSaved hook)
 * saving ──409──────────▶ saved   (cache.add, ✓ Saved, info toast "Already saved")
 * saving ──unavailable──▶ idle    (controls restored, error toast "Backend unavailable")
 * saving ──invalid/5xx──▶ idle    (controls restored, error toast "Could not save tweet")
 * saving ──extraction ──▶ idle    (controls restored, error toast "Could not read tweet data")
 * ```
 *
 * No path in this module unbookmarks, rolls back a saved record, or sends a
 * partial record. `onSaved` is invoked only after a confirmed `201`; Phase 5 owns the
 * unbookmark click behind it.
 */

import { sendExtensionMessage } from "../shared/messages.ts";
import type { SaveTweetMessage, SaveTweetResponse } from "../shared/messages.ts";
import type { Category, ExtractedTweet, SaveRequest, Settings } from "../shared/types.ts";
import { markTweetSaved, setTweetSaving } from "./bookmark-page.ts";
import type { OrganizerCallbacks, OrganizerContext } from "./organizer.ts";
import { showToast } from "./toast.ts";
import type { ToastKind } from "./toast.ts";
import { EXTRACTION_ERROR, extractTweet } from "./tweet-extractor.ts";
import type { ExtractionResult } from "./tweet-extractor.ts";

/** Error toast when the backend cannot be reached at all (PRD §39). */
export const BACKEND_UNAVAILABLE_TOAST = "Backend unavailable";
/** Error toast for `400`/`5xx` (PRD §21, §39). */
export const COULD_NOT_SAVE_TOAST = "Could not save tweet";
/** Info toast for a global duplicate (`409`, PRD §41). */
export const ALREADY_SAVED_TOAST = "Already saved";

/** Success toast copy for a confirmed save (PRD §36). */
export function savedToast(categoryName: string): string {
  return `Saved to ${categoryName}`;
}

/** Context handed to the post-success hook Phase 5 fills in. */
export interface SavedTweetContext {
  /** The tweet container the control lives in. */
  article: HTMLElement;
  /** X status id of the saved tweet. */
  tweetId: string;
  /** The category the user selected. */
  category: Category;
  /** Backend-generated UTC persistence time from the `201` body. */
  savedAt: string;
}

/** Injectable dependencies for {@link createSaveController}. */
export interface SaveControllerOptions {
  /**
   * Current settings. Phase 4 records the seam for Phase 5's
   * `unbookmarkAfterSave` decision; Phase 4 never branches on it.
   */
  settings: Settings | (() => Settings);
  /**
   * Invoked exactly once after a confirmed `201` — never for `409`/failure.
   *
   * Phase 5 uses this to run the verified native unbookmark. The return value
   * may be a promise; the controller intentionally does **not** await it (see
   * the `201` branch), so the in-flight guard and the organizer state are never
   * held hostage by the destructive click.
   */
  onSaved: (context: SavedTweetContext) => void | Promise<void>;
  /**
   * Signalled when the save-time extraction fails (PRD §40). The controller
   * independently toasts `Could not read tweet data`, so this hook is for
   * logging/telemetry rather than user-facing copy.
   */
  onExtractionError?: (article: HTMLElement, reason: string) => void;
  /** Message sender; defaults to the typed runtime channel. */
  sendMessage?: (message: SaveTweetMessage) => Promise<SaveTweetResponse>;
  /** Container-scoped extractor; defaults to `extractTweet`. */
  extract?: (article: HTMLElement) => ExtractionResult;
  /** Toast surface; defaults to the page toast system. */
  toast?: (kind: ToastKind, message: string) => void;
  /** Saving transition; defaults to the bookmark-page seam. */
  setSaving?: (tweetId: string, saving: boolean) => void;
  /** Saved transition; defaults to the bookmark-page seam. */
  setSaved?: (tweetId: string) => void;
}

/** Fallback reason when the extractor itself throws instead of failing typed. */
const EXTRACTOR_THREW = "missing_url";

/**
 * Build the real `OrganizerCallbacks.onSelect`.
 *
 * The returned function is synchronous by contract (the organizer does not await
 * it): it takes the in-flight guard immediately and runs the async state machine
 * detached, releasing the guard in `finally`.
 */
export function createSaveController(options: SaveControllerOptions): OrganizerCallbacks["onSelect"] {
  const send = options.sendMessage ?? ((message) => sendExtensionMessage<SaveTweetResponse>(message));
  const extract = options.extract ?? extractTweet;
  const toast = options.toast ?? showToast;
  const setSaving = options.setSaving ?? setTweetSaving;
  const setSaved = options.setSaved ?? markTweetSaved;
  const inFlight = new Set<string>();

  function extractOrFail(article: HTMLElement): ExtractionResult {
    try {
      return extract(article);
    } catch {
      return { ok: false, reason: EXTRACTOR_THREW };
    }
  }

  async function save(category: Category, article: HTMLElement, tweetId: string, tweet: ExtractedTweet): Promise<void> {
    const payload: SaveRequest = {
      slug: category.slug,
      name: category.name,
      tweet: {
        url: tweet.url,
        media: tweet.media ?? [],
        author: tweet.author,
        username: tweet.username,
        tweet_date: tweet.tweetDate,
        text: tweet.text,
      },
    };

    let response: SaveTweetResponse;
    try {
      response = await send({ type: "SAVE_TWEET", payload });
    } catch {
      // A thrown `sendExtensionMessage` means the worker/channel is gone —
      // treat it exactly like an unreachable backend (SAVE-05).
      setSaving(tweetId, false);
      toast("error", BACKEND_UNAVAILABLE_TOAST);
      return;
    }

    if (response.ok && response.result) {
      // Ordering is part of the contract (PRD §4.2, §37): the tweet is already
      // persisted and rendered as `✓ Saved` *before* any unbookmark is even
      // attempted. The persisted state is never touched again below, so the
      // window between save success and an unbookmark failure can never alter it.
      setSaved(tweetId);
      toast("success", savedToast(category.name));

      // `onSaved` carries the Phase-5 verified unbookmark. It is deliberately
      // fired without an `await`: the in-flight guard must be released
      // independently of the unbookmark await (a verification can take ~2s),
      // and `✓ Saved` / the success toast above must not be delayed by it.
      // Any rejection is swallowed here — the hook itself also never throws.
      try {
        const hook = options.onSaved({
          article,
          tweetId,
          category,
          savedAt: response.result.saved_at,
        });
        if (hook && typeof (hook as PromiseLike<void>).then === "function") {
          void Promise.resolve(hook).catch((error: unknown) => {
            console.warn("[twitter-bookmarker] post-save hook rejected", error);
          });
        }
      } catch (error) {
        // A Phase-5 hook must never break the save flow.
        console.warn("[twitter-bookmarker] post-save hook failed", error);
      }
      return;
    }

    if (response.ok && response.duplicate) {
      setSaved(tweetId);
      toast("info", ALREADY_SAVED_TOAST);
      return;
    }

    // Never unbookmark and never mark saved on any failure (SAVE-05).
    setSaving(tweetId, false);
    toast(
      "error",
      response.error === "backend_unavailable" ? BACKEND_UNAVAILABLE_TOAST : COULD_NOT_SAVE_TOAST,
    );
  }

  return (category: Category, context: OrganizerContext): void => {
    const { article, tweetId } = context;
    if (inFlight.has(tweetId)) return;
    inFlight.add(tweetId);

    void (async () => {
      try {
        setSaving(tweetId, true);

        const result = extractOrFail(article);
        if (!result.ok) {
          // No partial record is ever sent (PRD §40, XI-12).
          setSaving(tweetId, false);
          try {
            options.onExtractionError?.(article, result.reason);
          } catch {
            /* Defensive: an observer hook must not break the flow. */
          }
          toast("error", EXTRACTION_ERROR);
          return;
        }

        await save(category, article, tweetId, result.tweet);
      } catch (error) {
        // The controller is async-detached; it must never surface an unhandled
        // rejection into the page.
        console.warn("[twitter-bookmarker] save flow failed unexpectedly", error);
        try {
          setSaving(tweetId, false);
        } catch {
          /* Defensive. */
        }
      } finally {
        inFlight.delete(tweetId);
      }
    })();
  };
}
