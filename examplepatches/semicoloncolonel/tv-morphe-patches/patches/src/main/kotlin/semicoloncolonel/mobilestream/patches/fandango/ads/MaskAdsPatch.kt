package semicoloncolonel.mobilestream.patches.fandango.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.TRANSLATE_OPTION_DESCRIPTION
import semicoloncolonel.mobilestream.patches.shared.misc.TRANSLATE_OPTION_TITLE
import semicoloncolonel.mobilestream.patches.shared.misc.enableAdBreakTranslation

// Fandango at Home plays its free titles with client-side ads, and the
// server only streams the title after its ads have played, so the ads cannot
// be removed. Instead, the ads play as usual behind a black cover with the
// sound off.
//
// The Android TV app 10.20.a016 has two players. The older PlayerActivity
// calls PlaybackPresenter directly, and the newer NVPlaybackActivity goes
// through PlaybackData, which calls the same presenter. The presenter starts a
// session on Fandango's server for each ad and one for the title, so the
// hooks sit there and cover both players. The cover goes up when an ad session
// starts and comes down shortly after an ad session stops, unless the next ad
// starts first, or when the title's session starts. Each player hands itself to
// AdMask so the cover can be added to its window.

private const val PLAYBACK_PRESENTER = "Lpixie/movies/pub/presenter/PlaybackPresenter;"
private const val AD_MASK = "Lsemicoloncolonel/mobilestream/extension/fandango/ads/AdMask;"

internal object StartAdvertSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_PRESENTER,
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("advertStreamingSessionStart"),
)

internal object StopAdvertSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_PRESENTER,
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("advertStreamingSessionStop"),
)

internal object StartContentSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_PRESENTER,
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("advertContentStreamingSessionStart"),
)

internal object PlayerCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vudu/android/app/activities/PlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object PlayerStopFingerprint : Fingerprint(
    definingClass = "Lcom/vudu/android/app/activities/PlayerActivity;",
    name = "onStop",
    returnType = "V",
    parameters = listOf(),
)

internal object NewPlayerCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vudu/android/app/uis/playback/NVPlaybackActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object NewPlayerDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/vudu/android/app/uis/playback/NVPlaybackActivity;",
    name = "onDestroy",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val maskAdsPatch = bytecodePatch(
    name = "Mask ads",
    description = "Covers the ads in free titles with a \"We'll be right back!\" screen and mutes them.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    extendWith("extensions/extension.mpe")

    val translate by booleanOption(
        key = "translate",
        default = false,
        title = TRANSLATE_OPTION_TITLE,
        description = TRANSLATE_OPTION_DESCRIPTION,
    )

    execute {
        if (translate == true) enableAdBreakTranslation()

        StartAdvertSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onAdvertStart()V")
        StopAdvertSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onAdvertStop()V")
        StartContentSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onContentStart()V")
        // /range: p0 can be above v15 in these methods.
        listOf(PlayerCreateFingerprint, NewPlayerCreateFingerprint).forEach {
            it.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $AD_MASK->attach(Landroid/app/Activity;)V")
        }
        listOf(PlayerStopFingerprint, NewPlayerDestroyFingerprint).forEach {
            it.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $AD_MASK->detach(Landroid/app/Activity;)V")
        }
    }
}
