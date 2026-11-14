package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object WhatsAppCompatibility {
    val WHATSAPP = Compatibility(
        name = "WhatsApp",
        packageName = "com.whatsapp",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "2.26.43.76"),
            AppTarget(version = "2.26.43.75"),
            AppTarget(version = "2.26.43.74", isExperimental = true),
            AppTarget(version = "2.26.43.72", isExperimental = true),
        ),
        appIconColor = 0x25D366,
    )
}
