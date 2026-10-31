package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.yydarlinker.patches.shared.Constants.YOUTUBE
import app.yydarlinker.patches.shared.captionResourceMappingPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.Method

private const val HOOK = "${EXTENSION}DeepSeekCaptionHookV2;"

/** The classes that receive the player type, newest layout last; matched by the end of the name. */
private val PLAYER_TYPE_LISTENERS = listOf("/YouTubePlayerOverlaysLayout;", "/YouTubePlayerViewNotForReflection;")

@Suppress("unused")
val aiCaptionTranslatorPatch = bytecodePatch(
    name = "AI caption translator",
    description = "Translates the selected YouTube Auto-translate language in real time through your OpenAI-compatible API.",
    default = true,
) {
    compatibleWith(YOUTUBE)
    dependsOn(captionSupportPatch, captionSettingsPatch, captionResourceMappingPatch)

    execute {
        CaptionFeatures.translation = true

        // The activity of the app: the extension keeps it, to find the player's overlay by resource name at run
        // time, so that no layout resource has to be replaced.
        YouTubeActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $HOOK->setMainActivity(Landroid/app/Activity;)V",
        )

        // The player state: YouTube's own callback, not a guess from the size of a view. The extension reacts
        // after the callback returned, so nothing of it takes part in the animation of the player. Up to 21.40
        // the callback is on the overlays layout; since 21.41 it is on the player view.
        val playerType = PlayerTypeEnumFingerprint.originalClassDef.type
        val listener = PLAYER_TYPE_LISTENERS.map { owner ->
            Fingerprint(
                definingClass = owner,
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                returnType = "V",
                parameters = listOf(playerType),
            )
        }.firstOrNull { it.methodOrNull != null }
            ?: throw PatchException("AI captions: could not find the player type callback")
        listener.method.addInstruction(0, "invoke-static { p1 }, $HOOK->onPlayerType(Ljava/lang/Enum;)V")

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
            method.addInstructions(
                index,
                """
                    invoke-static { v$engine, v$url }, $HOOK->rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$url
                """,
            )
        }
    }

    // Finalize under the public root so a changed host interface is reported as an AI
    // caption translator failure, rather than an unnamed shared dependency failure.
    finalize {
        installPlaybackClock()
        installNativeCaptionBridge(CaptionFeatures.translation)
    }
}

/** Mirror the value sent to Morphe's public addon API, independent of YouTube's callback layout. */
private fun BytecodePatchContext.installPlaybackClock() {
    val api = classDefBy("Lapp/morphe/extension/youtube/addon/AddOnApi;")
    val clock = api.methods.filter {
        it.name == "videoTimeChanged" && it.parameterNames() == listOf("J") && it.returnType == "V" &&
            it.isStatic() && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.implementation != null
    }.unique("official playback clock API")
    val callers = mutableListOf<Pair<Method, Int>>()
    classDefForEach { initial ->
        if (initial.type.startsWith("Lapp/morphe/") || initial.type.startsWith(EXTENSION)) return@classDefForEach
        for (method in classDefBy(initial.type).methods) {
            method.code().forEachIndexed { index, instruction ->
                if (instruction.call()?.id() == clock.id()) callers.add(method to index)
            }
        }
    }
    val (caller, index) = callers.unique("official playback clock dispatch")
    val instruction = caller.code()[index]
    val start = when {
        instruction.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC_RANGE && instruction is RegisterRangeInstruction && instruction.registerCount == 2 -> instruction.startRegister
        instruction.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC && instruction is FiveRegisterInstruction &&
            instruction.registerCount == 2 && instruction.registerD == instruction.registerC + 1 -> instruction.registerC
        else -> throw PatchException("AI captions: official playback clock does not pass a contiguous long")
    }
    val target = mutableClassDefBy(caller.definingClass).methods.filter { it.id() == caller.id() }
        .unique("mutable playback clock dispatch")
    // Replace the labeled invoke so incoming branches cannot bypass the observation. Both calls
    // receive the same untouched long, before any official listener can change the player state.
    target.replaceInstruction(index, "invoke-static/range {v$start .. v${start + 1}}, $HOOK->onVideoTime(J)V")
    target.addInstruction(index + 1, "invoke-static/range {v$start .. v${start + 1}}, ${clock.id()}")
}
