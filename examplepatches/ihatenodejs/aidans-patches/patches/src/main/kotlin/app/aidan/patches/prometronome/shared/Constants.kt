package app.aidan.patches.prometronome.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val PRO_METRONOME_PACKAGE_NAME = "com.eumlab.android.prometronome"

val COMPATIBILITY_PRO_METRONOME = Compatibility(
    name = "Pro Metronome",
    packageName = PRO_METRONOME_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xACD371,
    signatures = setOf(
        "67ba64147a05aedb766363801f77a59e04f37ab8785062a12c5678dadf8b7c35"
    ),
    targets = listOf(
        AppTarget(version = "1.0.12", minSdk = 23)
    )
)
