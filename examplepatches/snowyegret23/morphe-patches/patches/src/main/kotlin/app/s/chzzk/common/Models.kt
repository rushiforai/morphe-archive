package app.s.chzzk.common

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode

internal fun BytecodePatchContext.initializeField(owner: String, fieldName: String, value: Boolean?) {
    val model = mutableClassDefBy(owner)
    val field = model.fields.single { it.name == fieldName }
    check(if (value == null) field.type.startsWith("L") else field.type == "Z")
    val constructors = model.methods.filter { it.name == "<init>" }
    check(constructors.isNotEmpty())
    constructors.forEach { constructor ->
        val body = constructor.implementation!!
        check(body.registerCount >= 2)
        val exits = body.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(exits.isNotEmpty())
        exits.reversed().forEach { (index, _) ->
            constructor.addInstructions(index, """
                move-object/from16 v1, p0
                const/4 v0, ${if (value == true) "0x1" else "0x0"}
                iput-${if (value == null) "object" else "boolean"} v0, v1, ${field.smaliReference}
            """.trimIndent())
        }
    }
}
