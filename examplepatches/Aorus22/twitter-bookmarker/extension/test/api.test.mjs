// Backend HTTP client tests (PRD §17–§21, §25; SAVE-01/SAVE-02).
//
// `globalThis.fetch` is stubbed so every branch of the status → BgError mapping
// is exercised deterministically, without a running backend.

import test, { afterEach } from "node:test";
import assert from "node:assert/strict";

import {
  BackendRequestError,
  BackendUnavailableError,
  bgErrorFrom,
  checkHealth,
  fetchSavedIndex,
  postBookmark,
} from "../src/shared/api.ts";
import { savedIndexToSet } from "../src/shared/messages.ts";

const realFetch = globalThis.fetch;

afterEach(() => {
  globalThis.fetch = realFetch;
});

/** Minimal `Response` stand-in: only the fields the client reads. */
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

const HEALTH_OK = { status: "ok" };
const SAVED_BODY = {
  status: "saved",
  tweet_id: "123456",
  url: "https://x.com/foo/status/123456",
  slug: "linux",
  saved_at: "2026-09-27T01:05:00Z",
};
const DUPLICATE_BODY = { status: "duplicate", tweet_id: "123456" };
const SAMPLE_REQUEST = {
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

/* -------------------------------------------------------------------------- */
/* health                                                                     */
/* -------------------------------------------------------------------------- */

test("checkHealth is true only for 200 + {status:'ok'}", async () => {
  captureFetch(() => jsonResponse(200, HEALTH_OK));
  assert.equal(await checkHealth(), true);
});

test("checkHealth is false for a non-ok body, a non-200 status, and a transport failure", async () => {
  captureFetch(() => jsonResponse(200, { status: "degraded" }));
  assert.equal(await checkHealth(), false);

  captureFetch(() => jsonResponse(500, HEALTH_OK));
  assert.equal(await checkHealth(), false);

  captureFetch(() => jsonResponse(200, null));
  assert.equal(await checkHealth(), false);

  globalThis.fetch = async () => {
    throw new TypeError("fetch failed");
  };
  assert.equal(await checkHealth(), false, "a dead backend is 'disconnected', not an error");
});

test("every call targets the given base URL, base path included", async () => {
  const calls = captureFetch(() => jsonResponse(200, HEALTH_OK));
  await checkHealth("http://192.168.1.10:8080");
  assert.equal(calls[0].url, "http://192.168.1.10:8080/health");
  assert.equal(calls[0].init.cache, "no-store", "Retry must never read a cached 200");

  const indexCalls = captureFetch(() => jsonResponse(200, { items: {} }));
  await fetchSavedIndex("https://server.example/tw-bookmarker");
  assert.equal(indexCalls[0].url, "https://server.example/tw-bookmarker/v1/index");

  const postCalls = captureFetch(() => jsonResponse(201, SAVED_BODY));
  await postBookmark(SAMPLE_REQUEST, "http://127.0.0.1:9999");
  assert.equal(postCalls[0].url, "http://127.0.0.1:9999/v1/bookmarks");
});

/* -------------------------------------------------------------------------- */
/* the bearer token                                                           */
/* -------------------------------------------------------------------------- */

test("a token is sent as Authorization: Bearer on every endpoint", async () => {
  const token = "s3cret-token";

  const healthCalls = captureFetch(() => jsonResponse(200, HEALTH_OK));
  await checkHealth("https://tw-bookmark.example", token);
  assert.equal(healthCalls[0].init.headers.Authorization, `Bearer ${token}`);

  const indexCalls = captureFetch(() => jsonResponse(200, { items: {} }));
  await fetchSavedIndex("https://tw-bookmark.example", token);
  assert.deepEqual(indexCalls[0].init.headers, { Authorization: `Bearer ${token}` });

  const postCalls = captureFetch(() => jsonResponse(201, SAVED_BODY));
  await postBookmark(SAMPLE_REQUEST, "https://tw-bookmark.example", token);
  assert.equal(postCalls[0].init.headers.Authorization, `Bearer ${token}`);
  assert.equal(
    postCalls[0].init.headers["Content-Type"],
    "application/json",
    "the credential must not displace the content type",
  );
});

test("no token means no Authorization header at all", async () => {
  const calls = captureFetch(() => jsonResponse(200, HEALTH_OK));
  await checkHealth("http://127.0.0.1:43121", "");
  assert.equal("Authorization" in calls[0].init.headers, false, "an empty token must not be sent");

  const postCalls = captureFetch(() => jsonResponse(201, SAVED_BODY));
  await postBookmark(SAMPLE_REQUEST, "http://127.0.0.1:43121");
  assert.deepEqual(postCalls[0].init.headers, { "Content-Type": "application/json" });
});

/* -------------------------------------------------------------------------- */
/* POST /v1/bookmarks                                                         */
/* -------------------------------------------------------------------------- */

test("201 maps to kind:'saved' and posts a JSON body", async () => {
  const calls = captureFetch(() => jsonResponse(201, SAVED_BODY));
  const outcome = await postBookmark(SAMPLE_REQUEST);

  assert.equal(outcome.kind, "saved");
  assert.deepEqual(outcome.body, SAVED_BODY);
  assert.equal(calls.length, 1);
  assert.match(calls[0].url, /\/v1\/bookmarks$/);
  assert.equal(calls[0].init.method, "POST");
  assert.equal(calls[0].init.headers["Content-Type"], "application/json");
  assert.deepEqual(JSON.parse(calls[0].init.body), SAMPLE_REQUEST);
});

test("409 maps to kind:'duplicate'", async () => {
  captureFetch(() => jsonResponse(409, DUPLICATE_BODY));
  const outcome = await postBookmark(SAMPLE_REQUEST);
  assert.equal(outcome.kind, "duplicate");
  assert.deepEqual(outcome.body, DUPLICATE_BODY);
});

test("400 maps to invalid_request", async () => {
  captureFetch(() => jsonResponse(400, { error: "invalid slug" }));
  await assert.rejects(postBookmark(SAMPLE_REQUEST), (error) => {
    assert.ok(error instanceof BackendRequestError);
    assert.equal(error.code, "invalid_request");
    assert.equal(error.status, 400);
    assert.equal(bgErrorFrom(error), "invalid_request");
    return true;
  });
});

test("5xx maps to internal", async () => {
  captureFetch(() => jsonResponse(500, { error: "boom" }));
  await assert.rejects(postBookmark(SAMPLE_REQUEST), (error) => {
    assert.ok(error instanceof BackendRequestError);
    assert.equal(error.code, "internal");
    assert.equal(error.status, 500);
    assert.equal(bgErrorFrom(error), "internal");
    return true;
  });
});

test("network failure and abort map to backend_unavailable", async () => {
  globalThis.fetch = async () => {
    throw new TypeError("fetch failed");
  };
  await assert.rejects(postBookmark(SAMPLE_REQUEST), (error) => {
    assert.ok(error instanceof BackendUnavailableError);
    assert.equal(error.code, "backend_unavailable");
    assert.equal(bgErrorFrom(error), "backend_unavailable");
    return true;
  });

  globalThis.fetch = async () => {
    const abort = new Error("The operation was aborted.");
    abort.name = "AbortError";
    throw abort;
  };
  await assert.rejects(postBookmark(SAMPLE_REQUEST), (error) => {
    assert.ok(error instanceof BackendUnavailableError);
    assert.equal(bgErrorFrom(error), "backend_unavailable");
    return true;
  });
});

test("a malformed success body is treated as internal, never as a saved tweet", async () => {
  captureFetch(() => jsonResponse(201, { status: "saved" }));
  await assert.rejects(postBookmark(SAMPLE_REQUEST), (error) => {
    assert.equal(bgErrorFrom(error), "internal");
    return true;
  });
});

/* -------------------------------------------------------------------------- */
/* GET /v1/index                                                              */
/* -------------------------------------------------------------------------- */

test("fetchSavedIndex returns the parsed items record", async () => {
  const body = { items: { 123456: { url: "u", slug: "linux", saved_at: "t" } } };
  const calls = captureFetch(() => jsonResponse(200, body));

  const index = await fetchSavedIndex();
  assert.deepEqual(index, body);
  assert.equal(calls[0].init.method, "GET");
  assert.match(calls[0].url, /\/v1\/index$/);
});

test("fetchSavedIndex failure codes follow the shared mapping", async () => {
  captureFetch(() => jsonResponse(400, {}));
  await assert.rejects(fetchSavedIndex(), (error) => bgErrorFrom(error) === "invalid_request");

  captureFetch(() => jsonResponse(503, {}));
  await assert.rejects(fetchSavedIndex(), (error) => bgErrorFrom(error) === "internal");

  captureFetch(() => jsonResponse(200, { items: "not-an-object" }));
  await assert.rejects(fetchSavedIndex(), (error) => bgErrorFrom(error) === "internal");

  globalThis.fetch = async () => {
    throw new Error("ECONNREFUSED");
  };
  await assert.rejects(fetchSavedIndex(), (error) => bgErrorFrom(error) === "backend_unavailable");
});

test("savedIndexToSet degrades a failed index to an empty Set", () => {
  assert.deepEqual([...savedIndexToSet({ ok: false, index: null, error: "backend_unavailable" })], []);
  assert.deepEqual([...savedIndexToSet({ ok: true, index: null })], []);
  assert.deepEqual(
    [...savedIndexToSet({ ok: true, index: { items: { 1: { url: "u", slug: "f", saved_at: "t" }, 2: { url: "u", slug: "f", saved_at: "t" } } } })].sort(),
    ["1", "2"],
  );
});
