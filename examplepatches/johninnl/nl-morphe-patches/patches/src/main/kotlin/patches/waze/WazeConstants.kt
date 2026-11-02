package patches.waze

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CatalogCompatibility {
    /**
     * Waze from the Play Store: `base.apk` plus ABI, density and language splits. The
     * patches are derived against this one version; the obfuscated classes they touch
     * are renamed by every build.
     */
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            AppTarget(version = "5.26.90.901"),
        ),
    )
}
