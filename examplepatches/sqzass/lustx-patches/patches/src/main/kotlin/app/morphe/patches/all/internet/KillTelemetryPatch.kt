package app.morphe.patches.all.telemetry

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly

private val SDK_KEYWORDS = listOf(
    "firebase", "crashlytics", "gms/analytics", "googleanalytics", "adjust", "sentry",
    "acra", "bugly", "appmetrica", "metrica", "mixpanel", "amplitude", "segment/analytics",
    "branch/index", "appsflyer", "umeng", "fabric", "crittercism", "hockeyapp", "apteligent",
    "newrelic", "datadog", "bugsnag", "raygun", "countly", "snowplow", "telemetry",
    "crashreport", "diagnostic",
)
private val VERB_RE = Regex(
    "^(log|track|report|capture|record|send|upload|submit|put|identify|alias|group|screen|flush|monitor|trace|span|metric|event)s?$",
    RegexOption.IGNORE_CASE,
)
private val INIT_RE = Regex("^(init|activate|start|configure|setUp|setup|install|create)$", RegexOption.IGNORE_CASE)

private fun isSdkClass(type: String) = type.lowercase().let { t -> SDK_KEYWORDS.any { t.contains(it) } }

/** void -> return, boolean -> false. Leaves object/primitive untouched (safe tier). */
private fun noOpSafe(m: com.android.tools.smali.dexlib2.iface.Method) {
    val mm = m as? app.morphe.patcher.util.proxy.mutableTypes.MutableMethod ?: return
    when (mm.returnType.first()) {
        'V' -> mm.returnEarly()
        'Z' -> mm.returnEarly(false)
    }
}

/** Also nulls object/array returns (used only for known SDK entry points). */
private fun noOpAny(m: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    when (m.returnType.first()) {
        'V' -> m.returnEarly()
        'Z' -> m.returnEarly(false)
        'L', '[' -> m.returnEarly(null as Void?)
    }
}

@Suppress("unused")
val telemetryKillPatch = bytecodePatch(
    name = "Telemetry / crash-reporter kill",
    description = "Silences analytics, crash-reporting and telemetry SDKs (Firebase, Sentry, Adjust, " +
        "Mixpanel, Amplitude, Segment, AppMetrica, Bugly, ACRA, etc.).",
    default = false,
) {
    val killInit by booleanOption(
        key = "killInit",
        default = false,
        title = "Also kill SDK initialization",
        description = "Aggressive: no-ops init/activate/start in SDK classes. May break apps that " +
            "require SDK init to run. Off by default.",
    )

    execute {
        // Tier A: object-returning capture methods (Sentry) -> null.
        mutableClassDefByOrNull("Lio/sentry/Sentry;")
            ?.methods?.filter { it.name.startsWith("capture") }?.forEach { noOpAny(it) }

        // Tier B + C: generic keyword+verb sweep over bundled SDK dex.
        classDefForEach { classDef ->
            if (!isSdkClass(classDef.type)) return@classDefForEach
            val targets = classDef.methods.filter { m ->
                (VERB_RE.matches(m.name) && (m.returnType == "V" || m.returnType == "Z")) ||
                    (killInit == true && INIT_RE.matches(m.name) && m.returnType == "V")
            }
            if (targets.isEmpty()) return@classDefForEach
            val mc = mutableClassDefBy(classDef)
            targets.forEach { mc.findMutableMethodOf(it).let(::noOpSafe) }
        }
    }
}
