package app.template.patches.digisport.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode

// A sponsored article carries a non-blank ApiArticle sponsored text (a nullable String, read
// null-safely here; listing titles show it as a label). Only the listing and widget cards are
// removed; the article header code that also reads it is untouched. Since 1.1.16 both parsers are
// cases of R8-merged lambdas, so each check first makes sure it runs in its own case. Kotlin's
// isBlank is renamed too, so blank is String.trim().isEmpty().
@Suppress("unused")
val hideSponsoredArticlesPatch = bytecodePatch(
    name = "Hide sponsored articles",
    description = "Hides sponsored articles.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        val sponsored = apiArticleSponsoredFingerprint.method.let { "${it.definingClass}->${it.name}()Ljava/lang/String;" }

        // 1. Listings (parseListingArticles): a sponsored article is skipped before its card
        // (queued from this case), the ad widget and its separator lines are added. The case
        // returns Unit, the same singleton the lambda returns at its end.
        val listing = listingArticleLambdaFingerprint.method
        val (listingSelector, listingCase) = listing.caseOf(listingArticleLambdaFingerprint.instructionMatches[0].index)
        val article = listingArticleLambdaFingerprint.classDef.fields.singleOrNull { it.type == API_ARTICLE }
            ?: throw PatchException("Hide sponsored articles: the listing lambda has no single ApiArticle capture")
        val switch = listing.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH
        }
        val unit = listing.singletonBefore(switch)
        listing.addInstructionsWithLabelsChecked(
            0,
            casePrologue(listing, listingSelector, listingCase, "not_sponsored") + """
                iget-object v1, v0, ${article.definingClass}->${article.name}:$API_ARTICLE
                invoke-virtual {v1}, $sponsored
                move-result-object v1
            """ + blankCheck("not_sponsored") + """
                sget-object v1, ${unit.definingClass}->${unit.name}:${unit.type}
                return-object v1
                :not_sponsored
                nop
            """,
        )

        // 2. Article widgets (addArticleWidget): a sponsored card becomes a plain spacing section,
        // added to the list like the card would be (the case returns the add result). "Hide
        // promotions" adds its own self-contained check at the same index; either order works,
        // because each check only returns or falls through.
        addWidgetSpacingGuard(
            articleWidgetLambdaFingerprint.method,
            spacingSectionFingerprint.method,
            "not_sponsored",
        ) { capture ->
            """
                iget-object v1, v0, ${capture(API_ARTICLE)}
                check-cast v1, $API_ARTICLE
                invoke-virtual {v1}, $sponsored
                move-result-object v1
            """ + blankCheck("not_sponsored")
        }
    }
}
