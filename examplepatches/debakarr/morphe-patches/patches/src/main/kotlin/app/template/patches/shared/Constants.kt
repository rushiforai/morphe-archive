package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    val AMAZON_IN_COMPATIBILITY = Compatibility(
        name = "Amazon India",
        packageName = "in.amazon.mShop.android.shopping",
        appIconColor = 0xFF9900,
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "32.16.2.300", versionCode = 1243222206))
    )

    val AMAZON_SHOPPING_COMPATIBILITY = Compatibility(
        name = "Amazon Shopping",
        packageName = "com.amazon.mShop.android.shopping",
        appIconColor = 0xFF9900,
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "32.13.2.100", versionCode = 1241320216))
    )

    val FLIPKART_COMPATIBILITY = Compatibility(
        name = "Flipkart",
        packageName = "com.flipkart.android",
        appIconColor = 0x2874F0,
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "9.13", versionCode = 3220300))
    )
}
