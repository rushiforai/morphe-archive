package app.template.patches.firefox.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.firefoxClass
import app.template.patches.firefox.shared.implementersOf
import app.template.patches.firefox.shared.insns
import app.template.patches.firefox.shared.methodRef
import app.template.patches.firefox.shared.params
import app.template.patches.firefox.shared.readClass
import app.template.patches.firefox.shared.returnNull
import app.template.patches.firefox.shared.settingsGetter
import app.template.patches.firefox.shared.smali
import app.template.patches.firefox.shared.typeRef
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode

internal const val PING_UPLOADER = "Lmozilla/telemetry/glean/net/PingUploader;"
internal const val CONCEPT_FETCH_UPLOADER = "Lmozilla/components/service/glean/net/ConceptFetchHttpUploader;"
internal const val CAPABLE_PING_UPLOAD_REQUEST = "Lmozilla/telemetry/glean/net/CapablePingUploadRequest;"
internal const val UPLOAD_RESULT_HTTP_STATUS = "Lmozilla/telemetry/glean/internal/UploadResult\$HttpStatus;"

internal val TELEMETRY_SETTINGS = listOf(
    "isTelemetryEnabled",
    "isDailyUsagePingEnabled",
    "isMarketingTelemetryEnabled",
    "isExperimentationEnabled",
)

internal const val ADJUST = "Lcom/adjust/sdk/Adjust;"

// The Adjust statics Fenix calls (AdjustMetricsService, AdjustThirdPartySharingController).
internal val ADJUST_STATICS = listOf(
    "initSdk" to listOf("Lcom/adjust/sdk/AdjustConfig;"),
    "enable" to emptyList(),
    "trackEvent" to listOf("Lcom/adjust/sdk/AdjustEvent;"),
    "trackThirdPartySharing" to listOf("Lcom/adjust/sdk/AdjustThirdPartySharing;"),
    "gdprForgetMe" to listOf("Landroid/content/Context;"),
)

internal const val CRASH_REPORTER_SERVICE = "Lmozilla/components/lib/crash/service/CrashReporterService;"
internal const val SENTRY_SERVICE = "Lmozilla/components/lib/crash/sentry/SentryService;"
internal const val SOCORRO_SERVICE = "Lmozilla/components/lib/crash/service/socorro/MozillaSocorroService;"
internal const val NIMBUS = "Lorg/mozilla/experiments/nimbus/Nimbus;"

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables telemetry and crash report uploads.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // ── 1. Glean: every ping upload answers HTTP 200 without touching the network ──────
        //  The uploader is Glean's only way out, and some pings (deletion-request,
        //  usage-reporting, onboarding opt-out) are sent whatever the toggle says. A 200 makes
        //  Glean drop the ping as delivered, so nothing queues up and retries. Every concrete
        //  PingUploader that builds an HttpStatus is hooked; BaseUploader only delegates. The
        //  HttpStatus(I) constructor is copied from the method (Incapable and RecoverableFailure
        //  were narrowed to (B) by R8 and are not used).
        val uploaders = mutableListOf<String>()
        for (type in implementersOf(PING_UPLOADER)) {
            val builds = readClass(type).methods.any { method ->
                method.name == "upload" && method.params() == listOf(CAPABLE_PING_UPLOAD_REQUEST) &&
                    method.insns().any { it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == UPLOAD_RESULT_HTTP_STATUS }
            }
            if (!builds) continue
            val upload = concreteMethod(type, "upload", listOf(CAPABLE_PING_UPLOAD_REQUEST))
            val insns = upload.insns()
            val constructor = insns.firstNotNullOfOrNull { insn ->
                insn.methodRef()?.takeIf {
                    insn.opcode == Opcode.INVOKE_DIRECT && it.definingClass == UPLOAD_RESULT_HTTP_STATUS &&
                        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
                }
            } ?: throw PatchException("$type->upload builds an HttpStatus without its (I) constructor")
            val implementation = upload.implementation!!
            if (implementation.registerCount - upload.params().size - 1 < 2) {
                throw PatchException("$type->upload has fewer than 2 locals")
            }
            upload.addInstructionsChecked(
                0,
                """
                    new-instance v0, $UPLOAD_RESULT_HTTP_STATUS
                    const/16 v1, 0xc8
                    invoke-direct {v0, v1}, ${constructor.smali()}
                    return-object v0
                """,
            )
            uploaders += type
        }
        if (CONCEPT_FETCH_UPLOADER !in uploaders) {
            throw PatchException("Disable telemetry: $CONCEPT_FETCH_UPLOADER->upload not hooked (hooked: $uploaders)")
        }

        // ── 2. Telemetry, daily usage ping, marketing (Adjust) and Studies read as off ──────
        //  Glean.initialize and the crash reporter still run (Nimbus reports its own errors
        //  through crashReporter.submitCaughtException), they just get upload disabled.
        TELEMETRY_SETTINGS.forEach { settingsGetter(it).returnEarly(false) }

        // ── 3. Adjust: the SDK never starts, tracks or shares anything ──────────────────────
        //  BuildConfig.ADJUST_TOKEN is left alone; the marketing switch above already keeps
        //  AdjustMetricsService from calling these, so this is the backstop.
        ADJUST_STATICS.forEach { (name, parameters) -> concreteMethod(ADJUST, name, parameters).returnEarly() }

        // ── 4. Crash reports: Sentry never initialises and no crash service uploads ─────────
        //  CrashReporter.onCrash is untouched, so the local "Firefox crashed" screen still
        //  shows. Every concrete report overload on every CrashReporterService answers at once:
        //  the crash ones (String report id, nullable) with null, report(Throwable, ArrayList)
        //  (caught exceptions, narrowed to V by R8) with return-void. Shapes are read from the
        //  methods, not pinned.
        concreteMethod(SENTRY_SERVICE, "initIfNeeded", emptyList()).returnEarly()
        val services = mutableListOf<String>()
        for (type in implementersOf(CRASH_REPORTER_SERVICE)) {
            val reports = firefoxClass(type).methods.filter { it.name == "report" && it.implementation != null }
            if (reports.size < 2) {
                throw PatchException("$type has ${reports.size} concrete report overloads, expected the crash and exception ones")
            }
            reports.forEach { report ->
                when {
                    report.returnType == "V" -> report.returnEarly()
                    report.returnType.startsWith("L") -> report.returnNull()
                    else -> throw PatchException("$type->report returns ${report.returnType}")
                }
            }
            services += type
        }
        listOf(SENTRY_SERVICE, SOCORRO_SERVICE).forEach {
            if (it !in services) throw PatchException("Disable telemetry: crash service $it not found (found $services)")
        }

        // ── 5. Nimbus: no experiment downloads ──────────────────────────────────────────────
        //  Its callers don't check the Studies switch. Remote Settings in general is untouched
        //  (search engines, blocklists).
        concreteMethod(NIMBUS, "fetchExperiments", emptyList()).returnEarly()
    }
}
