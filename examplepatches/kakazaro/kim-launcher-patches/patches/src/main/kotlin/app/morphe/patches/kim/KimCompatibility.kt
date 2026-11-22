package app.morphe.patches.kim

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val KIM_PACKAGE = "com.kimkim"

/** Upstream signer: CN=Android Debug (see docs/apk-analysis.md). */
private const val KIM_CERT_SHA256 = "faea5495063d996c3a8977c4f08dce328b92087cc5c9c743bba4b18231c14f72"

internal val compatibility = Compatibility(
    name = "Kim Launcher",
    packageName = KIM_PACKAGE,
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x1C2218,
    signatures = setOf(KIM_CERT_SHA256),
    targets = listOf(
        AppTarget(version = "1.0.2789", isExperimental = false, minSdk = 24),
    ),
)
