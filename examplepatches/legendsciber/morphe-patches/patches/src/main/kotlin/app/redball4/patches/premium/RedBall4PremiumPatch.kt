package app.redball4.patches.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.redball4.patches.shared.Constants.COMPATIBILITY_REDBALL4

private val PATCH = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte()
)

private val OFFSETS = intArrayOf(
    0x0111DB70,
    0x0122B3A0,
    0x011307D8
)

@Suppress("unused")
val redBall4PremiumUnlock = rawResourcePatch(
    name = "RB4 Premium & Skin Unlock",
    description = "Unlocks premium, removes ads and unlocks all ball skins.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDBALL4)
    execute {
        val libil2cpp = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = libil2cpp.readBytes()
        for (offset in OFFSETS) {
            PATCH.copyInto(bytes, offset)
        }
        libil2cpp.writeBytes(bytes)
    }
}
