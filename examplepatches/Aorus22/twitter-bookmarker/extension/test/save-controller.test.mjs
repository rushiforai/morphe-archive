// Save state machine tests (SAVE-03..SAVE-07, PRD §35/§36/§39–§42).
//
// Drives `createSaveController` with a stubbed message sender, extractor, toast,
// and DOM seams so every transition and the double-click guard are deterministic.

import test from "node:test";
import assert from "node:assert/strict";

import {
  ALREADY_SAVED_TOAST,
  BACKEND_UNAVAILABLE_TOAST,
  COULD_NOT_SAVE_TOAST,
  createSaveController,
  savedToast,
} from "../src/content/save-controller.ts";
import { EXTRACTION_ERROR } from "../src/content/tweet-extractor.ts";
import { createTweetDocument } from "./helpers/tweet-fixtures.mjs";

const CATEGORY = { id: "cat-linux", name: "Linux", slug: "linux", color: "#10b981", order: 0 };
const TWEET_ID = "123456";

const SAVED_RESPONSE = {
  ok: true,
  result: {
    status: "saved",
    tweet_id: TWEET_ID,
    url: "https://x.com/foo/status/123456",
    slug: "linux",
    saved_at: "2026-09-27T01:05:00Z",
  },
};
const DUPLICATE_RESPONSE = { ok: true, duplicate: { status: "duplicate", tweet_id: TWEET_ID } };

const flush = () => new Promise((resolve) => globalThis.setTimeout(resolve, 0));

/** A fixture tweet whose extracted fields are fully known. */
function sampleArticle() {
  return createTweetDocument({
    text: "Line one\n\nLine two",
    author: "Foo, Bar 🐧",
    username: "@foo",
    href: "/foo/status/123456",
    datetime: "2026-09-27T01:00:00.000Z",
    media: ["https://pbs.twimg.com/media/AAA?format=jpg&name=small"],
  }).article;
}

function createHarness(overrides = {}) {
  const calls = [];
  const saving = [];
  const saved = [];
  const toasts = [];
  const extractionErrors = [];
  const savedHooks = [];

  const responder = overrides.sendMessage ?? (async () => overrides.response);

  const onSelect = createSaveController({
    settings: { unbookmarkAfterSave: false, displayMode: "inline" },
    onSaved: (context) => savedHooks.push(context),
    onExtractionError: (_article, reason) => extractionErrors.push(reason),
    extract: overrides.extract,
    sendMessage: async (message) => {
      calls.push(message);
      return responder(message);
    },
    toast: (kind, message) => toasts.push([kind, message]),
    setSaving: (tweetId, value) => saving.push([tweetId, value]),
    setSaved: (tweetId) => saved.push(tweetId),
  });

  return { onSelect, calls, saving, saved, toasts, extractionErrors, savedHooks };
}

function context(article) {
  return { article, tweetId: TWEET_ID, source: article };
}

/* -------------------------------------------------------------------------- */
/* SAVE-03 — saving state + double-click guard                                */
/* -------------------------------------------------------------------------- */

test("a click disables the controls synchronously and a second click starts no second request (SAVE-03)", async () => {
  const article = sampleArticle();
  let resolvers = [];
  const h = createHarness({
    sendMessage: (message) => new Promise((resolve) => resolvers.push(resolve)),
  });

  h.onSelect(CATEGORY, context(article));

  assert.deepEqual(h.saving, [[TWEET_ID, true]], "controls are disabled before the request resolves");
  assert.deepEqual(h.saved, [], "nothing is marked saved while in flight");
  assert.equal(h.calls.length, 1);

  h.onSelect(CATEGORY, context(article));
  h.onSelect(CATEGORY, context(article));
  assert.equal(h.calls.length, 1, "the in-flight guard collapses rapid clicks into one request");

  resolvers[0](SAVED_RESPONSE);
  await flush();

  // The guard is released in `finally`, so a later interaction can save again.
  h.onSelect(CATEGORY, context(article));
  assert.equal(h.calls.length, 2);
  resolvers[1](DUPLICATE_RESPONSE);
  await flush();
});

test("distinct tweets each get their own request", async () => {
  const h = createHarness({ response: SAVED_RESPONSE });
  const first = createTweetDocument({ text: "one", href: "/a/status/111" }).article;
  const second = createTweetDocument({ text: "two", href: "/b/status/222" }).article;

  h.onSelect(CATEGORY, { article: first, tweetId: "111", source: first });
  h.onSelect(CATEGORY, { article: second, tweetId: "222", source: second });
  await flush();

  assert.equal(h.calls.length, 2);
  assert.deepEqual(h.saved.sort(), ["111", "222"]);
});

/* -------------------------------------------------------------------------- */
/* SAVE-04 — 201                                                              */
/* -------------------------------------------------------------------------- */

