// Backend credential resolution (PRD §50).
//
// The token exists for custom targets that do not look local to the backend: a
// tunnel adds forwarding headers, a LAN bind is not loopback at all, and an
// extension cannot answer the browser password dialog the backend would otherwise
// ask for. These tests pin the resolution rules and the header shape.

import test from "node:test";
import assert from "node:assert/strict";

import {
  authHeaders,
  normalizeBackendToken,
  resolveBackendToken,
} from "../src/shared/backend-token.ts";

test("normalizeBackendToken trims and drops a pasted Bearer prefix", () => {
  assert.equal(normalizeBackendToken("abc123"), "abc123");
  assert.equal(normalizeBackendToken("  abc123  "), "abc123");
  assert.equal(normalizeBackendToken("Bearer abc123"), "abc123");
  assert.equal(normalizeBackendToken("bearer   abc123"), "abc123", "the scheme is case-insensitive");
  // A token that merely starts with the word is left alone once the prefix has
  // been consumed; this is a trim, not a parser.
  assert.equal(normalizeBackendToken("bearer"), "bearer");
});

test("normalizeBackendToken refuses everything that is not a string", () => {
  for (const value of [undefined, null, 0, 42, true, {}, [], () => {}]) {
    assert.equal(normalizeBackendToken(value), "", `${JSON.stringify(value)} must normalize to empty`);
  }
});

test("resolveBackendToken only applies to a custom target", () => {
  const token = "s3cret-token";

  // The loopback default is exempt on the backend side, so carrying a credential
  // there would put a secret in flight for nothing.
  assert.equal(resolveBackendToken({ backendMode: "localhost", backendToken: token }), "");
  assert.equal(resolveBackendToken({ backendMode: "custom", backendToken: token }), token);
  assert.equal(resolveBackendToken({ backendMode: "custom", backendToken: "  Bearer x  " }), "x");
  assert.equal(resolveBackendToken({ backendMode: "custom", backendToken: "" }), "");
  assert.equal(resolveBackendToken({ backendMode: "custom", backendToken: undefined }), "");
});

test("authHeaders is empty without a token, and a single header with one", () => {
  assert.deepEqual(authHeaders(""), {});
  assert.deepEqual(authHeaders("abc123"), { Authorization: "Bearer abc123" });
});
