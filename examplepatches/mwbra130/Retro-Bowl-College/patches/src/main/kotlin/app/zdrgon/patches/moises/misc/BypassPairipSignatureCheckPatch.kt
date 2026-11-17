package app.zdrgon.patches.moises.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.moises.shared.Constants.COMPATIBILITY_MOISES
import java.util.logging.Logger

/**
 * Moises — Bypass PairIP signature check.
 *
 * This build carries the FULL PairIP (VMRunner, VmDecryptor,
 * libpairipcore.so, StartupLauncher) — not the light licensecheck
 * SDK ContentCam carries: there is no com.pairip.licensecheck
 * package here and no LICENSED terminal state to record. The
 * Java-layer protection is a signature check. The manifest
 * Application (Lcom/pairip/application/Application;, extending
 * the app's own MainApplication) calls, from attachBaseContext
 * before super:
 *
 *   Lcom/pairip/SignatureCheck;->verifyIntegrity(Context)V
 *
 * verifyIntegrity reads the app's signing certificate through
 * PackageManager, digests and Base64-encodes it, and compares it
 * against static expected values; on mismatch it throws
 * SignatureTamperedException — so any re-signed build dies at
 * startup. Its success path is simply falling off the end of the
 * method, so pinning the entry to return-void puts the check in
 * exactly its genuine pass state. attachBaseContext is its only
 * caller (verified 2026-11-16 against the exact 2.141.0 XAPK).
 *
 * Scope, stated plainly: PairIP's native VM startup program
 * (StartupLauncher.launch -> VMRunner.invoke, called from
 * MainApplication.<clinit> and CoreComponentFactory.<clinit>)
 * is a separate layer this patch does not and cannot touch. If
 * libpairipcore independently rejects re-signed builds (the
 * DiskWala outcome), only an on-device test will show it; the
 * Java signature check is fully bypassed either way. Required
 * for any re-signed Moises build to launch, so it defaults on.
 */
@Suppress("unused")
val bypassPairipSignatureCheckPatch = bytecodePatch(
    name = "Bypass PairIP signature check",
    description = "Required for re-signed builds: PairIP verifies the app's signing certificate at startup and kills tampered builds. Disables that Java-layer check (its pass state is returning normally). The native PairIP VM layer is untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOISES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        VerifyIntegrityFingerprint.method.addInstructions(0, "return-void")
        logger.info("Moises: PairIP signature check disabled (SignatureCheck.verifyIntegrity returns immediately — its genuine pass state).")
    }
}
