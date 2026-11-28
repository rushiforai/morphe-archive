package validation
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File

/** Must-alias dataflow: a menu hook must receive the original Object panel on every incoming path. */
private fun panelAliases(method: Method): List<Set<Int>?> {
    val code = method.implementation!!.instructions.toList()
    val offsets = mutableMapOf<Int, Int>()
    var offset = 0
    code.forEachIndexed { index, instruction -> offsets[offset] = index; offset += instruction.codeUnits }
    check(AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;"))
    val states = MutableList<Set<Int>?>(code.size) { null }
    states[0] = setOf(method.implementation!!.registerCount - 1)
    val pending = ArrayDeque<Int>(); pending.add(0)
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        val instruction = code[index]
        val after = states[index]!!.toMutableSet()
        if (instruction.opcode.setsRegister() && instruction.opcode != com.android.tools.smali.dexlib2.Opcode.CHECK_CAST) {
            val destination = (instruction as OneRegisterInstruction).registerA
            val copied = instruction.opcode in listOf(com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT,
                com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT_FROM16, com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT_16) &&
                (instruction as TwoRegisterInstruction).registerB in after
            after.remove(destination)
            if (copied) after.add(destination)
        }
        check(instruction.opcode !in listOf(com.android.tools.smali.dexlib2.Opcode.PACKED_SWITCH,
            com.android.tools.smali.dexlib2.Opcode.SPARSE_SWITCH)) { "Menu dataflow needs an audited switch successor" }
        val successors = mutableListOf<Int>()
        if (instruction is OffsetInstruction) successors.add(offsets.getValue(offsets.entries.single { it.value == index }.key + instruction.codeOffset))
        if (!instruction.opcode.name.startsWith("GOTO") && !instruction.opcode.name.startsWith("RETURN") &&
            instruction.opcode != com.android.tools.smali.dexlib2.Opcode.THROW && index + 1 < code.size) successors.add(index + 1)
        for (next in successors) {
            val merged = states[next]?.intersect(after) ?: after.toSet()
            if (states[next] != merged) { states[next] = merged; pending.add(next) }
        }
    }
    return states
}

private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> error("Expected an invoke with typed argument registers")
}

