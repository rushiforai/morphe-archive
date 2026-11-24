package app.morphe.patches.twitch.hidepinned

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/hidepinned/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object HidePinnedWebViewClientInitFingerprint : Fingerprint(
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

/** Runs before the remote bundle paints its first frame. */
private object HidePinnedOnPageStartedFingerprint : Fingerprint(
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
private object HidePinnedOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * HIDE PINNED tweak: removes pinned chat messages from the Twitch TV chat.
 *
 * <p>Twitch renders a pinned message as a card above the message list. The
 * injected helper hides the native {@code pinned-chat} card together with its
 * "Pinned by" attribution, pin badge and any pinned highlight in the message
 * list.</p>
 *
 * <p>One switch in SEYTTINGS controls the helper.</p>
 */
@Suppress("unused")
val hidePinnedChatPatch = patch(
    name = "HIDE PINNED",
    description = "Hides pinned chat messages on Twitch TV: the pinned card, " +
        "its \"Pinned by\" label, the pin badge and any pinned highlight in " +
        "the message list. One toggle in SEYTTINGS. Requires the SEYTTINGS " +
        "patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchHidePinned.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        HidePinnedWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}PinnedChatInjector;->attach(Landroid/webkit/WebView;)V",
        )

        HidePinnedOnPageStartedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}PinnedChatInjector;->inject(Landroid/webkit/WebView;)V",
        )

        HidePinnedOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}PinnedChatInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
