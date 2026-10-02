/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.watchhistory

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireLocals
import app.morphe.patches.instagram.misc.extension.uniqueMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Don't send reel watch history"
internal const val HOLD_BACK = "$EXTENSION_PACKAGE/reels/ReelWatchHistory;->holdBack()Z"

/**
 * The batch's two record methods, by parameters: a reel reached (its media id and the id of the
 * blend it came in) and how far into a reel you got (its media id and a time).
 */
internal val RECORDS = listOf(
    "Ljava/lang/String;Ljava/lang/String;" to "watched reel record",
    "Ljava/lang/String;J" to "watch progress record",
)

@Suppress("unused")
val dontSendReelWatchHistoryPatch = bytecodePatch(
    name = "Don't send reel watch history",
    description = "Stops telling Instagram which reels you watched and how far into them you got. It's used " +
        "to rank your Reels, and nobody else sees it. Reels you've already watched may come back.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        holdBackWatchedReels()
        enableStatus("reelWatchHistory")
    }
}

/**
 * Asks the extension first thing in each of the pending batch's record methods, and returns before
 * the reel goes in when it says to hold back. With nothing recorded, the batch Instagram flushes to
 * clips/write_seen_state/ stays empty, and so does the copy it keeps on disk to send again later.
 */
internal fun BytecodePatchContext.holdBackWatchedReels() {
    val request = uniqueMethod(PATCH, "watched reels request", WatchedReelsRequestFingerprint)
    val batch = mutableClassDefBy(request.definingClass)
    RECORDS.forEach { (parameters, what) ->
        val record = batch.methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.joinToString("") == parameters
        }.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one instance method ($parameters)V beside the watched reels request in " +
                "${batch.type}, the $what",
        )
        record.requireLocals(PATCH, 1)
        record.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $HOLD_BACK
                move-result v0
                if-eqz v0, :record
                return-void
            """,
            ExternalLabel("record", record.getInstruction(0)),
        )
    }
}
