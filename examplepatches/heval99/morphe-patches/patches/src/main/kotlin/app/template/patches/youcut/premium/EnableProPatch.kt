package app.template.patches.youcut.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YOUCUT

/**
 * Matches the central "is subscribed" check. It reads the "SubscribePro" preference and
 * falls back to the "com.camerasideas.trimmer.vip" purchase flag, and is consulted by
 * the export/watermark flow, the template unlocks, the ads manager and the paywall
 * itself - forcing it true unlocks Pro everywhere (including watermark-free export).
 */
object SubscribedCheckFingerprint : Fingerprint(
    definingClass = "Lcom/camerasideas/instashot/store/billing/c;",
    name = "d",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
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
