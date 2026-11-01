package semicoloncolonel.mobilestream.patches.foxnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

private const val AD_VIEW = "Lcom/foxnews/adKit/FoxNewsAdView;"
private const val LISTENER = "Lcom/foxnews/adKit/FoxAdEventListener;"
private const val GAM_ERROR = "Lcom/foxnews/adKit/gam/GamErrorWrapper;"

// Fox News 5.49.2 keeps its ad code's names. Every display ad (GAM, Prebid,
// Amazon, Taboola, and their mediation partners) is loaded through
// FoxNewsAdView.setAdType. Its callers already handle a failed load: the
// adhesion bar hides itself, the welcome ad dismisses, and feed slots
// collapse.
internal object SetAdTypeFingerprint : Fingerprint(
    definingClass = AD_VIEW,
    name = "setAdType",
    parameters = listOf("Lcom/foxnews/adKit/AdType;"),
    returnType = "V",
)

internal object ShouldShowInterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/core/ads/InterstitialDelegate;",
    name = "shouldShowInterstitialAd",
    returnType = "Z",
)

// Video ads are inserted server-side by Google IMA DAI. When this returns
// false, the player builds its fallback MediaItem from the plain stream URL.
internal object ShouldLoadImaStreamFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/foxplayer/service/MediaPreparer;",
    name = "shouldLoadImaStream",
    returnType = "Z",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the banner, feed, sponsored, and full-screen ads in the Fox News " +
        "phone app, and plays videos without inserted ad breaks. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Collapse the slot the same way the app collapses a Taboola unit
        // that fails to render, then report a no-fill (GAM code 3) so the
        // caller takes its own failed-ad path.
        //
        // setAdType(null) is how callers clear a slot, and the feed's
        // failure handler does exactly that. Null calls run the original
        // code; intercepting them too made the failure handler call back
        // into this patch forever (StackOverflowError on 5.49.2).
        val setAdType = SetAdTypeFingerprint.method
        setAdType.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :original
                invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
                move-result-object v0
                if-eqz v0, :no_params
                const/4 v1, 0x0
                iput v1, v0, Landroid/view/ViewGroup${'$'}LayoutParams;->height:I
                invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup${'$'}LayoutParams;)V
                :no_params
                iget-object v0, p0, $AD_VIEW->foxAdListener:$LISTENER
                if-eqz v0, :done
                const/4 v1, 0x3
                invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v1
                const-string v2, "ads_blocked"
                const/4 v3, 0x0
                new-instance v4, $GAM_ERROR
                invoke-direct {v4, v1, v2, v3}, $GAM_ERROR-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
                invoke-interface {v0, v4}, $LISTENER->onAdFailedToLoad($GAM_ERROR)V
                :done
                return-void
            """,
            ExternalLabel("original", setAdType.getInstruction(0)),
        )

        listOf(ShouldShowInterstitialFingerprint, ShouldLoadImaStreamFingerprint).forEach {
            it.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}
