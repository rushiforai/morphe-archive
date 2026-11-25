package app.masareef.patches.ads

import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Stubs out AdsManager so no banner/native ads or consent dialogs are ever " +
        "loaded, requested, or shown, and the Mobile Ads SDK is never initialized.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        listOf(
            AdsManagerClearAllFingerprint,
            AdsManagerClearExpiredFingerprint,
            AdsManagerLoadAdFingerprint,
            AdsManagerTrackFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, "return-void")
        }

        // Returns an object (Triple), so it needs an explicit null instead of a bare return-void.
        AdsManagerGetCachedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
