package patches.foodpanda

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_FOODPANDA = Compatibility(
    name = "foodpanda",
    packageName = "com.global.foodpanda.android",
    // foodpanda ships as split APKs (base + config splits). Targets live in the base APK
    // (classes/classes3), so patching the base is sufficient — matches the repo convention of
    // APK_REQUIRED for the other split apps here.
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xD70F64, // foodpanda brand pink
    // emptySet() = accept any signing key, so Manager lists an installed foodpanda as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            // Actual APK manifest: minSdkVersion 29, targetSdk 36.
            version = "26.38.1",
            minSdk = 29,
        ),
    ),
)
