package app.morphe.patches.twitch.expandchat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/expandchat/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object ExpandChatWebViewClientInitFingerprint : Fingerprint(
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
private object ExpandChatOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * EXPAND CHAT tweak: hides the "Join the conversation" footer and lets the
 * message list use the full chat panel height.
 *
 * Twitch TV draws the chat in its remote web UI, so the extension injects a
 * small DOM helper instead of patching native chat views. The helper looks for
 * the full-width footer button at the end of the chat column (without matching
 * its localized text), hides the footer and re-applies after React re-renders
 * or navigation.
 *
 * One switch in SEYTTINGS controls the feature.
 */
@Suppress("unused")
val expandChatPatch = patch(
    name = "EXPAND CHAT",
    description = "Hides the \"Join the conversation\" footer button and lets " +
        "the chat fill the full panel height. One toggle in SEYTTINGS. " +
        "Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchExpandChat.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        ExpandChatWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}ExpandChatInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // (Re)install the footer helper after every navigation inside the web app.
        ExpandChatOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}ExpandChatInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
