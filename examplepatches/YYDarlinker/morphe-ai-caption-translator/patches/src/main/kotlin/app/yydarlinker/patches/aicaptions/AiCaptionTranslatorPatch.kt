package app.yydarlinker.patches.aicaptions

import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.yydarlinker.patches.shared.Constants.YOUTUBE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val HOOK = "${EXTENSION}host/AiCaptionHook;"

/** The classes that receive the player type, newest layout last; matched by the end of the name. */
private val PLAYER_TYPE_LISTENERS = listOf("/YouTubePlayerOverlaysLayout;", "/YouTubePlayerViewNotForReflection;")

@Suppress("unused")
val aiCaptionTranslatorPatch = patch(
    name = "AI caption translator",
    description = "Translates the selected YouTube Auto-translate language in real time through your OpenAI-compatible API.",
    default = true,
) {
    compatibleWith(YOUTUBE)
    dependsOn(captionSupportPatch, captionSettingsPatch, playerControlsVisibilityPatch)

    execute {
        // The player type callback moved from the overlays layout to the player view in 21.41.
        val playerType = PlayerTypeEnumFingerprint.originalClassDef.type
        val playerTypeFingerprints = PLAYER_TYPE_LISTENERS.map { owner ->
            Fingerprint(
                definingClass = owner,
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                returnType = "V",
                parameters = listOf(playerType),
            )
        }
        val playerTypeFingerprint = playerTypeFingerprints.firstOrNull { it.methodOrNull != null }
            ?: throw PatchException("AI captions: could not find the player type callback")
        playerTypeFingerprint.method.addInstruction(0, "invoke-static { p1 }, $HOOK->onPlayerType(Ljava/lang/Enum;)V")

        // The video that is shown, in the regular player or in Shorts. This fires before the next video asks for its
        // captions, so the old text disappears at once, without waiting for a Timed Text URL.
        CurrentVideoIdFingerprint.method.apply {
            val index = CurrentVideoIdFingerprint.instructionMatches[1].index
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            addInstruction(index + 1, "invoke-static { v$register }, $HOOK->onVideoId(Ljava/lang/String;)V")
        }

        // The CC button of the player, whenever its controller refreshes. The extension looks at it after the
        // controller returned, which is how it notices that the user turned the captions off.
        SubtitleButtonControllerFingerprint.apply {
            val index = instructionMatches.first().index
            val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
            method.addInstruction(
                index + 1,
                "invoke-static { v$register }, $HOOK->onNativeCaptionButtonController(Landroid/widget/ImageView;)V",
            )
        }

        // The request for a translated caption. The extension keeps the Cronet engine of the call, to reuse YouTube's
        // own network stack for source captions. Native URLs and caption data stay intact; the hook
        // reconciles the committed selection and the draw mask controls native visibility.
        TimedTextUrlFingerprint.apply {
            val index = instructionMatches.first().index
            val request = method.getInstruction<FiveRegisterInstruction>(index)
            val engine = request.registerC
            val url = request.registerD
            method.addInstruction(
                index, "invoke-static { v$engine, v$url }, $HOOK->onTimedTextRequest(Ljava/lang/Object;Ljava/lang/String;)V",
            )
        }
    }

    // Finalize under the public root so a changed host interface is reported as an AI
    // caption translator failure, rather than an unnamed shared dependency failure.
    finalize {
        installPlaybackClock()
        installNativeCaptionBridge()
    }
}

/** Mirror the value sent to Morphe's public addon API, independent of YouTube's callback layout. */
private fun installPlaybackClock() {
    val api = classDefBy("Lapp/morphe/extension/youtube/addon/AddOnApi;")
    val clock = api.methods.filter {
        it.name == "videoTimeChanged" && it.parameterNames() == listOf("J") && it.returnType == "V" &&
            it.isStatic() && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.implementation != null
    }.unique("official playback clock API")
    val fingerprint = Fingerprint(
        filters = listOf(methodCall(smali = clock.id())),
        custom = { _, cls -> !cls.type.startsWith("Lapp/morphe/") && !cls.type.startsWith(EXTENSION) },
    )
    val match = fingerprint.matchAllOrNull().orEmpty().unique("official playback clock dispatch")
    val caller = match.method
    val invoke = match.instructionMatches.single()
    val index = invoke.index
    val instruction = invoke.instruction
    if (caller.code().count { it.call()?.id() == clock.id() } != 1) {
        throw PatchException("AI captions: official playback clock must have one dispatch in the caller")
    }
    val start = when {
        instruction.opcode == Opcode.INVOKE_STATIC_RANGE && instruction is RegisterRangeInstruction && instruction.registerCount == 2 -> instruction.startRegister
        instruction.opcode == Opcode.INVOKE_STATIC && instruction is FiveRegisterInstruction &&
            instruction.registerCount == 2 && instruction.registerD == instruction.registerC + 1 -> instruction.registerC
        else -> throw PatchException("AI captions: official playback clock does not pass a contiguous long")
    }
    // Replace the labeled invoke so incoming branches cannot bypass the observation. Both calls
    // receive the same untouched long, before any official listener can change the player state.
    caller.replaceInstruction(index, "invoke-static/range {v$start .. v${start + 1}}, $HOOK->onVideoTime(J)V")
    caller.addInstruction(index + 1, "invoke-static/range {v$start .. v${start + 1}}, ${clock.id()}")
}
