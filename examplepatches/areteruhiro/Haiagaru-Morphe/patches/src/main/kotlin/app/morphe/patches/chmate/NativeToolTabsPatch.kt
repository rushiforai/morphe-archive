package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Reuse native type-4 pages, stable IDs, selection and serialization rather than adding a second tab bar. */
internal fun BytecodePatchContext.patchNativeToolTabs(version: String) {
    val config=when(version){
        "0.8.10.191 dev"->listOf("Lo/r8lambdaBjbaKVYCk6JekZq3TlN9Kg2pYOk;","Sw_","Lo/MediationServiceImpldExternalSyntheticLambda0;","Lo/onAppOpenAdLoaded;","Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;")
        "0.8.10.226 dev"->listOf("Lo/Yy;","instantiateItem","Lo/Kjv;","Lo/setFallbackResource;","Lo/redirect;")
        "0.8.10.242 dev"->listOf("Lo/zzfm;","a","Lo/zzeq;","Ljp/syoboi/a2chMate/fragment/WebViewFragment;","Lo/CustomEventAdapter;")
        else->return
    }
    val (owner,name,page,web,base)=config
    val factory=mutableClassDefBy(owner).methods.single{it.name==name&&it.parameterTypes.map(CharSequence::toString)==listOf("Landroid/view/ViewGroup;","I")&&it.returnType=="Ljava/lang/Object;"}
    val code=factory.implementation!!.instructions.toList()
    val create=code.withIndex().single{(_,i)->i.opcode==Opcode.NEW_INSTANCE&&((i as? ReferenceInstruction)?.reference as? TypeReference)?.type==web}
    val dest=(create.value as OneRegisterInstruction).registerA
    val ctor=(code[create.index+1] as ReferenceInstruction).reference as MethodReference
    check(ctor.definingClass==web&&ctor.name=="<init>"&&ctor.parameterTypes.isEmpty())
    val row=code.first{it.opcode==Opcode.CHECK_CAST&&((it as? ReferenceInstruction)?.reference as? TypeReference)?.type==page}
    val pageRegister=(row as OneRegisterInstruction).registerA
    check(dest!=pageRegister)
    val fragment=mutableClassDefBy("Lapp/morphe/extension/chmate/NativeToolFragment;")
    check(fragment.superclass=="Landroid/app/Fragment;")
    check(mutableClassDefBy(base).methods.any{it.name=="<init>"&&it.parameterTypes.isEmpty()})
    fragment.setSuperClass(base)
    var changed=0
    fragment.methods.forEach{method->
        method.implementation?.instructions?.toList()?.forEachIndexed{index,i->
            val ref=(i as? ReferenceInstruction)?.reference as? MethodReference
            if(ref?.definingClass=="Landroid/app/Fragment;"){
                val op=when(i.opcode){
                    Opcode.INVOKE_SUPER->"invoke-super"
                    Opcode.INVOKE_DIRECT->"invoke-direct"
                    Opcode.INVOKE_VIRTUAL->"invoke-virtual"
                    Opcode.INVOKE_SUPER_RANGE->"invoke-super/range"
                    Opcode.INVOKE_DIRECT_RANGE->"invoke-direct/range"
                    Opcode.INVOKE_VIRTUAL_RANGE->"invoke-virtual/range"
                    else->error("Unexpected Fragment reference: ${i.opcode} $ref")
                }
                val registers=if(i is RegisterRangeInstruction)"v${i.startRegister} .. v${i.startRegister+i.registerCount-1}" else{
                    val r=i as FiveRegisterInstruction
                    listOf(r.registerC,r.registerD,r.registerE,r.registerF,r.registerG).take(r.registerCount).joinToString(", "){"v$it"}
                }
                val owner=if(method.name=="onViewCreated")"Landroidx/fragment/app/Fragment;" else base
                method.replaceInstruction(index,"$op {$registers}, ${ref.toString().replace("Landroid/app/Fragment;",owner)}")
                changed++
            }
        }
    }
    check(changed>=5){"Native tool Fragment lifecycle anchors missing"}
    factory.replaceInstruction(create.index,"invoke-static/range {v$pageRegister .. v$pageRegister}, Lapp/morphe/extension/chmate/NativeToolTabs;->createFragment(Ljava/lang/Object;)Ljava/lang/Object;")
    factory.replaceInstruction(create.index+1,"move-result-object v$dest")
    factory.addInstructions(create.index+2,"check-cast v$dest, $base")
    val tools=mutableClassDefBy("Lapp/morphe/extension/chmate/NativeToolTabs;")
    val stock=tools.methods.single{it.name=="stockFragment"&&it.parameterTypes.isEmpty()}
    tools.methods.remove(stock)
    tools.methods.add(MutableMethod(ImmutableMethod(tools.type,stock.name,stock.parameters,stock.returnType,stock.accessFlags,stock.annotations,stock.hiddenApiRestrictions,
        ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            new-instance v0, $web
            invoke-direct {v0}, $web-><init>()V
            return-object v0
        """.trimIndent())
    })
    val ready=tools.methods.single{it.name=="supported"&&it.parameterTypes.isEmpty()}
    val readyCode=ready.implementation!!.instructions.toList()
    check(readyCode.size==2&&readyCode.last().opcode==Opcode.RETURN)
    ready.replaceInstruction(0,"const/4 v${(readyCode.last() as OneRegisterInstruction).registerA}, 0x1")
    // Intercept at the Activity boundary: a non-focusable tool pane does not receive BACK keys.
    val tablet=mutableClassDefBy("Ljp/syoboi/a2chMate/activity/TabletHomeActivity;")
    val legacyGesture=version=="0.8.10.191 dev"
    val middleGesture=version=="0.8.10.226 dev"
    val gestureType=when {
        legacyGesture -> "Lo/qgExternalSyntheticLambda1\$write;"
        middleGesture -> "Lo/TTVideoLandingPageActivity\$RemoteActionCompatParcelizer;"
        else -> "Lo/zzbfh\$RemoteActionCompatParcelizer;"
    }
    val selectCall=when {
        legacyGesture -> "Ljp/syoboi/a2chMate/activity/TabletHomeActivity\$read;->d(I)Z"
        middleGesture -> "Lo/GNk;->c(I)V"
        else -> "Lo/zzev;->e(I)V"
    }
    run {
        for(name in listOf("b",if(legacyGesture)"e" else if(middleGesture)"c" else "d")){
            val gesture=tablet.methods.single{
                it.name==name&&it.returnType=="Z"&&it.parameterTypes.map(CharSequence::toString)==
                    listOf("Landroidx/fragment/app/Fragment;",gestureType)
            }
            val calls=gesture.implementation!!.instructions.withIndex().filter{(_,ins)->
                (ins as? ReferenceInstruction)?.reference.toString()==selectCall
            }
            check(calls.size==(if(name=="b"||legacyGesture)2 else 4))
            for((index,ins) in calls.take(2).asReversed()){
                val call=ins as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                val ownerRegister=call.registerC
                val indexRegister=call.registerD
                gesture.addInstructions(index,"""
                    invoke-static {v$ownerRegister, v$indexRegister}, Lapp/morphe/extension/chmate/NativeTabGroups;->gestureTarget(Ljava/lang/Object;I)I
                    move-result v$indexRegister
                """.trimIndent())
            }
        }
    }
    val dispatch=tablet.methods.singleOrNull{it.name=="dispatchKeyEvent"&&it.parameterTypes.map(CharSequence::toString)==listOf("Landroid/view/KeyEvent;")}
    val delegate=dispatch?.let{MutableMethod(ImmutableMethod(tablet.type,"haiagaruNativeDispatchKeyEvent",it.parameters,it.returnType,it.accessFlags,it.annotations,it.hiddenApiRestrictions,it.implementation))}
    val wrapper=MutableMethod(ImmutableMethod(tablet.type,"dispatchKeyEvent",
        listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter("Landroid/view/KeyEvent;",emptySet(),null)),"Z",1,emptySet(),emptySet(),
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList())))
    val nativeCall=if(delegate!=null)"invoke-virtual {p0, p1}, $delegate" else "invoke-super {p0, p1}, ${tablet.superclass}->dispatchKeyEvent(Landroid/view/KeyEvent;)Z"
    wrapper.addInstructions(0,"""
        invoke-static {p0, p1}, Lapp/morphe/extension/chmate/NativeToolTabs;->dispatchArchiveBack(Landroid/app/Activity;Landroid/view/KeyEvent;)Z
        move-result v0
        if-eqz v0, :native_back
        return v0
        :native_back
        $nativeCall
        move-result v0
        return v0
    """.trimIndent())
    if(dispatch!=null)tablet.methods.remove(dispatch)
    if(delegate!=null)tablet.methods.add(delegate)
    tablet.methods.add(wrapper)
    // Keep native selection mapped to the group header when its members are collapsed.
    // No locals or original instructions are replaced.
    val tabStripTypes = mutableSetOf<String>()
    classDefForEach { cls ->
        if(cls.methods.any { it.name == "setAdapter" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/widget/ListAdapter;") } && cls.methods.any { it.name == "setTabMode" } && cls.methods.any { it.name == "setSelection" })
            tabStripTypes.add(cls.type)
    }
    check(tabStripTypes.size == 1) { "Native group tab strip anchor changed: $tabStripTypes" }
    val nativeStrip = mutableClassDefBy(tabStripTypes.single())
    val nativeSelection = nativeStrip.methods.single { it.name == "setSelection" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") }
    nativeSelection.addInstructions(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/NativeTabGroups;->nativeSelection(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p1
    """.trimIndent())
    // Add the grouping action to the native thread-tab long-press menu (the menu
    // that already contains Close and Board). Locate the Activity's call to its
    // native Menu/Fragment builder by descriptor so obfuscated method names can
    // differ between 191, 226 and 242 without changing the selected menu.
    val menuParam = "Landroid/view/Menu;"
    data class PopupMenuCall(val method: MutableMethod, val index: Int, val menuRegister: Int, val fragmentRegister: Int)
    val popupCalls = mutableListOf<PopupMenuCall>()
    tablet.methods.forEach { method ->
        // The tab callback has the native strip, selected position and page descriptor
        // as parameters. Other Activity menu preparation methods also call the same
        // Menu/Fragment helper, but do not have this tab callback shape.
        if (method.parameterTypes.size < 3 || "I" !in method.parameterTypes) return@forEach
        method.implementation?.instructions?.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
            val parameters = ref.parameterTypes.map(CharSequence::toString)
            if (parameters.size != 2 || parameters[0] != menuParam || !parameters[1].endsWith("Fragment;") || ref.returnType != "V") return@forEachIndexed
            if (ref.definingClass == "Landroid/view/Menu;" || ref.definingClass == "Landroidx/fragment/app/Fragment;") return@forEachIndexed
            val isStatic = instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
            val passed = when (instruction) {
                is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                else -> emptyList()
            }
            val firstParameter = if (isStatic) 0 else 1
            if (passed.size != parameters.size + firstParameter) return@forEachIndexed
            popupCalls += PopupMenuCall(method, index, passed[firstParameter], passed[firstParameter + 1])
        }
    }
    if (popupCalls.isEmpty()) {
        // In 191 the long-press callback is emitted as a separate listener class.
        // Resolve that call site by the same native tab callback shape rather than
        // changing or replacing the listener itself.
        data class RawPopupMenuCall(val owner: String, val name: String, val parameters: List<String>, val index: Int, val menuRegister: Int, val fragmentRegister: Int)
        val rawCalls = mutableListOf<RawPopupMenuCall>()
        classDefForEach { cls ->
            if (!cls.type.startsWith("Ljp/syoboi/a2chMate/activity/TabletHomeActivity$")) return@classDefForEach
            cls.methods.forEach { sourceMethod ->
                if (sourceMethod.parameterTypes.size != 2 || sourceMethod.parameterTypes[0] != nativeStrip.type || sourceMethod.parameterTypes[1] != "Ljava/lang/Object;") return@forEach
                sourceMethod.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
                    val parameters = ref.parameterTypes.map(CharSequence::toString)
                    if (parameters.size != 2 || parameters[0] != menuParam || !parameters[1].endsWith("Fragment;") || ref.returnType != "V") return@forEachIndexed
                    val isStatic = instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
                    val passed = when (instruction) {
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                        else -> emptyList()
                    }
                    val firstParameter = if (isStatic) 0 else 1
                    if (passed.size == parameters.size + firstParameter)
                        rawCalls += RawPopupMenuCall(cls.type, sourceMethod.name, sourceMethod.parameterTypes.map(CharSequence::toString), index, passed[firstParameter], passed[firstParameter + 1])
                }
            }
        }
        for (raw in rawCalls) {
            val method = mutableClassDefBy(raw.owner).methods.single { it.name == raw.name && it.parameterTypes.map(CharSequence::toString) == raw.parameters }
            popupCalls += PopupMenuCall(method, raw.index, raw.menuRegister, raw.fragmentRegister)
        }
    }
    check(popupCalls.size == 1) {
        "Expected one native thread-tab popup builder, found ${popupCalls.map { "${it.method}" }}"
    }
    val popupCall = popupCalls.single()
    check(popupCall.menuRegister < 16 && popupCall.fragmentRegister < 16) {
        "Native thread-tab popup arguments need low registers: $popupCall"
    }
    popupCall.method.addInstructions(popupCall.index + 1, """
        invoke-static {v${popupCall.menuRegister}, v${popupCall.fragmentRegister}}, Lapp/morphe/extension/chmate/NativeTabGroups;->addThreadGroupAction(Landroid/view/Menu;Ljava/lang/Object;)V
    """.trimIndent())
    // TabletHomeActivity's native popup sends custom tile selections through
    // onOptionsItemSelected instead of invoking MenuItem.OnMenuItemClickListener.
    // Route only our stable item ID through the extension before native dispatch.
    val itemDispatch = tablet.methods.single {
        it.name == "onOptionsItemSelected"
            && it.returnType == "Z"
            && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;")
    }
    val dispatchFirst = itemDispatch.implementation!!.instructions.first()
    val dispatchResult = itemDispatch.findFreeRegister(0)
    check(dispatchResult < 16) { "Native tab action dispatch requires low registers: $dispatchResult" }
    itemDispatch.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/NativeTabGroups;->dispatchThreadGroupAction(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v$dispatchResult
        if-eqz v$dispatchResult, :haiagaru_native_tab_action
        const/4 v$dispatchResult, 0x1
        return v$dispatchResult
    """.trimIndent(), ExternalLabel("haiagaru_native_tab_action", dispatchFirst))
    // Leave ChMate's blank/new-tab screen completely untouched. The chooser lives
    // in Haiagaru's existing settings instead of an independent button above it.
    println("Native tool tabs: $version -> $owner, optional/default off, native Fragment base $base; group action at ${popupCall.method.name}, click dispatch at ${itemDispatch.name}")
}
