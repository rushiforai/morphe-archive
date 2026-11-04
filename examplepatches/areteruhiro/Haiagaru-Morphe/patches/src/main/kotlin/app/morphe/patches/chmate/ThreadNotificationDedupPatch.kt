package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val NATIVE_WATCH="Lapp/morphe/extension/chmate/ThreadWatchNative;"
internal fun BytecodePatchContext.patchThreadNotificationDedup(version:String){
    val owner=mutableClassDefBy(when{
        version.contains("191")->"Lo/getLabel;"
        version.contains("226")->"Lo/OpenJSSEPlatformCompanion;"
        else->"Lo/getHostAppName;"
    })
    val original=owner.methods.single{method->method.implementation?.instructions?.any{
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string=="notifyReplySound"
    }==true}
    val packed=version.contains("226")
    check(original.returnType.startsWith("L"))
    check(if(packed)original.accessFlags and 8!=0&&original.parameterTypes==listOf("[Ljava/lang/Object;")
        else original.accessFlags and 8==0&&original.parameterTypes.first()=="Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val clone=MutableMethod(ImmutableMethod(owner.type,"haiagaruNativeReplyDownload",original.parameters,original.returnType,
        original.accessFlags,original.annotations,original.hiddenApiRestrictions,original.implementation))
    val code=clone.implementation!!.instructions.toList()
    val emit=code.withIndex().single{entry->
        val ref=(entry.value as? ReferenceInstruction)?.reference as? MethodReference
        ref!=null&&ref.returnType=="V"&&ref.parameterTypes.size>=8&&ref.parameterTypes.first()=="Landroid/content/Context;"&&ref.parameterTypes.last()=="Ljava/lang/String;"
    }
    val call=emit.value as RegisterRangeInstruction
    val channel=call.startRegister+call.registerCount-1
    val originalNotify=(emit.value as ReferenceInstruction).reference as MethodReference
    val modern=version.contains("242")
    val entry=if(modern)"emitModern" else "emitLegacy"
    val args=originalNotify.parameterTypes.joinToString("")
    clone.replaceInstruction(emit.index,"invoke-static/range {v${call.startRegister} .. v$channel}, $NATIVE_WATCH->$entry($args)V")
    val extension=mutableClassDefBy(NATIVE_WATCH)
    val stub=extension.methods.single{it.name==if(modern)"nativeModern" else "nativeLegacy"}
    extension.methods.remove(stub)
    extension.methods.add(MutableMethod(ImmutableMethod(extension.type,stub.name,stub.parameters,stub.returnType,stub.accessFlags,stub.annotations,stub.hiddenApiRestrictions,
        ImmutableMethodImplementation(call.registerCount,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"invoke-static/range {p0 .. p${call.registerCount-1}}, $originalNotify\nreturn-void")
    })
    val words=(if(packed)0 else 1)+original.parameterTypes.sumOf{if(it=="J"||it=="D")2 else 1}
    val wrapper=MutableMethod(ImmutableMethod(owner.type,original.name,original.parameters,original.returnType,
        original.accessFlags,original.annotations,original.hiddenApiRestrictions,ImmutableMethodImplementation(words+2,emptyList(),emptyList(),emptyList())))
    val enter=if(packed)"invoke-static/range {p0 .. p0}, $NATIVE_WATCH->beginPacked([Ljava/lang/Object;)V"
        else "invoke-static/range {p1 .. p1}, $NATIVE_WATCH->begin(Ljava/lang/Object;)V"
    val invoke=if(packed)"invoke-static/range" else if(original.accessFlags and 2!=0)"invoke-direct/range" else "invoke-virtual/range"
    wrapper.addInstructions(0,"""
        $enter
        :try_start
        $invoke {p0 .. p${words-1}}, $clone
        move-result-object v0
        :try_end
        invoke-static {}, $NATIVE_WATCH->end()V
        return-object v0
        :caught
        move-exception v0
        invoke-static {}, $NATIVE_WATCH->end()V
        throw v0
    """.trimIndent())
    // Instruction insertion does not import smali catch directives. Add the DEX finally handler explicitly.
    wrapper.implementation!!.let { impl -> impl.addCatch(impl.newLabelForIndex(1),impl.newLabelForIndex(3),impl.newLabelForIndex(5)) }
    owner.methods.remove(original);owner.methods.add(clone);owner.methods.add(wrapper)
}
