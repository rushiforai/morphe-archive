package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.misc.textcomponent.hookLithoSpannableString
import app.morphe.patches.shared.misc.textcomponent.lithoSpannableStringPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CAPTURE="$EXTENSION_PACKAGE/menus/LongPressCaptureTools;"
private const val CONTEXT="$EXTENSION_PACKAGE/menus/LongPressCaptureContext;"
private const val HOST_INTERFACE="$EXTENSION_PACKAGE/menus/LongPressCaptureHost;"
private const val HOST="Lcom/facebook/litho/ComponentHost;"
private const val MORPHE_CONTEXT="Lapp/morphe/extension/shared/patches/components/ContextInterface;"
private const val FRESH_TEXT="Lvuq;->k(Lwuw;Landroid/content/Context;Lvzm;Lwuj;Lwzx;Lwwm;Ljava/util/Map;Lwvo;Ltad;ZZZZI)Ljava/lang/CharSequence;"

internal fun longPressCaptureRootFingerprint()=Fingerprint(definingClass="Lwuv;",name="b",
    parameters=listOf("Landroid/view/View;"),returnType="V",filters=listOf(
        methodCall(smali="Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V"),
        fieldAccess(smali="Lwuv;->A:Ljava/lang/ref/WeakReference;",opcode=Opcode.IPUT_OBJECT)))

internal fun longPressFreshTextFingerprint()=Fingerprint(definingClass="Lvuz;",name="L",
    parameters=listOf("Lhfs;","Ljava/lang/Object;","Lhhw;"),returnType="V",filters=listOf(
        fieldAccess(smali="Lvuz;->c:Lwuw;"),
        methodCall(smali="Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V"),
        methodCall(smali=FRESH_TEXT),methodCall(smali="Lwhb;->n()Z")))

/** The original shared hook covers the cached branch; this observes fresh body text. */
internal fun MutableMethod.installLongPressFreshCapture() {
    require(definingClass=="Lvuz;"&&name=="L")
    val code=implementation!!.instructions.toList()
    val fresh=code.withIndex().filter{(_,instruction)->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.smali==FRESH_TEXT
    }
    require(fresh.size==2)
    val body=fresh.first()
    require(body.value.opcode==Opcode.INVOKE_STATIC_RANGE&&body.value.invokeRegisters.size==14)
    val context=body.value.invokeRegisters.first()
    require(code[body.index+1].opcode==Opcode.MOVE_RESULT_OBJECT)
    val text=(code[body.index+1] as OneRegisterInstruction).registerA
    require(context==4&&text==6)
    require(((code[body.index+2] as? ReferenceInstruction)?.reference as? MethodReference)?.smali=="Lwhb;->n()Z")
    require(code.take(body.index).any{it.opcode==Opcode.IGET_OBJECT
        &&(it as OneRegisterInstruction).registerA==context
        &&(it as ReferenceInstruction).reference.toString()=="Lvuz;->c:Lwuw;"})
    require(code.none{it.opcode==Opcode.IPUT_OBJECT
        &&(it as? ReferenceInstruction)?.reference?.toString()=="Lvuz;->c:Lwuw;"})
    val nativeThis=implementation!!.registerCount-1-parameterTypes.size
    require(code.take(body.index+2).none{nativeThis in it.writtenRegisters}) {
        "Original text parameter cloning must preserve the native component"
    }
    // Reload the same bound component context. This also gives later observers
    // an explicit field provenance after the cached branch's unrelated register reuse.
    addInstructions(body.index+2,"""
        move-object/from16 v$context, p0
        iget-object v$context, v$context, Lvuz;->c:Lwuw;
        invoke-static { v$context, v$text }, $CAPTURE->afterglow_onLithoCapture(${MORPHE_CONTEXT}Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
        move-result-object v$text
    """)
}

