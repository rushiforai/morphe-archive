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

private const val EXTENSION_CLASS =
    "Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;"

@Suppress("unused")
val deepSeekChineseCaptionsPatch = bytecodePatch(
    name = "AI caption translator",
    description = "Translates every YouTube Auto-translate language in real time through your OpenAI-compatible API.",
    default = false,
) {
    compatibleWith(YOUTUBE)
    dependsOn(captionSupportPatch, deepSeekCaptionResourcePatch, captionResourceMappingPatch)

    execute {
        CaptionFeatures.ai=true
        // Keep a reference to the real YouTube Activity. The extension resolves YouTube's own
        // inset player overlay by resource name at runtime, so no layout resource is replaced.
        YouTubeActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION_CLASS->setMainActivity(Landroid/app/Activity;)V",
        )

        // Use YouTube's own player-state callback rather than guessing from view dimensions. The
        // extension posts its visual reaction until after this callback returns and keeps its View
        // in the stable Activity root, so no extension child participates in the player animation.
        Fingerprint(
            definingClass = "/YouTubePlayerOverlaysLayout;",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf(PlayerTypeEnumFingerprint.originalClassDef.type),
        ).method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->onPlayerType(Ljava/lang/Enum;)V",
        )

        // Morphe's player-time hook resolves the target of this invoke-direct/range and injects
        // into that (J)V method. Repeating the small self-contained part here avoids depending on
        // the user selecting any unrelated official Morphe patch.
        val timeReference =
            (PlayerTimeReferenceFingerprint.instructionMatches.first().instruction as ReferenceInstruction)
                .reference as MethodReference
        val timeMethod = mutableClassDefBy(timeReference.definingClass).methods.firstOrNull { method ->
            method.name == timeReference.name &&
                method.returnType.toString() == timeReference.returnType.toString() &&
                method.parameterTypes.map { it.toString() } ==
                    timeReference.parameterTypes.map { it.toString() }
        } ?: throw PatchException("Could not resolve YouTube player time callback")
        timeMethod.addInstruction(
            2,
            "invoke-static { p1, p2 }, $EXTENSION_CLASS->onVideoTime(J)V",
        )

        // Bind the overlay and every in-flight API call to the concrete current video. This hook
        // fires before the next video's caption request, so the old text disappears immediately
        // instead of waiting for a Timed Text URL or guessing from a reset playback clock.
        CurrentVideoIdFingerprint.method.apply {
            val idIndex = CurrentVideoIdFingerprint.instructionMatches[1].index
            val idRegister = getInstruction<OneRegisterInstruction>(idIndex).registerA
            addInstruction(
                idIndex + 1,
                "invoke-static { v$idRegister }, " +
                    "$EXTENSION_CLASS->onVideoId(Ljava/lang/String;)V",
            )
        }

        // Register the concrete YouTube CC TouchImageView whenever its real controller refreshes.
        // This is the same stable anchor Morphe uses for the official captions-button patch. The
        // extension posts state evaluation until after YouTube's controller method returns, so an
        // Off selection can be observed without guessing from Activity-tree snapshots.
        SubtitleButtonControllerFingerprint.let {
            it.method.apply {
                val viewIndex = it.instructionMatches.first().index
                val viewRegister = getInstruction<TwoRegisterInstruction>(viewIndex).registerA
                addInstruction(
                    viewIndex + 1,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS->" +
                        "onNativeCaptionButtonController(Landroid/widget/ImageView;)V",
                )
            }
        }

        // Keep the bytecode hook narrow: capture the CronetEngine receiver and rewrite only
        // Auto-translate Timed Text URLs while AI captions are enabled. The engine lets us reuse YouTube's own
        // network stack when it needs the source caption, avoiding a second unrelated java.net
        // fingerprint that YouTube can rate-limit independently.
        TimedTextUrlFingerprint.method.apply {
            val urlIndex = TimedTextUrlFingerprint.instructionMatches.first().index
            val requestInstruction = getInstruction<FiveRegisterInstruction>(urlIndex)
            val engineRegister = requestInstruction.registerC
            val urlRegister = requestInstruction.registerD
            addInstructions(
                urlIndex,
                """
                    invoke-static { v$engineRegister, v$urlRegister }, $EXTENSION_CLASS->rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$urlRegister
                """
            )
        }
    }


}
