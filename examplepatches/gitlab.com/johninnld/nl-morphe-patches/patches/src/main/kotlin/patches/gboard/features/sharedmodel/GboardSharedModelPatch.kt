package patches.gboard.features.sharedmodel

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.*
import patches.gboard.shared.accesspoint.gboardAccessPointContributions1803Patch
import patches.gboard.features.manualincognito.GboardManualIncognitoTargets
import patches.gboard.shared.runtimeabi.*

internal val gboardSharedModelPatch = bytecodePatch(
    description = "Add the optional shared local model backend through Gboard 18.8's complete native writing interface.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch,gboardAccessPointContributions1803Patch)
    execute {
        GboardSharedWritingTargets.preflight(this)
        installSharedEditorBridge(this)
        installSharedNativeEntry(this)
        installSharedCameraOcr(this)
        GboardMethodTarget("Lpdq;","fk",emptyList(),"V").resolve(this).addInstructions(0,RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_EDITOR_INVALIDATE,""))
        val nativeKeyboard="Lcom/google/android/apps/inputmethod/libs/jarvis/JarvisKeyboard;"
        GboardMethodTarget(nativeKeyboard,"ep",listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;","Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;"),"V").resolve(this).addInstructions(0,RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_KEYBOARD_SURFACE_BIND,"p0 .. p1"))
        GboardMethodTarget(nativeKeyboard,"f",emptyList(),"V").resolve(this).addInstructions(0,RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_KEYBOARD_SURFACE_CLEAR,""))
        // On return from screen consent the keyboard can reuse an already-active JarvisExtension.
        // Restore its editor bridge from the keyboard that actually took ownership of the session.
        GboardFieldTarget(nativeKeyboard,"b","Lpuq;").resolve(this)
        val keyboardActivation=GboardMethodTarget(nativeKeyboard,"e",listOf("Landroid/view/inputmethod/EditorInfo;","Ljava/lang/Object;"),"V").resolve(this)
        val stockKeyboardActivation="morpheSharedStock_jarvisActivate"
        check(mutableClass(nativeKeyboard).methods.none{it.name==stockKeyboardActivation}){"Native keyboard activation wrapper already exists"}
        keyboardActivation.name=stockKeyboardActivation
        addHelperMethodIfMissing(nativeKeyboard,"e",keyboardActivation.parameterTypes.map(CharSequence::toString),"V",keyboardActivation.accessFlags,4,"""
            invoke-virtual {p0, p1, p2}, ${nativeKeyboard}->${stockKeyboardActivation}(Landroid/view/inputmethod/EditorInfo;Ljava/lang/Object;)V
            iget-object v0, p0, ${nativeKeyboard}->b:Lpuq;
            if-eqz v0, :done
            ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_EDITOR_REMEMBER,"v0")}
            :done
            return-void
        """.trimIndent())
        applySharedRequestDispatch(this)
        val provisioning=GboardMethodTarget("Ladtl;","k",emptyList(),"Z").resolve(this)
        val stockProvisioning="morpheSharedStock_k"
        check(mutableClass("Ladtl;").methods.none{it.name==stockProvisioning}){"Native provisioning wrapper already exists"}
        provisioning.name=stockProvisioning
        addHelperMethodIfMissing("Ladtl;","k",emptyList(),"Z",provisioning.accessFlags,2,"""
            ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_NATIVE_PROVISIONING_BLOCKED, "")}
            move-result v0
            if-ltz v0, :stock_provisioning
            return v0
            :stock_provisioning
            invoke-virtual {p0}, Ladtl;->$stockProvisioning()Z
            move-result v0
            return v0
        """.trimIndent())
        findMutableMethodOrThrow(GboardSharedWritingTargets.readiness).applySharedFactory(this,RuntimeCallId.SHARED_WRITING_READINESS, "")
        findMutableMethodOrThrow(GboardSharedWritingTargets.v2Factory).applySharedFactory(this,RuntimeCallId.SHARED_WRITING_CREATE_V2,"p0 .. p1")
        // Preserve adtl.d: pdq.al casts its result to the original adtk wrapper.
        // Shared dispatch replaces the underlying request handler, never this native wrapper.
        findMutableMethodOrThrow(GboardMethodTarget("Lafae;","onUpdateSelection",List(6){"I"},"V")).addInstructions(0,RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_WRITING_SELECTION_UPDATED,"p0 .. p6"))
        findMutableMethodOrThrow(GboardManualIncognitoTargets.onStartInput).addInstructions(0,RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_WRITING_INPUT_START,"p0 .. p1"))
        findMutableMethodOrThrow(GboardManualIncognitoTargets.onWindowHidden).applyVoidExitLifecycleDelegate(RuntimeCallId.SHARED_WRITING_INPUT_HIDDEN,"p0")
        val shown=GboardMethodTarget("Lafae;","onWindowShown",emptyList(),"V").resolve(this)
        val shownFlags=shown.accessFlags
        check(mutableClass("Lafae;").methods.none{it.name=="morpheSharedStock_onWindowShown"}){"Window shown wrapper already exists"}
        shown.name="morpheSharedStock_onWindowShown"
        // Keep the receiver in its own frame even if stock code reuses its parameter register.
        addHelperMethodIfMissing("Lafae;","onWindowShown",emptyList(),"V",shownFlags,1,"""
            invoke-virtual {p0}, Lafae;->morpheSharedStock_onWindowShown()V
            ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_WRITING_INPUT_SHOWN,"p0")}
            return-void
        """.trimIndent())
    }
}

