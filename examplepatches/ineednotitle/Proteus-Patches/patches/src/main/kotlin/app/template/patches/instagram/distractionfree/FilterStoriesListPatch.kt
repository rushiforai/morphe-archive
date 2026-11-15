/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.BytecodePatchContext
import app.template.patches.instagram.shared.filterInstagramStories

context(patchContext: BytecodePatchContext)
internal fun filterSuggestedStories() = filterInstagramStories(
    "suggested_user_reel",
    "suggested_user",
    "suggested_creator_reel",
)

context(patchContext: BytecodePatchContext)
internal fun filterHighlightedStories() = filterInstagramStories(
    "highlight_rewind_reel",
)

context(patchContext: BytecodePatchContext)
internal fun filterAllStories() {
    filterSuggestedStories()
    filterHighlightedStories()
    filterInstagramStories("user_reel")
}
