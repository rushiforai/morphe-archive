package app.frantic.patches.prismatica.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PRISMATICA = Compatibility(
        name = "Prismatica Pro",
        packageName = "com.harwin.prismatica",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x8B5CF6,
        targets = listOf(
            AppTarget(version = "1.5.41"),
        )
    )
}