/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly

@Suppress("unused")
val aiProfilingGovernorPatch = bytecodePatch(
    name = "Stop on-device AI profiling",
    description = "Keeps TikTok's Pitaya on-device AI plugin from starting, so its native engine doesn't load and it doesn't get a copy of every analytics event TikTok logs. TikTok carries on as if the Pitaya plugin weren't installed. Remove content credential and card scanner assets also empties some of Pitaya's libraries.",
    default = false,
) {
    category("Privacy")
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        // No plugin: TikTok takes its own "not installed" path, so the plugin's start-up (its
        // native libraries, boot executor and real core) never runs and no event is copied to it.
        PitayaPluginLookupFingerprint.method.returnEarly(null)
        // Should the plugin arrive another way, its engine still can't attach, and TikTok's
        // stand-in core keeps answering "host not ready".
        PitayaRealProviderFingerprint.method.returnEarly()
        PitayaLiteStartFingerprint.method.returnEarly()
    }
}
