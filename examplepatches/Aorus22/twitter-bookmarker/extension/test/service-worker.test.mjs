// Service-worker message router tests (SAVE-01/SAVE-02, PRD §25/§21/§39/§50).
//
// Stubs the `chrome.runtime` + `chrome.storage.local` surface the worker uses,
// stubs `fetch`, and asserts the worker answers every message with a documented
// shape — including transport failures — and never throws out of the listener.
// The worker resolves its backend address from storage on every message, so the
// stored settings are part of the fixture.

import test, { afterEach } from "node:test";
import assert from "node:assert/strict";

const realFetch = globalThis.fetch;

let listener = null;
/** The single stored `Store` object, or `null` for "first run". */
let storedStore = null;

globalThis.chrome = {
  runtime: {
    onInstalled: { addListener() {} },
    onMessage: {
      addListener(handler) {
        listener = handler;
      },
    },
  },
  storage: {
    local: {
      async get(key) {
        if (storedStore === null) return {};
        return typeof key === "string" ? { [key]: structuredClone(storedStore) } : {};
      },
      async set(items) {
        for (const value of Object.values(items)) storedStore = structuredClone(value);
      },
    },
    onChanged: { addListener() {}, removeListener() {} },
  },
};

/** Persist settings the way the popup would, under the one documented key. */
async function storeSettings(settings) {
  await globalThis.chrome.storage.local.set({
    twitterBookmarker: { version: 2, settings, categories: [] },
  });
}

// The worker registers its listener at import time, so `chrome` must be stubbed
// first.
await import("../src/background/service-worker.ts");

afterEach(() => {
  globalThis.fetch = realFetch;
  storedStore = null;
});

function jsonResponse(status, body) {
  return {
    ok: status >= 200 && status < 300,
    status,
    async json() {
      return body;
    },
  };
}

function captureFetch(responder) {
  const calls = [];
  globalThis.fetch = async (url, init) => {
    calls.push({ url, init });
    return responder(url, init);
  };
  return calls;
}

/** Invoke the registered listener and collect both the sync return and the async response. */
function dispatch(message) {
  let returned;
  const response = new Promise((resolve) => {
    returned = listener(message, {}, (value) => resolve(value));
  });
  return { returned, response };
}

test("HEALTH_CHECK resolves { ok, connected } from GET /health", async () => {
  const calls = captureFetch(() => jsonResponse(200, { status: "ok" }));

  const { returned, response } = dispatch({ type: "HEALTH_CHECK" });
  assert.equal(returned, true, "the channel stays open for the async answer");
  assert.deepEqual(await response, { ok: true, connected: true });
  assert.match(calls[0].url, /\/health$/);
});

test("every request follows the stored backend target (PRD §50)", async () => {
  // Default: no stored settings at all -> the loopback default.
  const localCalls = captureFetch(() => jsonResponse(200, { status: "ok" }));
  await dispatch({ type: "HEALTH_CHECK" }).response;
  assert.equal(localCalls[0].url, "http://127.0.0.1:43121/health");

  // Custom mode -> the user-saved address, base path included.
  await storeSettings({ backendMode: "custom", backendUrl: "https://server.example/tw-bookmarker" });

  const customCalls = captureFetch(() => jsonResponse(200, { status: "ok" }));
  await dispatch({ type: "HEALTH_CHECK" }).response;
  assert.equal(customCalls[0].url, "https://server.example/tw-bookmarker/health");

  const indexCalls = captureFetch(() => jsonResponse(200, { items: {} }));
  await dispatch({ type: "GET_SAVED_INDEX" }).response;
  assert.equal(indexCalls[0].url, "https://server.example/tw-bookmarker/v1/index");

  const saveCalls = captureFetch(() => jsonResponse(201, { status: "saved", tweet_id: "1", url: "u", slug: "s", saved_at: "t" }));
  await dispatch({
    type: "SAVE_TWEET",
    payload: { slug: "s", name: "S", tweet: { url: "u", media: [], author: "a", username: "@a", tweet_date: "t", text: "" } },
  }).response;
  assert.equal(saveCalls[0].url, "https://server.example/tw-bookmarker/v1/bookmarks");

  // A malformed stored URL falls back to loopback rather than failing the request.
  await storeSettings({ backendMode: "custom", backendUrl: "not a url" });
  const fallbackCalls = captureFetch(() => jsonResponse(200, { status: "ok" }));
  await dispatch({ type: "HEALTH_CHECK" }).response;
  assert.equal(fallbackCalls[0].url, "http://127.0.0.1:43121/health");
});

