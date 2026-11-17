package app.zdrgon.patches.forscanlite.premium

import app.morphe.patcher.Fingerprint

/**
 * The startup license gate: SplashScreenActivityLite.p() reads the
 * stored license state (SharedPreferences "com.astech.forscanlite.
 * licensing") and decides whether the app proceeds (returns 1),
 * waits on an online revalidation or the activation dialog
 * (returns 0), or errors out (returns -1). It is the only license
 * check on the startup path, and no feature code anywhere else in
 * the app reads the license state.
 */
object LicenseGateFingerprint : Fingerprint(
    definingClass = "Lcom/astech/forscanlite/SplashScreenActivityLite;",
    name = "p",
    returnType = "I",
    parameters = listOf(),
)

/**
 * The version-check phone-home: r$h.a() is the background half of
 * an AsyncTask that POSTs the app version to
 * https://forscan.org/api/last_version_la.php and stores the
 * latest-version info it gets back. Fire-and-forget; nothing in
 * the app awaits its result.
 */
object VersionCheckFingerprint : Fingerprint(
    definingClass = "Lcom/astech/forscancore/r\$h;",
    name = "a",
    returnType = "Ljava/lang/Void;",
    parameters = listOf("[Ljava/lang/Void;"),
)
