import test from "node:test";
import assert from "node:assert/strict";

import { DEFAULT_CATEGORY_COLOR, DEFAULT_SETTINGS } from "../src/shared/constants.ts";
import {
  applyReorder,
  hasNameConflict,
  nextOrder,
  normalizeColor,
  normalizeDisplayMode,
  normalizeOrder,
  normalizeStore,
} from "../src/shared/storage.ts";
import { isValidSlug } from "../src/shared/slug.ts";

function category(id, name, order, extra = {}) {
  return { id, name, slug: name.toLowerCase(), color: "#4f46e5", order, ...extra };
}

test("normalizeStore returns PRD defaults for empty/missing input", () => {
  for (const raw of [undefined, null, 0, "nope", [], {}]) {
    const store = normalizeStore(raw);
    assert.equal(store.version, 2);
    assert.deepEqual(store.settings, DEFAULT_SETTINGS);
    assert.deepEqual(store.settings, {
      unbookmarkAfterSave: false,
      displayMode: "popover",
      backendMode: "localhost",
      backendUrl: "http://127.0.0.1:43121",
      backendToken: "",
    });
    assert.deepEqual(store.categories, []);
  }
});

test("normalizeStore keeps valid values and rejects invalid ones", () => {
  const store = normalizeStore({
    version: 99,
    settings: {
      unbookmarkAfterSave: true,
      displayMode: "inline",
      backendMode: "custom",
      backendUrl: "http://192.168.1.10:8080/",
      backendToken: "  Bearer pasted-from-a-header  ",
    },
    categories: [
      { id: "a", name: "Linux", slug: "linux", color: "#ABCDEF", order: 0 },
      { id: "b", name: "AI & LLM", slug: "not-valid SLUG", color: "red", order: 1 },
      { id: "", name: "No id", slug: "x", color: "#000000", order: 2 },
      { id: "d", name: "Read Later", order: 3 },
    ],
  });

  assert.equal(store.version, 2);
  assert.deepEqual(store.settings, {
    unbookmarkAfterSave: true,
    displayMode: "inline",
    backendMode: "custom",
    backendUrl: "http://192.168.1.10:8080",
    // The trailing slash is dropped so endpoint paths never double up, and the
    // token is trimmed with its pasted `Bearer ` prefix removed.
    backendToken: "pasted-from-a-header",
  });

  assert.deepEqual(
    store.categories.map((c) => c.id),
    ["a", "b", "d"],
    "entry without an id is dropped",
  );
  assert.equal(store.categories[0].color, "#abcdef", "colors are lowercased");
  assert.equal(store.categories[1].slug, "ai-llm", "invalid slug is recomputed from name");
  assert.equal(store.categories[1].color, DEFAULT_CATEGORY_COLOR, "invalid color falls back");
  assert.equal(store.categories[2].slug, "read-later", "missing slug is derived");
  for (const c of store.categories) assert.ok(isValidSlug(c.slug));
});

test("normalizeStore normalizes order to 0..n-1", () => {
  const store = normalizeStore({
    categories: [
      { id: "c", name: "C", slug: "c", color: "#000000", order: 9 },
      { id: "a", name: "A", slug: "a", color: "#000000", order: 0 },
      { id: "b", name: "B", slug: "b", color: "#000000", order: 5 },
    ],
  });

  assert.deepEqual(
    store.categories.map((c) => [c.id, c.order]),
    [
      ["a", 0],
      ["b", 1],
      ["c", 2],
    ],
  );
});

test("normalizeStore tie-breaks equal orders stably (insertion order wins)", () => {
  const store = normalizeStore({
    categories: [
      { id: "first", name: "First", slug: "first", color: "#000000", order: 0 },
      { id: "second", name: "Second", slug: "second", color: "#000000", order: 0 },
    ],
  });
  assert.deepEqual(store.categories.map((c) => c.id), ["first", "second"]);
});

test("a v1 store whose categories carry `filename` migrates to `slug` losslessly", () => {
  // This is the real upgrade path: chrome.storage.local holds a record written by
  // the previous version of the extension. The derived value used to be
  // `slugify(name) + ".csv"`, so recomputing it from the name reproduces exactly
  // the same key — which is why nothing is read from the old field at all.
  const legacy = [
    { id: "a", name: "Linux", filename: "linux.csv", color: "#10b981", order: 0 },
    { id: "b", name: "AI & LLM", filename: "ai-llm.csv", color: "#4f46e5", order: 1 },
    { id: "c", name: "Read Later", filename: "read-later.csv", color: "#ef4444", order: 2 },
    {
      id: "3f2504e0-4f89-11d3-9a0c-0305e82c3301",
      name: "!!!",
      filename: "category-3f2504e0.csv",
      color: "#0ea5e9",
      order: 3,
    },
  ];
  const store = normalizeStore({
    version: 1,
    settings: { unbookmarkAfterSave: true, displayMode: "inline" },
    categories: legacy,
  });

  assert.equal(store.version, 2, "the record is rewritten at the current version");
  assert.deepEqual(
    store.categories.map((c) => c.slug),
    ["linux", "ai-llm", "read-later", "category-3f2504e0"],
    "every v1 filename maps onto the slug it was derived from",
  );
  // The stronger, mechanical form of the same claim: the migrated slug is exactly
  // the old filename minus its extension, for every category including the
  // empty-name fallback.
  assert.deepEqual(
    store.categories.map((c) => `${c.slug}.csv`),
    legacy.map((c) => c.filename),
    "migrating filename -> slug loses nothing",
  );
  assert.deepEqual(
    store.categories.map((c) => c.name),
    ["Linux", "AI & LLM", "Read Later", "!!!"],
    "names and every other field survive the migration",
  );
  assert.deepEqual(store.categories.map((c) => c.color), ["#10b981", "#4f46e5", "#ef4444", "#0ea5e9"]);
  assert.deepEqual(store.categories.map((c) => c.order), [0, 1, 2, 3]);
  // A v1 record predates the configurable backend, so it loads as Localhost.
  assert.deepEqual(store.settings, {
    unbookmarkAfterSave: true,
    displayMode: "inline",
    backendMode: "localhost",
    backendUrl: "http://127.0.0.1:43121",
    backendToken: "",
  });
  for (const c of store.categories) {
    assert.equal(c.filename, undefined, "the old field is not carried over");
    assert.ok(isValidSlug(c.slug));
  }
});

