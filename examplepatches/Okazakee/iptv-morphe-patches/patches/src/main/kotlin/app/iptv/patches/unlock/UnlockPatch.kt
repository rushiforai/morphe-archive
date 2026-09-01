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

    dependsOn(spoofPlayStoreInstallerSourcePatch)

    execute {
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
        try {
            ProEntitlementWFingerprint.method.addInstructions(0, """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent())
        } catch (_: Exception) {}
        try {
            ProEntitlementXFingerprint.method.addInstructions(0, """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent())
        } catch (_: Exception) {}
    }
}
