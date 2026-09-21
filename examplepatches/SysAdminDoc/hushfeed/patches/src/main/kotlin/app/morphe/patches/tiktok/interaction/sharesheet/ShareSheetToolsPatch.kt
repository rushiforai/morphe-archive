/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.interaction.sharesheet

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.inbox.MainActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/share/ShareSheetTools;"

@Suppress("unused")
val shareSheetToolsPatch = bytecodePatch(
    name = "Share sheet tools",
    description = "Asks twice before a video is sent to a friend from the share sheet. " +
        "The check follows the account or conversation instead of the visible name and covers " +
        "accessibility actions and keyboard input. It can also hide chosen people, share options " +
        "or the whole Send to row, and a profile's or a LIVE's share sheet can hide a different " +
        "set from a video's. Switch: Hushfeed settings > Share sheet.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        hookShareModel()
        hookShareRecipientConfirmation()
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableShareSheet()V",
        )

        // p0 is the activity. /range because a parameter register is usually above v15.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->install(Landroid/app/Activity;)V",
        )
    }
}