internal object GboardSharedWritingTargets {
    val v2Factory=GboardMethodTarget("Lpzy;","a",listOf("Landroid/content/Context;","Lagrh;"),"Ladvg;")
    val readiness=GboardMethodTarget("Ladtl;","a",emptyList(),"Ladsd;")
    val nativeWrapperFactory=GboardMethodTarget("Ladtl;","d",listOf("Lagrh;"),"Ladvh;")
    fun preflight(context: BytecodePatchContext) {
        v2Factory.resolve(context);nativeWrapperFactory.resolve(context);readiness.resolve(context)
        GboardMethodTarget("Ladtl;","k",emptyList(),"Z").resolve(context)
        listOf("g","h").forEach{GboardFieldTarget("Laicd;",it,"Lahdw;").resolve(context)}
        GboardMethodTarget("Laheb;","f",listOf("Lahdw;"),"Z").resolve(context)
        listOf("g","h").forEach{GboardMethodTarget("Laheb;",it,listOf("Lahdw;"),"Z").resolve(context)}
        // A keyboard transition restores Jarvis after capture/picker Activities deactivate it.
        GboardMethodTarget("Lpve;","a",listOf("Ladbd;","Laicj;","Z","Laeaj;"),"Laubj;").resolve(context)
        GboardMethodTarget("Lagoq;","<init>",listOf("Lagoo;","Ljava/lang/Object;"),"V").resolve(context)
        GboardMethodTarget("Laars;","a",listOf("Lagoq;"),"Laars;").resolve(context)
        GboardFieldTarget("Laars;","b","Ladan;").resolve(context)
        GboardMethodTarget("Laicj;","d",listOf("Lavgf;"),"Laicj;").resolve(context)
        GboardMethodTarget("Lafae;","bT",listOf("Ladan;"),"V").resolve(context)
        GboardFieldTarget("Ladbd;","d","Ladbd;").resolve(context)
        GboardMethodTarget("Ladan;","e",listOf("I","Ljava/lang/Object;"),"Ladan;").resolve(context)
        GboardFieldTarget("Lpva;","a","Lagoo;").resolve(context)
        check(context.mutableClass("Ladvg;").interfaces.toSet()==setOf("Ljava/lang/AutoCloseable;","Lzwg;")) { "Writing handler parent interface drift" }
        listOf(
            GboardMethodTarget("Lavvx;","b",listOf("Ljava/lang/Runnable;","Ljava/util/concurrent/Executor;"),"V"),
            GboardMethodTarget("Lzwg;","j",emptyList(),"Ljava/lang/String;"),
            GboardMethodTarget("Ladvh;","s",listOf("Landroid/content/Context;"),"V"),
            GboardMethodTarget("Laeak;","b",emptyList(),"Laeai;"),
            GboardMethodTarget("Laeai;","a",emptyList(),"Laeak;"),
            GboardMethodTarget("Laeai;","i",listOf("Ljava/lang/String;"),"V"),
            GboardMethodTarget("Laeai;","d",listOf("I"),"V"),
            GboardMethodTarget("Laeai;","g",listOf("D"),"V"),
            GboardMethodTarget("Laeai;","h",listOf("Ljava/lang/String;"),"V"),
            GboardMethodTarget("Laeai;","f",listOf("Ljava/lang/String;"),"V"),
            GboardMethodTarget("Laeai;","b",listOf("Laeaf;"),"V"),
            GboardMethodTarget("Laeai;","c",listOf("Laeal;"),"V"),
            GboardMethodTarget("Laeai;","k",listOf("Lj$/util/Optional;"),"V"),
            GboardMethodTarget("Laeal;","values",emptyList(),"[Laeal;"),
            GboardMethodTarget("Laeaj;","values",emptyList(),"[Laeaj;"),
            GboardMethodTarget("Lauaz;","q",listOf("Ljava/lang/Object;"),"Lauaz;"),
            GboardMethodTarget("Ladvj;","c",emptyList(),"Ljava/lang/String;"),
            GboardMethodTarget("Ladvj;","d",emptyList(),"I"),
        ).forEach{it.resolve(context)}
        listOf(GboardFieldTarget("Laeaf;","a","Laeaf;"),GboardFieldTarget("Ladsd;","a","Ladsd;"),GboardFieldTarget("Ladsd;","b","Ladsd;")).forEach{it.resolve(context)}
        check(context.mutableClass("Laeal;").superclass=="Ljava/lang/Enum;"){"Native error enum representation drift"}
        check(context.mutableClass("Ladvh;").interfaces.toSet()==setOf("Ladvg;")){"Prepared writing handler parent drift"}
        val native=(context.mutableClass("Ladvg;").methods+context.mutableClass("Ladvh;").methods).filter{it.name!="<clinit>"}.map{it.name to (it.parameterTypes.map(CharSequence::toString) to it.returnType)}.toSet()
        val adapter=context.mutableClass("LMorpheSharedWritingHandler188;").methods.map{it.name to (it.parameterTypes.map(CharSequence::toString) to it.returnType)}.toSet()
        check(adapter.containsAll(native)){"Shared handler omits a native method"}
        check("Lavvx;" in context.mutableClass("LMorpheSharedFuture188;").interfaces)
    }
}

