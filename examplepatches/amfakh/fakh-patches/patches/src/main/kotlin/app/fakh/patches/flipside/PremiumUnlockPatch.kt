package app.fakh.patches.flipside

import app.fakh.patches.flipside.shared.Constants.COMPATIBILITY_FLIPSIDE
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Every premium check in the app funnels through one getter on the unlock store:
 *
 * ```
 * // com.example.flipwidgethost.Unlock (Kotlin object, kept name)
 * boolean isUnlocked(Context context) {
 *     return context.getSharedPreferences("unlock", 0).getBoolean("unlocked", false);
 * }
 * ```
 *
 * The flag is written only from the Play Billing purchase handler and cleared
 * when a purchase refresh finds nothing. `isLocked()` reads it (`!isUnlocked() &&
 * trialDaysLeft() == 0`), the three-day trial banner, the widget/preset gates
 * (PresetsActivity, the widget providers) and the EntitlementProvider cursor all
 * read it, so forcing the getter unlocks every screen for free.
 */
private val isUnlockedFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/example/flipwidgethost/Unlock;" &&
            method.name == "isUnlocked" &&
            method.implementation != null
    },
)

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks premium (every locked feature, no trial limit) and stops the Play license check " +
        "from closing the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FLIPSIDE)
    category("Premium")
    dependsOn(pairipLicenseCheckPatch)

    execute {
        isUnlockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
