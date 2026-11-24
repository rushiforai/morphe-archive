package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RECHARGE="Lapp/zonghome/extension/RechargeSections;"
private val rechargeTarget=Compatibility(
    name="My Zong",packageName="com.zong.customercare",apkFileType=ApkFileType.APK,
    appIconColor=0x80c342,targets=listOf(AppTarget(version="5.19.19.112"))
)
private val rechargePagerFramework=bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        val constructor=Fingerprint(
            definingClass="LCornerRadiusdefault;",name="<init>",returnType="V",
            parameters=listOf("Landroid/app/Activity;","Landroidx/fragment/app/FragmentManager;","Ljava/util/List;")
        ).method
        val returns=constructor.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }
        check(returns.isNotEmpty())
        for(index in returns.reversed())constructor.addInstruction(index,
            "invoke-static/range {p0 .. p0}, $RECHARGE->configureAdapter(Ljava/lang/Object;)V")
        val create=Fingerprint(
            definingClass="Lcom/zong/customercare/view/ui/FragRechargeMain;",name="onActivityCreated",
            returnType="V",parameters=listOf("Landroid/os/Bundle;")
        ).method
        val calls=create.implementation!!.instructions.withIndex().filter { (_,ins) ->
            val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name=="setCurrentItem" && ref.parameterTypes==listOf("I") && ref.returnType=="V"
        }
        check(calls.size==1) { "Unexpected recharge page-selection sequence" }
        val (at,ins)=calls.single()
        val receiver:Int; val argument:Int
        when(ins) {
            is FiveRegisterInstruction -> {check(ins.registerCount==2);receiver=ins.registerC;argument=ins.registerD}
            is RegisterRangeInstruction -> {check(ins.registerCount==2);receiver=ins.startRegister;argument=receiver+1}
            else -> error("Unsupported page-selection instruction")
        }
        check(argument<=255) { "Unsupported page-selection argument register" }
        val invoke=if(receiver<=15 && argument<=15)
            "invoke-static {v$receiver, v$argument}, $RECHARGE->mapRequestedPage(Ljava/lang/Object;I)I"
        else {check(argument==receiver+1);"invoke-static/range {v$receiver .. v$argument}, $RECHARGE->mapRequestedPage(Ljava/lang/Object;I)I"}
        create.addInstructions(at,"$invoke\nmove-result v$argument")
    }
}
private fun rechargeSection(title:String,detail:String,configuration:String)=bytecodePatch(
    name=null,description=detail,default=true
) {
    compatibleWith(rechargeTarget)
    dependsOn(rechargePagerFramework)
    execute {
        if (!CustomizationSettings.enabled(configuration)) return@execute
        Fingerprint(definingClass=RECHARGE,name=configuration,returnType="Z",parameters=emptyList())
            .method.addInstructions(0,"const/4 v0, 0x1\nreturn v0")
    }
}
@Suppress("unused")
val hideOnlineRechargeSectionPatch=rechargeSection(
    "Hide Online Recharge section","Remove Online Recharge from the recharge pager and its tab titles.","hideOnline")
@Suppress("unused")
val hideScratchCardSectionPatch=rechargeSection(
    "Hide Scratch Card section","Remove Scratch Card from the recharge pager and its tab titles.","hideScratch")
