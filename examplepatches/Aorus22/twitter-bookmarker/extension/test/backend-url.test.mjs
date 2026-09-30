// Backend address parsing/resolution tests (PRD §5, §50).
//
// These are pure functions: no `chrome.*`, no `fetch`. Everything the popup
// accepts, rejects, or falls back to is pinned here, because a mistake here
// silently sends bookmark data to the wrong host — or to no host at all.

import test from "node:test";
import assert from "node:assert/strict";

import {
  BACKEND_MODES,
  normalizeBackendMode,
  normalizeBackendUrl,
  resolveBackendBaseUrl,
} from "../src/shared/backend-url.ts";
import { DEFAULT_BACKEND_BASE_URL, DEFAULT_SETTINGS } from "../src/shared/constants.ts";

test("normalizeBackendMode accepts only the two documented modes", () => {
  assert.deepEqual([...BACKEND_MODES], ["localhost", "custom"]);
  assert.equal(normalizeBackendMode("custom"), "custom");
  assert.equal(normalizeBackendMode("localhost"), "localhost");
  for (const value of ["Custom", "CUSTOM", "", "bogus", undefined, null, 3, {}]) {
    assert.equal(normalizeBackendMode(value), "localhost", `${JSON.stringify(value)} clamps to localhost`);
  }
});

test("normalizeBackendUrl defaults the scheme for host:port input", () => {
  assert.equal(normalizeBackendUrl("127.0.0.1:43121"), "http://127.0.0.1:43121");
  assert.equal(normalizeBackendUrl("localhost:8080"), "http://localhost:8080");
  assert.equal(normalizeBackendUrl("  localhost:8080  "), "http://localhost:8080");
  assert.equal(normalizeBackendUrl("x.com"), "http://x.com");
});

test("normalizeBackendUrl keeps http(s) origins and base paths, minus the trailing slash", () => {
  assert.equal(normalizeBackendUrl("http://192.168.1.5:8080/"), "http://192.168.1.5:8080");
  assert.equal(normalizeBackendUrl("https://server.example/base/"), "https://server.example/base");
  assert.equal(normalizeBackendUrl("https://server.example/base//"), "https://server.example/base");
  assert.equal(normalizeBackendUrl("HTTP://Host:8080/Base/"), "http://host:8080/Base", "host is lowercased");
  assert.equal(normalizeBackendUrl("http://host"), "http://host");
});

test("normalizeBackendUrl drops a query and a fragment", () => {
  assert.equal(normalizeBackendUrl("http://host/path?token=1#frag"), "http://host/path");
});

test("normalizeBackendUrl rejects anything that is not a usable http(s) base URL", () => {
  for (const value of [
    "",
    "   ",
    undefined,
    null,
    42,
    {},
    "ftp://server/file",
    "file:///etc/passwd",
    "javascript:alert(1)",
    "data:text/html,<b>x</b>",
    "http://user:pass@host",
    "http://",
    "not a url",
    "http://exa mple.com",
  ]) {
    assert.equal(normalizeBackendUrl(value), null, `${JSON.stringify(value)} must be rejected`);
  }
});

test("resolveBackendBaseUrl picks the mode's address and never returns junk", () => {
  assert.equal(
    resolveBackendBaseUrl({ backendMode: "localhost", backendUrl: "" }),
    DEFAULT_BACKEND_BASE_URL,
  );
  assert.equal(
    resolveBackendBaseUrl({ backendMode: "localhost", backendUrl: "https://ignored.example" }),
    DEFAULT_BACKEND_BASE_URL,
    "the saved custom URL never leaks into Localhost mode",
  );
  assert.equal(
    resolveBackendBaseUrl({ backendMode: "custom", backendUrl: "192.168.1.10:8080/" }),
    "http://192.168.1.10:8080",
  );
  assert.equal(
    resolveBackendBaseUrl({ backendMode: "custom", backendUrl: "   " }),
    DEFAULT_BACKEND_BASE_URL,
    "an empty custom URL falls back rather than producing a relative fetch",
  );
  assert.equal(
    resolveBackendBaseUrl({ backendMode: "custom", backendUrl: "ftp://nope" }),
    DEFAULT_BACKEND_BASE_URL,
  );

  // The shipped defaults resolve to the loopback server.
  assert.equal(resolveBackendBaseUrl(DEFAULT_SETTINGS), DEFAULT_BACKEND_BASE_URL);
});
