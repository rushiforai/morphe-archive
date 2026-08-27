package app.template.patches.rustore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val OFFICIAL_RUSTORE_SIGNER_SHA256 =
        "661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914"

    val COMPATIBILITY_RUSTORE = Compatibility(
        name = "RuStore",
        packageName = "ru.vk.store",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        signatures = setOf(OFFICIAL_RUSTORE_SIGNER_SHA256),
        targets = listOf(
            AppTarget(version = "1.108.0.2", versionCode = 1108002),
        ),
    )
}
