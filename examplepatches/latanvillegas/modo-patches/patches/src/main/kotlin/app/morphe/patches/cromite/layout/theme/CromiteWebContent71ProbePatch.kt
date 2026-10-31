package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Separate opt-in runtime probe. Never edits the native theme, web renderer,
 * WebsitePreferenceBridge, or the 14 existing functional patches.\n * DEX verified: ChromeTabbedActivity.onResume()V is present;\n * onResumeWithNative()V is absent. Runtime profile access remains unverified.
 */
private val cromiteResumeForWebProbe = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/ChromeTabbedActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val cromiteWebContent71ProbePatch = bytecodePatch(
    name = "Cromite web content-setting 71 read-only probe",
    description = "Opt-in diagnostic hook; runtime preference defaults to disabled.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    extendWith("extensions/cromite.mpe")
    execute {
        classDefBy("Lapp/morphe/extension/cromite/amoled/WebContent71Probe;")
        val resume = cromiteResumeForWebProbe.method
        checkNotNull(resume.implementation) { "Verified onResume method unavailable" }
        resume.addInstructions(
            0,
            "invoke-static {p0}, " +
                "Lapp/morphe/extension/cromite/amoled/WebContent71Probe;->onNativeResume(Landroid/app/Activity;)V",
        )
    }
}
