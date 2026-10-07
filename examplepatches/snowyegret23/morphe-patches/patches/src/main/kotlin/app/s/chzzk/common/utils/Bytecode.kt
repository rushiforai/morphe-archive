package app.s.chzzk.common.utils

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal inline fun <reified T : Reference> Instruction.getReference(): T? =
    (this as? ReferenceInstruction)?.reference as? T

internal val MethodReference.parameterTypeNames: List<String>
    get() = parameterTypes.map { it.toString() }

internal val MethodReference.smaliReference: String
    get() = "$definingClass->$name(" + parameterTypes.joinToString("") + ")$returnType"

internal val FieldReference.smaliReference: String
    get() = "$definingClass->$name:$type"

internal val MutableMethod.localRegisterCount: Int
    get() = implementation!!.registerCount -
        (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) -
        parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }

internal fun MutableMethod.returnEarly(value: Boolean? = null) {
    require(returnType == "V" || implementation!!.registerCount > 0)
    repeat(implementation!!.instructions.size) { implementation!!.removeInstruction(0) }
    addInstructions(0, when {
        returnType == "V" -> "return-void"
        returnType == "Z" -> "const/4 v0, " + (if (value == true) "0x1" else "0x0") + "\nreturn v0"
        returnType.startsWith("L") || returnType.startsWith("[") -> "const/4 v0, 0x0\nreturn-object v0"
        else -> error("Unsupported return type: $returnType")
    })
}

internal fun MutableMethod.rewrite(body: String) {
    repeat(implementation!!.instructions.size) { implementation!!.removeInstruction(0) }
    addInstructions(0, body.trimIndent())
}
