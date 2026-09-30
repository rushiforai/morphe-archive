/**
 * SPA route detection for the content script (PRD §26, XI-01/XI-02).
 *
 * `isBookmarksRoute` is pure and exhaustively table-testable. `watchRoute`
 * reports enter/leave transitions exactly once each, even across X's own
 * `history.pushState` / `history.replaceState` navigation, `popstate`, and a
 * low-frequency `location.href` fallback for any navigation path that bypasses
 * both (XI-02).
 */

/**
 * Paths the organizer may activate on (PRD §26, XI-01).
 *
 * X moved the Bookmarks timeline from `/i/bookmarks` to `/i/history`. The new
 * canonical path is listed first; the legacy one is kept as a tolerated alias so
 * that a client-side redirect from an old link, or an account still served the
 * old route, does not leave the page without an active organizer. Remove the
 * legacy entry once `/i/bookmarks` is fully retired.
 */
export const BOOKMARKS_PATHS = ["/i/history", "/i/bookmarks"] as const;

/** How often the fallback watcher re-checks `location.href`. */
export const ROUTE_POLL_INTERVAL_MS = 500;

/**
 * True only for the Bookmarks timeline — `/i/history` (canonical) or
 * `/i/bookmarks` (legacy alias) — with or without a trailing slash, query
 * string, hash, or origin (XI-01).
 */
export function isBookmarksRoute(pathname?: string): boolean {
  const input = pathname ?? currentPathname();
  if (typeof input !== "string" || input.length === 0) return false;

  let path = input;
  const schemeIndex = path.indexOf("://");
  if (schemeIndex >= 0) {
    const afterOrigin = path.slice(schemeIndex + 3);
    const slash = afterOrigin.indexOf("/");
    path = slash >= 0 ? afterOrigin.slice(slash) : "/";
  } else if (path.startsWith("//")) {
    const afterOrigin = path.slice(2);
    const slash = afterOrigin.indexOf("/");
    path = slash >= 0 ? afterOrigin.slice(slash) : "/";
  }

  const queryIndex = path.search(/[?#]/);
  if (queryIndex >= 0) path = path.slice(0, queryIndex);

  return BOOKMARKS_PATHS.some(
    (candidate) => path === candidate || path === `${candidate}/`,
  );
}

function currentPathname(): string {
  const locationLike = (globalThis as { location?: { pathname?: unknown } }).location;
  const pathname = locationLike?.pathname;
  return typeof pathname === "string" ? pathname : "/";
}

/* -------------------------------------------------------------------------- */
/* Lifecycle                                                                  */
/* -------------------------------------------------------------------------- */

/** Minimal, injectable view of the browser APIs the route watcher needs. */
export interface RouteEnv {
  location: { pathname: string; href: string };
  history: {
    pushState: (...args: unknown[]) => unknown;
    replaceState: (...args: unknown[]) => unknown;
  };
  addEventListener: (type: string, listener: () => void) => void;
  removeEventListener: (type: string, listener: () => void) => void;
  setInterval: (handler: () => void, timeout: number) => number;
  clearInterval: (id: number) => void;
}

/** Options for {@link watchRoute}; `env` exists for tests. */
export interface WatchRouteOptions {
  /** Browser surface to use; defaults to the real `window`/`history`. */
  env?: RouteEnv;
  /** Fallback poll period, default {@link ROUTE_POLL_INTERVAL_MS}. */
  intervalMs?: number;
}

/** Build a {@link RouteEnv} from the real browser globals. */
export function browserRouteEnv(): RouteEnv {
  return {
    location: window.location,
    history: window.history as unknown as RouteEnv["history"],
    addEventListener: (type, listener) => window.addEventListener(type, listener),
    removeEventListener: (type, listener) => window.removeEventListener(type, listener),
    setInterval: (handler, timeout) => window.setInterval(handler, timeout),
    clearInterval: (id) => window.clearInterval(id),
  };
}

/**
 * Watch the current route and fire `onEnter`/`onLeave` exactly once per
 * transition. The current route is reported immediately on subscription.
 *
 * Returns a `stop()` function that removes every listener it installed and
 * restores the original `history` methods.
 */
export function watchRoute(
  onEnter: () => void,
  onLeave: () => void,
  options: WatchRouteOptions = {},
): () => void {
  const env = options.env ?? browserRouteEnv();
  const intervalMs = options.intervalMs ?? ROUTE_POLL_INTERVAL_MS;

  let active = isBookmarksRoute(env.location.pathname);
  let stopped = false;
  let lastHref = env.location.href;

  const sync = (): void => {
    if (stopped) return;
    const next = isBookmarksRoute(env.location.pathname);
    if (next === active) return;
    active = next;
    if (next) onEnter();
    else onLeave();
  };

  const onPopState = (): void => {
    sync();
  };

  const originalPushState = env.history.pushState;
  const originalReplaceState = env.history.replaceState;

  env.history.pushState = function patchedPushState(this: unknown, ...args: unknown[]): unknown {
    const result = originalPushState.apply(this, args);
    sync();
    return result;
  };
  env.history.replaceState = function patchedReplaceState(this: unknown, ...args: unknown[]): unknown {
    const result = originalReplaceState.apply(this, args);
    sync();
    return result;
  };

  env.addEventListener("popstate", onPopState);

  const timer = env.setInterval(() => {
    if (stopped) return;
    if (env.location.href === lastHref) return;
    lastHref = env.location.href;
    sync();
  }, intervalMs);

  if (active) onEnter();
  else onLeave();

  return () => {
    if (stopped) return;
    stopped = true;
    env.removeEventListener("popstate", onPopState);
    env.clearInterval(timer);
    env.history.pushState = originalPushState;
    env.history.replaceState = originalReplaceState;
  };
}
