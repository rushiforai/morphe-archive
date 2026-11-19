/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.all.internet

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.Method

private val SDK_KEYWORDS = listOf(
    // Google / Firebase
    "firebase", "crashlytics", "gms/analytics", "googleanalytics",
    "play/services/analytics", "firebase/analytics", "firebase/crashlytics",

    // Common crash reporters
    "sentry", "bugsnag", "raygun", "acra", "bugly", "appcenter",
    "hockeyapp", "crittercism", "apteligent", "newrelic", "datadog",
    "telemetry", "crashreport", "diagnostic",

    // Analytics / attribution
    "adjust", "appsflyer", "branch/index", "mixpanel", "amplitude",
    "segment", "snowplow", "countly", "matomo", "piwik", "appmetrica",
    "metrica", "umeng", "baidu", "talkingdata", "fabric",

    // Engagement / messaging / session replay
    "onesignal", "braze", "airship", "clevertap", "kochava",
    "singularity", "leanplum", "localytics", "taplytics",
    "posthog", "fullstory", "hotjar", "logrocket", "openreplay",
    "intercom", "zendesk", "instabug",

    // OpenTelemetry / generic tracing
    "opentelemetry", "otel",
)

private val VERB_RE = Regex(
    "^(log|track|report|capture|record|send|upload|submit|put|identify|alias|" +
        "group|screen|flush|monitor|trace|span|metric|event|ping|heartbeat|" +
        "beacon|emit|dispatch|ingest)s?$",
    RegexOption.IGNORE_CASE,
)

private val COMPOUND_RE = Regex(
    "^(log|track|report|capture|record|send|upload|submit|identify|alias|" +
        "group|screen|flush|monitor|trace|span|metric|event|ping|heartbeat|" +
        "beacon|emit|dispatch|ingest)" +
        "(Event|Events|Exception|Exceptions|Error|Errors|Crash|Crashes|" +
        "Message|Messages|Breadcrumb|Breadcrumbs|Request|Requests|" +
        "Response|Responses|Metric|Metrics|Trace|Traces|Span|Spans|" +
        "Session|Sessions|User|Users|Property|Properties|Installation|" +
        "Install|Open|Close|Start|End|Begin|Finish|Add|Set|Write|Post|" +
        "Fetch|Sync|Batch|Batches|Queue|Network|Thread)$",
    RegexOption.IGNORE_CASE,
)

private val INIT_RE = Regex(
    "^(init|activate|start|configure|setUp|setup|install|create)$",
    RegexOption.IGNORE_CASE,
)

private fun isSdkClass(type: String): Boolean {
    val t = type.lowercase()
    return SDK_KEYWORDS.any { t.contains(it) }
}

private fun isTelemetryMethodName(name: String): Boolean = VERB_RE.matches(name) || COMPOUND_RE.matches(name)

/**
 * Void/boolean-only safe tier.
 *
 * Object-returning methods are deliberately left alone. Returning null from an
 * SDK API that callers expect to be non-null is how patches become NPE factories.
 */
private fun noOpSafe(m: MutableMethod) {
    if (m.implementation == null) return

    when (m.returnType) {
        "V" -> m.returnEarly()
        "Z" -> m.returnEarly(false)
    }
}

@Suppress("unused")
val telemetryKillPatch = patch(
    name = "Telemetry / crash-reporter kill",
    description = "No-ops analytics, crash-reporting and telemetry SDK calls.",
    default = false,
) {
    val killInit by booleanOption(
        key = "killInit",
        default = false,
        title = "Also kill SDK initialization",
        description = "Aggressive: no-ops init/activate/start/configure methods in SDK classes. " +
            "May break apps that require SDK init to run. Off by default.",
    )

    execute {
        classDefForEach { classDef ->
            if (!isSdkClass(classDef.type)) return@classDefForEach

            val targets = classDef.methods.filter { m: Method ->
                m.implementation != null &&
                    (
                        (
                            isTelemetryMethodName(m.name) &&
                                (m.returnType == "V" || m.returnType == "Z")
                            ) ||
                            (
                                killInit == true &&
                                    INIT_RE.matches(m.name) &&
                                    m.returnType == "V"
                                )
                        )
            }

            if (targets.isEmpty()) return@classDefForEach

            val mc = mutableClassDefBy(classDef)
            targets.forEach { mc.findMutableMethodOf(it).let(::noOpSafe) }
        }
    }
}
