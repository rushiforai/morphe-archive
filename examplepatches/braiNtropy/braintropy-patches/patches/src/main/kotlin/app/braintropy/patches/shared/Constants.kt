package app.braintropy.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WAKING_UP = Compatibility(
        name = "Waking Up",
        packageName = "org.wakingup.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1C1B33,
        targets = listOf(
            AppTarget(
                version = "3.24.1"
            )
        )
    )

    val COMPATIBILITY_MYOADAPT = Compatibility(
        name = "MyoAdapt",
        packageName = "com.myoadapt.app.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111111,
        targets = listOf(
            AppTarget(
                version = "1.5.1"
            )
        )
    )
}
