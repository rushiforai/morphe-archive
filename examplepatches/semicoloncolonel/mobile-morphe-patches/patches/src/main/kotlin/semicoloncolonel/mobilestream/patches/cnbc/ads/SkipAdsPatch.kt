package semicoloncolonel.mobilestream.patches.cnbc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.cnbc.shared.ARTICLE_CLEANUP
import semicoloncolonel.mobilestream.patches.cnbc.shared.ArticlePageFinishedFingerprint
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants

// CNBC 8.8.2.
//
// - Banner and in-feed ads on the home page, news sections, quotes, and
//   Investing Club are Google Ad Manager views, which AdPresenter loads with
//   BaseAdView.loadAd. That call now hides the view instead (AdHider), and
//   folds away the containers around it that hold nothing else, so no empty
//   slot is left. The home feed's ad rows are SectionAd views, which reserve
//   their space before an ad loads; each one is collapsed as it is created.
// - Articles are cnbc.com pages in a WebView, with their own ad slots (for
//   example dart_wrapper_topbanner above the headline). When a page
//   finishes loading, ArticleCleanup adds a style that hides them.
// - Videos play in ViewLift's player (VLPlayer). Its IMA pre-rolls come
//   from its adTag, and every read of adTag in the player now reads null,
//   which is the player's own path for a video without ads.
// - Most on-demand videos have their ads stitched into the stream by Amazon
//   MediaTailor, and the player downloads MediaTailor's timeline of ad
//   breaks. AdUiUpdater.updateAdInfo runs on every tick of a break; it now
//   first calls VodAdSkipper, which seeks to the end of the break. The same
//   check runs when the timeline arrives (setAvails), which catches a
//   pre-roll before its first tick. The
//   player otherwise sends a viewer who seeks past a break back to its
//   start; getShouldHonourAdBreakSeek now answers false, so it does not.

private const val BASE_AD_VIEW = "Lcom/google/android/gms/ads/BaseAdView;"
private const val VL_PLAYER = "Lcom/vl/viewlift/playersdk/views/VLPlayer;"
private const val SECTION_AD = "Lcom/cnbc/client/androidnext/view/customviews/SectionAd;"
private const val AD_HIDER = "Lsemicoloncolonel/mobilestream/extension/cnbc/AdHider;"
private const val AD_UI_UPDATER = "Lcom/vl/viewlift/playersdk/utils/AdUiUpdater;"
private const val VOD_AD_SKIPPER = "Lsemicoloncolonel/mobilestream/extension/cnbc/VodAdSkipper;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the banner, in-feed, and article ads, and skips the ad breaks in on-demand videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val loadAd = mutableClassDefBy(BASE_AD_VIEW).methods.firstOrNull {
            it.name == "loadAd" && it.parameterTypes.size == 1 && it.returnType == "V"
        } ?: throw PatchException("CNBC: BaseAdView.loadAd not found")
        loadAd.addInstructions(
            0,
            """
                invoke-static { p0 }, $AD_HIDER->hide(Landroid/view/View;)V
                return-void
            """,
        )

        val sectionAd = mutableClassDefBy(SECTION_AD)
        val init = sectionAd.methods.firstOrNull { it.name == "init" && it.returnType == "V" }
            ?: throw PatchException("CNBC: SectionAd.init not found")
        init.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
            .forEach { index ->
                init.addInstructions(index, "invoke-static { p0 }, $AD_HIDER->collapseWhenAttached(Landroid/view/View;)V")
            }

        var reads = 0
        val playerClasses = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type == VL_PLAYER || classDef.type.startsWith(VL_PLAYER.removeSuffix(";") + "$")) {
                playerClasses += classDef.type
            }
        }
        playerClasses.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.IGET_OBJECT) return@forEachIndexed
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    if (field.definingClass != VL_PLAYER || field.name != "adTag") return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const/4 v$register, 0x0")
                    reads++
                }
            }
        }
        if (reads == 0) throw PatchException("CNBC: VLPlayer.adTag reads not found")

        ArticlePageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $ARTICLE_CLEANUP->hideAds(Landroid/webkit/WebView;)V",
        )

        val updater = mutableClassDefBy(AD_UI_UPDATER)
        updater.methods.firstOrNull { it.name == "updateAdInfo" }?.addInstructions(
            0,
            "invoke-static {}, $VOD_AD_SKIPPER->onAdTick()V",
        ) ?: throw PatchException("CNBC: AdUiUpdater.updateAdInfo not found")
        // At the end of setAvails, once the timeline is stored.
        updater.methods.firstOrNull { it.name == "setAvails" && it.parameterTypes.size == 2 }?.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
            if (returns.isEmpty()) throw PatchException("CNBC: AdUiUpdater.setAvails has no return")
            returns.forEach { index -> addInstructions(index, "invoke-static {}, $VOD_AD_SKIPPER->onAdTick()V") }
        } ?: throw PatchException("CNBC: AdUiUpdater.setAvails not found")
        updater.methods.firstOrNull { it.name == "getShouldHonourAdBreakSeek" }?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        ) ?: throw PatchException("CNBC: AdUiUpdater.getShouldHonourAdBreakSeek not found")
    }
}
