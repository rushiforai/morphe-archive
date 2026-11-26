package app.hungryshark.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.hungryshark.patches.shared.Constants.COMPATIBILITY_HUNGRYSHARK

private const val START_PURCHASE_SITE = 0x37B0914
private const val STUB_SITE = 0x37B40D8
private const val TXN_HISTORY_SITE = 0x37A1B38
private const val CONSUME_CALL_SITE = 0x37A49B8
private const val REPORT_PURCHASE_SITE = 0x37A3C3C
private const val REPORT_VERIFICATION_SITE = 0x37A3CBC
private const val SKIP_VERIFICATION_SITE = 0x37AA644
private const val ADD_TRANSACTION_SITE = 0x37A1998
private const val LOAD_HISTORY_SITE = 0x37A1CEC

private val START_PURCHASE_ORIGINAL = byteArrayOf(
    0x04, 0x00, 0x00, 0x14, 0xF8.toByte(), 0xB2.toByte(), 0x98.toByte(), 0x97.toByte(),
)
private val START_PURCHASE_PATCHED = byteArrayOf(
    0xF1.toByte(), 0x0D, 0x00, 0x14, 0xF8.toByte(), 0xB2.toByte(), 0x98.toByte(), 0x97.toByte(),
)
private val STUB_ORIGINAL = byteArrayOf(
    0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte(),
)
private val TXN_HISTORY_ORIGINAL = byteArrayOf(
    0xFE.toByte(), 0x0F, 0x1C, 0xF8.toByte(), 0xF8.toByte(), 0x5F, 0x01, 0xA9.toByte(),
)
private val TXN_HISTORY_PATCHED = byteArrayOf(
    0xE0.toByte(), 0x03, 0x1F, 0x2A, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)
private val CONSUME_CALL_ORIGINAL = byteArrayOf(
    0x2E, 0x00, 0x00, 0x94.toByte(),
)
private val CONSUME_CALL_PATCHED = byteArrayOf(
    0x1F, 0x20, 0x03, 0xD5.toByte(),
)
private val REPORT_PURCHASE_ORIGINAL = byteArrayOf(
    0x15, 0xE2.toByte(), 0xF5.toByte(), 0x97.toByte(),
)
private val REPORT_VERIFICATION_ORIGINAL = byteArrayOf(
    0xD4.toByte(), 0xE0.toByte(), 0xF5.toByte(), 0x97.toByte(),
)
private val NOP = byteArrayOf(
    0x1F, 0x20, 0x03, 0xD5.toByte(),
)
private val SKIP_VERIFICATION_ORIGINAL = byteArrayOf(
    0xC8.toByte(), 0x02, 0x00, 0x34,
)
private val SKIP_VERIFICATION_PATCHED = byteArrayOf(
    0x16, 0x00, 0x00, 0x14,
)
private val ADD_TRANSACTION_ORIGINAL = byteArrayOf(
    0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(),
)
private val ADD_TRANSACTION_PATCHED = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)
private val LOAD_HISTORY_ORIGINAL = byteArrayOf(
    0x60, 0x03, 0x00, 0x36,
)
private val LOAD_HISTORY_PATCHED = byteArrayOf(
    0x1B, 0x00, 0x00, 0x14,
)
private val STUB = (
    "fd7bbca9f35301a9f55b02a9f76303a9f30300aa288800f0005940f962a49897" +
        "288800f0085940f9000140f9f9a49897f40300aa611e40f9e20301aae3031faa" +
        "e4031faa59b3ff9748008052882200b9681e40f9881e00f92800805288420139" +
        "288800f0008d40f94fa49897288800f0088d40f9000140f9e6a49897f50300aa" +
        "21008052e2031faa30b2ff97682240f9e80000b4090d40f9002140f9031540f9" +
        "e10315aae20314aa20013fd6f35341a9f55b42a9f76343a9fd7bc4a8c0035fd6"
    ).chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun ByteArray.requireRegion(offset: Int, expected: ByteArray, label: String) {
    require(offset >= 0 && offset + expected.size <= size) { "$label offset out of range" }
    var i = 0
    while (i < expected.size) {
        require(this[offset + i] == expected[i]) { "$label does not match target binary" }
        i++
    }
}

@Suppress("unused")
val hungrySharkFreeIap = rawResourcePatch(
    name = "Hungry Shark Free IAP",
    description = "Gems, coins, shark offers and every other in-app purchase are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HUNGRYSHARK)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        bytes.requireRegion(START_PURCHASE_SITE, START_PURCHASE_ORIGINAL, "purchase gate")
        bytes.requireRegion(STUB_SITE, STUB_ORIGINAL, "code cave")
        bytes.requireRegion(TXN_HISTORY_SITE, TXN_HISTORY_ORIGINAL, "transaction history")
        bytes.requireRegion(CONSUME_CALL_SITE, CONSUME_CALL_ORIGINAL, "consume call")
        bytes.requireRegion(REPORT_PURCHASE_SITE, REPORT_PURCHASE_ORIGINAL, "purchase report")
        bytes.requireRegion(REPORT_VERIFICATION_SITE, REPORT_VERIFICATION_ORIGINAL, "verification report")
        bytes.requireRegion(SKIP_VERIFICATION_SITE, SKIP_VERIFICATION_ORIGINAL, "verification gate")
        bytes.requireRegion(ADD_TRANSACTION_SITE, ADD_TRANSACTION_ORIGINAL, "history add")
        bytes.requireRegion(LOAD_HISTORY_SITE, LOAD_HISTORY_ORIGINAL, "history load")

        STUB.copyInto(bytes, STUB_SITE)
        START_PURCHASE_PATCHED.copyInto(bytes, START_PURCHASE_SITE)
        TXN_HISTORY_PATCHED.copyInto(bytes, TXN_HISTORY_SITE)
        CONSUME_CALL_PATCHED.copyInto(bytes, CONSUME_CALL_SITE)
        NOP.copyInto(bytes, REPORT_PURCHASE_SITE)
        NOP.copyInto(bytes, REPORT_VERIFICATION_SITE)
        SKIP_VERIFICATION_PATCHED.copyInto(bytes, SKIP_VERIFICATION_SITE)
        ADD_TRANSACTION_PATCHED.copyInto(bytes, ADD_TRANSACTION_SITE)
        LOAD_HISTORY_PATCHED.copyInto(bytes, LOAD_HISTORY_SITE)

        soFile.writeBytes(bytes)
    }
}
