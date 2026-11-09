package lab.juicessh.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_JUICESSH = Compatibility(
    name = "JuiceSSH",
    packageName = "com.sonelli.juicessh",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2E7D32,
    targets = listOf(
        AppTarget(
            version = "3.2.2",
            description = "versionCode 200",
        ),
    ),
)