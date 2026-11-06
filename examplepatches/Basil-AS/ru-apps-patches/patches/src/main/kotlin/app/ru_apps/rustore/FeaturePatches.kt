// Ported from Freeman022026/rustore-privacy-patches (GPLv3), dev/freeman022026/rustore/patches/FeaturePatches.kt.
package app.ru_apps.rustore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// This file used to carry eleven more patches (ads, analytics/trackers, Kaspersky,
// gaming, background-work restriction, update-auth skip, Google Play exclusion, and
// their shared manifest validation) that were an independent, hardcoded-obfuscated-name
// port of functionality app.ru_apps.rustore_jl4ctuk already implements with more
// resilient (sourceFile/custom-matcher based) fingerprints. Several shared the exact
// same morphe patch display name as their rustore_jl4ctuk twin (e.g. "Disable push
// services", "Restrict background work to updates", "Skip update authentication"),
// which made morphe run both and fail whichever ran second as a false positive once
// the first had already modified the same bytes - the same bug already fixed once for
// "Restore secure-session compatibility". A live decompile (ru.vk.store 1.111.0.3,
// 2026-10) additionally found most of this file's own hardcoded fingerprints had
// drifted or been entirely repurposed (e.g. Lec2/o;->c now implements an unrelated
// download-info Retrofit endpoint). Removed wholesale in favor of the already-verified
// rustore_jl4ctuk twins; only the two device-identifier patches below are NOT
// duplicated anywhere else, so they stay (with their own fingerprints re-anchored to
// the current obfuscated names).

@Suppress("unused")
val replaceRuStoreSdkDeviceIdentifierPatch = bytecodePatch(
    name = "Replace RuStore SDK device identifier",
    description = "Replaces the RuStore SDK device identifier sent with payment and session requests with the zero UUID.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_RUSTORE)

    execute {
        rustoreSdkDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "00000000-0000-0000-0000-000000000000"
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val replaceVkSdkDeviceIdentifierPatch = bytecodePatch(
    name = "Replace VK SDK device identifier",
    description = "Replaces the VK SDK device fingerprint sent by VK ID and VK Pay request paths with the zero UUID.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_RUSTORE)

    execute {
        vkSdkDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "00000000-0000-0000-0000-000000000000"
                return-object v0
            """
        )
    }
}
