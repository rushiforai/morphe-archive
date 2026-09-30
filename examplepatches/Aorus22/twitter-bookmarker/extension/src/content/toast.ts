/**
 * Lightweight in-page toast system (PRD §42, SAVE-07).
 *
 * Design constraints:
 *  - fixed position, top-of-the-page z-index, bottom-right stack;
 *  - the root has `pointer-events: none` so it never captures a click outside
 *    the toasts themselves; each toast re-enables pointer events so it stays
 *    click-to-dismiss;
 *  - the root carries `aria-live="polite"` so screen readers announce every
 *    toast without stealing focus;
 *  - auto-dismiss after {@link TOAST_DISMISS_MS}, manual click dismissal, and no
 *    OS notification API (PRD §42).
 *
 * The presenter is dependency-injected so it can be unit-tested against the
 * fake DOM; {@link showToast} is the module-level convenience bound to the real
 * document.
 */

/** The four toast states (PRD §42). */
export type ToastKind = "success" | "error" | "warning" | "info";

/** How long a toast stays visible before it dismisses itself. */
export const TOAST_DISMISS_MS = 3500;

/** Marks the fixed toast container. */
export const TOAST_ROOT_ATTRIBUTE = "data-twitter-bookmarker-toast-root";
/** Marks a single toast element. */
export const TOAST_ATTRIBUTE = "data-twitter-bookmarker-toast";
/** Carries the requested {@link ToastKind}. */
export const TOAST_KIND_ATTRIBUTE = "data-twitter-bookmarker-toast-kind";
/** Carries the logical state (mirrors the kind, for tests/automation). */
export const TOAST_STATE_ATTRIBUTE = "data-twitter-bookmarker-toast-state";

/** Visual + accessibility state for one toast kind. */
export interface ToastState {
  /** Logical state name, written to {@link TOAST_STATE_ATTRIBUTE}. */
  state: ToastKind;
  /** Accent colour (left border). */
  border: string;
  /** Panel background. */
  background: string;
  /** Text colour. */
  color: string;
  /** Accessible role for the toast element. */
  role: string;
}

/** The kind → state mapping every toast is rendered from. */
export const TOAST_STATES: Readonly<Record<ToastKind, ToastState>> = Object.freeze({
  success: { state: "success", border: "#00ba7c", background: "#ffffff", color: "#0f1419", role: "status" },
  error: { state: "error", border: "#f4212e", background: "#ffffff", color: "#0f1419", role: "status" },
  warning: { state: "warning", border: "#ffd400", background: "#ffffff", color: "#0f1419", role: "status" },
  info: { state: "info", border: "#1d9bf0", background: "#ffffff", color: "#0f1419", role: "status" },
});

/** State for `kind`, falling back to `info` for an unexpected runtime value. */
export function toastStateFor(kind: ToastKind): ToastState {
  return TOAST_STATES[kind] ?? TOAST_STATES.info;
}

/** Injectable primitives (tests pass the fake DOM / fake timers). */
export interface ToastDeps {
  /** Document to mount into; defaults to the global `document`. */
  document?: Document;
  /** Timer primitive; defaults to the global `setTimeout`. */
  setTimeout?: (handler: () => void, timeout: number) => number;
  /** Timer primitive matching {@link ToastDeps.setTimeout}. */
  clearTimeout?: (id: number) => void;
}

/** The toast surface used by the save controller and the bootstrap. */
export interface ToastPresenter {
  /** Show one toast; returns the element, or `null` when there is no document. */
  show(kind: ToastKind, message: string): HTMLElement | null;
  /** Dismiss one toast immediately (and clear its auto-dismiss timer). */
  dismiss(toast: HTMLElement): void;
  /** Dismiss every visible toast. */
  dismissAll(): void;
  /** The current container, or `null` when nothing is visible. */
  root(): HTMLElement | null;
}

