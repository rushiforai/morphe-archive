package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CONTROLS = "Lapp/zonghome/extension/PromotionControls;"

val hideWhatsAppChannelPatch = bytecodePatch(
    name = null,
    description = "Hide the dialog promoting the Zong 5G WhatsApp channel.", default = true
) {
    compatibleWith(myZongCompatibility)
    dependsOn(sharedExtensionPatch, dialogWindowThemePatch)
    execute {
        if (!CustomizationSettings.enabled("hideWhatsAppChannel")) return@execute
        Fingerprint(definingClass = CONTROLS, name = "hideWhatsAppChannel", returnType = "Z", parameters = emptyList())
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

val materialUsageStarPatch = bytecodePatch(
    name = "Material usage favorite star",
    description = "Use the Material accent for selected Usage and Bundles stars.", default = true
) {
    category("Appearance")
    compatibleWith(myZongCompatibility)
    dependsOn(sharedExtensionPatch)
    execute {
        var count = 0
        val types = mutableListOf<String>()
        classDefForEach { cls ->
                        if (listOf("UsageDetailsAdapter", "BundleAdapter", "ParentBundleAdapter").any {
                cls.type.startsWith("Lcom/zong/customercare/view/adapter/$it")
            }) types.add(cls.type)
        }
        for (type in types) {
            for (method in mutableClassDefBy(type).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                for ((index, instruction) in instructions.withIndex()) {
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL || reference.name != "setColorFilter" ||
                        reference.parameterTypes != listOf("I") || reference.returnType != "V") continue
                    val call = instruction as FiveRegisterInstruction
                    check(call.registerCount == 2) { "Unexpected Usage star color-filter call" }
                    method.replaceInstruction(index,
                        "invoke-static {v${call.registerC}, v${call.registerD}}, $CONTROLS->tintUsageStar(Landroid/widget/ImageView;I)V")
                    count++
                }
            }
        }
        check(count >= 2) { "Missing Usage favorite-star state updates" }
    }
}
