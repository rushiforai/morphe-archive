package app.zdrgon.patches.droidcam.misc

import app.morphe.patcher.Fingerprint

/**
 * PairIP's startup entry point. In the original, launch() runs the VM
 * startup program via VMRunner.invoke, which fills the app's string
 * vaults and Method handles and performs the signature check.
 *
 * Verified against DroidCam 9.0 (com.dev47apps.obsdroidcam, vc76):
 * com.pairip.StartupLauncher in classes2.dex (directly under
 * com.pairip, NOT the application subpackage), called only
 * from AppComponentFactory/CoreComponentFactory/DroidCamApp <clinit>s.
 */
object StartupLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = listOf(),
)

/**
 * PairIP's Application class. Its attachBaseContext calls
 * VMRunner.setContext and SignatureCheck.verifyIntegrity before
 * delegating to the real Application (DroidCamApp).
 *
 * Verified against DroidCam 9.0: com.pairip.application.Application
 * in classes2.dex; the manifest names it as the application class.
 */
object PairIpApplicationAttachFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * PairIP's license-check trigger. The provider's onCreate constructs a
 * LicenseClient and calls initializeLicenseCheck(), which is what puts
 * the "Something went wrong / Check that Google Play is enabled"
 * dialog on screen for re-signed builds.
 *
 * Verified against DroidCam 9.0: com.pairip.licensecheck in classes2.dex.
 */
object LicenseProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    // ContentProvider.onCreate() takes no arguments.
    parameters = listOf(),
)

/**
 * The license-verdict parser (jadx alias m10499), declared in
 * MainActivity's obfuscated superclass. It parses the verification
 * server's reply, which must have the form ok:<int>:<nonce>:<digest>
 * (digest checked against the Lk salt), and returns the parsed int,
 * or -1 for anything else. The caller treats any value > 0 as
 * licensed and extends the a_time preference.
 *
 * The defining class name is obfuscated, so this matches on the
 * signature plus the two literal strings the parser compares against:
 * the ":" separator and the "ok" prefix. Verified unique for
 * DroidCam 9.0 by live Frida tracing of the applier call site
 * (handler what=15 arg1=2 -> applier(200, "not-null") -> parser).
 */
object VerdictParserFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf(":", "ok"),
)
