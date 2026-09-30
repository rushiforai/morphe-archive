/**
 * Category slug generation (PRD §8) and validation.
 *
 * A slug is a collection's identifier: the extension sends it with every save and
 * the gallery uses it in URLs. It is not a filename, so it carries no extension.
 *
 * Rules, in order:
 *   NFKD-decompose -> strip combining marks -> lowercase -> trim
 *   -> spaces to "-" -> strip unsafe characters -> collapse "-"
 *   -> trim leading/trailing "-"
 *
 * Examples: `Linux` -> `linux`, `AI & LLM` -> `ai-llm`,
 * `Read Later` -> `read-later`.
 *
 * An empty slug falls back to `category-<short-id>`. The result of
 * {@link slugify} ALWAYS matches {@link SLUG_PATTERN}, which mirrors the
 * backend's own validation (PRD §8, §52).
 */

/** Slugs the backend will accept; the extension must only ever produce these. */
export const SLUG_PATTERN = /^[a-z0-9][a-z0-9-]*$/;

/** Default prefix for the empty-slug fallback. */
export const FALLBACK_PREFIX = "category";

/** Characters kept in a slug after whitespace has been converted to "-". */
const UNSAFE_CHARS = /[^a-z0-9-]/g;

/** Combining marks left behind by NFD decomposition (e.g. "é" -> "e" + U+0301). */
const COMBINING_MARKS = /[\u0300-\u036f]/g;

/**
 * Deterministic, slug-safe short form of a category id.
 * `crypto.randomUUID()` output sanitizes to its first 8 alphanumerics.
 */
export function shortId(id: string): string {
  const cleaned = (id ?? "").toLowerCase().replace(UNSAFE_CHARS, "");
  return cleaned.slice(0, 8) || "00000000";
}

/**
 * Convert a human category name into the slug the backend will use.
 *
 * @param name Human-readable category name, e.g. "AI & LLM".
 * @param id   Category id, used only for the empty-slug fallback.
 */
export function slugify(name: string, id: string): string {
  const slug = (name ?? "")
    .normalize("NFKD")
    .replace(COMBINING_MARKS, "")
    .toLowerCase()
    .trim()
    .replace(/\s+/g, "-")
    .replace(UNSAFE_CHARS, "")
    .replace(/-+/g, "-")
    .replace(/^-+|-+$/g, "");

  return slug || `${FALLBACK_PREFIX}-${shortId(id)}`;
}

/** True when `slug` is safe to send to the backend (defense in depth). */
export function isValidSlug(slug: string): boolean {
  return typeof slug === "string" && SLUG_PATTERN.test(slug);
}
