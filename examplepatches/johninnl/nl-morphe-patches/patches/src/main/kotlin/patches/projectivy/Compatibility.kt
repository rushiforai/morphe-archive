package patches.projectivy

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val projectivy = Compatibility(
    name = "Projectivy Launcher",
    packageName = "com.spocky.projengmenu",
    apkFileType = ApkFileType.APK,
    formFactor = FormFactor.TV,
    signatures = setOf("f6697bf4082ee97511e4de07863193884a015b7ab5860430321bda1042b0aadd"),
    targets = listOf(AppTarget(version = "4.73", versionCode = 98, minSdk = 23)),
)
