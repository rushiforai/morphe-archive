package app.template.patches.reddit.deletedcomments

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.reddit.shared.injectListingChildrenFilter

/**
 * Show deleted comments — Reddit (com.reddit.frontpage)
 *
 * Reddit renders comments whose author deleted them (or that a moderator
 * removed) as `[deleted]` / `[removed]` and does NOT send the original text
 * to clients, so an archive is the only source.  This patch hooks the same
 * verified `Listing.children` choke point as "Block AutoMod comments" /
 * "Content filters" and, for each comment-shaped row whose body is exactly
 * `[deleted]` or `[removed]`, looks the comment id up in a public archive and
 * swaps in the archived text (prefixed with `[archived] `).
 *
 * HOW IT WORKS
 *   1. `Listing.<init>` (and `getChildren()` when present) is wrapped with
 *      `RedditDeletedCommentHelper.undeleteComments(List)`.  Comment threads
 *      are deserialized off the main thread, so the synchronous archive
 *      request does not run on the UI thread.
 *   2. The helper collects the ids of exactly the deleted/removed comments in
 *      the listing, issues ONE batched HTTP GET per listing to the free
 *      Arctic Shift id lookup (`/api/comments/ids`, no API key) and falls
 *      back to PullPush (`/reddit/search/comment`, also keyless) when Arctic
 *      Shift errors or has no copy.  Listings with no deleted comments never
 *      touch the network.
 *   3. Restored bodies are prefixed with `[archived] ` so provenance is
 *      always visible.  Results (including misses) are cached in memory for
 *      the process lifetime.
 *
 * HONEST LIMITS
 *   - Coverage depends entirely on the archive: comments archived before the
 *     deletion can be restored; comments never archived (very recent, or
 *     posted after the archive's collection horizon) stay `[deleted]`.
 *   - The archive lags live Reddit; a comment deleted minutes after posting
 *     may be missing.
 *   - Every listing that contains a deleted comment sends that comment's id
 *     (and only the id) to the archive host.  Enable only if you're
 *     comfortable with that; hence off by default.
 *   - Deleted self-posts (t3_*) are out of scope, matching the comment-only
 *     semantics of the AutoMod / content-filter helpers.
 *
 * Verified endpoints on 2026-11-06 against
 *   GET https://arctic-shift.photon-reddit.com/api/comments/ids?ids=t1_dppum98&fields=id,body
 *   → HTTP 200, {"data":[{"body":"…","id":"dppum98"}]} (no key required).
 *
 * Implementation status: the injection rides the already-verified 2026.42.0
 * `Listing.children` anchor used by "Block AutoMod comments" (see
 * `reddit/shared/RedditListingChildren.kt`), so the bytecode side is
 * low-risk.  The runtime restore path (reflection into the comment model +
 * archive fetch) has NOT been exercised on-device yet — it fails safe to the
 * stock `[deleted]` row and never throws into app code.  Static verification
 * only: no JDK/APK was available in this workspace; run the CI build and a
 * real 2026.42.0 APK before release.
 */

private const val DELETED_COMMENT_HELPER =
    "Lapp/template/extension/extension/RedditDeletedCommentHelper;"

@Suppress("unused")
val redditShowDeletedCommentsPatch = bytecodePatch(
    name = "Show deleted comments",
    description = "Shows the original text of comments deleted or removed on Reddit, " +
        "restored at render time from the free Arctic Shift archive (no API key; " +
        "falls back to PullPush). Only the ids of deleted comments in the threads " +
        "you open are sent, and restored text is prefixed with [archived]. " +
        "Coverage depends on the archive; needs network. Off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        injectListingChildrenFilter(
            helperMethod = "undeleteComments",
            logTag = "Show deleted comments",
            helperClass = DELETED_COMMENT_HELPER,
        )
    }
}