/** Create a toast presenter over an injectable document. */
export function createToastPresenter(deps: ToastDeps = {}): ToastPresenter {
  const setTimer = deps.setTimeout ?? ((handler, timeout) => globalThis.setTimeout(handler, timeout));
  const clearTimer = deps.clearTimeout ?? ((id) => globalThis.clearTimeout(id));
  const timers = new Map<HTMLElement, number>();
  let container: HTMLElement | null = null;

  function resolveDocument(): Document | null {
    if (deps.document) return deps.document;
    return typeof document === "undefined" ? null : document;
  }

  function ensureRoot(doc: Document): HTMLElement {
    if (container !== null && container.isConnected) return container;

    const root = doc.createElement("div");
    root.setAttribute(TOAST_ROOT_ATTRIBUTE, "true");
    root.setAttribute("aria-live", "polite");
    root.setAttribute("aria-atomic", "false");
    root.className = "twb-toast-root";
    root.style.position = "fixed";
    root.style.bottom = "16px";
    root.style.right = "16px";
    root.style.zIndex = "2147483647";
    root.style.display = "flex";
    root.style.flexDirection = "column";
    root.style.gap = "8px";
    root.style.alignItems = "flex-end";
    root.style.maxWidth = "min(360px, calc(100vw - 32px))";
    // The container never eats clicks: only the toasts inside it do.
    root.style.pointerEvents = "none";

    (doc.body ?? doc.documentElement)?.appendChild(root);
    container = root;
    return root;
  }

  function dismiss(toast: HTMLElement): void {
    const timer = timers.get(toast);
    if (timer !== undefined) {
      timers.delete(toast);
      try {
        clearTimer(timer);
      } catch {
        /* Defensive: dismissal must never throw. */
      }
    }
    toast.remove();
    if (container !== null && container.childNodes.length === 0) {
      container.remove();
      container = null;
    }
  }

  function dismissAll(): void {
    for (const toast of [...timers.keys()]) dismiss(toast);
    for (const child of [...(container?.childNodes ?? [])]) child.remove();
    if (container !== null && container.childNodes.length === 0) {
      container.remove();
      container = null;
    }
  }

  function show(kind: ToastKind, message: string): HTMLElement | null {
    const doc = resolveDocument();
    if (!doc) return null;

    const state = toastStateFor(kind);
    const root = ensureRoot(doc);

    const toast = doc.createElement("div");
    toast.setAttribute(TOAST_ATTRIBUTE, "true");
    toast.setAttribute(TOAST_KIND_ATTRIBUTE, kind);
    toast.setAttribute(TOAST_STATE_ATTRIBUTE, state.state);
    toast.setAttribute("role", state.role);
    toast.setAttribute("title", "Dismiss");
    toast.className = `twb-toast twb-toast-${kind}`;
    toast.textContent = message;
    toast.style.pointerEvents = "auto";
    toast.style.cursor = "pointer";
    toast.style.boxSizing = "border-box";
    toast.style.maxWidth = "100%";
    toast.style.padding = "10px 14px";
    toast.style.borderRadius = "8px";
    toast.style.border = "1px solid rgba(0, 0, 0, 0.12)";
    toast.style.borderLeft = `4px solid ${state.border}`;
    toast.style.background = state.background;
    toast.style.color = state.color;
    toast.style.fontFamily = "inherit";
    toast.style.fontSize = "13px";
    toast.style.lineHeight = "18px";
    toast.style.boxShadow = "0 4px 14px rgba(0, 0, 0, 0.25)";
    toast.style.wordBreak = "break-word";
    toast.style.whiteSpace = "pre-wrap";

    toast.addEventListener("click", (event: Event) => {
      event.preventDefault();
      event.stopPropagation();
      dismiss(toast);
    });

    root.appendChild(toast);
    timers.set(
      toast,
      setTimer(() => dismiss(toast), TOAST_DISMISS_MS),
    );
    return toast;
  }

  return { show, dismiss, dismissAll, root: () => container };
}

/** Lazily created presenter bound to the real page. */
let defaultPresenter: ToastPresenter | null = null;

function presenter(): ToastPresenter {
  if (defaultPresenter === null) defaultPresenter = createToastPresenter();
  return defaultPresenter;
}

/** Show a toast on the real page. Never throws into X's page. */
export function showToast(kind: ToastKind, message: string): HTMLElement | null {
  try {
    return presenter().show(kind, message);
  } catch (error) {
    console.warn("[twitter-bookmarker] failed to show a toast", error);
    return null;
  }
}

/** Dismiss every toast on the real page. */
export function dismissAllToasts(): void {
  try {
    presenter().dismissAll();
  } catch (error) {
    console.warn("[twitter-bookmarker] failed to dismiss toasts", error);
  }
}
