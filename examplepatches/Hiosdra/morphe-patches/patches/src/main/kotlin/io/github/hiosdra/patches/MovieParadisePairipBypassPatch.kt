package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Neutralises PairIP (Google Play Automatic Integrity Protection).
 *
 * `com.pairip.application.Application.attachBaseContext()` calls
 * `LicenseClient.checkLicense(Context)` before any app code runs. On an APK that
 * Morphe has repackaged and resigned, that check fails and PairIP shuts the
 * process down (see teardown doc 03 §3, `RepeatedCheckMetadata`). Gutting the
 * static entry point to an immediate `return-void` stops it ever connecting to
 * the licensing service, so a patched build launches at all.
 *
 * This is a prerequisite for [movieParadiseGmsCoreSupportPatch]. On its own it
 * does not change any premium entitlements.
 */
@Suppress("unused")
val movieParadisePairipBypassPatch = bytecodePatch(
    name = "Movie Paradise - PairIP license bypass",
    description = "Neutralises Google Play integrity/license checks (PairIP) so a repackaged build launches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOVIE_PARADISE)

    val checkLicense = Fingerprint(
        definingClass = PAIRIP_LICENSE_CLIENT,
        name = "checkLicense",
        returnType = "V",
        parameters = listOf("Landroid/content/Context;"),
    )

    execute {
        checkLicense.matchOrNull()?.let { match ->
            match.method.addInstructions(0, "return-void")
        }
    }
}
