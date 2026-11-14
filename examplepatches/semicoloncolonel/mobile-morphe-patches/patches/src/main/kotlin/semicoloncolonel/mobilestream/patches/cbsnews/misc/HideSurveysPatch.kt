package semicoloncolonel.mobilestream.patches.cbsnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
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

@Suppress("unused")
val hideSurveysPatch = bytecodePatch(
    name = "Hide surveys",
    description = "Stops the Qualtrics surveys and the rating prompt they can lead to.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableSignatureCheckPatch)

    execute {
        listOf("startPromptTargetting", "startNotificationTargetting", "startPromptCBSNTargetting").forEach {
            qualtricsFingerprint(it).method.returnEarly("return-void")
        }
    }
}
