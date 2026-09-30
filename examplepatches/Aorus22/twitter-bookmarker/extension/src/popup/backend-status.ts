/**
 * Popup — backend connection status (PRD §43, §44, §50).
 *
 * On popup open (and whenever the configured backend changes), probe
 * `GET {baseUrl}/health` from the extension context with a short AbortController
 * timeout: `200 {"status":"ok"}` -> `● Connected`, anything else ->
 * `● Disconnected`. The address actually in use is shown underneath, so a
 * custom URL is never silently wrong.
 *
 * The probe itself lives in `shared/api.ts` (`checkHealth`) — the same function
 * the service worker answers `HEALTH_CHECK` with — so the popup and the worker
 * always agree on the target and the timeout.
 *
 * The extension never starts the backend; a failed probe is simply Disconnected
 * and never becomes an unhandled rejection.
 */

import { checkHealth } from "../shared/api.ts";
import { resolveBackendBaseUrl } from "../shared/backend-url.ts";
import { resolveBackendToken } from "../shared/backend-token.ts";
import { DEFAULT_BACKEND_BASE_URL, HEALTH_PATH } from "../shared/constants.ts";
import type { Store } from "../shared/types.ts";

/** The `GET /health` URL for one base URL. */
export function healthUrl(baseUrl: string): string {
  return `${baseUrl}${HEALTH_PATH}`;
}

export interface BackendStatusPanel {
  /** Adopt the store's backend target and render its address (no probe). */
  render(store: Store): void;
  /** Probe the current target and render the result. */
  check(): Promise<void>;
}

function requireEl<T extends Element>(id: string): T {
  const element = document.getElementById(id);
  if (element === null) throw new Error(`popup markup is missing #${id}`);
  return element as unknown as T;
}

export function initBackendStatus(): BackendStatusPanel {
  const statusEl = requireEl<HTMLParagraphElement>("backend-status");
  const retryButton = requireEl<HTMLButtonElement>("backend-retry");
  const targetEl = requireEl<HTMLParagraphElement>("backend-target");
  const textEl = statusEl.querySelector<HTMLSpanElement>(".status-text");

  /** The target the last `render` selected; `check` always probes this one. */
  let baseUrl = DEFAULT_BACKEND_BASE_URL;
  let token = "";
  let checking = false;

  function setState(state: "checking" | "connected" | "disconnected"): void {
    statusEl.classList.remove("status--checking", "status--connected", "status--disconnected");
    statusEl.classList.add(`status--${state}`);

    if (textEl) {
      textEl.textContent =
        state === "checking" ? "Checking\u2026" : state === "connected" ? "Connected" : "Disconnected";
    }
    retryButton.disabled = state === "checking";
  }

  function renderTarget(): void {
    targetEl.textContent = baseUrl;
    targetEl.title = healthUrl(baseUrl);
  }

  async function check(): Promise<void> {
    if (checking) return;
    checking = true;
    setState("checking");

    // `checkHealth` already swallows fetch failures; this catch is belt-and-braces
    // so a health probe can never surface as an unhandled rejection.
    const connected = await checkHealth(baseUrl, token).catch(() => false);

    checking = false;
    setState(connected ? "connected" : "disconnected");
  }

  retryButton.addEventListener("click", () => {
    void check();
  });

  function render(store: Store): void {
    baseUrl = resolveBackendBaseUrl(store.settings);
    token = resolveBackendToken(store.settings);
    renderTarget();
  }

  return { render, check };
}
