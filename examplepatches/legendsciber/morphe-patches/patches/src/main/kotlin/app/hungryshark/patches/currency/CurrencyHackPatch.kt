package app.hungryshark.patches.currency

import app.morphe.patcher.patch.rawResourcePatch
import app.hungryshark.patches.shared.Constants.COMPATIBILITY_HUNGRYSHARK

private val SET_MAX = byteArrayOf(0x13, 0x00, 0xB0.toByte(), 0x12)

private val CURRENCY_OFFSETS = intArrayOf(
    0x034BEC88,
    0x034BF390,
)

@Suppress("unused")
val hungrySharkCurrencyHack = rawResourcePatch(
    name = "Hungry Shark Currency Hack",
    description = "Coins and gems are always set to 2,147,483,647 whenever they are earned, spent, purchased, or loaded from a save.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HUNGRYSHARK)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (offset in CURRENCY_OFFSETS) {
            SET_MAX.copyInto(bytes, offset)
        }

        soFile.writeBytes(bytes)
    }
}
