package com.p1.mobile.putong.data

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.WeakHashMap

val sharedInstructionCache = WeakHashMap<Method, List<Instruction>>()
fun Method.sharedCachedInstructions(): List<Instruction> =
    sharedInstructionCache.getOrPut(this) { implementation?.instructions?.toList() ?: emptyList() }

class UnifiedClassResolver(private val context: BytecodePatchContext) {
    private val resolvedClasses = mutableMapOf<String, ClassDef>()
    
    private val analyticsAnchors = setOf(
        "e_request_none_oaid", "com.tantanapp.beatles",
        "add_payment_info", "com.google.android.gms.ads.identifier.service.START",
        "mmfile_push_statistic", "BatteryMetrics", "live-PerfTracer",
        "DNS_SLA", "_getOrCreate", "_compressRecordFile",
        "getSubmitAlternative"
    )
    
    private val FOX_STATS_DEFAULT_ENV = "Lcom/tantanapp/foxstatistics/DefaultEnvironment;"
    
    private val uiCleanupAnchors = mapOf(
        "aiChatGuide" to setOf("core_messages_ai_p2p_chat_guide"),
        "aiTranslateGuide" to setOf("e_intl_ai_translate_bubble", "ai_chat_advice_guide"),
        "mktFeaturePopup" to setOf("p_intl_mkt_feature_regular_popup"),
        "mktTimeSticker" to setOf("p_intl_mkt_time_sticker_choose"),
        "newFunctionGuide" to setOf("svip_new_function_guide_shown_Intl"),
        "purchaseGuide" to setOf("p_new_users_see_purchase_guide_see_view"),
        "myTabTopBanner" to setOf("core_my_tab_top_banner_view"),
        "discountEntryBanner" to setOf("discount_entry_banner", "IntlMeetILikeNewLikeDiscountEntry"),
        "positioningGuide" to setOf("p_alert_positioning_authority_open_guide_popup"),
        "avatarVerificationGuide" to setOf("p_alert_avatar_verification_upgrade_guide_popup"),
        "buzzPopup" to setOf("p_intl_buzz_memoji_paired"),
        "idVerificationGuide" to setOf("p_id_verification_new_function_guide")
    )
    
    private val dialogAnchors = mapOf(
        "mx0" to setOf("p_appstore_rating_filter_popup", "showRankGuideDlg"),
        "zrj0" to setOf("p_alert_version_upgrade_popup", "updateDlg"),
        "ok3" to setOf("p_offline_popup", "LikersDialogView"),
        "vipUpgradePopup" to setOf("vip_upgrade_popup"),
        "omsDialogController" to setOf("limitDialogLastShowTime"),
        "gpRateGuide" to setOf("p_intl_5star_dialog_view", "rate_popup_last_shown_new")
    )
    
    private val premiumAnchorStrings = setOf(
        "/summarized-privileges?with=diamond", "intl_receive_like_guide_get", "receive_like_guide_get",
        "fake_conversation_surprise_gift_box", "fake_conversation_profile_like_enter",
        "fake_conversation_greeting", "conversation_feed_state", "meet_entrance",
        "fake_conversation_local_instant_chat_conversation", "fake_conversation_anonymous_greeting",
        "fake_conversation_local_team_group_conversation", "fake_conversation_local_limited_trial_see_fold",
        "intlSeeChatRequest", "intl_chat_request_insert_users", "fake_conversation_oof_pick",
        "intl_sl_guide_config", "intl_good_c_bage_config", "e_intl_spotlight_activity_card",
        "ttt_membership_price_diff", "seeUpgradeToPremium", "e_vip_banner",
        "vas_commercial_card_right_slide_strategy", "暂未激活黑金会员",
        "picksUser id is not found in users : ", "p_offline_popup", "last_likers_req_time",
        "offline_dialog_show_time", "reBackAppGuideDialog", "open_fill_info_debug",
        "fromWhoLikedMe", "e_red_dot_message_see", "MeetLikersNewLikersData",
        "IntlMeetLikersNewLikersData", "matched"
    )
    
