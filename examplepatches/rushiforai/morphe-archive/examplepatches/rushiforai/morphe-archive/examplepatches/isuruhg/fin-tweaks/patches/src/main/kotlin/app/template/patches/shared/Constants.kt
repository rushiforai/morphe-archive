package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YAHOO_FINANCE = Compatibility(
        name = "Yahoo Finance",
        packageName = "com.yahoo.mobile.client.android.finance",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6001D2, // Yahoo purple, shown in Morphe Manager
        targets = listOf(
            // Built and verified against 26.10.2. The patches match by class +
            // method name (the ad layer is not obfuscated), so they should keep
            // working on newer builds unless Yahoo renames these classes.
            AppTarget(
                version = "26.10.2",
            ),
        ),
    )
}
