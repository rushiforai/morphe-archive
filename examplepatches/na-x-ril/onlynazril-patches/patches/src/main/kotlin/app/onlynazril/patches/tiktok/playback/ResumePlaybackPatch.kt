package app.onlynazril.patches.tiktok.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.implementationOrPatchException
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RESUME_PLAYBACK =
    "Lapp/onlynazril/extension/tiktok/playback/ResumePlayback;"

/**
 * Continues a video where it was left by opening TikTok's own progress-continue gates.
 *
 * The app already stores a position per item and hands it back through the player, so nothing is
 * seeked from here. Two of the app's own answers have to agree before that happens, and both are
 * forced open while the switch is on:
 *  1. the lambda that reads `FeedPlayProgressContinueConfig.enable`;
 *  2. the resume method's `event_type_list.contains(...)` answer, so feeds outside the app's own
 *     allow list still resume.
 *
 * A video that finished must not start again at its last second, so the feed player's progress
 * tick and completion callback feed a completed set that the resume gate refuses. The start and
 * end thresholds are applied there too.
 */
@Suppress("unused")
val tiktokResumePlaybackPatch = bytecodePatch(
    name = "Resume playback",
    description = "Continues a video from the position TikTok stored. The first and last seconds, " +
        "set in Tweaks, are skipped.",
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        // TikTok's own progress-continue gate. The lambda that reads the config's `enable` is
        // forced to true while the switch is on.
        val continueGate = FeedProgressContinueGateFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: the continue gate was not found.")
        val mutableGate = mutableClassDefBy(continueGate.definingClass)
            .findMutableMethodOf(continueGate)
        mutableGate.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $RESUME_PLAYBACK->shouldEnableContinue()Z
                move-result v0
                if-eqz v0, :continue_gate
                const/4 v0, 0x1
                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v0
                return-object v0
            """,
            ExternalLabel("continue_gate", continueGate.getInstruction(0)),
        )

        // The method that answers "where should this video start". Its event type allow list is
        // overridden so feeds outside TikTok's own list still resume.
        val resumePosition = FeedProgressResumePositionFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: the resume-position method was not found.")
        val mutableResume = mutableClassDefBy(resumePosition.definingClass)
            .findMutableMethodOf(resumePosition)
        val resumeInstructions = mutableResume.implementationOrPatchException("Resume playback")
            .instructions.toList()
        val listIndex = resumeInstructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.let { reference ->
                reference is FieldReference && reference.name == "event_type_list"
            } == true
        }
        if (listIndex < 0) {
            throw PatchException("Resume playback: the resume method reads no event type list.")
        }
        val containsIndex = (listIndex until resumeInstructions.size).firstOrNull { index ->
            (resumeInstructions[index] as? ReferenceInstruction)?.reference?.let { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "contains"
            } == true
        } ?: throw PatchException("Resume playback: the event type check has no contains call.")
        val containsResult = resumeInstructions.getOrNull(containsIndex + 1)
        if (containsResult?.opcode != Opcode.MOVE_RESULT ||
            containsResult !is OneRegisterInstruction
        ) {
            throw PatchException("Resume playback: the event type check keeps no answer.")
        }
        val eventTypeRegister = containsResult.registerA
        if (eventTypeRegister > 15) {
            throw PatchException("Resume playback: the event type answer is above v15.")
        }
        mutableResume.addInstructions(
            containsIndex + 2,
            "invoke-static {v$eventTypeRegister}, " +
                "$RESUME_PLAYBACK->allowResumeInThisFeed(Z)Z\n" +
                "move-result v$eventTypeRegister",
        )

        // The aweme is the method's first parameter; remember it so the gate can refuse a
        // finished item. The first parameter sits at registerCount - parameterTypes.size on both
        // a static and an instance method.
        val awemeRegister = mutableResume.implementationOrPatchException("Resume playback")
            .registerCount - resumePosition.parameterTypes.size
        mutableResume.addInstructions(
            0,
            "invoke-static/range {v$awemeRegister .. v$awemeRegister}, " +
                "$RESUME_PLAYBACK->onResumeRequest(Ljava/lang/Object;)V",
        )

        // The progress tick and the completion callback are the only two places that can tell a
        // finished item from one that was simply left.
        val progress = FeedPlayProgressFingerprint.methodOrNull
            ?: throw PatchException(
                "Resume playback: the feed player's progress tick was not found.",
            )
        progress.addInstructions(
            0,
            "invoke-static/range {p0 .. p5}, $RESUME_PLAYBACK->onProgress(" +
                "Ljava/lang/Object;Ljava/lang/String;JJ)V",
        )

        val completed = FeedPlayCompletedFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: onPlayCompleted was not found.")
        completed.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onCompleted(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedPlayCompletedCountFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onCompleted(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
    }
}
