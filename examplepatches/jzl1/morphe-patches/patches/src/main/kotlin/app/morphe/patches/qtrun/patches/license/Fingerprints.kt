package lab.qtrun.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * `com.qtrun.sys.Application.d()Z` — the single Ultimate entitlement gate.
 *
 * The method is static/synchronized, takes no arguments, returns boolean and contains
 * the literal `subscriber.activate`. The literal is the stable anchor; the method name
 * is obfuscation-friendly.
 */
internal object UltimateGateFingerprint : Fingerprint(
    definingClass = "Lcom/qtrun/sys/Application;",
    returnType = "Z",
    filters = listOf(
        string("subscriber.activate"),
    ),
)

/**
 * `com.qtrun.sys.Application.<init>(LauncherActivity)`.
 *
 * The constructor computes the APK signer public-key digest and passes it to the native
 * `construct(...)` method. We replace that argument with the original QTRUN digest so a
 * Morphe-resigned APK reports the same identity as the official build.
 */
internal object ApplicationConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/qtrun/sys/Application;",
    returnType = "V",
    parameters = listOf("Lcom/qtrun/nsg/LauncherActivity;"),
)

/**
 * The config-load callback `c6.j0.e(Object)` (JADX `C0510j0.mo36e`).
 *
 * It normally calls `c6.h1.d()` to read `configuration.xml` from disk, then passes the
 * string to `Application.j(...)`. We replace that block with an asset read. The class is
 * obfuscated, so match on its two unique log/ACRA literals instead of its name.
 */
internal object ConfigLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(
        "Can not load configuration",
        "APP_USERID",
    ),
)