internal fun MutableMethod.applySharedFactory(context:BytecodePatchContext,call: RuntimeCallId,registers: String) {
    val original=implementation?.instructions?.firstOrNull()?:error("Factory has no instructions")
    val parameterWords=parameterTypes.size + if (accessFlags and 8 == 0)1 else 0
    val abi=RuntimeAbiCatalog.abi(call)
    if(implementation!!.registerCount==parameterWords){
        val publicName=name
        val stockName="morpheSharedStock_"+publicName
        val owner=definingClass
        val parameters=parameterTypes.map(CharSequence::toString)
        check(context.mutableClass(owner).methods.none{it.name==stockName}){"Stock factory wrapper already exists"}
        val flags=accessFlags
        name=stockName
        val args=if(parameterWords==0)"" else "p0 .. p${parameterWords-1}"
        val invokeKind=if(flags and 8 != 0)"invoke-static" else if(flags and 2 != 0)"invoke-direct" else "invoke-virtual"
        val stockInvoke=if(parameterWords==0)"$invokeKind {}, $owner->$stockName(${parameters.joinToString("")})$returnType"
            else "$invokeKind/range {$args}, $owner->$stockName(${parameters.joinToString("")})$returnType"
        context.addHelperMethodIfMissing(owner,publicName,parameters,returnType,flags,parameterWords+1,"""
            ${RuntimeCallEmitter.invoke(call,registers)}
            move-result-object v0
            if-nez v0, :done
            $stockInvoke
            move-result-object v0
            :done
            return-object v0
        """)
        return
    }
    check(implementation!!.registerCount>parameterWords){"Factory register layout is invalid"}
    check(implementation!!.instructions.none{it.isMethodReference(abi.reference)}){"Shared factory already modified"}
    addInstructionsWithLabels(0,"""
        ${RuntimeCallEmitter.invoke(call,registers)}
        move-result-object v0
        if-eqz v0, :original
        return-object v0
    """.trimIndent(),ExternalLabel("original",original))
}

