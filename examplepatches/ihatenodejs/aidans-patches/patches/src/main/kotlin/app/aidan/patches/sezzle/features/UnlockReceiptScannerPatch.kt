package app.aidan.patches.sezzle.features

import app.aidan.patches.sezzle.dev.unlockDevSettingsPatch
import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val UPSIDE_RECEIPT_SCANNER_ENABLED_FUNCTION_PREFIX = byteArrayOf(
    0x34,
    0x03,
    0x00,
    0x3b
)

private const val EARN_SLICE = "earnSlice"
private const val RECEIPT_SCANNER_V2_PROPERTY = "showReceiptScannerV2"
private const val RECEIPT_SCANNER_V2_SHOW_VALUE = "show"

/**
 * Reconstructs the short selector function that reads
 * `earnSlice.showReceiptScannerV2 === "show"` using the current string table.
 */
private fun HermesBundleEditor.buildReceiptScannerV2VisibilitySelector(): ByteArray {
    fun shortId(name: String): ByteArray {
        val id = findStringId(name)
            ?: throw PatchException("String '$name' not found")
        require(id <= 0xFFFF) { "String '$name' id $id does not fit GetById" }
        return byteArrayOf((id and 0xFF).toByte(), ((id ushr 8) and 0xFF).toByte())
    }

    val earnSliceBytes = shortId(EARN_SLICE)
    val propertyBytes = shortId(RECEIPT_SCANNER_V2_PROPERTY)
    val showBytes = shortId(RECEIPT_SCANNER_V2_SHOW_VALUE)

    return byteArrayOf(
        0x89.toByte(), 0x01, 0x01,
        0x45, 0x01, 0x01, 0x00, *earnSliceBytes,
        0x45, 0x02, 0x01, 0x01, *propertyBytes,
        0x90.toByte(), 0x01, *showBytes,
        0x17, 0x00, 0x02, 0x01,
        0x76, 0x00
    )
}

private val RECEIPT_SCANNER_V2_VISIBILITY_SELECTOR_PREFIX = byteArrayOf(
    0x89.toByte(),
    0x01,
    0x01,
    0x45
)

private val RETURN_TRUE = byteArrayOf(
    0x95.toByte(),
    0x01,
    0x76,
    0x01
)

/**
 * Returns the byte offset of the unique Receipt Scanner V2 visibility-selector sequence.
 *
 * @throws PatchException if the sequence is absent or occurs more than once.
 */
private fun HermesBundleEditor.findReceiptScannerV2VisibilitySelector(): Int {
    val selector = buildReceiptScannerV2VisibilitySelector()
    val bundle = toByteArray()
    var selectorOffset = -1
    var selectorCount = 0

    for (offset in 0..(bundle.size - selector.size)) {
        if (matchesBytes(offset, selector)) {
            selectorOffset = offset
            selectorCount++
        }
    }

    if (selectorCount != 1) {
        throw PatchException(
            "Expected exactly one Receipt Scanner V2 visibility selector, found $selectorCount"
        )
    }

    return selectorOffset
}

@Suppress("unused")
val unlockReceiptScannerPatch = rawResourcePatch(
    name = "Unlock Receipt Scanner",
    description = "Makes the receipt scanner available from Development Settings and forces its V2 flow to render. REQUIRES Unlock Developer Settings to be enabled.",
    default = false
) {
    category("Features")
    compatibleWith(COMPATIBILITY_SEZZLE)
    dependsOn(unlockDevSettingsPatch)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        val offsets = editor.findFunctionOffsetsByName("useIsUpsideReceiptScanningEnabled")
        if (offsets.isEmpty()) {
            throw PatchException("Failed to find function useIsUpsideReceiptScanningEnabled in Hermes bundle")
        }

        // In Hermes v98: LoadConstTrue r1 (0x95 0x01); Ret r1 (0x76 0x01).
        // This keeps the existing Upside offer entry point enabled.
        for (offset in offsets) {
            editor.patchBytesIfMatches(
                offset,
                UPSIDE_RECEIPT_SCANNER_ENABLED_FUNCTION_PREFIX,
                RETURN_TRUE
            )
        }

        // The V2 scanner itself is separately hidden unless the server rollout state is "show".
        // Force the selector used by both ReceiptScannerGate and DevSettingsView so that the
        // existing "Open Multi-Photo Scanner" control is rendered and its route mounts the scanner.
        val visibilitySelectorOffset = editor.findReceiptScannerV2VisibilitySelector()
        editor.patchBytesIfMatches(
            visibilitySelectorOffset,
            RECEIPT_SCANNER_V2_VISIBILITY_SELECTOR_PREFIX,
            RETURN_TRUE
        )

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
