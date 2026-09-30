// Bookmarks-page lifecycle tests (XI-01..XI-04, XI-11, XI-12, PRD §54).
//
// Drives `startBookmarksPage` with injected document/observer/timer/config deps,
// then feeds MutationRecord-shaped objects into the single observer callback.

import test, { afterEach } from "node:test";
import assert from "node:assert/strict";

import {
  getSavedTweetIds,
  isTweetSaved,
  loadSavedIndexFromServiceWorker,
  markTweetSaved,
  refreshBookmarksPage,
  startBookmarksPage,
  stopBookmarksPage,
} from "../src/content/bookmark-page.ts";
import { INJECTED_ATTRIBUTE } from "../src/content/selectors.ts";
import { isPopoverOpen } from "../src/content/organizer.ts";
import { extractTweet } from "../src/content/tweet-extractor.ts";
import { appendTweet, createTweetDocument, makeStore, sampleCategories } from "./helpers/tweet-fixtures.mjs";

afterEach(() => {
  stopBookmarksPage();
});

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

test("start fetches the index once, injects, and marks saved tweets (XI-03, XI-04, XI-11)", async () => {
  const { doc, article, actionBar } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  let indexCalls = 0;

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      loadSavedIndex: async () => {
        indexCalls += 1;
        return new Set(["1234567890"]);
      },
    }),
  );

  assert.equal(indexCalls, 1, "the saved index is fetched exactly once per page entry");
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), "true");
  const root = rootsIn(article)[0];
  assert.ok(root);
  assert.equal(root.nextElementSibling, actionBar, "organizer owns the row above the action bar");
  assert.ok(root.querySelector("[data-twitter-bookmarker-saved]"));
  assert.equal(isTweetSaved("1234567890"), true);
  assert.deepEqual([...getSavedTweetIds()], ["1234567890"]);

  assert.equal(observers.observers.length, 1, "exactly one MutationObserver");
  assert.equal(observers.observers[0].targets[0].target, doc.body);
  assert.deepEqual(observers.observers[0].targets[0].options, { childList: true, subtree: true });
});

test("start is idempotent while the page is running", async () => {
  const { doc } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();

  await startBookmarksPage(baseDeps(doc, observers, timers));
  await startBookmarksPage(baseDeps(doc, observers, timers));

  assert.equal(observers.observers.length, 1);
});

test("a throwing index loader never blocks injection (Phase 2 service worker stub)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      loadSavedIndex: async () => {
        throw new Error("no_response_from_service_worker");
      },
    }),
  );

  assert.equal(rootsIn(article).length, 1, "injection still happens");
  assert.equal(article.querySelector("[data-twitter-bookmarker-saved]"), null);
  assert.equal(isTweetSaved("1234567890"), false);
});

test("loadSavedIndexFromServiceWorker tolerates ok:false and thrown messages", async () => {
  globalThis.chrome = {
    runtime: { sendMessage: async () => ({ ok: false, index: null, error: "not_implemented" }) },
  };
  assert.equal((await loadSavedIndexFromServiceWorker()).size, 0);

  globalThis.chrome = {
    runtime: {
      sendMessage: async () => ({
        ok: true,
        index: { items: { 111: { url: "u", slug: "f", saved_at: "t" }, 222: { url: "u", slug: "f", saved_at: "t" } } },
      }),
    },
  };
  assert.deepEqual([...(await loadSavedIndexFromServiceWorker())].sort(), ["111", "222"]);

  globalThis.chrome = {
    runtime: {
      sendMessage: async () => {
        throw new Error("channel closed");
      },
    },
  };
  assert.equal((await loadSavedIndexFromServiceWorker()).size, 0);
});

test("addedNodes discovery injects immediately and is idempotent; own-root mutations are ignored", async () => {
  const { doc, article } = createTweetDocument({ text: "first" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));
  const observer = observers.observers[0];
  const root = article.querySelector("[data-twitter-bookmarker-root]");
  assert.ok(root);

  // Re-announcing an already-marked article must not create a second root.
  observer.emit([{ target: doc.body, addedNodes: [article] }]);
  assert.equal(rootsIn(article).length, 1);
  assert.equal(timers.pendingCount(), 1, "a debounced sweep is scheduled");
  timers.runAll();
  assert.equal(timers.pendingCount(), 0);

  // Mutations originating inside our own root are ignored entirely.
  observer.emit([{ target: root, addedNodes: [doc.createElement("span")] }]);
  assert.equal(rootsIn(article).length, 1);
  assert.equal(timers.pendingCount(), 0, "no sweep is scheduled for our own DOM");
});

test("a newly scrolled-in tweet gets controls exactly once (XI-03)", async () => {
  const { doc } = createTweetDocument({ text: "first" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));
  const observer = observers.observers[0];

  const second = appendTweet(doc, { text: "second", href: "/two/status/222" });
  observer.emit([{ target: doc.body, addedNodes: [second.article] }]);
  observer.emit([{ target: doc.body, addedNodes: [second.article] }]);

  assert.equal(second.article.getAttribute(INJECTED_ATTRIBUTE), "true");
  assert.equal(rootsIn(second.article).length, 1);
  assert.equal(rootsIn(second.article)[0].nextElementSibling, second.actionBar);
});

