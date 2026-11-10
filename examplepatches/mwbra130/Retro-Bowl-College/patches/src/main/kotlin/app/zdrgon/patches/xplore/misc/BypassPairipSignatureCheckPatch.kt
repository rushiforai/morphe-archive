package app.zdrgon.patches.xplore.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.xplore.shared.Constants.COMPATIBILITY_XPLORE
import java.util.logging.Logger

/**
 * X-plore — Bypass PairIP signature check (companion, required).
 *
 * X-plore ships PairIP (manifest Application is
 * com.pairip.application.Application; libpairipcore.so and VMRunner
 * are in the arm64 split), but — unlike DiskWala — there is NO
 * licensecheck package here: no LicenseClient, no LicenseActivity,
 * no LVL, no Play licensing bind and no block page. The entire
 * startup enforcement is one dex-level call chain:
 *
 *   Application.attachBaseContext
 *     -> VMRunner.setContext(ctx)
 *     -> Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V
 *
 * verifyIntegrity (public static, verified in the 4.52.02 dexes)
 * SHA-256s the signing certificate and throws
 * SignatureTamperedException when it differs from the expected Play
 * signature. A Morphe build is re-signed with the Manager key, so
 * this fires unconditionally on first launch — nothing else in the
 * app gets a chance to run. The 24 VMRunner.invoke sites are all
 * PairIP library entry points, none in the app's billing path, and
 * the donation readers (Li60.c / Li60.k) are ordinary dex methods.
 *
 * Fix: stub the check itself. verifyIntegrity returns immediately,
 * so the hash is never computed and the exception can never be
 * thrown, no matter which path reaches it. VMRunner.setContext
 * still runs (the runtime keeps its context), and nothing else in
 * the startup sequence changes.
 *
 * Required for ANY re-signed X-plore build to open, so it defaults
 * on and ships pre-selected together with "Enable Premium"
 * (Matsen's standing rule for paired patches).
 */
@Suppress("unused")
val bypassPairipSignatureCheckPatch = bytecodePatch(
    name = "Bypass PairIP signature check",
    description = "Required for re-signed builds: PairIP verifies the app's signing certificate at startup and kills the app if it isn't the Play signature. This disables that one check so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XPLORE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        PairipVerifyIntegrityFingerprint.method.addInstructions(0, "return-void")
        logger.info("X-plore: PairIP signature check disabled (SignatureCheck.verifyIntegrity returns immediately).")
    }
}
