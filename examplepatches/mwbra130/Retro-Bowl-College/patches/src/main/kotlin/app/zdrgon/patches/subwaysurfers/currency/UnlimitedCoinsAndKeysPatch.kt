package app.zdrgon.patches.subwaysurfers.currency

import app.morphe.patcher.patch.rawResourcePatch
import app.zdrgon.patches.subwaysurfers.shared.Constants.COMPATIBILITY_SUBWAY_SURFERS

/**
 * Ported from legendsciber's "Subway Surfers Currency Hack"
 * (legendsciber/morphe-patches), which upstream removed in its 3.71.0
 * support rework. The 3.70.0 call site is the original anchor; the
 * 3.71.0 site was re-anchored here: the caller sequence around the
 * GetCurrency call is byte-identical in both builds except for the
 * call displacement, and the call target's entry bytes are identical
 * in both libil2cpp.so builds.
 *
 * Verified against the real APKs:
 * - 3.70.0 (96307): SITE_3_70_0 occurs exactly once (0x3D8FC5C),
 *   SITE_3_71_0 does not occur.
 * - 3.71.0 (97327): SITE_3_71_0 occurs exactly once (0x3D7B198),
 *   SITE_3_70_0 does not occur.
 * Aborts safely unless exactly one site is found in total.
 */
private val SET_MAX = byteArrayOf(0x00, 0x00, 0xB0.toByte(), 0x12)

// GetCurrency call site (BL) in 3.70.0
private val SITE_3_70_0 = byteArrayOf(0x57, 0xB8.toByte(), 0x02, 0x94.toByte())

// GetCurrency call site (BL) in 3.71.0
private val SITE_3_71_0 = byteArrayOf(0x8C.toByte(), 0xB7.toByte(), 0x02, 0x94.toByte())

@Suppress("unused")
val unlimitedCoinsAndKeysPatch = rawResourcePatch(
    name = "Unlimited coins and keys",
    description = "Coins and keys always report 2,147,483,647, so every purchase is affordable. " +
        "Ported from legendsciber's Currency Hack and re-anchored for 3.71.0.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBWAY_SURFERS)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        fun findAll(pattern: ByteArray): List<Int> {
            val hits = mutableListOf<Int>()
            var i = 0
            while (i <= bytes.size - pattern.size) {
                var match = true
                var j = 0
                while (j < pattern.size) {
                    if (bytes[i + j] != pattern[j]) {
                        match = false
                        break
                    }
                    j++
                }
                if (match) hits.add(i)
                i++
            }
            return hits
        }

        val hits370 = findAll(SITE_3_70_0)
        val hits371 = findAll(SITE_3_71_0)
        val all = hits370 + hits371
        if (all.size != 1) {
            throw Exception(
                "UnlimitedCoinsAndKeys: expected exactly 1 GetCurrency call site, " +
                    "found ${all.size} (3.70.0 pattern: ${hits370.size}, 3.71.0 pattern: ${hits371.size}). " +
                    "APK version may not be supported. Aborting safely."
            )
        }

        SET_MAX.copyInto(bytes, all[0])

        soFile.writeBytes(bytes)
    }
}
