package app.ru_apps.max

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.max.Constants.COMPATIBILITY_MAX
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Neutralizes two MAX background WorkManager jobs identified in
 * apps/ru.oneme.app/analysis/habr_audit_findings.md:
 *   - C.3 `SampleUploadWorker`: uploads diagnostic sample files to `sdk-api.apptracer.ru`
 *     (OK/VK Tracer SDK).
 *   - C.2 `DailyAnalyticsWorker`: daily collects and reports the status of 7 Android
 *     permissions (push/contacts/files/gallery/camera/microphone/geo) as a `PERMISSION`
 *     analytics event.
 *
 * Earlier investigation (see JOURNAL.md 2026-10-06) considered nop-ing the
 * `WorkManager.enqueue` call site instead (found at `t8n.smali:1609` for
 * SampleUploadWorker), but that requires tracing which of several enqueue call sites in
 * a large method belongs to which worker — fragile across app versions. Patching each
 * worker's own `doWork()` override directly is simpler and more robust: both are
 * `androidx.work.Worker` subclasses overriding `doWork()` with a single zero-arg method
 * returning the (obfuscated) `Result` sealed type — see WorkerFingerprints.kt for why the
 * fingerprint doesn't hardcode that type's name.
 *
 * `Result` has exactly 3 concrete subclasses at runtime (mirroring
 * `androidx.work.ListenableWorker.Result`'s Success/Failure/Retry): one has only a bare
 * no-arg constructor (Retry - never carries data), the other two additionally have a
 * `(Data)`-arg constructor and a data getter (Success/Failure - both may carry output
 * data). We must NOT construct the no-arg-only one: returning Retry from `doWork()`
 * tells WorkManager to reschedule the job, which would just re-run this same patched
 * stub forever (a harmless but wasteful infinite retry loop). Returning either of the
 * two data-carrying variants is safe regardless of which one is "really" Success vs
 * Failure: both are terminal states for a `OneTimeWorkRequest` (no automatic retry), so
 * telling them apart further isn't necessary for this patch's purpose.
 */
@Suppress("unused")
val disableBackgroundTelemetryWorkersPatch = bytecodePatch(
    name = "Disable background telemetry workers",
    description = "Stops MAX's SampleUploadWorker (diagnostic uploads to apptracer.ru) and " +
        "DailyAnalyticsWorker (daily permission-status telemetry) from doing any work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAX)

    dependsOn(disableAnalyticsDependency)

    execute {
        var patchedWorkers = 0

        listOf(
            "SampleUploadWorker" to SampleUploadWorkerDoWorkFingerprint,
            "DailyAnalyticsWorker" to DailyAnalyticsWorkerDoWorkFingerprint,
        ).forEach { (label, fingerprint) ->
            val method = fingerprint.methodOrNull ?: return@forEach
            val resultBaseType = method.returnType

            val resultBaseDef = mutableClassDefByOrNull(resultBaseType) ?: return@forEach
            if (!AccessFlags.ABSTRACT.isSet(resultBaseDef.accessFlags)) {
                // Sanity check: the Result sealed base is expected to be abstract. If a
                // future MAX build changes this shape, fail loudly instead of silently
                // picking the wrong class.
                throw PatchException(
                    "Disable background telemetry workers: $resultBaseType (return type of " +
                        "$label's doWork()) is not abstract - Result shape may have changed.",
                )
            }

            var terminalSubclass: String? = null
            classDefForEach { classDef ->
                if (classDef.superclass != resultBaseType) return@classDefForEach

                val hasNoArgConstructor = classDef.methods.any {
                    it.name == "<init>" && it.parameterTypes.isEmpty()
                }
                val hasDataConstructor = classDef.methods.any {
                    it.name == "<init>" && it.parameterTypes.size == 1
                }

                if (hasNoArgConstructor && hasDataConstructor) {
                    terminalSubclass = classDef.type
                }
            }

            val subclass = terminalSubclass
                ?: throw PatchException(
                    "Disable background telemetry workers: could not find a terminal " +
                        "(non-retry) Result subclass of $resultBaseType for $label.",
                )

            // Reuse the implicit `this` parameter register (p0) rather than a fresh local
            // (v0): these are zero-arg instance methods, so p0 is the only register
            // guaranteed to exist regardless of the method's declared .locals count, and
            // we return immediately afterward so overwriting `this` is safe (same idiom
            // as the xob0t-ported DisableAppMetricaPatch's `const/4 p0, 0x0` stub).
            method.addInstructions(
                0,
                """
                    new-instance p0, $subclass
                    invoke-direct {p0}, $subclass-><init>()V
                    return-object p0
                """,
            )
            patchedWorkers++
        }

        if (patchedWorkers == 0) {
            throw PatchException("Disable background telemetry workers: no target workers were found.")
        }

        println("Disable background telemetry workers: patched $patchedWorkers worker(s).")
    }
}
