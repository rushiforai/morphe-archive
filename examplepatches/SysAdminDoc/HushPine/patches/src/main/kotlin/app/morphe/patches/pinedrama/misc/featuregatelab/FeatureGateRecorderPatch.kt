/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.pinedrama.misc.featuregatelab

import app.morphe.util.addInstruction
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.settingsPatch

@Suppress("unused")
val featureGateRecorderPatch = bytecodePatch(
    name = "Feature Gate Recorder",
    description = "Records which hidden PineDrama settings the app reads while you use it, and " +
        "which ones changed. It's a research tool and changes nothing in PineDrama. Start a " +
        "recording in HushPine settings > Diagnostics.",
    default = false,
) {
    category("Settings")
    dependsOn(settingsPatch, featureGateLabPatch)
    compatibleWith(*AppCompatibilities.pineDrama())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableFeatureGateRecorder()V")
    }
}
