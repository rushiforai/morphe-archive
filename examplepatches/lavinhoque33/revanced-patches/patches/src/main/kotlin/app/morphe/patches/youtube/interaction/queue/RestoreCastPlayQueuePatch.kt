/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.interaction.queue

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.feature.booleanFeatureGetter
import app.morphe.patches.youtube.utils.feature.booleanFeatureGetterResult
import app.morphe.patches.youtube.utils.feature.booleanFeatureResult
import app.morphe.patches.youtube.utils.feature.overrideBooleanDecision
import app.morphe.patches.youtube.utils.patch.PatchList.RESTORE_CAST_PLAY_QUEUE
import app.morphe.patches.youtube.utils.playservice.is_21_02_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn

private const val DISABLE_PLAY_QUEUE_DIALOG = 45414906L
private const val DISCONNECT_ON_VIDEO_CHANGE = 45693138L
private const val EXTENSION = "Lapp/morphe/extension/youtube/patches/queue/CastPlayQueuePatch;"

private val DisableCastDialogLegacyGetter = booleanFeatureGetter(DISABLE_PLAY_QUEUE_DIALOG)

private object CastRemoteWatchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Lj$/util/Optional;"),
    strings = listOf("showRemoteWatchDialogFragment called while paused."),
)

@Suppress("unused")
val restoreCastPlayQueuePatch = bytecodePatch(RESTORE_CAST_PLAY_QUEUE.title, RESTORE_CAST_PLAY_QUEUE.summary) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(sharedExtensionPatch, settingsPatch, versionCheckPatch)

    execute {
        val handler = CastRemoteWatchFingerprint.matchOrNull()?.method
        val dialogResult = handler?.booleanFeatureResult(DISABLE_PLAY_QUEUE_DIALOG)
            ?: handler?.let {
                val getter = DisableCastDialogLegacyGetter.matchOrNull()?.originalMethod ?: return@let null
                it.booleanFeatureGetterResult(getter)
            }
        val disconnectResult = handler?.booleanFeatureResult(DISCONNECT_ON_VIDEO_CHANGE)

        // 20.05 has the dialog decision but not the newer early exit that releases the receiver.
        if (handler == null || dialogResult == null || (is_21_02_or_greater && disconnectResult == null)) {
            printWarn("Restore Cast Play/Queue: the native Cast video selection decisions were not found.")
            return@execute
        }

        // Only override the remote watch handler. Keep the flag getter and config serialization stock.
        listOfNotNull(dialogResult, disconnectResult).sortedDescending().forEach { index ->
            handler.overrideBooleanDecision(index, "$EXTENSION->useStockCastRestriction(Z)Z")
        }
        addPreference(arrayOf("PREFERENCE_SCREEN: VIDEO", "SETTINGS: RESTORE_CAST_PLAY_QUEUE"), RESTORE_CAST_PLAY_QUEUE)
    }
}
