package app.soccerstar.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val B_CAVE = byteArrayOf(
    0x48, 0xB4.toByte(), 0xFF.toByte(), 0x17,
)

private val CAVE_STUB = byteArrayOf(
    0xE0.toByte(), 0x03, 0x17, 0xAA.toByte(),
    0x40, 0x00, 0x00, 0xB4.toByte(),
    0x9D.toByte(), 0xC2.toByte(), 0x1F, 0x94.toByte(),
    0xFD.toByte(), 0x7B, 0x43, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x42, 0xA9.toByte(),
    0xF6.toByte(), 0x57, 0x41, 0xA9.toByte(),
    0xF8.toByte(), 0x5F, 0xC4.toByte(), 0xA8.toByte(),
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val LOADED_OFFSETS = intArrayOf(
    0x00BA1BF8,
    0x00BA23C8,
    0x00B914FC,
    0x00B94618,
)

@Suppress("unused")
val soccerStarInstantRewarded = rawResourcePatch(
    name = "Soccer Star Instant Rewarded",
    description = "Rewarded and interstitial ad flows always report loaded and grant the success callback immediately without playing an ad, including offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        CAVE_STUB.copyInto(bytes, 0x00B8EBFC)
        B_CAVE.copyInto(bytes, 0x00BA1ADC)

        for (offset in LOADED_OFFSETS) {
            FORCE_TRUE.copyInto(bytes, offset)
        }

        soFile.writeBytes(bytes)
    }
}
