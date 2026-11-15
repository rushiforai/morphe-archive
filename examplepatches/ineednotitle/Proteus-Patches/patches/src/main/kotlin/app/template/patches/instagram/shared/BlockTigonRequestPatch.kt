/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramBlockUrlRequestPatch;"

private object MakeTigonRequestFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/api/tigon/TigonServiceLayer;",
    name = "startRequest",
)

private object GetBlockedUrlsFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "<clinit>",
)

val instagramBlockUrlBasePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        MakeTigonRequestFingerprint.method.apply {
            val uriFieldIndex = indexOfFirstInstructionOrThrow {
                getReference<FieldReference>()?.type == "Ljava/net/URI;"
            }

            val uriField = getInstruction<TwoRegisterInstruction>(uriFieldIndex).registerA

            addInstructions(
                uriFieldIndex + 1,
                """
                    invoke-static/range {v$uriField .. v$uriField}, $EXTENSION_CLASS_DESCRIPTOR->checkAndBlockUrl(Ljava/net/URI;)V
                """.trimIndent(),
            )
        }
    }
}

context(patchContext: BytecodePatchContext)
fun blockInstagramUrl(vararg urlSubstrings: String) = GetBlockedUrlsFingerprint.method.apply {
    val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_VOID)

    addInstructions(
        returnIndex,
        urlSubstrings.joinToString("\n") {
            """
                const-string v0, "$it"
                sget-object v1, $EXTENSION_CLASS_DESCRIPTOR->BLOCKED_URLS:Ljava/util/Set;
                invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
            """.trimIndent()
        },
    )
}
