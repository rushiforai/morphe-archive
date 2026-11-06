// Ported from xob0t/morphe-patches (GPLv3), app/avito/patches/privacy/DisableTelemetryPatch.kt.
package app.ru_apps.avito.privacy

import app.ru_apps.avito.Constants.COMPATIBILITY_AVITO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency

/**
 * Avito bundles AppMetrica (confirmed live, 2297 `io.appmetrica.analytics.*` classes including
 * the full `AppMetrica`/`AppMetricaLibraryAdapter`/`ModulesFacade` facade trio — not a stripped
 * unused dependency) and Yandex's Varioqub A/B-testing SDK (`com.yandex.varioqub.*`), whose
 * `VarioqubConfigReporter`/`AppMetricaAdapter` report experiment-bucket assignment through that
 * same AppMetrica facade. Neither was disabled anywhere in this app's patch set before — the
 * shared, already-verified (MAX/Sberbank/T-Bank/RuStore) generic AppMetrica facade disable closes
 * both at once instead of writing a second bespoke Varioqub-specific patch.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables Avito first-party clickstream analytics, Avito's direct Adjust telemetry wrapper, AppMetrica, and Varioqub A/B-test reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AVITO)

    dependsOn(disableAnalyticsDependency)

    execute {
        // Each telemetry entry point is required on the supported app target.
        // Any missing integration means the patch has drifted and must fail.
        //
        // Clickstream targets 227.0+ first (the ClickStreamEventTracker.c(event)
        // method) and falls back to the older dedicated enqueue runnable. On 227 R8
        // merged that runnable into a shared lambda dispatcher, so the tracker method
        // is the only safe choke point.
        val clickstream = ClickstreamTrackEventFingerprint.methodOrNull
            ?: ClickstreamEnqueueRunnableFingerprint.methodOrNull

        val targets = listOf(
            "clickstream" to clickstream,
            "Adjust init" to AdjustInitFingerprint.methodOrNull,
            "Adjust trackEvent" to AdjustTrackEventFingerprint.methodOrNull,
            "Adjust userId" to AdjustUserIdFingerprint.methodOrNull,
            "Adjust pushToken" to AdjustPushTokenFingerprint.methodOrNull,
        )

        var disabled = 0
        val skipped = mutableListOf<String>()
        targets.forEach { (label, method) ->
            if (method == null) {
                skipped += label
            } else {
                method.addInstructions(0, "return-void")
                disabled++
            }
        }

        if (skipped.isNotEmpty()) {
            throw PatchException(
                "Avito privacy: telemetry entry point(s) not found: ${skipped.joinToString()}.",
            )
        }

        println("Avito privacy: disabled $disabled telemetry entry point(s).")
    }
}
