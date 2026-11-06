package app.yaziopatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val YAZIO = Compatibility(
        name = "YAZIO",
        packageName = "com.yazio.android",
        // Auf APKMirror wird YAZIO als .apkm (Split-Bundle) angeboten.
        apkFileType = ApkFileType.APKM,
        // Akzentfarbe des App-Icons (#00C89C), nur für die Anzeige im Manager.
        appIconColor = 0x00C89C,
        targets = listOf(
            // Getestete Version.
            AppTarget(version = "26.36.1"),
            // Neuere Versionen zunächst experimentell zulassen.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
