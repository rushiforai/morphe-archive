/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/layout/Fingerprints.kt
 */
package app.morphe.patches.messenger.layout

import app.morphe.patcher.Fingerprint

internal object IsFacebookButtonEnabledFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = "Z",
    strings = listOf("FacebookButtonTabButtonImplementation"),
)
