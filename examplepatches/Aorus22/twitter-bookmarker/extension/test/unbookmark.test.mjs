// Phase 5 native unbookmark trigger + verification tests (UNB-02, PRD §37/§38).
//
// `unbookmarkTweet` is driven against the fake DOM with an injected observer and
// a tiny timeout, so every outcome is deterministic and fast:
//   - control flips to `[data-testid="bookmark"]` -> "removed"
//   - article detaches from the document          -> "removed"
//   - nothing changes before the deadline         -> "failed"
//
// The click itself is never treated as success: each case asserts on the
// observed state, not on the click.

import test from "node:test";
import assert from "node:assert/strict";

import { UNBOOKMARK_VERIFY_TIMEOUT_MS, unbookmarkTweet } from "../src/content/unbookmark.ts";
import { createDocument } from "./helpers/fake-dom.mjs";
import { createFakeObserverFactory } from "./helpers/fake-observer.mjs";
import { createTweetDocument } from "./helpers/tweet-fixtures.mjs";

/** A tweet whose native control is in the bookmarked (`removeBookmark`) state. */
function bookmarkedTweet() {
  return createTweetDocument({ text: "hello world", alreadyBookmarked: true });
}

test("returns 'removed' when the control flips to the unbookmarked representation (UNB-02)", async () => {
  const { article } = bookmarkedTweet();
  const control = article.querySelector('[data-testid="removeBookmark"]');
  assert.ok(control, "fixture must start bookmarked");

  const factory = createFakeObserverFactory();
  let clicks = 0;
  control.addEventListener("click", () => {
    clicks += 1;
    // X's React handler swaps the control's testid in place.
    control.setAttribute("data-testid", "bookmark");
    factory.triggerAll();
  });

  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 500 });

  assert.equal(result, "removed");
  assert.equal(clicks, 1, "the native control is clicked exactly once");
  assert.equal(factory.observers.length, 1);
  assert.equal(factory.observers[0].observes[0][0], article, "the observer is scoped to the tweet article");
  assert.equal(factory.observers[0].disconnected, true, "the observer is disconnected in finally");
});

test("returns 'removed' when the article detaches from the document (UNB-02)", async () => {
  const { article } = bookmarkedTweet();
  const control = article.querySelector('[data-testid="removeBookmark"]');
  const factory = createFakeObserverFactory();

  control.addEventListener("click", () => {
    // X removes the row from the bookmarks timeline instead of flipping it.
    article.remove();
    factory.triggerAll();
  });

  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 500 });

  assert.equal(result, "removed");
  assert.equal(article.isConnected, false);
  assert.equal(factory.observers[0].observes.length, 2, "the article and its parent are both watched");
});

test("returns 'failed' after the timeout when the state never changes (UNB-02)", async () => {
  const { article } = bookmarkedTweet();
  const factory = createFakeObserverFactory();
  const cleared = [];

  const result = await unbookmarkTweet(article, {
    createObserver: factory.create,
    timeoutMs: 10,
    setTimer: (handler, timeout) => globalThis.setTimeout(handler, timeout),
    clearTimer: (id) => {
      cleared.push(id);
      globalThis.clearTimeout(id);
    },
  });

  assert.equal(result, "failed", "a click without an observed state change is not success");
  assert.equal(
    article.querySelector('[data-testid="removeBookmark"]') !== null,
    true,
    "the control is still in the bookmarked state",
  );
  assert.equal(factory.observers[0].disconnected, true);
  assert.equal(cleared.length, 1, "the verification timer is cleared in finally");
});

test("an already-unbookmarked tweet is never clicked and still reports 'removed'", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: false });
  const control = article.querySelector('[data-testid="bookmark"]');
  const factory = createFakeObserverFactory();
  let clicks = 0;
  control.addEventListener("click", () => {
    clicks += 1;
  });

  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 10 });

  assert.equal(result, "removed", "the goal state already holds");
  assert.equal(clicks, 0, "clicking a non-bookmarked control would add a bookmark");
  assert.equal(factory.observers.length, 0, "nothing is observed when no click is needed");
});

test("a tweet already detached before the attempt reports 'removed'", async () => {
  const { article } = bookmarkedTweet();
  article.remove();

  const factory = createFakeObserverFactory();
  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 10 });

  assert.equal(result, "removed");
  assert.equal(factory.observers.length, 0);
});

test("a tweet with no native bookmark control reports 'failed' without throwing", async () => {
  const doc = createDocument();
  const article = doc.createElement("article");
  article.setAttribute("data-testid", "tweet");
  const inner = doc.createElement("div");
  article.appendChild(inner);
  doc.body.appendChild(article);

  const factory = createFakeObserverFactory();
  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 10 });

  assert.equal(result, "failed");
  assert.equal(factory.observers.length, 0, "nothing is observed when there is nothing to click");
});

test("a throwing native click resolves 'failed', disconnects, and never rejects", async () => {
  const { article } = bookmarkedTweet();
  const control = article.querySelector('[data-testid="removeBookmark"]');
  control.click = () => {
    throw new Error("boom");
  };

  const factory = createFakeObserverFactory();
  const result = await unbookmarkTweet(article, { createObserver: factory.create, timeoutMs: 10 });

  assert.equal(result, "failed");
  assert.equal(factory.observers[0].disconnected, true);
});

test("an observer that throws on construction degrades to the timeout backstop", async () => {
  const { article } = bookmarkedTweet();
  const control = article.querySelector('[data-testid="removeBookmark"]');
  control.addEventListener("click", () => {
    control.setAttribute("data-testid", "bookmark");
  });

  const result = await unbookmarkTweet(article, {
    createObserver: () => {
      throw new Error("no observer");
    },
    timeoutMs: 10,
  });

  // The flip happened synchronously during the click, so the post-click check
  // (not the observer) is what observed it.
  assert.equal(result, "removed");
});

test("the verification budget is the documented ~2s", () => {
  assert.equal(UNBOOKMARK_VERIFY_TIMEOUT_MS, 2000);
});
