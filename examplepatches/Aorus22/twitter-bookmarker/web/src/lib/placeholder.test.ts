import { describe, expect, it } from "vitest"

import {
  PLACEHOLDER_GRADIENTS,
  pickPlaceholderGradient,
  placeholderGradientIndex,
} from "./placeholder"

describe("pickPlaceholderGradient", () => {
  it("is deterministic: the same slug always picks the same gradient", () => {
    const first = pickPlaceholderGradient("linux")
    const second = pickPlaceholderGradient("linux")

    expect(first).toEqual(second)
    expect(first.id).toBe("violet-pink")
  })

  it("returns a gradient from the six --grad-ph-* pairs declared by index.css", () => {
    for (const gradient of PLACEHOLDER_GRADIENTS) {
      expect(gradient.cssVar).toBe(`--grad-ph-${gradient.id}`)
      expect(gradient.value).toBe(`var(${gradient.cssVar})`)
    }

    expect(PLACEHOLDER_GRADIENTS.map((gradient) => gradient.id)).toEqual([
      "gold-blue",
      "violet-pink",
      "green-lime",
      "plum-rose",
      "teal-mint",
      "sand-sage",
    ])
  })

  it("distributes different slugs across the palette", () => {
    const slugs = [
      "linux",
      "design",
      "ai",
      "recipes",
      "travel",
      "music",
      "books",
      "workout",
      "finance",
      "garden",
      "movies",
      "quotes",
      "startups",
      "photography",
      "code",
      "health",
      "science",
      "history",
      "art",
      "food",
    ]

    const picked = new Set(
      slugs.map((slug) => pickPlaceholderGradient(slug).id)
    )

    expect(picked.size).toBeGreaterThan(1)
    expect(pickPlaceholderGradient("linux").id).not.toBe(
      pickPlaceholderGradient("design").id
    )
  })

  it("keeps the index inside the palette range", () => {
    for (const key of ["", "a", "linux", "some/very/long-name"]) {
      const index = placeholderGradientIndex(key)
      expect(index).toBeGreaterThanOrEqual(0)
      expect(index).toBeLessThan(PLACEHOLDER_GRADIENTS.length)
    }
  })
})
