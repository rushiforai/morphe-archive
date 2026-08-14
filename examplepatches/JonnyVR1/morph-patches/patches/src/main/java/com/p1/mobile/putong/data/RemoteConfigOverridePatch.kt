package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
@JvmField
val remoteConfigOverridePatch = bytecodePatch(
    name = "Remote Config Override",
    description = "Overrides remote configuration values: disables popup scheduling, prevents aggressive token expiry, removes quick chat limits, disables text buzz auto-delete",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/remote_config/RemoteConfig;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)

            mutableClassDef.methods
                .filter { method ->
                    method.name == "F" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Ljava/lang/String;" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    method.addInstructions(0, """
                        const-string v2, "popup_schedule_config"
                        invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v3
                        if-eqz v3, :skip_popup
                        const-string v0, "{}"
                        return-object v0
                        :skip_popup
                        const-string v2, "ttt_tab_bar_bottom_banner"
                        invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v3
                        if-eqz v3, :skip_banner
                        const-string v0, ""
                        return-object v0
                        :skip_banner
                    """)
                }

            mutableClassDef.methods
                .filter { method ->
                    method.name == "s" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Z" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    method.addInstructions(0, """
                        const-string v2, "bad_token_exprie_control"
                        invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v3
                        if-eqz v3, :skip_token
                        const/4 v0, 0x0
                        return v0
                        :skip_token
                    """)
                }

            mutableClassDef.methods
                .filter { method ->
                    method.name == "z" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.parameterTypes[1] == "I" &&
                        method.returnType == "I" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    method.addInstructions(0, """
                        const-string v3, "showQuickChatCardSwipedCount"
                        invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v4
                        if-eqz v4, :skip_quick_chat
                        const v0, 0x270f
                        return v0
                        :skip_quick_chat
                    """)
                }

            mutableClassDef.methods
                .filter { method ->
                    method.name == "B" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.parameterTypes[1] == "J" &&
                        method.returnType == "J" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags)
                }
                .forEach { method ->
                    method.addInstructions(0, """
                        const-string v3, "intl_text_buzz_auto_delete_interval"
                        invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v4
                        if-eqz v4, :skip_buzz
                        const-wide/16 v4, 0x0
                        return-wide v4
                        :skip_buzz
                    """)
                }
        }
    }
}
