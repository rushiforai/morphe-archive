package app.bardo.letterboxd.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LETTERBOXD = Compatibility(
        name = "Letterboxd",
        packageName = "com.letterboxd.letterboxd",
        // Letterboxd se distribuye como APK dividido (base + splits), o sea APKM en APKMirror.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x202830,
        targets = listOf(
            // Versiones futuras: se intenta, pero sin garantía.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
            // Versión con la que se desarrolló el parche (versionCode 515).
            AppTarget(
                version = "3.6.7",
            ),
        ),
    )
}
