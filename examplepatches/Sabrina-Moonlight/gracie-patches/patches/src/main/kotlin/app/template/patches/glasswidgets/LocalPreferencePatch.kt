package app.template.patches.glasswidgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.misc.pairip.GLASS_WIDGETS
import com.android.tools.smali.dexlib2.AccessFlags

private object PremiumUnlockedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("premium_prefs", "install_check_prefs"),
)

@Suppress("unused")
val localPreferencePatch = bytecodePatch(
    name = "Local Preference",
    description = "Uses a local preference so optional widget features stay available offline.",
    default = true,
) {
    compatibleWith(GLASS_WIDGETS)

    execute {
        runCatching { PremiumUnlockedFingerprint.method.returnEarly(true) }
    }
}
