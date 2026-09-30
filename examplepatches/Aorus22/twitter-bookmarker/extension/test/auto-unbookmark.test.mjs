// Phase 5 gate + failure-handling tests (UNB-01, UNB-03, PRD §37/§38/§41).
//
// Two layers are exercised:
//   1. `createSavedHook` (the `onSaved` body) — the `unbookmarkAfterSave` gate.
//   2. `createSaveController` — proves the hook is reachable only from the
//      confirmed-`201` branch and that a failed unbookmark never regresses the
//      saved state.

import test from "node:test";
import assert from "node:assert/strict";

import { createSaveController, savedToast } from "../src/content/save-controller.ts";
import { createSavedHook, unbookmarkFailedToast } from "../src/content/index.ts";
import { unbookmarkTweet } from "../src/content/unbookmark.ts";
import { EXTRACTION_ERROR } from "../src/content/tweet-extractor.ts";
import { createFakeObserverFactory } from "./helpers/fake-observer.mjs";
import { createTweetDocument } from "./helpers/tweet-fixtures.mjs";

const CATEGORY = { id: "cat-linux", name: "Linux", slug: "linux", color: "#10b981", order: 0 };
const TWEET_ID = "123456";
const EXTRACTED = {
  url: "https://x.com/foo/status/123456",
  author: "Foo Bar",
  username: "@foo",
  tweetDate: "2026-09-27T01:00:00.000Z",
  text: "hello",
  media: ["https://pbs.twimg.com/media/AAA.jpg"],
  tweetId: TWEET_ID,
};
const SAVED_RESPONSE = {
  ok: true,
  result: {
    status: "saved",
    tweet_id: TWEET_ID,
    url: EXTRACTED.url,
    slug: "linux",
    saved_at: "2026-09-27T01:05:00Z",
  },
};
const DUPLICATE_RESPONSE = { ok: true, duplicate: { status: "duplicate", tweet_id: TWEET_ID } };

const WARNING = "Saved to Linux, but failed to remove from X bookmarks";
const flush = () => new Promise((resolve) => globalThis.setTimeout(resolve, 0));
const settings = (unbookmarkAfterSave) => ({ unbookmarkAfterSave, displayMode: "inline" });
const context = (article) => ({ article, tweetId: TWEET_ID, category: CATEGORY, savedAt: "2026-09-27T01:05:00Z" });

/* -------------------------------------------------------------------------- */
/* UNB-01 — the setting gate                                                  */
/* -------------------------------------------------------------------------- */

test("unbookmarkAfterSave=false performs ZERO bookmark-control interaction (UNB-01)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  const control = article.querySelector('[data-testid="removeBookmark"]');
  let clicks = 0;
  control.addEventListener("click", () => {
    clicks += 1;
  });

  const factory = createFakeObserverFactory();
  let invocations = 0;
  const toasts = [];
  const hook = createSavedHook({
    settings: () => settings(false),
    unbookmark: (tweet) => {
      invocations += 1;
      return unbookmarkTweet(tweet, { createObserver: factory.create, timeoutMs: 10 });
    },
    toast: (kind, message) => toasts.push([kind, message]),
  });

  await hook(context(article));

  assert.equal(invocations, 0, "the unbookmark path is never entered");
  assert.equal(clicks, 0, "the native bookmark control is never clicked");
  assert.equal(factory.observers.length, 0, "the bookmark control is never even observed");
  assert.deepEqual(toasts, []);
});

test("unbookmarkAfterSave=true invokes the unbookmark path exactly once (UNB-01)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  let invocations = 0;
  const toasts = [];
  const hook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => {
      invocations += 1;
      return "removed";
    },
    toast: (kind, message) => toasts.push([kind, message]),
  });

  await hook(context(article));

  assert.equal(invocations, 1);
  assert.deepEqual(toasts, [], "a successful removal adds no toast");
});

test("the gate reads live settings, so a mid-session toggle is honored", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  let enabled = false;
  let invocations = 0;
  const hook = createSavedHook({
    settings: () => settings(enabled),
    unbookmark: async () => {
      invocations += 1;
      return "removed";
    },
    toast: () => {},
  });

  await hook(context(article));
  assert.equal(invocations, 0);
  enabled = true;
  await hook(context(article));
  assert.equal(invocations, 1);
});

/* -------------------------------------------------------------------------- */
/* UNB-03 — failure handling                                                  */
/* -------------------------------------------------------------------------- */

test("a 'failed' verification emits the exact PRD §38 warning toast (UNB-03)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  const toasts = [];
  const hook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => "failed",
    toast: (kind, message) => toasts.push([kind, message]),
  });

  await hook(context(article));

  assert.deepEqual(toasts, [["warning", WARNING]]);
  assert.equal(unbookmarkFailedToast("Linux"), WARNING);
});

test("a throwing verification warns and never rejects (UNB-03)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  const toasts = [];
  const errors = [];
  const hook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => {
      throw new Error("verifier exploded");
    },
    toast: (kind, message) => toasts.push([kind, message]),
    onVerificationError: (error) => errors.push(error),
  });

  await assert.doesNotReject(hook(context(article)));
  assert.equal(errors.length, 1);
  assert.deepEqual(toasts, [["warning", WARNING]]);
});

