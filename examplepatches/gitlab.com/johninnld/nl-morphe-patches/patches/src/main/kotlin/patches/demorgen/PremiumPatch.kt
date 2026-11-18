package patches.demorgen

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses marketing templates, premium labels and the automatic subscriber-benefit row, retaining manual account navigation.") {
    dependsOn(originalInput)
    compatibleWith(demorgen)
    dependsOn(emptyMarketingTemplates)
    execute {
        removeSubscriberBenefitRow()
        change("Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewDataMapper;", "invoke(ZLnl/persgroep/edition/viewdata/ViewDataString;Lnl/persgroep/edition/viewdata/ViewDataColor;)Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData;", "sget-object v0, Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData\$None;->INSTANCE:Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData\$None;\nreturn-object v0")
    }
}

/** Keep the three functional login benefits; omit only the final subscriber row.
 * All constructors, buttons, navigation and onboarding completions stay intact. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun removeSubscriberBenefitRow() {
    val mapper = "${APP}feature/user/onboarding/login/OnboardingLoginInformationViewDataMapper;"
    val benefits = "[${APP}feature/user/onboarding/login/BenefitViewData;"
    val method = exact(mapper,"getLoginBenefits","Ljava/util/List;").method
    val arrays = method.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.FILLED_NEW_ARRAY &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == benefits
    }
    check(arrays.size == 1) { "De Morgen onboarding benefit list boundary changed" }
    val (index, instruction) = arrays.single()
    val array = instruction as FiveRegisterInstruction
    check(array.registerCount == 4 && array.registerC == 0 && array.registerD == 1 &&
        array.registerE == 2 && array.registerF == 3) { "De Morgen onboarding benefit order changed" }
    method.replaceInstruction(index,"filled-new-array {v0, v1, v2}, $benefits")
}
