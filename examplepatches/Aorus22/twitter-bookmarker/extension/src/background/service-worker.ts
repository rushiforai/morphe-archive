/**
 * Extension service worker (Manifest V3).
 *
 * The worker is the extension's single backend HTTP client (PRD §25, §53):
 * every `HEALTH_CHECK` / `GET_SAVED_INDEX` / `SAVE_TWEET` message is answered
 * here and the corresponding request is issued through `shared/api.ts`.
 *
 * The target base URL is resolved from `chrome.storage.local` on every message
 * (PRD §50): the popup can switch between the loopback default and a custom URL
 * while the worker holds no state between messages.
 *
 * Invariants:
 *  - the listener always resolves to one of the documented response shapes and
 *    never throws out of `chrome.runtime.onMessage` (XI/PRD §39);
 *  - the worker holds **no** state between messages — the per-page saved cache
 *    lives in the content script (PRD §34);
 *  - network failure is reported as `{ ok: false, error: "backend_unavailable" }`,
 *    never as a rejected message channel.
 */

import { bgErrorFrom, checkHealth, fetchSavedIndex, postBookmark } from "../shared/api.ts";
import { resolveBackendBaseUrl } from "../shared/backend-url.ts";
import { resolveBackendToken } from "../shared/backend-token.ts";
import { isExtensionMessage } from "../shared/messages.ts";
import type { ExtensionMessage, ExtensionResponse } from "../shared/messages.ts";
import { getSettings } from "../shared/storage.ts";

chrome.runtime.onInstalled.addListener(() => {
  console.info("[twitter-bookmarker] service worker installed");
});

/**
 * The configured backend for this message: where to call, and what to present.
 * `getSettings` never rejects and already applies the defaults, so a storage
 * hiccup simply falls back to the loopback address with no credential — which is
 * what that address needs anyway.
 */
async function activeTarget(): Promise<{ baseUrl: string; token: string }> {
  const settings = await getSettings();
  return { baseUrl: resolveBackendBaseUrl(settings), token: resolveBackendToken(settings) };
}

/** Resolve one validated message to a response. Never rejects. */
async function handleMessage(message: ExtensionMessage): Promise<ExtensionResponse> {
  const { baseUrl, token } = await activeTarget();

  switch (message.type) {
    case "HEALTH_CHECK":
      return { ok: true, connected: await checkHealth(baseUrl, token) };

    case "GET_SAVED_INDEX":
      try {
        return { ok: true, index: await fetchSavedIndex(baseUrl, token) };
      } catch (error) {
        return { ok: false, index: null, error: bgErrorFrom(error) };
      }

    case "SAVE_TWEET":
      try {
        const outcome = await postBookmark(message.payload, baseUrl, token);
        return outcome.kind === "saved"
          ? { ok: true, result: outcome.body }
          : { ok: true, duplicate: outcome.body };
      } catch (error) {
        return { ok: false, error: bgErrorFrom(error) };
      }

    default:
      // `isExtensionMessage` guarantees this is unreachable, but a response is
      // still required if `ExtensionMessage` ever grows a variant.
      return { ok: false, error: "internal" };
  }
}

chrome.runtime.onMessage.addListener(
  (
    message: ExtensionMessage,
    _sender: chrome.runtime.MessageSender,
    sendResponse: (response: ExtensionResponse) => void,
  ): boolean => {
    if (!isExtensionMessage(message)) return false;

    void handleMessage(message).then(
      (response) => {
        try {
          sendResponse(response);
        } catch {
          /* The page/port went away before the answer could be delivered. */
        }
      },
      () => {
        // Defensive: `handleMessage` must not reject, but the listener still
        // owes the caller a typed response instead of a broken channel.
        try {
          sendResponse({ ok: false, index: null, error: "internal" });
        } catch {
          /* The page/port went away before the answer could be delivered. */
        }
      },
    );

    // Keep the message channel open for the async response.
    return true;
  },
);
