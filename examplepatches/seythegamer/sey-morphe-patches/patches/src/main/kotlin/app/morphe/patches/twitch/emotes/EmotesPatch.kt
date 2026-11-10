package app.morphe.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/emotes/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object EmoteWebViewClientInitFingerprint : Fingerprint(
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

/** Every page load is announced here, including the first app-shell load. */
private object EmoteOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * EMOTES tweak: renders 7TV, BTTV and FFZ emotes in the Twitch TV chat.
 *
 * Twitch TV draws its whole UI in a WebView, so the extension injects a small
 * JavaScript renderer instead of hooking a native chat model. The renderer
 * resolves the current channel from the page URL, downloads the matching 7TV
 * and BTTV channel sets plus the FFZ room set, adds the three global sets and
 * replaces emote words in chat messages with CDN images.
 *
 * One switch in SEYTTINGS controls all three providers.
 */
@Suppress("unused")
val emotesPatch = patch(
    name = "EMOTES",
    description = "Shows 7TV, BTTV and FFZ emotes in the Twitch TV chat. " +
        "One toggle in SEYTTINGS enables or disables all providers. " +
        "Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchEmotes.mpe")

    execute {
        // Register the emote bridge before the first page load. The first
        // constructor parameter is a long, so the WebView lives in p3.
        EmoteWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}EmoteInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // (Re)install the renderer after every navigation inside the web app.
        EmoteOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}EmoteInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
