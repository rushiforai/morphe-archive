package app.morphe.patches.icsee

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

// iCSee (XM / Xiongmai) 7.9.5_G, bundle .apkm do APKMirror (versionCode 79531).
// O app é ofuscado (R8): os patches ficam presos a esta versão exata.
internal val ICSEE_COMPATIBILITY = Compatibility(
    name = "iCSee",
    packageName = "com.xm.csee",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x6AC7C1,
    targets = listOf(
        AppTarget(
            version = "7.9.5_G",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 79531),
        ),
    ),
)
