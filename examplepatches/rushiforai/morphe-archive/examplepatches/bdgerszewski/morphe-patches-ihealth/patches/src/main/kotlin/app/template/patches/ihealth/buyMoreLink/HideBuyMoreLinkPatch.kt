package app.template.patches.ihealth.buyMoreLink

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IHEALTH
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val hideBuyMoreLinkPatch = bytecodePatch(
    name = "Hide buy more devices link",
    description = "Hides the 'Buy more iHealth devices?' link at the bottom of the Devices screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IHEALTH)

    execute {
        // instructionMatches[1] is the findRequiredView call for tv_buy_more_device.
        // The next instruction (index + 1) is move-result-object which holds the View reference.
        val findViewIndex = BuyMoreDeviceLinkFingerprint.instructionMatches[1].index
        val viewRegister = BuyMoreDeviceLinkFingerprint.method
            .getInstruction<OneRegisterInstruction>(findViewIndex + 1)
            .registerA

        // Insert setVisibility(GONE) immediately after move-result-object, before the view
        // is stored into the field and the click listener is attached.
        BuyMoreDeviceLinkFingerprint.method.addInstructions(
            findViewIndex + 2,
            """
                const/16 v0, 0x8
                invoke-virtual {v$viewRegister, v0}, Landroid/view/View;->setVisibility(I)V
            """
        )
    }
}
