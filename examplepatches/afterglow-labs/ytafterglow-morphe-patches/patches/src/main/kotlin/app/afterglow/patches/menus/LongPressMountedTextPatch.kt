package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CAPTURE="$EXTENSION_PACKAGE/menus/LongPressCaptureTools;"
private const val MOUNTED="$EXTENSION_PACKAGE/menus/LongPressMountedText;"
private const val MODEL="$EXTENSION_PACKAGE/menus/LongPressMountedTextModel;"
private const val SOURCE="Lhsl;->afterglow_captureSource:Ljava/lang/Object;"
private const val BIND="Lhfn;->J(Lhfs;Ljava/lang/Object;Lhhw;)V"

internal fun longPressMountedBindFingerprint()=Fingerprint(definingClass="Lhiy;",name="w",
    parameters=listOf("Lhtw;","Lhfn;","Lhfs;","Lbxhu;","Ljava/lang/Object;"),returnType="V",
    filters=listOf(methodCall(smali=BIND),fieldAccess(smali="Lhtw;->c:Z",opcode=Opcode.IPUT_BOOLEAN)))
internal fun longPressMountedUnbindFingerprint()=Fingerprint(definingClass="Lhiy;",name="r",
    parameters=listOf("Lhtw;","Lhfn;","Ljava/lang/Object;"),returnType="V",
    filters=listOf(methodCall(smali="Lhfn;->ar(Lhfs;Ljava/lang/Object;)V"),fieldAccess(smali="Lhtw;->c:Z",opcode=Opcode.IPUT_BOOLEAN)))

internal fun MutableMethod.installLongPressMountedBind(){
    val code=implementation!!.instructions.toList()
    val bind=code.withIndex().single{(_,instruction)->(instruction as? ReferenceInstruction)?.reference?.toString()==BIND}
    require(definingClass=="Lhiy;"&&name=="w"&&implementation!!.registerCount==13)
    require(bind.value.invokeRegisters==listOf(9,0,12,11))
    require(code.take(bind.index+1).none{instruction->instruction.writtenRegisters.any{it in listOf(8,9,12)}})
    // Native bind exceptions skip this callback. A generated wrapper reads the host
    // without borrowing any of the caller's live locals or replacing p0.
    addInstructions(bind.index+1,"invoke-static { p1, p2, p5 }, $CAPTURE->afterglow_nativeMounted(Lhtw;Lhfn;Ljava/lang/Object;)V")
}
internal fun MutableMethod.installLongPressMountedUnbind(){
    require(definingClass=="Lhiy;"&&name=="r"&&implementation!!.registerCount==10)
    require(implementation!!.instructions.first().invokeRegisters==listOf(8,9))
    addInstructions(0,"invoke-static { p1, p2 }, $CAPTURE->afterglow_nativeUnmounted(Lhtw;Lhfn;)V")
}
internal fun MutableMethod.installLongPressLegacySource(){
    require(definingClass=="Lvuw;"&&name=="aC"&&returnType=="Lhfn;")
    val code=implementation!!.instructions.toList()
    val returned=code.withIndex().single{it.value.opcode==Opcode.RETURN_OBJECT}
    require((returned.value as OneRegisterInstruction).registerA==0)
    require((code[returned.index-1] as OneRegisterInstruction).registerA==0&&code[returned.index-1].opcode==Opcode.MOVE_RESULT_OBJECT)
    require((code[returned.index-2] as ReferenceInstruction).reference.toString()=="Lhsj;->b()Lhsl;")
    val nativeThis=implementation!!.registerCount-2
    require(code.take(returned.index).none{nativeThis in it.writtenRegisters}){"Original text hooks must preserve p0"}
    addInstructionsAtControlFlowLabel(returned.index,"""
        move-object/from16 v1, p0
        iput-object v1, v0, $SOURCE
    """)
}
private fun MutableClass.staticMethod(name:String,parameters:List<String>,registers:Int,body:String){
    require(methods.none{it.name==name})
    methods.add(ImmutableMethod(type,name,parameters.map{ImmutableMethodParameter(it,null,null)},"V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,null,null,MutableMethodImplementation(registers))
        .toMutable().apply{addInstructions(0,body)})
}

/** Actual native text bind generations, including same-item model updates. */
internal val longPressMountedTextHookPatch=bytecodePatch {
    dependsOn(longPressPostHookPatch)
    execute {
        require(mutableClassDefBy("Lhtw;").fields.any{it.name=="b"&&it.type=="Lhtu;"})
        require(mutableClassDefBy("Lhtu;").superclass=="Landroid/view/ViewGroup;")
        val legacy=mutableClassDefBy("Lhsl;")
        require(legacy.fields.none{it.name=="afterglow_captureSource"})
        // Native shallow cloning preserves the exact source field along with text.
        Fingerprint(definingClass="Lhsl;",name="l",parameters=emptyList(),returnType="Lhfn;",
            filters=listOf(methodCall(smali="Lhju;->l()Lhfn;",opcode=Opcode.INVOKE_SUPER))).method
        Fingerprint(definingClass="Lhfn;",name="l",parameters=emptyList(),returnType="Lhfn;",
            filters=listOf(methodCall(smali="Ljava/lang/Object;->clone()Ljava/lang/Object;",opcode=Opcode.INVOKE_SUPER))).method
        legacy.fields.add(ImmutableField(legacy.type,"afterglow_captureSource","Ljava/lang/Object;",AccessFlags.PUBLIC.value,null,null,null).toMutable())
        legacy.interfaces.add(MODEL)
        legacy.addMethod("afterglow_captureSource","Ljava/lang/Object;",2,"""
            iget-object v0, p0, $SOURCE
            return-object v0
        """)
        val modern=mutableClassDefBy("Lvuz;");modern.interfaces.add(MODEL)
        modern.addMethod("afterglow_captureSource","Ljava/lang/Object;",1,"return-object p0")
        mutableClassDefBy("Lvuw;").methods.single{it.name=="aC"&&it.parameterTypes==listOf("Lhfs;")}.installLongPressLegacySource()

        val extension=mutableClassDefBy(CAPTURE)
        extension.staticMethod("afterglow_onMounted",listOf("Landroid/view/View;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;"),4,"""
            invoke-static/range { p0 .. p3 }, $MOUNTED->mounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            return-void
        """)
        extension.staticMethod("afterglow_onUnmounted",listOf("Landroid/view/View;","Ljava/lang/Object;","Ljava/lang/Object;"),3,"""
            invoke-static/range { p0 .. p2 }, $MOUNTED->unmounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
            return-void
        """)
        extension.staticMethod("afterglow_nativeMounted",listOf("Lhtw;","Lhfn;","Ljava/lang/Object;"),4,"""
            iget-object v0, p0, Lhtw;->b:Lhtu;
            invoke-static { v0, p0, p1, p2 }, $CAPTURE->afterglow_onMounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            return-void
        """)
        extension.staticMethod("afterglow_nativeUnmounted",listOf("Lhtw;","Lhfn;"),3,"""
            iget-object v0, p0, Lhtw;->b:Lhtu;
            invoke-static { v0, p0, p1 }, $CAPTURE->afterglow_onUnmounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
            return-void
        """)
        longPressMountedBindFingerprint().method.installLongPressMountedBind()
        longPressMountedUnbindFingerprint().method.installLongPressMountedUnbind()
        println("Afterglow mounted text: exact component source, actual host/item bind and same-item unbind generations")
    }
}
