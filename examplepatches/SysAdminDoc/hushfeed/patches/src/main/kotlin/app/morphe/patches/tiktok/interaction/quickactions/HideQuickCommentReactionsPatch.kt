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
import app.morphe.patches.tiktok.shared.guardAtEntry

private const val FEATURE_CONTROLS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/featurecontrols/FeatureControls;"

@Suppress("unused")
val hideQuickCommentReactionsPatch = bytecodePatch(
    name = "Hide quick comment reactions",
    description = "Hides the emoji row above the comment box and the quick comment strip on videos. Switch: Hushfeed settings > Comments.",
    default = true,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4703())

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

        // The row of emoji clusters above the comment box is a different surface: the comment
        // keyboard adds it through a slot trigger whose predicate decides whether the mini panel
        // exists at all. Answering "no" there removes the row in both keyboard states; the
        // visibility hook above never sees it. Found on the S22 on 2026-09-17, where the switch
        // left the comment sheet's row in place.
        ExposedEmojiPanelTriggerFingerprint.method.guardAtEntry(
            "Hide quick comment reactions",
            "invoke-static {}, $FEATURE_CONTROLS_DESCRIPTOR->hideQuickCommentReactions()Z",
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
