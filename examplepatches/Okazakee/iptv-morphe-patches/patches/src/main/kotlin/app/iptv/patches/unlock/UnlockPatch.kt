package app.iptv.patches.unlock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro (IPTV)",
    description = "Deactivates subscription_needed, forces the pro entitlement active, and spoofs Google Play for app-internal installer-source checks.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_IPTV)
    compatibleWith(Constants.COMPATIBILITY_IPTV_FR)

    dependsOn(spoofPlayStoreInstallerSourcePatch)

    execute {
        // Subscription gate.
        // <= 2.7.21: O7/j.A()/B() read the flag directly.
        // 2.7.24+  : the check lives in the coroutine gate and reads the flag
        //            through the shared Remote Config boolean reader; force only
        //            the "subscription_needed" key, leaving other flags intact.
        val legacyGate = try {
            SubscriptionNeededAFingerprint.method
            true
        } catch (_: Exception) {
            false
        }

        if (legacyGate) {
            SubscriptionNeededAFingerprint.method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """.trimIndent())
            try {
                SubscriptionNeededBFingerprint.method.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent())
            } catch (_: Exception) {}
        } else {
            RemoteConfigBooleanReaderFingerprint.method.addInstructions(0, """
                const-string v0, "subscription_needed"
                invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_subscription_continue
                const/4 v0, 0x0
                return v0
                :morphe_subscription_continue
            """.trimIndent())
        }

        // Pro entitlement.
        try {
            ProEntitlementXFingerprint.method.addInstructions(0, """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent())
        } catch (_: Exception) {}
        try {
            ProEntitlementWFingerprint.method.addInstructions(0, """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent())
        } catch (_: Exception) {}
        try {
            ProEntitlement2724Fingerprint.method.addInstructions(0, """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent())
        } catch (_: Exception) {}
    }
}
