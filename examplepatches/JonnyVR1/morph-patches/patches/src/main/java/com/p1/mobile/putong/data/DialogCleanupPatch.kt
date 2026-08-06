package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
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
val dialogCleanupPatch = bytecodePatch(
    name = "Dialog Cleanup",
    description = "Removes annoying promotional dialogs: 5-star rating, appstore rating, version upgrade, offline popup, notification permission, phone auth prompts, purchase pages",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        // Removed: hardcoded obfuscated class Lcom/p1/mobile/putong/core/ui/gp/a; 
        // Too risky - could be startup-critical, use fingerprint-based approach instead

        mx0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { 
                    it.name == "H" && 
                    it.returnType == "V" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        zrj0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { 
                    it.name == "c" && 
                    it.returnType == "V" &&
                    it.parameterTypes.size == 3 && it.parameterTypes[0] == "Z" && it.parameterTypes[1] == "Lcom/p1/mobile/android/app/Act;" && it.parameterTypes[2] == "Lcom/p1/mobile/putong/data/UpdateApiResult;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        ok3ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    (method.name == "J" &&
                        method.parameterTypes.size == 3 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.returnType == "V" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                        AccessFlags.STATIC.isSet(method.accessFlags)) ||
                        (method.name == "L" &&
                            method.parameterTypes.size == 2 &&
                            method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                            method.parameterTypes[1] == "I" &&
                            method.returnType == "V" &&
                            AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                            AccessFlags.STATIC.isSet(method.accessFlags))
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        // Removed: u750 fingerprint too broad - methodCall(name = "h0") matches many unrelated classes
        // and patching all public b/d methods could break startup-critical boolean checks

        // Removed: ygh0ClassFingerprint - notification permission prompt
        // Too aggressive, could break startup flow

        // Removed: autoSubDialogClassFingerprint - auto-subscription dialog
        // Risky, could interfere with payment flow

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    (it.name == "show" || it.name == "display" || it.name == "present") &&
                    it.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    (it.name == "show" || it.name == "display" || it.name == "present") &&
                    it.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        vipUpgradePopupClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { 
                    it.name == "d" && 
                    it.returnType == "Z" &&
                    it.parameterTypes.size == 1 &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
        }

        // Removed: dislikeWhoLikedMe fingerprint too risky - injects cross-class sget-object reference
        // which could cause VerifyError at class load time if DEX boundaries don't align

        omsDialogControllerFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "M" &&
                    method.returnType == "Z" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    method.parameterTypes[1] == "Z" &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    val blocklistCheck = """
                        const-string v0, "p_welcomeback_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked
                        const/4 v0, 0x0
                        return v0
                        :not_blocked
                        const-string v0, "p_fake_alert_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked2
                        const/4 v0, 0x0
                        return v0
                        :not_blocked2
                        const-string v0, "p_alert_dislike_who_liked_me_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked3
                        const/4 v0, 0x0
                        return v0
                        :not_blocked3
                        const-string v0, "p_no_match_svip"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked4
                        const/4 v0, 0x0
                        return v0
                        :not_blocked4
                        const-string v0, "p_profile_picture_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked5
                        const/4 v0, 0x0
                        return v0
                        :not_blocked5
                        const-string v0, "p_avatarVerification_guide"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked6
                        const/4 v0, 0x0
                        return v0
                        :not_blocked6
                        const-string v0, "p_alert_cheat_prevention__tips_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked7
                        const/4 v0, 0x0
                        return v0
                        :not_blocked7
                        const-string v0, "p_alert_cheat_prevention__risk_alarm_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked8
                        const/4 v0, 0x0
                        return v0
                        :not_blocked8
                        const-string v0, "p_verification_merge_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked9
                        const/4 v0, 0x0
                        return v0
                        :not_blocked9
                        const-string v0, "p_purchase_guide_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked10
                        const/4 v0, 0x0
                        return v0
                        :not_blocked10
                        const-string v0, "p_intl_5star_dialog_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked11
                        const/4 v0, 0x0
                        return v0
                        :not_blocked11
                        const-string v0, "p_appstore_rating_filter_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked12
                        const/4 v0, 0x0
                        return v0
                        :not_blocked12
                        const-string v0, "p_appstore_rating_filter_popup_store"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked13
                        const/4 v0, 0x0
                        return v0
                        :not_blocked13
                        const-string v0, "p_prompt_notification_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked14
                        const/4 v0, 0x0
                        return v0
                        :not_blocked14
                        const-string v0, "p_purchase_expire_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked15
                        const/4 v0, 0x0
                        return v0
                        :not_blocked15
                        const-string v0, "p_purchase_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked16
                        const/4 v0, 0x0
                        return v0
                        :not_blocked16
                        const-string v0, "p_vip_upgrade_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked17
                        const/4 v0, 0x0
                        return v0
                        :not_blocked17
                    """.trimIndent()
                    method.addInstructions(0, blocklistCheck)
                }
        }

        // Removed: splashProxyActFingerprint patch - too aggressive
        // Patching all public void no-arg methods breaks lifecycle methods (onCreate, onResume, etc.)
        // Phone auth dialogs are already handled by OMS dialog blocklist above

        gpRateGuideFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                    method.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEnhancedPromotionBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "J" &&
                    it.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "C" &&
                    it.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/views/NewUserSpecialLikeBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "r" &&
                    it.returnType == "V" &&
                    AccessFlags.PRIVATE.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "r" &&
                    it.returnType == "V" &&
                    AccessFlags.PRIVATE.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/purchase/intlpage/discountentry/IntlDiscountEntryBannerView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "g" &&
                    it.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }
    }
}

private val mx0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_appstore_rating_filter_popup"),
        string("showRankGuideDlg"),
    ),
)

private val zrj0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_alert_version_upgrade_popup"),
        string("updateDlg"),
    ),
)

private val ok3ClassFingerprint = Fingerprint(
    filters = listOf(
        string("p_offline_popup"),
        string("LikersDialogView"),
    ),
)

private val vipUpgradePopupClassFingerprint = Fingerprint(
    filters = listOf(
        string("vip_upgrade_popup"),
    ),
)

private val omsDialogControllerFingerprint = Fingerprint(
    filters = listOf(
        string("limitDialogLastShowTime"),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            name = "identifier",
        ),
    ),
)

private val gpRateGuideFingerprint = Fingerprint(
    filters = listOf(
        string("p_intl_5star_dialog_view"),
        string("rate_popup_last_shown_new"),
    ),
)
