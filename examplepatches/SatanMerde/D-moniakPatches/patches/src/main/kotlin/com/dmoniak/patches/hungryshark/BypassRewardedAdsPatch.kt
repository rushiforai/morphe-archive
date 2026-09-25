package com.dmoniak.patches.hungryshark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.dmoniak.patches.hungryshark.util.cloneMethodWithAdditionalRegisters
import com.dmoniak.patches.hungryshark.util.cloneParameters
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.hungryshark.util.fireRewardedAdCallbacks
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_WORLD
import java.util.logging.Logger

@Suppress("unused")
val bypassRewardedAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads",
    description = "Bypasses rewarded video ads in Hungry Shark World by emulating ad completion events.",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_WORLD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBypassRewardedAdsLogic(logger, "Hungry Shark World")
    }
}

fun BytecodePatchContext.executeBypassRewardedAdsLogic(logger: Logger, gameName: String) {
    logger.info("Executing Bypass Rewarded Ads patch for $gameName...")

    // 0. Google Unity Mobile Ads (Primary for Hungry Shark games)
    if (applyGoogleUnityAdsStrategy(logger)) {
        logger.info("Bypass Rewarded Ads: Google Unity Ads strategy applied.")
    }

    // 1. AppLovin MAX Unity Bridge
    if (applyMaxUnityStrategy(logger)) {
        logger.info("Bypass Rewarded Ads: MAX Unity strategy applied.")
        return
    }

    // 2. AppLovin MAX Native SDK (MaxRewardedAd)
    applyNativeMaxStrategy(logger)

    // 3. IronSource / LevelPlay
    applyIronSourceAdsStrategy(logger)
    applyIronSourceAdsWrapperStrategy(logger)
    if (applyIronSourceBridgeStrategy(logger)) {
        logger.info("Bypass Rewarded Ads: IronSource bridge strategy applied.")
        return
    }

    // 4. Unity Ads
    applyUnityAdsStrategy(logger)

    // 5. AdMob (GMS) call sites
    applyAdMobRewardedStrategy(logger)

    logger.info("Bypass Rewarded Ads patch execution finished.")
}

/**
 * Strategy for AppLovin MAX Unity bridge.
 */
private fun BytecodePatchContext.applyMaxUnityStrategy(logger: Logger): Boolean {
    val unityShow = ShowRewardedAdFingerprint.methodOrNull
    val unityReady = IsRewardedAdReadyFingerprint.methodOrNull
    if (unityShow == null || unityReady == null) return false

    unityReady.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

    val clonedShow = cloneParameters(unityShow)
    clonedShow.addInstructions(
        0,
        """
        move-object/from16 v0, p1
        new-instance v1, Lorg/json/JSONObject;
        invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
        const-string v2, "name"
        const-string v3, "OnRewardedAdDisplayedEvent"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adUnitId"
        invoke-static {v1, v2, v0}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adFormat"
        const-string v3, "rewarded"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V
        new-instance v1, Lorg/json/JSONObject;
        invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
        const-string v2, "name"
        const-string v3, "OnRewardedAdReceivedRewardEvent"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adUnitId"
        invoke-static {v1, v2, v0}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adFormat"
        const-string v3, "rewarded"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "rewardLabel"
        const-string v3, "reward"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "rewardAmount"
        const-string v3, "1"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V
        new-instance v1, Lorg/json/JSONObject;
        invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
        const-string v2, "name"
        const-string v3, "OnRewardedAdHiddenEvent"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adUnitId"
        invoke-static {v1, v2, v0}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "adFormat"
        const-string v3, "rewarded"
        invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
        invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V
        return-void
        """.trimIndent()
    )

    val unityLoad = LoadRewardedAdFingerprint.methodOrNull
    if (unityLoad != null) {
        val clonedLoad = cloneParameters(unityLoad)
        clonedLoad.addInstructions(
            0,
            """
            move-object/from16 v0, p1
            new-instance v1, Lorg/json/JSONObject;
            invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
            const-string v2, "name"
            const-string v3, "OnRewardedAdLoadedEvent"
            invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
            const-string v2, "adUnitId"
            invoke-static {v1, v2, v0}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
            const-string v2, "adFormat"
            const-string v3, "rewarded"
            invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V
            return-void
            """.trimIndent()
        )
    }
    logger.info("MAX Unity Ad wrapper patched successfully")
    return true
}

