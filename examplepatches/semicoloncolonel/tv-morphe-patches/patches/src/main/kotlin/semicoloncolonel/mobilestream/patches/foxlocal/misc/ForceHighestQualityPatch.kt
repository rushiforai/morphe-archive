package semicoloncolonel.mobilestream.patches.foxlocal.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants

// FOX LOCAL for Android TV 2.18.1 plays through the Bitmovin player, which
// bundles its own media3 under com.bitmovin.media3 with the names kept. Its
// AdaptiveTrackSelection picks the highest-bitrate rendition at or below one
// allowed bitrate, which comes from the measured bandwidth. That allowed
// bitrate (getAllocatedBandwidth) is now unlimited, so playback moves to the
// highest rendition and stays there. Renditions media3 excluded after a load
// error are still skipped.
//
// During start-up the app may still pick a lower first rendition when Fox's
// config sets a start-up bitrate. The app's splash video uses a second,
// renamed copy of media3 with the same warning string, so the fingerprint
// names the Bitmovin class.

internal object BitmovinAdaptiveTrackSelectionFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
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
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    execute {
        // getTotalAllocatableBandwidth(long) has the same shape, so the
        // method is picked by its kept name.
        val allowed = BitmovinAdaptiveTrackSelectionFingerprint.classDef.methods.singleOrNull {
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
