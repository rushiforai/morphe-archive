// recon 2026-11-09
package app.template.patches.ivy.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.IVY_COMPATIBILITY
import app.template.patches.shared.returnEarly

@Suppress("unused")
val ivyTelemetryPatch = bytecodePatch(
 name = "Disable telemetry",
 description = "Disables Fabric, Crashlytics, and Answers analytics.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 execute {
  // Fabric.with(): return null before any kit is built or installed.
  FabricWithFingerprint.method.addInstructions(
   0,
   """
   const/4 v0, 0
   return-object v0
   """.trimIndent(),
  )

  // Crashlytics.log(): no-op before checkInitialized().
  CrashlyticsLogFingerprint.method.returnEarly()

  // Crashlytics.logException(): no-op before checkInitialized().
  CrashlyticsLogExceptionFingerprint.method.returnEarly()

  // Answers.getInstance(): return null so the app never depends on Fabric.getKit().
  AnswersGetInstanceFingerprint.method.addInstructions(
   0,
   """
   const/4 v0, 0
   return-object v0
   """.trimIndent(),
  )

  // AnalyticsController.isEnabled(): always false.
  AnalyticsControllerIsEnabledFingerprint.method.returnEarly(false)
 }
}
