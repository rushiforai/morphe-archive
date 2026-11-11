package app.morphe.patches.twitch.maturewarning

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/maturewarning/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object MatureWarningWebViewClientInitFingerprint : Fingerprint(
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
private object MatureWarningOnPageStartedFingerprint : Fingerprint(
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
private object MatureWarningOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * SKIP 18+ WARNING tweak: auto-accepts the mature content warning.
 *
 * <p>Twitch TV occasionally gates a stream behind an "18+ / mature content"
 * confirmation overlay rendered by the remote web bundle. The injected helper
 * finds the confirmation button inside that overlay and clicks it once, so the
 * stream starts without the extra click.</p>
 *
 * <p>One switch in SEYTTINGS controls the helper.</p>
 */
@Suppress("unused")
val matureWarningPatch = patch(
    name = "SKIP 18+ WARNING",
    description = "Automatically accepts the 18+ mature content warning on " +
        "Twitch TV, so a mature stream starts without the extra click. One " +
        "toggle in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchMatureWarning.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        MatureWarningWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}MatureWarningInjector;->attach(Landroid/webkit/WebView;)V",
        )

        MatureWarningOnPageStartedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}MatureWarningInjector;->inject(Landroid/webkit/WebView;)V",
        )

        MatureWarningOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}MatureWarningInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
