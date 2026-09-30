import { Images } from "lucide-react"
import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { Link, useParams } from "react-router-dom"

import {
  CollectionEmptyState,
  CollectionFilterEmptyState,
  CollectionToolbar,
  DeletePostDialog,
  FilterControl,
  GalleryBottomLoader,
  GalleryErrorState,
  GalleryMasonry,
  InfiniteSentinel,
  MasonrySkeleton,
  MediaLightbox,
  MovePostDialog,
  PostCard,
} from "@/components/gallery"
import {
  useGalleryQuery,
  useMasonryColumns,
  useMediaLightbox,
  usePosts,
} from "@/hooks"
import { deleteBookmark, moveBookmark } from "@/lib/api"
import { formatCollectionCounts } from "@/lib/collection-meta"
import { masonryContainerWidth } from "@/lib/masonry"
import {
  BACK_TO_COLLECTIONS_LABEL,
  DELETE_POST_FAILED_MESSAGE,
  LOADING_POSTS_LABEL,
  MOVE_POST_FAILED_MESSAGE,
} from "@/lib/messages"
import { pickPlaceholderGradient } from "@/lib/placeholder"
import { selectPostsViewState } from "@/lib/posts-state"
import { scrollNearTop } from "@/lib/scroll"
import type { GalleryPost } from "@/types"

/**
 * Collection route `/collections/:slug` (design spec §3.3, frame `6:121`).
 *
 * Header: `← Collections` back link, a `96×96` `r24` gradient icon seeded
 * deterministically from the slug, the title Playfair Bold 38 and the meta
 * `186 posts · 220 media` at x=184, set at `text-xl` because the size of the
 * folder is what the page is opened to find out. The mockup's description line
 * (y=198) is
 * omitted (spec §7 — there is no description field) and so are the
 * media-type (y=350) and topic (y=394) pills.
 *
 * Column: the hero, the toolbar and the masonry share one content column that
 * is capped to `masonryContainerWidth(count)` and centred in the shell's rail
 * (see the note on `columnProbeRef` below). That keeps the page gutters even —
 * the exact-fit cap is what stops the cards leaving a hole on the right at the
 * widths between two column thresholds.
 *
 * Discovery (Phase 6): `useGalleryQuery` owns search/filter/sort in the URL and
 * derives the exact request params, `usePosts` resets pages/cursor the moment
 * the query key changes, and a query-change effect scrolls near the top
 * (PRD-2 §76/§77).
 *
 * Paging (Phase 7): `usePosts` accumulates pages of 30 and exposes
 * `loadMore`/`hasMore`/`isLoadingMore`. An `InfiniteSentinel` after the masonry
 * requests the next page ~600px before the bottom; the already-loaded cards stay
 * mounted while a page loads and only the small `GalleryBottomLoader` appears
 * below them (never a full-page skeleton). `loadMore` never scrolls.
 *
 * Exactly one content state renders:
 *   loading          → `MasonrySkeleton` (never a blank page, PRD-2 §35)
 *   error            → `GalleryErrorState` with the PRD-2 §61 copy + Retry
 *   empty collection → `This collection is empty` (PRD-2 §60)
 *   empty filters    → `No posts match your filters` + a working `Clear filters`
 *   posts            → `GalleryMasonry` of `PostCard`s, the bottom loader while
 *                      a page is in flight, and the sentinel
 *
 * Lightbox (Phase 8, LIGHT-01…LIGHT-06): media tiles are focusable triggers
 * whose click hands `(postIndex, mediaIndex)` to `useMediaLightbox`, which holds
 * the position in the flattened media sequence of the **accumulated** `posts`
 * array. Navigation therefore walks within a tweet and on into the next loaded
 * tweet, and is bounded by what is loaded (no fetch is triggered by the
 * lightbox). One `MediaLightbox` renders the active post beside its media.
 */
