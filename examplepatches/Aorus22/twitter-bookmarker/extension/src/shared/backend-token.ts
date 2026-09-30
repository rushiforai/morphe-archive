/**
 * Backend credential resolution (PRD §5, §50).
 *
 * A bearer token is the extension's only credential, and it exists for the one
 * case the default target never hits: a custom URL where this machine is not
 * obviously local. The backend trusts a request that arrives from its own
 * loopback carrying no proxy headers — which is exactly what `localhost` mode
 * produces — while a tunnel adds those headers and a LAN bind is not loopback at
 * all, so both are challenged. A browser answers that challenge with its own
 * password dialog; an extension has no dialog, so it sends this token instead.
 *
 * Nothing here touches `chrome.*` or the network: the functions are pure and
 * unit-tested directly.
 */

import type { Settings } from "./types.ts";

/**
 * Normalize a stored or pasted token.
 *
 * Surrounding whitespace is dropped, and a leading `Bearer ` is stripped, so a
 * value copied out of a header (or out of the phone patch's notes) cannot end up
 * being sent as `Bearer Bearer …`.
 */
export function normalizeBackendToken(value: unknown): string {
  if (typeof value !== "string") return "";
  return value
    .trim()
    .replace(/^bearer\s+/i, "")
    .trim();
}

/**
 * The token every backend request must present for the given settings.
 *
 * `localhost` resolves to no token at all: the loopback default is exempt on the
 * backend side, so carrying a credential there would put a secret in flight for
 * nothing.
 */
export function resolveBackendToken(
  settings: Pick<Settings, "backendMode" | "backendToken">,
): string {
  if (settings.backendMode !== "custom") return "";
  return normalizeBackendToken(settings.backendToken);
}

/** Request headers carrying the credential, or none when there is no token. */
export function authHeaders(token: string): Record<string, string> {
  return token === "" ? {} : { Authorization: `Bearer ${token}` };
}
