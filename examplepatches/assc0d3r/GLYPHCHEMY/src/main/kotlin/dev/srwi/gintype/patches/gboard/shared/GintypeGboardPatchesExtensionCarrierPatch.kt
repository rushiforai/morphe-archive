package dev.srwi.gintype.patches.gboard.shared

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val UNRECOGNIZED_CERTS_PREFIX = "APK is signed by unrecognized certificates:"

internal val gboardPatchesExtensionCarrierPatch = bytecodePatch(
    description = "Merge GinType runtime extension into target APK.",
) {
    extendWith("extensions/gintype.rve")

    execute {
        // Gboard runs a background self-certificate check on startup that throws
        // IllegalStateException("APK is signed by unrecognized certificates: ...") when the
        // patched APK is re-signed with a user/Morphe keystore (fatal immediately on 18.8.1-beta
        // and intermittently on 18.5.4). Suppress only that self-certificate crash guard.
        val matchingClasses = classDefByStrings(
            UNRECOGNIZED_CERTS_PREFIX,
            StringComparisonType.STARTS_WITH,
        )
        for (classDef in matchingClasses) {
            val mutableCls = mutableClassDefBy(classDef)
            for (method in mutableCls.methods) {
                val impl = method.implementation ?: continue
                val insns = impl.instructions
                val stringIndices = insns.mapIndexedNotNull { idx, insn ->
                    if (insn.opcode != Opcode.CONST_STRING) return@mapIndexedNotNull null
                    val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                        ?: return@mapIndexedNotNull null
                    if (str.startsWith(UNRECOGNIZED_CERTS_PREFIX)) idx else null
                }
                for (strIdx in stringIndices) {
                    val searchStart = (strIdx - 25).coerceAtLeast(0)
                    val verifyCallIdx = (strIdx - 1 downTo searchStart).firstOrNull { idx ->
                        val insn = insns[idx]
                        if (insn.opcode != Opcode.INVOKE_STATIC) return@firstOrNull false
                        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                            ?: return@firstOrNull false
                        ref.returnType == "Z" &&
                            ref.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;")
                    } ?: continue
                    val moveResultInsn = insns.getOrNull(verifyCallIdx + 1) as? OneRegisterInstruction
                        ?: continue
                    val ifNezInsn = insns.getOrNull(verifyCallIdx + 2) as? OneRegisterInstruction
                        ?: continue
                    if (
                        moveResultInsn.opcode == Opcode.MOVE_RESULT &&
                        ifNezInsn.opcode == Opcode.IF_NEZ &&
                        moveResultInsn.registerA == ifNezInsn.registerA &&
                        moveResultInsn.registerA <= 15
                    ) {
                        method.replaceInstruction(
                            verifyCallIdx + 1,
                            "const/4 v${moveResultInsn.registerA}, 0x1",
                        )
                    }
                }
            }
        }
    }
}
