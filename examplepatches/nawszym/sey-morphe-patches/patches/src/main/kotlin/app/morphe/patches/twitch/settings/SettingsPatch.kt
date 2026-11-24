package app.morphe.patches.twitch.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/base/"

/**
 * Twitch TV is a WebView app. The settings screen is the remote
 * Next.js app-shell page, so the extension has to patch the page from
 * JavaScript. [s4.k.onPageFinished] is the single place where every loaded
 * page is announced to the WebView client.
 */
private object OnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * The WebView client constructor runs before the WebView loads its first
 * page. JavaScript interfaces must be registered before that load, otherwise
 * the already loaded document cannot see them.
 */
private object WebViewClientInitFingerprint : Fingerprint(
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
 * Base patch: loads the SEYTTINGS JavaScript bridge and its red themed
 * native dialog into Twitch TV.
 *
 * The injected script turns the "Cookies and Advertising Choices" row of the
 * web settings screen into a SEYTTINGS row that opens the native dialog. This
 * is the base patch required by every Twitch TV tweak.
 */
@Suppress("unused")
val settingsPatch = patch(
    name = "SEYTTINGS",
    description = "Adds the red themed SEYTTINGS menu to Twitch TV. " +
        "The Settings row opens a native patched-tweaks dialog. " +
        "This is the base patch required by every Twitch TV tweak.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    extendWith("extensions/TwitchSeyttings.mpe")

    execute {
        // Register the native bridge before the first page load. The first
        // constructor parameter is a long, so the WebView lives in p3.
        WebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}SeyttingsInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // Patch the settings page after every load (including the first one).
        OnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}SeyttingsInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
