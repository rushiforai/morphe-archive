package app.starkist.patches.newyorker

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object NewYorkerConstants {
    val COMPATIBILITY_NEW_YORKER = Compatibility(
        name = "The New Yorker",
        packageName = "com.condenast.thenewyorker.android",
        // The app is distributed as split APKs (base + config splits).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            // The version these patches were developed and tested against.
            AppTarget(version = "10.7.2")
        )
    )
}
