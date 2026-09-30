// Hardening-guard tests (PRD §54, §64; TEST-05).
//
// Covers the three guards added in `content/hardening.ts` and, more
// importantly, proves they are wired into the real bookmarks-page lifecycle:
//   - a DOM replacement (fresh article node) is re-injected exactly once;
//   - a throwing mutation callback is contained, observation is re-armed, and a
//     sweep is rescheduled;
//   - route-leave cleanup removes every injected root, marker and toast even
//     when one step throws;
//   - a stale saved index is re-fetched exactly once when the backend is
//     confirmed available again.

import test, { after, afterEach, before } from "node:test";
import assert from "node:assert/strict";

import {
  createResilientMutationCallback,
  createResilientObserver,
  createSavedIndexRefresher,
  runBoundedCleanup,
} from "../src/content/hardening.ts";
import {
  isTweetSaved,
  refreshSavedIndexIfStale,
  startBookmarksPage,
  stopBookmarksPage,
} from "../src/content/bookmark-page.ts";
import { INJECTED_ATTRIBUTE } from "../src/content/selectors.ts";
import { createToastPresenter } from "../src/content/toast.ts";
import { appendTweet, createTweetDocument, makeStore, sampleCategories } from "./helpers/tweet-fixtures.mjs";

afterEach(() => {
  stopBookmarksPage();
});

// Every test here deliberately drives an error path, so the guards emit
// `console.warn` diagnostics with stack traces. Silence them for the file: the
// assertions, not the log output, are what is under test.
let originalWarn;
before(() => {
  originalWarn = console.warn;
  console.warn = () => {};
});
after(() => {
  console.warn = originalWarn;
});

/* -------------------------------------------------------------------------- */
/* Harnesses                                                                  */
/* -------------------------------------------------------------------------- */

function createObserverHarness() {
  const observers = [];
  const factory = (callback) => {
    const observer = {
      callback,
      targets: [],
      disconnected: false,
      observe(target, options) {
        this.targets.push({ target, options });
      },
      disconnect() {
        this.disconnected = true;
      },
      emit(records) {
        this.callback(records);
      },
    };
    observers.push(observer);
    return observer;
  };
  return { factory, observers };
}

function createTimerHarness() {
  let nextId = 1;
  const pending = new Map();
  return {
    setTimeout(handler) {
      const id = nextId;
      nextId += 1;
      pending.set(id, handler);
      return id;
    },
    clearTimeout(id) {
      pending.delete(id);
    },
    runAll() {
      const handlers = [...pending.values()];
      pending.clear();
      for (const handler of handlers) handler();
    },
    pendingCount() {
      return pending.size;
    },
  };
}

function baseDeps(doc, observers, timers, overrides = {}) {
  return {
    document: doc,
    createObserver: observers.factory,
    setTimeout: timers.setTimeout,
    clearTimeout: timers.clearTimeout,
    loadStore: async () => makeStore(sampleCategories()),
    loadSavedIndex: async () => new Set(),
    ...overrides,
  };
}

const rootsIn = (scope) => scope.querySelectorAll("[data-twitter-bookmarker-root]");

/* -------------------------------------------------------------------------- */
/* hardening.ts unit coverage                                                 */
/* -------------------------------------------------------------------------- */

test("createResilientMutationCallback contains a throw, reports it, and reschedules", () => {
  const errors = [];
  const reschedules = [];
  const callback = createResilientMutationCallback(
    () => {
      throw new Error("boom");
    },
    {
      onError: (error) => errors.push(error),
      onReschedule: () => reschedules.push("sweep"),
    },
  );

  assert.doesNotThrow(() => callback([{ addedNodes: [] }]));
  assert.equal(errors.length, 1);
  assert.equal(errors[0].message, "boom");
  assert.deepEqual(reschedules, ["sweep"]);
});

test("a throwing error sink or reschedule hook never escapes the guard", () => {
  const callback = createResilientMutationCallback(
    () => {
      throw new Error("boom");
    },
    {
      onError: () => {
        throw new Error("sink failed");
      },
      onReschedule: () => {
        throw new Error("reschedule failed");
      },
    },
  );
  assert.doesNotThrow(() => callback([]));
});

