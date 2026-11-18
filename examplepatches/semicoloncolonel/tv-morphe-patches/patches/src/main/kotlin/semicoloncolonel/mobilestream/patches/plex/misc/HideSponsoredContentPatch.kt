package semicoloncolonel.mobilestream.patches.plex.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.plex.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Plex 2026.22.0 — Hide sponsored content.
//
// Plex shows paid placements in two ways, and both are removed:
//
//   1. Sponsored tiles and hero cards on the home screen and in rows. Plex's
//      screens are server-driven, and a sponsored tile is an ordinary
//      component whose artwork and links come from Plex's ad server
//      (SpringServe). Plex's JavaScript fetches through Nitro Fetch, and every
//      response is built on the Java side by the NitroResponse constructor,
//      which is handed the body as a string or as bytes. PlexSponsoredFilter
//      removes those components (and items flagged with a sponsored AdTile)
//      before the app reads the response.
//   2. Promoted "Watch Now on <service>" cards with a sponsored label, drawn by
//      LumaPromotedAvailabilityCard / LumaTVPromotedAvailabilityCard in the
//      Hermes bundle, which are made to render nothing.
//
// Not touched: the "Watch on ..." button on a title's details screen, which
// lists where that title is available.
// ─────────────────────────────────────────────────────────────────────────────

private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/plex/PlexSponsoredFilter;"

internal object NitroResponseInitFingerprint : Fingerprint(
    definingClass = "Lcom/margelo/nitro/nitrofetch/NitroResponse;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;", "D", "Ljava/lang/String;", "Z", "Z",
        "[Lcom/margelo/nitro/nitrofetch/NitroHeader;", "Ljava/lang/String;",
        "Lcom/margelo/nitro/core/ArrayBuffer;",
    ),
)

private val hideSponsoredCardsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("LumaPromotedAvailabilityCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("LumaTVPromotedAvailabilityCard", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Removes sponsored titles and promotion cards from the home screen and rows.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideSponsoredCardsInBundlePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // p1 url, p2-p3 status (double), p4 statusText, p5 ok, p6 redirected,
        // p7 headers, p8 bodyString, p9 bodyBytes. Plex reads its hubs as bytes.
        NitroResponseInitFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p8 .. p8 }, $FILTER->filterBody(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p8
                invoke-static/range { p9 .. p9 }, $FILTER->filterBytes(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p9
                check-cast p9, Lcom/margelo/nitro/core/ArrayBuffer;
            """.trimIndent(),
        )
    }
}
