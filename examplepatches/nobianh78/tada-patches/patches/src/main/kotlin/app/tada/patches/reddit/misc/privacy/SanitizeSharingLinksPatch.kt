/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.reddit.misc.settings.settingsPatch
import app.tada.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/SanitizeSharingLinksPatch;"

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Adds an option to sanitize sharing links by removing tracking query parameters."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(settingsPatch)

    execute {
        ShareLinkFormatterFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->stripQueryParameters()Z
                move-result v0
                if-eqz v0, :off
                return-object p0
                :off
                nop
            """
        )

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
    }
}
