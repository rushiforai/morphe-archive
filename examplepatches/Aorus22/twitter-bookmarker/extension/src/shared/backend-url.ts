/**
 * Backend address resolution (PRD §5, §50).
 *
 * The extension used to talk to one hardcoded loopback URL. It now also supports
 * a user-entered custom base URL, so every request target goes through the pure
 * helpers below. Nothing here touches `chrome.*` or the network: the functions
 * are total, side-effect free, and unit-tested directly.
 *
 * Accepted input (see {@link normalizeBackendUrl}):
 *   - `"127.0.0.1:43121"` / `"localhost:8080"` — a missing scheme means `http:`;
 *   - any `http:`/`https:` URL, optionally with a base path
 *     (`"https://server.example/tw-bookmarker"`).
 *
 * Rejected input (normalizes to `null`): anything that is not a string, an empty
 * string, a non-http(s) scheme, an unparseable URL, or a URL carrying embedded
 * credentials (`http://user:pass@host`), which `fetch` refuses anyway.
 */

import { DEFAULT_BACKEND_BASE_URL } from "./constants.ts";
import type { BackendMode, Settings } from "./types.ts";

/** Every accepted `Settings.backendMode`, in UI order. */
export const BACKEND_MODES: readonly BackendMode[] = ["localhost", "custom"];

/** A scheme must be followed by `//`; that is what separates `host:port` from `scheme:path`. */
const HAS_SCHEME = /^[a-z][a-z0-9+.-]*:\/\//i;

/** Coerce an unknown value into a valid backend mode. */
export function normalizeBackendMode(value: unknown): BackendMode {
  return BACKEND_MODES.includes(value as BackendMode) ? (value as BackendMode) : "localhost";
}

/**
 * Coerce user input into a usable base URL, or `null` when unusable.
 *
 * The result is an origin plus an optional base path with no trailing slash,
 * e.g. `"http://192.168.1.5:8080"` or `"https://server.example/tw-bookmarker"`.
 * Query strings and fragments are dropped: a base URL has no use for them.
 */
export function normalizeBackendUrl(value: unknown): string | null {
  if (typeof value !== "string") return null;

  const trimmed = value.trim();
  if (trimmed.length === 0) return null;

  let url: URL;
  try {
    url = new URL(HAS_SCHEME.test(trimmed) ? trimmed : `http://${trimmed}`);
  } catch {
    return null;
  }

  if (url.protocol !== "http:" && url.protocol !== "https:") return null;
  if (url.username !== "" || url.password !== "") return null;
  if (url.hostname === "") return null;

  // `new URL("http://host")` reports pathname "/"; strip it so callers can
  // concatenate endpoint paths without producing a double slash.
  return `${url.origin}${url.pathname.replace(/\/+$/, "")}`;
}

/**
 * The base URL every backend request must use for the given settings.
 *
 * `localhost` (and any unparseable stored value) resolves to
 * {@link DEFAULT_BACKEND_BASE_URL}; `custom` resolves to the saved URL.
 */
export function resolveBackendBaseUrl(
  settings: Pick<Settings, "backendMode" | "backendUrl">,
): string {
  if (settings.backendMode !== "custom") return DEFAULT_BACKEND_BASE_URL;
  return normalizeBackendUrl(settings.backendUrl) ?? DEFAULT_BACKEND_BASE_URL;
}
