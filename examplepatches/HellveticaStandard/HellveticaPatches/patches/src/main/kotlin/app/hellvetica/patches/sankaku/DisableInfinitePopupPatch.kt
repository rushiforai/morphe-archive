package app.hellvetica.patches.sankaku

import app.hellvetica.patches.shared.Constants.COMPATIBILITY_SANKAKU
import app.morphe.patcher.patch.rawResourcePatch

/**
 * Patch to disable the "Want unlimited access? Get Sankaku Infinite!" upsell popup
 * in the Sankaku Channel app (com.sankakucomplex.channel.black).
 *
 * Sankaku Channel is a React Native app. Its UI and business logic are compiled
 * into Hermes bytecode at `assets/index.android.bundle`.
 *
 * The popup display path is controlled by `showPopupUpsell`, and the trigger
 * decision is controlled by `checkShowPopupUpsellModal`.
 *
 * 4.23-rc91:
 * - Function #43041 at file offset 0x00DE772B.
 * - Change `JmpTrue 116, r1` to `JmpTrue 116, r0`.
 *
 * 4.24-rc92:
 * - Function #36745 at file offset 0x01151617.
 * - Change `JmpTrue 112, r4` to `JmpTrue 112, r3`.
 * - Function #19195 at file offset 0x00E9821F.
 * - Change the final `true` returns in `checkShowPopupUpsellModal` to `false`.
 */
@Suppress("unused")
val disableInfinitePopupPatch = rawResourcePatch(
    name = "Disable Infinite Upgrade Popup",
    description = "Disables the \"Want unlimited access? Get Sankaku Infinite!\" " +
            "upsell popup that periodically appears while browsing the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SANKAKU)

    execute {
        val bundlePath = "assets/index.android.bundle"

        fun ByteArray.indexOfPattern(pattern: ByteArray): Int {
            outer@ for (i in 0..(size - pattern.size)) {
                for (j in pattern.indices) {
                    if (this[i + j] != pattern[j]) continue@outer
                }

                return i
            }

            return -1
        }

        data class BundlePatch(
            val label: String,
            val target: ByteArray,
            val replacement: ByteArray,
        )

        val rc92ShowPopupTargetPattern = byteArrayOf(
            0x34, 0x03, 0x00,              // GetParentEnvironment r3, 0
            0x3B, 0x04, 0x03, 0x03,        // LoadFromEnvironment r4, r3, 3
            0xB0.toByte(), 0x70, 0x04,     // JmpTrue 112, r4
        )

        val rc92ShowPopupReplacementPattern = byteArrayOf(
            0x34, 0x03, 0x00,
            0x3B, 0x04, 0x03, 0x03,
            0xB0.toByte(), 0x70, 0x03,     // JmpTrue 112, r3
        )

        val rc92CheckPopupTargetPattern = byteArrayOf(
            0x96.toByte(), 0x02, 0x76, 0x02, // LoadConstFalse r2; Ret r2
            0x95.toByte(), 0x02, 0x76, 0x02, // LoadConstTrue r2; Ret r2
            0x95.toByte(), 0x02, 0x76, 0x02,
            0x95.toByte(), 0x02, 0x76, 0x02,
            0x95.toByte(), 0x02, 0x76, 0x02,
            0x95.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02, // LoadConstFalse r2; Ret r2
        )

        val rc92CheckPopupReplacementPattern = byteArrayOf(
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
            0x96.toByte(), 0x02, 0x76, 0x02,
        )

        val rc91TargetPattern = byteArrayOf(
            0x29, 0x00, 0x00,              // GetEnvironment r0, 0
            0x2E.toByte(), 0x01, 0x00, 0x03, // LoadFromEnvironment r1, r0, 3
            0x90.toByte(), 0x74, 0x01,     // JmpTrue 116, r1
        )

        val rc91ReplacementPattern = byteArrayOf(
            0x29, 0x00, 0x00,
            0x2E.toByte(), 0x01, 0x00, 0x03,
            0x90.toByte(), 0x74, 0x00,     // JmpTrue 116, r0
        )

        val patchTargets = listOf(
            "4.24-rc92" to listOf(
                BundlePatch("showPopupUpsell early return", rc92ShowPopupTargetPattern, rc92ShowPopupReplacementPattern),
                BundlePatch("checkShowPopupUpsellModal returns false", rc92CheckPopupTargetPattern, rc92CheckPopupReplacementPattern),
            ),
            "4.23-rc91" to listOf(
                BundlePatch("showPopupUpsell early return", rc91TargetPattern, rc91ReplacementPattern),
            ),
        )

        val bundleFile = get(bundlePath)
        val patched = bundleFile.readBytes()

        var matchedPatches: List<Pair<BundlePatch, Int>> = emptyList()
        var matchedVersion = ""

        for ((version, bundlePatches) in patchTargets) {
            val matches = bundlePatches.map { bundlePatch ->
                require(bundlePatch.target.size == bundlePatch.replacement.size) {
                    "Patch ${bundlePatch.label} has mismatched target/replacement sizes"
                }

                bundlePatch to patched.indexOfPattern(bundlePatch.target)
            }

            if (matches.all { (_, index) -> index >= 0 }) {
                matchedPatches = matches
                matchedVersion = version
                break
            }
        }

        require(matchedPatches.isNotEmpty()) {
            "Infinite popup patch signatures not found in $bundlePath. " +
                    "The app may have been updated. Expected one of: " +
                    patchTargets.joinToString("; ") { (version, bundlePatches) ->
                        "$version=" + bundlePatches.joinToString(", ") { bundlePatch ->
                            "${bundlePatch.label}[${
                                bundlePatch.target.joinToString(" ") { "0x%02X".format(it) }
                            }]"
                        }
                    }
        }

        matchedPatches.forEach { (bundlePatch, index) ->
            bundlePatch.replacement.copyInto(patched, index)
            println("Patched ${bundlePatch.label} for $matchedVersion at 0x${index.toString(16)}")
        }

        bundleFile.writeBytes(patched)
    }
}
