/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.openlink

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.reddit.misc.settings.settingsPatch
import app.tada.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/OpenLinksDirectlyPatch;"

@Suppress("unused")
val openLinksDirectlyPatch = bytecodePatch(
    name = "Open links directly",
    description = "Adds an option to skip over redirection URLs in external links."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(
        settingsPatch,
        screenNavigatorMethodResolverPatch
    )

    execute {
        screenNavigatorMethodRef.get()!!.addInstructions(
            0,
            """
                invoke-static { p2 }, $EXTENSION_CLASS->parseRedirectUri(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object p2
            """
        )

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
    }
}
