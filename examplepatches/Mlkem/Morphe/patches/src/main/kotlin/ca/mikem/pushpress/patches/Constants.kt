package ca.mikem.pushpress.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val PUSH_PRESS_MEMBERS = Compatibility(
        name = "PushPress Members",
        packageName = "com.pushpress.memberportal",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111111,
        targets = listOf(
            AppTarget(version = "3.42.0", isExperimental = true)
        )
    )
}
