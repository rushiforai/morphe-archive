package semicoloncolonel.mobilestream.patches.nbcnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// NBC News 15.0.1.
//
// - Short videos (inline, picture-in-picture, and vertical video) get a
//   FreeWheel pre-roll from FreewheelAdView.begin, which already skips the
//   ad and starts the video for subscribers. Every viewer now takes that path.
// - Long-form videos and clips in the StreamSentry player get their ads from
//   the advertising strategy CoreVideoPlayer picks. The app already answers
//   "None" for ad-free content and remote overrides; it now does so for
//   everything except the live stream, whose ads are part of the broadcast.
// - Display ads on the fronts are added by createDisplayAdModule; without it
//   no ad module is added, so no empty slot is left. This is the app's own
//   path when a front has no ad config.

internal object ShortVideoAdFingerprint : Fingerprint(
    definingClass = "Lcom/nbc/views/FreewheelAdView;",
    name = "begin",
    returnType = "V",
)

internal object AdvertisingStrategyFingerprint : Fingerprint(
    definingClass = "Lcom/newsgroup/streamsentrycore/player/CoreVideoPlayer;",
    name = "getAdvertisingStrategyOverride",
)

internal object DisplayAdModuleFingerprint : Fingerprint(
    definingClass = "Lcom/nbc/fragments/BaseFrontFragment;",
    name = "createDisplayAdModule",
    returnType = "V",
)

private const val VIDEO_TYPE = "Lcom/newsgroup/streamsentrycore/shared/StreamSentryShared\$videoType;"
private const val STRATEGY = "Lcom/sky/core/player/addon/common/ads/AdvertisingStrategy;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads before and during videos and the display ads on the home and section " +
        "pages, with no empty space left behind. Ads in the live stream are part of the broadcast and still play.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ShortVideoAdFingerprint.method.apply {
            // The last parameter is the callback that starts the video.
            val start = "p${parameterTypes.size}"
            returnEarly(
                """
                    invoke-interface/range { $start .. $start }, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
                    return-void
                """,
            )
        }
        AdvertisingStrategyFingerprint.method.returnEarly(
            """
                sget-object v0, $VIDEO_TYPE->LINEAR:$VIDEO_TYPE
                if-eq p1, v0, :live
                sget-object v0, $STRATEGY->None:$STRATEGY
                return-object v0
                :live
                nop
            """,
        )
        DisplayAdModuleFingerprint.method.returnEarly("return-void")
    }
}
