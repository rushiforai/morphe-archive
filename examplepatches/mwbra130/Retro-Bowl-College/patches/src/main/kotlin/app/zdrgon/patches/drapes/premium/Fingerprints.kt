package app.zdrgon.patches.drapes.premium

import app.morphe.patcher.Fingerprint

/**
 * The app's single entitlement computation (obfuscated name, stable for
 * the 3.9.3 build): a static method on the billing manager class that
 * scans the current Play purchase list and returns the entitlement
 * enum — PRO when a purchase's product ids contain "drapes_pro" with
 * purchase state PURCHASED and the acknowledged flag set, FREE
 * otherwise. Its only caller is the refresh coroutine, which stores
 * the result into the app-wide state holder every feature gate reads.
 *
 * Verified against Drapes 3.9.3 (com.codeswitch.drapes, vc3930) by dex
 * read; the "drapes_pro" literal is part of the fingerprint so the
 * match cannot land on another same-shaped method.
 */
object EntitlementStateFingerprint : Fingerprint(
    definingClass = "Ls40;",
    name = "a",
    returnType = "Llb6;",
    parameters = listOf("Ls40;"),
    strings = listOf("drapes_pro"),
)

/**
 * PairIP's license-check entry point. The PairIP Application class
 * calls it from attachBaseContext before the real Application runs;
 * it connects to the Play licensing service and shows the blocking
 * license dialog for re-signed builds.
 *
 * Verified against Drapes 3.9.3: com.pairip.licensecheck.LicenseClient
 * in classes2.dex, public static void checkLicense(Context).
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * PairIP's license-check content provider, the second trigger for the
 * same check: its onCreate constructs a LicenseClient and calls
 * initializeLicenseCheck().
 *
 * Verified against Drapes 3.9.3: com.pairip.licensecheck in
 * classes2.dex, public boolean onCreate().
 */
object LicenseProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf(),
)
