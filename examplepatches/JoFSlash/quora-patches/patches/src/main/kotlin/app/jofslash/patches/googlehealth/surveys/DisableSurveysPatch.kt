package app.jofslash.patches.googlehealth.surveys

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// The survey library's network connection (obfuscated). One method sends the trigger request that
// asks Google whether to show a survey; another reports a failed request to the app.
internal object SurveyTriggerRequestFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Could not get channel for trigger."),
)

internal object SurveyRequestFailedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("RequestSurveyCallback was null for trigger request."),
)

/** The code the survey library itself reports when a trigger request fails. */
private const val REQUEST_FAILED = 5

@Suppress("unused")
val disableSurveysPatch = bytecodePatch(
    name = "Disable surveys",
    description = "Stops the app from asking Google for surveys, such as \"How satisfied are you with " +
            "Google Health?\", so none are shown.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        val failed = SurveyRequestFailedFingerprint.method
        if (failed.definingClass != SurveyTriggerRequestFingerprint.method.definingClass) {
            throw IllegalStateException("The survey request methods are not in the same class anymore")
        }
        // Answer every trigger request as failed, without sending it.
        SurveyTriggerRequestFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, $REQUEST_FAILED
                invoke-virtual { p0, v0 }, ${failed.definingClass}->${failed.name}(I)V
                return-void
            """
        )
    }
}
