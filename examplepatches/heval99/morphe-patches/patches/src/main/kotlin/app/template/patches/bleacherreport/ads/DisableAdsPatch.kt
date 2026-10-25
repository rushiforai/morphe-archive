package app.template.patches.bleacherreport.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.bleacherreport.shared.insns
import app.template.patches.bleacherreport.shared.methodRef
import app.template.patches.bleacherreport.shared.resultFailureCall
import app.template.patches.bleacherreport.shared.returnUnit
import app.template.patches.bleacherreport.shared.single
import app.template.patches.bleacherreport.shared.shortCircuitLaunchTask
import app.template.patches.bleacherreport.shared.smali
import app.template.patches.bleacherreport.shared.stringRef
import app.template.patches.shared.Constants.COMPATIBILITY_BLEACHER_REPORT
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads from feeds, articles and the splash screen.",
) {
    compatibleWith(COMPATIBILITY_BLEACHER_REPORT)

    execute {
        // 1. The ad config lookup fails at once, as it does when the ad config cannot be loaded:
        // Result.failure(AdConfigException). Every caller checks for the failure and places no ad.
        // The exception and the Result.failure call are copied from that existing branch.
        val adConfig = single(AdConfigFingerprint, "AdConfigFingerprint").method
        val failure = adConfig.resultFailureCall()
        val adConfigException = adConfig.insns().let { insns ->
            val call = insns.indexOfFirst { it.methodRef()?.smali() == failure.smali() }
            val created = insns.getOrNull(call - 2)
            val constructed = insns.getOrNull(call - 1)?.methodRef()
            val type = ((created as? ReferenceInstruction)?.reference as? TypeReference)?.type
            if (created?.opcode != Opcode.NEW_INSTANCE || type == null || constructed?.definingClass != type ||
                constructed.name != "<init>" || constructed.parameterTypes.isNotEmpty()
            ) {
                throw PatchException("Disable ads: getFeaturesAdConfig no longer builds Result.failure(AdConfigException())")
            }
            type
        }
        adConfig.addInstructionsChecked(
            0,
            """
                new-instance v0, $adConfigException
                invoke-direct {v0}, $adConfigException-><init>()V
                invoke-static {v0}, ${failure.smali()}
                move-result-object v0
                return-object v0
            """,
        )

        // 2. The feed ad inserter gets no ad slots and no alerted ad, so it returns the content
        // alone. p2 and p5 are above v15 (11.12.0.33: .locals 12, p2 = v14, p5 = v17), hence the
        // 8-bit forms.
        single(AdContentInserterFingerprint, "AdContentInserterFingerprint").method.addInstructionsChecked(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p2
                const/16 p5, 0x0
            """,
        )

        // 3. AdsManagerImpl backstops. loadAd returns at once, like it does for an ad without
        // an ad unit; loadSplashAd answers that branch's failure; the Amazon SDK never starts.
        single(LoadAdFingerprint, "LoadAdFingerprint").method.returnEarly()
        val splash = single(LoadSplashAdFingerprint, "LoadSplashAdFingerprint").method
        val missing = splash.insns().indexOfFirst { it.stringRef() == "Ad Unit is missing" }
        splash.addInstructionsChecked(
            0,
            """
                new-instance v0, Ljava/lang/IllegalArgumentException;
                const-string v1, "Ad Unit is missing"
                invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V
                invoke-static {v0}, ${splash.resultFailureCall(missing).smali()}
                move-result-object v0
                return-object v0
            """,
        )
        single(AmazonAdsInitFingerprint, "AmazonAdsInitFingerprint").method.returnUnit()

        // 4. The launch tasks that start Google Mobile Ads and Amazon (AdSetupLaunchTask) and
        // that load and show the splash ad (SplashAdLaunchTask) report success without running.
        shortCircuitLaunchTask("AdSetupLaunchTask")
        shortCircuitLaunchTask("SplashAdLaunchTask")

        // 5. Rule 9: MobileAds.initialize never runs now, so every MobileAds static void returns
        // at once (the web view screens call registerWebView).
        neutraliseMobileAdsStatics("initialize", "registerWebView")
    }
}
