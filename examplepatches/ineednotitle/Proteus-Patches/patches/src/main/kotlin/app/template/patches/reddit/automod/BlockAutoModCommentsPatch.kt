package app.template.patches.reddit.automod

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.reddit.shared.injectListingChildrenFilter

/**
 * Block AutoMod comments — Reddit (com.reddit.frontpage)
 *
 * Hides every comment-shaped row authored by u/AutoModerator (or u/AutoMod),
 * including the stickied "please read the rules" bot comments that many
 * communities pin to the top of every thread.  AutoModerator *posts* (weekly
 * discussion threads, etc.) are intentionally kept: the helper only drops rows
 * whose Reddit kind is `t1_*` / whose model has comment markers and no title.
 *
 * Mechanism:
 *   1. The patch injects `RedditContentFilterHelper.hideAutoModComments(List)`
 *      at the `Listing.children` choke point (constructor field write and the
 *      optional `getChildren()` getter).  Feeds and comment threads both build
 *      this container, so the filter covers every surface that renders a
 *      comment row.
 * 2. The extension resolves the underlying Reddit model reflectively, reads
 *      its author and decides comment-vs-post shape from `getKindWithId()`,
 *      `getKind()`/`getType()`, `getParentId()`/`getLinkId()`/`getDepth()` and
 *      title/body accessors.  Nothing is imported from the app, so R8-renamed
 *      model classes do not break compilation; unrecognised shapes are kept
 *      (fail-safe).  If the author getter cannot be resolved at all, a comment
 *      whose body contains the canonical AutoModerator footer ("I am a bot,
 *      and this action was performed automatically") is still dropped; a
 *      resolved non-AutoModerator author always wins.
 * 3. At runtime the helper prints a one-time `[Proteus][Block AutoMod]
 *      filter is live` line plus throttled drop counts to `System.out`
 *      (visible with `adb logcat | grep -i proteus`).  If that line never
 *      appears, the comment-thread renderer in this build does not flow
 *      through `Listing` and this patch cannot hide those comments — the
 *      choke point, not the detector, needs rework for that build.
 *
 * Local client-side filtering only: the comments are still delivered by the
 * API, and the comment count in the header may still include them.  Off by
 * default so users who rely on stickied mod notices can leave them visible.
 *
 * Verified statically against the Reddit 2026.42.0 `Listing` layout used by
 * "Remove ads"; no APK was available in this workspace for on-device testing.
 */
@Suppress("unused")
val redditBlockAutoModCommentsPatch = bytecodePatch(
    name = "Block AutoMod comments",
    description = "Hides all comments from u/AutoModerator, including stickied bot comments. " +
        "AutoModerator posts are kept. Client-side only; off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        injectListingChildrenFilter(
            helperMethod = "hideAutoModComments",
            logTag = "Block AutoMod comments",
        )
    }
}
