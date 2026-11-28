package com.awt.regain.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_REGAIN =
        Compatibility(
            name = "Regain",
            packageName = "ai.regainapp",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x4A90D9,
            targets =
                listOf(
                    AppTarget(
                        version = "76.2.2151",
                    ),
                    AppTarget(
                        version = "76.1.2139",
                    ),
                ),
        )

    // Target class for subscription state
    const val SUBSCRIPTION_STATE_CLASS = "Lai/blox100/feature_subscription/domain/model/SubscriptionState;"
}
