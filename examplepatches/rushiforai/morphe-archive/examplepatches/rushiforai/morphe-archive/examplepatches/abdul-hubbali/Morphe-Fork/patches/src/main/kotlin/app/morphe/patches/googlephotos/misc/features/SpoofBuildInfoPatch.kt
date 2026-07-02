/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/features/SpoofBuildInfoPatch.kt
 */

package app.morphe.patches.googlephotos.misc.features

import app.morphe.patches.all.misc.build.BuildInfo
import app.morphe.patches.all.misc.build.baseSpoofBuildInfoPatch

// Spoof build info to Google Pixel XL so backups get unlimited storage.
val spoofBuildInfoPatch = baseSpoofBuildInfoPatch {
    BuildInfo(
        brand = "google",
        manufacturer = "Google",
        device = "marlin",
        product = "marlin",
        model = "Pixel XL",
        fingerprint = "google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys",
    )
}
