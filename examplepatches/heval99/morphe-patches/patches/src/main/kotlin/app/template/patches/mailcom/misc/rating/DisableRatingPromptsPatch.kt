package app.template.patches.mailcom.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM
import com.android.tools.smali.dexlib2.Opcode

// MailListModuleAdapterImpl.shouldStartInAppFlow (9.21.2): true at most once per 30 s. On a
// MailSentEvent, MailListFragment reads it through the MailListModuleAdapter interface and then
// calls launchInAppReviewFlow, the app's only Play review request. Up to 9.20.2 it delegated to
// InAppRatingManager.canRequestInAppReviewFlow; R8 inlined that into this method since 9.21.2.
// Anchored on the kept method name, no parameters, boolean, and the lastRequestedReviewFlow
// field it stores (a Kotlin property name; the interface declaration has no body).
internal object ShouldStartInAppFlowFingerprint : Fingerprint(
    name = "shouldStartInAppFlow",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(fieldAccess(name = "lastRequestedReviewFlow", opcode = Opcode.IPUT_WIDE)),
    custom = { method, _ -> method.implementation != null },
)

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
) {
    compatibleWith(COMPATIBILITY_MAILCOM)

    execute {
        ShouldStartInAppFlowFingerprint.method.returnEarly(false)
    }
}
