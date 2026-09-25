/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.misc.featuregatelab

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

@Suppress("unused")
val featureGateRecorderPatch = bytecodePatch(
    name = "Feature Gate Recorder",
    description = "Records feature gate reads while you use TikTok and compares them with their previous values. Switch: Hushfeed settings > Diagnostics.",
    default = false,
) {
    category("Settings")
    dependsOn(settingsPatch, featureGateLabPatch)
    compatibleWith(*AppCompatibilities.tiktok4703())
    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableFeatureGateRecorder()V")
    }
}
