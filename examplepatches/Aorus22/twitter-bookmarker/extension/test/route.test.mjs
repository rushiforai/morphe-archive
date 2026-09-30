// Route matcher + SPA route-watcher tests (XI-01, XI-02).
//
// The matcher is a pure function, so it gets an exhaustive table. The watcher is
// driven through an injected RouteEnv so `pushState`/`replaceState`/`popstate`
// and the interval fallback are all exercised without a browser.

import test from "node:test";
import assert from "node:assert/strict";

import { ROUTE_POLL_INTERVAL_MS, isBookmarksRoute, watchRoute } from "../src/content/route.ts";

test("isBookmarksRoute accepts /i/history (canonical) with trailing slash/query/origin", () => {
  const accepted = [
    "/i/history",
    "/i/history/",
    "/i/history?foo=1",
    "/i/history/?x=1&y=2",
    "/i/history#section",
    "https://x.com/i/history",
    "https://x.com/i/history/",
    "https://x.com/i/history/?a=b#c",
  ];
  for (const pathname of accepted) {
    assert.equal(isBookmarksRoute(pathname), true, `expected ${pathname} to be accepted`);
  }
});

test("isBookmarksRoute still accepts the legacy /i/bookmarks alias", () => {
  const accepted = [
    "/i/bookmarks",
    "/i/bookmarks/",
    "/i/bookmarks?foo=1",
    "/i/bookmarks/?x=1&y=2",
    "/i/bookmarks#section",
    "https://x.com/i/bookmarks",
    "https://x.com/i/bookmarks/",
    "https://x.com/i/bookmarks/?a=b#c",
  ];
  for (const pathname of accepted) {
    assert.equal(isBookmarksRoute(pathname), true, `expected ${pathname} to be accepted`);
  }
});

test("isBookmarksRoute rejects every excluded route", () => {
  const rejected = [
    "/",
    "/home",
    "/explore",
    "/notifications",
    "/messages",
    "/ada",
    "/ada/status/1234567890",
    "/i/lists",
    "/i/lists/123",
    "/search?q=typescript",
    "/i/history-extra",
    "/i/history/extra",
    "/i/histor",
    "/i/bookmarks-extra",
    "/i/bookmarks/extra",
    "/i/bookmark",
    "/bookmarks",
    "https://x.com/home",
    "",
  ];
  for (const pathname of rejected) {
    assert.equal(isBookmarksRoute(pathname), false, `expected ${pathname} to be rejected`);
  }
});

test("ROUTE_POLL_INTERVAL_MS is a low-frequency fallback", () => {
  assert.ok(ROUTE_POLL_INTERVAL_MS >= 250 && ROUTE_POLL_INTERVAL_MS <= 2000);
});

/** A controllable RouteEnv: mutate location, then call the watcher hooks. */
function createEnv(pathname) {
  const listeners = new Map();
  let intervalHandler = null;
  let intervalCleared = false;

  const location = { pathname, href: `https://x.com${pathname}` };

  function applyUrl(url) {
    if (typeof url !== "string" || url.length === 0) return;
    const pathnamePart = url.startsWith("http") ? new URL(url).pathname : url.split(/[?#]/)[0];
    location.pathname = pathnamePart || "/";
    location.href = url.startsWith("http") ? url : `https://x.com${url}`;
  }

  const env = {
    location,
    history: {
      pushState(_data, _unused, url) {
        applyUrl(url);
      },
      replaceState(_data, _unused, url) {
        applyUrl(url);
      },
    },
    addEventListener(type, listener) {
      listeners.set(type, listener);
    },
    removeEventListener(type) {
      listeners.delete(type);
    },
    setInterval(handler) {
      intervalHandler = handler;
      return 7;
    },
    clearInterval() {
      intervalCleared = true;
      intervalHandler = null;
    },
  };

  return {
    env,
    navigate(url) {
      applyUrl(url);
    },
    pop() {
      listeners.get("popstate")?.();
    },
    tick() {
      intervalHandler?.();
    },
    listenerCount() {
      return listeners.size;
    },
    intervalCleared() {
      return intervalCleared;
    },
  };
}

test("watchRoute reports enter/leave exactly once per transition", () => {
  const harness = createEnv("/i/bookmarks");
  const events = [];
  const stop = watchRoute(
    () => events.push("enter"),
    () => events.push("leave"),
    { env: harness.env },
  );

  assert.deepEqual(events, ["enter"], "the current route is reported immediately");

  harness.env.history.pushState({}, "", "https://x.com/home");
  assert.deepEqual(events, ["enter", "leave"]);

  harness.env.history.pushState({}, "", "https://x.com/i/bookmarks");
  assert.deepEqual(events, ["enter", "leave", "enter"]);

  // Repeated same-route ticks and popstate never duplicate a callback.
  harness.pop();
  harness.tick();
  harness.env.history.replaceState({}, "", "https://x.com/i/bookmarks");
  assert.deepEqual(events, ["enter", "leave", "enter"]);

  // A raw location change bypassing history is caught by the interval fallback.
  harness.navigate("https://x.com/explore");
  harness.tick();
  assert.deepEqual(events, ["enter", "leave", "enter", "leave"]);

  stop();
  assert.equal(harness.listenerCount(), 0, "stop removes the popstate listener");
  assert.equal(harness.intervalCleared(), true, "stop clears the interval");

  // After stop the watcher is inert even though history is patched back.
  harness.env.history.pushState({}, "", "https://x.com/i/bookmarks");
  assert.deepEqual(events, ["enter", "leave", "enter", "leave"]);
});

test("watchRoute starting off-route reports leave first and resumes on arrival", () => {
  const harness = createEnv("/home");
  const events = [];
  watchRoute(
    () => events.push("enter"),
    () => events.push("leave"),
    { env: harness.env },
  );

  assert.deepEqual(events, ["leave"]);
  harness.env.history.pushState({}, "", "https://x.com/i/bookmarks/");
  assert.deepEqual(events, ["leave", "enter"]);
  harness.navigate("https://x.com/explore");
  harness.pop();
  assert.deepEqual(events, ["leave", "enter", "leave"]);
});
