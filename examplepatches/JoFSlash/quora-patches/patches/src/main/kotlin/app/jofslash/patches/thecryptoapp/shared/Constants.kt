package app.jofslash.patches.thecryptoapp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.crypter.cryptocyrrency"

    /** The app's own Application subclass (com.pairip.application.Application extends it). */
    const val APP_CLASS = "Lcom/crypter/cryptocyrrency/app/App;"

    /**
     * SHA-1 of The Crypto App's own signing certificate (from the APKMirror base.apk). The scripts
     * that fetch a new version check the download against it.
     */
    const val SIGNATURE = "7b769b234dea6329ce9df7f9049f4aeaf8acf0b2"

    val COMPATIBILITY_THECRYPTOAPP = Compatibility(
        name = "The Crypto App",
        packageName = PACKAGE_NAME,
        // APKMirror ships The Crypto App as a bundle (APKM). Its native libraries are in a split,
        // so a base.apk alone crashes at start.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C087,
        targets = listOf(
            AppTarget(version = "4.0.5"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
