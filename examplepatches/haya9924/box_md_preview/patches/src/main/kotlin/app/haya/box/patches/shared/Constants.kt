/*
 * Box patches.
 *
 * GPLv3.
 */

package app.haya.box.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /**
     * Box for Android. The app is distributed as an app bundle (.apkm), so the
     * file type is declared as APKM.
     */
    val COMPATIBILITY_BOX = Compatibility(
        name = "Box",
        packageName = "com.box.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0060D4,
        targets = listOf(
            // Version the patch was developed and verified with.
            AppTarget(version = "7.6.732"),
        ),
    )
}
