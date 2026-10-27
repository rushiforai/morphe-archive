package io.github.sabopura.morphe.patches.sankaku

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val SANKAKU = Compatibility(
        name = "Sankaku App",
        packageName = "com.sankakucomplex.channel.black",
        description = "Official APK from welcome.sankaku.app/app-download (React Native, Hermes bundle).",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B1B2F,
        signatures = setOf(
            "4e13a6b8182984d2629fd2efb13385d2b86bf77e29a59133728afa7448eda919",
        ),
        targets = listOf(
            AppTarget(
                version = "4.28",
                minSdk = 24,
                description = "rc100; welcome.sankaku.app/apk/sankaku-app-4.28-rc100.apk",
            ),
            AppTarget(
                version = "4.27",
                minSdk = 24,
                description = "rc98; welcome.sankaku.app/apk/sankaku-app-4.27-rc98.apk",
            ),
        ),
    )
}
