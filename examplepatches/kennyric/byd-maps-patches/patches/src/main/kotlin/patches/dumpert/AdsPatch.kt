package patches.dumpert

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Removes native ads, prerolls and subscription promotions; uses the local ad-free account presentation while preserving real accounts and Deluxe purchases.") {
    dependsOn(originalInput, adResources)
    compatibleWith(dumpert)
    execute {
        adFreeAccountPresentation()
        // The no-ad branch maps content to typed slots. Returning the raw input
        // would violate the UI's slot contract and discard its stable mapping.
        val injector = exact("${APP}ads/GenericAdInjector;", "injectAds(Ljava/util/List;)Ljava/util/List;").method
        val code = injector.instructions.toList()
        check(code.size == 69 && injector.implementation!!.registerCount == 7)
        val interval = code[2]
        check(interval.opcode == Opcode.IGET &&
            (interval as TwoRegisterInstruction).registerA == 0 && interval.registerB == 5 &&
            (interval as ReferenceInstruction).reference.toString() == "${APP}ads/GenericAdInjector;->adInterval:I" &&
            code[3].opcode == Opcode.IF_GTZ) { "Dumpert original no-ad mapping changed" }
        injector.replaceInstruction(2, "const/4 v0, 0x0")

        // Return before opening any Compose group, creating its VM or request.
        change("${APP}ads/ui/AdViewKt;", "AdView-8u0NR3k(Ljava/lang/String;Lnl/livewall/dumpert/ads/AdSlotConfig;Lnl/livewall/dumpert/core/ads/api/AdBidScreen;ILjava/lang/String;Landroidx/compose/ui/Modifier;FIZLjava/util/Map;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;III)V", STOP)
        change("${APP}models/content_item/DumpertContentPost;", "getCanShowAds()Z", FALSE)
        change("${APP}screens/content_detail/detail/meda_views/RetainedMediaPlayer;", "createAdsConfiguration(Lnl/livewall/dumpert/models/content_item/DumpertContentPost;Lnl/livewall/dumpert/models/content_item/media/BaseContentMediaItem;)Landroidx/media3/common/MediaItem\$AdsConfiguration;", NULL)
        change("${APP}screens/shorts/ShortsPlayerPool;", "createMediaItemWithPreroll(Lnl/livewall/dumpert/models/content_item/DumpertContentPost;Lnl/livewall/dumpert/models/content_item/media/BaseContentMediaItem;Ljava/lang/String;)Landroidx/media3/common/MediaItem;", NULL)

        val shorts = exact("${APP}screens/shorts/ShortsViewModel;", "onPageSettled(Lnl/livewall/dumpert/screens/shorts/ShortsTab;ILnl/livewall/dumpert/models/content_item/DumpertContentPost;)V").method
        val settled = shorts.instructions.toList()
        check(settled.size == 31 && shorts.implementation!!.registerCount == 6 &&
            settled[25].opcode == Opcode.CONST_4 && (settled[25] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            settled[27].opcode == Opcode.CONST_4 && (settled[27] as NarrowLiteralInstruction).narrowLiteral == 0) {
            "Dumpert Shorts eligibility changed"
        }
        // Keep coordinator/page navigation and the ordinary URI preparation.
        shorts.replaceInstruction(25, "const/4 v0, 0x0")
        change("${APP}ads/AdsManagerImpl;", "initialize()V", STOP)
    }
}
