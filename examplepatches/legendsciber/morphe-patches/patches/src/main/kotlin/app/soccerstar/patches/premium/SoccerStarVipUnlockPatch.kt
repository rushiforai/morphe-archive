package app.soccerstar.patches.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val GETINT_CAVE = byteArrayOf(
    0x7F, 0x22, 0x00, 0x71,
    0x00, 0x01, 0x00, 0x54,
    0x7F, 0x26, 0x00, 0x71,
    0xC0.toByte(), 0x00, 0x00, 0x54,
    0x48, 0x00, 0x00, 0x37,
    0x02, 0x00, 0x00, 0x14,
    0x02, 0x00, 0x00, 0x14,
    0xB8.toByte(), 0x2F, 0x01, 0x14,
    0xE3.toByte(), 0x2F, 0x01, 0x14,
    0xFD.toByte(), 0x7B, 0x42, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x41, 0xA9.toByte(),
    0xF5.toByte(), 0x07, 0x43, 0xF8.toByte(),
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val GETINT_PATCH = byteArrayOf(
    0x42, 0xD0.toByte(), 0xFE.toByte(), 0x17,
)

private val UNSUB_RET = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val CHECKSUB_NOP = byteArrayOf(
    0x1F, 0x20, 0x03, 0xD5.toByte(),
)

@Suppress("unused")
val soccerStarVipUnlock = rawResourcePatch(
    name = "Soccer Star VIP Unlock",
    description = "Unlocks VIP subscription permanently: ownership keys always report active and unsubscribe can never clear the flag.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        GETINT_CAVE.copyInto(bytes, 0x008CEC20)
        GETINT_PATCH.copyInto(bytes, 0x0091AB18)
        UNSUB_RET.copyInto(bytes, 0x00B87180)
        CHECKSUB_NOP.copyInto(bytes, 0x00A076BC)

        soFile.writeBytes(bytes)
    }
}
