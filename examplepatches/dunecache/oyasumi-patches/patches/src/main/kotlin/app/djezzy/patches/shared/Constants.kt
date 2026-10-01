package app.djezzy.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * The reference is a VInstall APKV, which is a split bundle rather than a single
     * APK, so the target is declared as `APKM`. The step override itself only edits
     * `base.apk`, which is shared by every ABI split, so one entry covers all four.
     */
    val COMPATIBILITY_DJEZZY = Compatibility(
        name = "Djezzy",
        packageName = "com.djezzy.internet",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(version = "3.0.9", versionCode = 40076)
        )
    )
}
