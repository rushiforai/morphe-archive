import { fireEvent, render, screen } from "@testing-library/react"
import { describe, expect, it } from "vitest"

import { MediaImage } from "./media-image"

describe("MediaImage", () => {
  it("renders a lazy, async-decoded, decorative image", () => {
    render(
      <MediaImage src="https://example.test/a.jpg" fallbackSeed="linux:0" />
    )

    const img = screen.getByTestId("media-image")

    expect(img).toHaveAttribute("src", "https://example.test/a.jpg")
    expect(img).toHaveAttribute("loading", "lazy")
    expect(img).toHaveAttribute("decoding", "async")
    expect(img).toHaveAttribute("aria-hidden", "true")
  })

  it("swaps a broken image for a same-box placeholder (PRD-2 §62)", () => {
    render(
      <MediaImage
        src="https://example.test/broken.jpg"
        fallbackSeed="linux:1"
        className="h-full w-full rounded-md"
      />
    )

    fireEvent.error(screen.getByTestId("media-image"))

    const placeholder = screen.getByTestId("media-placeholder")
    expect(placeholder).toBeInTheDocument()
    expect(placeholder).toHaveClass("h-full", "w-full", "rounded-md")
    expect(placeholder.style.backgroundImage).toContain("--grad-ph-")
    expect(screen.queryByTestId("media-image")).not.toBeInTheDocument()
  })

  it("renders the placeholder immediately for an empty source", () => {
    render(<MediaImage src="   " fallbackSeed="linux:2" />)

    expect(screen.getByTestId("media-placeholder")).toBeInTheDocument()
    expect(screen.queryByTestId("media-image")).not.toBeInTheDocument()
  })

  it("keeps an accessible name when an alt is supplied", () => {
    render(
      <MediaImage
        src="https://example.test/a.jpg"
        fallbackSeed="linux:3"
        alt="A tweet image"
      />
    )

    expect(screen.getByRole("img", { name: "A tweet image" })).toBeVisible()
  })
})
