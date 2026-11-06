package semicoloncolonel.mobilestream.patches.yttv.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Mask live ad breaks.
//
// On a live channel, YouTube TV fills part of each break with its own ads
// (DAI). The native player core announces each of those slots to Java with
// CuePointDataProviderWrapper.NativeCallback.onCuepointList: a protobuf list
// of cue points with the slot's duration and its offset from the slot's
// start, about 16 seconds before it begins, with the slot's start on the
// broadcast clock. The live time bar (UnpluggedTimeBarModel) is told the UTC
// time of the frame on screen on each update, so YttvLiveMask covers and
// mutes the slot exactly while it is on screen, through rewinds and DVR.
//
// Skip ads turns DAI off, and with DAI off the network's own feed plays in
// that slot with no cue point to cover it. So this patch also tells
// YttvDaiDisabler to leave DAI on for live streams. On-demand videos and
// recordings keep DAI off, so their ads stay skipped.
//
// The network's own commercials around YouTube's slot carry no cue points
// and are not covered.
// ─────────────────────────────────────────────────────────────────────────────

private const val MASK = "Lsemicoloncolonel/mobilestream/extension/yttv/ads/YttvLiveMask;"
private const val DISABLER = "Lsemicoloncolonel/mobilestream/extension/yttv/ads/YttvDaiDisabler;"

internal object OnCuepointListFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/libraries/youtube/media/interfaces/CuePointDataProviderWrapper\$NativeCallback;",
    name = "onCuepointList",
    parameters = listOf("[B"),
    returnType = "V",
)

// UnpluggedTimeBarModel's update: (?, currentUtcTime, ?, ?, ?). Found by its
// own log message, which names the second argument.
internal object TimeBarUpdateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J", "J", "J", "J", "J"),
    strings = listOf("Stream's current UTC position is zero or negative! [currentUtcTime] = [%d]"),
)

internal object KeepLiveDaiFingerprint : Fingerprint(
    definingClass = DISABLER,
    name = "keepLiveDai",
    returnType = "Z",
)

@Suppress("unused")
val maskLiveAdBreaksPatch = bytecodePatch(
    name = "Mask live ad breaks",
    description = "Covers and mutes the ads YouTube TV inserts into live breaks, but not the commercials built into the broadcast.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(cuePointProviderHookPatch, streamTypePatch)

    extendWith("extensions/extension.mpe")

    execute {
        OnCuepointListFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $MASK->cuepoints([B)V",
        )
        TimeBarUpdateFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p3 .. p4 }, $MASK->position(J)V",
        )
        KeepLiveDaiFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
