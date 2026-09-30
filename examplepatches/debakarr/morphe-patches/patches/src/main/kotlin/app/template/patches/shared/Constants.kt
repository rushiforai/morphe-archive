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
        targets = listOf(
            AppTarget(version = "32.18.0.300", versionCode = 1243240206),
            AppTarget(version = "32.16.2.300", versionCode = 1243222206),
        )
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
        targets = listOf(
            AppTarget(version = "9.15", versionCode = 3240500),
            AppTarget(version = "9.13", versionCode = 3220300),
        )
    )

    val MYNTRA_COMPATIBILITY = Compatibility(
        name = "Myntra",
        packageName = "com.myntra.android",
        appIconColor = 0xFF3F6C,
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "4.2609.30", versionCode = 80110582))
    )

    val MEESHO_COMPATIBILITY = Compatibility(
        name = "Meesho",
        packageName = "com.meesho.supply",
        appIconColor = 0x9F2089,
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "29.5", versionCode = 868))
    )
}
