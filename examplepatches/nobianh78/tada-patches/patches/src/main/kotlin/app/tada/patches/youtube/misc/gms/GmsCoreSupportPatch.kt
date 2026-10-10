/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.misc.gms

import app.tada.patches.shared.CastContextFetchFingerprint
import app.tada.patches.shared.PrimeMethodFingerprint
import app.tada.patches.shared.misc.gms.gmsCoreSupportPatch
import app.tada.patches.shared.misc.gms.gmsCoreSupportResourcePatch
import app.tada.patches.youtube.layout.buttons.overlay.hidePlayerOverlayButtonsPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.gms.Constants.MORPHE_YOUTUBE_PACKAGE_NAME
import app.tada.patches.youtube.misc.gms.Constants.YOUTUBE_PACKAGE_NAME
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.misc.spoof.spoofVideoStreamsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = YOUTUBE_PACKAGE_NAME,
    toPackageNameDefault = MORPHE_YOUTUBE_PACKAGE_NAME,
    primeMethodFingerprint = PrimeMethodFingerprint,
    earlyReturnFingerprints = setOf(
        CastContextFetchFingerprint,
    ),
    mainActivityOnCreateFingerprint = YouTubeActivityOnCreateFingerprint,
    extensionPatch = sharedExtensionPatch,
    gmsCoreSupportResourcePatchFactory = ::gmsCoreSupportResourcePatch
) {
    dependsOn(
        sharedExtensionPatch,
        hidePlayerOverlayButtonsPatch, // Hide non-functional cast button.
        spoofVideoStreamsPatch,
        deviceComplianceCheckPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)
}

private fun gmsCoreSupportResourcePatch() = gmsCoreSupportResourcePatch(
    fromPackageName = YOUTUBE_PACKAGE_NAME,
    toPackageNameDefault = MORPHE_YOUTUBE_PACKAGE_NAME,
    spoofedPackageSignature = "24bb24c05e47e0aefa68a58a766179d9b613a600",
    screen = PreferenceScreen.MISC,
    block = {
        dependsOn(
            settingsPatch,
            accountCredentialsInvalidTextPatch
        )
    }
)