test("createResilientObserver re-arms and keeps delivering after a callback throw", () => {
  const observers = [];
  const factory = (callback) => {
    const observer = {
      callback,
      targets: [],
      disconnectCount: 0,
      observe(target, options) {
        this.targets.push({ target, options });
      },
      disconnect() {
        this.disconnectCount += 1;
      },
      emit(records) {
        this.callback(records);
      },
    };
    observers.push(observer);
    return observer;
  };

  const delivered = [];
  const reschedules = [];
  let shouldThrow = true;
  const observer = createResilientObserver({
    createObserver: factory,
    handler: (records) => {
      delivered.push(records.length);
      if (shouldThrow) {
        shouldThrow = false;
        throw new Error("boom");
      }
    },
    onError: () => {},
    onReschedule: () => reschedules.push("sweep"),
  });

  const target = { nodeType: 1 };
  observer.observe(target, { childList: true, subtree: true });
  assert.equal(observers.length, 1);

  assert.doesNotThrow(() => observers[0].emit([{ id: 1 }]));
  assert.equal(observer.hasFailed(), true);
  assert.deepEqual(reschedules, ["sweep"]);
  assert.equal(observers[0].disconnectCount, 1, "re-arm disconnects once");
  assert.deepEqual(
    observers[0].targets.map((entry) => entry.target),
    [target, target],
    "every observed target is re-observed",
  );

  observers[0].emit([{ id: 2 }]);
  assert.deepEqual(delivered, [1, 1], "later record sets are still delivered");
});

test("createSavedIndexRefresher coalesces concurrent fetches and remembers freshness", async () => {
  let calls = 0;
  let resolveLoad;
  const applied = [];
  const refresher = createSavedIndexRefresher({
    load: () => {
      calls += 1;
      return new Promise((resolve) => {
        resolveLoad = resolve;
      });
    },
    apply: (ids) => applied.push([...ids]),
    onError: () => {},
  });

  assert.equal(refresher.isStale(), true);
  const first = refresher.refreshIfStale();
  const second = refresher.refreshIfStale();
  assert.equal(calls, 1, "concurrent callers share one request");
  assert.equal(refresher.isRefreshing(), true);

  resolveLoad(new Set(["1"]));
  assert.equal(await first, true);
  assert.equal(await second, true);
  assert.equal(refresher.isStale(), false);
  assert.deepEqual(applied, [["1"]]);

  assert.equal(await refresher.refreshIfStale(), false);
  assert.equal(calls, 1, "a fresh index is never re-fetched");
});

test("a failed saved-index fetch stays stale for exactly one retry", async () => {
  let calls = 0;
  const refresher = createSavedIndexRefresher({
    load: async () => {
      calls += 1;
      if (calls === 1) throw new Error("backend_unavailable");
      return new Set(["9"]);
    },
    apply: () => {},
    onError: () => {},
  });

  assert.equal(await refresher.refreshIfStale(), false);
  assert.equal(refresher.isStale(), true);
  assert.equal(await refresher.refreshIfStale(), true);
  assert.equal(calls, 2);
  assert.equal(refresher.isStale(), false);
  assert.equal(await refresher.refreshIfStale(), false);
  assert.equal(calls, 2);
});

test("runBoundedCleanup attempts every step and reports failures", () => {
  const ran = [];
  const result = runBoundedCleanup([
    { name: "a", run: () => ran.push("a") },
    {
      name: "b",
      run: () => {
        throw new Error("b failed");
      },
    },
    { name: "c", run: () => ran.push("c") },
  ]);

  assert.deepEqual(ran, ["a", "c"], "a throwing step does not skip later steps");
  assert.deepEqual(result.attempted, ["a", "b", "c"]);
  assert.equal(result.failures.length, 1);
  assert.equal(result.failures[0].name, "b");
  assert.equal(result.failures[0].error.message, "b failed");
});

/* -------------------------------------------------------------------------- */
/* Wired into the real page lifecycle                                         */
/* -------------------------------------------------------------------------- */

test("DOM replacement: a fresh article node gets controls again exactly once (PRD §64)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));

  assert.equal(rootsIn(article).length, 1);
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), "true");

  // X replaces the whole article node. The fresh node has no marker and no
  // root, so it must be treated as brand new even though the tweet id is the
  // same — a WeakSet keyed by tweet id would wrongly suppress this.
  article.remove();
  const replacement = appendTweet(doc, { text: "hi", href: "/ada/status/1234567890" });
  observers.observers[0].emit([{ target: doc.body, addedNodes: [replacement.article] }]);

  assert.equal(replacement.article.getAttribute(INJECTED_ATTRIBUTE), "true");
  assert.equal(rootsIn(replacement.article).length, 1, "the fresh node gets exactly one root");
  assert.equal(rootsIn(doc).length, 1, "the stale root left with the old node");

  // Re-announcing the same fresh node must not double-inject.
  observers.observers[0].emit([{ target: doc.body, addedNodes: [replacement.article] }]);
  assert.equal(rootsIn(replacement.article).length, 1);
});

