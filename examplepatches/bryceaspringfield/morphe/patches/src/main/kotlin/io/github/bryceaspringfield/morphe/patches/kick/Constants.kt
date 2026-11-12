package io.github.bryceaspringfield.morphe.patches.kick

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_KICK = Compatibility(
        name = "KICK",
        packageName = "com.kick.mobile",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x53FC18,
        signatures = setOf(
            "b12320227268c9c37e190b493120a7f6ce83c0e9a761f9213df677b58d095b73"
        ),
        targets = listOf(
            AppTarget(
                version = "40.35.2",
                minSdk = 29
            )
        )
    )
}
