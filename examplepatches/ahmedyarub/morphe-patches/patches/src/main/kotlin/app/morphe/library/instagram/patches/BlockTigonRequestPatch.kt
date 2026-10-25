package app.morphe.library.instagram.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/library/extension/instagram/patches/BlockUrlRequestPatch;"

private object MakeTigonRequestFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/api/tigon/TigonServiceLayer;",
    name = "startRequest"
)

private object GetBlockedUrlsFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "<clinit>"
)

@Suppress("unused")
val blockUrlBasePatch = bytecodePatch {
    dependsOn(instagramExtensionPatch)

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
                """
            )
        }
    }
}

@Suppress("unused")
context(_: BytecodePatchContext)
fun blockUrl(vararg urlSubstrings: String) = GetBlockedUrlsFingerprint.method.apply {
    val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_VOID)

    addInstructions(
        returnIndex,
        urlSubstrings.joinToString("\n") {
            """
                const-string v0, "$it"
                sget-object v1, $EXTENSION_CLASS_DESCRIPTOR->BLOCKED_URLS:Ljava/util/Set;
                invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
            """
        }
    )
}
