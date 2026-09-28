package app.subwaysurf.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.subwaysurf.patches.shared.Constants.COMPATIBILITY_SUBWAYSURF

private val STATE1_ERROR = byteArrayOf(
    0x1F, 0x09, 0x00, 0x71, 0xC0.toByte(), 0x25, 0x00, 0x54,
)
private val STATE1_ERROR_PATCHED = byteArrayOf(
    0x1F, 0x09, 0x00, 0x71, 0x1F, 0x20, 0x03, 0xD5.toByte(),
)
private val STATE1_GRANT = byteArrayOf(
    0x1F, 0x15, 0x00, 0x71, 0x01, 0x2B, 0x00, 0x54,
)
private val STATE1_GRANT_PATCHED = byteArrayOf(
    0x1F, 0x15, 0x00, 0x71, 0xCA.toByte(), 0xFF.toByte(), 0xFF.toByte(), 0x17,
)
private val PURCHASE_GUARD = byteArrayOf(
    0x68, 0x82.toByte(), 0x40, 0x39, 0xC8.toByte(), 0x03, 0x00, 0x34,
)
private val PURCHASE_GUARD_PATCHED = byteArrayOf(
    0x68, 0x82.toByte(), 0x40, 0x39, 0x1E, 0x00, 0x00, 0x14,
)
private val IAP_LOOKUP_GUARD = byteArrayOf(
    0x80.toByte(), 0x07, 0x00, 0xB4.toByte(), 0x08, 0x0C, 0x40, 0xF9.toByte(),
    0x48, 0x07, 0x00, 0xB4.toByte(), 0x80.toByte(), 0x16, 0x40, 0xF9.toByte(),
)
private val IAP_LOOKUP_GUARD_PATCHED = byteArrayOf(
    0x60, 0x09, 0x00, 0xB4.toByte(), 0x08, 0x0C, 0x40, 0xF9.toByte(),
    0x48, 0x07, 0x00, 0xB4.toByte(), 0x80.toByte(), 0x16, 0x40, 0xF9.toByte(),
)

@Suppress("unused")
val subwaySurfersFreeIapPatch = rawResourcePatch(
    name = "Subway Surfers Free IAP",
    description = "Coins, keys and shop items are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBWAYSURF)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        val sites = listOf(
            STATE1_ERROR to STATE1_ERROR_PATCHED,
            STATE1_GRANT to STATE1_GRANT_PATCHED,
            PURCHASE_GUARD to PURCHASE_GUARD_PATCHED,
            IAP_LOOKUP_GUARD to IAP_LOOKUP_GUARD_PATCHED,
        )

        for ((from, to) in sites) {
            var count = 0
            var at = -1
            var i = 0
            while (i <= bytes.size - from.size) {
                var match = true
                var j = 0
                while (j < from.size) {
                    if (bytes[i + j] != from[j]) {
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
            require(count == 1) { "free iap site not unique: $count matches" }
            to.copyInto(bytes, at)
        }

        soFile.writeBytes(bytes)
    }
}
