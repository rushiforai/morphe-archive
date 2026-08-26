package morningentree.morphe.patches.colornote.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ColorNote",
        packageName = "com.socialnmobile.dictapps.notepad.color.note",
        appIconColor = 0xF2C200,
        apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget("4.8.6")),
    )
}