/**
 * Strategy for Native AppLovin MAX SDK (MaxRewardedAd).
 */
private fun BytecodePatchContext.applyNativeMaxStrategy(logger: Logger) {
    val nativeReady = MaxRewardedAdIsReadyFingerprint.methodOrNull
    val nativeShow = MaxRewardedAdShowAdFingerprint.methodOrNull
    if (nativeReady == null || nativeShow == null) return

    nativeReady.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

    val rc = nativeShow.implementation?.registerCount ?: 0
    if (rc >= 7) {
        nativeShow.addInstructions(0, fireRewardedAdCallbacks())
    } else {
        try {
            cloneParameters(nativeShow).addInstructions(0, fireRewardedAdCallbacks())
            logger.info("Native MAX via clone (low regs $rc)")
        } catch (e: Exception) {
            logger.warning("Clone failed for native MAX: ${e.message}")
        }
    }
    logger.info("Native MAX patched successfully")
}

/**
 * Strategy for IronSourceAds precise wrapper.
 */
private fun BytecodePatchContext.applyIronSourceAdsWrapperStrategy(logger: Logger) {
    val ready = IronSourceAdsRewardedIsReadyPreciseFingerprint.methodOrNull
    val show = IronSourceAdsRewardedShowPreciseFingerprint.methodOrNull
    if (ready == null || show == null) return
    try {
        ready.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        cloneParameters(show).addInstructions(
            0,
            """
            move-object/from16 v1, p0
            invoke-virtual {v1}, Lcom/unity3d/ironsourceads/rewarded/RewardedAd;->getListener()Lcom/unity3d/ironsourceads/rewarded/RewardedAdListener;
            move-result-object v0
            if-eqz v0, :morphe_isads_done
            invoke-interface {v0, v1}, Lcom/unity3d/ironsourceads/rewarded/RewardedAdListener;->onRewardedAdShown(Lcom/unity3d/ironsourceads/rewarded/RewardedAd;)V
            invoke-interface {v0, v1}, Lcom/unity3d/ironsourceads/rewarded/RewardedAdListener;->onUserEarnedReward(Lcom/unity3d/ironsourceads/rewarded/RewardedAd;)V
            invoke-interface {v0, v1}, Lcom/unity3d/ironsourceads/rewarded/RewardedAdListener;->onRewardedAdDismissed(Lcom/unity3d/ironsourceads/rewarded/RewardedAd;)V
            :morphe_isads_done
            return-void
            """.trimIndent()
        )
        logger.info("IronSourceAds wrapper patched successfully")
    } catch (e: Exception) {
        logger.warning("IronSourceAds wrapper patch failed: ${e.message}")
    }
}

/**
 * Strategy for IronSource Unity LevelPlay bridge.
 */
private fun BytecodePatchContext.applyIronSourceBridgeStrategy(logger: Logger): Boolean {
    val bridgeReady = IronSourceUnityRewardedAdIsReadyFingerprint.methodOrNull
    val bridgeShow = IronSourceLevelPlayFullScreenShowAdFingerprint.methodOrNull
    if (bridgeReady == null || bridgeShow == null) return false
    bridgeReady.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    cloneParameters(bridgeShow).addInstructions(
        0,
        """
        move-object/from16 v3, p0
        iget-object v0, v3, Lcom/ironsource/Ya;->k:Lcom/ironsource/Za;
        if-eqz v0, :morphe_ads_free_rewards_done
        iget-object v1, v3, Lcom/ironsource/Ya;->m:Lcom/ironsource/q6;
        invoke-interface {v1}, Lcom/ironsource/q6;->b()Lcom/unity3d/mediation/LevelPlayAdInfo;
        move-result-object v1
        invoke-interface {v0, v1}, Lcom/ironsource/Za;->onAdDisplayed(Lcom/unity3d/mediation/LevelPlayAdInfo;)V
        new-instance v4, Lcom/unity3d/mediation/rewarded/LevelPlayReward;
        const-string v2, "reward"
        const/4 v3, 0x1
        invoke-direct {v4, v2, v3}, Lcom/unity3d/mediation/rewarded/LevelPlayReward;-><init>(Ljava/lang/String;I)V
        invoke-interface {v0, v4, v1}, Lcom/ironsource/Za;->onAdRewarded(Lcom/unity3d/mediation/rewarded/LevelPlayReward;Lcom/unity3d/mediation/LevelPlayAdInfo;)V
        invoke-interface {v0, v1}, Lcom/ironsource/Za;->onAdClosed(Lcom/unity3d/mediation/LevelPlayAdInfo;)V
        :morphe_ads_free_rewards_done
        return-void
        """.trimIndent()
    )
    logger.info("IronSource LevelPlay bridge patched successfully")
    return true
}

