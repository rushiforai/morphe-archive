import type { GalleryPost } from "@/types"

/**
 * Flattened lightbox navigation (LIGHT-03, PRD-2 §27).
 *
 * The lightbox is modelled over a single ordered sequence of media slots rather
 * than a tree of posts: `posts[i].media[j]` becomes slot `k`. Walking `k`
 * forwards therefore walks the rest of the current tweet and then continues
 * into the next loaded tweet's media, which is exactly PRD-2 §27's behaviour.
 *
 * Everything here is pure and free of React so the whole navigation contract —
 * text-only posts contributing no slots, first/last boundary detection, and the
 * clamp that makes `next`/`prev` a no-op (never a wrap) at the loaded edges — is
 * unit-testable without a DOM.
 */

/** One media item's position in the accumulated gallery. */
export interface MediaSlot {
  /** Index into the `posts` array the sequence was flattened from. */
  postIndex: number
  /** Index into that post's `media` array. */
  mediaIndex: number
}

/** The minimal post shape flattening needs (a `GalleryPost` satisfies it). */
export type MediaSlotSource = Pick<GalleryPost, "media">

/** The two directions the lightbox can step in. */
export type LightboxDirection = "next" | "prev"

/** True when `count` is a usable non-negative integer length. */
function normalizeCount(count: number): number {
  return Number.isFinite(count) ? Math.max(0, Math.trunc(count)) : 0
}

/**
 * Flatten posts into their media slots, in gallery order.
 *
 * A post with no media (a text-only tweet, PRD-2 §22) contributes **zero**
 * entries, so it can never produce a slot that points at a non-existent image
 * or shift the positions of later media. The result is the exact sequence the
 * open position is expressed in; both navigation axes — the media arrows inside
 * the tweet and the post arrows between tweets — are derived from it rather than
 * from a second, parallel notion of "current tweet".
 */
export function flattenMediaSlots(
  posts: readonly MediaSlotSource[]
): MediaSlot[] {
  const slots: MediaSlot[] = []

  posts.forEach((post, postIndex) => {
    const media = Array.isArray(post.media) ? post.media : []
    for (let mediaIndex = 0; mediaIndex < media.length; mediaIndex += 1) {
      slots.push({ postIndex, mediaIndex })
    }
  })

  return slots
}

/** The flattened position of `(postIndex, mediaIndex)`, or `-1` if absent. */
export function findSlotIndex(
  slots: readonly MediaSlot[],
  postIndex: number,
  mediaIndex: number
): number {
  return slots.findIndex(
    (slot) => slot.postIndex === postIndex && slot.mediaIndex === mediaIndex
  )
}

/** The slot at `index`, or `undefined` for any out-of-range/NaN index. */
export function slotAt(
  slots: readonly MediaSlot[],
  index: number
): MediaSlot | undefined {
  if (!Number.isFinite(index)) {
    return undefined
  }
  const normalized = Math.trunc(index)
  if (normalized < 0 || normalized >= slots.length) {
    return undefined
  }
  return slots[normalized]
}

/**
 * The target index one step in `direction`, **clamped** to the loaded sequence.
 *
 * Stepping past the end returns the end and stepping before the start returns
 * the start: with `total === 0` (or a non-finite `index`) it returns `-1`, the
 * "nothing active" value. There is deliberately no modulo/wrap behaviour, so
 * the first/last item's disabled control and this function can never disagree.
 */
export function stepSlotIndex(
  index: number,
  total: number,
  direction: LightboxDirection
): number {
  const count = normalizeCount(total)
  if (count === 0 || !Number.isFinite(index)) {
    return -1
  }

  const current = Math.min(Math.max(Math.trunc(index), 0), count - 1)
  if (direction === "next") {
    return Math.min(current + 1, count - 1)
  }
  return Math.max(current - 1, 0)
}

/** True when `index` is the first slot of a non-empty sequence. */
export function isFirstSlot(index: number, total: number): boolean {
  const count = normalizeCount(total)
  return count > 0 && Number.isFinite(index) && Math.trunc(index) === 0
}

/** True when `index` is the last slot of a non-empty sequence. */
export function isLastSlot(index: number, total: number): boolean {
  const count = normalizeCount(total)
  return count > 0 && Number.isFinite(index) && Math.trunc(index) === count - 1
}

