package app.hillclimb.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.hillclimb.patches.shared.Constants.COMPATIBILITY_HILLCLIMB

private class OwnershipSite(
    val label: String,
    val anchor: ByteArray,
    val replacement: ByteArray,
)

private val OWNERSHIP_SITES = listOf(
    OwnershipSite(
        label = "getIAPCoins",
        anchor = byteArrayOf(
            0x09, 0x01, 0x00, 0x39, 0x8A.toByte(), 0xFF.toByte(), 0xFF.toByte(), 0x17,
        ),
        replacement = byteArrayOf(
            0xE0.toByte(), 0x47, 0x88.toByte(), 0x52, 0xE0.toByte(), 0x01, 0x80.toByte(),
            0x72, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPGems",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0x67, 0xD7.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0xE0.toByte(), 0x47, 0x88.toByte(), 0x52, 0xE0.toByte(), 0x01, 0x80.toByte(),
            0x72, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPPaints",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0x45, 0xD7.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0xE0.toByte(), 0x47, 0x88.toByte(), 0x52, 0xE0.toByte(), 0x01, 0x80.toByte(),
            0x72, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPAdSkips",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0x23, 0xD7.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0xE0.toByte(), 0x7C, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F,
            0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPBundle",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0x01, 0xD7.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPError",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0xDF.toByte(), 0xD6.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0x00, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    OwnershipSite(
        label = "getIAPAdFree",
        anchor = byteArrayOf(
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0x9F.toByte(), 0xD5.toByte(), 0x13,
            0x94.toByte(),
        ),
        replacement = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
)

private fun indexOfUnique(bytes: ByteArray, anchor: ByteArray, label: String): Int {
    var count = 0
    var at = -1
    var i = 0
    while (i <= bytes.size - anchor.size) {
        var match = true
        var j = 0
        while (j < anchor.size) {
            if (bytes[i + j] != anchor[j]) {
                match = false
                break
            }
            j++
        }
        if (match) {
            count++
            at = i
            if (count > 1) break
        }
        i++
    }
    require(count == 1) { "$label site not unique: $count matches" }
    return at
}

@Suppress("unused")
val hillClimbFreeIapPatch = rawResourcePatch(
    name = "Hill Climb Racing Free IAP",
    description = "Every in-app purchase is granted for free: coins, gems, paints, ad-skips, bundles and ad-free are reported as already bought with a full balance, without Google Play billing and without a network connection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HILLCLIMB)

    execute {
        val soFile = get("lib/arm64-v8a/libgame.so", true)
        val bytes = soFile.readBytes()

        for (site in OWNERSHIP_SITES) {
            val at = indexOfUnique(bytes, site.anchor, site.label) + site.anchor.size
            site.replacement.copyInto(bytes, at)
        }

        soFile.writeBytes(bytes)
    }
}
