package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.webvideocaster.shared.Constants.COMPATIBILITY_WEB_VIDEO_CASTER
import java.util.logging.Logger

/**
 * Web Video Caster — Bypass PairIP signature check.
 *
 * Root cause of the v1.35.1 on-device crash, established from the
 * 6.1.0 dex (not from a crash trace — none was available):
 *
 * The app's real Application class is PairIP's
 * com.pairip.application.Application. Its attachBaseContext runs, in
 * order: VMRunner.setContext, SignatureCheck.verifyIntegrity,
 * LicenseClient.checkLicense, then the app's own attachBaseContext.
 * There is no try/catch in attachBaseContext.
 *
 * verifyIntegrity (classes2.dex) SHA-256-hashes the signing
 * certificate of the installed APK and, unless it equals PairIP's
 * expected developer signature / legacy signature / hardcoded test
 * signature, throws SignatureCheck$SignatureTamperedException
 * ("Apk signature is invalid."). A build re-signed by Morphe (any
 * key) cannot match, so the exception escapes attachBaseContext and
 * the process dies before onCreate — Android shows the "app crashed"
 * dialog immediately on launch. The premium edits themselves were
 * audited instruction-by-instruction and are not the cause: exact
 * Loc9;/Lr79; constructor signatures, register use inside
 * Lv36;->v's 9 registers, the patcher correctly widened the method's
 * outs to 5 for the inserted 5-register invokes, and both
 * PremiumAccount implementations return non-null auth user / account
 * mode, so the re-wrap cannot throw on real call paths.
 *
 * Gradient Weather — same PairIP family, works re-signed — has no
 * SignatureCheck class at all; its PairIP Application only calls
 * LicenseClient.checkLicense. The signature gate is the one check
 * WVC runs that Gradient doesn't.
 *
 * Fix: make verifyIntegrity return immediately. The method is plain
 * dex with a real body (not PairIP-VM-virtualized), so a single
 * return-void at entry neutralizes it; the license flow behind it
 * (LicenseClient + the installer-source check) is untouched and is
 * still handled by the "Change installer source" patch, exactly as
 * on Gradient. This patch is required for ANY re-signed WVC build
 * to start, with or without the premium unlock, so it defaults on.
 */
@Suppress("unused")
val bypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass PairIP signature check",
    description = "Required for re-signed builds: PairIP checks the APK signature at startup and crashes the app on launch when it is not the developer's. Disables that one check so the patched app can start.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEB_VIDEO_CASTER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        SignatureCheckFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP signature check disabled (SignatureCheck.verifyIntegrity returns immediately).")
    }
}
