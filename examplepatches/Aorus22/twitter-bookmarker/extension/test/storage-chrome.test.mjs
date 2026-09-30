// Storage contract tests: drive `src/shared/storage.ts` against an in-memory
// stand-in for `chrome.storage.local` and a `fetch` spy.
//
// These prove the extension-side invariants the popup depends on:
//   - first run yields the documented defaults (false / "popover");
//   - every CRUD operation persists under ONE chrome.storage.local key;
//   - rename recomputes `slug` without touching storage keys or the backend;
//   - delete removes the category only and renumbers order;
//   - reorder rewrites `order` to 0..n-1;
//   - NO category operation performs a network request (PRD §9, §10, §45–§49).

import test from "node:test";
import assert from "node:assert/strict";

const storageData = Object.create(null);
const changeListeners = [];
const fetchCalls = [];

function clone(value) {
  return value === undefined ? undefined : structuredClone(value);
}

globalThis.chrome = {
  storage: {
    local: {
      async get(key) {
        if (typeof key === "string") {
          return key in storageData ? { [key]: clone(storageData[key]) } : {};
        }
        if (Array.isArray(key)) {
          const out = {};
          for (const k of key) if (k in storageData) out[k] = clone(storageData[k]);
          return out;
        }
        return clone({ ...storageData });
      },
      async set(items) {
        for (const [key, value] of Object.entries(items)) storageData[key] = clone(value);
      },
    },
    onChanged: {
      addListener(listener) {
        changeListeners.push(listener);
      },
      removeListener(listener) {
        const index = changeListeners.indexOf(listener);
        if (index >= 0) changeListeners.splice(index, 1);
      },
    },
  },
};

globalThis.fetch = (...args) => {
  fetchCalls.push(args);
  return Promise.reject(new Error("fetch must never be called by the storage module"));
};

const { STORAGE_KEY, DEFAULT_CATEGORY_COLOR } = await import("../src/shared/constants.ts");
const storage = await import("../src/shared/storage.ts");

function resetStorage() {
  for (const key of Object.keys(storageData)) delete storageData[key];
}

function stored() {
  return storageData[STORAGE_KEY];
}

const tick = () => new Promise((resolve) => setTimeout(resolve, 0));

test("first run yields PRD defaults under the single storage key", async () => {
  resetStorage();

  const store = await storage.getStore();
  // A non-numeric version is discarded in favour of the current one; nothing reads
  // the stored version to decide how to migrate.
  assert.equal(store.version, 2);
  assert.deepEqual(store.settings, {
    unbookmarkAfterSave: false,
    displayMode: "popover",
    backendMode: "localhost",
    backendUrl: "http://127.0.0.1:43121",
    backendToken: "",
  });
  assert.deepEqual(store.categories, []);
  assert.deepEqual(await storage.getSettings(), {
    unbookmarkAfterSave: false,
    displayMode: "popover",
    backendMode: "localhost",
    backendUrl: "http://127.0.0.1:43121",
    backendToken: "",
  });
  assert.deepEqual(await storage.getCategories(), []);
  assert.equal(stored(), undefined, "reads never write");
});

test("addCategory generates an id, a derived slug, and an appended order", async () => {
  resetStorage();

  const linux = await storage.addCategory({ name: "Linux", color: "#4f46e5" });
  assert.match(linux.id, /^[0-9a-f-]{36}$/);
  assert.equal(linux.name, "Linux");
  assert.equal(linux.slug, "linux");
  assert.equal(linux.color, "#4f46e5");
  assert.equal(linux.order, 0);

  const ai = await storage.addCategory({ name: "AI & LLM", color: "#0ea5e9" });
  const readLater = await storage.addCategory({ name: "Read Later", color: "not-a-color" });
  assert.equal(ai.slug, "ai-llm");
  assert.equal(ai.order, 1);
  assert.equal(readLater.slug, "read-later");
  assert.equal(readLater.order, 2);
  assert.equal(readLater.color, DEFAULT_CATEGORY_COLOR, "invalid colors fall back to the default");

  const store = await storage.getStore();
  assert.deepEqual(
    store.categories.map((c) => c.id),
    [linux.id, ai.id, readLater.id],
  );
  assert.equal(Object.keys(storageData).length, 1, "everything lives under one key");
  assert.equal(Object.keys(storageData)[0], STORAGE_KEY);
});

