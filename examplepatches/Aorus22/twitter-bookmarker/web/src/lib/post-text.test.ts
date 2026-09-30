import { describe, expect, it } from "vitest"

import {
  BODY_TEXT_CLAMP_CLASS,
  clampClassName,
  isLongPostText,
  POST_TEXT_CLAMP_CHARS,
  QUOTE_TEXT_CLAMP_CLASS,
} from "./post-text"

describe("isLongPostText (COLL-08)", () => {
  it("keeps short tweets unclamped so no dead Show more appears", () => {
    expect(isLongPostText("")).toBe(false)
    expect(isLongPostText("Short and sweet.")).toBe(false)
    expect(isLongPostText("a".repeat(POST_TEXT_CLAMP_CHARS))).toBe(false)
  })

  it("clamps text past the threshold", () => {
    expect(isLongPostText("a".repeat(POST_TEXT_CLAMP_CHARS + 1))).toBe(true)
  })

  it("ignores surrounding whitespace when measuring", () => {
    expect(isLongPostText(`   ${"a".repeat(POST_TEXT_CLAMP_CHARS)}   `)).toBe(
      false
    )
  })
})

describe("clampClassName", () => {
  it("returns the variant's clamp class while collapsed", () => {
    expect(clampClassName("body", false)).toBe(BODY_TEXT_CLAMP_CLASS)
    expect(clampClassName("quote", false)).toBe(QUOTE_TEXT_CLAMP_CLASS)
  })

  it("removes the clamp when expanded, so the text grows in place", () => {
    expect(clampClassName("body", true)).toBe("")
    expect(clampClassName("quote", true)).toBe("")
  })
})
