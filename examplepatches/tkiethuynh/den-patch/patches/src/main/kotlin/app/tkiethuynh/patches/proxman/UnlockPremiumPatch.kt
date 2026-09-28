package app.tkiethuynh.patches.proxman

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tkiethuynh.patches.shared.Constants.COMPATIBILITY_PROXMAN

// Two attack surfaces, both must keep working:
//   1. Pairip's tamper detection (LicenseContentProvider + LicenseClient) — kills the process
//      on launch if not neutered.
//   2. The RevenueCat → JS bridge — Proxman is React Native, so the gate that the UI actually
//      consults runs in Hermes bytecode. Patching `isActive()` on the Java side is downstream
//      of an empty map and never fires; rewriting EntitlementInfosMapperKt.map() to emit a
//      synthetic "Pro" entry is the real unlock.
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features in Proxman by injecting a synthetic Pro " +
        "entitlement at the RevenueCat RN bridge and neutering the Pairip license check that " +
        "would otherwise kill the process.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PROXMAN)

    execute {
        // Belt-and-suspenders: even though the JS-side gate doesn't go through these, leaving
        // them returning true is harmless and protects against future code paths that might.
        isActiveFingerprint.method.addInstructions(0, RETURN_TRUE_BODY)
        getWillRenewFingerprint.method.addInstructions(0, RETURN_TRUE_BODY)

        // Pairip neuter — without this the process is killed before the UI renders.
        // Prepend return at instruction 0 so the method immediately returns and original try-blocks stay valid.
        licenseProviderOnCreateFingerprint.method.addInstructions(0, RETURN_TRUE_BODY)
        initializeLicenseCheckFingerprint.method.addInstructions(0, "return-void")

        // The actual unlock: every JS read of entitlements goes through this mapper.
        entitlementInfosMapperFingerprint.method.addInstructions(0, FAKE_ENTITLEMENT_INFOS_BODY)
    }
}
