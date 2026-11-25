package patches.applemusic

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val appleMusic = Compatibility(
    name = "Apple Music", packageName = "com.apple.android.music", apkFileType = ApkFileType.APKM,
    signatures = setOf(
        "771d8674d3d9837c9edf11b11873443998f19105abcecab425ed9b8e6fefff9b",
        "88ba590ec2e1ea33c4458daf59489faee2cef297a9b4071e18cf82ef531100aa",
    ),
    targets = listOf(
        AppTarget(
            version = "7.0.0", minSdk = 30,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1614),
        ),
    ),
)

internal val originalInput = patches.shared.originalInput(appleMusic)