private fun auditPlayerControlsVisibility(classes: Map<String, ClassDef>, nativeMethods: List<Method>, hook: String) {
    val official = "Lapp/morphe/extension/youtube/patches/PlayerControlsVisibilityHookPatch;"
    fun Instruction.reference() = (this as? ReferenceInstruction)?.reference
    fun Instruction.calls(owner: String, name: String): Boolean {
        val reference = reference() as? MethodReference ?: return false
        return reference.definingClass == owner && reference.name == name
    }
    val constructor = nativeMethods.single { method ->
        method.implementation?.instructions?.any { it.calls(hook, "onPlayerControlsVisibility") } == true
    }
    check(constructor.name == "<init>")
    val impl = constructor.implementation!!
    val code = impl.instructions.toList()
    val addonIndex = code.indices.single { code[it].calls(hook, "onPlayerControlsVisibility") }
    val officialIndex = code.indices.single { code[it].calls(official, "setPlayerControlsVisibility") }
    val getterCall = code[addonIndex - 2].reference() as MethodReference
    val owner = classes.getValue(constructor.definingClass)
    val getter = owner.methods.single { it.toString() == getterCall.toString() }
    val getterCode = getter.implementation!!.instructions.toList()
    val field = getterCode.single { it.opcode == Opcode.IGET }.reference()
    val mapper = getterCode.single { it.opcode == Opcode.INVOKE_STATIC }.reference()
    val states = classes.getValue(getter.returnType).methods.flatMap { method ->
        method.implementation?.instructions?.mapNotNull { (it.reference() as? StringReference)?.string }.orEmpty()
    }
    check(listOf("HIDDEN", "WILL_SHOW", "SHOWN", "WILL_HIDE").all { "PLAYER_CONTROLS_VISIBILITY_$it" in states })
    val thisRegister = impl.registerCount - 1 - constructor.parameterTypes.sumOf { type: CharSequence ->
        if (type.toString() in listOf("J", "D")) 2 else 1
    }
    check(getter.name == "getPlayerControlsVisibility" && getter.parameterTypes.isEmpty())
    check(code[addonIndex - 2].opcode == Opcode.INVOKE_VIRTUAL_RANGE)
    check(code[addonIndex - 2].argumentRegisters() == listOf(thisRegister))
    check(code[addonIndex - 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    check(code[addonIndex].argumentRegisters() == listOf((code[addonIndex - 1] as OneRegisterInstruction).registerA))
    check(code[addonIndex + 1].opcode == Opcode.RETURN_VOID && addonIndex > officialIndex)
    check(code[officialIndex - 4].opcode == Opcode.IPUT_OBJECT)
    check(code[officialIndex - 3].opcode == Opcode.IGET && code[officialIndex - 3].reference() == field)
    check(code[officialIndex - 2].opcode == Opcode.INVOKE_STATIC && code[officialIndex - 2].reference() == mapper)
    check(code[officialIndex - 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    val nativeInput = (code[officialIndex - 4] as TwoRegisterInstruction).registerA
    val officialRead = code[officialIndex - 3] as TwoRegisterInstruction
    check(officialRead.registerA == nativeInput && officialRead.registerB == nativeInput)
    check(code[officialIndex - 2].argumentRegisters() == listOf(nativeInput))
    check((code[officialIndex - 1] as OneRegisterInstruction).registerA == nativeInput)
    check(code[officialIndex].argumentRegisters() == listOf(nativeInput))
    println("PLAYER_CONTROLS_VISIBILITY_PASS constructor=$constructor native_enum=${getter.returnType} official=1 addon=1")
}

/** Read-only verification of generated DEX and the native hook operands. */
fun main(args:Array<String>){
    val file=File(args[0]);val container=DexFileFactory.loadDexContainer(file,Opcodes.getDefault())
    val classes=mutableMapOf<String,ClassDef>()
    container.dexEntryNames.forEach { name->container.getEntry(name)!!.dexFile.classes.forEach { cls->check(classes.put(cls.type,cls)==null){"Duplicate class ${cls.type}"} } }
    val support=classes.getValue("Lapp/yydarlinker/aicaptions/host/CaptionAddonSupport;")
    val flags=support.methods.filter { it.name.endsWith("Installed") }.associate { method -> method.name to method.implementation!!.instructions.filterIsInstance<WideLiteralInstruction>().single().wideLiteral }
    println("FEATURES=$flags")
    val forbiddenStrings=listOf("ngPkbaZliaU","b7_354_387","zero bezels","all right this is a big smartphone")
    for(cls in classes.values.filter { it.type.startsWith("Lapp/yydarlinker/aicaptions/") })for(method in cls.methods) {
        for(ins in method.implementation?.instructions?:emptyList()) {
            val string=(ins as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference
            check(string==null || forbiddenStrings.none { bad->string.string.contains(bad,true) }){"N30 video-specific production condition in "+cls.type}
            val literal=(ins as? WideLiteralInstruction)?.wideLiteral
            check(literal !in listOf(112140L,127282L,381L)){"N30 sample-specific numeric literal in "+cls.type+"->"+method.name}
        }
    }
    println("N30_PRODUCTION_SPECIFICITY_PASS fixture_ids_text_times=0")
    val hostHooks=mutableMapOf<String,Int>()
    classes.values.filterNot { it.type.startsWith("Lapp/yydarlinker/") }.forEach { cls -> cls.methods.forEach { m ->
        m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.forEach { ins ->
            val r=ins.reference as? MethodReference
            if(r!=null && r.definingClass.startsWith("Lapp/yydarlinker/aicaptions/"))hostHooks[r.name]=(hostHooks[r.name]?:0)+1
        }
    } }
    println("HOST_HOOKS=$hostHooks")
    if(flags["aiInstalled"]==1L) {
        val clockApi=classes.getValue("Lapp/morphe/extension/youtube/addon/AddOnApi;")
        val clock=clockApi.methods.single { it.name=="videoTimeChanged" && it.parameterTypes.map { p->p.toString() }==listOf("J") && it.returnType=="V" }
        check(AccessFlags.PUBLIC.isSet(clock.accessFlags) && AccessFlags.STATIC.isSet(clock.accessFlags))
        val dispatch=classes.values.filterNot { it.type.startsWith("Lapp/morphe/") || it.type.startsWith("Lapp/yydarlinker/") }
            .flatMap { it.methods.toList() }.single { method -> method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {
                val call=it.reference as? MethodReference
                call?.definingClass=="Lapp/yydarlinker/aicaptions/host/AiCaptionHook;" && call.name=="onVideoTime"
            }==true }
        val clockCode=dispatch.implementation!!.instructions.toList()
        val tickIndex=clockCode.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="onVideoTime" }
        val apiCall=(clockCode[tickIndex+1] as ReferenceInstruction).reference as MethodReference
        check(apiCall.toString()==clock.toString()) { "AI clock must observe the official public clock dispatch" }
        val tick=clockCode[tickIndex].argumentRegisters()
        check(tick.size==2 && tick[1]==tick[0]+1 && tick==clockCode[tickIndex+1].argumentRegisters()) {
            "AI and official clocks must receive the same unmodified long"
        }
        val clockOffsets=IntArray(clockCode.size);var clockOffset=0
        clockCode.forEachIndexed { index,instruction -> clockOffsets[index]=clockOffset;clockOffset+=instruction.codeUnits }
        clockCode.forEachIndexed { index,instruction ->
            if(instruction is OffsetInstruction) check(clockOffsets[index]+instruction.codeOffset!=clockOffsets[tickIndex+1]) {
                "Native branch bypasses AI clock observation"
            }
        }
        check(hostHooks["onVideoTime"]==1)
        println("PUBLIC_CLOCK_PROVENANCE_PASS dispatch=$dispatch same_long=true branches_preserved=true")
        val ports=classes.getValue("Lapp/yydarlinker/aicaptions/host/CaptionRuntimePorts;")
        check(ports.methods.none { it.name in listOf("stopped","sessionOpened","suppressNative") }) {
            "Engine lifecycle must leave player ownership and the draw switch intact"
        }
        println("ENGINE_PLAYER_LIFECYCLE_PASS default_callbacks=3")
        val shorts=classes.getValue("Lapp/morphe/extension/youtube/shared/ShortsPlayerState;")
        val publicSetter=shorts.methods.single { it.name=="setOpen" && AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map { p->p.toString() }==listOf("Z") }
        val delegate=publicSetter.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }.filter { it.name=="setOpen" && it.parameterTypes.map { p->p.toString() }==listOf("Z") }.singleOrNull()
        val setter=if(delegate==null)publicSetter else classes.getValue(delegate.definingClass).methods.single {
            it.name==delegate.name && it.parameterTypes==delegate.parameterTypes && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val code=setter.implementation!!.instructions.toList()
        val returns=code.indices.filter { code[it].opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID }
        check(returns.isNotEmpty())
        for(index in returns){
            val call=(code.getOrNull(index-1) as? ReferenceInstruction)?.reference as? MethodReference
            check(call?.definingClass=="Lapp/yydarlinker/aicaptions/settings/CaptionQuickToggle;" && call.name=="onShortsStateChanged"){
                "Every official Shorts setter return must notify the caption lifecycle"
            }
        }
        val quick=classes.getValue("Lapp/yydarlinker/aicaptions/settings/CaptionQuickToggle;")
        val read=quick.methods.single { it.name=="shortsOpen" }.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
        check(read.any { it.definingClass=="Lapp/morphe/extension/youtube/shared/ShortsPlayerState;" && it.name=="isOpen" })
        println("N72_SHORTS_LIFECYCLE_PASS returns=${returns.size} official_state_read=true setter=${setter.definingClass}")
        val hook=classes.getValue("Lapp/yydarlinker/aicaptions/host/AiCaptionHook;")
        val entries=setOf("onPlayerType","onVideoId","onVideoTime","onNativeCaptionButtonController","onTimedTextRequest",
            "onPlayerControlsVisibility")
        val nativeMethods=classes.values.filterNot { it.type.startsWith("Lapp/yydarlinker/") }
            .flatMap { it.methods.toList() }
        val hookCalls=nativeMethods.flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }
            .filter { it.definingClass==hook.type }
        check(hookCalls.size==entries.size && hookCalls.map { it.name }.toSet()==entries)
        auditPlayerControlsVisibility(classes, nativeMethods, hook.type)
        val requestCode=nativeMethods.map { it.implementation?.instructions?.toList().orEmpty() }.single { code ->
            code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="onTimedTextRequest" }
        }
        val requestIndex=requestCode.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="onTimedTextRequest"
        }
        val builderIndex=requestCode.indices.first { index ->
            val call=(requestCode[index] as? ReferenceInstruction)?.reference as? MethodReference
            index>requestIndex && call?.definingClass=="Lorg/chromium/net/CronetEngine;" &&
                call.name=="newUrlRequestBuilder"
        }
        val arguments=requestCode[requestIndex].argumentRegisters()
        check(requestCode[builderIndex].argumentRegisters().take(2)==arguments) {
            "Timed Text observation must leave the engine and original URL registers intact"
        }
        // The official Captions patch can inspect the URL here before Cronet consumes it.
        check(requestCode.subList(requestIndex+1,builderIndex).none { instruction ->
            if(!instruction.opcode.setsRegister()) false
            else {
                val destination=(instruction as OneRegisterInstruction).registerA
                destination in arguments || instruction.opcode.setsWideRegister() && destination+1 in arguments
            }
        }) { "An intermediate instruction overwrote a Timed Text argument" }
        println("HOST_ENTRY_PASS single_class=true timed_text_arguments_unchanged=true")
    }
    val requiredAI=flags["aiInstalled"]==1L || (hostHooks["onTimedTextRequest"]?:0)>0 || (hostHooks["onMenu"]?:0)>0
    if(requiredAI) {
        val required=listOf("onMenu","observeMenuPath","suppressNativeDraw","initialize","onNativeTrackApplied","onTimedTextRequest")
        val missing=required.filter { (hostHooks[it]?:0)!=1 }
        check(missing.isEmpty()) { "AI finalizer incomplete: missing/nonunique host hooks ${missing.map { it+"="+(hostHooks[it]?:0) }}" }
        check(flags["aiInstalled"]==1L) { "AI finalizer incomplete: immutable installation permission not published" }
        // The quick-toggle hook must pass the live panel register and the index the divider uses.
        // 1.48's VideoDelay row turns p0 into a Boolean scratch before this point, so p0 was wrong.
        val flyout=classes.getValue("Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;")
        // Resolve the actual serialized target, including the one-argument 2.3 API and the
        // older indexed API. A source-only signature check would miss an invalid DEX invoke.
        val containerCode=classes.getValue("Lapp/yydarlinker/aicaptions/settings/CaptionQuickToggle;").methods
            .single { it.name=="nativeContainer" }.implementation!!.instructions.toList()
        val infoInvoke=containerCode.filterIsInstance<ReferenceInstruction>().single {
            (it.reference as? MethodReference)?.let { ref -> ref.definingClass==flyout.type && ref.name=="getFlyoutMenuInfo" }==true
        }
        val infoRef=infoInvoke.reference as MethodReference
        val info=flyout.methods.single { it.toString()==infoRef.toString() }
        val infoParams=info.parameterTypes.map { it.toString() }
        check(infoParams in listOf(listOf("Ljava/lang/Object;"),listOf("Ljava/lang/Object;","I")))
        check(AccessFlags.PUBLIC.isSet(info.accessFlags) && AccessFlags.STATIC.isSet(info.accessFlags))
        check((infoInvoke as Instruction).argumentRegisters().size==infoParams.size) { "Menu info invoke argument count mismatch" }
        val containerRef=containerCode.filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }
            .single { it.name=="menuContainer" }
        check(containerRef.definingClass==info.returnType && containerRef.returnType=="Landroid/widget/LinearLayout;")
        check(classes.getValue(info.returnType).methods.any { it.toString()==containerRef.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) })
        println("QUICK_TOGGLE_CONTAINER_PASS parameters=$infoParams typed_container=true")
        val menuBody=flyout.methods.single { method -> method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {
            val call=it.reference as? MethodReference
            call?.name=="onMenu" && call.definingClass=="Lapp/yydarlinker/aicaptions/settings/CaptionQuickToggle;"
        }==true }
        val menuCode=menuBody.implementation!!.instructions.toList()
        val onMenuIndex=menuCode.indexOfFirst { ins ->
            ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.name=="onMenu" && it.definingClass.startsWith("Lapp/yydarlinker/aicaptions/") }==true
        }
        check(onMenuIndex>=0){"quick toggle onMenu hook missing"}
        val onMenu=menuCode[onMenuIndex] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        val guard=menuCode[onMenuIndex+2] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
        val dividerIndex=menuCode.indices.single { index ->
            val call=(menuCode[index] as? ReferenceInstruction)?.reference as? MethodReference
            index>onMenuIndex && call?.definingClass==flyout.type && call.name in listOf("addDivider","addFlyoutMenuItem")
        }
        val divider=menuCode[dividerIndex].argumentRegisters()
        val dividerRef=(menuCode[dividerIndex] as ReferenceInstruction).reference as MethodReference
        val aliases=panelAliases(menuBody)
        check(onMenu.registerCount==2 && onMenu.registerC in aliases[onMenuIndex].orEmpty()) {
            "quick toggle panel is not the original Object on every incoming path"
        }
        check(divider.first() in aliases[dividerIndex].orEmpty()) { "Official divider lost the original Object panel" }
        check(onMenu.registerD==guard.registerA){"quick toggle index register must be the divider guard register"}
        check(divider[if(dividerRef.name=="addDivider")1 else 4]==guard.registerA) { "Divider must consume the updated insertion index" }
        println("QUICK_TOGGLE_REGISTERS_PASS panel=v${onMenu.registerC} index=v${onMenu.registerD} live_object_all_paths=true")
        val renderer=classes.getValue("Lcom/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView;")
        val draw=renderer.methods.filter { it.name=="draw" && it.parameterTypes.map { t->t.toString() }==listOf("Landroid/graphics/Canvas;") && it.returnType=="V" }.singleOrNull()
        check(draw!=null) { "AI finalizer incomplete: SubtitleWindowView.draw missing/nonunique" }
        val dc=draw!!.implementation!!.instructions.toList()
        check(dc.filterIsInstance<ReferenceInstruction>().any { (it.reference as? MethodReference)?.name=="suppressNativeDraw" })
        check(dc.any { it.opcode==com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER })
        val attach=renderer.methods.single { it.name=="onAttachedToWindow" && it.parameterTypes.isEmpty() }
        val attachCode=attach.implementation!!.instructions.toList()
        val attachReturns=attachCode.indices.filter { attachCode[it].opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID }
        check(attachReturns.isNotEmpty() && attachReturns.all { index ->
            val hook=(attachCode.getOrNull(index-1) as? ReferenceInstruction)?.reference as? MethodReference
            hook?.name=="onNativeRendererAttached" &&
                attachCode[index-1].argumentRegisters()==listOf(attach.implementation!!.registerCount-1)
        }) { "The draw switch must invalidate each attached native window" }
        val filter=classes.getValue("Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;")
        val detector=filter.methods.filter { it.name=="isFiltered" }.single()
        val params=detector.parameterTypes.map { it.toString() };val bytes=params.indexOf("[B");val path=params.getOrNull(bytes-1)
        check(bytes>0 && path in listOf("Ljava/lang/String;","Ljava/lang/CharSequence;")) { "Unsupported serialized menu path: $params" }
        val observer=detector.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }.single { it.name=="observeMenuPath" }
        check(observer.parameterTypes.map { it.toString() }==listOf("Ljava/lang/CharSequence;","[B")) {
            "Menu path observer must accept both String and CharSequence paths"
        }
        val instruction=detector.implementation!!.instructions.first() as com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
        val parameterWords=(if(AccessFlags.STATIC.isSet(detector.accessFlags))0 else 1)+params.sumOf { if(it in listOf("J","D"))2 else 1 }
        val expectedStart=detector.implementation!!.registerCount-parameterWords+(if(AccessFlags.STATIC.isSet(detector.accessFlags))0 else 1)+params.take(bytes-1).sumOf { if(it in listOf("J","D"))2 else 1 }
        check(instruction.startRegister==expectedStart && instruction.registerCount==2) { "Menu observer parameter register mismatch" }
        check(listOf("onNativeSelection","onNativeSelectionWithReason","onNativeSelectionApplied","rewriteUrl")
            .none { it in hostHooks }) { "Retired caption hook still injected" }
        println("AI_FINALIZER_COMPLETE draw=1 menu=1 observer=1 initialize=1 selection=1 path=$path registers=$expectedStart")
    }
    if(!requiredAI) return
    // Trace the owner to the host's named videoId builder property.
    val nativeBridge=classes.getValue("Lapp/yydarlinker/aicaptions/host/NativeCaptionBridge;")
    val appliedInstructions=nativeBridge.methods.single { it.name=="onNativeTrackApplied" }.implementation!!.instructions.toList()
    val appliedRefs=appliedInstructions.filterIsInstance<ReferenceInstruction>().map { it.reference }.toList()
    check(appliedRefs.filterIsInstance<MethodReference>().any { it.definingClass==nativeBridge.type && it.name=="nativeModelVideo" }){
        "Caption ownership must come from the model videoId, not the event playback identifier"
    }
    check(appliedRefs.filterIsInstance<com.android.tools.smali.dexlib2.iface.reference.FieldReference>().none { it.type=="Ljava/lang/String;" }){
        "Applied bridge must not read the unverified event String"
    }
    val accessorCall=appliedInstructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="nativeModelVideo"
    }
    check(appliedInstructions[accessorCall+1].opcode==com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT)
    val resultRegister=(appliedInstructions[accessorCall+1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    val runtimeCall=appliedInstructions[accessorCall+2] as com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
    check(((runtimeCall as ReferenceInstruction).reference as MethodReference).name=="onNativeAppliedEvent")
    check(runtimeCall.registerCount==6&&runtimeCall.startRegister+5==resultRegister){"Model getter result must be the runtime owner argument"}
    val sharedDispatchers=classes.values.filterNot { it.type.startsWith("Lapp/yydarlinker/") }.flatMap { it.methods.toList() }.filter { m ->
        m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {
            val r=it.reference as? MethodReference;r?.definingClass==nativeBridge.type&&r.name=="onNativeTrackApplied"
        }==true
    }
    check(sharedDispatchers.size==1){"AI needs exactly one shared applied-track dispatcher"}
    val shared=sharedDispatchers.single();val sharedCode=shared.implementation!!.instructions.toList()
    val captureIndex=sharedCode.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="onNativeTrackApplied" }
    val nextCall=(sharedCode[captureIndex+1] as? ReferenceInstruction)?.reference as? MethodReference
    check(nextCall?.definingClass==shared.definingClass&&nextCall.returnType=="V"&&nextCall.parameterTypes.last().toString()=="Z")
    val committed=sharedCode.filter { it.opcode==com.android.tools.smali.dexlib2.Opcode.IPUT_OBJECT }
        .filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference }
        .filter { it.definingClass==shared.definingClass&&it.type==nextCall!!.parameterTypes.first().toString() }.distinctBy { it.toString() }.single()
    check(appliedRefs.any { it.toString()==committed.toString() })
    val sharedCallers=classes.getValue(shared.definingClass).methods.filter { m->
        m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any { it.reference.toString()==shared.toString() }==true
    }
    check(sharedCallers.any { it.parameterTypes.size==2 }&&sharedCallers.any { it.parameterTypes.size==3 })
    val offsets=IntArray(sharedCode.size);var positionShared=0
    sharedCode.forEachIndexed { i,ins->offsets[i]=positionShared;positionShared+=ins.codeUnits }
    sharedCode.forEachIndexed { i,ins->
        val branch=ins as? com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
        if(branch!=null)check(offsets[i]+branch.codeOffset!=offsets[captureIndex+1]){"Shared branch bypasses caption capture"}
    }
    println("SHARED_APPLIED_DISPATCH_PASS ai=${flags["aiInstalled"]}")
    val modelAccessor=nativeBridge.methods.single { it.name=="nativeModelVideo" }.implementation!!.instructions
        .filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }.single()
    val model=classes.getValue(modelAccessor.definingClass)
    val getter=model.methods.single { it.name==modelAccessor.name }
    check(getter.name=="patch_captionModelVideoId")
    check(AccessFlags.PUBLIC.isSet(getter.accessFlags)&&AccessFlags.PUBLIC.isSet(model.accessFlags))
    val getterCode=getter.implementation!!.instructions.toList()
    check(getterCode.size==2&&getterCode[0].opcode==com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT&&getterCode[1].opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT)
    check((getterCode[0] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA==
        (getterCode[1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA)
    val ownerField=getter.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference }.single()
    val feedsVideoId=model.methods.any { method ->
        val code=method.implementation?.instructions?.toList()?:emptyList()
        code.indices.any { i ->
            if((code[i] as? ReferenceInstruction)?.reference?.toString()!=ownerField.toString())false else {
                val setter=(code.getOrNull(i+1) as? ReferenceInstruction)?.reference as? MethodReference
                val target=setter?.let { r->classes[r.definingClass]?.methods?.singleOrNull { it.name==r.name && it.parameterTypes==r.parameterTypes } }
                val read=code[i] as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
                val call=code.getOrNull(i+1) as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                read!=null&&call!=null&&call.registerCount==2&&read.registerA==call.registerD&&
                target?.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {
                    (it.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string=="Null videoId"
                }==true
            }
        }
    }
    check(feedsVideoId){"Model owner does not feed the named native videoId property"}
    println("NATIVE_VIDEO_OWNER_PROVENANCE_PASS field=$ownerField event_string_unused=true")
    println("DEX_AUDIT_PASS classes=${classes.size}")
}
