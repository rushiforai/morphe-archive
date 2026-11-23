package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal val bundleUiThemePatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        Fingerprint(definingClass="Lcom/google/android/material/tabs/TabLayout;", name="setSelectedTabIndicatorColor",
            returnType="V", parameters=listOf("I")).method.addInstructions(0,
            "invoke-static/range {p0 .. p1}, Lapp/zonghome/extension/CharcoalTheme;->tabIndicatorColor(Landroid/view/View;I)I\nmove-result p1")
        val selection=Fingerprint(definingClass="LmergeRecords;", name="setSelection", returnType="V",
            parameters=listOf("Landroid/content/Context;","Z","Landroid/widget/TextView;","Landroid/view/View;")).method
        val selectedRegister=if(selection.accessFlags and 8 != 0)1 else 2
        selection.addInstruction(0,"invoke-static/range {p$selectedRegister .. p${selectedRegister+1}}, Lapp/zonghome/extension/ChipStyling;->selected(ZLandroid/view/View;)V")
        val exits=selection.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }
        check(exits.isNotEmpty()) { "Missing validity selection exits" }
        val pages=setOf("Lcom/zong/customercare/view/ui/FragBundles;","Lcom/zong/customercare/view/ui/FragInternetSim;","Lcom/zong/customercare/view/ui/FragMbb;")
        data class PageHook(val type:String,val name:String,val parameters:List<String>,val result:String)
        val hooks=mutableListOf<PageHook>()
        classDefForEach { cls ->
            if(cls.type in pages)for(method in cls.methods) {
                if(method.implementation!=null && ((method.name=="onViewCreated" && method.parameterTypes.map { it.toString() }==listOf("Landroid/view/View;","Landroid/os/Bundle;")) ||
                    (method.name=="onCreateView" && method.returnType=="Landroid/view/View;")))
                    hooks.add(PageHook(cls.type,method.name,method.parameterTypes.map { it.toString() },method.returnType))
            }
        }
        check(hooks.isNotEmpty()){ "Missing bundle page chip initialization" }
        for(hook in hooks) {
            val method=mutableClassDefBy(hook.type).methods.single { it.name==hook.name && it.parameterTypes.map { p -> p.toString() }==hook.parameters && it.returnType==hook.result }
            if(hook.name=="onViewCreated")method.addInstruction(0,"invoke-static/range {p1 .. p1}, Lapp/zonghome/extension/ChipStyling;->attach(Landroid/view/View;)V")
            else {
                val returns=method.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_OBJECT }.map { it.index to (it.value as OneRegisterInstruction).registerA }
                for((index,register) in returns.asReversed())method.addInstruction(index,"invoke-static/range {v$register .. v$register}, Lapp/zonghome/extension/ChipStyling;->attach(Landroid/view/View;)V")
            }
        }
        // The post-selection refresh reads no reused parameter registers.
        for(index in exits.reversed())selection.addInstruction(index,
            "invoke-static {}, Lapp/zonghome/extension/CharcoalTheme;->refreshValidityControls()V")
    }
}