test("201 marks saved, toasts the category name, and fires onSaved with snake_case-safe payload (SAVE-04)", async () => {
  const article = sampleArticle();
  const h = createHarness({ response: SAVED_RESPONSE });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.equal(h.calls.length, 1);
  assert.equal(h.calls[0].type, "SAVE_TWEET");
  assert.deepEqual(h.calls[0].payload, {
    slug: "linux",
    name: "Linux",
    tweet: {
      url: "https://x.com/foo/status/123456",
      media: ["https://pbs.twimg.com/media/AAA.jpg"],
      author: "Foo, Bar 🐧",
      username: "@foo",
      tweet_date: "2026-09-27T01:00:00.000Z",
      text: "Line one\n\nLine two",
    },
  });

  assert.deepEqual(h.saving, [[TWEET_ID, true]], "nothing unsets the saving state: the tweet is now saved");
  assert.deepEqual(h.saved, [TWEET_ID]);
  assert.deepEqual(h.toasts, [["success", "Saved to Linux"]]);
  assert.equal(h.savedHooks.length, 1);
  assert.equal(h.savedHooks[0].tweetId, TWEET_ID);
  assert.equal(h.savedHooks[0].category.id, CATEGORY.id);
  assert.equal(h.savedHooks[0].savedAt, "2026-09-27T01:05:00Z");
  assert.equal(h.extractionErrors.length, 0);
});

test("savedToast uses the exact PRD §36 copy", () => {
  assert.equal(savedToast("Linux"), "Saved to Linux");
});

/* -------------------------------------------------------------------------- */
/* SAVE-06 — 409                                                              */
/* -------------------------------------------------------------------------- */

test("409 marks saved and shows the info toast without firing onSaved (SAVE-06)", async () => {
  const article = sampleArticle();
  const h = createHarness({ response: DUPLICATE_RESPONSE });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.deepEqual(h.saved, [TWEET_ID]);
  assert.deepEqual(h.toasts, [["info", ALREADY_SAVED_TOAST]]);
  assert.equal(h.savedHooks.length, 0, "a duplicate is not a fresh save");
  assert.deepEqual(h.saving, [[TWEET_ID, true]]);
});

/* -------------------------------------------------------------------------- */
/* SAVE-05 — backend unavailable / invalid / internal                         */
/* -------------------------------------------------------------------------- */

test("a thrown sendExtensionMessage restores the controls and shows 'Backend unavailable' (SAVE-05)", async () => {
  const article = sampleArticle();
  const h = createHarness({
    sendMessage: async () => {
      throw new Error("no_response_from_service_worker");
    },
  });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.deepEqual(h.saving, [
    [TWEET_ID, true],
    [TWEET_ID, false],
  ]);
  assert.deepEqual(h.toasts, [["error", BACKEND_UNAVAILABLE_TOAST]]);
  assert.deepEqual(h.saved, [], "a failure never marks the tweet saved/unbookmarked");
  assert.equal(h.savedHooks.length, 0);
});

test("a resolved backend_unavailable response behaves like a thrown send (SAVE-05)", async () => {
  const article = sampleArticle();
  const h = createHarness({ response: { ok: false, error: "backend_unavailable" } });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.deepEqual(h.saving, [
    [TWEET_ID, true],
    [TWEET_ID, false],
  ]);
  assert.deepEqual(h.toasts, [["error", BACKEND_UNAVAILABLE_TOAST]]);
  assert.deepEqual(h.saved, []);
  assert.equal(h.savedHooks.length, 0);
});

test("invalid_request and internal restore the controls and show 'Could not save tweet' (SAVE-07)", async () => {
  for (const error of ["invalid_request", "internal"]) {
    const article = sampleArticle();
    const h = createHarness({ response: { ok: false, error } });

    h.onSelect(CATEGORY, context(article));
    await flush();

    assert.deepEqual(h.saving, [
      [TWEET_ID, true],
      [TWEET_ID, false],
    ]);
    assert.deepEqual(h.toasts, [["error", COULD_NOT_SAVE_TOAST]], error);
    assert.deepEqual(h.saved, []);
    assert.equal(h.savedHooks.length, 0);
  }
});

/* -------------------------------------------------------------------------- */
/* Extraction failure (PRD §40)                                               */
/* -------------------------------------------------------------------------- */

test("an extraction failure restores the controls, toasts, and sends no partial record", async () => {
  const article = sampleArticle();
  const h = createHarness({
    response: SAVED_RESPONSE,
    extract: () => ({ ok: false, reason: "missing_username" }),
  });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.equal(h.calls.length, 0, "no SAVE_TWEET is sent for unreadable metadata");
  assert.deepEqual(h.saving, [
    [TWEET_ID, true],
    [TWEET_ID, false],
  ]);
  assert.deepEqual(h.extractionErrors, ["missing_username"]);
  assert.deepEqual(h.toasts, [["error", EXTRACTION_ERROR]]);
  assert.deepEqual(h.saved, []);
  assert.equal(h.savedHooks.length, 0);
});

test("an extractor that throws is treated as an extraction failure, not a crash", async () => {
  const article = sampleArticle();
  const h = createHarness({
    response: SAVED_RESPONSE,
    extract: () => {
      throw new Error("boom");
    },
  });

  h.onSelect(CATEGORY, context(article));
  await flush();

  assert.equal(h.calls.length, 0);
  assert.equal(h.extractionErrors.length, 1);
  assert.deepEqual(h.toasts, [["error", EXTRACTION_ERROR]]);
});
