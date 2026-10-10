/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.layout.viewcount

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.reddit.misc.flag.featureFlagHookPatch
import app.tada.patches.reddit.misc.flag.hookFeatureFlag
import app.tada.patches.reddit.misc.settings.settingsPatch
import app.tada.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/ShowViewCountPatch;"

@Suppress("unused")
val showViewCountPatch = bytecodePatch(
    name = "Show view count",
    description = "Adds an option to show the view count of Posts."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(
        settingsPatch,
        featureFlagHookPatch
    )

    execute {

        hookFeatureFlag("$EXTENSION_CLASS->showViewCount")

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
    }
}
