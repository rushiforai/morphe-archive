package semicoloncolonel.mobilestream.patches.paramount.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Paramount+ 17.3.0. Avia's AviaAdaptiveTrackSelection.canSelectFormat decides
// whether a rendition fits the measured bandwidth, so a slow estimate drops the
// player to a lower rendition. canSelectFormat now answers only with
// shouldInclude, Avia's own check of the device and server caps: UHD only on
// UHD-capable devices, no HEVC when it is disabled, and the max size, bitrate,
// and frame rate in the player config. Bandwidth is ignored; the caps are not.
// Avia's decoder-error fallbacks lower those caps, so they keep working.

private const val AVIA_TRACK =
    "Lcom/paramount/android/avia/player/player/core/network/AviaAdaptiveTrackSelection;"

internal object ShouldIncludeFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type == AVIA_TRACK && method.name == "shouldInclude" && method.parameterTypes.size == 1
    }
)

internal object CanSelectFormatFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type == AVIA_TRACK && method.name == "canSelectFormat"
    }
)

@Suppress("unused")
val highestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Plays the highest quality your device and plan allow, instead of lowering it to match " +
        "the measured connection speed. Turn it off if videos buffer.",
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val format = ShouldIncludeFingerprint.method.parameterTypes.single()
        CanSelectFormatFingerprint.method.returnEarly(
            """
                invoke-direct/range { p0 .. p1 }, $AVIA_TRACK->shouldInclude($format)Z
                move-result p1
                return p1
            """,
        )
    }
}
