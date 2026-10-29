package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.returnBoolean
import app.mightymorphing.patches.shared.returnVoid
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val PREVIOUS_CRASH_BODY = """
    invoke-direct {p0, p0}, Lo/o/joey/MyApplication;->C(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :cond_0
    return-void
    :cond_0
    invoke-static {}, Lmb/n;->f()Lmb/n;
    move-result-object v0
    invoke-virtual {v0}, Lmb/n;->s0()Z
    move-result v0
    if-eqz v0, :cond_1
    invoke-static {}, Lmb/n;->f()Lmb/n;
    move-result-object v0
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lmb/n;->j0(Z)V
    :cond_1
    return-void
"""

@Suppress("unused")
val skipAdsAndChecksPatch = bytecodePatch(
    name = "Skip ads and checks",
    description = "Removes ads everywhere and also drops the Play Store install check and crash reporting.",
) {
    compatibleWith(JOEY)

    execute {
        returnBoolean(AdsDisabledFingerprint.method, true)
        returnBoolean(InlineAdsFingerprint.method, false)
        returnBoolean(RatePromptFingerprint.method, false)
        returnBoolean(PurchaseErrorPromptFingerprint.method, false)
        returnVoid(PurchasePromptFingerprint.method)
        returnVoid(UpdateNagFingerprint.method)
        returnVoid(InstallerCheckFingerprint.method)
        returnVoid(PlayCheckFingerprint.method)

        val purchaseDialog = PurchaseDialogFingerprint.method
        purchaseDialog.insertAt(
            0,
            """
            if-nez p1, :keep_purchase
            return-void
            """,
            ExternalLabel("keep_purchase", purchaseDialog.getInstruction(0)),
        )

        // .locals 2 plus this.
        writeBody(PreviousCrashFingerprint.method, 3, PREVIOUS_CRASH_BODY)

        val crashlytics = CrashlyticsToggleFingerprint.method
        val enabled = crashlytics.indexOfReference("setCrashlyticsCollectionEnabled")
        val preference = crashlytics.indexOfReference("Lmb/n;->B(")
        if (enabled - preference != 2) {
            error("Crashlytics toggle was not the preference read this patch expects")
        }
        crashlytics.removeInstructions(enabled - 4, 4)
        crashlytics.insertAt(enabled - 4, "const/4 v1, 0x0")

        returnVoid(RecordExceptionFingerprint.method)
        returnVoid(SendReportsFingerprint.method)

        val handler = UncaughtHandlerFingerprint.method
        handler.removeInstructions(handler.indexOfReference("setDefaultUncaughtExceptionHandler"), 1)

        val nativeCrash = NativeCrashFingerprint.method
        nativeCrash.removeInstructions(nativeCrash.indexOfReference("SignalHandlerInstaller;->a("), 1)
    }
}
