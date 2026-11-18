package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// PairIP startup-check bypass. com.pairip.application.Application extends the real
// TwitterApplication and, in attachBaseContext, runs VMRunner.setContext +
// SignatureCheck.verifyIntegrity + LicenseClient.checkLicense before super. The
// native libpairipcore.so VM verifies the APK signing identity and SIGSEGVs on any
// re-signed sideload. This severs the startup path at three points.
//
// KNOWN LIMITS: even when this lets X boot, the server rejects login from a re-signed
// APK (Play Integrity attestation + OAuth cert-fingerprint mismatch), and the ~22
// virtualised methods still run through the native VM (downstream init can NPE).
// Root + LSPosed pairipfix (in-memory, no re-sign) remains the only working route at
// 12.4.1. Default-off — this is an RE artifact, not a shippable unrooted patch.
object PairipAttachBaseContextFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
)

object VerifyIntegrityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
)

object StartupLauncherLaunchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(),
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
)

@Suppress("unused")
val bypassPairipPatch = bytecodePatch(
    name = "Bypass PairIP integrity",
    description = "Severs PairIP's startup path (attachBaseContext short-circuits to super; verifyIntegrity " +
        "and StartupLauncher.launch no-op) so a re-signed APK does not hit the libpairipcore SIGSEGV. Does " +
        "not defeat server-side Play Integrity login attestation.",
    default = false,
) {
    compatibleWith(Constants.TWITTER)

    execute {
        PairipAttachBaseContextFingerprint.method.addInstructions(
            0,
            """
                invoke-super { p0, p1 }, Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
                return-void
            """,
        )
        VerifyIntegrityFingerprint.method.addInstructions(0, "return-void")
        StartupLauncherLaunchFingerprint.method.addInstructions(0, "return-void")
    }
}
