package app.dantheman.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.dantheman.patches.shared.Constants.COMPATIBILITY_DANTHEMAN

private val DO_PURCHASE_SITE = byteArrayOf(
    0xF3.toByte(), 0x03, 0x00, 0xAA.toByte(),
    0xB5.toByte(), 0x22, 0x08, 0x91.toByte(),
    0x28, 0x00, 0x80.toByte(), 0x52,
)
private val REACHABILITY_GATE_SITE = byteArrayOf(
    0x60, 0x00, 0x00, 0x35,
    0x42, 0x37, 0xF1.toByte(), 0x97.toByte(),
    0x00, 0x06, 0x00, 0x34,
)

@Suppress("unused")
val danTheManFreeIAPPatch = rawResourcePatch(
    name = "Dan The Man Free IAP",
    description = "All in-app purchases are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DANTHEMAN)

    execute {
        val soFile = get("lib/arm64-v8a/libmortargame.so", true)
        val bytes = soFile.readBytes()

        fun indexOf(name: String, site: ByteArray): Int {
            var count = 0
            var at = -1
            var i = 0
            while (i <= bytes.size - site.size) {
                var match = true
                var j = 0
                while (j < site.size) {
                    if (bytes[i + j] != site[j]) {
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
            require(count == 1) { "$name site not unique: $count matches" }
            return at
        }

        val at = indexOf("IAP_Support::DoPurchase", DO_PURCHASE_SITE)
        bytes[at + 8] = 0x08
        java.nio.ByteBuffer.wrap(bytes, at + 0x4C, 4)
            .order(java.nio.ByteOrder.LITTLE_ENDIAN)
            .putInt(0xd65f03c0.toInt())

        val gate = indexOf("reachability gate", REACHABILITY_GATE_SITE)
        java.nio.ByteBuffer.wrap(bytes, gate + 8, 4)
            .order(java.nio.ByteOrder.LITTLE_ENDIAN)
            .putInt(0xd503201f.toInt())

        soFile.writeBytes(bytes)
    }
}
