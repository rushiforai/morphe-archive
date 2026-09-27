package app.subwaysurf.patches.currency

import app.morphe.patcher.patch.rawResourcePatch
import app.subwaysurf.patches.shared.Constants.COMPATIBILITY_SUBWAYSURF

private val SET_MAX = byteArrayOf(0x00, 0x00, 0xB0.toByte(), 0x12)

private val SITE = byteArrayOf(0x57, 0xB8.toByte(), 0x02, 0x94.toByte())

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

        var count = 0
        var at = -1
        var i = 0
        while (i <= bytes.size - SITE.size) {
            var match = true
            var j = 0
            while (j < SITE.size) {
                if (bytes[i + j] != SITE[j]) {
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
        require(count == 1) { "GetCurrency bl site not unique: $count matches" }

        SET_MAX.copyInto(bytes, at)

        soFile.writeBytes(bytes)
    }
}
