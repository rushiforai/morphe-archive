package app.template.patches.reddit.diagnostic

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.reddit.premium.AccountJsonAdapterConstructorFingerprint
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY

/**
 * DIAGNOSTIC - not a fix. Installs an uncaught-exception hook via a
 * zero-argument injection into Reddit's AccountJsonAdapter constructor
 * (Moshi builds the adapter during /api/v1/me parsing — essentially every
 * cold start). When the app crashes (e.g. the reported "crash after saving a
 * post"), the hook writes the full stack trace + device/app header to
 * Downloads/reddit-crash-*.txt (MediaStore - no permission needed) and then
 * chains to the original handler, preserving normal crash behavior.
 *
 * WHY THIS ANCHOR: no Reddit Application class descriptor is verified in
 * this environment (no APK decompiled here), and inventing one would either
 * hard-fail the patcher or silently miss on every build. The account
 * adapter fingerprint is verified on 2026.42.0 and is build-shape-matched
 * (class + single <init> with one reference parameter). If a future build
 * drops it, the failure is LOUD at patch time, never at runtime.
 *
 * Install semantics: the handler installs on the FIRST account-sync after
 * launch; anything crashing before it (startup crashes before session sync)
 * is NOT captured. After it, the handler is process-wide.
 *
 * Overhead when idle: zero beyond a single AtomicBoolean check the app
 * doesn't otherwise see (hook does nothing until a crash). Default OFF so it
 * never ships accidentally in end-user builds.
 */
@Suppress("unused")
val redditDiagnosticCrashLogPatch = bytecodePatch(
    name = "Reddit: Diagnostic crash log",
    description = "DIAGNOSTIC ONLY - writes the full stack trace to Downloads/reddit-crash-*.txt " +
        "when the app crashes, for remote diagnosis. Off by default; enable when asked to " +
        "produce a crash log. Installs on the first account sync after launch; crashes before " +
        "that are not captured. Chain-forwards to the original crash handler.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        AccountJsonAdapterConstructorFingerprint.method.apply {
            addInstructions(
                0,
                "invoke-static {}, Lapp/template/extension/extension/RedditDiagHook;->installWithAppContext()V",
            )
        }
    }
}
