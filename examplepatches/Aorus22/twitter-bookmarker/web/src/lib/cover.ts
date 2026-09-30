/**
 * Adaptive cover-collage layout (PRD-2 §17, design spec §3.2).
 *
 * The rule is deliberately pure and separate from the component so it can be
 * unit-tested for every media count and reused by later phases (the collection
 * header icon in Phase 5 uses the same deterministic key).
 *
 * | media | layout      | geometry                                    |
 * |-------|-------------|---------------------------------------------|
 * | 4+    | `quad`      | 2×2 tiles (the four newest, `saved_at` DESC)|
 * | 3     | `feature`   | 2 tiles top + 1 full-width tile bottom      |
 * | 2     | `stack`     | 2 full-width tiles, one above the other     |
 * | 1     | `single`    | one tile filling the region                 |
 * | 0     | `placeholder` | gradient tile + neutral glyph             |
 *
 * PRD-2 §17 names 4+/3/1/0 only; `stack` is the recorded decision for 2 media
 * — it keeps the tile height at the spec's 88px and stays visually balanced.
 * An avatar is never a cover: this module only ever sees `cover_media`.
 */

/** At most four cover tiles are ever rendered (PRD-2 §17). */
export const COVER_TILE_LIMIT = 4

export type CoverLayoutKind =
  "placeholder" | "single" | "stack" | "feature" | "quad"

export interface CoverLayout {
  kind: CoverLayoutKind
  /** Number of image tiles the layout renders; `0` means the placeholder. */
  tileCount: 0 | 1 | 2 | 3 | 4
}

/** Pick the collage layout for a number of usable cover images. */
export function selectCoverLayout(mediaCount: number): CoverLayout {
  const count = Number.isFinite(mediaCount)
    ? Math.max(0, Math.trunc(mediaCount))
    : 0

  if (count <= 0) {
    return { kind: "placeholder", tileCount: 0 }
  }
  if (count === 1) {
    return { kind: "single", tileCount: 1 }
  }
  if (count === 2) {
    return { kind: "stack", tileCount: 2 }
  }
  if (count === 3) {
    return { kind: "feature", tileCount: 3 }
  }

  return { kind: "quad", tileCount: 4 }
}

/**
 * Keep the newest cover tiles.
 *
 * The backend already returns `cover_media` ordered `saved_at` DESC (PRD-2 §39),
 * so the first four entries are exactly the four newest and the client must not
 * re-sort them.
 */
export function sliceCoverMedia(media: readonly string[]): string[] {
  return media.slice(0, COVER_TILE_LIMIT)
}
