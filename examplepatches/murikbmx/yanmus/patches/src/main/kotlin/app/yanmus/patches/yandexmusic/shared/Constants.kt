package app.yanmus.patches.yandexmusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YANDEX_MUSIC = Compatibility(
        name = "Яндекс Музыка",
        packageName = "ru.yandex.music",
        // Distributed as a split bundle (base + config splits).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFCC00,
        targets = listOf(
            // Version the patches were tested with (versionName as in the manifest).
            AppTarget(version = "2026.11.1 #171gpr"),
            // The patches only touch public SDK classes and the manifest, so other versions should work too.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
