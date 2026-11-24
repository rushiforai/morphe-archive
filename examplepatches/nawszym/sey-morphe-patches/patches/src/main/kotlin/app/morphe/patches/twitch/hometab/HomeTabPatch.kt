package app.morphe.patches.twitch.hometab

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/hometab/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object HomeTabWebViewClientInitFingerprint : Fingerprint(
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
private object HomeTabOnPageStartedFingerprint : Fingerprint(
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
private object HomeTabOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * DEFAULT HOME TAB tweak: re-routes Twitch TV to the tab chosen in SEYTTINGS
 * on every launch.
 *
 * <p>Twitch TV is a WebView app and opens the remote Next.js UI on the same
 * tab every launch. The injected {@code twitch-hometab.js} looks for a nav
 * link matching the chosen route (Home, Following, Browse or Search) and
 * clicks it, falling back to rewriting the location. The helper re-applies
 * after client-side navigation and React re-renders.</p>
 *
 * <p>One switch in SEYTTINGS controls the feature. Requires the SEYTTINGS patch.</p>
 */
@Suppress("unused")
val homeTabPatch = patch(
    name = "DEFAULT HOME TAB",
    description = "Twitch TV opens the chosen tab (Home, Following, Browse or " +
        "Search) automatically on every launch instead of the stock start " +
        "tab. Toggle it in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchHomeTab.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        HomeTabWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}HomeTabInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // Install the tab helper as early as the WebView client allows.
        HomeTabOnPageStartedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}HomeTabInjector;->inject(Landroid/webkit/WebView;)V",
        )

        HomeTabOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}HomeTabInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
