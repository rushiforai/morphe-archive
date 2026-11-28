package semicoloncolonel.mobilestream.patches.scmp.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.scmp.shared.Constants

// SCMP 7.2.9.
//
//  - Onboarding: checkShowPageCondition picks each page of the first-run
//    walkthrough. Asked for the free-trial page ("Next, unlock 7 days free
//    access", and its "Are you sure? This is a limited-time offer" dialog),
//    it now goes on to the next page, as it does for a subscriber.
//  - Articles: the SUBSCRIBE button in the toolbar is not built. Litho skips
//    a missing child, so the other toolbar buttons keep their places.
//  - SCMP Plus: the "Try for free" bar pinned above the tab bar is not added.
//
// The article paywall, sign-in, and the subscription page in the menu are
// unchanged.

private const val ONBOARDING = "Lcom/scmp/scmpapp/onboarding/view/activity/OnboardingActivity;"

internal object CheckShowPageConditionFingerprint : Fingerprint(
    definingClass = ONBOARDING,
    name = "checkShowPageCondition",
    returnType = "V",
)

internal object SubscribeButtonFingerprint : Fingerprint(
    definingClass = "Lcom/scmp/scmpapp/article/view/lithography/ArticleToolBarSpec;",
    name = "getSubscribeButton",
    returnType = "Lcom/facebook/litho/Component\$Builder;",
)

internal object PlusTrialBarFingerprint : Fingerprint(
    definingClass = "Lcom/scmp/scmpapp/home/view/activity/HomeActivity;",
    name = "addPlusTrailBarView",
    returnType = "V",
)

@Suppress("unused")
val hideSubscriptionPromptsPatch = bytecodePatch(
    name = "Hide subscription prompts",
    description = "Removes the free-trial page from the first-run walkthrough, the Subscribe button in " +
        "articles, and the free-trial bar on SCMP Plus.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        CheckShowPageConditionFingerprint.method.apply {
            val page = parameterTypes.first().toString()
            addInstructions(
                0,
                """
                    sget-object v0, $page->FreeTrail:$page
                    if-ne p1, v0, :msp_keep
                    sget-object p1, $page->ChooseNews:$page
                    :msp_keep
                    nop
                """,
            )
        }

        SubscribeButtonFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        PlusTrialBarFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == "Landroid/view/ViewGroup;" && it.name == "addView"
                    }
            }
            if (index < 0) throw PatchException("SCMP Plus free-trial bar: addView not found")
            removeInstruction(index)
        }
    }
}