    private val premiumAnchorFields = setOf(
        "Lcom/p1/mobile/putong/data/Counter;.likersLimit",
        "Lcom/p1/mobile/putong/data/LikersLimit;.remaining",
        "Lcom/p1/mobile/putong/data/User;.localRelationship",
        "Lcom/p1/mobile/putong/data/Counter;.secretCrushLimit",
        "Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;.remaining",
        "Lcom/p1/mobile/putong/core/data/GreetingCounter;.replyThanksRemain",
        "Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;.enable",
        "Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;.swipeLimit",
        "Lcom/p1/mobile/putong/core/data/IntlUltraPremiumConfig;.androidEnable",
        "Lcom/p1/mobile/putong/core/data/CoreData;.surpriseGiftExpirationTime",
        "Lcom/p1/mobile/putong/data/User;.isVIP",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;.TYPE_ROAMING_PKG",
        "Lcom/p1/mobile/putong/core/data/Conversation;.property",
        "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_common",
        "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_received_likes",
        "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_matches",
        "Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;.isCanUpgradeUltra",
        "Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;",
        "Lcom/p051p1/mobile/putong/core/p058ui/poplevel/CorePopLevel;.INTL_SEE_ANIM_BUBBLE"
    )
    
    private val premiumAnchorMethods = setOf(
        "Lcom/p1/mobile/putong/data/User;.isSupremePartnerOpenMystery",
        "Lcom/p1/mobile/putong/data/User;.isHideIconFromSVipWithMe",
        "Lcom/p1/mobile/putong/core/api/CoreLikers;.S6",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/NewProfilePrivilegedPager;.d",
        "Lcom/p1/mobile/putong/ab/IntlCountryCodeController;.k"
    )
    
    private val allAnchorStrings = analyticsAnchors + 
        uiCleanupAnchors.values.flatten().toSet() +
        dialogAnchors.values.flatten().toSet() +
        premiumAnchorStrings
    
