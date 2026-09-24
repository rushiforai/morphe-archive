package eh.premom.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PREMOM = Compatibility(
        name = "PreMom",
        packageName = "premom.eh.com.ehpremomapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF8A65,
        targets = listOf(
            AppTarget(
                version = "1.107.2"
            ),
            AppTarget(
                version = "1.105.1"
            )
        )
    )
}
