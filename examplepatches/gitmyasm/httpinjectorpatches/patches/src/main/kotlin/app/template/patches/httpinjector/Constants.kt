package app.template.patches.httpinjector

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Target build used to derive the premium binary changes. */
val COMPATIBILITY_HTTP_INJECTOR = Compatibility(
    name = "HTTP Injector",
    packageName = "com.evozi.injector",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0x00A0E9,
    targets = listOf(
        AppTarget(version = "6.5.0"),
    ),
)
