/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

@Suppress("unused")
val hideQuickCommentReactionsPatch = bytecodePatch(
    name = "Hide quick comment reactions",
    description = "Hides TikTok's exposed quick emoji row in supported comment inputs.",
    default = true,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableHideCommentQuickReactions()V",
        )

        val row = QuickCommentBindFingerprint.originalClassDef.fields.singleOrNull {
            it.type == QUICK_COMMENT_ROW
        } ?: throw PatchException(
            "Hide quick comment reactions: $QUICK_COMMENT_ASSEM does not hold exactly one " +
                "LinearLayout reaction row.",
        )
        QuickCommentBindFingerprint.method.hookQuickCommentVisibility(row)
    }
}
