package semicoloncolonel.mobilestream.patches.foxnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

// Fox News for Android TV 5.6.0 uses media3 with its names kept. Its
// AdaptiveTrackSelection picks the highest-bitrate rendition at or below one
// allowed bitrate, which comes from the measured bandwidth. That allowed
// bitrate (getAllocatedBandwidth) is now unlimited, so playback starts and
// stays at the highest rendition the stream offers. Renditions media3
// excluded after a load error are still skipped. The app has no capability
// checks of its own, and its streams top out at 1080p.

internal object AdaptiveTrackSelectionFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

@Suppress("unused")
val forceHighestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Plays the highest quality the stream offers, instead of lowering it to match " +
        "the measured connection speed. Turn it off if videos buffer.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // getTotalAllocatableBandwidth(long) has the same shape, so the
        // method is picked by its kept name.
        val allowed = AdaptiveTrackSelectionFingerprint.classDef.methods.singleOrNull {
            it.name == "getAllocatedBandwidth" && it.returnType == "J" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("J")
        } ?: throw PatchException("Force highest quality: getAllocatedBandwidth not found")
        allowed.addInstructions(
            0,
            """
                const-wide v0, 0x7fffffffffffffffL
                return-wide v0
            """,
        )
    }
}
