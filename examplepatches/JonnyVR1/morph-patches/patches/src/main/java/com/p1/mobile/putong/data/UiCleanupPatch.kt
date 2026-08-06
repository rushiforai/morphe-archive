package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
@JvmField
val uiCleanupPatch = bytecodePatch(
    name = "UI Cleanup",
    description = "Removes guides, banners, stickers, decorations, and AI prompts",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {

        aiChatGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "init" || method.name == "onResume") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        aiTranslateGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "showGuide" || method.name == "display") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
                if (method.name == "isGuideShown" && method.returnType == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        mktFeaturePopupClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "present") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        mktTimeStickerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "choose") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        newFunctionGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "showGuide" || method.name == "display") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
                if (method.name == "isShown" && method.returnType == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        purchaseGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "init") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        myTabTopBannerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "setVisibility" || method.name == "init") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        discountEntryBannerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "init" || method.name == "bind" || method.name == "setup") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        positioningGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "showPopup") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        avatarVerificationGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "showGuide") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        buzzPopupClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "showPopup") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        idVerificationGuideClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if ((method.name == "show" || method.name == "display" || method.name == "showGuide") &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEnhancedPromotionBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
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

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/views/innerpush/ComplimentReceivedBannerLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/views/NewUserSpecialLikeBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/home/virtualcard/SuperLikeOrUndoGuideCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
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

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SendMultiSuperLikePushBubble;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "onFinishInflate" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        val guideViewDescriptors = listOf(
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
            "Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;",
            "Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;",
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
    }
}

private val aiChatGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("core_messages_ai_p2p_chat_guide"),
    ),
)

private val aiTranslateGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("e_intl_ai_translate_bubble"),
        string("ai_chat_advice_guide"),
    ),
)

private val mktFeaturePopupClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_intl_mkt_feature_regular_popup"),
    ),
)

private val mktTimeStickerClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_intl_mkt_time_sticker_choose"),
    ),
)

private val newFunctionGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("svip_new_function_guide_shown_Intl"),
    ),
)

private val purchaseGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_new_users_see_purchase_guide_see_view"),
    ),
)

private val myTabTopBannerClassFingerprint = Fingerprint(
    filters = listOf(
        string("core_my_tab_top_banner_view"),
    ),
)

private val discountEntryBannerClassFingerprint = Fingerprint(
    filters = listOf(
        string("discount_entry_banner"),
        string("IntlMeetILikeNewLikeDiscountEntry"),
    ),
)

private val positioningGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_alert_positioning_authority_open_guide_popup"),
    ),
)

private val avatarVerificationGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_alert_avatar_verification_upgrade_guide_popup"),
    ),
)

private val buzzPopupClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_intl_buzz_memoji_paired"),
    ),
)

private val idVerificationGuideClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_id_verification_new_function_guide"),
    ),
)
