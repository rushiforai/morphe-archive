package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private val EXPECTED_DISCOVER_TAB_GATE_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val HIDDEN_DISCOVER_TAB_GATE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_SEZZLE_AI_BANNER_BYTES = byteArrayOf(0x34, 0x06, 0x00, 0x41)
private val HIDDEN_SEZZLE_AI_BANNER_BYTES = byteArrayOf(0x94.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_SEZZLE_AI_PILL_BYTES = byteArrayOf(0x34, 0x05, 0x00, 0x89.toByte())
private val HIDDEN_SEZZLE_AI_PILL_BYTES = byteArrayOf(0x94.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_RESOLVE_PRODUCTS_TAB_BYTES = byteArrayOf(0x89.toByte(), 0x02, 0x01, 0x46)
private val HIDDEN_RESOLVE_PRODUCTS_TAB_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

/**
 * Checks whether an encoded `GetById`/`GetByIdLong` instruction at [offset] references
 * [stringId]. [instructionLength] is the encoded length of the instruction.
 */
private fun referencesString(
    bytes: ByteArray,
    offset: Int,
    instructionLength: Int,
    stringId: Int
): Boolean {
    val actual = when (instructionLength) {
        6 -> (bytes[offset + 4].toInt() and 0xFF) or
            ((bytes[offset + 5].toInt() and 0xFF) shl 8)
        8 -> (bytes[offset + 4].toInt() and 0xFF) or
            ((bytes[offset + 5].toInt() and 0xFF) shl 8) or
            ((bytes[offset + 6].toInt() and 0xFF) shl 16) or
            ((bytes[offset + 7].toInt() and 0xFF) shl 24)
        else -> return false
    }
    return actual == stringId
}

@Suppress("unused")
val replaceAiDiscoverWithProductsPatch = rawResourcePatch(
    name = "Replace AI Discover with Products",
    description = "Replaces the AI Discover navigation tab with Sezzle's original non-AI Products tab and removes the Sezzle AI callout in search. Includes an option to remove the Products tab completely.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    val removeProductsTab = booleanOption(
        key = "removeProductsTab",
        default = false,
        title = "Remove Products Tab",
        description = "Removes the Products tab from the navigation bar altogether instead of keeping it as a replacement for Discover."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        // 1. Unmount Discover tab from navbar in ProtectedStack
        val protectedStackOffset = editor.findFunctionOffsetByName("ProtectedStack")
            ?: throw PatchException("ProtectedStack function not found")

        val useDiscoverTabId = editor.findStringId("useDiscoverTab")
            ?: throw PatchException("String 'useDiscoverTab' not found")
        val isEnabledId = editor.findStringId("isEnabled")
            ?: throw PatchException("String 'isEnabled' not found")

        val bytes = editor.toByteArray()
        val scanLimit = minOf(protectedStackOffset + 20_000, bytes.size - 16)
        var isEnabledPatched = false
        for (offset in protectedStackOffset until scanLimit) {
            val useDiscoverOpcode = bytes[offset]
            val useDiscoverLength = when (useDiscoverOpcode) {
                0x45.toByte() -> 6
                0x46.toByte() -> 8
                else -> continue
            }
            if (!referencesString(bytes, offset, useDiscoverLength, useDiscoverTabId)) continue

            val callOffset = offset + useDiscoverLength
            if (bytes[callOffset] != 0x6C.toByte()) continue

            val isEnabledOffset = callOffset + 4
            val isEnabledOpcode = bytes[isEnabledOffset]
            val isEnabledLength = when (isEnabledOpcode) {
                0x45.toByte() -> 6
                0x46.toByte() -> 8
                else -> continue
            }
            if (!referencesString(bytes, isEnabledOffset, isEnabledLength, isEnabledId)) continue

            val destination = bytes[isEnabledOffset + 1]
            editor.patchBytes(
                isEnabledOffset,
                byteArrayOf(
                    0x96.toByte(), destination,
                    0x96.toByte(), destination,
                    0x96.toByte(), destination
                ).copyOf(isEnabledLength)
            )
            isEnabledPatched = true
            break
        }
        if (!isEnabledPatched) {
            throw PatchException("Could not find useDiscoverTab().isEnabled in ProtectedStack")
        }

        // 2. Disable useDiscoverTabEnabled gate function: returns false
        val discoverTabEnabledOffset = editor.findFunctionOffsetByName("useDiscoverTabEnabled")
            ?: throw PatchException("useDiscoverTabEnabled function not found")
        editor.patchBytesIfMatches(
            discoverTabEnabledOffset,
            EXPECTED_DISCOVER_TAB_GATE_BYTES,
            HIDDEN_DISCOVER_TAB_GATE_BYTES
        )

        // 3. Remove Sezzle AI banner in search: SezzleAIBanner component returns null
        val sezzleAiBannerOffset = editor.findFunctionOffsetByName("SezzleAIBanner")
            ?: throw PatchException("SezzleAIBanner function not found")
        editor.patchBytesIfMatches(
            sezzleAiBannerOffset,
            EXPECTED_SEZZLE_AI_BANNER_BYTES,
            HIDDEN_SEZZLE_AI_BANNER_BYTES
        )

        // 4. Remove Sezzle AI pill in search: SezzleAIPill component returns null
        val sezzleAiPillOffset = editor.findFunctionOffsetByName("SezzleAIPill")
            ?: throw PatchException("SezzleAIPill function not found")
        editor.patchBytesIfMatches(
            sezzleAiPillOffset,
            EXPECTED_SEZZLE_AI_PILL_BYTES,
            HIDDEN_SEZZLE_AI_PILL_BYTES
        )

        // 5. Optionally remove Products tab fallback altogether
        if (removeProductsTab.value == true) {
            val resolveProductsTabOffset = editor.findFunctionOffsetByName("resolveShouldRenderProductsTab")
                ?: throw PatchException("resolveShouldRenderProductsTab function not found")
            editor.patchBytesIfMatches(
                resolveProductsTabOffset,
                EXPECTED_RESOLVE_PRODUCTS_TAB_BYTES,
                HIDDEN_RESOLVE_PRODUCTS_TAB_BYTES
            )
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
