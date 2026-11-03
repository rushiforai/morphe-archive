package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val ORIGINS = "Lapp/morphe/extension/chmate/ArchiveOrigins;"

internal fun BytecodePatchContext.patchArchiveOrigins(version: String) {
    val model = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val url = model.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" && method.accessFlags and 8 == 0 &&
            method.implementation?.instructions?.any { ins ->
                val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Landroid/net/Uri;" && ref.name == "fromFile"
            } == true
    }
    val native = MutableMethod(ImmutableMethod(model.type, "haiagaruNativeArchiveUrl", url.parameters, url.returnType,
        url.accessFlags, url.annotations, url.hiddenApiRestrictions, url.implementation))
    val wrapper = MutableMethod(ImmutableMethod(model.type,url.name,url.parameters,url.returnType,url.accessFlags,
        url.annotations,url.hiddenApiRestrictions,ImmutableMethodImplementation(2, emptyList(),emptyList(),emptyList())))
    wrapper.addInstructions(0,"""
        invoke-virtual {p0}, $native
        move-result-object v0
        invoke-static {p0, v0}, $ORIGINS->observe(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent())
    model.methods.remove(url); model.methods.add(native); model.methods.add(wrapper)
    val binding = mutableClassDefBy(ORIGINS).methods.single { it.name == "nativeUrlMethod" }
    binding.replaceInstruction(0, "const-string v0, \"${url.name}\"")
    val ctor = model.methods.single { it.name == "<init>" && it.parameterTypes == listOf(
        "Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/Long;","I","Ljava/lang/Integer;","Ljava/lang/String;") }
    val returns = ctor.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
    check(returns.size == 1)
    ctor.addInstructions(returns.single().index,"invoke-static/range {p0 .. p0}, $ORIGINS->onModel(Ljava/lang/Object;)V")

    var methods = 0; var copies = 0
    boundClassForEach("ArchiveOriginsPatch:1") { cls ->
        if(!cls.type.startsWith("Lo/")) return@boundClassForEach
        cls.methods.forEach { method ->
            if(method.parameterTypes != listOf("Ljava/lang/String;","J","Ljava/lang/String;","I") || method.returnType != "V") return@forEach
            val ins = method.implementation?.instructions?.toList() ?: return@forEach
            if(ins.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.contains("DATファイル") == true }) return@forEach
            val target = mutableClassDefBy(cls).findMutableMethodOf(method)
            val indexes = ins.indices.filter { i ->
                val ref = (ins[i] as? ReferenceInstruction)?.reference as? MethodReference
                ins[i].opcode in listOf(Opcode.INVOKE_STATIC,Opcode.INVOKE_STATIC_RANGE) &&
                    ref?.parameterTypes == listOf("Ljava/io/File;","Ljava/io/File;")
            }
            check(indexes.size == 2) { "$version archive DAT/IDX copies changed: ${indexes.size}" }
            indexes.reversed().forEach { index ->
                val hook = "$ORIGINS->copied(Ljava/io/File;Ljava/io/File;)V"
                val call = when(val op = ins[index]) {
                    is FiveRegisterInstruction -> "invoke-static {v${op.registerC}, v${op.registerD}}, $hook"
                    is RegisterRangeInstruction -> "invoke-static/range {v${op.startRegister} .. v${op.startRegister+1}}, $hook"
                    else -> error("Unsupported archive copy registers")
                }
                val after = if(ins.getOrNull(index+1)?.opcode in listOf(Opcode.MOVE_RESULT,Opcode.MOVE_RESULT_OBJECT,Opcode.MOVE_RESULT_WIDE)) index+2 else index+1
                target.addInstructions(after,call); copies++
            }
            methods++
        }
    }
    check(methods == 1) { "$version native archive writer expected 1, found $methods" }
    println("Archive original URLs: $version, model=${url.name}, archive writers=$methods copies=$copies")
}
