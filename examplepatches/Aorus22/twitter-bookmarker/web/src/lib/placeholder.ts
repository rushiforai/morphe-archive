/**
 * Deterministic placeholder gradients (design spec §2.6).
 *
 * Six `--grad-ph-*` pairs already exist in `src/index.css` (declared in Phase 3
 * and deliberately not duplicated here). A stable key — normally the collection
 * `slug` — is hashed with FNV-1a so a given collection always renders the
 * same placeholder, while different collections spread across the palette.
 *
 * The gradient is applied as `background-image: var(--grad-ph-…)`, so no
 * dynamically-built Tailwind class ever has to survive the class scanner.
 */

export interface PlaceholderGradient {
  /** Stable identifier, e.g. `"gold-blue"`. */
  id: string
  /** The CSS custom property name, e.g. `"--grad-ph-gold-blue"`. */
  cssVar: string
  /** Ready-to-use value for `backgroundImage`: `var(--grad-ph-gold-blue)`. */
  value: string
}

function gradient(id: string): PlaceholderGradient {
  const cssVar = `--grad-ph-${id}`
  return { id, cssVar, value: `var(${cssVar})` }
}

/** The six §2.6 pairs, in the order declared by `src/index.css`. */
export const PLACEHOLDER_GRADIENTS: readonly PlaceholderGradient[] = [
  gradient("gold-blue"),
  gradient("violet-pink"),
  gradient("green-lime"),
  gradient("plum-rose"),
  gradient("teal-mint"),
  gradient("sand-sage"),
]

/**
 * Stable index into {@link PLACEHOLDER_GRADIENTS} for a key (FNV-1a, 32-bit).
 *
 * Same key → same index, in every session: no `Math.random`, no clock.
 */
export function placeholderGradientIndex(key: string): number {
  let hash = 0x811c9dc5
  for (let i = 0; i < key.length; i += 1) {
    hash ^= key.charCodeAt(i)
    hash = Math.imul(hash, 0x01000193)
  }
  return (hash >>> 0) % PLACEHOLDER_GRADIENTS.length
}

/** Pick the placeholder gradient for a stable key (usually the slug). */
export function pickPlaceholderGradient(key: string): PlaceholderGradient {
  const index = placeholderGradientIndex(key)
  return PLACEHOLDER_GRADIENTS[index] ?? PLACEHOLDER_GRADIENTS[0]
}
