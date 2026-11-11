package com.dowjames.patches.paprika

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PaprikaConstants {
    const val PACKAGE_NAME = "com.hindsightlabs.paprika.android.v3"

    /** The v4 subscription SKU the app treats as the Premium entitlement. */
    const val SUBSCRIPTION_PRODUCT_ID = "paprika.android.v4.subscription"

    val COMPATIBILITY_PAPRIKA = Compatibility(
        name = "Paprika",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB22F1A,
        targets = listOf(
            AppTarget(
                version = "4.0.14"
            )
        )
    )
}
