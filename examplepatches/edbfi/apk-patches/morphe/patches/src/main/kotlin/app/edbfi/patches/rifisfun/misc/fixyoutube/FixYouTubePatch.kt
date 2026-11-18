// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixyoutube

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.shared.rewriteStrings
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

// YouTube's embedded player wants the embedding app named in the Referer, `https://<app ID>`; a WebView page sets it
// with its base URL. The player page claimed to be www.youtube.com, which YouTube now refuses.
private const val ORIGIN = "https://$RIF_PACKAGE"

@Suppress("unused")
val fixYouTubePatch =
    patch(
        name = "Fix YouTube player",
        description = "Fixes the built-in YouTube player, which showed a black screen and error code 0.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)

        execute {
            // The one origin is the player's `origin` var and the base URL, and so the Referer, of its page.
            val builder = OptionsBuilderFingerprint.matchSingle().method
            val options = builder.definingClass.substringBefore('$') + ";"
            val getter = OriginGetterFingerprint(options).matchSingle().originalMethod
            LoadPlayerFingerprint("${getter.definingClass}->${getter.name}").matchSingle()
            builder.rewriteStrings { if (it == APP_ORIGIN) ORIGIN else null }.expect(1, "origin in ${builder.definingClass}").apply()
        }
    }
