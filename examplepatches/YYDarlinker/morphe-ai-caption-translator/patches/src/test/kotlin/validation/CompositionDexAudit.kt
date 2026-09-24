package validation
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File

/** Read-only verification of generated DEX, including the new native reselect invocation's access. */
fun main(args:Array<String>){
    val file=File(args[0]);val container=DexFileFactory.loadDexContainer(file,Opcodes.getDefault())
    val classes=mutableMapOf<String,ClassDef>()
    container.dexEntryNames.forEach { name->container.getEntry(name)!!.dexFile.classes.forEach { cls->check(classes.put(cls.type,cls)==null){"Duplicate class ${cls.type}"} } }
    val support=classes.getValue("Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;")
    val flags=support.methods.filter { it.name.endsWith("Installed") }.associate { method -> method.name to method.implementation!!.instructions.filterIsInstance<WideLiteralInstruction>().single().wideLiteral }
    println("FEATURES=$flags")
    // Type matching alone accepted amof.a in 1.2.5. Trace the value to the host's
    // named videoId builder property instead, including memory-only compositions.
    val nativeBridge=classes.getValue("Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;")
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
    // Shared host hook is required even when only language memory is installed.
    val sharedDispatchers=classes.values.filterNot { it.type.startsWith("Lapp/yydarlinker/") }.flatMap { it.methods.toList() }.filter { m ->
        m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {
            val r=it.reference as? MethodReference;r?.definingClass==nativeBridge.type&&r.name=="onNativeTrackApplied"
        }==true
    }
    check(sharedDispatchers.size==1){"Every composition needs exactly one shared applied-track dispatcher"}
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
    println("SHARED_APPLIED_DISPATCH_PASS ai=${flags["aiInstalled"]} memory=${flags["memoryInstalled"]}")
    val modelAccessor=nativeBridge.methods.single { it.name=="nativeModelVideo" }.implementation!!.instructions
        .filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }.single()
    val model=classes.getValue(modelAccessor.definingClass)
    val getter=model.methods.single { it.name==modelAccessor.name }
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
    if(flags["aiInstalled"]==1L){
        val bridge=classes.getValue("Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;")
        for(name in listOf("nativeTracks","translatedTracks")){
            val code=bridge.methods.single { it.name==name }.implementation!!.instructions.toList()
            val exits=code.indices.filter { code[it].opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT }
            check(exits.size==2&&((code[exits.first()-1] as? WideLiteralInstruction)?.wideLiteral==0L)){"Untyped null model return in $name"}
        }
        println("NATIVE_MODEL_ACCESSORS_TYPED=true")
        val reselect=bridge.methods.single { it.name=="selectNative" }
        val call=reselect.implementation!!.instructions.single { (it as? ReferenceInstruction)?.reference is MethodReference }
        val target=reselect.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }.single()
        val method=classes.getValue(target.definingClass).methods.single { it.name==target.name && it.parameterTypes==target.parameterTypes }
        val actualWords=when(call){
            is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction->call.registerCount
            is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction->call.registerCount
            else->error("Unexpected invocation form")
        }
        val expectedWords=1+target.parameterTypes.sumOf { if(it.toString() in listOf("J","D"))2 else 1 }
        check(actualWords==expectedWords){"Native selector argument mismatch: actual=$actualWords expected=$expectedWords"}
        check(AccessFlags.PUBLIC.isSet(classes.getValue(target.definingClass).accessFlags)){"Native selector owner not public"}
        check(AccessFlags.PUBLIC.isSet(method.accessFlags)){"Native selector is not public: $target flags=${method.accessFlags}"}
        println("NATIVE_RESELECT_PUBLIC=$target")
        // The menu selector is NOT used by automatic new-video restoration. Check the actual
        // generated host call graph rather than only counting that some selection hook exists.
        val selectorCode=method.implementation!!.instructions.toList()
        val dispatchRef=selectorCode.filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? MethodReference }
            .last { it.definingClass==target.definingClass && it.returnType=="V" && it.parameterTypes.size==1 }
        val dispatcher=classes.getValue(dispatchRef.definingClass).methods.single { it.name==dispatchRef.name && it.parameterTypes==dispatchRef.parameterTypes }
        val dispatchCode=dispatcher.implementation!!.instructions.toList()
        val applied=dispatchCode.indices.filter { i ->
            val r=(dispatchCode[i] as? ReferenceInstruction)?.reference as? MethodReference
            r?.definingClass==bridge.type && r.name=="onNativeTrackApplied"
        }
        check(applied.size==1){"Automatic new-video captions bypass addon capture: shared dispatcher has no applied-track hook"}
        val rendererIndex=dispatchCode.indexOfFirst {
            val r=(it as? ReferenceInstruction)?.reference as? MethodReference
            r?.definingClass==target.definingClass && r.returnType=="V" && r.parameterTypes.map { t->t.toString() }==listOf(target.parameterTypes[0].toString(),"Z")
        }
        check(rendererIndex>applied.single()){"Track must be captured before renderer/network starts"}
        val directCallers=classes.getValue(target.definingClass).methods.filter { m ->
            m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any { it.reference.toString()==dispatchRef.toString() }==true
        }
        check(directCallers.any { it.name!=method.name && it.parameterTypes.size==2 }){"Automatic model initializer must share the hooked dispatcher"}
        check(selectorCode.filterIsInstance<ReferenceInstruction>().none { (it.reference as? MethodReference)?.definingClass==bridge.type }){"Do not double-capture the menu-only path"}
        println("NATIVE_APPLIED_PATH_PASS dispatcher=$dispatchRef callers=${directCallers.map { it.name }} before_renderer=true")
        val appliedBridge=bridge.methods.single { it.name=="onNativeTrackApplied" }
        val appliedCode=appliedBridge.implementation!!.instructions.toList()
        val committedFields=dispatchCode.filter { it.opcode==com.android.tools.smali.dexlib2.Opcode.IPUT_OBJECT }
            .filterIsInstance<ReferenceInstruction>().mapNotNull { it.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference }
            .filter { it.definingClass==target.definingClass && it.type==target.parameterTypes[0].toString() }.distinctBy { it.toString() }
        check(committedFields.size==1)
        check(appliedCode.filterIsInstance<ReferenceInstruction>().any { it.reference.toString()==committedFields.single().toString() }){"Applied bridge must read final committed track, not raw requested track"}
        val positionsApplied=IntArray(dispatchCode.size);var addressApplied=0
        dispatchCode.forEachIndexed { i,ins->positionsApplied[i]=addressApplied;addressApplied+=ins.codeUnits }
        dispatchCode.forEach { ins ->
            val index=dispatchCode.indexOf(ins)
            val offset=ins as? com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
            if(offset!=null)check(positionsApplied[index]+offset.codeOffset!=positionsApplied[rendererIndex]){"Branch skips capture and enters renderer"}
        }
        println("NATIVE_APPLIED_FINAL_FIELD=true; RENDERER_BRANCHES_GUARDED=true")


        val menu=classes.getValue("Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;")
        val menuCode=menu.methods.single { it.name=="onMenu" }.implementation!!.instructions.toList()
        fun menuCall(i:Int)=((menuCode[i] as? ReferenceInstruction)?.reference as? MethodReference)?.name
        val addRow=menuCode.indices.single { menuCall(it)=="addNativeRow" }
        for(setting in listOf("flyoutMenuEnabled","shortsFlyoutMenuEnabled")){
            val checkIndex=menuCode.indices.single { menuCall(it)==setting }
            check(checkIndex<addRow){"Visibility setting must be read before menu insertion"}
        }
        for(preference in listOf("CaptionFlyoutPreference","CaptionShortsFlyoutPreference","ApiProfilesPreference")){
            val cls=classes.getValue("Lapp/yydarlinker/deepseekcaptions/$preference;")
            check(AccessFlags.PUBLIC.isSet(cls.accessFlags))
            check(cls.methods.any { it.name=="<init>"&&it.parameterTypes.map { t->t.toString() }==listOf("Landroid/content/Context;","Landroid/util/AttributeSet;") })
        }
        println("INDEPENDENT_FLYOUT_SETTINGS_PASS regular=true shorts=true xml_constructors=true")
        val dialogClass=classes.getValue("Lapp/morphe/extension/shared/ui/CustomDialog;")
        val createArgs=listOf("Landroid/content/Context;","Ljava/lang/CharSequence;","Ljava/lang/CharSequence;",
            "Landroid/widget/EditText;","Ljava/lang/CharSequence;","Ljava/lang/Runnable;","Ljava/lang/Runnable;",
            "Ljava/lang/CharSequence;","Ljava/lang/Runnable;","Z","Z")
        check(AccessFlags.PUBLIC.isSet(dialogClass.accessFlags))
        check(dialogClass.methods.any { it.name=="create" && it.parameterTypes.map { t->t.toString() }==createArgs
            && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
            && it.returnType=="Landroid/util/Pair;" }) { "Morphe dialog public adapter signature missing" }
        check(classes.getValue("Lapp/morphe/extension/shared/theme/ThemeUtils;").methods.any {
            it.name=="getAppForegroundColor" && it.parameterTypes.isEmpty() && it.returnType=="I" && AccessFlags.PUBLIC.isSet(it.accessFlags) })
        for(helper in listOf("CaptionSettingsDialogs","CaptionEditorViewport"))check(classes.containsKey("Lapp/yydarlinker/deepseekcaptions/$helper;"))
        println("PROFILE_DIALOG_HOST_API_PASS public_create_11=true theme_foreground=true viewport_helper=true")


        for(name in listOf("addNativeRow","topMenu","shortsOpen","dismissNative","nativeContainer"))check(menu.methods.single { it.name==name }.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().any())
        for(ins in menu.methods.single { it.name=="nativeContainer" }.implementation!!.instructions){
            val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference?:continue
            val owner=classes.getValue(ref.definingClass)
            val targetMethod=owner.methods.single { it.name==ref.name&&it.parameterTypes==ref.parameterTypes&&it.returnType==ref.returnType }
            check(AccessFlags.PUBLIC.isSet(owner.accessFlags)&&AccessFlags.PUBLIC.isSet(targetMethod.accessFlags)){"Inaccessible native menu-container bridge: $ref"}
        }
        val containerCode=menu.methods.single { it.name=="nativeContainer" }.implementation!!.instructions.toList()
        val returns=containerCode.indices.filter { containerCode[it].opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT }
        check(returns.size==2){"Container bridge must have independent null and LinearLayout returns (ART type safety)"}
        val nullValue=containerCode[returns[0]-1] as? WideLiteralInstruction
        check(nullValue?.wideLiteral==0L){"Null return must explicitly clear the reference register"}
        check(containerCode[returns[1]-1].opcode==com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT)
        val accessor=(containerCode[returns[1]-2] as? ReferenceInstruction)?.reference as? MethodReference
        check(accessor?.name=="menuContainer"&&accessor.returnType=="Landroid/widget/LinearLayout;")
        println("NATIVE_CONTAINER_TYPED_RETURNS=true")
        val utils=classes.getValue("Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;")
        check(AccessFlags.PUBLIC.isSet(utils.methods.single { it.name=="getFlyoutMenuInfo" }.accessFlags))
        val instructions=utils.methods.single { it.name=="addFlyoutElements" }.implementation!!.instructions.toList()
        fun called(i:Int)=((instructions[i] as? ReferenceInstruction)?.reference as? MethodReference)?.name
        val hook=instructions.indices.single { called(it)=="onMenu" }
        val divider=instructions.indices.single { called(it)=="addDivider" }
        val reset=instructions.indices.single { called(it)=="resetTopFlyoutMenuVisible" }
        check(hook<divider&&divider<reset){"AI toggle must precede shared divider and signal reset"}
        check(instructions[hook+1].opcode==com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT)
        check(instructions[hook+2].opcode==com.android.tools.smali.dexlib2.Opcode.IF_LEZ)
        val positions=IntArray(instructions.size);var position=0
        instructions.forEachIndexed { i,ins->positions[i]=position;position+=ins.codeUnits }
        for(i in 0 until hook){
            val offset=instructions[i] as? com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction?:continue
            val targetPosition=positions[i]+offset.codeOffset
            check(targetPosition<=positions[hook]){"Branch bypasses toggle before divider: $i -> $targetPosition"}
        }
        check(menu.methods.none { it.name=="show" }){"Obsolete second-level engine dialog remains"}
        println("QUICK_MENU_SHARED_DIVIDER=true; ALL_INCOMING_BRANCHES_REACH_TOGGLE=true; DIRECT_TOGGLE=true")
        println("QUICK_MENU_BOUND=true")
    }
    println("DEX_AUDIT_PASS classes=${classes.size}")
}
