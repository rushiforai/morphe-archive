// Confirmed live (2026-10-08 package census) against com.idamob.tinkoff.android: T-Bank
// ships its own first-party "Telemetry" component (`ru.tinkoff.core.components.telemetry.*`)
// built on top of OpenTelemetry's disk-buffering exporter (`io.opentelemetry.contrib.disk.
// buffering.*`), outside the 31-SDK checklist this repo's patches already cover. Every
// concrete worker (`DiskBufferingUploadWorker` confirmed; there may be siblings in future
// builds) extends the same abstract `BaseTelemetryWorker : CoroutineWorker`, whose single
// FINAL `doWork()` override (Kotlin-compiled name `a(Continuation): Object`) is shared by
// all of them — patching this one base-class method disables every telemetry worker at
// once, present or future, without needing a per-worker patch like MAX's SampleUploadWorker/
// DailyAnalyticsWorker (see app/ru_apps/max/DisableBackgroundTelemetryWorkersPatch.kt).
//
// The method's own disassembly already contains a proven-safe no-op path: it reads a
// static `ConcurrentHashMap` keyed by `this.getClass()` and, when absent/false, directly
// constructs and returns a `Lzd/v;` (a concrete subclass of the obfuscated Result sealed
// type `Lzd/x;`) without ever calling the abstract `e()` hook that does the actual upload.
// Forcing that same branch unconditionally — rather than guessing at Result.success()'s
// obfuscated name — reuses a return value the app's own code already proves is safe and
// terminal (no crash, no WorkManager retry loop) for this exact method.
package app.ru_apps.tbank

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.tbank.Constants.COMPATIBILITY_TBANK
import com.android.tools.smali.dexlib2.AccessFlags

private const val BASE_TELEMETRY_WORKER = "Lru/tinkoff/core/components/telemetry/services/android/work/BaseTelemetryWorker;"
private const val RESULT_SKIP_SUBCLASS = "Lzd/v;"

private object TelemetryWorkerDoWorkFingerprint : Fingerprint(
    definingClass = BASE_TELEMETRY_WORKER,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

@Suppress("unused")
val disableTelemetryWorkerPatch = bytecodePatch(
    name = "Disable telemetry worker",
    description = "Stops T-Bank's BaseTelemetryWorker-derived background jobs (disk-buffered OpenTelemetry upload) from doing any work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TBANK)

    dependsOn(disableAnalyticsDependency)

    execute {
        val method = TelemetryWorkerDoWorkFingerprint.methodOrNull
            ?: throw PatchException("Disable telemetry worker: BaseTelemetryWorker.doWork() not found.")

        if (mutableClassDefByOrNull(RESULT_SKIP_SUBCLASS) == null) {
            throw PatchException("Disable telemetry worker: $RESULT_SKIP_SUBCLASS not found - Result shape may have changed.")
        }

        method.addInstructions(
            0,
            """
                new-instance p0, $RESULT_SKIP_SUBCLASS
                invoke-direct {p0}, $RESULT_SKIP_SUBCLASS-><init>()V
                return-object p0
            """,
        )

        println("Disable telemetry worker: patched BaseTelemetryWorker.doWork().")
    }
}
