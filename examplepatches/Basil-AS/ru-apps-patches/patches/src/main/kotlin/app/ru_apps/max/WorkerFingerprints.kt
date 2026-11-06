package app.ru_apps.max

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `ru.ok.tracer.upload.SampleUploadWorker` and `one.me.android.DailyAnalyticsWorker` are
 * both `androidx.work.Worker` subclasses, so their fully-qualified names are NOT
 * obfuscated by R8 — WorkManager needs to look workers up by class name via reflection
 * when resuming/serializing jobs, which forces `-keep` rules on them. Verified against
 * our 26.34.0 decompile (apps/ru.oneme.app/apk/_apktool_base):
 *   - smali_classes3/ru/ok/tracer/upload/SampleUploadWorker.smali
 *   - smali/one/me/android/DailyAnalyticsWorker.smali
 * Both have exactly one zero-argument, public final, non-void method overriding
 * `Worker.doWork()`: `d()Lhv9;` in the current build. `hv9` itself IS obfuscated and
 * WILL be renamed by a future build (it already differs from whatever it was named in
 * the version the habr.com audits looked at) — so this fingerprint deliberately matches
 * the override by shape only (`returnType = "L"`, any object type) rather than naming
 * the obfuscated result type, and the patch itself (see DisableBackgroundTelemetryWorkersPatch.kt)
 * discovers the concrete "terminal" subclass to construct at patch-execution time instead
 * of hardcoding `hv9`/`ev9`/`fv9`/`gv9`.
 */
object SampleUploadWorkerDoWorkFingerprint : Fingerprint(
    definingClass = "Lru/ok/tracer/upload/SampleUploadWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = emptyList(),
)

object DailyAnalyticsWorkerDoWorkFingerprint : Fingerprint(
    definingClass = "Lone/me/android/DailyAnalyticsWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = emptyList(),
)