/* -------------------------------------------------------------------------- */
/* UNB-01 — the hook is reachable only from the confirmed-201 branch          */
/* -------------------------------------------------------------------------- */

test("only a confirmed 201 invokes the post-success hook (UNB-01, PRD §41)", async () => {
  for (const [label, response] of [
    ["duplicate 409", DUPLICATE_RESPONSE],
    ["backend unavailable", { ok: false, error: "backend_unavailable" }],
    ["invalid request", { ok: false, error: "invalid_request" }],
    ["internal error", { ok: false, error: "internal" }],
  ]) {
    const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
    let hookCalls = 0;
    const onSelect = createSaveController({
      settings: settings(true),
      onSaved: () => {
        hookCalls += 1;
      },
      sendMessage: async () => response,
      extract: () => ({ ok: true, tweet: EXTRACTED }),
      toast: () => {},
      setSaving: () => {},
      setSaved: () => {},
    });

    onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
    await flush();

    assert.equal(hookCalls, 0, `${label} must never invoke the unbookmark hook`);
  }
});

/* -------------------------------------------------------------------------- */
/* UNB-03 — end-to-end through the controller                                 */
/* -------------------------------------------------------------------------- */

test("an extraction failure never reaches the unbookmark path (XI-12, UNB-01)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  let sendCalls = 0;
  let unbookmarkCalls = 0;
  const toasts = [];

  const hook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => {
      unbookmarkCalls += 1;
      return "removed";
    },
    toast: (kind, message) => toasts.push([kind, message]),
  });

  const onSelect = createSaveController({
    settings: settings(true),
    onSaved: hook,
    sendMessage: async () => {
      sendCalls += 1;
      return SAVED_RESPONSE;
    },
    extract: () => ({ ok: false, reason: "missing_username" }),
    toast: (kind, message) => toasts.push([kind, message]),
    setSaving: () => {},
    setSaved: () => {},
  });

  onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
  await flush();
  await flush();

  assert.equal(sendCalls, 0, "no SAVE_TWEET is sent for unreadable metadata");
  assert.equal(unbookmarkCalls, 0, "an extraction failure must never unbookmark");
  assert.deepEqual(toasts, [["error", EXTRACTION_ERROR]]);
});

test("201 + failed unbookmark keeps '✓ Saved' and the success toast (UNB-03)", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  const saved = [];
  const saving = [];
  const toasts = [];
  const savedHooks = [];

  const failingHook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => "failed",
    toast: (kind, message) => toasts.push([kind, message]),
  });

  const onSelect = createSaveController({
    settings: settings(true),
    onSaved: (savedContext) => {
      savedHooks.push(savedContext);
      return failingHook(savedContext);
    },
    sendMessage: async () => SAVED_RESPONSE,
    extract: () => ({ ok: true, tweet: EXTRACTED }),
    toast: (kind, message) => toasts.push([kind, message]),
    setSaving: (tweetId, value) => saving.push([tweetId, value]),
    setSaved: (tweetId) => saved.push(tweetId),
  });

  onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
  await flush();
  await flush();

  assert.deepEqual(saved, [TWEET_ID], "the tweet stays marked saved");
  assert.equal(savedHooks.length, 1);
  assert.deepEqual(saving, [[TWEET_ID, true]], "a failed unbookmark never restores the controls");
  assert.deepEqual(
    toasts,
    [
      ["success", savedToast("Linux")],
      ["warning", WARNING],
    ],
    "the success toast lands first; the warning never regresses the saved state",
  );
});

test("201 + successful unbookmark keeps the saved state and adds no warning", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  const saved = [];
  const toasts = [];

  const hook = createSavedHook({
    settings: () => settings(true),
    unbookmark: async () => "removed",
    toast: (kind, message) => toasts.push([kind, message]),
  });

  const onSelect = createSaveController({
    settings: settings(true),
    onSaved: hook,
    sendMessage: async () => SAVED_RESPONSE,
    extract: () => ({ ok: true, tweet: EXTRACTED }),
    toast: (kind, message) => toasts.push([kind, message]),
    setSaving: () => {},
    setSaved: (tweetId) => saved.push(tweetId),
  });

  onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
  await flush();

  assert.deepEqual(saved, [TWEET_ID]);
  assert.deepEqual(toasts, [["success", savedToast("Linux")]]);
});

test("a pending unbookmark never holds the in-flight guard hostage", async () => {
  const { article } = createTweetDocument({ text: "hi", alreadyBookmarked: true });
  let release;
  const pending = new Promise((resolve) => {
    release = resolve;
  });
  let requests = 0;

  const onSelect = createSaveController({
    settings: settings(true),
    onSaved: () => pending,
    sendMessage: async () => {
      requests += 1;
      return SAVED_RESPONSE;
    },
    extract: () => ({ ok: true, tweet: EXTRACTED }),
    toast: () => {},
    setSaving: () => {},
    setSaved: () => {},
  });

  onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
  await flush();

  // The unbookmark is still unresolved, yet the guard was released in `finally`.
  onSelect(CATEGORY, { article, tweetId: TWEET_ID, source: article });
  await flush();

  assert.equal(requests, 2, "the in-flight guard is released independently of the unbookmark await");
  release();
});
