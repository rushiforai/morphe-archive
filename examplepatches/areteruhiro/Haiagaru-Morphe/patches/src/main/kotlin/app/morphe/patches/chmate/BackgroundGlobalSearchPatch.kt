package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val GLOBAL_HOME="Lapp/morphe/extension/chmate/GlobalSearchHome;"

internal fun BytecodePatchContext.patchBackgroundGlobalSearch(version:String){
    if(version !in setOf("0.8.10.191 dev","0.8.10.226 dev","0.8.10.242 dev"))return
    if(version.contains("242")){
        val row=mutableClassDefBy("Lo/getAvailabilityStatus\$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ;")
        val resolve=row.methods.single{it.name=="e"&&it.parameterTypes==listOf("Landroid/content/Context;")&&it.returnType=="Ljp/syoboi/a2chMate/client/BBSUrlInfo;"}
        check(resolve.implementation!!.registerCount-2>=1){"242 cached thread resolver needs a local register"}
        val native=resolve.implementation!!.instructions.first()
        resolve.addInstructionsWithLabels(0,"""
            invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/CachedHomeThreadInfo;->resolve(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :native_cached_thread_info
            check-cast v0, Ljp/syoboi/a2chMate/client/BBSUrlInfo;
            return-object v0
        """.trimIndent(),ExternalLabel("native_cached_thread_info",native))
    }
    val toolbarType=when{
        version.contains("191")->"Lo/r8lambdaBgNelb8wzuneQt5bGzKp1rt5TaY;"
        version.contains("226")->"Lo/PAGBannerAd;"
        else->"Lo/zzaK;"
    }
    val toolbar=mutableClassDefBy(toolbarType)
    val setter=toolbar.methods.single{it.name=="setFilter"&&it.parameterTypes==listOf("Ljava/lang/CharSequence;")&&it.returnType=="V"}
    val field=setter.implementation!!.instructions.mapNotNull{(it as? ReferenceInstruction)?.reference as? FieldReference}
        .first{it.definingClass==toolbarType&&it.type=="Ljava/lang/String;"}
    toolbar.methods.add(MutableMethod(ImmutableMethod(toolbarType,"haiagaruGlobalSearchQuery",emptyList(),"Ljava/lang/String;",1,
        emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            iget-object v0, p0, $field
            return-object v0
        """.trimIndent())
    })
    val old=version.contains("191")
    val modern=version.contains("242")
    val home=mutableClassDefBy(if(old)"Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;" else if(modern)"Ljp/syoboi/a2chMate/ui/home/HomeFragment;" else "Ljp/syoboi/a2chMate/fragment/HomeFragment;")
    val row=if(old)"Lo/onAdDisplayed;" else if(modern)"Lo/getAvailabilityStatus;" else "Lo/Yy2;"
    val signature=if(modern)listOf(row) else listOf("Landroid/widget/ListView;","Landroid/view/View;","I","J")
    val click=home.methods.single{it.parameterTypes==signature&&it.name==(if(old)"Wx_" else if(modern)"d" else "a")&&it.returnType=="V"}
    if(!modern){
        val code=click.implementation!!.instructions.toList()
        val read=code.indices.single{index->
            val ref=(code[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.parameterTypes==listOf("I") &&
                (ref.returnType==row || old && ref.name=="get" && ref.returnType=="Ljava/lang/Object;" &&
                    index+2<code.size && code[index+2].opcode==Opcode.CHECK_CAST &&
                    (code[index+2] as? ReferenceInstruction)?.reference.toString()==row)
        }
        check(code[read+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        val register=(code[read+1] as OneRegisterInstruction).registerA
        click.addInstructions(read+2,"""
            invoke-static/range {v$register .. v$register}, $GLOBAL_HOME->overrideRow(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $row
        """.trimIndent())
    }
    val delegate=MutableMethod(ImmutableMethod(home.type,"haiagaruNativeGlobalClick",click.parameters,click.returnType,
        click.accessFlags,click.annotations,click.hiddenApiRestrictions,click.implementation))
    home.methods.remove(click);home.methods.add(delegate)
    val words=if(modern)2 else 6
    val invocation=if(click.accessFlags and 2!=0)"invoke-direct/range" else "invoke-virtual/range"
    val test=if(modern)"invoke-static {p0, p1}, $GLOBAL_HOME->click(Ljava/lang/Object;Ljava/lang/Object;)Z"
        else "invoke-static {p0, p1, p3}, $GLOBAL_HOME->legacyClick(Ljava/lang/Object;Landroid/widget/ListView;I)Z"
    home.methods.add(MutableMethod(ImmutableMethod(home.type,click.name,click.parameters,"V",click.accessFlags,
        click.annotations,click.hiddenApiRestrictions,ImmutableMethodImplementation(words+1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            $test
            move-result v0
            if-eqz v0, :native
            return-void
            :native
            $invocation {p0 .. p${words-1}}, $delegate
            return-void
        """.trimIndent())
    })
    val longClick = when {
        old -> mutableClassDefBy(home.type.removeSuffix(";")+"\$9;").methods.single { it.name=="onItemLongClick" }
        modern -> home.methods.single { it.name=="d" && it.returnType=="Z" &&
            it.parameterTypes.map(CharSequence::toString)==listOf(home.type,"I",row) }
        else -> home.methods.single { it.name=="b" && it.returnType=="Z" &&
            it.parameterTypes.map(CharSequence::toString)==listOf(home.type,"Lo/TTVideoLandingPageActivity5;","Landroid/view/View;","I","J") }
    }
    val longOwner=if(old)mutableClassDefBy(home.type.removeSuffix(";")+"\$9;") else home
    val longWords=if(modern)3 else 6
    val nativeLong=MutableMethod(ImmutableMethod(longOwner.type,"haiagaruNativeLabelLongClick",
        longClick.parameters,longClick.returnType,longClick.accessFlags,longClick.annotations,
        longClick.hiddenApiRestrictions,longClick.implementation))
    val longInvoke=if(old)"invoke-virtual/range" else "invoke-static/range"
    val labelCallback=if(modern)
        "invoke-static {p0, p2}, Lapp/morphe/extension/chmate/HomeThreadOrder;->labelLongClick(Ljava/lang/Object;Ljava/lang/Object;)Z"
    else "invoke-static {p0, p1, p3}, Lapp/morphe/extension/chmate/HomeThreadOrder;->legacyLabelLongClick(Ljava/lang/Object;Landroid/widget/AdapterView;I)Z"
    longOwner.methods.remove(longClick)
    longOwner.methods.add(nativeLong)
    longOwner.methods.add(MutableMethod(ImmutableMethod(longOwner.type,longClick.name,longClick.parameters,
        longClick.returnType,longClick.accessFlags,longClick.annotations,longClick.hiddenApiRestrictions,
        ImmutableMethodImplementation(longWords+1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            $labelCallback
            move-result v0
            if-nez v0, :done
            $longInvoke {p0 .. p${longWords-1}}, $nativeLong
            move-result v0
            :done
            return v0
        """.trimIndent())
    })
    val resume=home.methods.single{it.name=="onResume"&&it.parameterTypes.isEmpty()}
    resume.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.asReversed().forEach{
        resume.replaceInstruction(it.index,"invoke-static/range {p0 .. p0}, $GLOBAL_HOME->resumed(Ljava/lang/Object;)V")
        resume.addInstructions(it.index+1,"return-void")
    }
    val activity=mutableClassDefBy("Ljp/syoboi/a2chMate/activity/HomeActivity;")
    val received=activity.methods.singleOrNull{it.name=="onNewIntent"&&it.parameterTypes==listOf("Landroid/content/Intent;")}
    val receive="invoke-static/range {p0 .. p1}, $GLOBAL_HOME->received(Landroid/app/Activity;Landroid/content/Intent;)V"
    if(received!=null){
        received.addInstructions(0,receive)
    }else activity.methods.add(MutableMethod(ImmutableMethod(activity.type,"onNewIntent",
        listOf(ImmutableMethodParameter("Landroid/content/Intent;",emptySet(),null)),"V",4,
        emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            invoke-super {p0, p1}, ${activity.superclass}->onNewIntent(Landroid/content/Intent;)V
            $receive
            return-void
        """.trimIndent())
    })
}
