/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/seekbar/Fingerprints.kt
 */
package app.morphe.patches.tiktok.interaction.seekbar

import app.morphe.patcher.Fingerprint

internal object SetSeekBarShowTypeFingerprint : Fingerprint(
    strings = listOf("seekbar show type change, change to:"),
)

internal object ShouldShowSeekBarFingerprint : Fingerprint(
    strings = listOf("can not show seekbar, state: 1, not in resume"),
)

