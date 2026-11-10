package app.zdrgon.patches.diskwala.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.diskwala.shared.Constants.COMPATIBILITY_DISKWALA
import java.util.logging.Logger

/**
 * DiskWala — Bypass PairIP application checks (call-site kill).
 *
 * The first layer of the launch fix; the other two are
 * "Bypass PairIP license check" (stubs the LicenseClient funnel
 * itself) and "Disable PairIP license activity" (removes the block
 * activity from the manifest).
 *
 * The manifest Application is PairIP's com.pairip.application
 * .Application (superclass: the app's own DiskWalaApp), and its
 * attachBaseContext body is five instructions, verified in the
 * 27.3 classes2.dex:
 *   [0] VMRunner.setContext(ctx)
 *   [1] SignatureCheck.verifyIntegrity(ctx)
 *   [2] LicenseClient.checkLicense(ctx)
 *   [3] invoke-super attachBaseContext(ctx)
 *   [4] return-void
 * checkLicense has exactly two call sites in the whole app — this
 * one and LicenseContentProvider.onCreate, and that provider is
 * not declared in the manifest, so this is the only live entry
 * into the license funnel. verifyIntegrity likewise has no other
 * caller.
 *
 * This patch removes the calls instead of trusting the callee
 * stubs: it inserts, immediately after the original setContext
 * instruction (index 1), the super call and a return, so the
 * method keeps doing the two things the runtime needs (register
 * the context with VMRunner, run the real Application attach) and
 * never invokes the signature or license checks at all — no
 * matter what state the callee patches are in. The original check
 * instructions remain in the method as unreachable dead code after
 * the inserted return.
 *
 * Context safety (same shape as the WVC build of this patch):
 * VMRunner's stored context is consumed only by native code
 * through JNI, and VMRunner.invoke re-establishes the context
 * when it is null; keeping the original setContext instruction
 * makes even that moot.
 *
 * Required for ANY re-signed DiskWala build to open, so it
 * defaults on.
 */
@Suppress("unused")
val bypassPairipApplicationPatch = bytecodePatch(
    name = "Bypass PairIP application checks",
    description = "Required for re-signed builds: PairIP's Application class runs the signature and license checks at startup. This rewrites that one method so it only registers the app context and never calls either check, instead of relying on the checks themselves being stubbed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Stock body: [0]=VMRunner.setContext, [1]=verifyIntegrity,
        // [2]=checkLicense, [3]=invoke-super, [4]=return-void.
        // Inserting the super call + return at index 1 keeps [0] and
        // makes [1..] unreachable.
        PairipApplicationAttachFingerprint.method.addInstructions(
            1,
            """
                invoke-super {p0, p1}, Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
                return-void
            """.trimIndent(),
        )
        logger.info("DiskWala: PairIP Application.attachBaseContext now only sets the VM context and calls super; verifyIntegrity/checkLicense are never invoked.")
    }
}
