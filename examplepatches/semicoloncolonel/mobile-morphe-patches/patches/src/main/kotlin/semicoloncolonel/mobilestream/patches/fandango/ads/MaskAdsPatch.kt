package semicoloncolonel.mobilestream.patches.fandango.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants

// Fandango at Home plays its free titles with client-side ads, and the
// server only streams the title after its ads have played, so the ads cannot
// be removed. Instead, the ads play as usual behind a black cover with the
// sound off.
//
// PlaybackData, the player's link to Fandango's streaming service, starts a
// session for each ad and one for the title. The cover goes up when an ad
// session starts and comes down shortly after an ad session stops, unless the
// next ad starts first, or when the title's session starts. PlayerActivity
// hands itself to AdMask so the cover can be added to its window.

private const val PLAYBACK_DATA = "Lcom/vudu/axiom/domain/model/PlaybackData;"
private const val PLAYER_ACTIVITY = "Lcom/vudu/android/app/ui/player/PlayerActivity;"
private const val AD_MASK = "Lsemicoloncolonel/mobilestream/extension/fandango/ads/AdMask;"

internal object StartAdvertSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_DATA,
    name = "startAdvertStreamingSession",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object StopAdvertSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_DATA,
    name = "stopAdvertStreamingSession",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object StartContentSessionFingerprint : Fingerprint(
    definingClass = PLAYBACK_DATA,
    name = "startContentStreamingSession",
    parameters = listOf("Ljava/lang/String;"),
)

internal object PlayerCreateFingerprint : Fingerprint(
    definingClass = PLAYER_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object PlayerStopFingerprint : Fingerprint(
    definingClass = PLAYER_ACTIVITY,
    name = "onStop",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val maskAdsPatch = bytecodePatch(
    name = "Mask ads",
    description = "Covers the ads in free titles with a \"We'll be right back!\" screen and mutes them.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        StartAdvertSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onAdvertStart()V")
        StopAdvertSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onAdvertStop()V")
        StartContentSessionFingerprint.method.addInstruction(0, "invoke-static { }, $AD_MASK->onContentStart()V")
        // /range: p0 can be above v15 in these methods.
        PlayerCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $AD_MASK->attach(Landroid/app/Activity;)V",
        )
        PlayerStopFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $AD_MASK->detach(Landroid/app/Activity;)V",
        )
    }
}
