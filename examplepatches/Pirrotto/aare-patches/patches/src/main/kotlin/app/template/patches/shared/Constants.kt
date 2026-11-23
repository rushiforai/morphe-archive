package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AARE = Compatibility(
        name = "AARE", // App name as it appears in the Android launcher.
        packageName = "net.prototux.aare",
        description = "Open-source Android Auto replacement (github.com/prototux/AARE).",
        // AARE is published as a single APK on its GitHub releases page.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DDBC4,
        // Only the official AARE releases, signed with the AARE release key published in its README:
        // 63:EF:0D:E1:DB:2C:09:BB:7F:B2:5C:E7:EA:4A:DC:35:38:AF:42:3B:88:52:78:B5:9D:F2:88:9C:7F:18:28:6F
        signatures = setOf(
            "63ef0de1db2c09bb7fb25ce7ea4adc3538af423b885278b59df2889c7f18286f",
        ),
        targets = listOf(
            // The patch only adds a manifest permission, so it does not depend on the AARE version.
            AppTarget(version = null),
            // Version the patch was written against.
            AppTarget(version = "1.5.0"),
        ),
    )
}
