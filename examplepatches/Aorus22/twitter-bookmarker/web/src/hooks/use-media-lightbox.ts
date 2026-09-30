import { useCallback, useMemo, useRef, useState } from "react"

import {
  findSlotIndex,
  flattenMediaSlots,
  slotAt,
  stepMediaIndex,
  stepPostIndex,
} from "@/lib/lightbox"
import { readScrollY, restoreScrollY } from "@/lib/scroll"
import type { GalleryPost } from "@/types"

/**
 * Lightbox controller (LIGHT-03/LIGHT-05/LIGHT-06, PRD-2 §27/§77).
 *
 * Owns exactly one piece of state — the **identity** of the selected media (its
 * owning tweet plus its index inside that tweet's media array) — and derives
 * the current position in the flattened media sequence from it. The flattened
 * position stays the single source of truth for *where we are*, while the two
 * navigation axes are carved out of it: `goPrevMedia`/`goNextMedia` move within
 * the open tweet and stop at its ends (PRD-2 §27), and
 * `goPrevPost`/`goNextPost` jump to the previous/next tweet that has media. The
 * sequence is bounded by the loaded list, so the lightbox never triggers a page
 * fetch to satisfy a navigation.
 *
 * Deriving the position (rather than storing it) means a search/filter/sort
 * change that replaces the loaded list closes the lightbox by construction: the
 * stored identity simply stops resolving, and a later page of results can never
 * resurrect a stale position. It also keeps the lightbox on the same media when
 * a reshuffle reorders tweets.
 *
 * Scroll preservation and focus restoration: the offset is captured on open and
 * restored on close **after** Radix releases its body scroll lock, and the
 * trigger element passed to {@link UseMediaLightboxResult.open} gets focus back
 * at the same moment (LIGHT-05/LIGHT-06). The trigger is passed explicitly
 * rather than read from `document.activeElement` because a pointer click does
 * not focus the button in every browser — and because jsdom reports `body` as
 * the active element while Radix's `aria-hidden` sibling hiding is applied.
 */

export interface UseMediaLightboxResult {
  /** Flattened position in the loaded media sequence, or `null` when closed. */
  index: number | null
  /** Total media slots across every loaded post. */
  total: number
  /**
   * Open at a clicked tile. A no-op when that slot does not exist. `trigger` is
   * the element focus returns to on close.
   */
  open: (
    postIndex: number,
    mediaIndex: number,
    trigger?: HTMLElement | null
  ) => void
  /** Close, restore focus to the trigger and restore the gallery offset. */
  close: () => void
  /** Step one media back **inside the open tweet**; a no-op at its first media. */
  goPrevMedia: () => void
  /** Step one media forward **inside the open tweet**; a no-op at its last. */
  goNextMedia: () => void
  /** Step to the previous tweet that has media; a no-op at the first loaded. */
  goPrevPost: () => void
  /** Step to the next tweet that has media; a no-op at the last loaded. */
  goNextPost: () => void
}

/** Identity of the selected media, stable across list changes. */
interface MediaSelection {
  tweetId: string
  mediaIndex: number
}

export function useMediaLightbox(
  posts: readonly GalleryPost[]
): UseMediaLightboxResult {
  const slots = useMemo(() => flattenMediaSlots(posts), [posts])
  const [selected, setSelected] = useState<MediaSelection | null>(null)
  const savedScrollRef = useRef(0)
  const triggerRef = useRef<HTMLElement | null>(null)

  const index = useMemo(() => {
    if (selected === null) {
      return null
    }
    const found = slots.findIndex((slot) => {
      const post = posts[slot.postIndex]
      return (
        post !== undefined &&
        post.tweet_id === selected.tweetId &&
        slot.mediaIndex === selected.mediaIndex
      )
    })
    return found < 0 ? null : found
  }, [posts, selected, slots])

  /** Resolve a flattened position back into the media it points at. */
  const selectionAt = useCallback(
    (position: number): MediaSelection | null => {
      const slot = slotAt(slots, position)
      const post = slot === undefined ? undefined : posts[slot.postIndex]
      if (slot === undefined || post === undefined) {
        return null
      }
      return { tweetId: post.tweet_id, mediaIndex: slot.mediaIndex }
    },
    [posts, slots]
  )

  const open = useCallback(
    (postIndex: number, mediaIndex: number, trigger?: HTMLElement | null) => {
      const next = selectionAt(findSlotIndex(slots, postIndex, mediaIndex))
      if (next === null) {
        return
      }
      savedScrollRef.current = readScrollY()
      triggerRef.current = trigger ?? null
      setSelected(next)
    },
    [selectionAt, slots]
  )

  const close = useCallback(() => {
    setSelected(null)

    // Radix's scroll lock is released and its focus trap is torn down when the
    // dialog content unmounts, which happens in the same commit as this state
    // change. Deferring to the next macrotask runs both restores after that;
    // `preventScroll` keeps focusing the trigger from moving the gallery, and
    // `restoreScrollY` is a no-op when the offset is already correct.
    if (typeof window !== "undefined") {
      window.setTimeout(() => {
        const trigger = triggerRef.current
        triggerRef.current = null
        if (trigger !== null && trigger.isConnected) {
          trigger.focus({ preventScroll: true })
        }
        restoreScrollY(savedScrollRef.current)
      }, 0)
    }
  }, [])

  const step = useCallback(
    (stepper: (position: number) => number) => {
      if (index === null) {
        return
      }
      const next = stepper(index)
      if (next === index) {
        return
      }
      const selection = selectionAt(next)
      if (selection !== null) {
        setSelected(selection)
      }
    },
    [index, selectionAt]
  )

  // Two independent axes, matching the two pairs of controls the lightbox
  // renders: media *within* the open tweet (PRD-2 §27) and the tweet itself.
  // Both are clamped, never wrapping, and both are bounded by the loaded list so
  // navigating never triggers a page fetch.
  const goPrevMedia = useCallback(() => {
    step((position) => stepMediaIndex(position, slots, "prev"))
  }, [slots, step])

  const goNextMedia = useCallback(() => {
    step((position) => stepMediaIndex(position, slots, "next"))
  }, [slots, step])

  const goPrevPost = useCallback(() => {
    step((position) => stepPostIndex(position, slots, "prev"))
  }, [slots, step])

  const goNextPost = useCallback(() => {
    step((position) => stepPostIndex(position, slots, "next"))
  }, [slots, step])

  return {
    index,
    total: slots.length,
    open,
    close,
    goPrevMedia,
    goNextMedia,
    goPrevPost,
    goNextPost,
  }
}
