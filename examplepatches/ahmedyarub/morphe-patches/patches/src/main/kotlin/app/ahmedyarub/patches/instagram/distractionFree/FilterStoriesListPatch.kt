/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * Compatibility widened to Instagram 446.0.0.49.77; patch logic unchanged.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.morphe.library.instagram.patches.filterStories
import app.morphe.patcher.patch.BytecodePatchContext

context(_: BytecodePatchContext)
internal fun filterSuggestedStories() = filterStories(
    "suggested_user_reel",
    "suggested_user",
    "suggested_creator_reel"
)

context(_: BytecodePatchContext)
internal fun filterHighlightedStories() = filterStories(
    "highlight_rewind_reel"
)


context(_: BytecodePatchContext)
internal fun filterAllStories() {
    filterSuggestedStories()
    filterHighlightedStories()
    filterStories("user_reel")
}
