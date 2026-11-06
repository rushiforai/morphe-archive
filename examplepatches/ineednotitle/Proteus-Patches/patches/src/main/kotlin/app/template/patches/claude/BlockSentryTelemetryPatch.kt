package app.template.patches.claude

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CLAUDE_COMPATIBILITY

/**
 * Claude (Anthropic) runs exactly one live third-party telemetry stack:
 * Sentry (crash reports, error capture, tracing/performance). The audit of
 * 1.261023.20 (vc 26102320, unpacked from the official XAPK) shows:
 *
 * - Exactly ONE Sentry init site (application bootstrap), via obfuscated
 *   Lio/sentry/android/core/w1;->b(...), handed a configurator object of
 *   Anthropic's own class com.anthropic.claude.sentry.b.
 * - That configurator's ONLY method c(SentryAndroidOptions)V writes the DSN
 *   (ingest.us.sentry.io/4507346684477440), tags, session-tracking and
 *   attachment settings.
 *
 * Sentry's own documented behavior with an unset/null DSN is to initialize
 * as DISABLED - every capture() becomes a guaranteed no-op, performance
 * instrumentation checks hub.isEnabled() and skips itself, the cache/envelope
 * pipeline never starts. Therefore head-returning the configurator kills the
 * whole Sentry stack through a single, side-effect-free point: nothing in the
 * app ever dereferences the (void) configurator - the SDK simply comes up
 * dead. SentryInitProvider is manifest disabled (io.sentry.auto-init=false);
 * SentryPerformanceProvider stays harmless once the hub is disabled.
 *
 * What this patch does NOT touch: Anthropic's first-party product analytics
 * (WorkManager event flushes to claude.ai - the same first-party API host the
 * app itself needs), which cannot be blocked without breaking the app.
 * Datadog/Segment classes exist in the dex but are never initialized
 * (dead library code; audit found zero init references), so nothing to kill.
 *
 * This patch can never flip usage limits / Pro entitlements - those are
 * computed server-side at api.claude.ai. (Scope note, deliberate.)
 *
 * Fail-open: fingerprint throws -> patch reports failure, app untouched.
 */
@Suppress("unused")
val blockSentryTelemetryPatch = bytecodePatch(
    name = "Block Sentry telemetry",
    description = "Disables Sentry crash/error/performance telemetry entirely by neutralizing the " +
        "configurator that writes the DSN - with no DSN set, Sentry self-disables. Fixes nothing " +
        "to break: the configurator's return is void and unused. Verified against 1.261023.20.",
    default = true,
) {
    compatibleWith(CLAUDE_COMPATIBILITY)

    execute {
        Fingerprint(
            definingClass = "Lcom/anthropic/claude/sentry/b;",
            name = "c",
            returnType = "V",
            parameters = listOf("Lio/sentry/android/core/SentryAndroidOptions;"),
        ).method.addInstructions(0, "return-void")
    }
}
