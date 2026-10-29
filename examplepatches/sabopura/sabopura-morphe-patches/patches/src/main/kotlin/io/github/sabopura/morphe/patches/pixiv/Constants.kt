package io.github.sabopura.morphe.patches.pixiv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val PIXIV = Compatibility(
        name = "pixiv",
        packageName = "jp.pxv.android",
        description = "Official pixiv Android app; anchors are view holder types, log strings and SDK calls.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0096FA,
        signatures = setOf(
            "e9408c92d2d2eaa8e37f32cc065111c8cef1f926e753f5842b772c49f996d9fb",
        ),
        targets = listOf(
            AppTarget(
                version = "6.201.0",
                versionCode = 69129,
                minSdk = 26,
                description = "Verified on API 36: launches, no ad SDK initialization (the unpatched app logs AppLovin and Pangle); the four modified methods checked in the output. Logged-in ad slots not yet checked.",
            ),
            AppTarget(
                version = "6.202.1",
                versionCode = 69581,
                minSdk = 26,
                description = "Verified on API 36: launches, no ad SDK initialization (the unpatched app logs AppLovin and Pangle); the four modified methods checked in the output. Logged-in ad slots not yet checked.",
            ),
        ),
    )
}
