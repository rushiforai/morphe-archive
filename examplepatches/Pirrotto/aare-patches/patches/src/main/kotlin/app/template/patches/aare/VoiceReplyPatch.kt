package app.template.patches.aare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_AARE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val REPLY_CLASS = "Lapp/template/extension/aare/VoiceReply;"

private const val RUNTIME_CLASS = "Lnet/prototux/aare/host/CarRuntime;"

/** CarRuntime.notice(title, text, icon, durationMs, actions, message): shows a card on the car screen. */
internal object CarRuntimeNoticeFingerprint : Fingerprint(
    definingClass = RUNTIME_CLASS,
    name = "notice",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;", "J", "Ljava/util/List;", "Z"),
)

/** CarRuntime.remember(title, text, icon, actions): keeps a message for the notification centre. */
internal object CarRuntimeRememberFingerprint : Fingerprint(
    definingClass = RUNTIME_CLASS,
    name = "remember",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;", "Ljava/util/List;"),
)

/** The coroutine of the car screen's card (NoticeOverlay) that closes it after 8 seconds. */
internal object NoticeAutoDismissFingerprint : Fingerprint(
    definingClass = "Lnet/prototux/aare/ui/car/CarShellKt\$NoticeOverlay\$1\$1;",
    name = "invokeSuspend",
    filters = listOf(
        methodCall(
            definingClass = "Lnet/prototux/aare/ui/car/CarActions;",
            name = "dismissNotice",
        ),
    ),
)

@Suppress("unused")
val voiceReplyPatch = patch(
    name = "Voice reply",
    description = "After a message is read aloud, shows a \"Reply\" card on the car screen for 15 seconds, and adds " +
        "\"Reply\" to the messages of the notification centre. Replying lets you dictate the answer, shown live " +
        "on the car screen, then send it after saying \"yes\" or tapping \"Send\". Uses the phone's speech " +
        "recognition, on the phone when available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    // Reading aloud, and the voice messages in it, go through the Voice messages patch.
    dependsOn(voiceMessagesPatch, settingsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        registerSetting("voice_reply")

        // Messages kept in the notification centre get a "Reply" button. Range call: the last
        // parameter register is above v15 in AARE 1.5.0, and p0..p4 are consecutive.
        CarRuntimeRememberFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p4 }, $REPLY_CLASS->withReply(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/List;)Ljava/util/List;
                move-result-object p4
            """,
        )
        CarRuntimeNoticeFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $REPLY_CLASS->onNotice(Ljava/lang/Object;)V",
        )

        // Cards closed after 8 seconds, except the reply cards, which stay until tapped or closed.
        NoticeAutoDismissFingerprint.method.apply {
            val index = instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.contains("CarActions;->dismissNotice(") == true
            }
            if (index < 0) throw PatchException("Could not find the card auto-dismiss call")
            val call = instructions[index] as FiveRegisterInstruction
            replaceInstruction(
                index,
                "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                    "$REPLY_CLASS->dismissUnlessSticky(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
    }
}
