package app.aidan.patches.sezzle.customization

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val returnZeroBytes = byteArrayOf(0x97.toByte(), 0x01, 0x76.toByte(), 0x01)
private val returnContinueBytes = byteArrayOf(0x90.toByte(), 0x01, 0x7c, 0x11, 0x76.toByte(), 0x01)
private const val LOCK_BUTTON_SCAN_LIMIT = 20_000
private const val LOCK_BUTTON_PROPERTY = "shouldShowLockButton"

/**
 * Forces the `shouldShowLockButton` property read in [functionName] to `false`.
 * Matches either the 16-bit (`GetById`) or 32-bit (`GetByIdLong`) string-index form.
 */
private fun HermesBundleEditor.hideShouldShowLockButton(functionName: String) {
    val functionOffset = findFunctionOffsetByName(functionName)
        ?: throw PatchException("Failed to find function $functionName in Hermes bundle")
    val propertyId = findStringId(LOCK_BUTTON_PROPERTY)
        ?: throw PatchException("String '$LOCK_BUTTON_PROPERTY' not found")
    val bytes = toByteArray()
    val limit = minOf(functionOffset + LOCK_BUTTON_SCAN_LIMIT, bytes.size - 8)

    for (offset in functionOffset until limit) {
        val opcode = bytes[offset]
        val match = when {
            opcode == 0x46.toByte() -> {
                val id = (bytes[offset + 4].toInt() and 0xFF) or
                    ((bytes[offset + 5].toInt() and 0xFF) shl 8) or
                    ((bytes[offset + 6].toInt() and 0xFF) shl 16) or
                    ((bytes[offset + 7].toInt() and 0xFF) shl 24)
                id == propertyId
            }
            opcode == 0x45.toByte() && propertyId <= 0xFFFF -> {
                val id = (bytes[offset + 4].toInt() and 0xFF) or
                    ((bytes[offset + 5].toInt() and 0xFF) shl 8)
                id == propertyId
            }
            else -> false
        }
        if (!match) continue

        val destination = bytes[offset + 1]
        val replacement = if (opcode == 0x46.toByte()) {
            byteArrayOf(0x96.toByte(), destination, 0x93.toByte(), 0x00, 0x93.toByte(), 0x00, 0x93.toByte(), 0x00)
        } else {
            byteArrayOf(0x96.toByte(), destination, 0x93.toByte(), 0x00, 0x93.toByte(), 0x00)
        }
        patchBytes(offset, replacement)
        return
    }
    throw PatchException("Could not find $LOCK_BUTTON_PROPERTY in $functionName")
}

@Suppress("unused")
val unlockCustomAppIconsPatch = rawResourcePatch(
    name = "Unlock Custom App Icons",
    description = "Enables custom launcher app icons (Arctic, Peach, Glass, Rainbow, Sand, Classic) without requiring a Sezzle Premium subscription.",
    default = true
) {
    category("Customization")
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
        editor.hideShouldShowLockButton("AppearanceView")

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
