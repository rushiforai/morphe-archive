package app.subwaysurf.patches.currency

import app.morphe.patcher.patch.rawResourcePatch
import app.subwaysurf.patches.shared.Constants.COMPATIBILITY_SUBWAYSURF

private val SET_MAX = byteArrayOf(0x00, 0x00, 0xB0.toByte(), 0x12)

private val PATCH_OFFSET = 0x03D82FB4

@Suppress("unused")
val subwaySurfersCurrencyHack = rawResourcePatch(
    name = "Subway Surfers Currency Hack",
    description = "Coins and keys always report 2,147,483,647 and every purchase is always affordable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBWAYSURF)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        SET_MAX.copyInto(bytes, PATCH_OFFSET)

        soFile.writeBytes(bytes)
    }
}
