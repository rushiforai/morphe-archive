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

internal object SaveCreationMixinFingerprint : Fingerprint(
    strings = listOf("SaveCreationMixin"),
)

internal object MfyCreationMixinFingerprint : Fingerprint(
    strings = listOf("MFYCreationMixin"),
)

internal object MfySectionDelegateFingerprint : Fingerprint(
    strings = listOf("MFYSectionDelegate"),
)

internal object ByteSizeFeatureFactoryFingerprint : Fingerprint(
    parameters = listOf("I", "Ljava/lang/Object;"),
    strings = listOf("byte_size"),
    custom = { method, _ ->
        method.name == "a" && (method.returnType == "Lbypk;" || method.returnType == "Lbzdh;")
    },
)


