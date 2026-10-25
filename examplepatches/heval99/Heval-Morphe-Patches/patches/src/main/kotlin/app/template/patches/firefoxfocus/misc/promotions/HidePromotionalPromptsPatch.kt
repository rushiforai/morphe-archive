package app.template.patches.firefoxfocus.misc.promotions

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.firefoxfocus.misc.shared.forceDelegateReadsFalse
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS

// The Nimbus "onboarding" feature (generated from nimbus.fml.yaml, kept names). Its flags default to
// false on release builds and Mozilla turns them on through experiments and rollouts.
//  - is-cfr-enabled gates every tip bubble: "Start browsing" on the home screen, the tracking
//    protection shield and erase-tabs tips (CfrMiddleware) and the privacy settings tooltip.
//  - is-promote-search-widget-dialog-enabled gates the "Add search widget" dialog shown after the
//    first and fifth erase (inlined into MainActivity's erase handler).
// The onboarding screens themselves (is-enabled) are left alone.
internal const val ONBOARDING = "Lorg/mozilla/focus/nimbus/Onboarding;"
private val PROMPT_DELEGATES = listOf("isCfrEnabled\$delegate", "isPromoteSearchWidgetDialogEnabled\$delegate")

@Suppress("unused")
val hidePromotionalPromptsPatch = bytecodePatch(
    name = "Hide promotional prompts",
    description = "Hides the search widget promo and tip bubbles.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    execute {
        // Every read of both flags answers false, whatever an experiment sets. The feature's own
        // isCfrEnabled() getter is one of the reads.
        PROMPT_DELEGATES.forEach { forceDelegateReadsFalse(ONBOARDING, it) }
    }
}