/** Preserve every register and result type while routing cached native interface calls through a typed bridge. */
internal fun applySharedRequestDispatch(context: BytecodePatchContext) {
    val calls=mapOf(
        "b" to RuntimeCallId.SHARED_WRITING_DISPATCH_B,
        "c" to RuntimeCallId.SHARED_WRITING_DISPATCH_C,
        "d" to RuntimeCallId.SHARED_WRITING_DISPATCH_D,
        "e" to RuntimeCallId.SHARED_WRITING_DISPATCH_E,
        "f" to RuntimeCallId.SHARED_WRITING_DISPATCH_F,
        "g" to RuntimeCallId.SHARED_WRITING_DISPATCH_G,
        "r" to RuntimeCallId.SHARED_WRITING_DISPATCH_CANCEL,
    )
    val all=mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    context.classDefForEach{all.add(it)}
    var changed=0
    for(owner in all.toList()) {
        if(owner.type.startsWith("LMorpheShared") || owner.type.startsWith("Ldev/jason/") || owner.type.startsWith("Lapp/johninnl/modelhost/"))continue
        val methods=owner.methods.filter{m->m.implementation?.instructions?.any{(it as? ReferenceInstruction)?.reference.let{ref->ref is MethodReference && ref.definingClass=="Ladvg;" && ref.name in calls}}==true}
        for(original in methods){
            val method=context.mutableClass(owner.type).methods.single{it.name==original.name && it.parameterTypes==original.parameterTypes && it.returnType==original.returnType}
            val instructions=method.implementation!!.instructions.toList()
            instructions.forEachIndexed{index,instruction->
                val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference?:return@forEachIndexed
                if(reference.definingClass!="Ladvg;")return@forEachIndexed
                val call=calls[reference.name]?:return@forEachIndexed
                val registers=when(instruction){
                    is RegisterRangeInstruction -> "v${instruction.startRegister} .. v${instruction.startRegister+instruction.registerCount-1}"
                    is FiveRegisterInstruction -> listOf(instruction.registerC,instruction.registerD,instruction.registerE,instruction.registerF,instruction.registerG).take(instruction.registerCount).joinToString(", "){"v$it"}
                    else -> error("Unexpected native writing invoke encoding")
                }
                val abi=RuntimeAbiCatalog.abi(call)
                check(abi.parameters==listOf("Ladvg;")+reference.parameterTypes.map(CharSequence::toString) && abi.returnType==reference.returnType){"Shared dispatch descriptor drift"}
                method.replaceInstruction(index,RuntimeCallEmitter.invoke(call,registers));changed++
            }
        }
    }
    check(changed>0){"No native writing calls were routed"}
}

