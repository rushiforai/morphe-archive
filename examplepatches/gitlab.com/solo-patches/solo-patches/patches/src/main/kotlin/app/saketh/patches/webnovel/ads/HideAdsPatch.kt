package app.saketh.patches.webnovel.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.saketh.patches.webnovel.controls.whenEnabled
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.navigation.MainTabAvailabilityFingerprint
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AD_POSITION_CLASS = "Lcom/qidian/QDReader/components/entity/AdPosition;"

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Hides the launch splash promotion, bottom-bar campaign button, reader bottom banner, " +
        "chapter-end ad, Library promoted book and daily recommendation. Opt-in rewarded ads stay available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("hide_ads")
        SplashScreenConfigsFingerprint.method.whenEnabled("hideAds", "const/4 v0, 0x0\nreturn-object v0")

        LibraryPromotedBookFingerprint.method.whenEnabled("hideAds", "const/4 p1, 0x0")
        LibraryCachedPromotedBookFingerprint.method.whenEnabled("hideAds", "return-void")
        LibraryDailyRecommendationFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val resultIndex = fingerprint.instructionMatches.first().index + 1
            val result = method.implementation!!.instructions[resultIndex]
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT)
            val register = (result as OneRegisterInstruction).registerA
            // The getter overwrites this register anyway. No extra live register is available here.
            // Only bypass this binding decision; retain the real daily/task payload and market data.
            method.addInstructionsWithLabels(resultIndex - 1, """
                invoke-static {}, Lapp/saketh/extension/controls/PatchSettings;->hideAds()Z
                move-result v$register
                if-eqz v$register, :original
                const/16 v$register, 0x0
                goto :decision
            """, ExternalLabel("original", resultIndex - 1), ExternalLabel("decision", resultIndex + 1))
        }

        // A server tab type of 2 replaces the middle Writing tab with a campaign image.
        // Any other type takes the app's own no-campaign path: Writing stays visible, the image stays gone.
        MainTabAvailabilityFingerprint.method.apply {
            // Search now: Main navigation controls may have inserted hooks since the fingerprint matched.
            val callIndex = implementation!!.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getTabType"
            }
            check(callIndex >= 0) { "Main tab setup no longer reads the server tab type" }
            val result = getInstruction<OneRegisterInstruction>(callIndex + 1)
            check(result.opcode == Opcode.MOVE_RESULT)
            val register = result.registerA
            // The tab type lands in this register next, so it is free to hold the setting first.
            addInstructionsWithLabels(callIndex, """
                invoke-static {}, Lapp/saketh/extension/controls/PatchSettings;->hideAds()Z
                move-result v$register
                if-eqz v$register, :original
                const/16 v$register, 0x0
                goto :decision
            """, ExternalLabel("original", callIndex), ExternalLabel("decision", callIndex + 2))
        }

        ReaderBottomBannerFingerprint.method.whenEnabled("hideAds", "const/4 v0, 0x0\nreturn v0")

        ChapterEndAdRendererFingerprint.instructionMatches.last().getMethodCalled()
            .whenEnabled("hideAds", "return-void")

        // Same value as the app's own fallback for devices it does not serve ads to:
        // AdPosition(ReadBanner = false, ReadChapterEnd = false, RemoveOperation = "", HitAbVarietyId = "").
        ChapterAdPositionFingerprint.method.whenEnabled(
            "hideAds",
            """
                new-instance v0, $AD_POSITION_CLASS
                const/4 v1, 0x0
                const-string v2, ""
                invoke-direct { v0, v1, v1, v2, v2 }, $AD_POSITION_CLASS-><init>(ZZLjava/lang/String;Ljava/lang/String;)V
                return-object v0
            """,
        )
    }
}
