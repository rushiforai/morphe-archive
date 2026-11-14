package app.zdrgon.patches.ytmusicwear.backgroundplayback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR

/**
 * YouTube Music (Wear OS) — Remove background playback restrictions.
 *
 * Port of the core of the official Morphe patch of the same name
 * (MorpheApp/morphe-patches v2.2.0). The background-playback decision
 * funnels through one static gate method; the official patch returns
 * true from it early. In the Wear build (9.45.41-WEAR_RELEASE) that
 * gate is Lunz;->c(Laaok;)Z, verified as the fingerprint's unique
 * match in the Wear dex — see Fingerprints.kt for the scan evidence.
 *
 * Differences from the phone patch, on purpose:
 * - No settings toggle: the phone patch's on/off switch lives in the
 *   Morphe settings UI, which is injected into the phone app's
 *   MusicActivity — a class the Wear app does not contain. This Wear
 *   port is always on.
 * - The Kids-policy fingerprint is not included (unverified on Wear).
 *
 * This patch changes only the local gate's answer. It does not change
 * what the account's Premium state is on Google's servers, and it
 * cannot fix sign-in on a re-signed build — that is a separate,
 * still-open question for on-device testing.
 */
@Suppress("unused")
val removeBackgroundPlaybackRestrictionsWearPatch = bytecodePatch(
    name = "Remove background playback restrictions",
    description = "Removes restrictions on background playback in the Wear OS app. Experimental: fingerprint verified against 9.45.41-WEAR_RELEASE, not yet tested on a watch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    execute {
        BackgroundPlaybackDisableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
