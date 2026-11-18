// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixyoutube

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.shared.rewriteStrings
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

// YouTube's embedded player wants the embedding app named in the Referer, `https://<app ID>`; a WebView page sets it
// with its base URL. The player page claimed to be www.youtube.com, which YouTube now refuses.
private const val ORIGIN = "https://$RIF_PACKAGE"

@Suppress("unused")
val fixYouTubePatch =
    bytecodePatch(
        name = "Fix YouTube player",
        description = "Fixes the built-in YouTube player, which showed a black screen and error code 0.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))

        apply {
            // The one origin is the player's `origin` var and the base URL, and so the Referer, of its page.
            val builder = optionsBuilderMethod()
            val options = builder.definingClass.substringBefore('$') + ";"
            val getter = originGetterMethod(options)
            loadPlayerMethod("${getter.definingClass}->${getter.name}")
            val toOrigin = builder.rewriteStrings { if (it == APP_ORIGIN) ORIGIN else null }
            if (toOrigin.count != 1) throw PatchException("Expected one origin in ${builder.definingClass}, found ${toOrigin.count}")
            toOrigin.apply()
        }
    }
