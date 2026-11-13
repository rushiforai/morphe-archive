package arpit.morphe.patches.runna.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RUNNA = Compatibility(
        name = "Runna",
        packageName = "com.runbuddy.prod",
        // APKCube distributes Runna as an APKS split container (base APK plus ABI
        // and density splits); the base APK alone is not installable.
        apkFileType = ApkFileType.APKS,
        // Charcoal of the launcher icon background.
        appIconColor = 0x1B1B1B,
        targets = listOf(
            AppTarget(
                // Version as reported by the APKS manifest (versionCode 2088).
                version = "8.61.0"
            )
        )
    )
}
