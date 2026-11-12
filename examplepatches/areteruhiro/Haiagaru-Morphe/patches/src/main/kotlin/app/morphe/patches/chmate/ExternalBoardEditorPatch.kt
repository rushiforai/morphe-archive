package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val EDITOR = "Lapp/morphe/extension/chmate/ExternalBoardEditor;"

internal fun BytecodePatchContext.patchExternalBoardEditor(version: String) {
    patchExternalBoardGroups(version)
    patchBoardTitleSearch(version)
    val board = if(version == "0.8.10.191 dev")
        "Ljp/syoboi/a2chMate/client/BBSUrlInfo\$BoardID;" else "Ljp/syoboi/a2chMate/client/BoardID;"
    val bridge=mutableClassDefBy(EDITOR)
    listOf(Triple(board, "boardFields", "rewriteBoard"),
        Triple("Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "infoFields", "rewriteInfo")).forEach { (type,fields,hook) ->
        val cls=mutableClassDefBy(type)
        val signature=if(fields=="boardFields") List(4){"Ljava/lang/String;"}
            else listOf("Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/Long;","I","Ljava/lang/Integer;","Ljava/lang/String;")
        val ctor=cls.methods.single { it.name=="<init>" && it.parameterTypes.map(CharSequence::toString)==signature }
        val start=ctor.implementation!!.registerCount-signature.size-1
        val names=(1..if(fields=="boardFields") 4 else 2).map { parameter ->
            ctor.implementation!!.instructions.mapNotNull { instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? FieldReference
                val regs=instruction as? TwoRegisterInstruction
                if(instruction.opcode==Opcode.IPUT_OBJECT && ref?.definingClass==type
                    && ref.type=="Ljava/lang/String;" && regs?.registerA==start+parameter) ref.name else null
            }.single()
        }
        bridge.methods.single { it.name==fields }.replaceInstruction(0,"const-string v0, \"${names.joinToString(",")}\"")
        cls.methods.filter { it.name=="<init>" }.forEach { method ->
            method.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}
                .map {it.index}.reversed().forEach { index ->
                    method.addInstructions(index,"invoke-static/range {p0 .. p0}, $EDITOR->$hook(Ljava/lang/Object;)V")
                }
        }
        if(fields=="infoFields") cls.methods.filter {
            it.returnType=="Ljava/lang/String;" && it.accessFlags and 0x8 == 0 && it.implementation!=null
        }.toList().forEach { method ->
            cls.methods.remove(method)
            val original=MutableMethod(ImmutableMethod(type,"haiagaruBoardAddress_${method.name}",method.parameters,
                method.returnType,method.accessFlags,method.annotations,method.hiddenApiRestrictions,method.implementation))
            cls.methods.add(original)
            val slots=1+method.parameterTypes.sumOf { if(it.toString() in setOf("J","D")) 2 else 1 }
            val invoke=if(method.accessFlags and 0x2 != 0) "invoke-direct/range" else "invoke-virtual/range"
            cls.methods.add(MutableMethod(ImmutableMethod(type,method.name,method.parameters,method.returnType,
                method.accessFlags,method.annotations,method.hiddenApiRestrictions,
                ImmutableMethodImplementation(slots+1,emptyList(),emptyList(),emptyList()))).apply {
                addInstructions(0,"""
                    $invoke {p0 .. p${slots-1}}, $original
                    move-result-object v0
                    invoke-static {p0, v0}, $EDITOR->rewriteInfoUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            })
        }
        println("External board editor: $version $type fields=${names.joinToString(",")}")
    }
}
