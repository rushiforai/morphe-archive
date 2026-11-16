package arpit.morphe.patches.movieboxtv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MOVIEBOX_TV = Compatibility(
        name = "MovieBox TV",
        packageName = "com.community.mbox.tv",
        apkFileType = ApkFileType.APK,
        // Deep green of the TV app icon.
        appIconColor = 0x30E66D,
        targets = listOf(
            AppTarget(
                version = "1.2.3.1113.03",
                versionCode = 50040022,
            ),
        )
    )
}
