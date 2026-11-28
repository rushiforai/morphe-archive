package semicoloncolonel.mobilestream.patches.cbsnews.misc

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News 5.20 shows Qualtrics surveys, and the rate-the-app prompt that a
// survey can lead to, from three targeting calls in QualtricsService.

private const val QUALTRICS = "Lcom/treemolabs/apps/cbsnews/ui/service/QualtricsService;"

private fun qualtricsFingerprint(name: String) = object : Fingerprint(
    definingClass = QUALTRICS,
    name = name,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;"),
) {}

// Part of hidePromptsAndPopupsPatch: runs only when its "surveys" option is on.
internal val hideSurveysPatch = bytecodePatch {
    dependsOn(disableSignatureCheckPatch)

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "surveys")) return@execute
        listOf("startPromptTargetting", "startNotificationTargetting", "startPromptCBSNTargetting").forEach {
            qualtricsFingerprint(it).method.returnEarly("return-void")
        }
    }
}
