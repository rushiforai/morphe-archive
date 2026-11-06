package app.andrewliang.patches.line.hidetransfer

import app.andrewliang.patches.line.shared.hideAttachTile
import app.andrewliang.patches.line.shared.lineSettingsExtensionPatch
import app.andrewliang.patches.line.shared.markLineSettingIncluded
import app.andrewliang.patches.shared.Constants.COMPATIBILITY_LINE
import app.andrewliang.patches.shared.resourceIdsPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideTransferButtonPatch = bytecodePatch(
    name = "[Chat] Hide Transfer button",
    description = "トークルームの「+」添付メニューから送金（LINE Pay）のタイルを取り除きます。",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(resourceIdsPatch)

    dependsOn(lineSettingsExtensionPatch)

    execute {
        hideAttachTile(TransferAttachButtonFingerprint.method.definingClass, "hideTransfer")
        markLineSettingIncluded("hideTransfer")
    }
}
