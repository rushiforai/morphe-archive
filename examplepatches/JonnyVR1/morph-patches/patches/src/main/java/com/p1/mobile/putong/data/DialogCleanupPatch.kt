package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private val instructionCache = java.util.WeakHashMap<Method, List<Instruction>>()
private fun Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) { implementation?.instructions?.toList() ?: emptyList() }

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
@JvmField
val dialogCleanupPatch = bytecodePatch(
    name = "Dialog Cleanup",
    description = "Removes annoying promotional dialogs: 5-star rating, appstore rating, version upgrade, offline popup, notification permission, phone auth prompts, purchase pages, purchase confirm, overheat popup, phone verify",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        val resolver = UnifiedClassResolver(this)
        resolver.resolve()

        val dialogClasses = mutableMapOf<String, com.android.tools.smali.dexlib2.iface.ClassDef>()
        val dialogKeys = listOf("mx0", "zrj0", "ok3", "vipUpgradePopup", "omsDialogController", "gpRateGuide")
        for (key in dialogKeys) {
            resolver.getDialogClass(key)?.let { dialogClasses[key] = it }
        }

        dialogClasses["mx0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "H" &&
                    it.returnType == "V" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        dialogClasses["zrj0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "c" &&
                    it.returnType == "V" &&
                    it.parameterTypes.size == 3 && it.parameterTypes[0] == "Z" && it.parameterTypes[1] == "Lcom/p1/mobile/android/app/Act;" && it.parameterTypes[2] == "Lcom/p1/mobile/putong/data/UpdateApiResult;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        dialogClasses["ok3"]?.let { classDef ->
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

        dialogClasses["vipUpgradePopup"]?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name == "d" &&
                    it.returnType == "Z" &&
                    it.parameterTypes.size == 1 &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
        }

        dialogClasses["omsDialogController"]?.let { classDef ->
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
                        const-string v0, "p_purchase_guide_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked
                        const/4 v0, 0x0
                        return v0
                        :not_blocked
                        const-string v0, "p_purchase_expire_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked2
                        const/4 v0, 0x0
                        return v0
                        :not_blocked2
                        const-string v0, "p_purchase_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked3
                        const/4 v0, 0x0
                        return v0
                        :not_blocked3
                        const-string v0, "p_purchase_discount_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked4
                        const/4 v0, 0x0
                        return v0
                        :not_blocked4
                        const-string v0, "p_purchase_confirm_pop"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked5
                        const/4 v0, 0x0
                        return v0
                        :not_blocked5
                        const-string v0, "p_purchase_intermediate_page"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked6
                        const/4 v0, 0x0
                        return v0
                        :not_blocked6
                        const-string v0, "p_vip_upgrade_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked7
                        const/4 v0, 0x0
                        return v0
                        :not_blocked7
                        const-string v0, "p_vip_expired"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked8
                        const/4 v0, 0x0
                        return v0
                        :not_blocked8
                        const-string v0, "p_intl_vip_expired"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked9
                        const/4 v0, 0x0
                        return v0
                        :not_blocked9
                        const-string v0, "p_prompt_notification_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked10
                        const/4 v0, 0x0
                        return v0
                        :not_blocked10
                        const-string v0, "p_second_prompt_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked11
                        const/4 v0, 0x0
                        return v0
                        :not_blocked11
                        const-string v0, "p_sys_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked12
                        const/4 v0, 0x0
                        return v0
                        :not_blocked12
                        const-string v0, "p_prompt_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked13
                        const/4 v0, 0x0
                        return v0
                        :not_blocked13
                        const-string v0, "p_intl_verify_phone"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked14
                        const/4 v0, 0x0
                        return v0
                        :not_blocked14
                        const-string v0, "p_welcomeback_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked15
                        const/4 v0, 0x0
                        return v0
                        :not_blocked15
                        const-string v0, "p_intl_review_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked16
                        const/4 v0, 0x0
                        return v0
                        :not_blocked16
                        const-string v0, "p_intl_mystery_box_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked17
                        const/4 v0, 0x0
                        return v0
                        :not_blocked17
                        const-string v0, "p_choose_sale"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked18
                        const/4 v0, 0x0
                        return v0
                        :not_blocked18
                        const-string v0, "p_choose_sale_expire"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked19
                        const/4 v0, 0x0
                        return v0
                        :not_blocked19
                        const-string v0, "p_select_upgrade_duration_pop"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked20
                        const/4 v0, 0x0
                        return v0
                        :not_blocked20
                        const-string v0, "p_pu_gift_package"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked21
                        const/4 v0, 0x0
                        return v0
                        :not_blocked21
                        const-string v0, "p_pu_gift_vip"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked22
                        const/4 v0, 0x0
                        return v0
                        :not_blocked22
                        const-string v0, "p_get_svip_freetrial"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked23
                        const/4 v0, 0x0
                        return v0
                        :not_blocked23
                        const-string v0, "p_intl_membership_callback_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked24
                        const/4 v0, 0x0
                        return v0
                        :not_blocked24
                        const-string v0, "p_intl_premium_wallet_purchase_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked25
                        const/4 v0, 0x0
                        return v0
                        :not_blocked25
                        const-string v0, "p_intl_boost_iap_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked26
                        const/4 v0, 0x0
                        return v0
                        :not_blocked26
                        const-string v0, "p_intl_super_like_iap_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked27
                        const/4 v0, 0x0
                        return v0
                        :not_blocked27
                        const-string v0, "p_intl_compliment_iap_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked28
                        const/4 v0, 0x0
                        return v0
                        :not_blocked28
                        const-string v0, "p_intl_instantmatch_iap_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked29
                        const/4 v0, 0x0
                        return v0
                        :not_blocked29
                        const-string v0, "p_intl_compliment_success_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked30
                        const/4 v0, 0x0
                        return v0
                        :not_blocked30
                        const-string v0, "p_intl_ilike_im_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked31
                        const/4 v0, 0x0
                        return v0
                        :not_blocked31
                        const-string v0, "p_intl_ilike_im_overheat_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked32
                        const/4 v0, 0x0
                        return v0
                        :not_blocked32
                        const-string v0, "p_intl_instantmatch_no_ultra_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked33
                        const/4 v0, 0x0
                        return v0
                        :not_blocked33
                        const-string v0, "p_intl_horoscope_match_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked34
                        const/4 v0, 0x0
                        return v0
                        :not_blocked34
                        const-string v0, "p_intl_horoscope_match_self_card"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked35
                        const/4 v0, 0x0
                        return v0
                        :not_blocked35
                        const-string v0, "p_intl_horoscope_match_others_card"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked36
                        const/4 v0, 0x0
                        return v0
                        :not_blocked36
                        const-string v0, "p_intl_horoscope_match_pick_cards"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked37
                        const/4 v0, 0x0
                        return v0
                        :not_blocked37
                        const-string v0, "p_intl_popup_relation_goals"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked38
                        const/4 v0, 0x0
                        return v0
                        :not_blocked38
                        const-string v0, "p_intl_must_verify_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked39
                        const/4 v0, 0x0
                        return v0
                        :not_blocked39
                        const-string v0, "p_intl_antispam_alive_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked40
                        const/4 v0, 0x0
                        return v0
                        :not_blocked40
                        const-string v0, "p_intl_mkt_feature_regular_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked41
                        const/4 v0, 0x0
                        return v0
                        :not_blocked41
                        const-string v0, "p_intl_mkt_time_sticker_choose"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked42
                        const/4 v0, 0x0
                        return v0
                        :not_blocked42
                        const-string v0, "p_intl_mkt_catnmouse_full"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked43
                        const/4 v0, 0x0
                        return v0
                        :not_blocked43
                        const-string v0, "p_intl_mkt_twclub_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked44
                        const/4 v0, 0x0
                        return v0
                        :not_blocked44
                        const-string v0, "p_intl_ai_photo_homepopup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked45
                        const/4 v0, 0x0
                        return v0
                        :not_blocked45
                        const-string v0, "p_intl_ai_photo_self_photo"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked46
                        const/4 v0, 0x0
                        return v0
                        :not_blocked46
                        const-string v0, "p_intl_ai_photo_result"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked47
                        const/4 v0, 0x0
                        return v0
                        :not_blocked47
                        const-string v0, "p_intl_buzz_voice_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked48
                        const/4 v0, 0x0
                        return v0
                        :not_blocked48
                        const-string v0, "p_intl_buzz_video_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked49
                        const/4 v0, 0x0
                        return v0
                        :not_blocked49
                        const-string v0, "p_intl_buzz_memoji_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked50
                        const/4 v0, 0x0
                        return v0
                        :not_blocked50
                        const-string v0, "p_intl_buzz_no_pair_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked51
                        const/4 v0, 0x0
                        return v0
                        :not_blocked51
                        const-string v0, "p_intl_buzz_quit_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked52
                        const/4 v0, 0x0
                        return v0
                        :not_blocked52
                        const-string v0, "p_intl_buzz_superheat_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked53
                        const/4 v0, 0x0
                        return v0
                        :not_blocked53
                        const-string v0, "p_auto_renew_subscriptions_cancel_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked54
                        const/4 v0, 0x0
                        return v0
                        :not_blocked54
                        const-string v0, "p_intl_band_phone_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked55
                        const/4 v0, 0x0
                        return v0
                        :not_blocked55
                    """.trimIndent()
                    method.addInstructions(0, blocklistCheck)
                }
        }

        // Removed: splashProxyActFingerprint patch - too aggressive
        // Patching all public void no-arg methods breaks lifecycle methods (onCreate, onResume, etc.)
        // Phone auth dialogs are already handled by OMS dialog blocklist above

        dialogClasses["gpRateGuide"]?.let { classDef ->
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
    }
}
