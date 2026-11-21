package app.badfella.patches.linkedin.shared

import app.badfella.patches.linkedin.shared.Constants.LINKEDIN_SIGNATURE
import app.badfella.patches.linkedin.shared.Constants.LINKEDIN_PACKAGE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Firebase checks the original certificate even when the app uses regular Google Play services.
internal val firebaseSupportPatch = bytecodePatch {
    execute {
        restoreFirebaseIdentity()
    }
}

/** Firebase binds its API key to the original package and certificate, including for cloned installs. */
private fun BytecodePatchContext.restoreFirebaseIdentity() {
    val headers = mapOf("X-Android-Cert" to LINKEDIN_SIGNATURE.uppercase(), "X-Android-Package" to LINKEDIN_PACKAGE)
    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.stringConstant() in headers } == true
            }) holders += classDef
    }
    val restored = mutableSetOf<String>()
    holders.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.reversed().forEach { index ->
                val header = code[index].stringConstant() ?: return@forEach
                val replacement = headers[header] ?: return@forEach
                val name = (code[index] as OneRegisterInstruction).registerA
                val call = (index + 1 until minOf(index + 6, code.size)).firstOrNull { at ->
                    val instruction = code[at]
                    val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction is FiveRegisterInstruction && instruction.registerCount == 3 &&
                        instruction.registerD == name &&
                        target?.definingClass == "Ljava/net/URLConnection;" &&
                        target.name.endsWith("RequestProperty")
                } ?: throw PatchException("Firebase $header request call not found")
                val value = (code[call] as FiveRegisterInstruction).registerE
                method.addInstructions(call, "const-string v$value, \"$replacement\"")
                restored += header
            }
        }
    }
    if (restored != headers.keys) throw PatchException("Firebase identity headers missing: ${headers.keys - restored}")
}

private fun Instruction.stringConstant(): String? =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
        ((this as ReferenceInstruction).reference as StringReference).string
    } else null
