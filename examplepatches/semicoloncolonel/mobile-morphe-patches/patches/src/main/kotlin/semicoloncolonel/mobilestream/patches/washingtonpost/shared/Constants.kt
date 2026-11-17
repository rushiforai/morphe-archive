package semicoloncolonel.mobilestream.patches.washingtonpost.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Washington Post",
        packageName = "com.washingtonpost.android",
        description = "The Washington Post news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111,
        targets = listOf(
            AppTarget("7.19.0 (3221)", versionCode = 2277),
            AppTarget("7.18.4"),
            AppTarget("7.18.3"),
            AppTarget("7.18.1"),
        )
    )

    // Hide paywall sheet matches 7.19.0's obfuscated names, so it is offered
    // only for that version.
    val PAYWALL_SHEET_COMPATIBILITY = Compatibility(
        name = "The Washington Post",
        packageName = "com.washingtonpost.android",
        description = "The Washington Post news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111,
        targets = listOf(
            AppTarget("7.19.0 (3221)", versionCode = 2277),
        )
    )
}
