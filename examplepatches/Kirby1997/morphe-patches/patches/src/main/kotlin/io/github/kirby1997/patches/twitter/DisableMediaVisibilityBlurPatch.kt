package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// X 12.7.1 attaches a MediaVisibilityResults object (com.twitter.model.mediavisibility.g,
// stored on the tweet as com.twitter.model.core.e.B) to any post whose media is covered.
// It carries a MediaInterstitial (g.a) and/or a BlurredImageInterstitial (g.b); the latter
// names the prompt variant in its field e, where c.AgeVerificationPrompt is the
// age-restricted "verify your age" cover and the other values are the ordinary
// sensitive-media cover.
//
// Two earlier attempts patched predicates, and both failed the same way - the cover
// disappeared but the media went with it:
//
//   com.twitter.model.mediavisibility.d.a(g)      also backs e.J0(), which a dozen
//                                                 unrelated call sites consult
//   com.twitter.tweetview.core.l.a(a0, i, a0)     only hides the interstitial View;
//                                                 the media stays hidden underneath
//
// The reason is com.twitter.tweetview.core.o.a(e, Z, a0$a), which decides whether the
// content host renders the media at all. It does not go through either predicate - it
// reads e.B and g.b directly. So does QuoteView.k. Blinding the predicates leaves those
// reads intact, and the media host keeps the media hidden while the cover that used to
// stand in for it is gone.
//
// Kill it at the model layer instead, which is where Piko's "Show sensitive media"
// operates too (it rewrites JsonSensitiveMediaWarning at parse time). LoganSquare builds
// the model in JsonMediaVisibilityResults.r():
//
//   new g(this.a, this.b)
//
// Returning null there means no tweet ever carries media-visibility results. e.B stays
// null, which is the normal state for unrestricted posts, so every consumer - o.a,
// e.J0(), l.a, QuoteView.k, the interstitial binder - takes its ordinary path and the
// media renders directly.
//
// The media itself is delivered either way: the interstitial binder loads the same media
// entity into SensitiveMediaBlurPreviewInterstitialView.t(...) to draw its blurred
// preview, so nothing is being withheld server-side that this reveals.
object JsonMediaVisibilityResultsToModelFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    definingClass = "Lcom/twitter/model/json/mediavisibility/JsonMediaVisibilityResults;",
    name = "r",
)

@Suppress("unused")
val disableMediaVisibilityBlurPatch = bytecodePatch(
    name = "Show age-restricted and sensitive media",
    description = "Drops the media-visibility results X attaches to covered posts, so neither the " +
        "age-restricted \"verify your age\" cover nor the ordinary sensitive-media cover is ever built " +
        "and the media renders directly. Complements Piko's \"Show sensitive media\", which handles the " +
        "older sensitive-media warning but not the age-verification variant.",
) {
    compatibleWith(Constants.TWITTER_12_7_1)

    execute {
        // .registers 4 with no parameters, so v0 is a local - safe to write.
        JsonMediaVisibilityResultsToModelFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