internal fun installSharedEditorBridge(context:BytecodePatchContext){
    GboardMethodTarget("Lpdq;","x",listOf("Z"),"Laesl;").resolve(context)
    GboardMethodTarget("Lpdq;","U",listOf("Ljava/lang/CharSequence;","Ljava/lang/String;","I","Laeaj;"),"V").resolve(context)
    GboardFieldTarget("Lpdq;","y","Laesl;").resolve(context)
    context.addHelperMethodIfMissing("Lpdq;","morpheSharedPrepare",emptyList(),"Ljava/lang/String;",1,3,"""
        const/4 v0, 0x1
        invoke-virtual {p0, v0}, Lpdq;->x(Z)Laesl;
        move-result-object v0
        iput-object v0, p0, Lpdq;->y:Laesl;
        invoke-virtual {v0}, Laesl;->toString()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """)
    context.addHelperMethodIfMissing("Lpdq;","morpheSharedApply",listOf("Ljava/lang/String;","Ljava/lang/String;"),"V",1,7,"""
        const-string v0, "shared-local"
        const/4 v1, 0x0
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_EDITOR_OPERATION,"p2")}
        move-result-object v2
        invoke-virtual {p0, p1, v0, v1, v2}, Lpdq;->U(Ljava/lang/CharSequence;Ljava/lang/String;ILaeaj;)V
        return-void
    """)
    val activation=GboardMethodTarget("Lpdq;","n",listOf("Laeuj;","Landroid/view/inputmethod/EditorInfo;","Z","Ljava/util/Map;","Ladbd;"),"Z").resolve(context)
    // Stock n reuses its p0 register for its boolean result. Preserve the receiver in a separate frame.
    val stockActivation="morpheSharedStock_n"
    check(context.mutableClass("Lpdq;").methods.none{it.name==stockActivation}){"Native activation wrapper already exists"}
    activation.name=stockActivation
    context.addHelperMethodIfMissing("Lpdq;","n",activation.parameterTypes.map(CharSequence::toString),"Z",activation.accessFlags,7,"""
        invoke-virtual/range {p0 .. p5}, Lpdq;->$stockActivation(Laeuj;Landroid/view/inputmethod/EditorInfo;ZLjava/util/Map;Ladbd;)Z
        move-result v0
        if-eqz v0, :done
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_EDITOR_REMEMBER,"p0")}
        :done
        return v0
    """)
}

/** Native AccessPointController state; the original token, icon, label, click and order survive. */
internal fun installSharedNativeEntry(context:BytecodePatchContext){
    listOf("p","h","e").forEach{GboardFieldTarget("Lppq;",it,"Z").resolve(context)}
    GboardFieldTarget("Lppq;","j","I").resolve(context)
    GboardMethodTarget("Laadv;","b",listOf("I"),"V").resolve(context)
    val state=GboardMethodTarget("Lppq;","l",emptyList(),"V").resolve(context)
    val writes=state.implementation!!.instructions.withIndex().filter{it.value.isOpcode("IPUT") && it.value.isFieldReference("Lppq;->j:I")}
    check(writes.size==1){"Writing access-point state assignment drift"}
    val write=writes.single();val registers=write.value as TwoRegisterInstruction
    val open=GboardMethodTarget("Lpsi;","u",listOf("Z"),"V").resolve(context)
    val flags=open.accessFlags;open.name="morpheSharedStock_u"
    context.addHelperMethodIfMissing("Lpsi;","u",listOf("Z"),"V",flags,3,"""
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_NATIVE_ENTRY_OPEN,"")}
        move-result v0
        if-nez v0, :done
        invoke-virtual {p0, p1}, Lpsi;->morpheSharedStock_u(Z)V
        :done
        return-void
    """.trimIndent())
    state.addInstructions(write.index,"""
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_NATIVE_ENTRY_STATE,"v${registers.registerB}, v${registers.registerA}")}
        move-result v${registers.registerA}
    """.trimIndent())
}

