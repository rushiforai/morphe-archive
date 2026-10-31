package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

@Suppress("unused")
val briefVoiceGuidancePatch = bytecodePatch(
    name = "Brief voice guidance",
    description = "Shorter spoken directions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Driving & Voice")

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
                "brv", true,
                "CONFIG_VALUE_BRIEF_VOICE_GUIDANCE_MODE_ENABLED",
                "CONFIG_VALUE_BRIEF_VOICE_GUIDANCE_MODE_FEATURE_ENABLED",
            )
    }
}
