/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.watchhistory

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Holds back the batches of watched reels Facebook's Reels viewer sends for its own ranking. See
 * SeenStateSend.kt for what the batch is and where the hook goes.
 *
 * The hook takes the place of the flush's hand-over to its executor, after the queue has been
 * emptied and the mutation built, and before anything reaches the GraphQL layer, so a batch held
 * back is gone rather than kept for a later send. The extension hands the
 * runnable to the executor as Facebook would unless the switch is on and the runnable is the one
 * Redex named as the seen-state send.
 *
 * Off in the default selection: it trades Facebook's record of what you've watched for reels you've
 * seen coming back, which is a choice to make, not a fix. Picked, its switch starts on.
 */
@Suppress("unused")
val dontSendReelWatchHistoryPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Don't send reel watch history",
    description = "Stops sending Facebook the list of reels you've watched. It's used to rank your Reels feed, " +
        "and nobody else sees it. Reels you've already watched may come back in the feed.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val points = classDefByStrings(SEEN_STATE_MUTATION, StringComparisonType.EQUALS).flatMap { owner ->
            owner.methods.mapNotNull { method -> sendPoint(method) { classDefByOrNull(it) }?.let { method to it } }
        }
        val (flush, index) = points.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one method holding \"$SEEN_STATE_MUTATION\" and \"$VIDEO_IDS\" that hands the runnable " +
                "Redex names $SEEN_STATE_SEND to an Executor after naming the mutation, found ${points.size}",
        )
        mutableClassDefBy(flush.definingClass).methods.single {
            it.name == flush.name && it.returnType == flush.returnType &&
                it.parameterTypes.map(Any::toString) == flush.parameterTypes.map(Any::toString)
        }.withholdSendAt(index)
        enableStatus("reelWatchHistory")
    }
}
