package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private fun buildI0Instructions(paramReg: Int): String {
    return """
        move-object v0, v$paramReg

        const-string v1, "chat_newmatch_continue"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_chat_newmatch
        const-string v0, "exp_strategy"
        return-object v0
        :skip_chat_newmatch

        const-string v1, "quick_message"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_quick_message
        const-string v0, "exp"
        return-object v0
        :skip_quick_message

        const-string v1, "batch_icebreak"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_batch_icebreak
        const-string v0, "exp1"
        return-object v0
        :skip_batch_icebreak

        const-string v1, "newuser_icebreak_lead"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_icebreak_lead
        const-string v0, "exp"
        return-object v0
        :skip_icebreak_lead

        const-string v1, "chat_match"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_chat_match
        const-string v0, "with_icebreak_text"
        return-object v0
        :skip_chat_match

        const-string v1, "ChatViewOptimizationAndroid"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_chat_view_opt
        const-string v0, "_exp"
        return-object v0
        :skip_chat_view_opt

        const-string v1, "chat_cell_active"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_chat_cell
        const-string v0, "exp"
        return-object v0
        :skip_chat_cell

        const-string v1, "verified_to_chat"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_verified_chat
        const-string v0, "exp"
        return-object v0
        :skip_verified_chat

        const-string v1, "sticker_show_time"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_sticker
        const-string v0, "exp"
        return-object v0
        :skip_sticker

        const-string v1, "push_largepic"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_push_largepic
        const-string v0, "exp"
        return-object v0
        :skip_push_largepic

        const-string v1, "e_surprisebox"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_surprisebox
        const-string v0, "exp"
        return-object v0
        :skip_surprisebox

        const-string v1, "quickchat_male_ring"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_quickchat_ring
        const-string v0, "exp1"
        return-object v0
        :skip_quickchat_ring

        const-string v1, "anti_harass_customiza_set"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_anti_harass
        const-string v0, "_match_include"
        return-object v0
        :skip_anti_harass

        const-string v1, "REV_tieredmembership"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_tiered
        const-string v0, "exp"
        return-object v0
        :skip_tiered

        const-string v1, "REV_platinum_membership_2"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_plat2
        const-string v0, "exp"
        return-object v0
        :skip_plat2

        const-string v1, "REV_platinum_membership_3"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_plat3
        const-string v0, "exp"
        return-object v0
        :skip_plat3

        const-string v1, "REV_platinium_4"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_plat4
        const-string v0, "exp1"
        return-object v0
        :skip_plat4

        const-string v1, "REV_promo_upgrade1"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_promo
        const-string v0, "exp"
        return-object v0
        :skip_promo

        const-string v1, "friend_active_remind_female"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_friend_remind
        const-string v0, "exp"
        return-object v0
        :skip_friend_remind

        const-string v1, "male_heartbeat_unactive"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_heartbeat
        const-string v0, "exp2"
        return-object v0
        :skip_heartbeat
    """
}

private fun buildJ0Instructions(paramReg: Int): String {
    return """
        move-object v0, v$paramReg

        const-string v1, "intl_instantmatch_open_user"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_instantmatch
        const-string v0, "test"
        return-object v0
        :skip_instantmatch

        const-string v1, "intl_me_tab_revamp"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_me_tab
        const-string v0, "test"
        return-object v0
        :skip_me_tab

        const-string v1, "intl_letterc"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_letter
        const-string v0, "a"
        return-object v0
        :skip_letter

        const-string v1, "intl_consume_iap_large_page"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_iap_page
        const-string v0, "_Test"
        return-object v0
        :skip_iap_page

        const-string v1, "intl_see_card_tag"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :skip_card_tag
        const-string v0, "test2"
        return-object v0
        :skip_card_tag
    """
}

@Suppress("unused")
@JvmField
val abTestOverridePatch = bytecodePatch(
    name = "AB Test Override",
    description = "Overrides A/B test values to enable beneficial features: instant match, quick message, batch icebreak, chat optimization, letter features, me tab revamp, push enhancements, verified chat, tiered membership, platinum membership, surprise box, anti-harass customization",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/api/ABManager;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)

            mutableClassDef.methods
                .filter { method ->
                    method.name == "i0" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Ljava/lang/String;" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                        AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    val registerCount = method.implementation?.registerCount ?: 0
                    if (registerCount >= 3) {
                        val paramReg = registerCount - 1
                        method.addInstructions(0, buildI0Instructions(paramReg))
                    }
                }

            mutableClassDef.methods
                .filter { method ->
                    method.name == "j0" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Ljava/lang/String;" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                        AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    val registerCount = method.implementation?.registerCount ?: 0
                    if (registerCount >= 3) {
                        val paramReg = registerCount - 1
                        method.addInstructions(0, buildJ0Instructions(paramReg))
                    }
                }
        }
    }
}
