package semicoloncolonel.mobilestream.patches.cvs.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.cvs.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// CVS 26.10.50 keeps its AI switches as plainly named getters on its config
// and screen-state classes: AI search in the help center (which runs Google's
// Gemini Nano on the phone and can download the model), AI insights, AI
// summaries of health visits, lab results and claims, the AI query prompt
// and proactive AI on pharmacy orders. Each getter now returns false, so the
// app takes its non-AI path.
// ─────────────────────────────────────────────────────────────────────────────

private val AI_GETTERS = setOf(
    "isAiSearchEnabled",
    "isAiInsightsEnabled",
    "isAiSummaryEnabled",
    "getEnableAiSummarization",
    "getEnableAiSummarizationClaims",
    "getShowAiSummary",
    "shouldShowAiSummary",
    "getShowAiQueryPrompt",
    "isPharmacyOrdersProactiveAiEnabled",
)

// The help center's AI configuration: isEnabled() and its data-class component1().
private const val HELP_CENTER_AI_CONFIG = "Lcom/cvs/unified/helpcenter/vm/HelpCenterAiConfig;"

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off AI search, insights, and summaries, and proactive AI on pharmacy orders.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val returnsFalse = { returnType: String ->
            when (returnType) {
                "Z" -> "const/4 v0, 0x0\nreturn v0"
                "Ljava/lang/Boolean;" -> "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0"
                else -> null
            }
        }

        val count = forEachMatchingMethod(
            { classDef -> classDef.type.startsWith("Lcom/cvs/") },
            { method ->
                method.parameterTypes.isEmpty() &&
                    !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                    returnsFalse(method.returnType) != null &&
                    (method.name in AI_GETTERS ||
                        (method.definingClass == HELP_CENTER_AI_CONFIG &&
                            (method.name == "isEnabled" || method.name == "component1")))
            },
        ) { method ->
            // v0 may be p0 in a getter without locals; the method returns at once, so that is fine.
            method.returnEarly(returnsFalse(method.returnType)!!)
        }
        if (count == 0) throw PatchException("CVS AI getters not found")
    }
}
