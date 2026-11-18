package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Native paid-promotion labels complement the independently gated Litho overlay. */
internal val paidPromotionHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val bindings = Fingerprint(filters = listOf(
            resourceLiteral(ResourceType.ID, "paid_promotion_label_text_view"),
            checkCast("Landroid/widget/TextView;", MatchAfterWithin(5))
        )).matchAll()
        require(bindings.size == 2) { "Native paid-promotion label binders changed" }
        for (binding in bindings) {
            val cast = binding.instructionMatches.last().index
            val register = (binding.method.implementation!!.instructions[cast] as OneRegisterInstruction).registerA
            binding.method.addInstruction(cast + 1,
                "invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlayerOverlay;->paidPromotion(Landroid/view/View;)V")
            println("Afterglow paid promotion: ${binding.method.definingClass}->${binding.method.name}")
        }
    }
}
