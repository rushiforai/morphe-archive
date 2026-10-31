package app.template.patches.esexplorer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ES_EXPLORER_COMPATIBILITY
import app.template.patches.shared.clearBody

/**
 * Eliminates splash delays, auto-finishes background-return nag activities,
 * and strips bloatware interstitials for instant launch and minimal memory footprint.
 */
@Suppress("unused")
val esExplorerLightweightPatch = bytecodePatch(
    name = "Make App Lightweight & Fast Launch",
    description = "Instantly skips splash ad delay screens, eliminates background-return popups, and bypasses upgrade nags.",
    default = true,
) {
    compatibleWith(ES_EXPLORER_COMPATIBILITY)

    execute {
        // 1. Instant App Launch: Skip splash ad loading and immediately launch main File Explorer
        runCatching {
            SplashLoadThirdPartyAdFingerprint.method.apply {
                clearBody()
                addInstructions(
                    0,
                    """
                    invoke-virtual {p0}, Lcom/estrongs/android/pop/app/openscreenad/NewSplashActivity;->startFileExplorerActivity()V
                    return-void
                    """.trimIndent()
                )
            }
        }

        // 2. Auto-Finish HomeBackSplashActivity: No full-screen ads when resuming from another app
        runCatching {
            HomeBackSplashCreateFingerprint.method.apply {
                clearBody()
                addInstructions(
                    0,
                    """
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                    return-void
                    """.trimIndent()
                )
            }
        }

        // 3. Auto-Finish PremiumSplashActivity: Bypass standalone upgrade promo activity
        runCatching {
            PremiumSplashCreateFingerprint.method.apply {
                clearBody()
                addInstructions(
                    0,
                    """
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                    return-void
                    """.trimIndent()
                )
            }
        }
    }
}

