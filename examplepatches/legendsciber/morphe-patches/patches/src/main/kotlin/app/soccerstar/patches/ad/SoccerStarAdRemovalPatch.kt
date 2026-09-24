package app.soccerstar.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val ENABLE_FALSE = byteArrayOf(
    0xE0.toByte(), 0x03, 0x1F, 0x2A,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val RET = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val INTERSTITIAL_OFFSETS = intArrayOf(
    0x00BA2744,
    0x00B94C24,
)

private val BANNER_OFFSETS = intArrayOf(
    0x00BA1D38,
    0x00B92694,
)

@Suppress("unused")
val soccerStarAdRemoval = rawResourcePatch(
    name = "Soccer Star Ad Removal",
    description = "Disables ads completely: EnableAD always returns false, interstitials and banners are no-ops, Adjust purchase verification is skipped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        ENABLE_FALSE.copyInto(bytes, 0x00BA10A0)

        for (offset in INTERSTITIAL_OFFSETS) {
            ENABLE_FALSE.copyInto(bytes, offset)
        }

        for (offset in BANNER_OFFSETS) {
            RET.copyInto(bytes, offset)
        }

        RET.copyInto(bytes, 0x0121C5E8)
        RET.copyInto(bytes, 0x0121C684)

        soFile.writeBytes(bytes)
    }
}
