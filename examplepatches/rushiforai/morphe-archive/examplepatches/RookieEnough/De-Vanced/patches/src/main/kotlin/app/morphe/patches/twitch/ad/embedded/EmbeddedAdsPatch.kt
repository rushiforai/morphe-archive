/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/embedded/EmbeddedAdsPatch.kt
 */
package app.morphe.patches.twitch.ad.embedded

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val blockEmbeddedAdsPatch = bytecodePatch(
    name = "Block embedded ads",
    description = "Blocks embedded stream ads using services like Luminous or PurpleAdBlocker.",
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // No-op for now: the upstream implementation injects an OkHttp interceptor via
        // Twitch extension classes, which are not yet present in this Morphe patch set.
        //
        // Keeping this patch build-safe (and crash-safe) while we add the missing
        // Twitch extension layer later.
        CreatesUsherClientMethodFingerprint.methodOrNull
    }
}

