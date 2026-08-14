package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val instructionCache = java.util.WeakHashMap<com.android.tools.smali.dexlib2.iface.Method, List<Instruction>>()

private fun com.android.tools.smali.dexlib2.iface.Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) {
        implementation?.instructions?.toList() ?: emptyList()
    }

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private val SHOW_LIKE_METHODS = setOf("show", "display", "init", "onResume")
private val AI_TRANSLATE_METHODS = setOf("show", "showGuide", "display")
private val MKT_FEATURE_METHODS = setOf("show", "display", "present")
private val MKT_STICKER_METHODS = setOf("show", "display", "choose")
private val NEW_FUNC_METHODS = setOf("show", "showGuide", "display")
private val PURCHASE_METHODS = setOf("show", "display", "init")
private val MY_TAB_METHODS = setOf("show", "display", "setVisibility", "init")
private val DISCOUNT_METHODS = setOf("show", "display", "init", "bind", "setup")
private val POSITIONING_METHODS = setOf("show", "display", "showPopup")
private val AVATAR_METHODS = setOf("show", "display", "showGuide")
private val BUZZ_METHODS = setOf("show", "display", "showPopup")
private val ID_VERIFY_METHODS = setOf("show", "display", "showGuide")

private val FINGERPRINT_METHOD_MAP = mapOf(
    "aiChatGuide" to SHOW_LIKE_METHODS,
    "mktFeaturePopup" to MKT_FEATURE_METHODS,
    "mktTimeSticker" to MKT_STICKER_METHODS,
    "purchaseGuide" to PURCHASE_METHODS,
    "myTabTopBanner" to MY_TAB_METHODS,
    "discountEntryBanner" to DISCOUNT_METHODS,
    "positioningGuide" to POSITIONING_METHODS,
    "avatarVerificationGuide" to AVATAR_METHODS,
    "buzzPopup" to BUZZ_METHODS,
    "idVerificationGuide" to ID_VERIFY_METHODS,
)

private val FINGERPRINT_BOOL_METHOD_MAP = mapOf(
    "aiTranslateGuide" to "isGuideShown",
    "newFunctionGuide" to "isShown",
)

private val seeAnimTriggerClassFingerprint = Fingerprint(
    filters = listOf(string("IntlSeeAnimBubble")),
)

private val seeAnimRenderClassFingerprint = Fingerprint(
    filters = listOf(
        string("see_anim_bubble"),
        methodCall(name = "x6"),
    ),
)

private val seeWhoLikedMeBannerClassFingerprint = Fingerprint(
    filters = listOf(
        string("e_see_who_liked_me_banner"),
        string("p_suggest_user_profile_info_view"),
    ),
)

private val seeWhoLikedMeProfileCardFingerprint = Fingerprint(
    filters = listOf(
        string("e_see_who_liked_me_banner"),
        fieldAccess(name = "receivedLikes"),
    ),
)

private val bubbleManagerClassFingerprint = Fingerprint(
    filters = listOf(string("MagicBubble")),
)

private val proximityBubbleClassFingerprint = Fingerprint(
    filters = listOf(
        string("distance"),
        methodCall(name = "n7"),
    ),
)

private val friendsOnlinePopupClassFingerprint = Fingerprint(
    filters = listOf(
        string("e_friends_online_popup"),
        string("[See_Toast]"),
    ),
)

