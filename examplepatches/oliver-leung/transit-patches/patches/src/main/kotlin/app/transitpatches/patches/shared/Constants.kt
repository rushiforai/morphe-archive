package app.transitpatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TRANSIT = Compatibility(
        name = "Transit",
        packageName = "com.thetransitapp.droid",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x27A559,
        signatures = setOf(
            "18ba033cdc607a3dc7d7a28a7e6e0faf502cb86da9bed7cb618c6117b3910b95",
            "a055a86a4f7538d3ee2d575c06743281b813052373dea5bff10d201581551341",
        ),
        targets = listOf(
            AppTarget(version = "6.3.7"),
        ),
    )
}
