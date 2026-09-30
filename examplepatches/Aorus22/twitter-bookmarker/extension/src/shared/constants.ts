/**
 * Extension-wide constants.
 *
 * Storage policy (PRD §7): every bit of extension configuration lives in
 * `chrome.storage.local` under the single key below. `chrome.storage.sync` is
 * never used.
 */

import type { Settings, Store } from "./types.ts";

/** The single `chrome.storage.local` key that holds the whole extension store. */
export const STORAGE_KEY = "twitterBookmarker";

/**
 * Current storage schema version.
 *
 * v2 renamed `Category.filename` (which held "linux.csv") to `Category.slug`
 * (which holds "linux"). Nothing reads the version to migrate: `normalizeStore`
 * recomputes a category's derived key from its name whenever the stored value
 * does not validate, so a v1 record loads as a v2 one losslessly. The bump only
 * records that the stored shape changed.
 */
export const SCHEMA_VERSION = 2;

/**
 * Default backend base URL (PRD §5, §50).
 *
 * The loopback address of the manually started server. The popup can switch to a
 * user-entered custom URL (`Settings.backendMode === "custom"`), but this
 * constant stays the fallback for `localhost` mode and for any unparseable
 * stored value.
 */
export const DEFAULT_BACKEND_BASE_URL = "http://127.0.0.1:43121";

/** Path of the backend health endpoint. */
export const HEALTH_PATH = "/health";

/**
 * AbortController timeout for the popup's health probe (PRD §44).
 *
 * 4 s rather than the 1.5 s this started with, because the probe is now expected
 * to run against a custom target as well, and a tunnel adds real latency:
 * measured through Cloudflare to the backend on this machine, a warm `GET /health`
 * took 0.97–1.67 s, so a 1.5 s ceiling reported **Disconnected** for a backend
 * that was answering fine. A *cold* first probe (DNS + TLS + tunnel handshake)
 * measured over 4 s, which the popup's Retry covers; loopback is unaffected
 * either way, since a refused connection fails immediately.
 */
export const HEALTH_TIMEOUT_MS = 4000;

/** Default settings (PRD §50). */
export const DEFAULT_SETTINGS: Settings = {
  unbookmarkAfterSave: false,
  displayMode: "popover",
  backendMode: "localhost",
  // Pre-filled with the loopback address so switching to Custom starts from a
  // valid URL the user can just edit (typically the port).
  backendUrl: DEFAULT_BACKEND_BASE_URL,
  // Empty by default: the loopback target is never challenged, so a fresh
  // install sends no credential at all.
  backendToken: "",
};

/**
 * Colour used when a category has no (or an invalid) colour.
 *
 * The v2 Editorial accent coral (design spec §2.1), so a fresh category's dot
 * matches the gallery/popup theme.
 */
export const DEFAULT_CATEGORY_COLOR = "#bf3f2e";

/**
 * Minimal palette offered in the add-category form.
 *
 * Drawn from the v2 Editorial accents (design spec §2.1) plus the teal/neutral
 * used by the placeholder gradients, so the category dots sit inside the same
 * warm palette as the gallery.
 */
export const CATEGORY_COLOR_PALETTE = [
  "#bf3f2e",
  "#7c5cfc",
  "#5b8cff",
  "#63a988",
  "#f2b65a",
  "#ff8fa3",
  "#2f7f80",
  "#746b72",
] as const;

/** A fresh empty store. Always return a new object so callers cannot mutate a shared default. */
export function createDefaultStore(): Store {
  return {
    version: SCHEMA_VERSION,
    settings: { ...DEFAULT_SETTINGS },
    categories: [],
  };
}

/** Frozen reference to the default store, for documentation and equality checks. */
export const DEFAULT_STORE: Readonly<Store> = Object.freeze(createDefaultStore());
