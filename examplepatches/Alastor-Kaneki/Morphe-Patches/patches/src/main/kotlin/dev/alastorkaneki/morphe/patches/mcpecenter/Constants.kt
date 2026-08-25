package dev.alastorkaneki.morphe.patches.mcpecenter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val ORIGINAL_PACKAGE = "com.ultimategamestudio.mcpecenter.mods"
    const val ORIGINAL_FILE_PROVIDER = "$ORIGINAL_PACKAGE.fileProvider"

    val MCPE_CENTER = Compatibility(
        name = "Mods AddOns for Minecraft PE",
        packageName = ORIGINAL_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = "2.5.0",
                // The Play-distributed APK currently contains Google Play automatic
                // protection (Pairip), so patched/re-signed runtime behavior depends
                // on how the APK is installed.
                isExperimental = true
            )
        )
    )
}
