package app.template.patches.youcut.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YOUCUT
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the central "is subscribed" check. It reads the "SubscribePro" preference and
 * falls back to the "com.camerasideas.trimmer.vip" purchase flag, and is consulted by
 * the export/watermark flow, the template unlocks, the ads manager and the paywall
 * itself - forcing it true unlocks Pro everywhere (including watermark-free export).
 *
 * R8 rotates the billing helper's class name (`store/billing/c` in 1.716, `billing/d` in
 * 1.721), so match on shape + the two preference keys only. The keys also appear together
 * in a (ILandroid/content/Context;Ljava/util/List;)V purchase handler, which the static
 * (Context)Z shape excludes.
 */
object SubscribedCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("SubscribePro", "com.camerasideas.trimmer.vip"),
)

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks YouCut Pro: watermark-free export and all paid features."
) {
    compatibleWith(COMPATIBILITY_YOUCUT)

    execute {
        // Mandatory anchor: fail loudly if a future release renames this check
        // instead of silently shipping an inert patch.
        SubscribedCheckFingerprint.method.returnEarly(true)
    }
}