test("addCategory rejects empty and duplicate names without writing", async () => {
  resetStorage();
  await storage.addCategory({ name: "Linux", color: "#4f46e5" });
  const before = JSON.stringify(stored());

  await assert.rejects(() => storage.addCategory({ name: "   ", color: "#000000" }), /required/);
  await assert.rejects(() => storage.addCategory({ name: "  linux ", color: "#000000" }), /already exists/);

  assert.equal(JSON.stringify(stored()), before, "rejected adds leave storage untouched");
});

test("rename recomputes the slug, keeps the id, and never touches the backend", async () => {
  resetStorage();
  fetchCalls.length = 0;

  const linux = await storage.addCategory({ name: "Linux", color: "#4f46e5" });
  const renamed = await storage.updateCategoryName(linux.id, "Linux Stuff");

  assert.equal(renamed.id, linux.id, "id is stable across renames");
  assert.equal(renamed.name, "Linux Stuff");
  assert.equal(renamed.slug, "linux-stuff");

  const [persisted] = (await storage.getCategories()).filter((c) => c.id === linux.id);
  assert.equal(persisted.slug, "linux-stuff");
  assert.equal(fetchCalls.length, 0, "no backend request during rename");

  // Still a single key. The old slug is not renamed anywhere: it simply stops
  // being used, and the next save creates a new collection under the new slug.
  assert.equal(Object.keys(storageData).length, 1);
});

test("rename rejects duplicates and unknown ids", async () => {
  resetStorage();
  await storage.addCategory({ name: "Linux", color: "#4f46e5" });
  const ai = await storage.addCategory({ name: "AI", color: "#4f46e5" });

  await assert.rejects(() => storage.updateCategoryName(ai.id, "linux"), /already exists/);
  await assert.rejects(() => storage.updateCategoryName("does-not-exist", "Whatever"), /not found/);
});

test("updateCategoryColor only changes the UI colour", async () => {
  resetStorage();
  const linux = await storage.addCategory({ name: "Linux", color: "#4f46e5" });

  const updated = await storage.updateCategoryColor(linux.id, "#ABCDEF");
  assert.equal(updated.color, "#abcdef");
  assert.equal(updated.slug, "linux", "colour never affects the slug");

  const missing = await storage.updateCategoryColor("nope", "#000000");
  assert.equal(missing, null);
});

test("reorderCategories rewrites order to 0..n-1 and persists it", async () => {
  resetStorage();
  const a = await storage.addCategory({ name: "Apple", color: "#4f46e5" });
  const b = await storage.addCategory({ name: "Banana", color: "#4f46e5" });
  const c = await storage.addCategory({ name: "Cherry", color: "#4f46e5" });

  const reordered = await storage.reorderCategories([c.id, a.id, b.id]);
  assert.deepEqual(
    reordered.map((category) => [category.name, category.order]),
    [
      ["Cherry", 0],
      ["Apple", 1],
      ["Banana", 2],
    ],
  );

  const persisted = await storage.getCategories();
  assert.deepEqual(
    persisted.map((category) => [category.name, category.order]),
    [
      ["Cherry", 0],
      ["Apple", 1],
      ["Banana", 2],
    ],
  );
});

test("deleteCategory removes only that category and renumbers the rest", async () => {
  resetStorage();
  fetchCalls.length = 0;

  const a = await storage.addCategory({ name: "Apple", color: "#4f46e5" });
  const b = await storage.addCategory({ name: "Banana", color: "#4f46e5" });
  const c = await storage.addCategory({ name: "Cherry", color: "#4f46e5" });

  await storage.deleteCategory(b.id);

  const remaining = await storage.getCategories();
  assert.deepEqual(
    remaining.map((category) => [category.name, category.order]),
    [
      ["Apple", 0],
      ["Cherry", 1],
    ],
  );
  assert.ok(!remaining.some((category) => category.id === b.id));
  assert.equal(fetchCalls.length, 0, "delete performs no backend call");
  assert.equal(Object.keys(storageData).length, 1, "no second storage key is introduced");
  assert.ok(a.id && c.id);
});

const PRD_DEFAULT_SETTINGS = {
  unbookmarkAfterSave: false,
  displayMode: "popover",
  backendMode: "localhost",
  backendUrl: "http://127.0.0.1:43121",
  backendToken: "",
};

