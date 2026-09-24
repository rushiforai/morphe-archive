package app.finance.patches.sezzle.navigation

import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.finance.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val removeRewardsPatch = rawResourcePatch(
    name = "Remove Rewards",
    description = "Removes the Rewards tab from the navigation bar and disables associated reward screens.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val funcOffset = editor.findFunctionOffsetByName("useIsShowEarnTabEnabled")
            ?: throw PatchException("Failed to find function useIsShowEarnTabEnabled in Hermes bundle")

        // In Hermes v98: LoadConstFalse r1 (0x96 0x01); Ret r1 (0x76 0x01)
        editor.patchBytes(
            funcOffset,
            byteArrayOf(0x96.toByte(), 0x01.toByte(), 0x76.toByte(), 0x01.toByte())
        )
        editor.updateFooterHash()

        bundleFile.writeBytes(editor.toByteArray())
    }
}
