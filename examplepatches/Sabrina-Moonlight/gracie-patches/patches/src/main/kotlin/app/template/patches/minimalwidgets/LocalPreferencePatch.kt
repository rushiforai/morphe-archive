package app.template.patches.minimalwidgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val MINIMAL_WIDGETS = Compatibility(
    name = "Minimal Widgets",
    packageName = "com.jndapp.minimal.widgets",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    targets = listOf(AppTarget(version = "2.2.11")),
)

/**
 * Local preference gate used for optional widget features.
 * Returning true keeps those features available offline.
 */
private object PremiumUnlockedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("premium_prefs", "premium_unlocked"),
)

@Suppress("unused")
val localPreferencePatch = bytecodePatch(
    name = "Local Preference",
    description = "Uses a local preference so optional widget features stay available offline.",
    default = true,
) {
    compatibleWith(MINIMAL_WIDGETS)

    execute {
        PremiumUnlockedFingerprint.method.returnEarly(true)
    }
}