/**
 * Strategy for Unity IronSourceAds fallback.
 */
private fun BytecodePatchContext.applyIronSourceAdsStrategy(logger: Logger) {
    val ironAds = IronSourceAdsRewardedShowFingerprint.methodOrNull ?: return
    try {
        ironAds.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        logger.info("Unity IronSourceAds forced to success")
    } catch (e: Exception) {
        logger.warning("IronSourceAds patch failed: ${e.message}")
    }
}

/**
 * Strategy for Unity Ads (v3, v4, RewardedAd).
 */
private fun BytecodePatchContext.applyUnityAdsStrategy(logger: Logger) {
    UnityAdsAdvertisementIsReadyFingerprint.methodOrNull?.let {
        it.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
    UnityAdsAdvertisementIsReadyPlacementFingerprint.methodOrNull?.let {
        it.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
    UnityAdsSdkIsReadyFingerprint.methodOrNull?.let {
        it.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }

    UnityRewardedAdShowFingerprint.methodOrNull?.let { adsShow ->
        adsShow.addInstructions(
            0,
            """
            move-object/from16 v0, p3
            move-object/from16 v1, p0
            invoke-interface {v0, v1}, Lcom/unity3d/ads/RewardedShowListener;->onRewarded(Lcom/unity3d/ads/RewardedAd;)V
            invoke-interface {v0, v1}, Lcom/unity3d/ads/ShowListener;->onStarted(Ljava/lang/Object;)V
            sget-object v2, Lcom/unity3d/ads/ShowFinishState;->COMPLETED:Lcom/unity3d/ads/ShowFinishState;
            invoke-interface {v0, v1, v2}, Lcom/unity3d/ads/ShowListener;->onCompleted(Ljava/lang/Object;Lcom/unity3d/ads/ShowFinishState;)V
            return-void
            """.trimIndent()
        )
        logger.info("Unity Ads RewardedAd patched successfully")
    }

    UnityAdsV4Show3ArgFingerprint.methodOrNull?.let { v4Show3 ->
        v4Show3.addInstructions(
            0,
            """
            move-object/from16 v1, p2
            move-object/from16 v2, p1
            invoke-interface {v1, v2}, Lcom/unity3d/ads/IUnityAdsShowListener;->onUnityAdsShowStart(Ljava/lang/String;)V
            sget-object v0, Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;->COMPLETED:Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;
            invoke-interface {v1, v2, v0}, Lcom/unity3d/ads/IUnityAdsShowListener;->onUnityAdsShowComplete(Ljava/lang/String;Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;)V
            return-void
            """.trimIndent()
        )
        logger.info("Unity Ads v4 (3-arg) patched successfully")
    }

    UnityAdsV4Show4ArgFingerprint.methodOrNull?.let { v4Show4 ->
        v4Show4.addInstructions(
            0,
            """
            move-object/from16 v1, p3
            move-object/from16 v2, p1
            invoke-interface {v1, v2}, Lcom/unity3d/ads/IUnityAdsShowListener;->onUnityAdsShowStart(Ljava/lang/String;)V
            sget-object v0, Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;->COMPLETED:Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;
            invoke-interface {v1, v2, v0}, Lcom/unity3d/ads/IUnityAdsShowListener;->onUnityAdsShowComplete(Ljava/lang/String;Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowCompletionState;)V
            return-void
            """.trimIndent()
        )
        logger.info("Unity Ads v4 (4-arg) patched successfully")
    }
}

/**
 * Strategy for AdMob RewardedAd callsites in GMS.
 */
private fun BytecodePatchContext.applyAdMobRewardedStrategy(logger: Logger) {
    var patchedCallSites = 0
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("okhttp") || tl.contains("androidx") || tl.contains("com/google/android/gms/ads/rewarded")) return@classDefForEach
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        for (method in classDef.methods) {
            val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }
            val impl = method.implementation ?: continue
            val instructions = impl.instructions.toList()
            for ((index, insn) in instructions.withIndex()) {
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (ref.definingClass != "Lcom/google/android/gms/ads/rewarded/RewardedAd;" || ref.name != "show" || ref.returnType != "V") continue
                if (ref.parameterTypes.size != 2 || ref.parameterTypes[1] != "Lcom/google/android/gms/ads/OnUserEarnedRewardListener;") continue
                try {
                    val listenerReg = when (insn) {
                        is BuilderInstruction35c -> {
                            if (insn.registerCount < 3) continue
                            insn.registerE
                        }
                        is BuilderInstruction3rc -> insn.startRegister + 2
                        else -> continue
                    }
                    mutableMethod.addInstructions(index, """
                        if-eqz v$listenerReg, :morphe_admob_skip_$index
                        const/4 v0, 0x0
                        invoke-interface {v$listenerReg, v0}, Lcom/google/android/gms/ads/OnUserEarnedRewardListener;->onUserEarnedReward(Lcom/google/android/gms/ads/rewarded/RewardItem;)V
                        :morphe_admob_skip_$index
                    """.trimIndent())
                    patchedCallSites++
                } catch (_: Exception) {}
            }
        }
    }
    if (patchedCallSites > 0) {
        logger.info("AdMob patch - patched $patchedCallSites call site(s)")
    }
}

