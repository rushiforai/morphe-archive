package patches.reolink

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal const val REOLINK_PACKAGE = "com.mcu.reolink"

internal val reolink = Compatibility(
    name = "Reolink", packageName = REOLINK_PACKAGE,
    apkFileType = ApkFileType.APKM,
    signatures = setOf("5ddbd4cfdd6e4d494b643bd1614abd8d6a1ab3c8a449e6dbe6d47beda2dec344"),
    targets = listOf(AppTarget(version = "4.64.3.20261023", versionCode = 796, minSdk = 28)),
)

internal val originalInput = originalInput(reolink)
