package app.template.patches.sofascore.misc.video

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags

internal val TURN_OFF_VIDEO_AUTOPLAY = HevalFeature(
    id = "sofascore.turn_off_video_autoplay",
    name = "Turn off video autoplay",
    description = "Highlight videos wait for a tap instead of playing on their own.",
    category = SofascoreControlsCategory.DISPLAY,
    default = false,
)

/**
 * The embedded YouTube player's "load or cue" helper (vmp.c in 26.10.26): a static
 * (player, autoPlay: Boolean, videoId: String, startSeconds: Float)V that calls the player's
 * "loadVideo" when autoPlay is true and "cueVideo" otherwise. The string pair and the
 * (?, Z, String, F)V shape pick it out of the two methods that mention "cueVideo" (the other one
 * is the player's own command runnable).
 */
internal object LoadOrCueVideoFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        string("loadVideo", StringComparisonType.EQUALS),
        string("cueVideo", StringComparisonType.EQUALS),
    ),
    custom = { method, _ ->
        val params = method.parameterTypes.map(CharSequence::toString)
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            params.size == 4 && params[1] == "Z" && params[2] == "Ljava/lang/String;" && params[3] == "F"
    },
)

// A Heval Controls feature, off by default: highlight videos keep autoplaying until the user turns
// the switch on.
@Suppress("unused")
val turnOffVideoAutoplayPatch = sofascoreControls.featurePatch(
    TURN_OFF_VIDEO_AUTOPLAY,
    default = false,
) {
    val loadOrCue = LoadOrCueVideoFingerprint.method
    // The method has no local register (4 registers, all parameters), so the gate cannot use a
    // scratch register: the autoPlay argument (the second parameter, p1) goes through a new
    // static (Z)Z helper on the same class that answers false while the switch is on, so the
    // helper cues the video instead of loading it. Off, it returns its argument unchanged.
    val autoPlay = loadOrCue.implementation!!.registerCount - 4 + 1
    val helper = mutableClassDefBy(loadOrCue.definingClass).addHevalValueHelper(
        TURN_OFF_VIDEO_AUTOPLAY.id, "morpheVideoAutoplay", "Z",
    ) { v -> "const/4 $v, 0x0\nreturn $v" }
    loadOrCue.filterThroughHevalHelper(0, autoPlay, helper)
}
