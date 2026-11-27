package app.template.patches.redditsync.removeads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removeads.fingerprints.adsEnabledGateFingerprint

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed by hand from real smali (via apktool): AdWrapper and other screens all
 * check Ll9/a;->b(Landroid/content/Context;)Z to decide whether to show ads. Forcing
 * it to always return false unconditionally disables ads everywhere, replicating —
 * for every user — the exact code path that already runs today for anyone who
 * purchased "Remove Ads" (the ad SDKs themselves, AdMob and Amazon APS, stay bundled
 * in the APK but this app-level gate stops the app from ever asking them to load or
 * display anything).
 *
 * The change is made by prepending an early return before the original method body
 * (matching this project's template pattern), leaving the now-unreachable original
 * instructions in place rather than removing them.
 */
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Permanently disables ads in Sync for Reddit.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        adsEnabledGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
