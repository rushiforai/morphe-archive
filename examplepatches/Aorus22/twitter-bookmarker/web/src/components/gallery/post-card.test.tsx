import { fireEvent, render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it } from "vitest"

import { PostCard } from "./post-card"
import { makePost, pbsUrl, POST_NOW } from "@/test/fixtures"

/**
 * COLL-05…COLL-09, COLL-11: card content, the text-only quote panel, the
 * controlled clamp, `Open on X`, lazy remote media and broken-media
 * degradation. All copy assertions are against the PRD/design strings.
 */

const LONG_TEXT = `${"Wayland compositors and the Linux desktop. ".repeat(8)}End.`

describe("PostCard — media post", () => {
  it("shows author, username, text, both dates and Open on X (COLL-06)", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "100",
          author: "Ada Lovelace",
          username: "@ada",
          media: [pbsUrl("a")],
          text: "A saved tweet about Linux.",
        })}
      />
    )

    const card = screen.getByTestId("post-card")
    expect(card).toHaveTextContent("Ada Lovelace")
    expect(card).toHaveTextContent("@ada")
    expect(card).toHaveTextContent("A saved tweet about Linux.")
    expect(screen.getByTestId("post-meta")).toHaveTextContent(
      "Mar 12, 2026 · Saved Apr 3"
    )
    expect(screen.getByTestId("open-on-x")).toHaveTextContent("Open on X ↗")
  })

  it("renders the tweet as exactly one card per post, media count and all", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "101",
          media: [pbsUrl("1"), pbsUrl("2"), pbsUrl("3"), pbsUrl("4")],
        })}
      />
    )

    expect(screen.getAllByTestId("post-card")).toHaveLength(1)
    expect(screen.getByTestId("post-card")).toHaveAttribute(
      "data-media-count",
      "4"
    )
    expect(screen.getAllByTestId("media-image")).toHaveLength(4)
  })

  it("links Open on X to the stored url in a new tab (COLL-07, PRD-2 §24)", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({ tweet_id: "102", username: "@ada" })}
      />
    )

    const link = screen.getByTestId("open-on-x")
    expect(link.tagName).toBe("A")
    expect(link).toHaveAttribute("href", "https://x.com/ada/status/102")
    expect(link).toHaveAttribute("target", "_blank")
    expect(link).toHaveAttribute("rel", "noopener noreferrer")
  })

  it("exposes the tweet URL in text form, never only through an image (PRD-2 §67)", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({ tweet_id: "103", username: "@ada" })}
      />
    )

    // The visible link is a real anchor; the media tiles themselves are not
    // links in Phase 5 (the lightbox is Phase 8).
    expect(screen.getByTestId("open-on-x")).toBeVisible()
    expect(
      screen.queryByRole("link", { name: /Media/ })
    ).not.toBeInTheDocument()
  })

  it("clamps long text and expands it in place with Show more (COLL-08)", async () => {
    const user = userEvent.setup()
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "104",
          media: [pbsUrl("a")],
          text: LONG_TEXT,
        })}
      />
    )

    const text = screen.getByTestId("post-text")
    expect(text.className).toContain("line-clamp-5")

    const toggle = screen.getByTestId("post-text-toggle")
    expect(toggle).toHaveTextContent("Show more")
    expect(toggle).toHaveAttribute("aria-expanded", "false")

    await user.click(toggle)

    expect(screen.getByTestId("post-text").className).not.toContain(
      "line-clamp"
    )
    expect(screen.getByTestId("post-text-toggle")).toHaveTextContent(
      "Show less"
    )
    expect(screen.getByTestId("post-text-toggle")).toHaveAttribute(
      "aria-expanded",
      "true"
    )
    expect(screen.getByTestId("post-text")).toHaveTextContent("End.")
  })

  it("shows no Show more for a short tweet", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "105",
          media: [pbsUrl("a")],
          text: "Short.",
        })}
      />
    )

    expect(screen.queryByTestId("post-text-toggle")).not.toBeInTheDocument()
    expect(screen.getByTestId("post-text").className).not.toContain(
      "line-clamp"
    )
  })

  it("keeps the card intact when a remote image is broken (COLL-11, PRD-2 §62)", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "106",
          author: "Ada Lovelace",
          username: "@ada",
          media: [pbsUrl("broken")],
          text: "Still readable.",
        })}
      />
    )

    fireEvent.error(screen.getByTestId("media-image"))

    expect(screen.getByTestId("media-placeholder")).toBeInTheDocument()
    const card = screen.getByTestId("post-card")
    expect(card).toHaveTextContent("Ada Lovelace")
    expect(card).toHaveTextContent("@ada")
    expect(card).toHaveTextContent("Still readable.")
    expect(screen.getByTestId("post-meta")).toHaveTextContent(
      "Mar 12, 2026 · Saved Apr 3"
    )
    expect(screen.getByTestId("open-on-x")).toHaveAttribute(
      "href",
      "https://x.com/ada/status/106"
    )
  })
})

