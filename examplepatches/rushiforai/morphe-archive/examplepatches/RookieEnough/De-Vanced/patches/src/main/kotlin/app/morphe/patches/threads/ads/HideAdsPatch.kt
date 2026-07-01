/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/threads/ads/HideAdsPatch.kt
 */
package app.morphe.patches.threads.ads

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.meta.ads.AdInjectorMethodFingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides sponsored content / ads in Threads.",
) {
    compatibleWith(AppCompatibilities.THREADS)

    execute {
        // Upstream: SponsoredContentController.insertItem returns Z (true when ads are inserted).
        AdInjectorMethodFingerprint.methodOrNull?.returnEarly(false)
    }
}