internal val longPressCaptureHookPatch=bytecodePatch {
    dependsOn(afterglowExtensionPatch,lithoSpannableStringPatch,longPressCaptureResourcesPatch)
    execute {
        val bind=longPressCaptureRootFingerprint().method
        val code=bind.implementation!!.instructions.toList()
        val store=code.withIndex().single { it.value.opcode==Opcode.IPUT_OBJECT&&
            ((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.smali=="Lwuv;->A:Ljava/lang/ref/WeakReference;" }
        require(code[store.index+1].opcode==Opcode.RETURN_VOID)
        val token=(store.value as OneRegisterInstruction).registerA
        require(bind.implementation!!.registerCount==3&&token==0)
        bind.addInstructionsAtControlFlowLabel(store.index+1,
            "invoke-static { p1, v$token }, $CAPTURE->bindRoot(Landroid/view/View;Ljava/lang/Object;)V")

        Fingerprint(definingClass="Lwuw;",name="a",parameters=listOf(),returnType="Landroid/view/View;",
            filters=listOf(fieldAccess(smali="Lwuw;->b:Ljava/lang/ref/WeakReference;"),
                methodCall(smali="Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;"))).method
        // A copied builder retains the exact weak-reference token rather than creating another one.
        Fingerprint(definingClass="Lwuv;",name="<init>",parameters=listOf("Lwuw;"),filters=listOf(
            fieldAccess(smali="Lwuw;->b:Ljava/lang/ref/WeakReference;"),
            fieldAccess(smali="Lwuv;->A:Ljava/lang/ref/WeakReference;",opcode=Opcode.IPUT_OBJECT))).method
        val context=mutableClassDefBy("Lwuw;")
        require(MORPHE_CONTEXT in context.interfaces)
        context.interfaces.add(CONTEXT)
        context.addMethod("afterglow_captureRoot","Landroid/view/View;",2,"""
            invoke-virtual { p0 }, Lwuw;->a()Landroid/view/View;
            move-result-object v0
            return-object v0
        """)
        context.addMethod("afterglow_captureBinding","Ljava/lang/Object;",2,"""
            iget-object v0, p0, Lwuw;->b:Ljava/lang/ref/WeakReference;
            return-object v0
        """)
        for((name,type,native) in listOf(
            Triple("afterglow_captureIdentifier","Ljava/lang/String;","patch_getIdentifier"),
            Triple("afterglow_capturePath","Ljava/lang/StringBuilder;","patch_getPathBuilder"))) {
            require(context.methods.any{it.name==native&&it.parameterTypes.isEmpty()&&it.returnType==type})
            context.addMethod(name,type,2,"""
                invoke-virtual { p0 }, Lwuw;->$native()$type
                move-result-object v0
                return-object v0
            """)
        }
        val extension=mutableClassDefBy(CAPTURE)
        extension.methods.add(ImmutableMethod(CAPTURE,"afterglow_onLithoCapture",
            listOf(ImmutableMethodParameter(MORPHE_CONTEXT,null,null),ImmutableMethodParameter("Ljava/lang/CharSequence;",null,null)),
            "Ljava/lang/CharSequence;",AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,null,null,MutableMethodImplementation(2))
            .toMutable().apply{addInstructions(0,"""
                invoke-static { p0, p1 }, $CAPTURE->onText(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                move-result-object p1
                return-object p1
            """)})
        hookLithoSpannableString(CAPTURE,"afterglow_onLithoCapture")
        longPressFreshTextFingerprint().method.installLongPressFreshCapture()

        Fingerprint(definingClass=HOST,name="getTextContent",parameters=listOf(),returnType="Lcom/facebook/litho/TextContent;",
            filters=listOf(methodCall(smali="Lcci;->S(Ljava/util/List;)Lcom/facebook/litho/TextContent;"))).method
        val host=mutableClassDefBy(HOST);host.interfaces.add(HOST_INTERFACE)
        host.addMethod("afterglow_captureTextItems","Ljava/util/List;",2,"""
            invoke-virtual { p0 }, $HOST->getTextContent()Lcom/facebook/litho/TextContent;
            move-result-object v0
            if-eqz v0, :empty
            invoke-interface { v0 }, Lcom/facebook/litho/TextContent;->getTextItems()Ljava/util/List;
            move-result-object v0
            return-object v0
            :empty
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)
        val touch=Fingerprint(definingClass=HOST,name="dispatchTouchEvent",parameters=listOf("Landroid/view/MotionEvent;"),returnType="Z",
            filters=listOf(methodCall(name="dispatchTouchEvent",opcode=Opcode.INVOKE_SUPER))).method
        require(touch.implementation!!.registerCount>=3)
        touch.addInstructionsWithLabels(0,"""
            invoke-static/range { p0 .. p1 }, $CAPTURE->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
            move-result v0
            if-eqz v0, :native_capture_continue
            return v0
            :native_capture_continue
            nop
        """)
        println("Afterglow comment capture: native root-binding token, original cached and exact fresh text hooks")
    }
}
