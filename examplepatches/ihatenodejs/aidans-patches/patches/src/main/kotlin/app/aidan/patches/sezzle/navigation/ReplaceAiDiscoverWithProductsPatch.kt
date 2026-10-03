package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private val EXPECTED_IS_ENABLED_BYTES = byteArrayOf(
    0x45.toByte(), 0x28.toByte(), 0x0b.toByte(), 0x31.toByte(), 0xd9.toByte(), 0x74.toByte()
)
private val FORCED_FALSE_IS_ENABLED_BYTES = byteArrayOf(
    0x96.toByte(), 0x28.toByte(), 0x96.toByte(), 0x28.toByte(), 0x96.toByte(), 0x28.toByte()
)

private val EXPECTED_DISCOVER_TAB_GATE_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val HIDDEN_DISCOVER_TAB_GATE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_SEZZLE_AI_BANNER_BYTES = byteArrayOf(0x34, 0x06, 0x00, 0x41)
private val HIDDEN_SEZZLE_AI_BANNER_BYTES = byteArrayOf(0x94.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_SEZZLE_AI_PILL_BYTES = byteArrayOf(0x34, 0x05, 0x00, 0x89.toByte())
private val HIDDEN_SEZZLE_AI_PILL_BYTES = byteArrayOf(0x94.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_RESOLVE_PRODUCTS_TAB_BYTES = byteArrayOf(0x89.toByte(), 0x02, 0x01, 0x45)
private val HIDDEN_RESOLVE_PRODUCTS_TAB_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

@Suppress("unused")
val replaceAiDiscoverWithProductsPatch = rawResourcePatch(
    name = "Replace AI Discover with Products",
    description = "Replaces the AI Discover navigation tab with Sezzle's original non-AI Products tab and removes the Sezzle AI callout in search. Includes an option to remove the Products tab completely.",
    default = true
) {
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
        val useDiscoverTabBytes = byteArrayOf(
            (useDiscoverTabId and 0xFF).toByte(),
            ((useDiscoverTabId ushr 8) and 0xFF).toByte()
        )
        val isEnabledBytes = byteArrayOf(
            (isEnabledId and 0xFF).toByte(),
            ((isEnabledId ushr 8) and 0xFF).toByte()
        )

        var isEnabledPatched = false
        for (i in protectedStackOffset until minOf(protectedStackOffset + 15_000, bytes.size - 16)) {
            // GetByIdShort r11, r11, cache, useDiscoverTab: 45 0b 0b ?? <useDiscoverTabBytes>
            // Call1 r11, r11, r2: 6c 0b 0b 02
            // GetByIdShort r40, r11, cache, isEnabled: 45 28 0b ?? <isEnabledBytes>
            if (bytes[i] == 0x45.toByte() &&
                bytes[i + 1] == 0x0B.toByte() &&
                bytes[i + 2] == 0x0B.toByte() &&
                bytes[i + 4] == useDiscoverTabBytes[0] &&
                bytes[i + 5] == useDiscoverTabBytes[1] &&
                bytes[i + 6] == 0x6C.toByte() &&
                bytes[i + 7] == 0x0B.toByte() &&
                bytes[i + 8] == 0x0B.toByte() &&
                bytes[i + 9] == 0x02.toByte() &&
                bytes[i + 10] == 0x45.toByte() &&
                bytes[i + 11] == 0x28.toByte() &&
                bytes[i + 12] == 0x0B.toByte() &&
                bytes[i + 14] == isEnabledBytes[0] &&
                bytes[i + 15] == isEnabledBytes[1]
            ) {
                val patchOffset = i + 10
                if (!editor.matchesBytes(patchOffset, EXPECTED_IS_ENABLED_BYTES)) {
                    throw PatchException("Unexpected instruction bytes for isEnabled in ProtectedStack")
                }
                editor.patchBytes(patchOffset, FORCED_FALSE_IS_ENABLED_BYTES)
                isEnabledPatched = true
                break
            }
        }
        if (!isEnabledPatched) {
            throw PatchException("Could not find isEnabled instruction in ProtectedStack")
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
