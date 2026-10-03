package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val POINTS_TAB_HANDLER_ROUTE_LOOKUP_BYTES = byteArrayOf(
    0x5e, 0x06, 0x00, 0x1a, 0x93.toByte(), 0x02, 0x6e, 0x06,
    0x03, 0x02, 0x06, 0x45, 0x06, 0x06, 0x01, 0x62,
    0x47, 0x45, 0x0a, 0x06, 0x02, 0x5d, 0xb9.toByte()
)

private const val POINTS_TAB_ROUTE_LOOKUP_OFFSET = 0x34

private val WITHDRAWAL_ROUTE_LOOKUP_BYTES = byteArrayOf(
    0x5e, 0x06, 0x03, 0x1a, 0x93.toByte(), 0x00, 0x6e, 0x06,
    0x04, 0x00, 0x06, 0x45, 0x06, 0x06, 0x01, 0x62,
    0x47, 0x45, 0x06, 0x06, 0x02, 0x4d, 0xce.toByte()
)

private val POINTS_TAB_WITHDRAWAL_ROUTE_LOOKUP_BYTES = WITHDRAWAL_ROUTE_LOOKUP_BYTES.copyOf().apply {
    this[lastIndex - 1] = 0x5d
    this[lastIndex] = 0xb9.toByte()
}

private val P2P_DISPATCH_ENTRY_BYTES = byteArrayOf(
    0x3b, 0x01, 0x00, 0x09, 0xb2.toByte(), 0x0d, 0x01,
    0x3b, 0x02, 0x00, 0x0b, 0xb1.toByte(), 0x13, 0x01, 0x00, 0x00, 0x02,
    0x3b, 0x02, 0x00, 0x06, 0xb1.toByte(), 0x95.toByte(), 0x00, 0x00, 0x00, 0x02,
    0x3b, 0x02, 0x00, 0x07, 0xb1.toByte(), 0x8b.toByte(), 0x00, 0x00, 0x00, 0x02,
    0xb2.toByte(), 0x2b, 0x01, 0x34, 0x01, 0x01, 0x3b, 0x02, 0x01, 0x00, 0x3b
)

private val P2P_POINTS_NAVIGATION_BYTES = byteArrayOf(
    0x3b, 0x05, 0x00, 0x00, 0x44, 0x04, 0x05, 0x03, 0xc5.toByte(),
    0x02, 0x03, 0x36, 0x4f, 0x00, 0x00, 0x32, 0xc1.toByte(), 0x10, 0x00,
    0x02, 0x01, 0x73, 0x25, 0x00, 0x00, 0xc4.toByte(), 0xbb.toByte(), 0x09, 0x00,
    0x52, 0x03, 0x01, 0x02, 0x90.toByte(), 0x01, 0xcd.toByte(), 0x0a,
    0x6f, 0x01, 0x04, 0x05, 0x01, 0x03,
    0xaf.toByte(), 0x9c.toByte(), 0x00, 0x00, 0x00
)

/**
 * Returns the byte offset of the sole occurrence of [sequence], counting overlapping
 * matches. An empty sequence matches every boundary, including the end of [bytes].
 * [description] identifies the sequence in errors.
 *
 * @throws PatchException if there are zero or multiple matches.
 */
private fun findUniqueSequence(bytes: ByteArray, sequence: ByteArray, description: String): Int {
    val matches = mutableListOf<Int>()
    for (offset in 0..(bytes.size - sequence.size)) {
        var isMatch = true
        for (index in sequence.indices) {
            if (bytes[offset + index] != sequence[index]) {
                isMatch = false
                break
            }
        }
        if (isMatch) {
            matches.add(offset)
        }
    }
    return matches.singleOrNull()
        ?: throw PatchException("Expected unique $description, found ${matches.size} matches")
}

@Suppress("unused")
val removeRewardsPatch = rawResourcePatch(
    name = "Remove Rewards",
    description = "Removes Rewards navigation while keeping Account's Sezzle Points item and routing the Home shortcut to the same page.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val isShowEarnTabOffset = editor.findFunctionOffsetByName("useIsShowEarnTabEnabled")
            ?: throw PatchException("Failed to find function useIsShowEarnTabEnabled in Hermes bundle")

        // 1. Hide the Rewards bottom navigation tab
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

        // 2. Route "customer/points" through the always-mounted P2P deep-link
        // dispatcher, then retarget its withdrawal branch to Account's
        // SezzleSpend -> SezzlePoints destination. Disable the competing
        // Rewards-owned points effect to avoid duplicate navigation.
        val routeBytes = editor.toByteArray()
        val pointsTabRouteLookupOffset = findUniqueSequence(
            routeBytes,
            POINTS_TAB_HANDLER_ROUTE_LOOKUP_BYTES,
            "points-tab deep-link route lookup"
        )
        val pointsTabHandlerOffset = pointsTabRouteLookupOffset - POINTS_TAB_ROUTE_LOOKUP_OFFSET
        editor.patchBytesIfMatches(
            pointsTabHandlerOffset,
            byteArrayOf(0x34, 0x01, 0x00, 0x3b),
            byteArrayOf(0x93.toByte(), 0x00, 0x76, 0x00)
        )

        val withdrawalRouteLookupOffset = findUniqueSequence(
            routeBytes,
            WITHDRAWAL_ROUTE_LOOKUP_BYTES,
            "withdrawal route lookup"
        )
        editor.patchBytesIfMatches(
            withdrawalRouteLookupOffset,
            WITHDRAWAL_ROUTE_LOOKUP_BYTES,
            POINTS_TAB_WITHDRAWAL_ROUTE_LOOKUP_BYTES
        )

        val p2pDispatchOffset = findUniqueSequence(
            routeBytes,
            P2P_DISPATCH_ENTRY_BYTES,
            "P2P deep-link dispatch entry"
        )
        editor.patchBytesIfMatches(
            p2pDispatchOffset,
            P2P_DISPATCH_ENTRY_BYTES,
            P2P_POINTS_NAVIGATION_BYTES
        )

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
