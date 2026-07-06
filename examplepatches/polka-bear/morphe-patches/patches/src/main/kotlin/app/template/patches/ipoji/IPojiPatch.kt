package app.template.patches.ipoji

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ipoji.Fingerprints.EntitlementIsActiveFingerprint
import app.template.patches.shared.Constants.COMPATIBILITY_IPOJI

@Suppress("unused")
val ipojiUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features by forcing all RevenueCat entitlements to active.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IPOJI)

    execute {
        // Force EntitlementInfo.isActive() to return true.
        // Inject at index 0 — original code preserved but unreachable.
        //
        // This single patch covers the entire subscription pipeline:
        // 1. EntitlementInfos constructor filters on isActive() → all entitlements now in "active" map
        // 2. EntitlementInfoMapperKt.map() reads isActive() → Flutter receives isActive=true
        // 3. Flutter code checking any entitlement sees active status
        // 4. Ads gated by entitlement check in Flutter are also suppressed
        val entitlementClass = classDefBy(EntitlementIsActiveFingerprint.definingClass!!)
        EntitlementIsActiveFingerprint.match(entitlementClass).method
            .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
