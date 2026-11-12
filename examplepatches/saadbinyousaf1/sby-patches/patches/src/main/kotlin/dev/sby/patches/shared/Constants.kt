// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// © https://saadbinyousaf.dev/ © //
object Constants {
    val COMPATIBILITY_FOODPANDA = Compatibility(
        packageName = "com.global.foodpanda.android",
        name = "foodpanda",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xD70F64,
        signatures = emptySet(),
        targets = listOf(
            AppTarget(version = "26.44.0", minSdk = 29),
        ),
    )
}
// © https://saadbinyousaf.dev/ © //