export function CollectionPage() {
  const { slug } = useParams<{ slug: string }>()
  const {
    query,
    search,
    setSearch,
    setSort,
    applyFilters,
    clearFilters,
    filterActive,
    hasActiveQuery,
    queryKey,
    requestParams,
  } = useGalleryQuery()

  const {
    posts,
    status,
    errorMessage,
    collection,
    hasMore,
    isLoadingMore,
    loadMore,
    refetch,
    removePost,
  } = usePosts(slug, requestParams)

  // The lightbox is driven entirely by the accumulated loaded list: its
  // flattened media sequence is derived from `posts`, so it can never request a
  // page of its own (LIGHT-03).
  const lightbox = useMediaLightbox(posts)

  // Curation state. The dialogs live here, on the page, rather than on each
  // card: one set for every post, and one place that owns the request and the
  // error copy.
  const [pendingDelete, setPendingDelete] = useState<GalleryPost | null>(null)
  const [pendingMove, setPendingMove] = useState<GalleryPost | null>(null)
  const [curationBusy, setCurationBusy] = useState(false)
  const [curationError, setCurationError] = useState<string | null>(null)

  // Where a menu/dialog opened *from the lightbox* must portal itself. Radix
  // mounts to `document.body` by default, which would put it outside the
  // dialog's focus trap; the lightbox's content element keeps Tab inside.
  //
  // A callback ref into state, not a plain ref: the page has to *re-render* once
  // the lightbox content exists, and a ref mutation alone does not re-render.
  // Without this the menu would be handed a stale `null` and mount outside the
  // trap. The same element is captured onto the dialog when it opens, so a
  // portal never moves mid-flight when the lightbox closes underneath it.
  const [lightboxContainer, setLightboxContainer] =
    useState<HTMLDivElement | null>(null)
  const lightboxContentRef = useCallback((node: HTMLDivElement | null) => {
    setLightboxContainer(node)
  }, [])
  const [dialogContainer, setDialogContainer] = useState<HTMLDivElement | null>(
    null
  )

  const requestDelete = useCallback(
    (post: GalleryPost) => {
      setCurationError(null)
      setDialogContainer(lightboxContainer)
      setPendingDelete(post)
    },
    [lightboxContainer]
  )

  const requestMove = useCallback(
    (post: GalleryPost) => {
      setCurationError(null)
      setDialogContainer(lightboxContainer)
      setPendingMove(post)
    },
    [lightboxContainer]
  )

  // Cards are never inside the lightbox, so their menu keeps Radix's default
  // portal. A stable object identity keeps the memoised cards from re-rendering.
  const cardActions = useMemo(
    () => ({ onRequestDelete: requestDelete, onRequestMove: requestMove }),
    [requestDelete, requestMove]
  )
  const lightboxActions = useMemo(
    () => ({ ...cardActions, portalContainer: lightboxContainer }),
    [cardActions, lightboxContainer]
  )

  /**
   * Run one curation request and apply it to the screen.
   *
   * `removePost` is deliberately not a `refetch()`: a refetch would reset the
   * cursor and page 1 and throw a scrolled-down user back to the top. The row is
   * removed from the held pages instead, so the scroll position and the pages
   * below it survive.
   */
  const runCuration = useCallback(
    async (
      tweetId: string,
      action: () => Promise<unknown>,
      failure: string
    ) => {
      setCurationBusy(true)
      setCurationError(null)
      try {
        await action()
        removePost(tweetId)
      } catch {
        // Nothing changed on the server, so nothing changes here either: the
        // card stays exactly where it was and the user is told.
        setCurationError(failure)
      } finally {
        setCurationBusy(false)
      }
    },
    [removePost]
  )

  const confirmDelete = useCallback(() => {
    if (pendingDelete === null) {
      return
    }
    const tweetId = pendingDelete.tweet_id
    setPendingDelete(null)
    void runCuration(
      tweetId,
      () => deleteBookmark(tweetId),
      DELETE_POST_FAILED_MESSAGE
    )
  }, [pendingDelete, runCuration])

  const confirmMove = useCallback(
    (targetSlug: string) => {
      if (pendingMove === null) {
        return
      }
      const tweetId = pendingMove.tweet_id
      setPendingMove(null)
      void runCuration(
        tweetId,
        () => moveBookmark(tweetId, targetSlug),
        MOVE_POST_FAILED_MESSAGE
      )
    },
    [pendingMove, runCuration]
  )

  // Focus recovery after a removal. The kebab that asked for the action lives
  // inside the card being removed, so the browser drops focus onto `<body>` and
  // the next Tab would restart from the top of the page. Moving focus to the
  // heading keeps the keyboard user where they were working. Runs on the commit
  // that removes the card, so the outcome is already on screen.
  const headingRef = useRef<HTMLHeadingElement>(null)
  const previousPostCountRef = useRef(posts.length)
  useEffect(() => {
    const previous = previousPostCountRef.current
    previousPostCountRef.current = posts.length
    if (posts.length >= previous) {
      return
    }
    const active = document.activeElement
    if (active === null || active === document.body) {
      headingRef.current?.focus()
    }
  }, [posts.length])

  // PRD-2 §21 / design spec §3.3: the hero, the toolbar and the masonry share
  // one content column, capped to exactly what the current column count needs
  // and centred inside the shell's rail.
  //
  // The cap is what keeps the page gutters honest. `masonryContainerWidth` is
  // the exact-fit width of `count` cards, so without it a 3-column grid leaves
  // 292px of dead space on the right at a 1360px window (the cards are 940, the
  // rail is 1232); capping the column to the grid's own width makes the cards
  // fill it edge to edge, so the space left over is split evenly instead of
  // piling up on one side.
  //
  // The probe measured here is the **uncapped** outer wrapper, and that is
  // load-bearing: a capped element measured against its own cap can never grow.
  // Widen the window and the column would stay at its old width, no resize would
  // fire, and the extra columns would never appear until a reload — the same
  // deadlock `GalleryMasonry` documents for its own list.
  const columnProbeRef = useRef<HTMLDivElement>(null)
  const columnCount = useMasonryColumns(columnProbeRef)

  // PRD-2 §77: on any search/filter/sort change the loaded pages and cursor are
  // already reset by `usePosts`' request key; this adds the "scroll near the
  // top" half. Mount is skipped — the page starts at the top anyway.
  const hasMountedRef = useRef(false)
  useEffect(() => {
    if (!hasMountedRef.current) {
      hasMountedRef.current = true
      return
    }
    scrollNearTop()
  }, [queryKey])

  // `filtersActive` here means "the query narrows the result set" (search *or*
  // dates), which is what makes a zero-result view the filter-no-match state
  // rather than an empty collection (COLL-10).
  const viewState = selectPostsViewState(status, posts.length, hasActiveQuery)
  const displayName =
    collection !== undefined && collection.name.trim() !== ""
      ? collection.name
      : (slug ?? "Collection")
  const icon = pickPlaceholderGradient(slug ?? "collection")

  return (
    <div ref={columnProbeRef} className="w-full">
      <div
        data-testid="collection-column"
        className="mx-auto flex w-full flex-col pb-10"
        style={{ maxWidth: `${masonryContainerWidth(columnCount)}px` }}
      >
        <Link
          to="/"
          className="w-fit text-[11px] leading-[1.4] font-medium text-muted transition-colors outline-none hover:text-ink focus-visible:ring-3 focus-visible:ring-ring/50"
        >
          {BACK_TO_COLLECTIONS_LABEL}
        </Link>

        <header className="mt-4 flex items-start gap-6">
          <span
            aria-hidden="true"
            data-testid="collection-icon"
            style={{ backgroundImage: icon.value }}
            className="flex size-24 shrink-0 items-center justify-center rounded-2xl text-white/80"
          >
            <Images className="size-9" />
          </span>
          <div className="flex h-24 min-w-0 flex-col justify-between py-0.5">
            <h1
              id="collection-heading"
              data-testid="collection-heading"
              ref={headingRef}
              // Programmatic-only focus target: `-1` keeps it out of the tab
              // order while still letting the removal effect move focus here.
              tabIndex={-1}
              className="rounded-sm text-[28px] leading-[1.1] font-bold break-words text-ink outline-none focus-visible:ring-3 focus-visible:ring-ring/50 md:text-[38px]"
            >
              {displayName}
            </h1>
            {collection === undefined ? null : (
              <p
                data-testid="collection-counts"
                className="text-xl leading-[1.4] font-medium text-muted md:text-2xl"
              >
                {formatCollectionCounts(collection)}
              </p>
            )}
          </div>
        </header>

        <CollectionToolbar
          className="mt-[52px]"
          search={search}
          onSearchChange={setSearch}
          filterActive={filterActive}
          filterControl={
            <FilterControl
              active={filterActive}
              query={query}
              onApply={applyFilters}
            />
          }
          sort={query.sort}
          onSortChange={setSort}
        />

        {curationError === null ? null : (
          <p
            role="alert"
            data-testid="curation-error"
            className="mt-6 rounded-lg border border-destructive/30 bg-destructive/10 px-3 py-2 text-sm text-destructive"
          >
            {curationError}
          </p>
        )}

        <div
          className="mt-6"
          data-testid="collection-content"
          data-view-state={viewState}
        >
          {viewState === "loading" ? (
            <MasonrySkeleton label={LOADING_POSTS_LABEL} />
          ) : null}

          {viewState === "error" ? (
            <GalleryErrorState message={errorMessage} onRetry={refetch} />
          ) : null}

          {viewState === "empty-collection" ? <CollectionEmptyState /> : null}

          {viewState === "empty-filters" ? (
            <CollectionFilterEmptyState onClearFilters={clearFilters} />
          ) : null}

          {viewState === "posts" ? (
            <>
              <GalleryMasonry columns={columnCount}>
                {posts.map((post, postIndex) => (
                  <PostCard
                    key={post.tweet_id}
                    post={post}
                    actions={cardActions}
                    onOpenMedia={(mediaIndex, trigger) => {
                      lightbox.open(postIndex, mediaIndex, trigger)
                    }}
                  />
                ))}
              </GalleryMasonry>
              {/* A page load never hides the cards above: only this compact row
                  appears (PRD-2 §35). */}
              {isLoadingMore ? <GalleryBottomLoader /> : null}
              {/* Decorative scroll trigger; disconnects once `has_more` is false. */}
              <InfiniteSentinel onIntersect={loadMore} disabled={!hasMore} />
            </>
          ) : null}
        </div>

        {/* Rendered from the page so it survives the masonry's re-renders, and
            closed (unmounted) whenever no media slot is active. */}
        <MediaLightbox
          posts={posts}
          index={lightbox.index}
          collectionName={displayName}
          onPrevMedia={lightbox.goPrevMedia}
          onNextMedia={lightbox.goNextMedia}
          onPrevPost={lightbox.goPrevPost}
          onNextPost={lightbox.goNextPost}
          onClose={lightbox.close}
          actions={lightboxActions}
          contentRef={lightboxContentRef}
        />

        {/* One set of curation dialogs for the whole page. `dialogContainer` is
            captured when a dialog opens (not read live), so a dialog opened from
            the lightbox keeps portalling inside it even as the lightbox closes
            underneath — and a dialog opened from a card keeps mounting on
            `document.body` as Radix intends. */}
        <DeletePostDialog
          post={pendingDelete}
          open={pendingDelete !== null}
          onOpenChange={(open) => {
            if (!open) {
              setPendingDelete(null)
            }
          }}
          busy={curationBusy}
          onConfirm={confirmDelete}
          portalContainer={dialogContainer}
        />
        <MovePostDialog
          post={pendingMove}
          currentSlug={slug ?? ""}
          open={pendingMove !== null}
          onOpenChange={(open) => {
            if (!open) {
              setPendingMove(null)
            }
          }}
          busy={curationBusy}
          onConfirm={confirmMove}
          portalContainer={dialogContainer}
        />
      </div>
    </div>
  )
}
