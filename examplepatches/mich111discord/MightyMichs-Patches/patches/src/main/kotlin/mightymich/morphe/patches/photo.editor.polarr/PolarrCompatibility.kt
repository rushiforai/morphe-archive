package mightymich.morphe.patches.photo.editor.polarr

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PolarrCompatibility {
    val POLARR = Compatibility(
        name = "Polarr",
        packageName = "photo.editor.polarr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x607D8B,
        targets = listOf(
            AppTarget(version = "6.12.0")
        )
    )
}
