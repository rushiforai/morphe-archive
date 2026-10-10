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
    description = "Stops TikTok's built-in AI engine from starting, so it doesn't get a copy " +
        "of everything TikTok logs about your use. TikTok works as if the engine weren't there. " +
        "It has no switch, so only patching again without it undoes it.",
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
