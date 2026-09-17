/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/misc/checks/Fingerprints.kt
 */
package app.morphe.patches.shared.misc.checks

import app.morphe.patcher.Fingerprint

internal object PatchInfoFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/shared/checks/PatchInfo;"
)

internal object PatchInfoBuildFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/shared/checks/PatchInfo\$Build;"
)
