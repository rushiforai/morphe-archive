package app.franticg33k.patches.atlasphoto.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ATLASPHOTO = Compatibility(
        name = "Atlas Photo",
        packageName = "com.ensembleai.scoutai",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
    )
}
