package app.template.patches.rustore.auth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val skipUpdateAuthenticationPatch = bytecodePatch(
    name = "Skip update authentication",
    description =
        "Skips the VK ID authorization suggestion shown during app installs " +
            "and updates.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        skipUpdateAuthentication()
    }
}

context(_: BytecodePatchContext)
internal fun skipUpdateAuthentication() {
    val method = AuthSuggestShownFingerprint
        .matchAll(1..1)
        .single()
        .method
    val unitReferences = method.implementation!!.instructions
        .zipWithNext()
        .mapNotNull { (fieldInstruction, returnInstruction) ->
            if (
                fieldInstruction.opcode != Opcode.SGET_OBJECT ||
                returnInstruction.opcode != Opcode.RETURN_OBJECT
            ) {
                return@mapNotNull null
            }

            ((fieldInstruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { it.definingClass == it.type }
        }
        .distinctBy(FieldReference::toString)
    require(unitReferences.size == 1) {
        "Expected one completed-result singleton reference, found " +
            unitReferences.size
    }

    method.addInstructions(
        0,
        """
            sget-object v0, ${unitReferences.single()}
            return-object v0
        """,
    )
}
