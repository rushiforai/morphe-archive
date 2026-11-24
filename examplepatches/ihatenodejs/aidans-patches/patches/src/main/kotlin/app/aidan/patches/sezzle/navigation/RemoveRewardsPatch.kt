package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val removeRewardsPatch = rawResourcePatch(
    name = "Remove Rewards",
    description = "Removes the Rewards bottom navigation tab while keeping Account's Sezzle Points item accessible.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val isShowEarnTabOffset = editor.findFunctionOffsetByName("useIsShowEarnTabEnabled")
            ?: throw PatchException("Failed to find function useIsShowEarnTabEnabled in Hermes bundle")

        // Hide the Rewards bottom navigation tab. The Home shortcut is hidden by
        // Configure Shortcuts by default; the Account > Sezzle Points entry stays intact.
        editor.patchBytes(
            isShowEarnTabOffset,
            byteArrayOf(0x96.toByte(), 0x01.toByte(), 0x76.toByte(), 0x01.toByte())
        )

        val cachedIsShowEarnTabOffset = editor.findFunctionOffsetByName("useCachedIsShowEarnTabEnabled")
        if (cachedIsShowEarnTabOffset != null) {
            editor.patchBytes(
                cachedIsShowEarnTabOffset,
                byteArrayOf(0x96.toByte(), 0x01.toByte(), 0x76.toByte(), 0x01.toByte())
            )
        }

        // StoreRoot reads this hook to build the "Get Rewards" header pill.
        // Returning undefined leaves the guarded reads empty, so the pill is
        // not shown even when the Rewards tab entry point is otherwise present.
        val earnButtonOffset = editor.findFunctionOffsetByName("useEarnButtonOnShopFeature")
        if (earnButtonOffset != null) {
            editor.patchBytes(
                earnButtonOffset,
                byteArrayOf(0x93.toByte(), 0x00, 0x76, 0x00)
            )
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