/**
 * Primary strategy for Google Mobile Ads Unity plugin (UnityRewardedAd & UnityRewardedAdPreloader).
 * This is the exact ad SDK used by Hungry Shark World v8.1.6+.
 */
private fun BytecodePatchContext.applyGoogleUnityAdsStrategy(logger: Logger): Boolean {
    var patched = false

    val isAvailable = GoogleUnityRewardedAdIsAvailableFingerprint.methodOrNull
    if (isAvailable != null) {
        try {
            isAvailable.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            logger.info("Google Unity Ads: UnityRewardedAd.isAdAvailable forced to true")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAd.isAdAvailable: ${e.message}")
        }
    }

    val loadAd = GoogleUnityRewardedAdLoadFingerprint.methodOrNull
    if (loadAd != null) {
        try {
            loadAd.addInstructions(
                0,
                """
                iget-object v0, p0, Lcom/google/unity/ads/UnityRewardedAd;->callback:Lcom/google/unity/ads/UnityRewardedAdCallback;
                if-eqz v0, :morphe_load_skip
                invoke-interface {v0}, Lcom/google/unity/ads/UnityRewardedAdCallback;->onRewardedAdLoaded()V
                :morphe_load_skip
                return-void
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedAd.loadAd patched to fire onRewardedAdLoaded")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAd.loadAd: ${e.message}")
        }
    }

    val pollAd = GoogleUnityRewardedAdPollFingerprint.methodOrNull
    if (pollAd != null) {
        try {
            pollAd.addInstructions(
                0,
                """
                iget-object v0, p0, Lcom/google/unity/ads/UnityRewardedAd;->callback:Lcom/google/unity/ads/UnityRewardedAdCallback;
                if-eqz v0, :morphe_poll_skip
                invoke-interface {v0}, Lcom/google/unity/ads/UnityRewardedAdCallback;->onRewardedAdLoaded()V
                :morphe_poll_skip
                return-void
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedAd.pollAd patched to fire onRewardedAdLoaded")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAd.pollAd: ${e.message}")
        }
    }

    val show = GoogleUnityRewardedAdShowFingerprint.methodOrNull
    if (show != null) {
        try {
            val clonedShow = cloneMethodWithAdditionalRegisters(show, 4)
            clonedShow.addInstructions(
                0,
                """
                iget-object v0, p0, Lcom/google/unity/ads/UnityRewardedAd;->fullScreenContentCallback:Lcom/google/android/gms/ads/FullScreenContentCallback;
                if-eqz v0, :morphe_show_skip
                invoke-virtual {v0}, Lcom/google/android/gms/ads/FullScreenContentCallback;->onAdShowedFullScreenContent()V
                :morphe_show_skip
                iget-object v1, p0, Lcom/google/unity/ads/UnityRewardedAd;->callback:Lcom/google/unity/ads/UnityRewardedAdCallback;
                if-eqz v1, :morphe_earn_skip
                const-string v2, "reward"
                const/high16 v3, 0x3f800000    # 1.0f
                invoke-interface {v1, v2, v3}, Lcom/google/unity/ads/UnityRewardedAdCallback;->onUserEarnedReward(Ljava/lang/String;F)V
                :morphe_earn_skip
                if-eqz v0, :morphe_dismiss_skip
                invoke-virtual {v0}, Lcom/google/android/gms/ads/FullScreenContentCallback;->onAdDismissedFullScreenContent()V
                :morphe_dismiss_skip
                return-void
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedAd.show patched with instant reward and dismissal")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAd.show: ${e.message}")
        }
    }

    // Preloader support
    val preloaderAvailable = GoogleUnityRewardedAdPreloaderIsAvailableFingerprint.methodOrNull
    if (preloaderAvailable != null) {
        try {
            preloaderAvailable.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            logger.info("Google Unity Ads: UnityRewardedAdPreloader.isAdAvailable forced to true")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAdPreloader.isAdAvailable: ${e.message}")
        }
    }

    val preloaderGetNum = GoogleUnityRewardedAdPreloaderGetNumAdsFingerprint.methodOrNull
    if (preloaderGetNum != null) {
        try {
            preloaderGetNum.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            logger.info("Google Unity Ads: UnityRewardedAdPreloader.getNumAdsAvailable forced to 1")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAdPreloader.getNumAdsAvailable: ${e.message}")
        }
    }

    val preloaderPoll = GoogleUnityRewardedAdPreloaderPollFingerprint.methodOrNull
    if (preloaderPoll != null) {
        try {
            preloaderPoll.addInstructions(
                0,
                """
                new-instance v0, Lcom/google/unity/ads/UnityRewardedAd;
                iget-object v1, p0, Lcom/google/unity/ads/UnityRewardedAdPreloader;->activity:Landroid/app/Activity;
                invoke-direct {v0, v1, p2}, Lcom/google/unity/ads/UnityRewardedAd;-><init>(Landroid/app/Activity;Lcom/google/unity/ads/UnityRewardedAdCallback;)V
                if-eqz p2, :morphe_preloader_skip
                invoke-interface {p2}, Lcom/google/unity/ads/UnityRewardedAdCallback;->onRewardedAdLoaded()V
                :morphe_preloader_skip
                return-object v0
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedAdPreloader.pollAd patched to instantiate UnityRewardedAd")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedAdPreloader.pollAd: ${e.message}")
        }
    }

    // Rewarded Interstitial Ad support
    val rwInterstitialLoad = GoogleUnityRewardedInterstitialAdLoadFingerprint.methodOrNull
    if (rwInterstitialLoad != null) {
        try {
            rwInterstitialLoad.addInstructions(
                0,
                """
                iget-object v0, p0, Lcom/google/unity/ads/UnityRewardedInterstitialAd;->callback:Lcom/google/unity/ads/UnityRewardedInterstitialAdCallback;
                if-eqz v0, :morphe_load_skip
                invoke-interface {v0}, Lcom/google/unity/ads/UnityRewardedInterstitialAdCallback;->onRewardedInterstitialAdLoaded()V
                :morphe_load_skip
                return-void
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedInterstitialAd.loadAd patched to fire onRewardedInterstitialAdLoaded")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedInterstitialAd.loadAd: ${e.message}")
        }
    }

    val rwInterstitialShow = GoogleUnityRewardedInterstitialAdShowFingerprint.methodOrNull
    if (rwInterstitialShow != null) {
        try {
            val clonedShow = cloneMethodWithAdditionalRegisters(rwInterstitialShow, 4)
            clonedShow.addInstructions(
                0,
                """
                iget-object v1, p0, Lcom/google/unity/ads/UnityRewardedInterstitialAd;->callback:Lcom/google/unity/ads/UnityRewardedInterstitialAdCallback;
                if-eqz v1, :morphe_earn_skip
                const-string v2, "reward"
                const/high16 v3, 0x3f800000    # 1.0f
                invoke-interface {v1, v2, v3}, Lcom/google/unity/ads/UnityRewardedInterstitialAdCallback;->onUserEarnedReward(Ljava/lang/String;F)V
                :morphe_earn_skip
                return-void
                """.trimIndent(),
            )
            logger.info("Google Unity Ads: UnityRewardedInterstitialAd.show patched with reward callback")
            patched = true
        } catch (e: Exception) {
            logger.warning("Failed to patch UnityRewardedInterstitialAd.show: ${e.message}")
        }
    }

    return patched
}

