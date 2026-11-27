package app.amazonamoled.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // The AMOLED patch only uses generic hooks (the Application class read from the manifest,
    // every WebViewClient subclass, every setWebViewClient() call), so it is not tied to one
    // Amazon release. "version = null" tells Morphe Manager that the latest release is expected
    // to work. The pinned version is the one the other Amazon patch sources currently target.

    val AMAZON_SHOPPING_COMPATIBILITY = Compatibility(
        name = "Amazon Shopping",
        packageName = "com.amazon.mShop.android.shopping",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF9900,
        targets = listOf(
            AppTarget(version = null),
            AppTarget(version = "32.19.0.100"),
        ),
    )

    val AMAZON_INDIA_COMPATIBILITY = Compatibility(
        name = "Amazon India",
        packageName = "in.amazon.mShop.android.shopping",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF9900,
        targets = listOf(
            AppTarget(version = null),
            AppTarget(version = "32.19.0.300"),
        ),
    )

    val AMAZON_BUSINESS_COMPATIBILITY = Compatibility(
        name = "Amazon Business",
        packageName = "com.amazon.mShop.android.business.shopping",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x232F3E,
        targets = listOf(
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
