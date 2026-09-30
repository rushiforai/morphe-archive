import { render, screen } from "@testing-library/react"
import { describe, expect, it } from "vitest"

import { GalleryBottomLoader } from "./gallery-bottom-loader"

/**
 * SCROLL-02 affordance contract: a compact bottom row that is a polite live
 * status with a visually-hidden label, and a spinner that is not announced as
 * content.
 */

describe("GalleryBottomLoader — polite bottom status (SCROLL-02, a11y)", () => {
  it("renders a role=status live region", () => {
    render(<GalleryBottomLoader />)

    const loader = screen.getByTestId("gallery-bottom-loader")
    expect(loader).toHaveAttribute("role", "status")
  })

  it("exposes the Loading more posts label to assistive tech", () => {
    render(<GalleryBottomLoader />)

    expect(screen.getByRole("status")).toHaveTextContent("Loading more posts")
  })

  it("accepts a custom visually-hidden label", () => {
    render(<GalleryBottomLoader label="Fetching the next 30" />)

    expect(screen.getByRole("status")).toHaveTextContent("Fetching the next 30")
  })

  it("hides the spinner from the accessibility tree", () => {
    render(<GalleryBottomLoader />)

    const loader = screen.getByTestId("gallery-bottom-loader")
    const spinner = loader.querySelector("[aria-hidden='true']")
    expect(spinner).not.toBeNull()
    expect(spinner).toHaveClass("animate-spin")
  })

  it("is compact — a single row, never a full-page skeleton", () => {
    render(<GalleryBottomLoader />)

    const loader = screen.getByTestId("gallery-bottom-loader")
    expect(loader).toHaveClass("py-6")
    expect(
      loader.querySelectorAll("[data-testid='collection-card-skeleton']")
    ).toHaveLength(0)
  })
})
