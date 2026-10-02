/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.autoadvance

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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PATCH = "Stop Story auto-advance"
internal const val HOLD = "$EXTENSION_PACKAGE/stories/StoryAdvance;->hold()Z"
private const val REEL_ITEM = "Lcom/instagram/model/reels/ReelItem;"

@Suppress("unused")
val stopStoryAutoAdvancePatch = bytecodePatch(
    name = "Stop Story auto-advance",
    description = "Keeps each story on screen until you tap or swipe. Turn the switch off for Instagram's timing.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        holdFinishedStories()
        enableStatus("storyAutoAdvance")
    }
}

/**
 * Asks the extension first thing in the story viewer's handler for a finished story item, and
 * returns before the viewer moves on when it says to hold. Taps and swipes move the viewer through
 * other methods, so they still work.
 */
internal fun BytecodePatchContext.holdFinishedStories() {
    uniqueMethod(PATCH, "finished story handler", StoryItemDoneFingerprint).apply {
        // The handler's first act is to cast the item it was handed to a story item. Anything else
        // there means the fingerprint found some other bridge.
        val first = getInstruction(0)
        if (first.opcode != Opcode.CHECK_CAST || (first as ReferenceInstruction).reference.toString() != REEL_ITEM) {
            throw PatchException("$PATCH: $definingClass->$name doesn't start by casting its item to $REEL_ITEM")
        }
        requireLocals(PATCH, 1)
        addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $HOLD
                move-result v0
                if-eqz v0, :advance
                return-void
            """,
            ExternalLabel("advance", first),
        )
    }
}