internal fun installSharedCameraOcr(context:BytecodePatchContext){
    // Same keyboard transition used by OcrCaptureExtension after permission handoff.
    GboardFieldTarget("Lnyr;","g","Lagoo;").resolve(context)
    GboardFieldTarget("Laars;","b","Ladan;").resolve(context)
    GboardMethodTarget("Lagoq;","<init>",listOf("Lagoo;"),"V").resolve(context)
    GboardMethodTarget("Laars;","a",listOf("Lagoq;"),"Laars;").resolve(context)
    GboardMethodTarget("Lafae;","bT",listOf("Ladan;"),"V").resolve(context)
    val owner="Ltwm;"
    listOf("b" to "Landroid/content/Context;","c" to "Landroidx/camera/view/PreviewView;","f" to "Landroid/widget/TextView;","g" to "Landroid/widget/TextView;","h" to "Landroid/widget/ImageButton;","l" to "Landroid/widget/FrameLayout;","B" to "Landroid/widget/TextView;","A" to "Landroid/view/View;","C" to "Landroid/view/View;","d" to "Landroid/view/View;","z" to "Landroid/view/View;","r" to "Lcia;","u" to "Z","x" to "I").forEach{(name,type)->GboardFieldTarget(owner,name,type).resolve(context)}
    listOf(GboardMethodTarget(owner,"b",listOf("Ljava/lang/String;"),"V"),GboardMethodTarget(owner,"j",listOf("Ljava/lang/String;"),"V"),GboardMethodTarget(owner,"d",emptyList(),"V"),GboardMethodTarget(owner,"i",emptyList(),"V"),GboardMethodTarget("Lcia;","c",emptyList(),"V")).forEach{it.resolve(context)}
    // Use separate wrapper frames so original methods may reuse parameter registers safely.
    for((name,params,call) in listOf(Triple("g",listOf("Landroid/view/inputmethod/EditorInfo;","Ljava/lang/Object;"),RuntimeCallId.SHARED_CAMERA_OCR_BIND),Triple("e",emptyList<String>(),RuntimeCallId.SHARED_CAMERA_OCR_BIND),Triple("h",emptyList<String>(),RuntimeCallId.SHARED_CAMERA_OCR_CLEAR))){
        val method=GboardMethodTarget(owner,name,params,"V").resolve(context)
        val flags=method.accessFlags;method.name="morpheSharedStock_"+name
        val hook=RuntimeCallEmitter.invoke(call,"p0")
        val descriptor=params.joinToString("")
        val original=if(params.isEmpty())"invoke-virtual {p0}, $owner->${method.name}()V" else "invoke-virtual/range {p0 .. p${params.size}}, $owner->${method.name}($descriptor)V"
        if(name=="e")context.addHelperMethodIfMissing(owner,name,params,"V",flags,2,"""
            ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_CAMERA_OCR_KEEP_RESULT,"p0")}
            move-result v0
            if-nez v0, :done
            $original
            $hook
            :done
            return-void
        """.trimIndent())
        else context.addHelperMethodIfMissing(owner,name,params,"V",flags,params.size+1,if(name=="h")"$hook\n$original\nreturn-void" else "$original\n$hook\nreturn-void")
    }
    GboardFieldTarget("Ltvy;","a",owner).resolve(context)
    val click=GboardMethodTarget("Ltvy;","onClick",listOf("Landroid/view/View;"),"V").resolve(context)
    val flags=click.accessFlags;click.name="morpheSharedStock_onClick"
    context.addHelperMethodIfMissing("Ltvy;","onClick",listOf("Landroid/view/View;"),"V",flags,3,"""
        iget-object v0, p0, Ltvy;->a:Ltwm;
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_CAMERA_OCR_CAPTURE,"v0")}
        move-result v0
        if-nez v0, :done
        invoke-virtual {p0, p1}, Ltvy;->morpheSharedStock_onClick(Landroid/view/View;)V
        :done
        return-void
    """.trimIndent())
}
