package app.aidan.patches.sezzle.customization

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val returnZeroBytes = byteArrayOf(0x97.toByte(), 0x01, 0x76.toByte(), 0x01)
private val returnContinueBytes = byteArrayOf(0x90.toByte(), 0x01, 0x7c, 0x11, 0x76.toByte(), 0x01)
private val hideAppearanceLockBytes = byteArrayOf(0x96.toByte(), 0x06, 0x93.toByte(), 0x00, 0x93.toByte(), 0x00)

@Suppress("unused")
val unlockCustomAppIconsPatch = rawResourcePatch(
    name = "Unlock Custom App Icons",
    description = "Enables custom launcher app icons (Arctic, Peach, Glass, Rainbow, Sand, Classic) without requiring a Sezzle Premium subscription.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        val userShouldSeeChangeAppIconOffset = editor.findFunctionOffsetByName("userShouldSeeChangeAppIcon")
            ?: throw PatchException("Failed to find function userShouldSeeChangeAppIcon in Hermes bundle")
        editor.patchBytesIfMatches(
            userShouldSeeChangeAppIconOffset,
            byteArrayOf(0x34, 0x01, 0x00, 0x89.toByte()),
            returnZeroBytes
        )

        val appIconNavigationStatusOffset = editor.findFunctionOffsetByName("getAppIconNavigationStatus")
            ?: throw PatchException("Failed to find function getAppIconNavigationStatus in Hermes bundle")
        editor.patchBytesIfMatches(
            appIconNavigationStatusOffset,
            byteArrayOf(0x34, 0x01, 0x00, 0x89.toByte(), 0x07, 0x01),
            returnContinueBytes
        )
        val appearanceViewOffset = editor.findFunctionOffsetByName("AppearanceView")
            ?: throw PatchException("Failed to find function AppearanceView in Hermes bundle")
        editor.patchBytesIfMatches(
            appearanceViewOffset + 0x95,
            byteArrayOf(0x45, 0x06, 0x02, 0x09, 0x37, 0x50),
            hideAppearanceLockBytes
        )


        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
