package app.tada.patches.music.misc.gms

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.fileprovider.fileProviderPatch
import app.tada.patches.music.misc.gms.Constants.MORPHE_MUSIC_PACKAGE_NAME
import app.tada.patches.music.misc.gms.Constants.MUSIC_PACKAGE_NAME
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.misc.spoof.spoofVideoStreamsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MusicActivityOnCreateFingerprint
import app.tada.patches.shared.CastContextFetchFingerprint
import app.tada.patches.shared.PrimeMethodFingerprint
import app.tada.patches.shared.misc.gms.gmsCoreSupportPatch

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = MUSIC_PACKAGE_NAME,
    toPackageNameDefault = MORPHE_MUSIC_PACKAGE_NAME,
    primeMethodFingerprint = PrimeMethodFingerprint,
    earlyReturnFingerprints = setOf(
        CastContextFetchFingerprint,
    ),
    mainActivityOnCreateFingerprint = MusicActivityOnCreateFingerprint,
    extensionPatch = sharedExtensionPatch,
    gmsCoreSupportResourcePatchFactory = ::gmsCoreSupportResourcePatch,
) {
    dependsOn(spoofVideoStreamsPatch)

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
}

private fun gmsCoreSupportResourcePatch() =
    app.tada.patches.shared.misc.gms.gmsCoreSupportResourcePatch(
        fromPackageName = MUSIC_PACKAGE_NAME,
        toPackageNameDefault = MORPHE_MUSIC_PACKAGE_NAME,
        spoofedPackageSignature = "afb0fed5eeaebdd86f56a97742f4b6b33ef59875",
        screen = PreferenceScreen.MISC,
        block = {
            dependsOn(
                settingsPatch,
                fileProviderPatch(
                    MUSIC_PACKAGE_NAME,
                    MORPHE_MUSIC_PACKAGE_NAME
                )
            )
        }
    )
