package app.zdrgon.patches.ytmusicwear.spoofversion

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR

// ── App version provider — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// The official Morphe "Spoof app version" patch (shared/misc/spoof/
// appversion) fingerprints the app's version-name getter by the
// preference key it consults for a manual override:
// "pref_override_build_version_name". In the Wear dex that string is
// carried by exactly one method (verified by dex scan on 2026-11-15,
// REPORT6): Lrdl;->b(Landroid/content/Context;)Ljava/lang/String;

object VersionNameProviderWearFingerprint : Fingerprint(
    definingClass = "Lrdl;",
    name = "b",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("pref_override_build_version_name")
)

private const val SPOOF_TARGET_VERSION = "8.23.51"

/**
 * YouTube Music (Wear OS) — Spoof app version.
 *
 * Wear port of the official Morphe patch of the same name, with the
 * settings toggle and version picker hardwired (the Wear app has no
 * Morphe settings UI): the app's version-name getter is pinned to
 * return the target version, so every consumer of that getter —
 * including the client context the app sends with its requests —
 * sees the spoofed version instead of 9.45.41-WEAR_RELEASE.
 *
 * The target is the official patch's own default for YouTube Music
 * (8.23.51). Tradeoff, stated plainly: anything in the app that reads
 * the version name through this getter (about screens, update checks)
 * also sees the spoofed value.
 */
@Suppress("unused")
val spoofAppVersionWearPatch = bytecodePatch(
    name = "Spoof app version",
    description = "Tricks the app into thinking you are running an older version (8.23.51).",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    execute {
        VersionNameProviderWearFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$SPOOF_TARGET_VERSION"
                return-object v0
            """.trimIndent()
        )
    }
}
