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
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** Reuse the official menu inflater; never scan Activity windows or replace CC gestures. */
internal fun BytecodePatchContext.installCaptionQuickToggle(){
    val utils=mutableClassDefBy("Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;")
    val filter=mutableClassDefBy("Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;")
    val runtime=mutableClassDefBy("Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;")
    val objectType="Ljava/lang/Object;"
    val add=utils.methods.singleOrNull { it.name=="addFlyoutButton" && it.parameterTypes.map { t->t.toString() }==listOf(objectType,"Landroid/graphics/drawable/Drawable;","Ljava/lang/String;","Landroid/view/View\$OnClickListener;","I") }
        ?:throw PatchException("AI quick toggle: official flyout inflater signature unavailable")
    val entry=utils.methods.singleOrNull { it.name=="addFlyoutElements" && it.parameterTypes.map { t->t.toString() }==listOf(objectType) }
        ?:throw PatchException("AI quick toggle: official menu binding unavailable")
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
    if(filter.methods.none { it.name=="getTopFlyoutMenuVisible" })throw PatchException("AI quick toggle: top-level menu signal missing")
    bind("topMenu","invoke-static {}, ${filter.type}->getTopFlyoutMenuVisible()Z\nmove-result v0\nreturn v0",1)
    val shorts=classDefBy("Lapp/morphe/extension/youtube/shared/ShortsPlayerState;")
    if(shorts.methods.none { it.name=="isOpen" && AccessFlags.STATIC.isSet(it.accessFlags) })throw PatchException("AI quick toggle: Shorts state unavailable")
    bind("shortsOpen","invoke-static {}, ${shorts.type}->isOpen()Z\nmove-result v0\nreturn v0",1)
    bind("dismissNative","invoke-static {}, ${utils.type}->dismissFlyout()V\nreturn-void",0)
    // Insert at the shared group's boundary, BEFORE its conditional divider and signal reset.
    // The index is the official inflater's next insertion position (dialog vs popup differ).
    val instructions=entry.implementation!!.instructions
    val dividerCall=instructions.indexOfFirst { ins ->
        ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.name=="addDivider"
    }
    if(dividerCall<1)throw PatchException("AI quick toggle: shared divider boundary unavailable")
    val guard=(dividerCall-1 downTo 0).firstOrNull { instructions[it].opcode==Opcode.IF_LEZ }
        ?:throw PatchException("AI quick toggle: shared divider guard unavailable")
    val indexRegister=(instructions[guard] as OneRegisterInstruction).registerA
    val afterDivider=(instructions[guard] as BuilderOffsetInstruction).target.location.instruction!!
    // Retain incoming branch labels on the hook: zero/hidden official buttons must also reach it.
    entry.replaceInstruction(guard,"invoke-static {p0, v$indexRegister}, ${runtime.type}->onMenu(Ljava/lang/Object;I)I")
    entry.addInstructionsWithLabels(guard+1,"move-result v$indexRegister\nif-lez v$indexRegister, :after_divider",ExternalLabel("after_divider",afterDivider))
    val info=utils.methods.single { it.name=="getFlyoutMenuInfo" }
    info.accessFlags=(info.accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value
    // ART does not narrow the null branch's reference register to a null type.
    // Do not merge FlyoutMenuInfo and LinearLayout at one return: that becomes Object
    // and rejects the entire CaptionQuickToggle class. Each path returns its own type.
    bind("nativeContainer","const/4 v0, 0x0\ninvoke-static {p0, v0}, ${utils.type}->getFlyoutMenuInfo(Ljava/lang/Object;I)${info.returnType}\nmove-result-object v0\nif-nez v0, :container\nconst/4 v0, 0x0\nreturn-object v0\n:container\ninvoke-virtual {v0}, ${info.returnType}->menuContainer()Landroid/widget/LinearLayout;\nmove-result-object v0\nreturn-object v0",2)
    val detector=filter.methods.single { it.name=="isFiltered" }
    val params=detector.parameterTypes.map { it.toString() }
    val bytes=params.indexOf("[B")
    if(bytes<1 || params[bytes-1]!="Ljava/lang/String;")throw PatchException("AI quick toggle: menu path signal unavailable")
    detector.addInstructions(0,"invoke-static/range {p$bytes .. p${bytes+1}}, ${runtime.type}->observeMenuPath(Ljava/lang/String;[B)V")
}
