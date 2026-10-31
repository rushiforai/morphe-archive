package app.hellvetica.patches.sankaku

import app.hellvetica.patches.shared.Constants.COMPATIBILITY_SANKAKU
import app.morphe.patcher.patch.rawResourcePatch

/**
 * Patch to hide the "Trending tags" section from the home/browse feed
 * in the Sankaku Channel app (com.sankakucomplex.channel.black).
 *
 * Sankaku Channel is a React Native app. Its UI and business logic are compiled
 * into Hermes bytecode at `assets/index.android.bundle`.
 *
 * The "Trending tags" carousel is rendered by the `TrendingTags` React component
 * (Hermes function #20280). Making its render function return null causes React
 * to render nothing, effectively removing the entire section from the UI.
 *
 * 4.28-rc100:
 * - `TrendingTags` render function at bundle offset 0x0101EFE7 (683 bytes),
 *   identified by hermes_dec as function #20280.
 * - Function prologue:
 *     34 03 00               // GetParentEnvironment r3, 0
 *     40 06 05               // (CreateEnvironment / setup)
 *     89 04 01               // (internal)
 *     44 0A 04 00            // GetByIdShort r10, r4, 0
 *     E2                     // ...
 * - The first 8 bytes of the prologue are unique in the bundle (verified).
 * - Replacement: LoadConstNull r0; Ret r0 — causes React to render nothing,
 *   effectively removing the entire "Trending tags" section from the UI.
 * - Bytes 4–13 of the original prologue are retained as dead code for size parity.
 */
@Suppress("unused")
val hideTrendingTagsSectionPatch = rawResourcePatch(
    name = "Hide Trending Tags Section",
    description = "Hides the \"Trending tags\" carousel section from the browse feed.",
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

        // 4.28-rc100: `TrendingTags` render function (hermes func #20280) at bundle offset 0x0101EFE7.
        // The 14-byte prefix is unique in the bundle (verified: 1 occurrence).
        // Bytes 4–13 are retained as dead code.
        val rc100TrendingTagsTargetPattern = byteArrayOf(
            0x34, 0x03, 0x00,              // GetParentEnvironment r3, 0
            0x40, 0x06, 0x05,              // CreateEnvironment / frame setup
            0x89.toByte(), 0x04, 0x01,     // (internal setup)
            0x44, 0x0A, 0x04, 0x00,        // GetByIdShort r10, r4, 0
            0xE2.toByte(),                 // (next instruction byte)
        )

        val rc100TrendingTagsReplacementPattern = byteArrayOf(
            0x94.toByte(), 0x00,           // LoadConstNull r0
            0x76, 0x00,                    // Ret r0  (returns null → React renders nothing)
            0x06, 0x05,                    // dead code (original bytes 4-5, size parity)
            0x89.toByte(), 0x04, 0x01,     // dead code (original bytes 6-8)
            0x44, 0x0A, 0x04, 0x00,        // dead code (original bytes 9-12)
            0xE2.toByte(),                 // dead code (original byte 13)
        )

        val patchTargets = listOf(
            "4.28-rc100" to listOf(
                BundlePatch(
                    "hide TrendingTags render",
                    rc100TrendingTagsTargetPattern,
                    rc100TrendingTagsReplacementPattern,
                ),
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
            "Trending tags patch signature not found in $bundlePath. " +
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
