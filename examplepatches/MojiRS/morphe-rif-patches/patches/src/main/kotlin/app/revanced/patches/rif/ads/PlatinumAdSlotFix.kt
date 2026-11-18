package app.revanced.patches.rif.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister

// Platinum's feed ad-slot gate (f5.e0.d0, the twin of free's e5.e0.d0). It inserts a
// native-ad row when RifSettings.isPro is on, which happens when Platinum runs under
// free rif's package name (e.g. a "Change package name" patch). Platinum has no ad
// code, so that row NPEs in the post adapter's onCreateViewHolder (MainActivity.q1()
// is null). f5.e0 doesn't exist in the free build.
private val platinumFeedAdSlotGateFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == "Lf5/e0;" && method.name == "d0" && method.returnType == "Z"
    }
}

// Present only in the free build; tells free apart from a Platinum build whose gate moved.
private val freeAdsPackageFingerprint = fingerprint {
    custom { _, classDef ->
        classDef.type == "Lcom/andrewshu/android/reddit/ads/AdViewHelper;"
    }
}

/**
 * Never insert the native-ad feed row on Platinum. Hidden (no name); every public patch
 * depends on it, directly or through the shared settings patch, so any Platinum patch brings
 * it. No-op on free.
 */
internal val platinumAdSlotFixPatch = bytecodePatch(
    description = "Stops Platinum inserting a native-ad feed row it can't show.",
) {
    compatibleWith(*RIF_COMPATIBILITY)

    execute {
        val gate = platinumFeedAdSlotGateFingerprint.methodOrNull
        if (gate == null) {
            if (freeAdsPackageFingerprint.methodOrNull == null) {
                throw PatchException("Platinum feed ad-slot gate f5.e0.d0 not found")
            }
            return@execute // free build: Patcheddit's Fake reddit premium handles its gate.
        }
        requireScratchRegister(gate)
        gate.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
