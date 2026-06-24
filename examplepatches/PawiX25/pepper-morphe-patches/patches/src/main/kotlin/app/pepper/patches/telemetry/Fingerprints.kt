package app.pepper.patches.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Pepper's pixel-firing CoroutineWorker. Class name is non-obfuscated;
 * method `a` is the obfuscated suspend `doWork(Continuation)`.
 */
internal object PixelWorkerDoWorkFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/pepper/analytics/backgroundjob/AnalyticsEventTransmissionWorker;" &&
            method.name == "a" &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString().let {
                it.startsWith("L") && it.endsWith(";")
            }
    },
)

/**
 * Pepper-Hardware-Id OkHttp interceptor. The literal `"Pepper-Hardware-Id"`
 * is unique to this method in the dex; `intercept` survives obfuscation
 * as a kept interface method.
 */
internal object PepperHardwareIdInterceptorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("Pepper-Hardware-Id"),
    custom = { method, _ -> method.name == "intercept" },
)

/**
 * The single static converter `(state) → AppStartProcessRequiredSteps` that
 * the AppStartProcess navigator funnels every nav-decision through. Return
 * type is Pepper-package (non-obfuscated) and unique across the entire APK,
 * so matching purely on `returnType` + 1 ref parameter is unambiguous.
 */
internal object AppStartRequiredStepsConverterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lcom/pepper/presentation/appstartprocess/AppStartProcessRequiredSteps;",
    custom = { method, _ -> method.parameterTypes.size == 1 },
)
