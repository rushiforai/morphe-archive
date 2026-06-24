/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/features/Fingerprints.kt
 */
package app.morphe.patches.googlephotos.misc.features

import app.morphe.patcher.Fingerprint

internal object InitializeFeaturesEnumFingerprint : Fingerprint(
    strings = listOf(
        "com.google.android.apps.photos.NEXUS_PRELOAD",
    ),
)