/**
 * Media navigation **inside the open tweet** (PRD-2 §27: "next image / previous
 * image di dalam tweet yang sama").
 *
 * This is the inner pair of controls. At the ends of the tweet's own media it is
 * a no-op and returns `index` unchanged — crossing into the next tweet is
 * {@link stepPostIndex}'s job, on its own pair of controls, so the two buttons
 * a user can see always agree with what their click does.
 *
 * `slots` is grouped by post (see {@link flattenMediaSlots}), so "is there a
 * neighbour inside this tweet?" is just a look at the adjacent entry.
 */
export function stepMediaIndex(
  index: number,
  slots: readonly MediaSlot[],
  direction: LightboxDirection
): number {
  const at = Number.isFinite(index) ? Math.trunc(index) : Number.NaN
  const slot = slotAt(slots, at)
  if (slot === undefined) {
    return -1
  }

  const delta = direction === "next" ? 1 : -1
  const neighbour = slots[at + delta]
  if (neighbour === undefined || neighbour.postIndex !== slot.postIndex) {
    return at
  }
  return at + delta
}

/**
 * The distinct posts that own at least one media slot, in gallery order.
 *
 * Text-only tweets (PRD-2 §22) contribute no slot, so they are skipped here too:
 * post navigation moves between *media-bearing* tweets and never lands on a post
 * with nothing to show. De-duplicated by identity rather than by comparing
 * neighbours, so a caller that hands over an ungrouped slot list still gets each
 * post once.
 */
export function postsWithMedia(slots: readonly MediaSlot[]): number[] {
  const owners: number[] = []
  const seen = new Set<number>()

  for (const slot of slots) {
    if (!seen.has(slot.postIndex)) {
      seen.add(slot.postIndex)
      owners.push(slot.postIndex)
    }
  }

  return owners
}

/**
 * The first media of the previous/next tweet that has media, clamped at the
 * loaded edges (no wrap, matching {@link stepSlotIndex}).
 *
 * Landing on the neighbour's *first* media rather than reproducing the old
 * media index is deliberate: tweets have different media counts, and index 3 of
 * a one-image tweet does not exist.
 */
export function stepPostIndex(
  index: number,
  slots: readonly MediaSlot[],
  direction: LightboxDirection
): number {
  const at = Number.isFinite(index) ? Math.trunc(index) : Number.NaN
  const slot = slotAt(slots, at)
  if (slot === undefined) {
    return -1
  }

  const owners = postsWithMedia(slots)
  const position = owners.indexOf(slot.postIndex)
  if (position < 0) {
    return at
  }

  const target =
    direction === "next"
      ? Math.min(position + 1, owners.length - 1)
      : Math.max(position - 1, 0)
  if (target === position) {
    return at
  }

  const next = findSlotIndex(slots, owners[target], 0)
  return next < 0 ? at : next
}

/**
 * At most this many media dots are rendered at once (design spec §3.5).
 *
 * Tweet media counts are unbounded in storage — a thread can carry dozens of
 * images — and a dot per image would become an unreadable bead necklace. Above
 * the limit the dots become a sliding window centred on the active media, the
 * usual carousel treatment; the exact position stays available to assistive
 * tech through the counter's label.
 */
export const MEDIA_DOT_LIMIT = 9

/** The contiguous range of dots to render, and the index the range starts at. */
export interface MediaDotWindow {
  /** Index of the first rendered dot, in media terms. */
  start: number
  /** How many dots to render. */
  count: number
}

/**
 * The dot range for `mediaIndex` of `mediaTotal`.
 *
 * Returns the whole sequence when it fits, otherwise a `maxDots`-wide window
 * that always contains the active media and is clamped to the ends (so the
 * first and last media sit in a full window rather than a short one). An empty
 * sequence renders no dots rather than one phantom dot.
 */
export function mediaDotWindow(
  mediaIndex: number,
  mediaTotal: number,
  maxDots: number = MEDIA_DOT_LIMIT
): MediaDotWindow {
  const total = normalizeCount(mediaTotal)
  if (total === 0) {
    return { start: 0, count: 0 }
  }

  const limit = Math.max(1, normalizeCount(maxDots))
  const size = Math.min(limit, total)
  if (size >= total) {
    return { start: 0, count: total }
  }

  const active = Math.min(
    Math.max(Number.isFinite(mediaIndex) ? Math.trunc(mediaIndex) : 0, 0),
    total - 1
  )
  const centred = active - Math.floor(size / 2)
  const start = Math.min(Math.max(centred, 0), total - size)

  return { start, count: size }
}
