package app.plyrs1.patches.com_moh_nusukapp

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Compatibility definition for Nusuk (com.moh.nusukapp).
 */
val COMPATIBILITY_NUSUKAPP = Compatibility(
    name = "Nusuk",
    packageName = "com.moh.nusukapp",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x937047,
    targets = listOf(
        AppTarget(version = "17.6.2"),
        AppTarget(version = null, isExperimental = true)
    )
)
