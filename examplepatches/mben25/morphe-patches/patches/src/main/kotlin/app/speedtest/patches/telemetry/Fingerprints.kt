package app.speedtest.patches.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The varargs sinks of the Ookla DevMetrics dispatcher in `com/ookla/tools/logging/`.
 * Every concrete logger (Firebase Analytics, Crashlytics, Logcat, ...) is invoked from
 * here, so patching the dispatcher itself cuts off all of them at once instead of chasing
 * each sink individually.
 */
private val publicStaticVarargs = listOf(
    AccessFlags.PUBLIC,
    AccessFlags.STATIC,
    AccessFlags.FINAL,
    AccessFlags.VARARGS,
)

/** Matches `info(String,String,String,[String])V` AND `watch(String,String,String,[String])V`. */
object LoggingStringVarargsFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/tools/logging/",
    accessFlags = publicStaticVarargs,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "[Ljava/lang/String;",
    ),
)

/** Matches `alarm(Throwable,[String])V`. */
object LoggingAlarmFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/tools/logging/",
    accessFlags = publicStaticVarargs,
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;", "[Ljava/lang/String;"),
)
