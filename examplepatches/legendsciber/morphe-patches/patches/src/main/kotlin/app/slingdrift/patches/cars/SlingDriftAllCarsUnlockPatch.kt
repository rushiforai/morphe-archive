package app.slingdrift.patches.cars

import app.morphe.patcher.patch.rawResourcePatch
import app.slingdrift.patches.shared.Constants.COMPATIBILITY_SLINGDRIFT

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val SITES = listOf(
    "CarSetup.IsUnlocked" to byteArrayOf(
        0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(), 0xF4.toByte(), 0x4F, 0x01,
        0xA9.toByte(), 0x14, 0xF6.toByte(), 0x00, 0xF0.toByte(), 0xF3.toByte(), 0x03, 0x00,
        0xAA.toByte(), 0x88.toByte(), 0xBA.toByte(), 0x5D, 0x39,
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
val slingDriftAllCarsUnlockPatch = rawResourcePatch(
    name = "Sling Drift All Cars Unlock",
    description = "Every car reports as unlocked, so the whole garage is available right away no matter how the car would normally be earned.",
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
