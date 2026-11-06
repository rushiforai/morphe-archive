package arpit.morphe.patches.hypertrophy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HYPERTROPHY = Compatibility(
        name = "RP Hypertrophy",
        packageName = "com.rp.hypertrophy",
        // APKPure ships the app as an XAPK split container (base APK plus ABI,
        // density and locale splits); the base APK alone is not installable.
        apkFileType = ApkFileType.XAPK,
        // Brand red of the RP launcher icon.
        appIconColor = 0xEC0915,
        targets = listOf(
            AppTarget(
                // Version as reported by the XAPK manifest.json (versionCode 72).
                version = "1.9.0"
            )
        )
    )
}
