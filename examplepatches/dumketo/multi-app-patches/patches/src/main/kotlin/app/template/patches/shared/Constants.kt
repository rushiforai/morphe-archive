package app.template.patches.shared

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.ApkFileType

val WALLVERSE_COMPATIBILITY = Compatibility(
    name = "Wallverse",
    packageName = "com.wallverse.wallpapers",
    apkFileType = ApkFileType.XAPK,
    minVersion = "4.2",
    maxVersion = "4.2",
    patches = listOf(
        "wallverseUnlockPremiumPatch",
        "wallverseCustomBrandingPatch"
    )
)

val ACCUBATTERY_COMPATIBILITY = Compatibility(
    name = "AccuBattery",
    packageName = "com.digibites.accubattery",
    apkFileType = ApkFileType.APK,
    minVersion = "2.1.8",
    maxVersion = "2.1.8",
    patches = listOf(
        "accubatteryUnlockProPatch",
        "accubatteryRemoveAdsPatch"
    )
)

val ADGUARD_COMPATIBILITY = Compatibility(
    name = "AdGuard",
    packageName = "com.adguard.android",
    apkFileType = ApkFileType.APK,
    minVersion = "4.14.68",
    maxVersion = "4.14.68",
    patches = listOf(
        "adguardPremiumLicensePatch",
        "adguardCustomDnsPatch"
    )
)

val ADOBE_ACROBAT_COMPATIBILITY = Compatibility(
    name = "Adobe Acrobat",
    packageName = "com.adobe.reader",
    apkFileType = ApkFileType.XAPK,
    minVersion = "26.7.0.47169",
    maxVersion = "26.7.0.47169",
    patches = listOf(
        "adobeUnlockProToolsPatch",
        "adobeRemoveWatermarksPatch"
    )
)