test("the debounced sweep re-injects a tweet whose DOM was wiped (marker logic, XI-04)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));
  const observer = observers.observers[0];

  // Simulate X re-rendering the article's contents: our root disappears but the
  // container node (and its marker) survive.
  rootsIn(article)[0].remove();
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), "true");

  observer.emit([{ target: doc.body, addedNodes: [doc.createElement("div")] }]);
  timers.runAll();

  assert.equal(rootsIn(article).length, 1, "the sweep self-heals and re-injects exactly once");
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), "true");
});

test("stop disconnects, clears timers, and removes roots, markers, and the saved cache", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(
    baseDeps(doc, observers, timers, { loadSavedIndex: async () => new Set(["1234567890"]) }),
  );
  const observer = observers.observers[0];

  observer.emit([{ target: doc.body, addedNodes: [doc.createElement("div")] }]);
  assert.equal(timers.pendingCount(), 1);

  stopBookmarksPage();

  assert.equal(observer.disconnected, true);
  assert.equal(timers.pendingCount(), 0);
  assert.equal(rootsIn(doc).length, 0);
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), null);
  assert.equal(getSavedTweetIds().size, 0);
});

test("refresh adopts new categories and injects previously-skipped tweets (PRD §51)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();

  await startBookmarksPage(baseDeps(doc, observers, timers, { loadStore: async () => makeStore([]) }));
  assert.equal(rootsIn(article).length, 0, "zero categories means no organizer");
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), null);

  refreshBookmarksPage(makeStore(sampleCategories()));
  assert.equal(rootsIn(article).length, 1, "the new category is applied without a reload");
});

test("refresh rerenders order and display mode on existing controls (PRD §51)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();

  await startBookmarksPage(
    baseDeps(doc, observers, timers, { loadStore: async () => makeStore(sampleCategories(), "inline") }),
  );
  const root = rootsIn(article)[0];
  assert.deepEqual(
    root.querySelectorAll("[data-category-id]").map((button) => button.getAttribute("data-category-id")),
    ["cat-ai", "cat-linux"],
  );

  const reordered = [
    { id: "cat-linux", name: "Linux", slug: "linux", color: "#10b981", order: 0 },
    { id: "cat-ai", name: "AI", slug: "ai", color: "#4f46e5", order: 1 },
  ];
  refreshBookmarksPage(makeStore(reordered, "popover"));

  assert.equal(rootsIn(article).length, 1, "no duplicate root");
  assert.ok(root.querySelector("[data-twitter-bookmarker-trigger]"), "display mode switches to popover");
  const panelButtons = root
    .querySelector("[data-twitter-bookmarker-panel]")
    .querySelectorAll("[data-category-id]")
    .map((button) => button.getAttribute("data-category-id"));
  assert.deepEqual(panelButtons, ["cat-linux", "cat-ai"], "reorder is reflected live");
});

test("extraction failure surfaces once, injects nothing, and never sends a partial record (XI-12)", async () => {
  const { doc, article } = createTweetDocument({ username: null, href: "/i/status/1234567890", text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  const reasons = [];

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      onExtractionError: (_article, reason) => reasons.push(reason),
    }),
  );

  assert.deepEqual(reasons, ["missing_username"]);
  assert.equal(rootsIn(article).length, 0);
  assert.equal(article.getAttribute(INJECTED_ATTRIBUTE), null, "marker is cleared so a later sweep can retry");

  observers.observers[0].emit([{ target: doc.body, addedNodes: [doc.createElement("div")] }]);
  timers.runAll();
  assert.deepEqual(reasons, ["missing_username"], "the same node is not reported twice");
});

test("one bad tweet cannot kill observation (observer callback is guarded)", async () => {
  const { doc, article } = createTweetDocument({ text: "ok" });
  const broken = appendTweet(doc, { text: "broken", href: "/two/status/999" }).article;
  const observers = createObserverHarness();
  const timers = createTimerHarness();

  await startBookmarksPage(
    baseDeps(doc, observers, timers, {
      extract: (target) => {
        if (target === broken) throw new Error("boom");
        return extractTweet(target);
      },
    }),
  );

  assert.equal(rootsIn(article).length, 1, "the good tweet is still processed");
  assert.equal(rootsIn(broken).length, 0);

  // Observation is still alive: a later tweet is processed.
  const third = appendTweet(doc, { text: "third", href: "/three/status/333" }).article;
  observers.observers[0].emit([{ target: doc.body, addedNodes: [third] }]);
  assert.equal(rootsIn(third).length, 1);
});

test("a removed tweet closes its open popover through the observer (XI-09)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(
    baseDeps(doc, observers, timers, { loadStore: async () => makeStore(sampleCategories(), "popover") }),
  );

  const root = rootsIn(article)[0];
  root.querySelector("[data-twitter-bookmarker-trigger]").click();
  assert.equal(isPopoverOpen(root), true);

  article.remove();
  observers.observers[0].emit([{ target: doc.body, addedNodes: [], removedNodes: [article] }]);
  assert.equal(isPopoverOpen(root), false);
});

test("markTweetSaved updates the cache and renders ✓ Saved (Phase 4 seam)", async () => {
  const { doc, article } = createTweetDocument({ text: "hi" });
  const observers = createObserverHarness();
  const timers = createTimerHarness();
  await startBookmarksPage(baseDeps(doc, observers, timers));

  assert.equal(article.querySelector("[data-twitter-bookmarker-saved]"), null);
  markTweetSaved("1234567890");
  assert.equal(isTweetSaved("1234567890"), true);
  assert.ok(article.querySelector("[data-twitter-bookmarker-saved]"));
});
