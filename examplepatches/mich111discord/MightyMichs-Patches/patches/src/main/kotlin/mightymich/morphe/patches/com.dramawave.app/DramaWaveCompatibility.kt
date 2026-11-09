package mightymich.morphe.patches.com.dramawave.app

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DramaWaveCompatibility {
    val DRAMAWAVE = Compatibility(
        name = "DramaWave",
        packageName = "com.dramawave.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE91E63,
        targets = listOf(
            AppTarget(version = "2.0.70"),
            AppTarget(version = "2.0.61", isExperimental = true),
            AppTarget(version = "2.0.51", isExperimental = true),
        ),
    )
}
