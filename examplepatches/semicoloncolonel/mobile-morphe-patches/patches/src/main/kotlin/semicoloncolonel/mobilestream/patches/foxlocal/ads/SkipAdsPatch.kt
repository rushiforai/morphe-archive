package semicoloncolonel.mobilestream.patches.foxlocal.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.foxone.ads.FoxImaLiveStreamRequestFingerprint
import semicoloncolonel.mobilestream.patches.foxone.ads.FoxImaVodStreamRequestFingerprint
import semicoloncolonel.mobilestream.patches.foxone.ads.FoxPlayerClearVodAdsFingerprint
import semicoloncolonel.mobilestream.patches.foxone.ads.YospaceDispatchAdEventFingerprint
import semicoloncolonel.mobilestream.patches.foxone.ads.YospaceDispatchSlateEventFingerprint
import semicoloncolonel.mobilestream.patches.foxone.ads.YospaceSeekPolicyFingerprint
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// FOX LOCAL 7.22.0 uses the same Fox player SDK as Fox One, so the video
// hooks are the Fox One ones (ported from ajstrick81's Fox One patch). The two
// IMA listener lambdas are numbered differently in this build and are matched
// by their strings instead of their names.
//
// The app's own display ads have two hosts: the ad element in articles and
// live blogs, and the splash ad shown while the app starts. Neither is
// composed, so no empty slot is left. Taboola recommendations stay off.
//
// Ads stitched into the live station streams are part of the broadcast and
// still play.

private const val IMA_LISTENERS = "Lcom/fox/android/video/player/api/ima/listeners/FoxImaAdListeners;"

internal object ImaAdEventListenerFingerprint : Fingerprint(
    definingClass = IMA_LISTENERS,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf(
        "adEventListener -> FoxPlayer is null. Ensure that FoxPlayer has been set before attempting to access it",
    ),
)

internal object ImaAdsLoadedListenerFingerprint : Fingerprint(
    definingClass = IMA_LISTENERS,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("onAdsManagerLoaded"),
)

internal object ArticleAdFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/android/ui/common/article/ArticleAdElementKt;",
    name = "ArticleAdElement",
    returnType = "V",
)

internal object SplashAdDurationFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/android/ui/viewmodels/main/MainViewModel;",
    name = "getSplashAdDuration",
)

internal object TaboolaEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/android/utils/TaboolaProvider;",
    name = "shouldShowTaboola",
    returnType = "Z",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in videos, articles, and live blogs, and the splash ad.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ImaAdEventListenerFingerprint.method.returnEarly("return-void")
        ImaAdsLoadedListenerFingerprint.method.returnEarly("return-void")
        FoxPlayerClearVodAdsFingerprint.method.returnEarly("return-void")

        // Fail the DAI requests through their own callbacks; the app then
        // loads the plain stream.
        FoxImaVodStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface/range { p3 .. p3 }, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamUrlCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """,
        )
        FoxImaLiveStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface/range { p3 .. p3 }, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamIdCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """,
        )

        YospaceDispatchAdEventFingerprint.method.returnEarly("return-void")
        YospaceDispatchSlateEventFingerprint.method.returnEarly("return-void")
        YospaceSeekPolicyFingerprint.method.returnEarly("return-void")

        ArticleAdFingerprint.method.returnEarly("return-void")
        SplashAdDurationFingerprint.method.returnEarly(
            """
                const-wide/16 v0, 0x0
                invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v0
                return-object v0
            """,
        )
        TaboolaEnabledFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