describe("PostCard — text-only post (COLL-05)", () => {
  it("renders the gradient quote panel and no img at all", () => {
    const { container } = render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "200",
          author: "Ada Lovelace",
          username: "@ada",
          media: [],
          text: "Interesting thread about Linux.",
        })}
      />
    )

    const panel = screen.getByTestId("text-post-card")
    expect(panel).toBeInTheDocument()
    expect(panel.style.backgroundImage).toContain("--grad-ph-")
    expect(screen.getByTestId("post-card")).toHaveAttribute(
      "data-media-count",
      "0"
    )

    // No artificial image placeholder and no media semantics.
    expect(screen.queryByTestId("media-image")).not.toBeInTheDocument()
    expect(screen.queryByTestId("media-placeholder")).not.toBeInTheDocument()
    expect(screen.queryByTestId("post-media-grid")).not.toBeInTheDocument()
    expect(container.querySelector("img")).toBeNull()
  })

  it("still shows the full metadata row and Open on X", () => {
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({
          tweet_id: "201",
          username: "@ada",
          media: [],
          text: "Interesting thread about Linux.",
        })}
      />
    )

    expect(screen.getByTestId("post-card")).toHaveTextContent("@ada")
    expect(screen.getByTestId("post-card")).toHaveTextContent(
      "Interesting thread about Linux."
    )
    expect(screen.getByTestId("post-meta")).toBeInTheDocument()
    expect(screen.getByTestId("open-on-x")).toHaveAttribute(
      "href",
      "https://x.com/ada/status/201"
    )
  })

  it("clamps long quote text and expands it inside the panel", async () => {
    const user = userEvent.setup()
    render(
      <PostCard
        now={POST_NOW}
        post={makePost({ tweet_id: "202", media: [], text: LONG_TEXT })}
      />
    )

    expect(screen.getByTestId("post-text").className).toContain("line-clamp")
    await user.click(screen.getByTestId("post-text-toggle"))
    expect(screen.getByTestId("post-text").className).not.toContain(
      "line-clamp"
    )
  })
})

describe("PostCard — the stored handle keeps its single sigil", () => {
  // Regression guard for a bug only visible with real stored data: the extension
  // stores the handle as "@linuxguy" (tweet-extractor's getUsername), and the
  // card used to prepend its own "@", rendering "@@linuxguy" on every real
  // bookmark. The fixtures are sigiled now, so this also guards the fixtures.
  it("renders exactly one @ for a stored handle", () => {
    render(
      <PostCard post={makePost({ tweet_id: "1", username: "@linuxguy" })} />
    )

    expect(screen.getByText("@linuxguy")).toBeInTheDocument()
    expect(screen.queryByText("@@linuxguy")).toBeNull()
  })

  it("still accepts a bare handle from a hand-written row", () => {
    render(
      <PostCard post={makePost({ tweet_id: "2", username: "linuxguy" })} />
    )

    expect(screen.getByText("@linuxguy")).toBeInTheDocument()
  })
})
