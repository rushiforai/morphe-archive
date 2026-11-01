/*
 * Ported from ajstrick81's Disney+ Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/disney
 * which was forked from RookieEnough's ReVanced patch:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/disneyplus/ads/Fingerprints.kt
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO RookieEnough AND ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.disney.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.disney.shared.Constants

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes pre-roll, mid-roll and pause ads in the Disney+ phone app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Pre-roll and mid-roll: return a fresh empty list from all four
        // ad-cue accessors. Each is a plain iget-object / return-object pair,
        // so returning at offset 0 is safe.
        arrayOf(
            InsertionGetPointsFingerprint,
            InsertionGetRangesFingerprint,
            DmpInsertionGetPointsFingerprint,
            DmpInsertionGetRangesFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                """.trimIndent(),
            )
        }

        // Pause ads: no pause-ad URL, so the app never requests one. The
        // getters have `.locals 0`, so the null goes into p0 (this), which is
        // dead after the return. See Fingerprints.kt.
        DmpAdSessionGetPauseUrlFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )
        LegacyAdSessionGetPauseUrlFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )
    }
}
