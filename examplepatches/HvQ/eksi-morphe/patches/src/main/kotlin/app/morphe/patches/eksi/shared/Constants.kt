package app.morphe.patches.eksi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_EKSI = Compatibility(
        name = "Ekşi Sözlük",
        packageName = "com.eksiteknoloji.eksisozluk",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x81C14B,
        signatures = setOf(
            "2c7a15c43fc79ec9fe3e621825f37de6e75e6f2427dc21e83e089515804a7426",
        ),
    )
}
