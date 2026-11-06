package app.template.patches.firefox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FIREFOX_COMPATIBILITY

/**
 * Shaves real, verifiable work off every cold start of Firefox for Android
 * (Fenix), which is what the user perceives as sluggish open/close. Verified
 * against 158.0.2:
 *
 * - setStartupMetrics\$app() is a 4,400-line suspend routine executed on every
 *   launch whose ENTIRE observable effect is writing ~44 boolean + ~20 string
 *   metrics to the telemetry store (body audit: zero writes to app state).
 *   It reads a dozen preferences/storages on every cold start purely for
 *   instrumentation. Skipping it removes that I/O without changing behavior.
 * - The runOnVisualCompleteness lambda that force-fetches Nimbus experiments
 *   right after first visual render adds network + CPU work to the critical
 *   startup window. It is redundant when experiments are unused and safe to
 *   skip (fetches are periodic background work elsewhere).
 *
 * This patch is deliberately independent from the "Block Firefox telemetry"
 * patch: it helps even if that one stays disabled, though combining both
 * removes the most startup overhead. Fail-open as always: a renamed method
 * simply stays and everything else patches.
 */
@Suppress("unused")
val improveStartupPerformancePatch = bytecodePatch(
    name = "Improve startup performance",
    description = "Skips two launch-time routines whose only job is metrics/experiments upkeep: the " +
        "4k-line startup-metrics coroutine (pure telemetry writes, ~64 metric writes per launch) and the " +
        "forced Nimbus experiment fetch right after first render. Less launch I/O = faster, smoother " +
        "open/close. Browser features unchanged.",
    default = true,
) {
    compatibleWith(FIREFOX_COMPATIBILITY)

    execute {
        // Startup-metrics coroutine: suspend fn -> return Unit immediately.
        Fingerprint(
            definingClass = "Lorg/mozilla/fenix/FenixApplication;",
            name = "setStartupMetrics\$app",
            returnType = "Ljava/lang/Object;",
            parameters = listOf(
                "Lmozilla/components/browser/state/store/BrowserStore;",
                "Lorg/mozilla/fenix/utils/Settings;",
                "Lorg/mozilla/fenix/settings/doh/DefaultDohSettingsProvider;",
                "Lorg/mozilla/fenix/components/metrics/MozillaProductDetector;",
                "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
            ),
        ).method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """.trimIndent(),
        )

        // Forced Nimbus experiments fetch posted at first visual completeness.
        Fingerprint(
            definingClass =
                "Lorg/mozilla/fenix/FenixApplication\$queueNimbusFetchInForeground\$\$inlined\$runOnVisualCompleteness\$1;",
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """.trimIndent(),
        )
    }
}
