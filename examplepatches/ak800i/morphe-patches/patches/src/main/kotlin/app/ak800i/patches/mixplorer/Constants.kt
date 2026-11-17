package app.ak800i.patches.mixplorer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// MiXplorer is downloaded as a plain APK from the developer, not from APKMirror.
// Any version is offered: the patches stop with an error if the code they change looks different.
// Device-tested: stable 6.71.15 (build 26090422) and beta 6.71.15-BETA (build 26090412), ARM64.
internal val COMPATIBILITY_MIXPLORER = Compatibility(
    name = "MiXplorer",
    packageName = "com.mixplorer",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(AppTarget(version = null, minSdk = 30)),
)

internal val COMPATIBILITY_MIXPLORER_BETA = Compatibility(
    name = "MiXplorer Beta",
    packageName = "com.mixplorer.beta",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(AppTarget(version = null, minSdk = 30)),
)
