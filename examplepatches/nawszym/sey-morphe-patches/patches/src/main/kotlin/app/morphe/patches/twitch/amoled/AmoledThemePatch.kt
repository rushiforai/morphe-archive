package app.morphe.patches.twitch.amoled

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.twitch.TWITCH_TV
import app.morphe.patches.twitch.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/twitch/amoled/"

/** Same WebView client constructor used by the base SEYTTINGS patch. */
private object AmoledWebViewClientInitFingerprint : Fingerprint(
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
private object AmoledOnPageStartedFingerprint : Fingerprint(
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
private object AmoledOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Ls4/k;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

/**
 * AMOLED tweak: pure black chat panel and player bars.
 *
 * <p>Twitch TV paints its page (and the letterbox bars above and below the
 * video) with #0e0e10 and the chat panel with #18181b. The injected style
 * sheet turns those surfaces #000 and repaints the chat edge gradients, which
 * the app computes at runtime.</p>
 *
 * <p>One switch in SEYTTINGS controls the theme.</p>
 */
@Suppress("unused")
val amoledThemePatch = patch(
    name = "AMOLED",
    description = "Pure black theme for the Twitch TV chat and the bars above " +
        "and below the video. Replaces the dark greys with #000000. One toggle " +
        "in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(TWITCH_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/TwitchAmoled.mpe")

    execute {
        // Register the bridge before the first page load. The first constructor
        // parameter is a long, so the WebView lives in p3.
        AmoledWebViewClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static {p3}, ${EXTENSION_CLASS}AmoledInjector;->attach(Landroid/webkit/WebView;)V",
        )

        // Install the theme as early as the WebView client allows.
        AmoledOnPageStartedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}AmoledInjector;->inject(Landroid/webkit/WebView;)V",
        )

        AmoledOnPageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}AmoledInjector;->inject(Landroid/webkit/WebView;)V",
        )
    }
}
