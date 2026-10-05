package app.slingdrift.patches.vip

import app.morphe.patcher.patch.rawResourcePatch
import app.slingdrift.patches.shared.Constants.COMPATIBILITY_SLINGDRIFT

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val SITES = listOf(
    "GameData.IsVip" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        0xD3.toByte(), 0xF2.toByte(), 0x00, 0xF0.toByte(), 0x74, 0xE1.toByte(), 0x00,
        0x90.toByte(), 0x68, 0x3A, 0x6B, 0x39,
    ),
    "GameData.IsSubscription" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        0xD3.toByte(), 0xF2.toByte(), 0x00, 0xF0.toByte(), 0x74, 0xE1.toByte(), 0x00,
        0x90.toByte(), 0x68, 0x32, 0x6B, 0x39,
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
val slingDriftVipUnlockPatch = rawResourcePatch(
    name = "Sling Drift VIP Unlock",
    description = "VIP status and the active subscription are always reported, so VIP cars and every VIP-gated feature stay available without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SLINGDRIFT)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for ((label, anchor) in SITES) {
            FORCE_TRUE.copyInto(bytes, indexOfUnique(bytes, anchor, label))
        }

        soFile.writeBytes(bytes)
    }
}
