package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
@JvmField
val remoteConfigOverridePatch = bytecodePatch(
    name = "Remote Config Override",
    description = "Overrides remote configuration values: removes quick chat limits, disables text buzz auto-delete",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/remote_config/RemoteConfig;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)

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
                        const-string v0, "showQuickChatCardSwipedCount"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_matched
                        const v0, 0x270f
                        return v0
                        :not_matched
                        move v0, v2
                        return v0
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
                        const-string v0, "intl_text_buzz_auto_delete_interval"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :not_matched
                        const-wide/16 v0, 0x0
                        return-wide v0
                        :not_matched
                        return-wide v2
                    """)
                }
        }
    }
}
