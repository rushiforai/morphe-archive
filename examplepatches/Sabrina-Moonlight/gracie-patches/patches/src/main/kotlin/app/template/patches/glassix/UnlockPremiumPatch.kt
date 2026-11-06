package app.template.patches.glassix

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val GLASSIX = Compatibility(
    name = "Glassix: Glass Widgets & Theme",
    packageName = "com.saban.glassy.glasswidgets.themes",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x00BCD4,
    targets = listOf(
        AppTarget(version = "1.0.3", versionCode = 103, minSdk = 32),
    ),
)

/**
 * Common.isRealBought(Context): reads SharedPreferences key "setBought".
 * Returning true keeps premium features and hides ads offline.
 */
private object IsRealBoughtFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("setBought"),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Local Premium",
    description = "Uses a local preference so premium widgets and no-ads stay available offline.",
    default = true,
) {
    compatibleWith(GLASSIX)

    execute {
        IsRealBoughtFingerprint.method.returnEarly(true)
    }
}
