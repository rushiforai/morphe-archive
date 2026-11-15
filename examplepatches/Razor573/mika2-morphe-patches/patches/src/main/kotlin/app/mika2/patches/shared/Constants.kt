package app.mika2.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Mika 2 compatibility.
     *
     * No version is declared on purpose: the patch changes nothing in the
     * app, so it is compatible with any version of Mika 2. Per the official
     * Morphe Patcher docs, a package declared with no versions is
     * compatible with any version of that package.
     */
    val COMPATIBILITY_MIKA2 = Compatibility(
        name = "Mika 2",
        packageName = "com.wangzan101.mika2",
        apkFileType = ApkFileType.APK,
        // Mika 2 app icon colour.
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = false
            )
        )
    )
}
