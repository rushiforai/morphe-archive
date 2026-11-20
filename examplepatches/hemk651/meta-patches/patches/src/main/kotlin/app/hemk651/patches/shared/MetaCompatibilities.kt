package app.hemk651.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MetaCompatibilities {
    private fun target(name: String, packageName: String, color: Int) = Compatibility(
        name = name,
        packageName = packageName,
        apkFileType = ApkFileType.APK,
        appIconColor = color,
        // A null version explicitly declares compatibility with every version.
        targets = listOf(AppTarget(version = null))
    )

    val INSTAGRAM = target("Instagram", "com.instagram.android", 0xE1306C)

    val INSTANTS = target("Instagram Instants", "com.instagram.moonshot", 0xE1306C)
}
