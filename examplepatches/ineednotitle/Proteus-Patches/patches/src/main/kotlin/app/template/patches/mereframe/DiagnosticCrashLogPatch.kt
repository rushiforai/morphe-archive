package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY

/**
 * DIAGNOSTIC - not a fix. Installs an uncaught-exception hook at
 * UnnamedApp.onCreate entry. When the app crashes (e.g. the re-signed-build
 * camera-preview crash reported on realme/Android 16), the hook writes the
 * full FATAL stack trace to a user-visible file
 * (Downloads/mereframe-crash-*.txt via MediaStore - no permission needed)
 * and then chains to the original handler, preserving normal crash behavior.
 *
 * Ship workflow: user enables this patch, reproduces the crash, opens
 * Files -> Downloads -> attaches the newest mereframe-crash-*.txt - that
 * stack trace pinpoints the faulting class/method and lets the real fix be
 * surgical instead of guess-driven.
 *
 * Overhead when idle: zero (hook does nothing until a crash). Default OFF so
 * it never ships accidentally in end-user builds.
 */
@Suppress("unused")
val diagnosticCrashLogPatch = bytecodePatch(
    name = "Diagnostic crash log",
    description = "DIAGNOSTIC ONLY - writes the full stack trace to Downloads/mereframe-crash-*.txt " +
        "when the app crashes, for remote diagnosis. Off by default; enable when asked to produce a " +
        "crash log. Chain-forwards to the original crash handler.",
    default = false,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            definingClass = "Lapp/unnamed/rawrecording/UnnamedApp;",
            name = "onCreate",
            returnType = "V",
            parameters = emptyList(),
        ).method.apply {
            addInstructions(
                0,
                "invoke-static {p0}, Lapp/template/extension/extension/MereframeDiagHook;->install(Landroid/content/Context;)V",
            )
        }
    }
}
