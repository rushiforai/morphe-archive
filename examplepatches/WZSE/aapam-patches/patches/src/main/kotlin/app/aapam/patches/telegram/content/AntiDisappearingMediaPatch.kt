package app.aapam.patches.telegram.content

import app.aapam.patches.telegram.shared.CheckDeletingTaskFingerprint
import app.aapam.patches.telegram.shared.Constants
import app.aapam.patches.telegram.shared.DoDeleteShowOnceTaskFingerprint
import app.aapam.patches.telegram.shared.EmptyMessagesMediaFingerprint
import app.aapam.patches.telegram.shared.IsRoundOnceFingerprint
import app.aapam.patches.telegram.shared.IsSecretMediaFingerprint
import app.aapam.patches.telegram.shared.IsSecretMediaStaticFingerprint
import app.aapam.patches.telegram.shared.IsSecretPhotoOrVideoFingerprint
import app.aapam.patches.telegram.shared.IsVoiceOnceFingerprint
import app.aapam.patches.telegram.shared.SendSecretMediaDeleteFingerprint
import app.aapam.patches.telegram.shared.SendSecretMessageReadFingerprint
import app.aapam.patches.telegram.shared.ShouldEncryptPhotoOrVideoFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val antiDisappearingMediaPatch = bytecodePatch(
    name = "Anti-disappearing media",
    description = "Keeps view-once and self-destructing media viewable forever; " +
        "the sender sees them as expired.",
) {
    compatibleWith(Constants.COMPATIBILITY_TELEGRAM)

    execute {
        // Return false — treat TTL media as regular media
        listOf(
            IsSecretMediaFingerprint,
            IsSecretMediaStaticFingerprint,
            IsSecretPhotoOrVideoFingerprint,
            ShouldEncryptPhotoOrVideoFingerprint,
            IsVoiceOnceFingerprint,
            IsRoundOnceFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        }

        // Return null — nothing happens when the view-once viewer closes
        SendSecretMediaDeleteFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        // Bypass the isSecretMedia() guard in sendSecretMessageRead. The read
        // receipt (markMessageAsRead2 -> readMessageContents) must reach the
        // server so the sender's copy expires. The remaining guards (isOut,
        // destroyTime, ttl <= 0) still reject regular messages.
        val sendSecretMessageRead = SendSecretMessageReadFingerprint.method
        val instructions = sendSecretMessageRead.instructions
        val isSecretMediaIndex = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference is MethodReference &&
                (instruction.reference as MethodReference).name == "isSecretMedia" &&
                (instruction.reference as MethodReference).definingClass == "Lorg/telegram/messenger/MessageObject;"
        }
        check(isSecretMediaIndex >= 0) {
            "Could not locate isSecretMedia() call in sendSecretMessageRead"
        }
        check(instructions[isSecretMediaIndex + 1].opcode == Opcode.MOVE_RESULT) {
            "Unexpected instruction after isSecretMedia() call"
        }
        val guardIndex = isSecretMediaIndex + 2
        check(instructions[guardIndex].opcode == Opcode.IF_EQZ) {
            "isSecretMedia() guard not found in sendSecretMessageRead"
        }
        sendSecretMessageRead.replaceInstruction(guardIndex, "nop")

        // Return false — local destroy tasks are never processed, so the
        // receiver's copy survives the TTL countdown
        CheckDeletingTaskFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Return-void — never delete or empty the local copy when the server
        // confirms the message as read (updateReadMessagesContents)
        listOf(
            DoDeleteShowOnceTaskFingerprint,
            EmptyMessagesMediaFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, "return-void")
        }
    }
}