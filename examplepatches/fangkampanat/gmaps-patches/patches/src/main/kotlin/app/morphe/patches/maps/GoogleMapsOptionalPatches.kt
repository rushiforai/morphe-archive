package app.morphe.patches.maps

import app.morphe.patcher.patch.bytecodePatch

/**
 * Patches split from the core so they can be selected individually; BYD audio routing is off
 * by default because phones do not need it. They share the core's compatibility target and
 * extension; the core runs first to inject the extension DEX and initialize MicroG support.
 */
@Suppress("unused")
val deviceCertificationPatch = bytecodePatch(
    name = "Device certification fix",
    description = "Skips the uncertified-device screen that closes Maps on devices Google does not certify.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch)

    execute {
        patchDeviceComplianceCheck()
    }
}

@Suppress("unused")
val navigationSpeechPatch = bytecodePatch(
    name = "Navigation speech and TTS startup",
    description = "Prefers synthesized navigation speech, keeping the existing audio fallback, and starts Google TTS when Maps opens.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch)

    execute {
        patchNavigationTts()
        injectNavigationTtsWarmup()
    }
}

@Suppress("unused")
val bydNavigationAudioPatch = bytecodePatch(
    name = "BYD navigation audio routing",
    description = "Routes navigation prompts to the BYD-specific audio stream when supported, retaining the original fallback. Not needed on phones.",
    default = false,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch)

    execute {
        patchBydNavigationAudio()
    }
}