test("a stored token rides along on every message (PRD §50)", async () => {
  // Custom target plus a token: the worker is the only place that talks to the
  // backend, so this is where the credential has to appear.
  await storeSettings({
    backendMode: "custom",
    backendUrl: "https://tw-bookmark.example",
    backendToken: "  Bearer s3cret-token  ",
  });

  const healthCalls = captureFetch(() => jsonResponse(200, { status: "ok" }));
  await dispatch({ type: "HEALTH_CHECK" }).response;
  assert.equal(healthCalls[0].init.headers.Authorization, "Bearer s3cret-token");

  const indexCalls = captureFetch(() => jsonResponse(200, { items: {} }));
  await dispatch({ type: "GET_SAVED_INDEX" }).response;
  assert.equal(indexCalls[0].init.headers.Authorization, "Bearer s3cret-token");

  const saveCalls = captureFetch(
    () => jsonResponse(201, { status: "saved", tweet_id: "1", url: "u", slug: "s", saved_at: "t" }),
  );
  await dispatch({
    type: "SAVE_TWEET",
    payload: {
      slug: "s",
      name: "S",
      tweet: { url: "u", media: [], author: "a", username: "@a", tweet_date: "t", text: "" },
    },
  }).response;
  assert.equal(saveCalls[0].init.headers.Authorization, "Bearer s3cret-token");

  // Switching back to Localhost drops it: that target is never challenged, so
  // sending a secret to it would be pointless traffic.
  await storeSettings({ backendMode: "localhost" });
  const backToLocal = captureFetch(() => jsonResponse(200, { status: "ok" }));
  await dispatch({ type: "HEALTH_CHECK" }).response;
  assert.equal("Authorization" in backToLocal[0].init.headers, false);
});

test("GET_SAVED_INDEX resolves the parsed index", async () => {
  const body = { items: { 123456: { url: "u", slug: "linux", saved_at: "t" } } };
  captureFetch(() => jsonResponse(200, body));

  const { response } = dispatch({ type: "GET_SAVED_INDEX" });
  assert.deepEqual(await response, { ok: true, index: body });
});

test("GET_SAVED_INDEX resolves a typed backend_unavailable failure instead of throwing", async () => {
  globalThis.fetch = async () => {
    throw new TypeError("fetch failed");
  };

  const { response } = dispatch({ type: "GET_SAVED_INDEX" });
  assert.deepEqual(await response, { ok: false, index: null, error: "backend_unavailable" });
});

test("SAVE_TWEET forwards the payload and resolves 201/409/5xx to typed shapes", async () => {
  const payload = {
    slug: "linux",
    name: "Linux",
    tweet: {
      url: "https://x.com/foo/status/123456",
      media: ["https://pbs.twimg.com/media/AAA.jpg"],
      author: "Foo, Bar",
      username: "@foo",
      tweet_date: "2026-09-27T01:00:00.000Z",
      text: "hi",
    },
  };
  const savedBody = {
    status: "saved",
    tweet_id: "123456",
    url: payload.tweet.url,
    slug: "linux",
    saved_at: "2026-09-27T01:05:00Z",
  };

  let calls = captureFetch(() => jsonResponse(201, savedBody));
  assert.deepEqual(await dispatch({ type: "SAVE_TWEET", payload }).response, {
    ok: true,
    result: savedBody,
  });
  assert.equal(calls[0].url.endsWith("/v1/bookmarks"), true);
  assert.deepEqual(JSON.parse(calls[0].init.body), payload, "the worker forwards the exact payload");

  calls = captureFetch(() => jsonResponse(409, { status: "duplicate", tweet_id: "123456" }));
  assert.deepEqual(await dispatch({ type: "SAVE_TWEET", payload }).response, {
    ok: true,
    duplicate: { status: "duplicate", tweet_id: "123456" },
  });

  captureFetch(() => jsonResponse(500, { error: "boom" }));
  assert.deepEqual(await dispatch({ type: "SAVE_TWEET", payload }).response, {
    ok: false,
    error: "internal",
  });

  captureFetch(() => jsonResponse(400, { error: "bad slug" }));
  assert.deepEqual(await dispatch({ type: "SAVE_TWEET", payload }).response, {
    ok: false,
    error: "invalid_request",
  });
});

test("an unknown message is ignored (returns false, sends nothing)", () => {
  const { returned } = dispatch({ type: "NOT_A_MESSAGE" });
  assert.equal(returned, false);
});
