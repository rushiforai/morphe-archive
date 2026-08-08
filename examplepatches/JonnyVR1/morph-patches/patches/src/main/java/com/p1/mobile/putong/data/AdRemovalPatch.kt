package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private val profilePhotoCarouselAdFingerprint = Fingerprint(
    filters = listOf(
        string("ca-app-pub-6567608331519569/1891609663"),
        methodCall(name = "onAdClicked"),
    ),
)

private val officialAdvertDisplayFingerprint = Fingerprint(
    filters = listOf(
        string("e_messages_ad"),
        string("p_messages_ad"),
        methodCall(name = "getAdvertData"),
    ),
)

private val adRewardDialogFingerprint = Fingerprint(
    filters = listOf(
        string("p_incentive_ad_choose_page"),
        string("\u89c2\u770b\u5e7f\u544a\u591a\u6ed1"),
        fieldAccess(name = "adReward"),
    ),
)

private val showLiveForIntlAdUserFingerprint = Fingerprint(
    filters = listOf(
        string("animations/christmas/config.xml"),
        fieldAccess(name = "showLiveForIntlAdUser"),
    ),
)

private val treasurePrizeAdFingerprint = Fingerprint(
    filters = listOf(
        string("treasureprizead"),
        fieldAccess(name = "treasurePrizeAds"),
    ),
)

@Suppress("unused")
@JvmField
val adRemovalPatch = bytecodePatch(
    name = "Ad Removal",
    description = "Removes all ad displays: navigation bar banner, native feed ads, live streaming banner ads, live video feed ads, live square ads, conversation Google ads, marriage guide card, four-select-one card, daily selection card, visitor list ads, likers ads, meet likers ads, meet visitor ads, splash screen ads, profile photo carousel ads, incentive video ads, fake splash view, video ad player, official advert, ad reward dialogs, live streaming ad user, treasure prize ads",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "L" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "G" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "M" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "E" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "g" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lkotlin/jvm/functions/Function0;" &&
                        method.returnType == "Z" -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.name == "p" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z" -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/admob/NativeAdViewCard\$Companion;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "l" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "j" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Landroid/content/Context;" &&
                        method.parameterTypes[1] == "Ljava/lang/String;" -> {
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return-object v0
                        """)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "q" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags) -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "r" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags) -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "s" &&
                        method.parameterTypes.size == 1 &&
                        method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags) -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVideoBannerAdCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                if (method.name == "onFinishInflate" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "a" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "b" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "a" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "b" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "c" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/app/PutongAct;" &&
                        method.parameterTypes[1] == "Z" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/admob/GoogleAdAct;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "initSubscription" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/home/view/MarryAdCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "h" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "f" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "I" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "h" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorAdmobItemView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "b" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVideoFeedAdCardView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                if (method.name == "onFinishInflate" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlLikersAdmobItem;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "e" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersAdmobItem;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "e" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorAdmobItemView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "b" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Landroid/view/View;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "onFinishInflate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                if (method.name == "j" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        profilePhotoCarouselAdFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>" || method.name == "<clinit>") return@forEach
                when {
                    method.name == "q" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z" -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.name == "A" &&
                        method.parameterTypes.size == 3 &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/ui/splash/FakeSplashView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                if (method.name == "onFinishInflate" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "V"
                ) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "k" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.parameterTypes[1] == "F" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/incentivevideo/IncentVideoResultAct;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                when {
                    method.name == "inflateView" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "Landroid/view/View;" -> {
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return-object v0
                        """)
                    }
                    method.name == "initDataOnCreate" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        officialAdvertDisplayFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>" || method.name == "<clinit>") return@forEach
                when {
                    method.name == "h" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.parameterTypes[1] == "Landroid/view/ViewGroup;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "m" &&
                        method.parameterTypes.size == 3 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.parameterTypes[1] == "Landroid/view/ViewGroup;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        adRewardDialogFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>" || method.name == "<clinit>") return@forEach
                when {
                    method.name == "m" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.parameterTypes[1] == "Ljava/lang/String;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "n" &&
                        method.parameterTypes.size == 3 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.parameterTypes[1] == "Ljava/lang/String;" &&
                        method.returnType == "V" -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    method.name == "j" &&
                        method.parameterTypes.size == 1 &&
                        method.returnType == "Z" -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        showLiveForIntlAdUserFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>" || method.name == "<clinit>") return@forEach
                when {
                    method.name == "N" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z" -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        treasurePrizeAdFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "<init>" || method.name == "<clinit>") return@forEach
                when {
                    method.returnType == "V" &&
                        method.parameterTypes.any { it.contains("MonetizationTreasure") || it.contains("TreasurePrizeAd") } -> {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

    }
}
