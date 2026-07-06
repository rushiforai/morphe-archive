package app.photogrid.patches.photogrid

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.photogrid.patches.shared.Constants.PHOTOGRID

// ---------------------------------------------------------------------------
// Fingerprints — locate IabUtils methods in the compiled DEX.
//
// IabUtils was NOT obfuscated (confirmed via JADX), so we can match by the
// exact defining class + method name. The `custom` lambda runs after the
// return-type filter, giving us a rock-solid match even as bytecode shifts.
// ---------------------------------------------------------------------------

internal object IsPremiumUserFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type == "Lcom/photoedit/app/iab/IabUtils;" &&
            method.name == "isPremiumUser"
    }
)

internal object IsAdAvoidUserFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type == "Lcom/photoedit/app/iab/IabUtils;" &&
            method.name == "isAdAvoidUser"
    }
)

internal object IsPremiumUserFromBackendFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type == "Lcom/photoedit/app/iab/IabUtils;" &&
            method.name == "isPremiumUserFromBackend"
    }
)

// ---------------------------------------------------------------------------
// Patch — injects "return true" at offset 0 of all three gating methods.
//
// addInstructionsWithLabels(0, ...) inserts the two Smali instructions
// BEFORE the original method body, so the original logic is never reached.
//
//   const/4 v0, 0x1   → load boolean true into register v0
//   return v0          → return immediately
// ---------------------------------------------------------------------------

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all PhotoGrid premium features by making IabUtils always report the user as premium.",
) {
    compatibleWith(PHOTOGRID)

    execute {
        // isPremiumUser() → always true
        IsPremiumUserFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // isAdAvoidUser() → always true (controls ad-avoidance / watermark logic)
        IsAdAvoidUserFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // isPremiumUserFromBackend() → always true (called directly in some flows)
        IsPremiumUserFromBackendFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
