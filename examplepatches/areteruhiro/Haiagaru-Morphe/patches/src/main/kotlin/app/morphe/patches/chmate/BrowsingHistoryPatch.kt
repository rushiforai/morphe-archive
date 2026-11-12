package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val HISTORY = "Lapp/morphe/extension/chmate/BrowsingHistory;"

internal fun BytecodePatchContext.patchGroupedBrowsingHistory(version: String) {
    // Decorate only the stock history popup before its content is measured.
    val popupOwner=when(version){
        "0.8.10.191 dev"->"Lo/r8lambdaXGaXuWPLiVQXXQ4i5OruQyr7jtc;"
        "0.8.10.226 dev"->"Lo/TTWebsiteActivity;"
        "0.8.10.242 dev"->"Lo/mapOfKeyValueArrays\$read;"
        else->return
    }
    val popup=mutableClassDefBy(popupOwner).methods.single { method ->
        method.implementation?.instructions?.any { instruction ->
            val ref=(instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            ref?.definingClass=="Landroid/widget/PopupWindow;"&&ref.name=="showAsDropDown"
        }==true
    }
    val content=popup.implementation!!.instructions.withIndex().last { (_,instruction) ->
        val ref=(instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        ref?.definingClass=="Landroid/widget/PopupWindow;"&&ref.name=="getContentView"
    }
    val popupRegister=(content.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC
    popup.addInstructions(content.index,"invoke-static {v$popupRegister}, Lapp/morphe/extension/chmate/RefreshTargetHistory;->attach(Landroid/widget/PopupWindow;)V")

    if (version == "0.8.10.242 dev") {
        // Home AdapterData, not initRenderFinish's recent-thread popup.
        val ctor = mutableClassDefBy("Lo/SafeParcelableClass;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("Ljava/util/List;", "I", "Z",
                "Lo/ApiApiOptionsHasAccountOptions;", "I", "I")
        }
        check(ctor.implementation!!.registerCount <= 16)
        // p2 is the layout type. p5, stored as AdapterData.b, is the HOME sort ID:
        // 101 = unread, 103 = browsing history, 104 = posted history.
        ctor.addInstructions(0, """
            invoke-static {p1, p5}, $HISTORY->transform(Ljava/util/List;I)Ljava/util/List;
            move-result-object p1
        """.trimIndent())
    } else {
        val (owner, name) = when(version) {
            "0.8.10.191 dev" -> "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;" to "a"
            "0.8.10.226 dev" -> "Ljp/syoboi/a2chMate/fragment/HomeFragment;" to "b"
            else -> return
        }
        val klass = mutableClassDefBy(owner)
        val original = klass.methods.single {
            it.name == name && it.parameterTypes == listOf("I", "Z") && it.returnType == "V"
        }
        check(original.accessFlags and 8 == 0)
        val renamed = MutableMethod(ImmutableMethod(owner, "haiagaruNativeHistorySort", original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation))
        val wrapper = MutableMethod(ImmutableMethod(owner, name, original.parameters, original.returnType,
            original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        val invoke = if(original.accessFlags and 2 != 0) "invoke-direct/range" else "invoke-virtual/range"
        wrapper.addInstructions(0, """
            invoke-static/range {p0 .. p1}, $HISTORY->prepareLegacy(Ljava/lang/Object;I)V
            $invoke {p0 .. p2}, $renamed
            invoke-static/range {p0 .. p1}, $HISTORY->applyLegacy(Ljava/lang/Object;I)V
            return-void
        """.trimIndent())
        klass.methods.remove(original)
        klass.methods.add(renamed)
        klass.methods.add(wrapper)
        val adapter = if(version == "0.8.10.191 dev") "Lo/r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA;" else "Lo/bea1;"
        val adapterClass = mutableClassDefBy(adapter)
        for (notify in listOf("notifyDataSetChanged", "notifyDataSetInvalidated")) {
            check(adapterClass.methods.none { it.name == notify && it.parameterTypes.isEmpty() })
            val hook = MutableMethod(ImmutableMethod(adapter, notify, emptyList(), "V", 1,
                emptySet(), emptySet(), ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
            hook.addInstructions(0, """
                invoke-static {p0}, $HISTORY->beforeLegacyNotify(Ljava/lang/Object;)V
                invoke-super {p0}, Landroid/widget/BaseAdapter;->$notify()V
                return-void
            """.trimIndent())
            adapterClass.methods.add(hook)
        }
    }
    println("Board-grouped normal browsing history: $version (refresh target popup entry added)")
    if(version=="0.8.10.191 dev"){
        // Patrol completion is not a request to jump to the start of HOME.
        // Keep native sorting, button state, refresh dispatch and explicit n_ actions.
        val owner="Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;"
        val completion=mutableClassDefBy(owner).methods.single{it.name=="e"&&it.parameterTypes==listOf("Lo/me;")&&it.returnType=="V"}
        val code=completion.implementation!!.instructions.toList()
        check(completion.implementation!!.registerCount==7&&code.size==38)
        val top=code.withIndex().single{(_,instruction)->
            val ref=(instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            ref?.definingClass==owner&&ref.name=="n_"&&ref.parameterTypes.isEmpty()&&ref.returnType=="V"
        }
        check(top.index==36&&top.value.opcode==com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL)
        val call=top.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        check(call.registerCount==1&&call.registerC==5)
        completion.replaceInstruction(top.index,"nop")
    }
}
