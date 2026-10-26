package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.yydarlinker.patches.shared.Constants.YOUTUBE
import app.yydarlinker.patches.shared.captionResourceMappingPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

        // The playback time, about once per second. The first call that PlayerTimeReferenceFingerprint finds
        // points at the `(J)V` time callback; it is the same hook as Morphe's, repeated here so that the add-on does
        // not depend on another patch of the user's selection.
        val timeReference = (PlayerTimeReferenceFingerprint.instructionMatches.first().instruction as ReferenceInstruction)
            .reference as MethodReference
        val timeCallback = mutableClassDefBy(timeReference.definingClass).methods.firstOrNull {
            it.name == timeReference.name && it.returnType == timeReference.returnType &&
                it.parameterNames() == timeReference.parameterNames()
        } ?: throw PatchException("AI captions: could not find the player time callback")
        timeCallback.addInstruction(2, "invoke-static { p1, p2 }, $HOOK->onVideoTime(J)V")

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
}
