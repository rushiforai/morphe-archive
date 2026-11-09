package arpit.morphe.patches.carbon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CARBON = Compatibility(
        name = "Carbon",
        packageName = "com.joincarbon.nutrition",
        // APKPure ships Carbon as an XAPK split container (base APK plus ABI,
        // density and locale splits); the base APK alone is not installable.
        apkFileType = ApkFileType.XAPK,
        // Navy of the Carbon monogram on the launcher icon.
        appIconColor = 0x1B1F3B,
        targets = listOf(
            AppTarget(
                // Version as reported by the XAPK manifest.json (versionCode 1633629296).
                version = "2.77.6010"
            )
        )
    )
}