    fun resolve() {
        val totalTargets = 10 + 12 + 6 + 54
        
        context.classDefForEach { classDef ->
            if (resolvedClasses.size >= totalTargets) return@classDefForEach
            
            val classType = classDef.type
            if (classType.startsWith("Landroid/") || 
                classType.startsWith("Lkotlin/") ||
                classType.startsWith("Ljava/")) {
                return@classDefForEach
            }
            
            val isSettingsUi = classType.startsWith("Lcom/p1/mobile/putong/core/ui/settings/")
            
            val foundStrings = mutableSetOf<String>()
            val foundFields = mutableSetOf<String>()
            val foundMethods = mutableSetOf<String>()
            val methodCallFull = mutableSetOf<String>()
            val methodCallSigs = mutableSetOf<String>()
            val methodCallFullSigs = mutableSetOf<String>()
            val methodNameRet = mutableSetOf<String>()
            var hasZUserMethod = false
            var hasCoreEventLoggerRef = false
            
            classDef.methods.forEach { method ->
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && 
                    method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;") {
                    hasZUserMethod = true
                }
                
                method.sharedCachedInstructions().forEach { instr ->
                    if (instr is ReferenceInstruction) {
                        when (val ref = instr.reference) {
                            is StringReference -> {
                                val s = ref.string
                                if (s in allAnchorStrings) foundStrings.add(s)
                            }
                            is FieldReference -> {
                                val fieldFull = "${ref.definingClass}.${ref.name}"
                                if (fieldFull in premiumAnchorFields) foundFields.add(fieldFull)
                            }
                            is MethodReference -> {
                                val methodFull = "${ref.definingClass}.${ref.name}"
                                if (methodFull in premiumAnchorMethods) foundMethods.add(methodFull)
                                if (ref.definingClass == FOX_STATS_DEFAULT_ENV) hasCoreEventLoggerRef = true
                                methodCallFull.add(methodFull)
                                val sig = "${ref.name}.${ref.parameterTypes.size}.${ref.returnType}"
                                methodCallSigs.add(sig)
                                val fullSig = "${ref.definingClass}.${ref.name}.${ref.parameterTypes.size}.${ref.returnType}"
                                methodCallFullSigs.add(fullSig)
                                methodNameRet.add("${ref.name}\u0001${ref.returnType}")
                            }
                        }
                    }
                }
            }
            
            if (foundStrings.isEmpty() && foundFields.isEmpty() && foundMethods.isEmpty() && !hasCoreEventLoggerRef) {
                return@classDefForEach
            }
            
            resolveAnalytics(foundStrings, classDef, hasCoreEventLoggerRef)
            resolveUiCleanup(foundStrings, classDef)
            resolveDialogs(foundStrings, classDef)
            resolvePremium(foundStrings, foundFields, foundMethods, methodCallFull, 
                          methodCallSigs, methodCallFullSigs, methodNameRet, hasZUserMethod, isSettingsUi, classDef)
        }
    }
    
    private fun resolveAnalytics(foundStrings: Set<String>, classDef: ClassDef, hasCoreEventLoggerRef: Boolean) {
        if ("e_request_none_oaid" in foundStrings) resolvedClasses.putIfAbsent("foxStats", classDef)
        if ("com.tantanapp.beatles" in foundStrings) resolvedClasses.putIfAbsent("beatles", classDef)
        if ("add_payment_info" in foundStrings) resolvedClasses.putIfAbsent("firebaseAnalytics", classDef)
        if ("com.google.android.gms.ads.identifier.service.START" in foundStrings) resolvedClasses.putIfAbsent("googleAdId", classDef)
        if ("mmfile_push_statistic" in foundStrings) resolvedClasses.putIfAbsent("pushStats", classDef)
        if ("BatteryMetrics" in foundStrings) resolvedClasses.putIfAbsent("batteryMetrics", classDef)
        if ("live-PerfTracer" in foundStrings) resolvedClasses.putIfAbsent("moLiveApm", classDef)
        if ("DNS_SLA" in foundStrings) resolvedClasses.putIfAbsent("dnsSla", classDef)
        if ("getSubmitAlternative" in foundStrings) resolvedClasses.putIfAbsent("moLiveApm2", classDef)
        if ("_getOrCreate" in foundStrings && "_compressRecordFile" in foundStrings) resolvedClasses.putIfAbsent("moTracing", classDef)
        if (hasCoreEventLoggerRef) resolvedClasses.putIfAbsent("coreEventLogger", classDef)
    }
    
    private fun resolveUiCleanup(foundStrings: Set<String>, classDef: ClassDef) {
        for ((key, anchors) in uiCleanupAnchors) {
            if (key !in resolvedClasses && anchors.any { it in foundStrings }) {
                resolvedClasses[key] = classDef
            }
        }
    }
    
    private fun resolveDialogs(foundStrings: Set<String>, classDef: ClassDef) {
        for ((key, anchors) in dialogAnchors) {
            if (key !in resolvedClasses && anchors.any { it in foundStrings }) {
                resolvedClasses[key] = classDef
            }
        }
    }
    
    private fun resolvePremium(
        foundStrings: Set<String>,
        foundFields: Set<String>,
        foundMethods: Set<String>,
        methodCallFull: Set<String>,
        methodCallSigs: Set<String>,
        methodCallFullSigs: Set<String>,
        methodNameRet: Set<String>,
        hasZUserMethod: Boolean,
        isSettingsUi: Boolean,
        classDef: ClassDef
    ) {
        val hasConvNew_ = "Lcom/p1/mobile/putong/core/data/Conversation;.new_.0.Lcom/p1/mobile/putong/core/data/Conversation;" in methodCallFullSigs
        
        if ("xma" !in resolvedClasses && !isSettingsUi && "/summarized-privileges?with=diamond" in foundStrings) {
            resolvedClasses["xma"] = classDef
        }
        if ("qa9" !in resolvedClasses && "intl_receive_like_guide_get" in foundStrings && hasConvNew_) {
            resolvedClasses["qa9"] = classDef
        }
        if ("hva" !in resolvedClasses && "receive_like_guide_get" in foundStrings && hasConvNew_) {
            resolvedClasses["hva"] = classDef
        }
        if ("coreApiFakeConv" !in resolvedClasses && "fake_conversation_surprise_gift_box" in foundStrings && hasConvNew_) {
            resolvedClasses["coreApiFakeConv"] = classDef
        }
        if ("profileLikeEnter" !in resolvedClasses && "fake_conversation_profile_like_enter" in foundStrings && hasConvNew_) {
            resolvedClasses["profileLikeEnter"] = classDef
        }
        if ("greetingFakeConv" !in resolvedClasses && "fake_conversation_greeting" in foundStrings && hasConvNew_) {
            resolvedClasses["greetingFakeConv"] = classDef
        }
        if ("feedStateFakeConv" !in resolvedClasses && "conversation_feed_state" in foundStrings && hasConvNew_) {
            resolvedClasses["feedStateFakeConv"] = classDef
        }
        if ("meetEntranceBanner" !in resolvedClasses && "meet_entrance" in foundStrings && "w.0.V" in methodCallSigs) {
            resolvedClasses["meetEntranceBanner"] = classDef
        }
        if ("instantChatGuide" !in resolvedClasses && "fake_conversation_local_instant_chat_conversation" in foundStrings && hasConvNew_) {
            resolvedClasses["instantChatGuide"] = classDef
        }
        if ("mainUiFakeConv" !in resolvedClasses && "fake_conversation_anonymous_greeting" in foundStrings && hasConvNew_) {
            resolvedClasses["mainUiFakeConv"] = classDef
        }
        if ("coreApiTeamGroup" !in resolvedClasses && "fake_conversation_local_team_group_conversation" in foundStrings && hasConvNew_) {
            resolvedClasses["coreApiTeamGroup"] = classDef
        }
        if ("coreApiLimitedTrialFold" !in resolvedClasses && "fake_conversation_local_limited_trial_see_fold" in foundStrings && hasConvNew_) {
            resolvedClasses["coreApiLimitedTrialFold"] = classDef
        }
        if ("intlSeeChatRequestCreator" !in resolvedClasses && "intlSeeChatRequest" in foundStrings && hasConvNew_) {
            resolvedClasses["intlSeeChatRequestCreator"] = classDef
        }
        if ("r8n" !in resolvedClasses && "intl_chat_request_insert_users" in foundStrings) {
            resolvedClasses["r8n"] = classDef
        }
        if ("headRecommendAdapter" !in resolvedClasses && "fake_conversation_profile_like_enter" in foundStrings && 
            "fake_conversation_oof_pick" in foundStrings && "getItemViewType.1.I" in methodCallSigs) {
            resolvedClasses["headRecommendAdapter"] = classDef
        }
        if ("seeAnimBubbleCreator" !in resolvedClasses && "Lcom/p1/mobile/putong/core/api/CoreLikers;.S6" in foundMethods && 
            "u7\u0001V" in methodNameRet && "Lcom/p051p1/mobile/putong/core/p058ui/poplevel/CorePopLevel;.INTL_SEE_ANIM_BUBBLE" in foundFields) {
            resolvedClasses["seeAnimBubbleCreator"] = classDef
        }
        
        if ("sb90Companion" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/data/User;.localRelationship" in foundFields && 
            "matched" in foundStrings && "Lcom/p1/mobile/putong/data/User;.isSupremePartnerOpenMystery" in foundMethods && 
            "Lcom/p1/mobile/putong/data/User;.isHideIconFromSVipWithMe" in foundMethods && hasZUserMethod) {
            resolvedClasses["sb90Companion"] = classDef
        }
        if ("u59" !in resolvedClasses && !isSettingsUi && "intl_sl_guide_config" in foundStrings) {
            resolvedClasses["u59"] = classDef
        }
        if ("tm90" !in resolvedClasses && !isSettingsUi && "intl_good_c_bage_config" in foundStrings) {
            resolvedClasses["tm90"] = classDef
        }
        if ("gqf0" !in resolvedClasses && !isSettingsUi && "e_intl_spotlight_activity_card" in foundStrings) {
            resolvedClasses["gqf0"] = classDef
        }
        if ("h6a" !in resolvedClasses && !isSettingsUi && "ttt_membership_price_diff" in foundStrings) {
            resolvedClasses["h6a"] = classDef
        }
        if ("ugc0" !in resolvedClasses && !isSettingsUi && "seeUpgradeToPremium" in foundStrings) {
            resolvedClasses["ugc0"] = classDef
        }
        if ("zva0" !in resolvedClasses && !isSettingsUi && "e_vip_banner" in foundStrings) {
            resolvedClasses["zva0"] = classDef
        }
        if ("th5" !in resolvedClasses && !isSettingsUi && "vas_commercial_card_right_slide_strategy" in foundStrings) {
            resolvedClasses["th5"] = classDef
        }
        if ("qgl0" !in resolvedClasses && !isSettingsUi && "暂未激活黑金会员" in foundStrings) {
            resolvedClasses["qgl0"] = classDef
        }
        if ("sja" !in resolvedClasses && !isSettingsUi && "picksUser id is not found in users : " in foundStrings) {
            resolvedClasses["sja"] = classDef
        }
        if ("n3b0" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/data/Counter;.likersLimit" in foundFields) {
            resolvedClasses["n3b0"] = classDef
        }
        if ("rbb0" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/data/LikersLimit;.remaining" in foundFields) {
            val hasStaticZWithCounter = classDef.methods.any { 
                it.returnType == "Z" && 
                AccessFlags.STATIC.isSet(it.accessFlags) && 
                it.parameterTypes.size == 1 && 
                it.parameterTypes[0] == "Lcom/p1/mobile/putong/data/Counter;"
            }
            if (hasStaticZWithCounter) resolvedClasses["rbb0"] = classDef
        }
        
        if ("hl3" !in resolvedClasses && "p_offline_popup" in foundStrings &&
            methodCallFull.any { it.contains("LikersDialogView") }) {
            resolvedClasses["hl3"] = classDef
        }
        
        if ("j7d0" !in resolvedClasses && "last_likers_req_time" in foundStrings &&
            "offline_dialog_show_time" in foundStrings &&
            methodCallFull.any { it.contains("hl3") }) {
            resolvedClasses["j7d0"] = classDef
        }
        
        if ("gg50" !in resolvedClasses && "p_offline_popup" in foundStrings &&
            methodCallFull.any { it.contains("j7d0") && it.contains(".h0") }) {
            resolvedClasses["gg50"] = classDef
        }
        
        if ("qtk" !in resolvedClasses && "reBackAppGuideDialog" in foundStrings &&
            methodCallFull.any { it.contains("hlh0") }) {
            resolvedClasses["qtk"] = classDef
        }
        
        if ("secretCrush" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/data/Counter;.secretCrushLimit" in foundFields && 
            "Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;.remaining" in foundFields) {
            resolvedClasses["secretCrush"] = classDef
        }
        if ("greetingCounter" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/GreetingCounter;.replyThanksRemain" in foundFields) {
            resolvedClasses["greetingCounter"] = classDef
        }
        if ("swipeRateLimit" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;.enable" in foundFields) {
            resolvedClasses["swipeRateLimit"] = classDef
        }
        if ("leftSwipeLimit" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;.swipeLimit" in foundFields) {
            resolvedClasses["leftSwipeLimit"] = classDef
        }
        if ("intlUltraPremium" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/IntlUltraPremiumConfig;.androidEnable" in foundFields) {
            resolvedClasses["intlUltraPremium"] = classDef
        }
        if ("coreData" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/CoreData;.surpriseGiftExpirationTime" in foundFields) {
            resolvedClasses["coreData"] = classDef
        }
        if ("mb90" !in resolvedClasses && !isSettingsUi && "Lcom/p1/mobile/putong/data/User;.isVIP" in foundFields && 
            "Lcom/p1/mobile/putong/core/data/PurchaseType;.TYPE_ROAMING_PKG" in foundFields && !classDef.type.contains("/ui/settings/")) {
            val hasPurchaseTypeZ = classDef.methods.any { it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/PurchaseType;" && it.returnType == "Z" }
            if (hasPurchaseTypeZ) resolvedClasses["mb90"] = classDef
        }
        if ("jh30" !in resolvedClasses && "Lcom/p1/mobile/putong/core/newui/profile/newme/NewProfilePrivilegedPager;.d" in foundMethods) {
            resolvedClasses["jh30"] = classDef
        }
        if ("businessEntranceAdapter" !in resolvedClasses && "open_fill_info_debug" in foundStrings && "clear" in methodCallFull.map { it.split(".").last() }) {
            resolvedClasses["businessEntranceAdapter"] = classDef
        }
        
        if ("pm6" !in resolvedClasses && "fromWhoLikedMe" in foundStrings &&
            "Lcom/p1/mobile/putong/core/data/Conversation;.property" in foundFields &&
            methodCallFull.any { it.contains("isFemale") }) {
            resolvedClasses["pm6"] = classDef
        }
        
        if ("bhe0" !in resolvedClasses && "e_red_dot_message_see" in foundStrings &&
            methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;") }) {
            resolvedClasses["bhe0"] = classDef
        }
        
        val hasCharSeqM = classDef.methods.any { it.name == "m" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/CharSequence;" }
        val hasCharSeqN = classDef.methods.any { it.name == "n" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/CharSequence;" }
        
        if (hasCharSeqM && hasCharSeqN) {
            val hasPairReturn = classDef.methods.any { it.returnType == "Landroid/util/Pair;" }
            val hasVPairMethod = classDef.methods.any { it.name == "v" && it.returnType == "Landroid/util/Pair;" }
            val hasCoreLikersCall = methodCallFull.any { it.startsWith("Lcom/p1/mobile/putong/core/api/CoreLikers;.") }
            val hasGStringReturn = methodCallFullSigs.any { it.contains(".G.") && it.endsWith(".Ljava/lang/String;") }
            
            if ("vqo" !in resolvedClasses && hasVPairMethod && hasGStringReturn) {
                resolvedClasses["vqo"] = classDef
            }
            else if ("re90" !in resolvedClasses && hasCoreLikersCall && !hasPairReturn) {
                resolvedClasses["re90"] = classDef
            }
            else if ("i0p" !in resolvedClasses && hasCoreLikersCall && classDef.superclass?.contains("re90") == true) {
                resolvedClasses["i0p"] = classDef
            }
        }
        
        if ("meetNewLikersData" !in resolvedClasses && "MeetLikersNewLikersData" in foundStrings &&
            classDef.methods.any { it.parameterTypes.isEmpty() && it.returnType == "I" && it.name != "hashCode" }) {
            resolvedClasses["meetNewLikersData"] = classDef
        }
        
        if ("intlMeetNewLikersData" !in resolvedClasses && "IntlMeetLikersNewLikersData" in foundStrings &&
            classDef.methods.any { it.parameterTypes.isEmpty() && it.returnType == "I" && it.name != "hashCode" }) {
            resolvedClasses["intlMeetNewLikersData"] = classDef
        }
        
        if ("intlMeetNewLikersAdapter" !in resolvedClasses &&
            methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersItem;") }) {
            resolvedClasses["intlMeetNewLikersAdapter"] = classDef
        }
        
        if ("meetNewLikersAdapter" !in resolvedClasses &&
            methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;") }) {
            resolvedClasses["meetNewLikersAdapter"] = classDef
        }
        
        if ("ysa" !in resolvedClasses && !isSettingsUi &&
            "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_common" in foundFields &&
            "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_received_likes" in foundFields &&
            "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;.restrict_non_verified_matches" in foundFields) {
            resolvedClasses["ysa"] = classDef
        }
        
        if ("ae9" !in resolvedClasses && !isSettingsUi &&
            "Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;.isCanUpgradeUltra" in foundFields &&
            "Lcom/p1/mobile/putong/ab/IntlCountryCodeController;.k" in foundMethods &&
            "Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;" in foundFields) {
            resolvedClasses["ae9"] = classDef
        }
        
        // c4m0: VIP roaming location UI gate - has static method n(String, Act, String)Z
        // that checks PurchaseType.TYPE_ROAMING_PKG and references VipLocationHistoryAct
        if ("c4m0" !in resolvedClasses && !isSettingsUi &&
            "Lcom/p1/mobile/putong/core/data/PurchaseType;.TYPE_ROAMING_PKG" in foundFields &&
            methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;") }) {
            val hasStaticNMethod = classDef.methods.any { 
                it.name == "n" && 
                AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.returnType == "Z" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "Ljava/lang/String;" &&
                it.parameterTypes[1] == "Lcom/p1/mobile/android/app/Act;" &&
                it.parameterTypes[2] == "Ljava/lang/String;"
            }
            if (hasStaticNMethod) resolvedClasses["c4m0"] = classDef
        }
    }
    
    fun getAnalyticsClass(key: String): ClassDef? = resolvedClasses[key]
    fun getUiCleanupClass(key: String): ClassDef? = resolvedClasses[key]
    fun getDialogClass(key: String): ClassDef? = resolvedClasses[key]
    fun getPremiumClass(key: String): ClassDef? = resolvedClasses[key]
}
