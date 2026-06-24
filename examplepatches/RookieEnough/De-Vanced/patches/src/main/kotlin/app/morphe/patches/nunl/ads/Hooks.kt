/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nunl/ads/Hooks.kt
 */
package app.morphe.patches.nunl.ads

import app.morphe.patches.shared.misc.extension.ExtensionHook
import app.morphe.patcher.Fingerprint

internal val nuApplicationOnCreateHook = ExtensionHook(
    fingerprint = Fingerprint(
        definingClass = "/NUApplication;",
        name = "onCreate",
        returnType = "V",
        parameters = listOf(),
    ),
)

