package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SETTINGS_ENTRY="Lapp/morphe/extension/chmate/InlineSettingsEntry;"

internal fun BytecodePatchContext.patchInlineSettingsEntry(version:String) {
    if(version=="0.8.10.191 dev" || version=="0.8.10.226 dev") {
        val old=version=="0.8.10.191 dev"
        val owner=mutableClassDefBy(if(old)"Lo/r8lambdayz2pCzvVmnexmCv6tMZH_Qkr75k;" else "Lo/RDhmc;")
        val method=owner.methods.single { it.name==(if(old)"g" else "f")&&it.parameterTypes.isEmpty()&&it.returnType=="V" }
        val code=method.implementation!!.instructions.toList()
        val screen=code.withIndex().single { ((it.value as? ReferenceInstruction)?.reference as? MethodReference)?.returnType=="Landroidx/preference/PreferenceScreen;" }.index
        check((code[screen+1] as OneRegisterInstruction).registerA==1)
        check(code.take(screen).any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.returnType=="Landroid/content/Context;" })
        check(code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()=="Landroidx/preference/Preference;->f(I)V" })
        check(code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()=="Landroidx/preference/PreferenceGroup;->e(Landroidx/preference/Preference;)Z" })
        method.addInstructions(screen+2,"invoke-static {v0, v1}, $SETTINGS_ENTRY->legacy(Landroid/content/Context;Ljava/lang/Object;)V")
    } else if(version=="0.8.10.242 dev") {
        val catalog=mutableClassDefBy("Lo/zzakg;").methods.single{it.name=="<clinit>"}
        val store=catalog.implementation!!.instructions.withIndex().single {
            val field=(it.value as? ReferenceInstruction)?.reference as? FieldReference
            it.value.opcode==Opcode.SPUT_OBJECT&&field?.definingClass=="Lo/zzakg;"&&field.type=="Ljava/util/List;"
        }
        check((store.value as OneRegisterInstruction).registerA==0)
        catalog.addInstructions(store.index,"""
            invoke-static {v0}, $SETTINGS_ENTRY->catalog242(Ljava/util/List;)Ljava/util/List;
            move-result-object v0
        """.trimIndent())
        // Intercept both native list callbacks before they change the header,
        // selected page or Compose navigation back stack.
        for (name in listOf("Lo/zzaku;", "Lo/zzalx;", "Lo/zzamr;", "Lo/zzand;")) {
            val click=mutableClassDefBy(name).methods.single {
                it.name=="c"&&it.parameterTypes==List(4){"Ljava/lang/Object;"}&&it.returnType=="Ljava/lang/Object;"
            }
            check(click.implementation!!.registerCount==if(name=="Lo/zzamr;"||name=="Lo/zzand;")9 else 11)
            click.addInstructionsWithLabels(0,"""
                invoke-static {p1}, $SETTINGS_ENTRY->selectRow(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :haiagaru_native_settings_click
                sget-object v0, Lo/zzbwq;->INSTANCE:Lo/zzbwq;
                return-object v0
                :haiagaru_native_settings_click
                nop
            """.trimIndent())
        }
    }
}
