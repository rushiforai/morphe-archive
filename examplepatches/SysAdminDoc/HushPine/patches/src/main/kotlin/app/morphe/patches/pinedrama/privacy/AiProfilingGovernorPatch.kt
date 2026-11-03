/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.privacy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.pinedrama.shared.returnNullWhenOn
import app.morphe.patches.pinedrama.shared.returnVoidWhenOn
import app.morphe.util.addInstruction

private const val PATCH = "Stop on-device AI profiling"
internal const val AI_PROFILING_SWITCH = "Lapp/morphe/extension/pinedrama/privacy/AiProfiling;->stopsEngine()Z"

@Suppress("unused")
val aiProfilingGovernorPatch = bytecodePatch(
    name = "Stop on-device AI profiling",
    description = "Lets you stop PineDrama's built-in AI engine from starting, so it doesn't get a " +
        "copy of everything PineDrama logs about your use. PineDrama works as if the engine weren't " +
        "there. Starts off. Turn it on in HushPine settings > Privacy.",
) {
    category("Privacy")
    dependsOn(sharedExtensionPatch, settingsPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        installAiProfilingSwitch()
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableAiProfiling()V",
        )
    }
}

/**
 * The patch's hooks, without its settings row, so a test can put them on a build that carries no
 * extension. With the switch off all three run as PineDrama wrote them.
 */
context(patchContext: BytecodePatchContext)
internal fun installAiProfilingSwitch() {
    // No plugin: PineDrama takes its own "not installed" path, so the plugin's start-up (its
    // native libraries, boot executor and real core) never runs and no event is copied to it.
    PitayaPluginLookupFingerprint.method.returnNullWhenOn(PATCH, AI_PROFILING_SWITCH)
    // Should the plugin arrive another way, its engine still can't attach, and PineDrama's
    // stand-in core keeps answering "host not ready".
    PitayaRealProviderFingerprint.method.returnVoidWhenOn(PATCH, AI_PROFILING_SWITCH)
    PitayaLiteStartFingerprint.method.returnVoidWhenOn(PATCH, AI_PROFILING_SWITCH)
}
