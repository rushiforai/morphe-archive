package semicoloncolonel.mobilestream.patches.usatoday.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.usatoday.shared.Constants

// USA TODAY 8.15.0 asks readers to subscribe in several places:
//
// - Articles: a "Sale" bar slides up and stays pinned at the bottom
//   (ContentActivity.showPaywallMeterMessageSnackbar, which also reserves a
//   spacer for it). Both views are now hidden instead, so no space is kept.
// - The article toolbar's "Subscribe" link
//   (ApplicationConfiguration.isSubscribeMenuButtonEnabled) is now off.
// - The "Subscribe" link above the Top Stories tabs is shown unless the
//   reader has access (ActivityNavigation.updateGreeting). That check now
//   reads as having access there, so "Subscribe" is hidden and "Sign In" stays.
// - The front-page subscription toast and the subscription pop-up
//   (FireflyConfig.isFrontToastEnabled / isModalEnabled) are now off.
// - On launch the front picks one pop-up per session. The subscription offers
//   among them (the free or $1 trial sheet, the "come back" winback offer,
//   and the ad-free offer) are drawn by FrontUtils.showFreeTrialModal,
//   showWinbackModal, and showAdFreeModal, which now draw nothing. The
//   location prompt and "you're caught up" are left alone.
//
// Premium articles stay locked.

private const val CONTENT_ACTIVITY = "Lcom/gannett/android/news/features/base/ContentActivity;"
private const val METER_VIEW = "Lcom/gannett/android/news/features/base/view/PaywallMeterMessageView;"

internal object PaywallMeterSnackbarFingerprint : Fingerprint(
    definingClass = CONTENT_ACTIVITY,
    name = "showPaywallMeterMessageSnackbar",
    parameters = listOf(METER_VIEW, METER_VIEW),
    returnType = "V",
)

internal object SubscribeMenuButtonFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/news/features/configuration/ApplicationConfigurationImpl;",
    name = "isSubscribeMenuButtonEnabled",
    parameters = listOf(),
    returnType = "Z",
)

internal object UpdateGreetingFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/news/features/front/ActivityNavigation;",
    name = "updateGreeting",
    parameters = listOf(),
    returnType = "V",
)

internal object FrontToastEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/configuration/impl/FireflyConfigImpl;",
    name = "isFrontToastEnabled",
    parameters = listOf(),
    returnType = "Z",
)

internal object ModalEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/configuration/impl/FireflyConfigImpl;",
    name = "isModalEnabled",
    parameters = listOf(),
    returnType = "Z",
)

private const val RETURN_FALSE = "const/4 v0, 0x0\nreturn v0"

@Suppress("unused")
val hideSubscriptionPromptsPatch = bytecodePatch(
    name = "Hide subscription prompts",
    description = "Removes the \"Sale\" bar in articles, the Subscribe links, and the subscription pop-ups.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PaywallMeterSnackbarFingerprint.method.returnEarly(
            """
                const/16 v0, 0x8
                invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                if-eqz p2, :msp_done
                invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V
                :msp_done
                return-void
            """,
        )

        // The front's subscription offer sheets.
        val offers = setOf("showFreeTrialModal", "showWinbackModal", "showAdFreeModal")
        val frontUtils = mutableClassDefBy("Lcom/gannett/android/news/features/base/front/FrontUtils;")
        val sheets = frontUtils.methods.filter { it.name in offers && it.returnType == "V" }
        if (sheets.map { it.name }.toSet() != offers) {
            throw PatchException("Subscription offer sheets not found: ${offers - sheets.map { it.name }.toSet()}")
        }
        sheets.forEach { it.returnEarly("return-void") }

        SubscribeMenuButtonFingerprint.method.returnEarly(RETURN_FALSE)
        FrontToastEnabledFingerprint.method.returnEarly(RETURN_FALSE)
        ModalEnabledFingerprint.method.returnEarly(RETURN_FALSE)

        // The first hasAccess(Context) in updateGreeting decides whether the
        // header shows "Subscribe"; its result now reads true.
        UpdateGreetingFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val call = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.name == "hasAccess" && ref.returnType == "Z"
                    }
            }
            if (call < 0 || instructions[call + 1].opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Subscribe button access check not found")
            }
            val register = (instructions[call + 1] as OneRegisterInstruction).registerA
            addInstruction(call + 2, "const/16 v$register, 0x1")
        }
    }
}
