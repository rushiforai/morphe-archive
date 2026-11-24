package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

/**
 * Renames the Shop tab to Home.
 *
 * The tab keeps Sezzle's stock store screen. Replacing StoreRoot's composition
 * is not safe on 5.3.24: its synthetic child wiring expects component props that
 * the module dependency table cannot supply, so the replacement dashboard either
 * renders blank or mounts PaymentStreakBanner without `sezzleUpCreditLimit` and
 * trips the app error boundary.
 */
@Suppress("unused")
val renameShopToHomePatch = rawResourcePatch(
    name = "Rename Shop to Home",
    description = "Renames the Shop bottom navigation tab to Home.",
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

        val protectedStackOffset = editor.findFunctionOffsetByName("ProtectedStack")
            ?: throw PatchException("ProtectedStack function not found")

        val oldTitleId = editor.findStringId("navigation.Shop")
            ?: throw PatchException("String 'navigation.Shop' not found")
        val newTitleId = editor.findStringId("navigation.Home")
            ?: throw PatchException("String 'navigation.Home' not found")

        val bytes = editor.toByteArray()
        val oldTitleLow = (oldTitleId and 0xFF).toByte()
        val oldTitleHigh = ((oldTitleId ushr 8) and 0xFF).toByte()
        val newTitleLow = (newTitleId and 0xFF).toByte()
        val newTitleHigh = ((newTitleId ushr 8) and 0xFF).toByte()

        var titlePatched = false
        for (i in protectedStackOffset until minOf(protectedStackOffset + 15_000, bytes.size - 3)) {
            // LoadConstString opcode is 0x90, format: [0x90, reg, id_low, id_high].
            if ((bytes[i].toInt() and 0xFF) == 0x90 &&
                bytes[i + 2] == oldTitleLow &&
                bytes[i + 3] == oldTitleHigh
            ) {
                bytes[i + 2] = newTitleLow
                bytes[i + 3] = newTitleHigh
                titlePatched = true
                break
            }
        }
        if (!titlePatched) {
            throw PatchException("Could not find LoadConstString instruction for navigation.Shop in ProtectedStack")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
