/**
 * The single source of truth for extension configuration.
 *
 * Everything is persisted in `chrome.storage.local` under {@link STORAGE_KEY}
 * as one `Store` object (PRD §7). `chrome.storage.sync` is never used.
 *
 * Invariants enforced here:
 *  - rename recomputes `slug` and touches no backend records (PRD §9);
 *  - delete only removes the category from storage (PRD §10);
 *  - `color` never leaves the extension UI (PRD §7);
 *  - no function in this module performs any network request.
 */

import { normalizeBackendMode, normalizeBackendUrl } from "./backend-url.ts";
import { normalizeBackendToken } from "./backend-token.ts";
import {
  DEFAULT_CATEGORY_COLOR,
  DEFAULT_SETTINGS,
  SCHEMA_VERSION,
  STORAGE_KEY,
} from "./constants.ts";
import { isValidSlug, slugify } from "./slug.ts";
import type { Category, DisplayMode, Settings, Store } from "./types.ts";

const HEX_COLOR_PATTERN = /^#[0-9a-f]{6}$/i;
const DISPLAY_MODES: readonly DisplayMode[] = ["popover", "inline"];

/* -------------------------------------------------------------------------- */
/* Pure helpers (exported for unit testing; they never touch chrome APIs)      */
/* -------------------------------------------------------------------------- */

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

/** Coerce an unknown value into a valid display mode. */
export function normalizeDisplayMode(value: unknown): DisplayMode {
  return DISPLAY_MODES.includes(value as DisplayMode) ? (value as DisplayMode) : DEFAULT_SETTINGS.displayMode;
}

/** Coerce an unknown value into a valid hex colour. */
export function normalizeColor(value: unknown): string {
  return typeof value === "string" && HEX_COLOR_PATTERN.test(value) ? value.toLowerCase() : DEFAULT_CATEGORY_COLOR;
}

/** Sort a copy of `categories` by `order` (stable) and renumber `order` to 0..n-1. */
export function normalizeOrder(categories: Category[]): Category[] {
  return [...categories]
    .sort((a, b) => a.order - b.order)
    .map((category, index) => (category.order === index ? category : { ...category, order: index }));
}

/** Coerce one unknown entry into a valid `Category`, or `null` when unusable. */
function normalizeCategory(value: unknown, index: number): Category | null {
  if (!isRecord(value)) return null;

  const id = typeof value.id === "string" && value.id.length > 0 ? value.id : null;
  if (id === null) return null;

  const name = typeof value.name === "string" ? value.name : "";
  const rawOrder = typeof value.order === "number" && Number.isFinite(value.order) ? value.order : index;
  // A stored slug that validates is kept as-is; anything else — including a
  // v1 record whose `filename` held "linux.csv" — is recomputed from the name.
  // Because the old value was `slugify(name) + ".csv"`, recomputing reproduces
  // the same key, so upgrading from v1 loses nothing.
  const rawSlug = typeof value.slug === "string" && isValidSlug(value.slug) ? value.slug : null;

  return {
    id,
    name,
    slug: rawSlug ?? slugify(name, id),
    color: normalizeColor(value.color),
    order: rawOrder,
  };
}

/**
 * Merge an arbitrary value read from storage over the defaults, dropping
 * anything malformed rather than throwing.
 */
export function normalizeStore(raw: unknown): Store {
  if (!isRecord(raw)) {
    return { version: SCHEMA_VERSION, settings: { ...DEFAULT_SETTINGS }, categories: [] };
  }

  const rawSettings = isRecord(raw.settings) ? raw.settings : {};
  const settings: Settings = {
    unbookmarkAfterSave:
      typeof rawSettings.unbookmarkAfterSave === "boolean"
        ? rawSettings.unbookmarkAfterSave
        : DEFAULT_SETTINGS.unbookmarkAfterSave,
    displayMode: normalizeDisplayMode(rawSettings.displayMode),
    backendMode: normalizeBackendMode(rawSettings.backendMode),
    // A v2 record has no custom URL at all; a malformed one falls back to the
    // loopback default rather than leaving the Custom field blank.
    backendUrl: normalizeBackendUrl(rawSettings.backendUrl) ?? DEFAULT_SETTINGS.backendUrl,
    // Free-form, so it is only trimmed; a record that predates the field, or one
    // holding rubbish, simply means "no credential".
    backendToken: normalizeBackendToken(rawSettings.backendToken),
  };

  const rawCategories = Array.isArray(raw.categories) ? raw.categories : [];
  const categories = rawCategories
    .map((entry, index) => normalizeCategory(entry, index))
    .filter((entry): entry is Category => entry !== null);

  return { version: SCHEMA_VERSION, settings, categories: normalizeOrder(categories) };
}

