package io.github.bakwudo.uyu.patches.twitch.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PlaybackAccessTokenParams: the parameters of the access token request for live streams and
 * VODs. The token includes the player type, which decides which ads the stream gets.
 */
internal object PlaybackAccessTokenParamsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("PlaybackAccessTokenParams("),
)

// Player events. Both players (Amazon IVS and ExoPlayer) read the stream's #EXT-X-DATERANGE
// metadata and send these events.

/** An ad stitched into the stream starts (CLASS="twitch-stitched-ad"). */
internal object StitchedAdStartedToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("OnSurestreamAdStarted(adMetadata="),
)

/** A quarter of a stitched ad has played (CLASS="twitch-ad-quartile"). */
internal object StitchedAdQuartileToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("OnSurestreamAdQuartile("),
)

/** The stream plays the live broadcast again (X-TV-TWITCH-STREAM-SOURCE="live"). */
internal object LiveContentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("OnSurestreamAdEnded"),
)

/** The stream asks the app to request an ad itself (CLASS="twitch-maf-ad"). */
internal object ClientAdRequestedToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("OnMultiformatAdRequested("),
)

/** The stream prepares a picture by picture ad ("pbyp-preflight"). */
internal object PictureByPictureAdToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("OnPbypPreflightMessage("),
)

/** The metadata of a stitched ad: its duration, the ad break's duration, and more. */
internal object StitchedAdMetadataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SureStreamAdMetadata(duration="),
)

/**
 * setMuted of the player presenter, which mutes and unmutes the player. The presenter is found
 * by the Kotlin property metadata of its player state subscription.
 */
internal object PlayerPresenterSetMutedFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("getPlayerStateAndEventDisposable()"),
    ),
    name = "setMuted",
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * Constructor of the presenter that requests the ads the app plays itself (prerolls, midrolls,
 * VOD midrolls). Twitch passes false for its boolean "shouldShowAds" where it never shows ads,
 * and the presenter then drops every ad request.
 */
internal object ClientAdRequestPresenterConstructorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("ad request already active"),
    ),
    name = "<init>",
    custom = { method, _ -> method.parameterTypes.count { it.toString() == "Z" } == 1 },
)

/** The event sent when the ad eligibility check is done. */
internal object EligibilityCheckCompletedToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("EligibilityCheckCompleted(shouldRequestAd="),
)

/**
 * Receives the result of the ad eligibility check (a Boolean "should request ad") and requests
 * the ad if it is true.
 */
internal fun adEligibilityResultFingerprint(eventType: String) = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "booleanValue"),
        newInstance(eventType),
    ),
)

/**
 * The picture by picture ad presenter's check whether the feature is on. The presenter is found
 * by the Kotlin method signature of its state reducer.
 */
internal object PictureByPictureEnabledFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("processStateChange(Ltv/twitch/android/feature/pbyp/PbypPresenter\$State;"),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/**
 * The parser of display ad responses (banners next to the player, ads in lists). It returns a
 * sealed result, one of which is the "no ad" singleton.
 */
internal object DisplayAdParserFingerprint : Fingerprint(
    returnType = "L",
    strings = listOf("failed to parse display ad response: "),
)

/** State of the display ad at the top of browse pages, "isTurbo" hides it. */
internal object BrowseDisplayAdStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("State(isTurbo="),
)

/** Creates the player of video ads in the React Native home feed. The names are not obfuscated. */
internal object FeedVideoAdPlayerFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/feature/discovery/feed/rn/runtime/TwitchRNVideoAdProvider;",
    name = "makePlayer",
)

/**
 * React Native's network requests. The home feed's JavaScript requests its ads itself. The names
 * are not obfuscated.
 */
internal object ReactNativeSendRequestFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/NetworkingModule;",
    name = "sendRequestInternalReal",
    custom = { method, _ -> method.parameterTypes.getOrNull(1)?.toString() == "Ljava/lang/String;" },
)

/** Builds the URL of a live stream's playlist on usher.ttvnw.net from the access token. */
internal object StreamPlaylistUriFingerprint : Fingerprint(
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Ljava/lang/String;", "Ltv/twitch/android/models/AccessTokenResponse;", "L", "Z"),
    strings = listOf("api/channel/hls/"),
)
