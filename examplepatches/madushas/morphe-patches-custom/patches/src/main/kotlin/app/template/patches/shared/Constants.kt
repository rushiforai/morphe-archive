// Multi-app Compatibility declarations for the merged patch bundle.
package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {

    val PDB_COMPATIBILITY = Compatibility(
        name = "Pdb",
        packageName = "pdb.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6C5CE7,
        targets = listOf(AppTarget(version = "2.134.6", versionCode = 2694))
    )

    val MYDIALOG_COMPATIBILITY = Compatibility(
        name = "MyDialog",
        packageName = "net.omobio.dialogsc",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF26522,
        targets = listOf(AppTarget(version = "18.6.5", versionCode = 1130100213))
    )
}
