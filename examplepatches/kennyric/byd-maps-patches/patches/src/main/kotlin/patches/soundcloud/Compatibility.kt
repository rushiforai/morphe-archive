package patches.soundcloud

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val soundcloud = Compatibility(
    name = "SoundCloud", packageName = "com.soundcloud.android", apkFileType = ApkFileType.APKM,
    signatures = setOf("aff930d671fa0a57b8c41d1678cc2a8ea717075a74e346942a140afa441339d2"),
    targets = listOf(AppTarget(version = "2026.11.02-release", versionCode = 379060, minSdk = 29)),
)

// The publisher ships 379060 as Android 10+ and Android 9+ (2arch) APKM variants with
// byte-identical base APKs. The catalog target documents the Android 10+ download; the
// original-input guard pins package, version, build and signer and deliberately does not
// reject a manifest minimum-SDK difference between such variants.
internal val originalInput = patches.shared.originalInput(soundcloud)