@Suppress("unused")
@JvmField
val uiCleanupPatch = bytecodePatch(
    name = "UI Cleanup",
    description = "Removes guides, banners, stickers, decorations, and AI prompts",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {

        val resolver = UnifiedClassResolver(this)
        resolver.resolve()

        val resolved = mutableMapOf<String, com.android.tools.smali.dexlib2.iface.ClassDef>()
        val uiKeys = listOf("aiChatGuide", "aiTranslateGuide", "mktFeaturePopup", "mktTimeSticker",
            "newFunctionGuide", "purchaseGuide", "myTabTopBanner", "discountEntryBanner",
            "positioningGuide", "avatarVerificationGuide", "buzzPopup", "idVerificationGuide")
        for (key in uiKeys) {
            resolver.getUiCleanupClass(key)?.let { resolved[key] = it }
        }

        for ((key, classDef) in resolved) {
            val mutable = mutableClassDefBy(classDef)
            when (key) {
                "aiTranslateGuide" -> {
                    mutable.methods.forEach { method ->
                        if (method.name in AI_TRANSLATE_METHODS && method.returnType == "V") {
                            method.addInstructions(0, RETURN_VOID)
                        }
                        if (method.name == "isGuideShown" && method.returnType == "Z") {
                            method.addInstructions(0, RETURN_FALSE)
                        }
                    }
                }
                "newFunctionGuide" -> {
                    mutable.methods.forEach { method ->
                        if (method.name in NEW_FUNC_METHODS && method.returnType == "V") {
                            method.addInstructions(0, RETURN_VOID)
                        }
                        if (method.name == "isShown" && method.returnType == "Z") {
                            method.addInstructions(0, RETURN_FALSE)
                        }
                    }
                }
                else -> {
                    val targetMethods = FINGERPRINT_METHOD_MAP[key]
                    if (targetMethods != null) {
                        mutable.methods.forEach { method ->
                            if (method.name in targetMethods && method.returnType == "V") {
                                method.addInstructions(0, RETURN_VOID)
                            }
                        }
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "initDataOnCreate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "show" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        val guideViewDescriptors = listOf(
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEnhancedPromotionBannerView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBannerView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;",
            "Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/NewUserSpecialLikeBannerView;",
            "Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;",
            "Lcom/p1/mobile/putong/core/ui/home/virtualcard/SuperLikeOrUndoGuideCardView;",
            "Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SendMultiSuperLikePushBubble;",
            "Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
            "Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;",
            "Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;",
            "Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideLayout;",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/SuperLikeExpGuideView;",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/SuperLikeGuideView;",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedIdealGuideLayout;",
            "Lcom/p1/mobile/putong/core/newui/home/views/CardAuthenticationGuideView;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;",
            "Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;",
            "Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;",
            "Lcom/p1/mobile/putong/core/ui/vip/letter/IntlVipLetterGuideViewForProfile;",
            "Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideView;",
            "Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceGuideSigningView;",
            "Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;",
            "Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemODiamondVisitorGuideMessage;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemPicCertGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemTagGuide;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemGreetGuidePic;",
            "Lcom/p1/mobile/putong/core/ui/messages/NoMatchSeeGuideDialog;",
            "Lcom/p1/mobile/putong/core/newui/home/views/IntlEmojiSimpleCoverGuideView;",
            "Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;",
            "Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/PurchasePromotionItemView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/PurchasePromotionTitleView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PromotionPendantView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/IntlDiscountEntryBannerView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PicCertGuideView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/SwipeGuideLeftView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/SwipeGuideRightView;",
            "Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;",
            "Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;",
            "Lcom/p1/mobile/putong/core/ui/messages/LetterGuideView_IntlB;",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;",
            "Lcom/p1/mobile/putong/core/ui/home/GuideTipsView;",
            "Lcom/p1/mobile/putong/core/ui/meet/MeetPromotionItemView;",
            "Lcom/p1/mobile/putong/core/ui/operation/OperationBannerFeedView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceODiamondSingleView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePaymentView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePrivilegeTopView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;",
            "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextWithIconBgView;",

            "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;",
            "Lcom/p1/mobile/putong/core/newui/messages/ItemMatchIceBreakGuide;",
            "Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;",
            "Lcom/p1/mobile/putong/core/ui/messages/ItemAiP2PChatGuide;",
            "Lcom/p1/mobile/putong/core/ui/purchase/PurchaseUpgradeIntroView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;",
            "Lcom/p1/mobile/putong/core/ui/purchase/showcase/ScrollerGPUpgradePurchaseSectionView;",
            "Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;",
            "Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;",
            "Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/LiveBubbleGuideView;",
            "Lcom/p1/mobile/putong/live/external/intl/common/gameguide/IntlGameGuideDialogView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;",
            "Lcom/p1/mobile/putong/live/livingroom/intl/common/bottom/gamepanel/IntlGameBoardBannerView;",
            "Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;",
            "Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;",

            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareActiveGiftDialogView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;",

            "Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsEmptyItemView;",

            "Lcom/p1/mobile/putong/core/ui/nightclub/view/IntlNightClubDlgView;",
            "Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;",
            "Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;",
            "Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;",
            "Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;",
        )
        guideViewDescriptors.forEach { descriptor ->
            classDefByOrNull(descriptor)?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "onFinishInflate" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        seeAnimTriggerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.returnType == "Z" && method.parameterTypes.any { it.contains("CoreLikers") } ->
                        method.addInstructions(0, RETURN_FALSE)
                    method.returnType == "V" && method.parameterTypes.any { it.contains("CoreLikers") } ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        seeAnimRenderClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.returnType == "I" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        seeWhoLikedMeBannerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "B" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        seeWhoLikedMeProfileCardFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name == "l" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)
                    method.name == "t" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/view/LookUpView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "u" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        bubbleManagerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "i" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "V" &&
                    method.parameterTypes.size == 6 &&
                    method.parameterTypes.any { it.contains("Figure") } &&
                    method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                        (instr.reference as StringReference).string == "e_see_floating_bubble"
                    }
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        proximityBubbleClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "V" &&
                    method.parameterTypes.any { it.contains("Figure") } &&
                    method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                        (instr.reference as StringReference).string == "distance"
                    }
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreLikers;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                        (instr.reference as StringReference).string == "likers_for_popup_distance"
                    }
                }
                .forEach { method ->
                    method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                }
        }

        friendsOnlinePopupClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "V" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes.any { it.contains("ActionData") || it.contains("ActionToast") }
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "a" || method.name == "n") && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "e" && method.returnType == "V" && method.parameterTypes.size == 1) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "g" && method.returnType == "V" && method.parameterTypes.size == 2) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "j0" && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/MemojiBuzzComboEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "n" && method.returnType == "V" && method.parameterTypes.size == 1) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "X" && method.returnType == "V" && method.parameterTypes.size == 1) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "B" && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name in setOf("b", "d") && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "e" && method.returnType == "V" && method.parameterTypes.size == 4) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name == "O3" && method.returnType == "Z" && method.parameterTypes.isEmpty() ->
                        method.addInstructions(0, RETURN_FALSE)
                    method.name == "s3" && method.returnType.startsWith("L") && method.parameterTypes.isEmpty() ->
                        method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "z" && method.returnType == "V" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "I") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // Patch CoreLikers.g7() to prevent "x people like you" promotional popup trigger
        classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreLikers;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "g7" && method.returnType.startsWith("L")) {
                    method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                }
            }
        }

        // Patch home presenter to prevent "x more people like you" popup display
        // This is the single decision point for showing the popup, covering all trigger paths
        val homePresenterClassFingerprint = Fingerprint(
            filters = listOf(
                string("home_total_liker_float"),
                string("home_new_liker_float"),
            )
        )

        homePresenterClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" && 
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].contains("CoreLikers")
                }
                .forEach { method ->
                    method.addInstructions(0, RETURN_FALSE)
                }
        }
    }
}
