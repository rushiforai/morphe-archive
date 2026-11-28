package semicoloncolonel.mobilestream.patches.roku.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    // The Android TV build of The Roku Channel is a Cordova shell. Its UI is
    // Roku's web app, downloaded from googletv-rokuapp.web.roku.com at launch.
    // Unlike the phone app (1.0.1, native), it has no Play Integrity
    // attestation, so a re-signed copy loads and plays.
    val COMPATIBILITY = Compatibility(
        name = "The Roku Channel",
        packageName = "com.roku.web.trc",
        description = "The Roku Channel Android TV app. Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6F1AB1,
        targets = listOf(devTarget("2.0.90", versionCode = 2000090)),
        formFactor = FormFactor.TV,
    )
}
