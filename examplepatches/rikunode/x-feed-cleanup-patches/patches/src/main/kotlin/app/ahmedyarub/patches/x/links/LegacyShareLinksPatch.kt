package app.ahmedyarub.patches.x.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.reference
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The share sheet already shares x.com/<username>/status/<id>, the link the post itself reports;
 * only the native long-press share builds x.com/i/status/<id>. This makes it share the post's own
 * link too.
 */
@Suppress("unused")
val legacyShareLinksPatch = bytecodePatch(
    name = "Legacy share links",
    description = "Shares posts as x.com/<username>/status/<id> rather than x.com/i/status/<id>.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        val postInterface = PostGetUrlFingerprint.classDef.type
        val shareTextIntent = ShareTextIntentFingerprint.method.reference

        NativeShareIntentFingerprint.method.apply {
            val statusLink = instructions.first { instruction ->
                instruction.getReference<StringReference>()?.string == "https://x.com/i/status/"
            }.location.index

            // The shared post, read out of the share subject just before its id is.
            val postRead = instructions.last { instruction ->
                instruction.location.index < statusLink &&
                    instruction.opcode == Opcode.IGET_OBJECT &&
                    instruction.getReference<FieldReference>()?.type?.startsWith("Lcom/x/models/") == true
            }.location.index
            val post = getInstruction<OneRegisterInstruction>(postRead).registerA

            val insertAt = postRead + 1
            val registers = getFreeRegisterProvider(insertAt, 2)
            val url = registers.getFreeRegister()
            val subject = registers.getFreeRegister()
            if (maxOf(post, url, subject) > 15) throw PatchException("The native share keeps its post above v15")

            addInstructionsWithLabels(
                insertAt,
                """
                instance-of v$url, v$post, $postInterface
                if-eqz v$url, :original
                move-object v$url, v$post
                check-cast v$url, $postInterface
                invoke-interface { v$url }, $postInterface->getUrl()Ljava/lang/String;
                move-result-object v$url
                if-eqz v$url, :original
                const/4 v$subject, 0x0
                invoke-static { v$url, v$subject }, $shareTextIntent
                move-result-object v$url
                return-object v$url
                """,
                ExternalLabel("original", getInstruction(insertAt)),
            )
        }
    }
}
