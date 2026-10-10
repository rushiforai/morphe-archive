/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.layout.ask

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.reddit.misc.flag.featureFlagHookPatch
import app.tada.patches.reddit.misc.flag.hookFeatureFlag
import app.tada.patches.reddit.misc.settings.settingsPatch
import app.tada.patches.reddit.misc.version.versionCheckPatch
import app.tada.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/HideAskButtonPatch;"

@Suppress("unused")
val hideAskButtonPatch = bytecodePatch(
    name = "Hide Ask button",
    description = "Adds an option to hide Ask button in the search bar."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(
        settingsPatch,
        featureFlagHookPatch,
        versionCheckPatch
    )

    execute {
        hookFeatureFlag("$EXTENSION_CLASS->hideAskButton")

        AskButtonComposableFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->shouldHideAskButton()Z
                move-result v0
                if-eqz v0, :ignore
                return-void
                :ignore
                nop
            """
        )

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
    }
}
