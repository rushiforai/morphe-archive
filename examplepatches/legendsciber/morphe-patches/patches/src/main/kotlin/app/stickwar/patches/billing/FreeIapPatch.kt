package app.stickwar.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.stickwar.patches.shared.Constants.COMPATIBILITY_STICKWAR

private val SKU_AVAILABLE_FORCE_TRUE = byteArrayOf(
    0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x02, 0xA9.toByte(), 0x96.toByte(), 0x97.toByte(), 0x00, 0xF0.toByte(),
)
private val SKU_AVAILABLE_FORCE_TRUE_PATCHED = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
    0x1F, 0x20, 0x03, 0xD5.toByte(), 0x1F, 0x20, 0x03, 0xD5.toByte(),
)
private val PURCHASE_GRANT_BRANCH = byteArrayOf(
    0x6B, 0x00, 0x00, 0x94.toByte(), 0xA0.toByte(), 0x05, 0x00, 0x36,
)
private val PURCHASE_GRANT_BRANCH_PATCHED = byteArrayOf(
    0x6B, 0x00, 0x00, 0x94.toByte(), 0x1F, 0x20, 0x03, 0xD5.toByte(),
)

@Suppress("unused")
val stickWarFreeIapPatch = rawResourcePatch(
    name = "Stick War Legacy Free IAP",
    description = "Shop packs, gems and chests are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STICKWAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        val sites = listOf(
            SKU_AVAILABLE_FORCE_TRUE to SKU_AVAILABLE_FORCE_TRUE_PATCHED,
            PURCHASE_GRANT_BRANCH to PURCHASE_GRANT_BRANCH_PATCHED,
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
