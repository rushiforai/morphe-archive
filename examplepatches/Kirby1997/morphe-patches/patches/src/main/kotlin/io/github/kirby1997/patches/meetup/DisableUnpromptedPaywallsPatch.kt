package io.github.kirby1997.patches.meetup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Belt-and-braces for paywall popups that appear WITHOUT the user tapping a gated
// feature (the "unprompted" paywalls). The existing MemberSub/StepUp onCreate
// chokepoints in DisableSubscriptionPaywallsPatch catch paywalls once their Activity
// starts, but Meetup also has feature flags that decide whether to *raise* an
// unprompted paywall at all. Forcing both flags false stops those popups upstream of
// the Activity, and covers Compose bottom-sheet variants that never route through the
// patched Activities.
//
// AppSettings.getShouldShowUnpromptedPaywall()Z       -> generic unprompted paywall
// AppSettings.getShouldShowEventUnpromptedPaywall()Z  -> event-page unprompted paywall
private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

object ShouldShowUnpromptedPaywallFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/meetup/base/settings/AppSettings;",
    name = "getShouldShowUnpromptedPaywall",
)

object ShouldShowEventUnpromptedPaywallFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/meetup/base/settings/AppSettings;",
    name = "getShouldShowEventUnpromptedPaywall",
)

@Suppress("unused")
val disableUnpromptedPaywallsPatch = bytecodePatch(
    name = "Disable unprompted paywalls",
    description = "Forces AppSettings.getShouldShowUnpromptedPaywall / getShouldShowEventUnpromptedPaywall to false so Meetup+ paywalls do not pop up on their own.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        ShouldShowUnpromptedPaywallFingerprint.method.addInstructions(0, RETURN_FALSE)
        ShouldShowEventUnpromptedPaywallFingerprint.method.addInstructions(0, RETURN_FALSE)
    }
}
