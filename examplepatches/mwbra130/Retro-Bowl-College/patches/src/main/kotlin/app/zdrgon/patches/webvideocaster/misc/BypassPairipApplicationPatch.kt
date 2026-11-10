package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.webvideocaster.shared.Constants.COMPATIBILITY_WEB_VIDEO_CASTER
import java.util.logging.Logger

/**
 * Web Video Caster — Bypass PairIP application checks (call-site kill).
 *
 * Round 10. The story so far: rounds 1–3 stubbed every callee in
 * PairIP's license funnel (SignatureCheck.verifyIntegrity,
 * LicenseClient.checkLicense / initializeLicenseCheck /
 * handleTrialEnd / processResponse / startPaywallActivity /
 * startErrorDialogActivity / scheduleAppShutdown, LicenseActivity
 * .onStart) and disabled LicenseActivity in the manifest. Round 9
 * then proved, with a completed Unicorn harness, that the PairIP
 * startup VM program contains no signature/installer verdict at
 * all, and round 10's fresh census of all 8 dexes found no second
 * licensing actor: no Google LVL classes, no Play Core licensing,
 * the only PendingIntent.send in the PairIP stack sits inside the
 * stubbed LicenseActivity, and LicenseClient.checkLicense has
 * exactly two call sites in the app — the one below and
 * LicenseContentProvider.onCreate, whose provider is not declared
 * in the manifest and therefore never runs.
 *
 * What was NOT yet cut is the call site itself. The manifest
 * Application is PairIP's com.pairip.application.Application, and
 * its attachBaseContext body is five instructions: VMRunner
 * .setContext, SignatureCheck.verifyIntegrity, LicenseClient
 * .checkLicense, super.attachBaseContext, return. Every previous
 * patch trusted the callee stubs to neutralize the two check calls
 * made from here. This patch removes the calls instead: it inserts,
 * immediately after the original setContext instruction (index 1),
 * the super call and a return, so the method keeps doing the two
 * things the runtime needs (register the context with VMRunner,
 * run the real Application attach) and never invokes the signature
 * or license checks at all — regardless of whether any callee stub
 * was applied by the patcher that ran the bundle. The original
 * check instructions remain in the method as unreachable dead code
 * after the inserted return, exactly like the entry-return stubs
 * used by the earlier rounds.
 *
 * Context safety (verified from the stock dex): VMRunner's stored
 * context has NO dex consumers — VMRunner.getContext has zero call
 * sites in all 8 dexes and is consumed only by native code through
 * JNI — and VMRunner.invoke itself re-establishes the context when
 * it is null (prologue: tryToCreateContextForBindingApp ->
 * setContext). Keeping the original setContext instruction makes
 * even that moot.
 *
 * This patch is the round-10 freshness tell: if "Bypass PairIP
 * application checks" does not appear in Morphe Manager's patch
 * list for Web Video Caster, the bundle in Manager predates
 * round 10 no matter what version the source claims. Defaults on:
 * required for any re-signed WVC build to open.
 */
@Suppress("unused")
val bypassPairipApplicationPatch = bytecodePatch(
    name = "Bypass PairIP application checks",
    description = "Required for re-signed builds: PairIP's Application class runs the signature and license checks at startup. This rewrites that one method so it only registers the app context and never calls either check, instead of relying on the checks themselves being stubbed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEB_VIDEO_CASTER)

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
        logger.info("Web Video Caster: PairIP Application.attachBaseContext now only sets the VM context and calls super; verifyIntegrity/checkLicense are never invoked.")
    }
}