test("setSettings merges partial updates over the defaults", async () => {
  resetStorage();

  assert.deepEqual(await storage.setSettings({ unbookmarkAfterSave: true }), {
    ...PRD_DEFAULT_SETTINGS,
    unbookmarkAfterSave: true,
  });

  assert.deepEqual(await storage.setSettings({ displayMode: "inline" }), {
    ...PRD_DEFAULT_SETTINGS,
    unbookmarkAfterSave: true,
    displayMode: "inline",
  });

  assert.deepEqual(await storage.getSettings(), {
    ...PRD_DEFAULT_SETTINGS,
    unbookmarkAfterSave: true,
    displayMode: "inline",
  });

  // An unknown mode cannot corrupt storage.
  assert.equal((await storage.setSettings({ displayMode: "bogus" })).displayMode, "popover");
});

test("setSettings stores a normalized custom backend URL", async () => {
  resetStorage();

  const settings = await storage.setSettings({
    backendMode: "custom",
    backendUrl: "  192.168.1.10:8080/  ",
  });
  assert.equal(settings.backendMode, "custom");
  assert.equal(settings.backendUrl, "http://192.168.1.10:8080", "scheme is defaulted and the slash dropped");
  assert.deepEqual(await storage.getSettings(), settings, "the write is persisted, not just returned");

  // Back to Localhost: the custom URL is remembered but no longer used.
  const loopback = await storage.setSettings({ backendMode: "localhost" });
  assert.equal(loopback.backendMode, "localhost");
  assert.equal(loopback.backendUrl, "http://192.168.1.10:8080");

  // An unusable URL keeps the previous value rather than clearing it.
  assert.equal((await storage.setSettings({ backendUrl: "ftp://nope" })).backendUrl, "http://192.168.1.10:8080");
  assert.equal((await storage.setSettings({ backendMode: "nonsense" })).backendMode, "localhost");
});

test("setSettings stores a trimmed backend token", async () => {
  resetStorage();

  const settings = await storage.setSettings({
    backendMode: "custom",
    backendUrl: "https://tw-bookmark.example",
    backendToken: "  Bearer paste-from-a-header  ",
  });
  assert.equal(settings.backendToken, "paste-from-a-header", "trimmed, with the pasted prefix dropped");
  assert.deepEqual(await storage.getSettings(), settings, "the write is persisted, not just returned");

  // A partial update that says nothing about the token keeps the saved one.
  const urlOnly = await storage.setSettings({ backendUrl: "https://other.example" });
  assert.equal(urlOnly.backendToken, "paste-from-a-header");

  // An empty string is a real value: it means "send no Authorization header".
  assert.equal((await storage.setSettings({ backendToken: "   " })).backendToken, "");
});

test("getStore tolerates malformed storage instead of throwing", async () => {
  resetStorage();
  storageData[STORAGE_KEY] = { version: "one", settings: "nope", categories: [{ name: "orphan" }] };

  const store = await storage.getStore();
  // A non-numeric version is discarded in favour of the current one; nothing reads
  // the stored version to decide how to migrate.
  assert.equal(store.version, 2);
  assert.deepEqual(store.settings, PRD_DEFAULT_SETTINGS);
  assert.deepEqual(store.categories, [], "entries without an id are dropped, not crashed on");
});

test("onStoreChanged fires only for the local area and only for the store key", async () => {
  resetStorage();
  const seen = [];
  const unsubscribe = storage.onStoreChanged((store) => seen.push(store));
  assert.equal(changeListeners.length, 1);

  // Wrong area.
  for (const listener of changeListeners) listener({ [STORAGE_KEY]: { newValue: {} } }, "sync");
  await tick();
  assert.equal(seen.length, 0, "sync-area changes are ignored");

  // Wrong key in the local area.
  for (const listener of changeListeners) listener({ somethingElse: { newValue: 1 } }, "local");
  await tick();
  assert.equal(seen.length, 0, "unrelated keys are ignored");

  // Real change.
  await storage.setSettings({ unbookmarkAfterSave: true });
  for (const listener of changeListeners) listener({ [STORAGE_KEY]: { newValue: stored() } }, "local");
  await tick();
  assert.equal(seen.length, 1);
  assert.equal(seen[0].settings.unbookmarkAfterSave, true);

  unsubscribe();
  assert.equal(changeListeners.length, 0, "unsubscribe removes the listener");
});