/** Apply a new id order, keeping any unknown ids at the end so nothing is lost. */
export function applyReorder(categories: Category[], orderedIds: string[]): Category[] {
  const byId = new Map(categories.map((category) => [category.id, category]));
  const ordered: Category[] = [];

  for (const id of orderedIds) {
    const category = byId.get(id);
    if (category) {
      ordered.push(category);
      byId.delete(id);
    }
  }
  for (const category of categories) {
    if (byId.has(category.id)) {
      ordered.push(category);
      byId.delete(category.id);
    }
  }

  return ordered.map((category, index) => ({ ...category, order: index }));
}

/** Next free order value for an appended category. */
export function nextOrder(categories: Category[]): number {
  return categories.reduce((max, category) => Math.max(max, category.order), -1) + 1;
}

/** Case-insensitive name collision check, optionally ignoring one id (the category being renamed). */
export function hasNameConflict(categories: Category[], name: string, ignoreId?: string): boolean {
  const needle = name.trim().toLowerCase();
  return categories.some((category) => category.id !== ignoreId && category.name.trim().toLowerCase() === needle);
}

/* -------------------------------------------------------------------------- */
/* chrome.storage.local access                                                */
/* -------------------------------------------------------------------------- */

function readRaw(): Promise<unknown> {
  return chrome.storage.local.get(STORAGE_KEY).then((result) => result[STORAGE_KEY]);
}

async function writeStore(store: Store): Promise<void> {
  await chrome.storage.local.set({ [STORAGE_KEY]: store });
}

/** Compute the next store plus a result value, persist it, and return the result. */
async function mutateAndGet<T>(change: (store: Store) => { store: Store; result: T }): Promise<T> {
  const current = await getStore();
  const { store: next, result } = change(current);
  await writeStore(next);
  return result;
}

/** Read and normalize the whole store. Never rejects on malformed data. */
export async function getStore(): Promise<Store> {
  try {
    return normalizeStore(await readRaw());
  } catch {
    return { version: SCHEMA_VERSION, settings: { ...DEFAULT_SETTINGS }, categories: [] };
  }
}

/** All categories, ordered. */
export async function getCategories(): Promise<Category[]> {
  return (await getStore()).categories;
}

/** Current settings, with defaults applied. */
export async function getSettings(): Promise<Settings> {
  return (await getStore()).settings;
}

/**
 * Create a category: new uuid, derived slug, appended order.
 * Throws on an empty or duplicate name so the popup can show an inline message.
 * Performs no backend call (PRD §45).
 */
export async function addCategory(input: { name: string; color?: string }): Promise<Category> {
  const name = input.name.trim();
  if (name.length === 0) throw new Error("Category name is required");

  return mutateAndGet((store) => {
    if (hasNameConflict(store.categories, name)) {
      throw new Error(`A category named "${name}" already exists`);
    }
    const id = crypto.randomUUID();
    const created: Category = {
      id,
      name,
      slug: slugify(name, id),
      color: normalizeColor(input.color),
      order: nextOrder(store.categories),
    };
    return { store: { ...store, categories: [...store.categories, created] }, result: created };
  });
}

/**
 * Rename a category and recompute its `slug`.
 * Nothing on disk is renamed or migrated, and no backend request is made
 * (PRD §9, §46): the new slug simply becomes the one the next save uses, and the
 * collection the old slug created stays where it is.
 */
