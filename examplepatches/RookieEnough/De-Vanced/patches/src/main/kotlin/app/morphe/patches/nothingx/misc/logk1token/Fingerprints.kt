/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nothingx/misc/logk1token/Fingerprints.kt
 */
package app.morphe.patches.nothingx.misc.logk1token

import app.morphe.patcher.Fingerprint

internal object ApplicationOnCreateMethodFingerprint : Fingerprint(
    name = "onCreate",
    definingClass = "/BaseApplication;",
    returnType = "V",
    parameters = listOf(),
)

