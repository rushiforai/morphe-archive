package app.logm1lo.patches.cubesolver.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * VMRunner.<clinit> — loads libpairipcore.so (the native PairIP VM).
 * The native lib SIGSEGVs on ANY re-signed APK (it verifies the signing cert
 * during load, independent of the Java SignatureCheck class). Neutralizing the
 * <clinit> prevents the lib from loading and avoids the crash.
 */
internal object VMRunnerClinitFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "<clinit>",
    returnType = "V",
    parameters = listOf(),
)

/**
 * StartupLauncher.launch() — runs the virtual startup program via
 * VMRunner.invoke → native executeVM. With libpairipcore.so not loaded
 * (VMRunner.<clinit> no-op), this throws UnsatisfiedLinkError. No-op it.
 */
internal object StartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = listOf(),
)

/**
 * SignatureCheck.verifyIntegrity(Context) — Java-side APK signature check that
 * throws SignatureTamperedException on re-signed APKs. No-op it.
 */
internal object SignatureVerifyFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * LicenseClient.checkLicense(Context) — Play licensing check that launches
 * LicenseActivity on failure, which calls System.exit. No-op it so licensing
 * never runs.
 */
internal object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * LicenseActivity.closeApp() — calls System.exit / closeAllTasks when the
 * license check fails. No-op it so even a launched LicenseActivity can't exit.
 */
internal object LicenseCloseAppFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "closeApp",
    returnType = "V",
    parameters = listOf(),
)

/**
 * com.jeffprod.cubesolver.App.onCreate() — virtualized application init that
 * invokes a reflective Method (null without the VM) → NPE at startup. No-op it.
 */
internal object AppOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/App;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * MainActivity.onCreate(Bundle) — virtualized activity init that invokes a
 * reflective Method (null without the VM) → NPE. Reconstructed with a real
 * WebView setup in the patch.
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/lang/reflect/Method;",
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;", "[Ljava/lang/Object;"),
        ),
    )
)

/**
 * MainActivity.onResume() — virtualized; NPEs on reflective Method.invoke.
 * Replace with super call.
 */
internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/lang/reflect/Method;",
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;", "[Ljava/lang/Object;"),
        ),
    )
)

/**
 * MainActivity.onPause() — virtualized; NPEs on reflective Method.invoke.
 * Replace with super call.
 */
internal object MainActivityOnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/lang/reflect/Method;",
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;", "[Ljava/lang/Object;"),
        ),
    )
)

/**
 * MainActivity.onDestroy() — virtualized; NPEs on reflective Method.invoke.
 * Replace with super call.
 */
internal object MainActivityOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
    name = "onDestroy",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/lang/reflect/Method;",
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;", "[Ljava/lang/Object;"),
        ),
    )
)

/**
 * MainActivity.k() — writes localStorage["ulcsall"] = gp.k ? "ok" : "false".
 * This is the master puzzle-unlock gate: the WebView JS reads ulcsall to decide
 * which puzzles are locked. Forcing it to always write "ok" unlocks ALL puzzles
 * (kilominx and other ad-gated designs) without needing gp.k.
 */
internal object PuzzleUnlockFingerprint : Fingerprint(
    definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
    name = "k",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/jeffprod/cubesolver/MainActivity;",
            name = "j",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        ),
    )
)

/**
 * k93.loadRewardedAd() — @JavascriptInterface bridge the WebView puzzle UI calls
 * when the user taps "watch ad to unlock". Rewarding immediately (without showing
 * an ad) grants the puzzle unlock for the current design.
 */
internal object RewardedAdBridgeFingerprint : Fingerprint(
    definingClass = "Lk93;",
    name = "loadRewardedAd",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Landroid/os/Handler;",
            name = "post",
            returnType = "Z",
            parameters = listOf("Ljava/lang/Runnable;"),
        ),
    )
)

/**
 * bf.a(Context, String, Laf) — AppLovin SDK initialization (with AdMob mediation).
 * No-op'ing this prevents AppLovin ads from ever initializing.
 */
internal object AppLovinInitFingerprint : Fingerprint(
    definingClass = "Lbf;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Laf;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = "Lcom/applovin/sdk/AppLovinSdk;",
            name = "getInstance",
            returnType = "Lcom/applovin/sdk/AppLovinSdk;",
            parameters = listOf("Landroid/content/Context;"),
        ),
    )
)

/**
 * Firebase Crashlytics registrar — emptied to disable crash telemetry.
 */
internal object CrashlyticsRegistrarFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_STATIC,
        definingClass = "Ljava/util/Collections;",
        name = "emptyList",
        returnType = "Ljava/util/List;",
        parameters = listOf(),
    ))
)

/**
 * Firebase Analytics registrar — emptied to disable analytics telemetry.
 */
internal object AnalyticsRegistrarFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_STATIC,
        definingClass = "Ljava/util/Collections;",
        name = "emptyList",
        returnType = "Ljava/util/List;",
        parameters = listOf(),
    ))
)

/**
 * Firebase Perf registrar — emptied to disable performance telemetry.
 */
internal object PerfRegistrarFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/perf/FirebasePerfRegistrar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_STATIC,
        definingClass = "Ljava/util/Collections;",
        name = "emptyList",
        returnType = "Ljava/util/List;",
        parameters = listOf(),
    ))
)

/**
 * Firebase Sessions registrar — emptied to disable session telemetry.
 */
internal object SessionsRegistrarFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_STATIC,
        definingClass = "Ljava/util/Collections;",
        name = "emptyList",
        returnType = "Ljava/util/List;",
        parameters = listOf(),
    ))
)
