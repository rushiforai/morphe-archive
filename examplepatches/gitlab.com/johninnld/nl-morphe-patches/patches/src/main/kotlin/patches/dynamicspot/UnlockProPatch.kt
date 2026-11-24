package patches.dynamicspot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * dynamicSpot stores Pro in one default-SharedPreferences boolean (key "100") written only by
 * the Google Play billing flow. The legacy screens use six boxed-Boolean wrappers;
 * modern preference screens use a separate primitive-boolean entitlement provider.
 * Forcing every wrapper to TRUE unlocks what the app gates locally: the ad-free home
 * (banner, interstitials and the ad frequency timer), the Pro card and promo dialogs, the
 * promo push in the notification listener, the grayed-out battery-event rows in the app
 * selection list, and the free-user mirrors of the lockscreen action choices. This does not
 * create a purchase or entitlement on Google Play.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks locally enforced Pro settings, animations, colors and music controls, " +
        "removes ads and skips the onboarding paywall without creating a Play purchase.",
) {
    compatibleWith(dynamicspot)
    dependsOn(patches.shared.originalInput(dynamicspot), fixPairipStartupPatch)

    execute {
        listOf(
            HomeIsProFingerprint,
            OptionsIsProFingerprint,
            ObserverIsProFingerprint,
            AppsListIsProFingerprint,
            MyAppsIsProFingerprint,
            NotifAppsIsProFingerprint,
        ).forEach { fingerprint ->
            // Each wrapper declares .locals 2, so v0 exists in all six.
            fingerprint.method.addInstructions(
                0,
                "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\n" +
                    "return-object v0",
            )
        }

        // my0/g00 use uj0.b(), not any of the six legacy wrappers. This controls
        // both the lock badges/click routing and feature resets after a change.
        SettingsIsProFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // Tutorial completion opens the buy activity unconditionally, even for Pro.
        // Keep completion/preferences/finish intact and continue to the home screen.
        val completion = TutorialCompletionFingerprint.method
        val target = completion.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference.toString() ==
                "Lcom/jamworks/dynamicspot/SettingsOptionsNew;"
        }
        val register = (target.value as OneRegisterInstruction).registerA
        completion.replaceInstruction(target.index,
            "const-class v$register, Lcom/jamworks/dynamicspot/SettingsHome;")
    }
}
