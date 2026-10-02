package app.fblite.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FACEBOOK_LITE = Compatibility(
        name = "Facebook Lite",
        packageName = "com.facebook.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1877F2,
        targets = listOf(
            AppTarget(
                version = "530.0.0.8.106"
            ),
            // The hooked class is not obfuscated, so newer versions should work too.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )

    /**
     * For patches that name obfuscated classes in the secondary dex (X.0eF, ...). The patcher cannot
     * see that dex, so those names cannot be fingerprinted and change with every app version.
     */
    val COMPATIBILITY_FACEBOOK_LITE_530 = Compatibility(
        name = "Facebook Lite",
        packageName = "com.facebook.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1877F2,
        targets = listOf(
            AppTarget(
                version = "530.0.0.8.106"
            ),
        )
    )
}
