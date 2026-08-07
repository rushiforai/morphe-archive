package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

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

        val dialogClasses = mutableMapOf<String, ClassDef>()

        classDefForEach { classDef ->
            if (dialogClasses.size == 6) return@classDefForEach

            var matchedKey: String? = null
            outer@for (method in classDef.methods) {
                if (matchedKey != null) break@outer
                val impl = method.implementation ?: continue
                for (instr in impl.instructions) {
                    if (matchedKey != null) break@outer
                    if (instr is ReferenceInstruction && instr.reference is StringReference) {
                        val s = (instr.reference as StringReference).string
                        matchedKey = when {
                            s == "p_appstore_rating_filter_popup" || s == "showRankGuideDlg" -> "mx0"
                            s == "p_alert_version_upgrade_popup" || s == "updateDlg" -> "zrj0"
                            s == "p_offline_popup" || s == "LikersDialogView" -> "ok3"
                            s == "vip_upgrade_popup" -> "vipUpgradePopup"
                            s == "limitDialogLastShowTime" -> "omsDialogController"
                            s == "p_intl_5star_dialog_view" || s == "rate_popup_last_shown_new" -> "gpRateGuide"
                            else -> null
                        }
                    }
                }
            }

            if (matchedKey != null && matchedKey !in dialogClasses) {
                dialogClasses[matchedKey!!] = classDef
            }
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
                        const-string v0, "p_forbidden_good_to_fake_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked18
                        const/4 v0, 0x0
                        return v0
                        :not_blocked18
                        const-string v0, "p_new_users_see_purchase_guide_see_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked19
                        const/4 v0, 0x0
                        return v0
                        :not_blocked19
                        const-string v0, "p_no_match_see_purchase_guide_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked20
                        const/4 v0, 0x0
                        return v0
                        :not_blocked20
                        const-string v0, "p_quickchat_intropopup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked21
                        const/4 v0, 0x0
                        return v0
                        :not_blocked21
                        const-string v0, "p_vip_expired"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked22
                        const/4 v0, 0x0
                        return v0
                        :not_blocked22
                        const-string v0, "p_intl_vip_expired"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked23
                        const/4 v0, 0x0
                        return v0
                        :not_blocked23
                        const-string v0, "p_pu_gift_package"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked24
                        const/4 v0, 0x0
                        return v0
                        :not_blocked24
                        const-string v0, "p_pu_gift_vip"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked25
                        const/4 v0, 0x0
                        return v0
                        :not_blocked25
                        const-string v0, "p_get_svip_freetrial"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked26
                        const/4 v0, 0x0
                        return v0
                        :not_blocked26
                        const-string v0, "p_user_passive_show_chat"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked27
                        const/4 v0, 0x0
                        return v0
                        :not_blocked27
                        const-string v0, "p_chat_guide_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked28
                        const/4 v0, 0x0
                        return v0
                        :not_blocked28
                        const-string v0, "p_avatarVerification_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked29
                        const/4 v0, 0x0
                        return v0
                        :not_blocked29
                        const-string v0, "p_identityVerification_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked30
                        const/4 v0, 0x0
                        return v0
                        :not_blocked30
                        const-string v0, "p_phoneVerification_popup"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked31
                        const/4 v0, 0x0
                        return v0
                        :not_blocked31
                        const-string v0, "p_second_prompt_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked32
                        const/4 v0, 0x0
                        return v0
                        :not_blocked32
                        const-string v0, "p_sys_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked33
                        const/4 v0, 0x0
                        return v0
                        :not_blocked33
                        const-string v0, "p_prompt_phone_auth_popup_view"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked34
                        const/4 v0, 0x0
                        return v0
                        :not_blocked34
                        const-string v0, "see_bubble_conversation_tab_total_likes"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked35
                        const/4 v0, 0x0
                        return v0
                        :not_blocked35
                        const-string v0, "see_bubble_conversation_tab_new_likes"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked36
                        const/4 v0, 0x0
                        return v0
                        :not_blocked36
                        const-string v0, "see_entrance_conversation_tab_total_likes"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_blocked37
                        const/4 v0, 0x0
                        return v0
                        :not_blocked37
                         const-string v0, "see_entrance_conversation_tab_new_likes"
                         invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                         move-result v0
                         if-eqz v0, :not_blocked38
                         const/4 v0, 0x0
                         return v0
                         :not_blocked38
                         const-string v0, "see_entrance_conversation_tab"
                         invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                         move-result v0
                         if-eqz v0, :not_blocked39
                         const/4 v0, 0x0
                         return v0
                         :not_blocked39
                         const-string v0, "see_entrance_conversation_tab_without_likes"
                         invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                         move-result v0
                         if-eqz v0, :not_blocked40
                         const/4 v0, 0x0
                         return v0
                         :not_blocked40
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
