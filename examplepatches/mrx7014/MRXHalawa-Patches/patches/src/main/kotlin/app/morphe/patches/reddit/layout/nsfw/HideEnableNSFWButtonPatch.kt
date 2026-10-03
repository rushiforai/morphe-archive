/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */
package app.morphe.patches.reddit.layout.nsfw

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.misc.flag.featureFlagHookPatch
import app.morphe.patches.reddit.misc.flag.hookFeatureFlag
import app.morphe.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/HideEnableNSFWButtonPatch;"

@Suppress("unused")
val hideEnableNSFWButtonPatch = bytecodePatch(
    name = "Hide Enable NSFW button",
    description = "Removes the Enable NSFW button from Reddit settings."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(featureFlagHookPatch)

    execute {
        hookFeatureFlag("$EXTENSION_CLASS->hideEnableNSFWButton")
    }
}
