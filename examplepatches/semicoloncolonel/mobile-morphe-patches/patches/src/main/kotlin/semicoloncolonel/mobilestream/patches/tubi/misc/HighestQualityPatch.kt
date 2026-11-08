package semicoloncolonel.mobilestream.patches.tubi.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// Tubi 10.44.2. Quality is picked in two places, both on the phone:
//
// 1. Which version of a title or live channel to play. The server lists
//    several (Slay has 1080p H.265 beside 720p H.264), and the app plays the
//    first one the phone can use. Each getVideoResources() in the content and
//    live-channel models now returns the list sorted by resolution, highest
//    first (TubiQuality.sorted).
// 2. Which rendition of that version to play. Media3's AdaptiveTrackSelection
//    keeps names in this build. Its determineIdealSelectedIndex picks the
//    highest-bitrate rendition that canSelectFormat allows for the measured
//    bandwidth. canSelectFormat now always allows it, so playback starts and
//    stays at the highest rendition. Renditions Media3 excluded after a load
//    error are still skipped.
//
// The server decides which versions and renditions exist. Most titles stop at
// 720p, and the app's sign-in gets a shorter rendition list than the website
// does: Labyrinth's H.265 version stops at 1280x538 in the app and at 1920x806
// on the website, whatever platform or resolution limit the app sends.

private const val QUALITY = "Lsemicoloncolonel/mobilestream/extension/tubi/TubiQuality;"

internal object CanSelectFormatFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    name = "canSelectFormat",
    returnType = "Z",
)

private val VIDEO_RESOURCE_MODELS = listOf(
    "Lcom/tubitv/core/api/models/ContentApi;",
    "Lcom/tubitv/core/api/models/EPGLiveChannelApi\$",
    "Lcom/tubitv/core/api/models/EPGChannelProgramApi\$",
)

@Suppress("unused")
val highestQualityPatch = bytecodePatch(
    name = "Highest quality",
    description = "Plays the highest-resolution version of each title and live channel, at its highest bitrate. " +
        "Turn it off if videos buffer.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val getters = mutableListOf<String>()
        classDefForEach { classDef ->
            if (VIDEO_RESOURCE_MODELS.any { classDef.type.startsWith(it) } &&
                classDef.methods.any { it.name == "getVideoResources" && it.parameterTypes.isEmpty() }
            ) {
                getters += classDef.type
            }
        }
        getters.forEach { type ->
            mutableClassDefBy(type).methods
                .filter { it.name == "getVideoResources" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;" }
                .forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
                        .map { it.index }.asReversed().forEach { index ->
                            val register = (instructions[index] as OneRegisterInstruction).registerA
                            method.addInstructions(
                                index,
                                """
                                    invoke-static/range { v$register .. v$register }, $QUALITY->sorted(Ljava/util/List;)Ljava/util/List;
                                    move-result-object v$register
                                """,
                            )
                        }
                }
        }

        CanSelectFormatFingerprint.methodOrNull?.returnEarly(
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
