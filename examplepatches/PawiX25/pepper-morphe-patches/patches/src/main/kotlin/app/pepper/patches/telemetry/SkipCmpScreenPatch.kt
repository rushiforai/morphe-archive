package app.pepper.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.clearBody
import app.pepper.patches.shared.ensureRegisters
import app.pepper.patches.shared.PEPPER_FAMILY

/**
 * Skip the Usercentrics CMP screen and its synchronous fetch wait during
 * cold start, sending the user straight to the notification-permission
 * prompt and then the feed.
 *
 * T1 already redirects every Usercentrics host to localhost; the SDK
 * times out and the app falls through to a "reject all" default. What
 * T1 alone does NOT shorten is the OkHttp wait that holds the splash
 * for a couple of seconds while the consent fetch fails. This patch
 * cuts that wait and the consent screen render to zero by rewriting
 * the AppStartProcess navigator's choke-point converter to always
 * return `new RequiredSteps(showCmp = false, showNotifPrompt = true)`.
 *
 * The original method ships with `.registers 2`; we swap in a fresh
 * 3-register `MutableMethodImplementation` (also drops any try-blocks
 * the original carried). `notifPrompt = true` is safe — Android's
 * runtime permission API is idempotent.
 */
@Suppress("unused")
val skipCmpScreenPatch = bytecodePatch(
    name = "Skip Usercentrics consent screen",
    description = "Skips the Usercentrics consent screen and its loading " +
        "wait on cold start.",
) {
    compatibleWith(*PEPPER_FAMILY)

    dependsOn(redirectTrackerUrlsPatch)

    val requiredStepsType =
        "Lcom/pepper/presentation/appstartprocess/AppStartProcessRequiredSteps;"

    execute {
        val method = AppStartRequiredStepsConverterFingerprint.method
        method.ensureRegisters(3)
        method.clearBody()
        method.addInstructions(
            0,
            """
            new-instance v0, $requiredStepsType
            const/4 v1, 0x0
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, $requiredStepsType-><init>(ZZ)V
            return-object v0
            """.trimIndent(),
        )
    }
}
