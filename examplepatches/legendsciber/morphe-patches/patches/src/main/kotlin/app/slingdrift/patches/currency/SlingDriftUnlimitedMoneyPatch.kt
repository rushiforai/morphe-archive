package app.slingdrift.patches.currency

import app.morphe.patcher.patch.rawResourcePatch
import app.slingdrift.patches.shared.Constants.COMPATIBILITY_SLINGDRIFT

private const val CAVE_OFFSET = 0x01BA8D68

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())

private val AFFORD_ANCHOR = byteArrayOf(
    0x00, 0xE0.toByte(), 0x41, 0x39, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0xE1.toByte(),
    0x03, 0x1F, 0xAA.toByte(),
)

private val SET_CURRENCY_ANCHOR = byteArrayOf(
    0x75, 0xE0.toByte(), 0x00, 0xD0.toByte(), 0xB5.toByte(), 0xD2.toByte(), 0x41,
    0xF9.toByte(), 0xF4.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xA0.toByte(), 0x02, 0x40,
    0xF9.toByte(),
)

private val SET_CURRENCY_BRANCH = byteArrayOf(
    0x43, 0x27, 0x0F, 0x14,
)

private val CAVE_STUB = byteArrayOf(
    0x01, 0xF0.toByte(), 0xBF.toByte(), 0xD2.toByte(), 0x81.toByte(), 0xAC.toByte(),
    0xD9.toByte(), 0xF2.toByte(), 0xA1.toByte(), 0x39, 0xE8.toByte(), 0xF2.toByte(), 0x20,
    0x00, 0x67, 0x9E.toByte(), 0xBA.toByte(), 0xD8.toByte(), 0xF0.toByte(), 0x17,
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
val slingDriftUnlimitedMoneyPatch = rawResourcePatch(
    name = "Sling Drift Unlimited Money",
    description = "Rubies are pinned to 999,999,999 whenever they are earned, spent, purchased or loaded from a save, so the balance can never run out and every car stays affordable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SLINGDRIFT)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        val affordAt = indexOfUnique(bytes, AFFORD_ANCHOR, "MarketBuyButton.CanAfford")
        val setCurrencyAt = indexOfUnique(bytes, SET_CURRENCY_ANCHOR, "RGUserDataManager.set_Currency") + SET_CURRENCY_ANCHOR.size

        for (i in 0 until CAVE_STUB.size) {
            require(
                bytes[CAVE_OFFSET + i] == RET[i % 4]
            ) { "code cave at $CAVE_OFFSET is not padding" }
        }

        CAVE_STUB.copyInto(bytes, CAVE_OFFSET)
        SET_CURRENCY_BRANCH.copyInto(bytes, setCurrencyAt)
        FORCE_TRUE.copyInto(bytes, affordAt)

        soFile.writeBytes(bytes)
    }
}
