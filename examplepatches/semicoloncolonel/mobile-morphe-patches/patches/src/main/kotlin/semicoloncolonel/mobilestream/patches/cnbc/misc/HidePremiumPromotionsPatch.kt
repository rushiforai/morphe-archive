package semicoloncolonel.mobilestream.patches.cnbc.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants

// CNBC 8.8.2. A show's video page (Fast Money, Squawk Box, and others) is
// built by GetBusinessShowUseCaseImpl.buildBusinessShowWithCta. For a viewer
// without a subscription it adds a "Latest Episodes" heading, a card, and the
// clips. The card is "Premium Content: Subscribe now and get access to full
// episodes and more", or for a viewer with TV-provider access, a card to sign
// in with the provider. Each item the method adds now goes through
// PremiumCardFilter, which drops the subscription card and its heading, so
// the page starts with the free clips.

private const val SHOW_USE_CASE = "Lcom/cnbc/client/vod/usecase/GetBusinessShowUseCaseImpl;"
private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/cnbc/PremiumCardFilter;"

@Suppress("unused")
val hidePremiumPromotionsPatch = bytecodePatch(
    name = "Hide premium promotions",
    description = "Removes the \"Premium Content\" subscription card and its \"Latest Episodes\" heading from show pages.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val method = mutableClassDefBy(SHOW_USE_CASE).methods.firstOrNull {
            it.name.contains("buildBusinessShowWithCta") && !it.name.contains("$")
        } ?: throw PatchException("CNBC: buildBusinessShowWithCta not found")
        var replaced = 0
        method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@forEachIndexed
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            if (reference.definingClass != "Ljava/util/List;" || reference.name != "add" ||
                reference.parameterTypes.size != 1
            ) {
                return@forEachIndexed
            }
            val call = instruction as FiveRegisterInstruction
            method.replaceInstruction(
                index,
                "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                    "$FILTER->add(Ljava/util/List;Ljava/lang/Object;)Z",
            )
            replaced++
        }
        if (replaced == 0) throw PatchException("CNBC: the show page's list was not found")
    }
}
