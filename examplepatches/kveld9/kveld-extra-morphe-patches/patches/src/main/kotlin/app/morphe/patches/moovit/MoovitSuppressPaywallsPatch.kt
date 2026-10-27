package app.morphe.patches.moovit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.Constants.COMPATIBILITY_MOOVIT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private val moovitPlusOnboardingActivityFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/plus/onboarding/MoovitSubscriptionOnBoardingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val moovitPlusActivityOnReadyFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/plus/MoovitSubscriptionActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val moovitPlusHelpCenterMenuItemFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/plus/MoovitPlusHelpCenterMenuItemFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private val moovitPlusMenuItemFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/plus/MoovitSubscriptionMenuItemFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private val promoCellFragmentOnViewCreatedFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/subscription/MoovitSubscriptionsPromoCellFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private val moovitPlusPackagePopupFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/plus/popup/MoovitPlusPackagePopupFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private val myMoovitPlusGoPremiumCardFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    strings = listOf(string("goPremiumCard", StringComparisonType.EQUALS)),
)

@Suppress("unused")
val moovitSuppressPaywallsPatch = bytecodePatch(
    name = "Suppress Paywalls",
    description = "Suppresses subscription paywalls, onboarding upgrade dialogs, and promotional cards.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOOVIT)

    execute {
        var patched = 0

        // 1. Onboarding activity -> finish onboarding immediately
        moovitPlusOnboardingActivityFingerprint.method.addInstructions(
            0,
            """
                invoke-direct {p0}, Lcom/moovit/app/plus/onboarding/MoovitSubscriptionOnBoardingActivity;->finishOnboarding()V
                return-void
            """.trimIndent(),
        )
        patched++

        // 2. MoovitSubscriptionActivity -> exit immediately
        moovitPlusActivityOnReadyFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent(),
        )
        patched++

        // 3. Help center menu item -> suppress view setup
        moovitPlusHelpCenterMenuItemFingerprint.method.addInstructions(0, "return-void")
        patched++

        // 4. Plus menu item -> set GONE
        moovitPlusMenuItemFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )
        patched++

        // 5. Promo cell -> set GONE
        promoCellFragmentOnViewCreatedFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )
        patched++

        // 6. Package popup -> dismiss dialog
        moovitPlusPackagePopupFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V
                return-void
            """.trimIndent(),
        )
        patched++

        // 7. Go Premium card -> replace VISIBLE setVisibility with GONE setVisibility
        val goPremiumInstructions = myMoovitPlusGoPremiumCardFingerprint.method.implementation!!.instructions
        val goPremiumStringIndex = goPremiumInstructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference.toString().contains("goPremiumCard")
        }
        check(goPremiumStringIndex > 0) { "goPremiumCard marker instruction not found." }

        val buttonIndex = goPremiumInstructions
            .drop(goPremiumStringIndex)
            .indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference.toString().contains("go_premium_button")
            }
        check(buttonIndex > 0) { "go_premium_button marker instruction not found." }

        val setVisibilityOffset = goPremiumInstructions
            .drop(goPremiumStringIndex + buttonIndex)
            .indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference.toString().contains("Landroid/view/View;->setVisibility(I)V") &&
                    instruction.opcode == Opcode.INVOKE_VIRTUAL
            }
        check(setVisibilityOffset > 0) { "setVisibility invocation not found after go_premium_button marker." }

        // Replace invoke-virtual {v0, v2}, View;->setVisibility(I)V (where v2 is 0) with invoke-virtual {v0, v1}, View;->setVisibility(I)V (where v1 is 8)
        val targetIndex = goPremiumStringIndex + buttonIndex + setVisibilityOffset
        myMoovitPlusGoPremiumCardFingerprint.method.replaceInstruction(
            targetIndex,
            "invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V",
        )
        patched++

        println("[Suppress Paywalls] Applied $patched hooks -> Paywalls and upgrade dialogs suppressed.")
    }
}
