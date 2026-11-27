package app.unlimited.sportsnet.patches.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.unlimited.sportsnet.patches.shared.Constants.COMPATIBILITY_SPORTSNET
import app.unlimited.sportsnet.patches.shared.originalSignaturePatch
import app.unlimited.sportsnet.patches.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val secondsPresets = mapOf(
    "5 seconds" to 5, "10 seconds" to 10, "15 seconds" to 15,
    "30 seconds" to 30, "60 seconds" to 60, "90 seconds" to 90,
)


@Suppress("unused")
val skipIntervalsPatch = bytecodePatch(
    name = "Custom skip intervals",
    description = "Sets separate fast forward and rewind times for the Sportsnet+ player's skip buttons.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)

    val forwardSeconds by intOption(
        key = "forwardSeconds",
        default = 30,
        values = secondsPresets,
        title = "Fast forward",
        description = "Seconds the fast forward button skips.",
        required = true,
    ) { it != null && it in 1..600 }
    val rewindSeconds by intOption(
        key = "rewindSeconds",
        default = 10,
        values = secondsPresets,
        title = "Rewind",
        description = "Seconds the rewind button goes back.",
        required = true,
    ) { it != null && it in 1..600 }

    execute {
        // The player reads how far to skip back from each button's label, so label each button
        // with its own time right after the player labels both with the server's interval.
        val callIndices = SetSeekTimeFingerprint.instructionMatches.map { it.index }
        val forwardCall = callIndices[0]
        val rewindCall = callIndices[1]
        val method = SetSeekTimeFingerprint.method
        listOf(rewindCall to rewindSeconds!!, forwardCall to forwardSeconds!!).forEach { (callIndex, seconds) ->
            val moveResultIndex = callIndex + 1
            val register = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            method.addInstruction(moveResultIndex + 1, "const-string v$register, \"$seconds\"")
        }
    }
}

/** max, min and starting bitrate in kbps; -1 leaves it to the player. */
private val qualityPresets = mapOf(
    "Automatic" to "-1,-1,-1",
    "Start at the best quality" to "-1,-1,20000",
    "Always HD (may buffer on slow connections)" to "-1,4500,20000",
    "Data saver" to "1500,-1,-1",
)

@Suppress("unused")
val videoQualityPatch = bytecodePatch(
    name = "Video quality",
    description = "Sets the quality the Sportsnet+ player starts at and stays within, " +
        "and shows the player's hidden HDR setting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    extendWith("extensions/extension.mpe")

    val quality by stringOption(
        key = "quality",
        default = qualityPresets["Start at the best quality"],
        values = qualityPresets,
        title = "Quality",
        description = "Bitrates as max,min,start in kbps; -1 leaves one to the player.",
        required = true,
    ) { value -> value != null && Regex("""^-?\d+,-?\d+,-?\d+$""").matches(value) }

    execute {
        if (quality != qualityPresets["Automatic"]) {
            DivaBitratePreferencesFingerprint.method.addInstructions(
                0,
                """
                    const-string p0, "$quality"
                    invoke-static {p0}, $EXTENSION_PACKAGE/VideoQuality;->bitratePreferences(Ljava/lang/String;)Ljava/lang/Object;
                    move-result-object p0
                    check-cast p0, Lcom/deltatre/divacorelib/domain/shared/BitratePreferences;
                    return-object p0
                """
            )
        }

        SettingsButtonEnabledFingerprint.method.returnEarly(true)
    }
}

@Suppress("unused")
val saveWatchPositionPatch = bytecodePatch(
    name = "Save watch position often",
    description = "Saves how far you got in a Sportsnet+ replay while you watch and after you skip, " +
        "not only when you pause or close it, so the place is kept if the app is closed or killed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    extendWith("extensions/extension.mpe")

    val intervalSeconds by intOption(
        key = "saveIntervalSeconds",
        default = 30,
        values = mapOf("15 seconds" to 15, "30 seconds" to 30, "60 seconds" to 60),
        title = "Save every",
        description = "Seconds between saves while a video plays.",
        required = true,
    ) { it != null && it in 1..600 }

    execute {
        ShouldSetBookmarkFingerprint.method.apply {
            if (implementation!!.registerCount - parameters.size - 1 < 1) {
                throw PatchException("No free register in getShouldSetBookmark")
            }
            addInstructionsWithLabels(
                0,
                """
                    const v0, $intervalSeconds
                    invoke-static {p1, v0}, $EXTENSION_PACKAGE/WatchProgress;->shouldSave(Ljava/lang/Object;I)Z
                    move-result v0
                    if-eqz v0, :original
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