export async function updateCategoryName(id: string, name: string): Promise<Category> {
  const trimmed = name.trim();
  if (trimmed.length === 0) throw new Error("Category name is required");

  return mutateAndGet((store) => {
    const target = store.categories.find((category) => category.id === id);
    if (!target) throw new Error("Category not found");
    if (hasNameConflict(store.categories, trimmed, id)) {
      throw new Error(`A category named "${trimmed}" already exists`);
    }
    const updated: Category = { ...target, name: trimmed, slug: slugify(trimmed, target.id) };
    return {
      store: {
        ...store,
        categories: store.categories.map((category) => (category.id === id ? updated : category)),
      },
      result: updated,
    };
  });
}

/** Update a category's UI-only colour. Never sent to the backend (PRD §47). */
export async function updateCategoryColor(id: string, color: string): Promise<Category | null> {
  return mutateAndGet((store) => {
    const target = store.categories.find((category) => category.id === id);
    if (!target) return { store, result: null };
    const updated: Category = { ...target, color: normalizeColor(color) };
    return {
      store: {
        ...store,
        categories: store.categories.map((category) => (category.id === id ? updated : category)),
      },
      result: updated,
    };
  });
}

/**
 * Remove a category from storage only. Saved bookmarks and the collections they
 * belong to are untouched, and no backend call is made (PRD §10, §48).
 */
export async function deleteCategory(id: string): Promise<void> {
  await mutateAndGet((store) => ({
    store: { ...store, categories: normalizeOrder(store.categories.filter((category) => category.id !== id)) },
    result: undefined,
  }));
}

/** Persist a new category order; `order` is rewritten to 0..n-1 (PRD §49). */
export async function reorderCategories(orderedIds: string[]): Promise<Category[]> {
  return mutateAndGet((store) => {
    const categories = applyReorder(store.categories, orderedIds);
    return { store: { ...store, categories }, result: categories };
  });
}

/** Merge a partial settings update and persist it (PRD §50). */
export async function setSettings(partial: Partial<Settings>): Promise<Settings> {
  return mutateAndGet((store) => {
    const settings: Settings = {
      unbookmarkAfterSave:
        typeof partial.unbookmarkAfterSave === "boolean"
          ? partial.unbookmarkAfterSave
          : store.settings.unbookmarkAfterSave,
      displayMode:
        partial.displayMode === undefined ? store.settings.displayMode : normalizeDisplayMode(partial.displayMode),
      backendMode:
        partial.backendMode === undefined ? store.settings.backendMode : normalizeBackendMode(partial.backendMode),
      // An unparseable URL keeps the previously saved one instead of clobbering
      // it; the popup validates before calling, so this is only a safety net.
      backendUrl:
        partial.backendUrl === undefined
          ? store.settings.backendUrl
          : (normalizeBackendUrl(partial.backendUrl) ?? store.settings.backendUrl),
      // A token is free-form, so it is only trimmed (and a pasted `Bearer `
      // prefix dropped). An empty string is a valid value: it means "send no
      // Authorization header".
      backendToken:
        partial.backendToken === undefined
          ? store.settings.backendToken
          : normalizeBackendToken(partial.backendToken),
    };
    return { store: { ...store, settings }, result: settings };
  });
}

/**
 * Subscribe to store changes in the `local` area only (PRD §51).
 *
 * Exported for the Phase 3 content script so injected controls can rerender
 * without a page reload. Returns an unsubscribe function.
 */
export function onStoreChanged(callback: (store: Store) => void): () => void {
  const listener = (
    changes: Record<string, chrome.storage.StorageChange>,
    areaName: string,
  ): void => {
    if (areaName !== "local") return;
    if (!Object.prototype.hasOwnProperty.call(changes, STORAGE_KEY)) return;
    void getStore()
      .then((store) => callback(store))
      .catch(() => {
        /* Defensive: a subscriber must never produce an unhandled rejection. */
      });
  };

  chrome.storage.onChanged.addListener(listener);
  return () => chrome.storage.onChanged.removeListener(listener);
}
