package app.morphe.patches.twitch.adblock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/adblock/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object AdBlockWebViewClientInitFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "<init>",
    parameters = listOf(
        "J",
        "Landroid/webkit/WebView;",
        "Ls4/d;",
        "Lio/sentry/android/replay/capture/h;",
    ),
    returnType = "V",
)

/**
 * The page start callback runs before the remote Next.js bundle, so the HLS
 * loader hooks are in place before the first stream is created.
 */
private object AdBlockOnPageStartedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageStarted",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Ljava/lang/String;",
        "Landroid/graphics/Bitmap;",
    ),
    returnType = "V",
)

/** Fallback for WebView builds where the early evaluation is dropped. */
private object AdBlockOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * AD BLOCK tweak: removes Twitch ads from live streams.
 *
 * <p>Twitch TV plays streams with hls.js in the WebView, so the ads are
 * stitched into the HLS media playlists. The injected helper filters those
 * segments out and, while a break is running, splices in the same broadcast
 * requested with an ad-free player type. Without a clean stream it holds the
 * last live frame instead of playing the ad.</p>
 *
 * <p>The helper is adapted from CeladonTV's Starshot adapter (MIT) and the
 * TwitchAdSolutions project. One switch in SEYTTINGS controls the filter.</p>
 */
@Suppress("unused")
val adBlockPatch = patch(
    name = "AD BLOCK",
    description = "Skips Twitch ads by filtering stitched ad segments from the HLS " +
        "stream and switching to the same broadcast from an ad-free player type. " +
        "One toggle in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchAdBlock.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        AdBlockWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}AdBlockInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // Install the loader hooks as early as the WebView client allows.
        AdBlockOnPageStartedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}AdBlockInjector;->inject(Landroid/webkit/WebView;)V",
        )

        AdBlockOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}AdBlockInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