test("normalizeOrder does not mutate its input", () => {
  const input = [category("b", "B", 5), category("a", "A", 1)];
  const output = normalizeOrder(input);
  assert.deepEqual(
    input.map((c) => c.order),
    [5, 1],
  );
  assert.deepEqual(
    output.map((c) => [c.id, c.order]),
    [
      ["a", 0],
      ["b", 1],
    ],
  );
});

test("applyReorder rewrites order and keeps unknown ids at the end", () => {
  const input = [category("a", "A", 0), category("b", "B", 1), category("c", "C", 2)];
  const output = applyReorder(input, ["c", "a"]);

  assert.deepEqual(
    output.map((c) => [c.id, c.order]),
    [
      ["c", 0],
      ["a", 1],
      ["b", 2],
    ],
    "unlisted id b survives and is appended",
  );
});

test("applyReorder ignores ids that no longer exist", () => {
  const input = [category("a", "A", 0), category("b", "B", 1)];
  const output = applyReorder(input, ["ghost", "b", "a"]);
  assert.deepEqual(output.map((c) => c.id), ["b", "a"]);
  assert.deepEqual(
    output.map((c) => c.order),
    [0, 1],
  );
});

test("nextOrder appends after the current maximum", () => {
  assert.equal(nextOrder([]), 0);
  assert.equal(nextOrder([category("a", "A", 0)]), 1);
  assert.equal(nextOrder([category("a", "A", 0), category("b", "B", 4)]), 5);
});

test("hasNameConflict is case- and whitespace-insensitive and can ignore one id", () => {
  const categories = [category("a", "Linux", 0), category("b", "AI & LLM", 1)];
  assert.ok(hasNameConflict(categories, "  linux "));
  assert.ok(hasNameConflict(categories, "AI & LLM"));
  assert.ok(!hasNameConflict(categories, "Design"));
  assert.ok(!hasNameConflict(categories, "linux", "a"), "ignoring the category being renamed");
  assert.ok(hasNameConflict(categories, "linux", "b"));
});

test("normalizeDisplayMode and normalizeColor clamp to valid values", () => {
  assert.equal(normalizeDisplayMode("inline"), "inline");
  assert.equal(normalizeDisplayMode("popover"), "popover");
  assert.equal(normalizeDisplayMode("bogus"), "popover");
  assert.equal(normalizeDisplayMode(undefined), "popover");

  assert.equal(normalizeColor("#A1B2C3"), "#a1b2c3");
  assert.equal(normalizeColor("red"), DEFAULT_CATEGORY_COLOR);
  assert.equal(normalizeColor(undefined), DEFAULT_CATEGORY_COLOR);
  assert.equal(normalizeColor("#fff"), DEFAULT_CATEGORY_COLOR);
});

test("normalizeStore clamps the backend target to a usable address", () => {
  const backendOf = (settings) => normalizeStore({ settings }).settings;

  assert.deepEqual(backendOf({ backendMode: "custom", backendUrl: "localhost:8080" }), {
    unbookmarkAfterSave: false,
    displayMode: "popover",
    backendMode: "custom",
    backendUrl: "http://localhost:8080",
    backendToken: "",
  });

  assert.equal(backendOf({ backendMode: "bogus" }).backendMode, "localhost", "unknown mode -> localhost");
  assert.equal(backendOf({}).backendMode, "localhost");
  assert.equal(
    backendOf({ backendMode: "custom", backendUrl: "ftp://server/file" }).backendUrl,
    "http://127.0.0.1:43121",
    "a non-http(s) URL falls back to the loopback default",
  );
  assert.equal(
    backendOf({ backendMode: "custom", backendUrl: "http://user:pass@host" }).backendUrl,
    "http://127.0.0.1:43121",
    "embedded credentials are rejected",
  );
  assert.equal(backendOf({ backendMode: "custom", backendUrl: "   " }).backendUrl, "http://127.0.0.1:43121");
});
