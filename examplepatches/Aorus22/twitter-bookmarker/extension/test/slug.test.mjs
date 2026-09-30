import test from "node:test";
import assert from "node:assert/strict";

import { SLUG_PATTERN, isValidSlug, shortId, slugify } from "../src/shared/slug.ts";

const UUID = "3f2504e0-4f89-11d3-9a0c-0305e82c3301";

test("PRD §8 examples produce the exact expected slugs", () => {
  assert.equal(slugify("Linux", UUID), "linux");
  assert.equal(slugify("AI & LLM", UUID), "ai-llm");
  assert.equal(slugify("Read Later", UUID), "read-later");
});

test("empty slug falls back to category-<short-id>", () => {
  const slug = slugify("!!!", UUID);
  assert.equal(slug, "category-3f2504e0");
  assert.match(slug, SLUG_PATTERN);
});

test("unicode-only and whitespace-only names fall back too", () => {
  for (const name of ["\u{1F427}", "   ", "***", "&", "---"]) {
    const slug = slugify(name, UUID);
    assert.match(slug, SLUG_PATTERN, `name=${JSON.stringify(name)} -> ${slug}`);
    assert.equal(slug, "category-3f2504e0");
  }
});

test("fallback stays valid even when the id sanitizes to nothing", () => {
  for (const id of ["", "!!!", "%%%", "\u{1F427}"]) {
    const slug = slugify("!!!", id);
    assert.match(slug, SLUG_PATTERN, `id=${JSON.stringify(id)} -> ${slug}`);
  }
});

test("generated slugs always match the backend regex", () => {
  const names = [
    "Linux",
    "AI & LLM",
    "Read Later",
    "  Mixed CASE  ",
    "Café ☕ Notes",
    "a/b\\c",
    "..",
    "../../etc/passwd",
    "~/.ssh",
    "100% Design",
    "f#!@$%^&*()",
    "ééé",
    "hello___world",
    "Leading-trailing-",
    "-leading",
    "-",
    "0",
    "9lives",
  ];

  for (const name of names) {
    const slug = slugify(name, UUID);
    assert.match(slug, SLUG_PATTERN, `name=${JSON.stringify(name)} -> ${slug}`);
    assert.ok(isValidSlug(slug));
  }
});

test("slug rules: lowercase, spaces to '-', unsafe chars stripped, runs collapsed", () => {
  assert.equal(slugify("LINUX", UUID), "linux");
  assert.equal(slugify("  Read   Later  ", UUID), "read-later");
  assert.equal(slugify("a---b", UUID), "a-b");
  assert.equal(slugify("Café", UUID), "cafe");
  assert.equal(slugify("100% Design", UUID), "100-design");
  assert.equal(slugify("-leading-trailing-", UUID), "leading-trailing");
});

test("path-traversal characters can never survive slugging", () => {
  for (const name of ["../../something", "/etc/passwd", "~/.ssh/id_rsa", "..\\..\\win"]) {
    const slug = slugify(name, UUID);
    assert.doesNotMatch(slug, /[/\\~]/);
    assert.doesNotMatch(slug, /\.\./);
    assert.match(slug, SLUG_PATTERN);
  }
});

test("isValidSlug mirrors the backend regex", () => {
  assert.ok(isValidSlug("linux"));
  assert.ok(isValidSlug("ai-llm"));
  assert.ok(isValidSlug("category-3f2504e0"));
  assert.ok(!isValidSlug("Linux"));
  assert.ok(!isValidSlug("../linux"));
  assert.ok(!isValidSlug("linux.txt"));
  assert.ok(!isValidSlug("linux.csv"));
  assert.ok(!isValidSlug(""));
  assert.ok(!isValidSlug("-linux"));
  assert.ok(!isValidSlug("linux slug"));
  // The backend regex allows a trailing/doubled "-" (the first char may not be
  // "-"); slugify is stricter and never emits one.
  assert.ok(isValidSlug("linux-"));
  assert.equal(slugify("linux-", "11111111-1111"), "linux");
});

test("shortId is deterministic, lowercase, and alphanumeric", () => {
  assert.equal(shortId(UUID), "3f2504e0");
  assert.equal(shortId("ABCDEFGH-IJKL"), "abcdefgh");
  assert.equal(shortId(""), "00000000");
});
