package app.yydarlinker.patches.deepseekcaptions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** Reuse the official menu inflater; never scan Activity windows or replace CC gestures. */
internal fun BytecodePatchContext.prepareCaptionQuickToggle(): () -> Unit {
    val utils=mutableClassDefBy("Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;")
    val filter=mutableClassDefBy("Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;")
    val runtime=mutableClassDefBy("Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;")
    val objectType="Ljava/lang/Object;"
    val add=utils.methods.singleOrNull { it.name=="addFlyoutButton" && it.parameterTypes.map { t->t.toString() }==listOf(objectType,"Landroid/graphics/drawable/Drawable;","Ljava/lang/String;","Landroid/view/View\$OnClickListener;","I") }
        ?:throw PatchException("AI quick toggle: official flyout inflater signature unavailable")
    val entry=utils.methods.singleOrNull { it.name=="addFlyoutElements" && it.parameterTypes.map { t->t.toString() }==listOf(objectType) }
        ?:throw PatchException("AI quick toggle: official menu binding unavailable")
    fun requireUnique(ok: Boolean, role: String) { if(!ok) throw PatchException("AI quick toggle: $role must match exactly once") }
    requireUnique(add.returnType=="I" && AccessFlags.STATIC.isSet(add.accessFlags), "flyout inflater type")
    requireUnique(AccessFlags.STATIC.isSet(entry.accessFlags), "static menu binding")
    requireUnique(utils.methods.none { it.name=="addonCaptionButton" }, "unbound inflater bridge")
    for(name in listOf("addNativeRow","topMenu","shortsOpen","dismissNative","nativeContainer"))
        requireUnique(runtime.methods.count { it.name==name }==1, "runtime $name")
    requireUnique(filter.methods.count { it.name=="getTopFlyoutMenuVisible" && it.returnType=="Z" && it.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(it.accessFlags) }==1, "top menu signal")
    val shorts=classDefBy("Lapp/morphe/extension/youtube/shared/ShortsPlayerState;")
    requireUnique(shorts.methods.count { it.name=="isOpen" && it.returnType=="Z" && it.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(it.accessFlags) }==1, "Shorts state")
    requireUnique(utils.methods.count { it.name=="dismissFlyout" && it.returnType=="V" && it.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(it.accessFlags) }==1, "dismiss signal")
    val info=utils.methods.singleOrNull { it.name=="getFlyoutMenuInfo" && it.parameterTypes.map { t->t.toString() }==listOf(objectType,"I") && AccessFlags.STATIC.isSet(it.accessFlags) }
        ?:throw PatchException("AI quick toggle: menu info signature must match exactly once")
    val container=classDefBy(info.returnType)
    requireUnique(container.methods.count { it.name=="menuContainer" && it.parameterTypes.isEmpty() && it.returnType=="Landroid/widget/LinearLayout;" && AccessFlags.PUBLIC.isSet(it.accessFlags) }==1, "typed menu container")
    val detector=filter.methods.filter { it.name=="isFiltered" }.singleOrNull()
        ?:throw PatchException("AI quick toggle: isFiltered must match exactly once")
    val params=detector.parameterTypes.map { it.toString() }
    val bytes=params.indexOf("[B")
    val pathType=params.getOrNull(bytes-1)
    if(detector.returnType!="Z" || params.count { it=="[B" }!=1 || bytes<1 || pathType !in listOf("Ljava/lang/String;","Ljava/lang/CharSequence;") || detector.implementation==null)
        throw PatchException("AI quick toggle: unsupported menu path signature: ${detector.name}($params)${detector.returnType}")
    val expectedParams=listOf("Lapp/morphe/extension/shared/patches/components/ContextInterface;","Ljava/lang/String;","Ljava/lang/String;",pathType!!,"[B",
        "Lapp/morphe/extension/shared/patches/components/BufferAsciiStrings;","Lapp/morphe/extension/shared/patches/components/StringFilterGroup;",
        "Lapp/morphe/extension/shared/patches/components/Filter\$FilterContentType;","I")
    if(params!=expectedParams || AccessFlags.STATIC.isSet(detector.accessFlags))
        throw PatchException("AI quick toggle: unsupported isFiltered structure: $params flags=${detector.accessFlags}")
    fun words(t:String)=if(t=="J" || t=="D")2 else 1
    val pathRegister=(if(AccessFlags.STATIC.isSet(detector.accessFlags))0 else 1)+params.take(bytes-1).sumOf(::words)
    requireUnique(detector.implementation!!.registerCount >= (if(AccessFlags.STATIC.isSet(detector.accessFlags))0 else 1)+params.sumOf(::words), "detector parameter registers")
    requireUnique(runtime.methods.count { it.name=="observeMenuPath" && it.parameterTypes.map { t->t.toString() }==listOf(pathType,"[B") && it.returnType=="V" }==1, "typed menu observer")
    // Older official bundles defer the group insertion to a captured Runnable.
    // Follow its actual DEX call to the typed static body; never guess an R8 lambda
    // name or inject at the outer entry before menu detection has completed.
    fun dividerCount(method: com.android.tools.smali.dexlib2.iface.Method) =
        method.implementation?.instructions?.count { instruction ->
            val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass==utils.type && reference.name=="addDivider"
        } ?: 0
    val menuBody=if(dividerCount(entry)==1) entry else {
        requireUnique(dividerCount(entry)==0,"direct divider count")
        val outer=entry.implementation!!.instructions.toList()
        requireUnique(outer.count { instruction ->
            val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass=="Lapp/morphe/extension/shared/Utils;" &&
                reference.name=="runOnMainThreadDelayed" && reference.returnType=="V" &&
                reference.parameterTypes.map { it.toString() }==listOf("Ljava/lang/Runnable;","J")
        }==1,"deferred menu dispatch")
        val delegates=outer.filter { it.opcode==Opcode.NEW_INSTANCE }.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type
        }.distinct().map { classDefBy(it) }.filter { "Ljava/lang/Runnable;" in it.interfaces }
            .flatMap { runnable ->
                requireUnique(outer.count { instruction ->
                    val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass==runnable.type && reference.name=="<init>" &&
                        reference.parameterTypes.map { it.toString() }==listOf(objectType)
                }==1,"captured menu constructor")
                runnable.methods.filter { it.name=="run" && it.returnType=="V" && it.parameterTypes.isEmpty() }
                    .flatMap { it.implementation?.instructions?.toList() ?: emptyList() }
                    .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
                    .filter { it.definingClass==utils.type && it.returnType=="V" &&
                        it.parameterTypes.map { type->type.toString() }==listOf(objectType) }
                    .mapNotNull { reference -> utils.methods.singleOrNull { method ->
                        method.name==reference.name && method.returnType==reference.returnType &&
                            method.parameterTypes.map { it.toString() }==listOf(objectType) &&
                            AccessFlags.STATIC.isSet(method.accessFlags)
                    } }
            }.distinct().filter { dividerCount(it)==1 }
        requireUnique(delegates.size==1,"reachable deferred divider body")
        delegates.single()
    }
    val instructions=menuBody.implementation!!.instructions.toList()
    val dividerCalls=instructions.indices.filter { i -> (instructions[i] as? ReferenceInstruction)?.reference.let { it is MethodReference && it.definingClass==utils.type && it.name=="addDivider" } }
    requireUnique(dividerCalls.size==1,"shared divider call")
    val dividerCall=dividerCalls.single()
    val guard=(dividerCall-1 downTo 0).firstOrNull { instructions[it].opcode==Opcode.IF_LEZ }
        ?:throw PatchException("AI quick toggle: shared divider guard unavailable")
    val indexRegister=(instructions[guard] as? OneRegisterInstruction)?.registerA
        ?:throw PatchException("AI quick toggle: divider guard register unavailable")
    val afterDivider=(instructions[guard] as? BuilderOffsetInstruction)?.target?.location?.instruction
        ?:throw PatchException("AI quick toggle: divider guard target unavailable")
    // Every known late guard is resolved before the first bytecode mutation.
    return {
    // Expose only the existing checked inflater through a generated bridge in its own class.
    val bridge=ImmutableMethod(utils.type,"addonCaptionButton",add.parameters,add.returnType,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,null,null,MutableMethodImplementation(6)).toMutable()
    bridge.addInstructions(0,"invoke-static/range {p0 .. p4}, ${utils.type}->${add.name}(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View\$OnClickListener;I)I\nmove-result v0\nreturn v0")
    utils.methods.add(bridge)
    fun bind(name:String,body:String,registers:Int){
        val old=runtime.methods.single { it.name==name }
        val replacement=ImmutableMethod(runtime.type,name,old.parameters,old.returnType,old.accessFlags,old.annotations,null,MutableMethodImplementation(registers)).toMutable()
        replacement.addInstructions(0,body);runtime.methods.remove(old);runtime.methods.add(replacement)
    }
    bind("addNativeRow","invoke-static/range {p0 .. p4}, ${utils.type}->addonCaptionButton(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View\$OnClickListener;I)I\nmove-result v0\nreturn v0",6)
    bind("topMenu","invoke-static {}, ${filter.type}->getTopFlyoutMenuVisible()Z\nmove-result v0\nreturn v0",1)
    bind("shortsOpen","invoke-static {}, ${shorts.type}->isOpen()Z\nmove-result v0\nreturn v0",1)
    bind("dismissNative","invoke-static {}, ${utils.type}->dismissFlyout()V\nreturn-void",0)
    // Insert at the shared group's boundary, BEFORE its conditional divider and signal reset.
    // The index is the official inflater's next insertion position (dialog vs popup differ).
    // Retain incoming branch labels on the hook: zero/hidden official buttons must also reach it.
    menuBody.replaceInstruction(guard,"invoke-static {p0, v$indexRegister}, ${runtime.type}->onMenu(Ljava/lang/Object;I)I")
    menuBody.addInstructionsWithLabels(guard+1,"move-result v$indexRegister\nif-lez v$indexRegister, :after_divider",ExternalLabel("after_divider",afterDivider))
    info.accessFlags=(info.accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value
    // ART does not narrow the null branch's reference register to a null type.
    // Do not merge FlyoutMenuInfo and LinearLayout at one return: that becomes Object
    // and rejects the entire CaptionQuickToggle class. Each path returns its own type.
    bind("nativeContainer","const/4 v0, 0x0\ninvoke-static {p0, v0}, ${utils.type}->getFlyoutMenuInfo(Ljava/lang/Object;I)${info.returnType}\nmove-result-object v0\nif-nez v0, :container\nconst/4 v0, 0x0\nreturn-object v0\n:container\ninvoke-virtual {v0}, ${info.returnType}->menuContainer()Landroid/widget/LinearLayout;\nmove-result-object v0\nreturn-object v0",2)
    detector.addInstructions(0,"invoke-static/range {p$pathRegister .. p${pathRegister+1}}, ${runtime.type}->observeMenuPath($pathType[B)V")
    }
}
