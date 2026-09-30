/**
 * Popup — backend target settings (PRD §50).
 *
 * Lets the user pick between the fixed loopback backend (`Localhost`) and a
 * custom base URL (`Custom`). Picking a mode persists it immediately; the custom
 * URL is validated with `shared/backend-url.ts` and only then written, so a typo
 * can never reject every later request without explanation.
 *
 * The custom panel also takes a bearer token, saved by the same button. It is
 * what lets a custom target that does not look local — a tunnel, a LAN bind —
 * authenticate: the backend accepts that token in place of the password dialog a
 * browser would show and an extension cannot. It is trimmed rather than
 * validated, since the backend is the only thing that can judge it; a wrong one
 * shows up as a Disconnected status, not as a save error.
 *
 * The popup is transient and the worker re-reads the store on every message, so
 * a successful write here is what makes the new address take effect.
 */

import { normalizeBackendUrl } from "../shared/backend-url.ts";
import { normalizeBackendToken } from "../shared/backend-token.ts";
import { setSettings } from "../shared/storage.ts";
import type { BackendMode, Settings, Store } from "../shared/types.ts";

export interface BackendSettingsPanel {
  /** Push persisted values into the controls without re-triggering a write. */
  render(store: Store): void;
}

function requireEl<T extends Element>(id: string): T {
  const element = document.getElementById(id);
  if (element === null) throw new Error(`popup markup is missing #${id}`);
  return element as unknown as T;
}

export function initBackendSettings(): BackendSettingsPanel {
  const modeGroup = requireEl<HTMLDivElement>("backend-mode");
  const modeOptions = Array.from(modeGroup.querySelectorAll<HTMLButtonElement>(".segmented-option"));
  const customForm = requireEl<HTMLDivElement>("backend-custom");
  const urlInput = requireEl<HTMLInputElement>("backend-url");
  const tokenInput = requireEl<HTMLInputElement>("backend-token");
  const saveButton = requireEl<HTMLButtonElement>("backend-url-save");
  const errorEl = requireEl<HTMLParagraphElement>("backend-url-error");

  /** True while `render` writes values into the DOM, so change handlers stay quiet. */
  let syncing = false;

  function applyMode(mode: BackendMode): void {
    for (const option of modeOptions) {
      option.setAttribute("aria-checked", String(option.dataset.backend === mode));
    }
    customForm.hidden = mode !== "custom";
  }

  function showError(message: string | null): void {
    errorEl.textContent = message ?? "";
    errorEl.hidden = message === null;
  }

  function persist(partial: Partial<Settings>): void {
    void setSettings(partial)
      .then(() => {
        showError(null);
        // No explicit "apply": the storage change rerenders the popup, and
        // `popup.ts` re-probes the moment the resolved address changes.
      })
      .catch(() => {
        showError("Could not save the backend settings. Try again.");
      });
  }

  for (const option of modeOptions) {
    option.addEventListener("click", () => {
      const mode = option.dataset.backend;
      if (mode !== "localhost" && mode !== "custom") return;

      applyMode(mode);
      if (syncing) return;

      // Switching to Custom keeps whatever URL was last saved (the default is
      // the loopback address, so the field always starts valid).
      persist({ backendMode: mode });
    });
  }

  function save(): void {
    const normalized = normalizeBackendUrl(urlInput.value);
    if (normalized === null) {
      showError("Enter a valid http:// or https:// URL, e.g. http://192.168.1.10:43121");
      urlInput.focus();
      return;
    }

    // The token is trimmed, not validated: only the backend can judge it, and a
    // wrong one surfaces as a Disconnected status rather than as a save error.
    // Both fields go in one write, so what the panel shows is what gets sent.
    const token = normalizeBackendToken(tokenInput.value);

    // Show the normalized forms the user is actually about to save.
    urlInput.value = normalized;
    tokenInput.value = token;
    persist({ backendMode: "custom", backendUrl: normalized, backendToken: token });
  }

  saveButton.addEventListener("click", save);

  for (const input of [urlInput, tokenInput]) {
    input.addEventListener("keydown", (event) => {
      if (event.key !== "Enter") return;
      event.preventDefault();
      save();
    });

    input.addEventListener("input", () => {
      showError(null);
    });
  }

  function render(store: Store): void {
    syncing = true;
    applyMode(store.settings.backendMode);
    // Never overwrite a field the user is in the middle of typing: an unrelated
    // store change (adding a category, toggling a setting) must not eat it.
    if (document.activeElement !== urlInput) urlInput.value = store.settings.backendUrl;
    if (document.activeElement !== tokenInput) tokenInput.value = store.settings.backendToken;
    showError(null);
    syncing = false;
  }

  return { render };
}
