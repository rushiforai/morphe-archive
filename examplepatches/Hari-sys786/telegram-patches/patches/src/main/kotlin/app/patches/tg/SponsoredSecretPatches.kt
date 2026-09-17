package app.patches.tg

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.constLiteral
import app.patches.tg.TgSupport.methodOrNull
import app.patches.tg.TgSupport.mutableClassOrThrow
import app.patches.tg.TgSupport.replaceMethodBody
import app.patches.tg.TgSupport.replaceWithSmali
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Patch 14 — Disable sponsored messages (MessageObject.isSponsored). */
@Suppress("unused")
val sponsoredMessagePatch = bytecodePatch(
    name = "Hide sponsored messages",
    description = "Makes MessageObject.isSponsored() always return false.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/MessageObject"),
            name = "isSponsored",
            locals = 2,
            body = """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}

/**
 * Patch 16 — Secret media enabler (MessageObject).
 *
 * getSecretTimeLeft() is nudged so Math.max never returns 0 (media never expires), and the
 * isSecretMedia/isSecretPhotoOrVideo probes are rewritten to their "not secret" constant form,
 * matching the reference patcher.
 */
@Suppress("unused")
val secretMediaPatch = bytecodePatch(
    name = "Secret media enabler",
    description = "Prevents secret media from expiring and disables the secret-media checks.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val classType = TgSupport.desc("org/telegram/messenger/MessageObject")
        val clazz = mutableClassOrThrow(classType)

        // getSecretTimeLeft(): const/4 v1, 0x0 -> const/4 v1, 0x1
        val timeLeft = clazz.methodOrNull("getSecretTimeLeft")
            ?: throw PatchException("MessageObject.getSecretTimeLeft()I not found")
        val impl = timeLeft.implementation
            ?: throw PatchException("getSecretTimeLeft has no implementation")
        var timeLeftEdits = 0
        impl.instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.CONST_4) return@forEachIndexed
            val register = (instruction as OneRegisterInstruction).registerA
            if (register == 1 && constLiteral(instruction) == 0L) {
                timeLeft.replaceWithSmali(index, "const/4 v1, 0x1")
                timeLeftEdits++
            }
        }
        if (timeLeftEdits == 0) {
            throw PatchException("Secret media: no 'const/4 v1, 0x0' in getSecretTimeLeft")
        }

        replaceMethodBody(
            classType = classType,
            name = "isSecretMedia",
            locals = 5,
            body = """
                iget-object v0, p0, Lorg/telegram/messenger/MessageObject;->messageOwner:Lorg/telegram/tgnet/TLRPC${'$'}Message;
                instance-of v1, v0, Lorg/telegram/tgnet/TLRPC${'$'}TL_message_secret;
                const/4 v3, 0x0
                return v3
            """.trimIndent(),
        )

        val messageType = "Lorg/telegram/tgnet/TLRPC\$Message;"
        replaceMethodBody(
            classType = classType,
            name = "isSecretPhotoOrVideo",
            parameters = listOf(messageType),
            locals = 4,
            body = """
                instance-of v0, p0, Lorg/telegram/tgnet/TLRPC${'$'}TL_message_secret;
                const/4 v2, 0x0
                return v2
            """.trimIndent(),
        )
        replaceMethodBody(
            classType = classType,
            name = "isSecretMedia",
            parameters = listOf(messageType),
            locals = 4,
            body = """
                instance-of v0, p0, Lorg/telegram/tgnet/TLRPC${'$'}TL_message_secret;
                const/4 v2, 0x0
                return v2
            """.trimIndent(),
        )
    }
}