test("the page observer survives a throwing mutation callback and reschedules a sweep", async () => {
  const { doc } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));

  // A selector query that throws mid-record escapes `handleMutations`; the
  // resilient wrapper must contain it and reschedule a sweep.
  const exploding = doc.createElement("div");
  exploding.querySelectorAll = () => {
    throw new Error("dom exploded");
  };
  assert.doesNotThrow(() => observers.observers[0].emit([{ target: doc.body, addedNodes: [exploding] }]));
  assert.equal(timers.pendingCount(), 1, "the wrapper reschedules a sweep after the throw");

  timers.runAll();

  // Observation is still alive: a later tweet is still discovered and injected.
  const later = appendTweet(doc, { text: "later", href: "/x/status/777" });
  observers.observers[0].emit([{ target: doc.body, addedNodes: [later.article] }]);
  assert.equal(rootsIn(later.article).length, 1);
});

test("route-leave cleanup removes every injected root, marker, and toast", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const second = appendTweet(doc, { text: "two", href: "/two/status/222" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  const presenter = createToastPresenter({
    document: doc,
    setTimeout: timers.setTimeout,
    clearTimeout: timers.clearTimeout,
  });

  await startBookmarksPage(baseDeps(doc, observers, timers, { dismissToasts: () => presenter.dismissAll() }));
  presenter.show("success", "Saved to Linux");
  presenter.show("error", "Backend unavailable");

  assert.equal(doc.querySelectorAll("[data-twitter-bookmarker-toast]").length, 2);
  assert.equal(rootsIn(doc).length, 2);

  observers.observers[0].emit([{ target: doc.body, addedNodes: [doc.createElement("div")] }]);
  assert.ok(timers.pendingCount() > 0);

  stopBookmarksPage();

  assert.equal(observers.observers[0].disconnected, true);
  assert.equal(rootsIn(doc).length, 0, "every injected root is gone");
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), null, "the marker is cleared");
  assert.equal(second.article.getAttribute(INJECTED_ATTRIBUTE), null);
  assert.equal(doc.querySelectorAll("[data-twitter-bookmarker-toast]").length, 0, "every toast is gone");
  assert.equal(doc.querySelectorAll("[data-twitter-bookmarker-toast-root]").length, 0, "the toast root is gone");
  assert.equal(timers.pendingCount(), 0, "sweep and toast timers are cleared");
});

test("a throwing cleanup step never blocks the remaining teardown", async () => {
  const { doc } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  let toastsDismissed = 0;

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      removeAll: () => {
        throw new Error("remove failed");
      },
      dismissToasts: () => {
        toastsDismissed += 1;
      },
    }),
  );

  assert.doesNotThrow(() => stopBookmarksPage());
  assert.equal(observers.observers[0].disconnected, true);
  assert.equal(toastsDismissed, 1, "toast dismissal still ran after removeAll threw");
  assert.equal(timers.pendingCount(), 0);
});

test("a stale saved index is re-fetched exactly once once the backend is confirmed (PRD §54)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  let calls = 0;

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      loadSavedIndex: async () => {
        calls += 1;
        if (calls === 1) throw new Error("backend_unavailable");
        return new Set(["1234567890"]);
      },
    }),
  );

  assert.equal(calls, 1);
  assert.equal(isTweetSaved("1234567890"), false);
  assert.equal(article.querySelector("[data-twitter-bookmarker-saved]"), null);

  // Backend became available: the explicit retry refreshes once, and the
  // already-injected control flips to ✓ Saved in place.
  assert.equal(await refreshSavedIndexIfStale(), true);
  assert.equal(calls, 2);
  assert.equal(isTweetSaved("1234567890"), true);
  assert.ok(article.querySelector("[data-twitter-bookmarker-saved]"), "the visible control flips to ✓ Saved");

  // Fresh now — no further fetch, so this can never become a per-tweet GET.
  assert.equal(await refreshSavedIndexIfStale(), false);
  assert.equal(calls, 2);
});
