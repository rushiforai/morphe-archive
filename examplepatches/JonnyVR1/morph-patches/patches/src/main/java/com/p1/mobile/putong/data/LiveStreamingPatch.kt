package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val RETURN_INTEGER_0 = """
    const/4 v0, 0x0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

private const val RETURN_LONG_0 = """
    const-wide/16 v0, 0x0
    return-wide v0
"""

private const val RETURN_BOOLEAN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_BOOLEAN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_INT_9999 = """
    const v0, 0x270f
    return v0
"""

private const val RETURN_INT_200000 = """
    const v0, 0x30d40
    return v0
"""

private const val RETURN_LONG_999999999 = """
    const-wide/32 v0, 0x3b9ac9ff
    return-wide v0
"""

private const val RETURN_LONG_MAX = """
    const-wide v0, 0x7fffffffffffffffL
    return-wide v0
"""

private const val RETURN_FLOAT_0 = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_INT_MAX = """
    const v0, 0x7fffffff
    return v0
"""

private val instructionCache = java.util.WeakHashMap<com.android.tools.smali.dexlib2.iface.Method, List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>>()

private fun com.android.tools.smali.dexlib2.iface.Method.cachedInstructions(): List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> =
    instructionCache.getOrPut(this) {
        implementation?.instructions?.toList() ?: emptyList()
    }

private fun com.android.tools.smali.dexlib2.iface.Method.accessesField(definingClass: String, fieldName: String): Boolean =
    cachedInstructions().any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is FieldReference &&
            (instr.reference as FieldReference).definingClass == definingClass &&
            (instr.reference as FieldReference).name == fieldName
    }

private fun com.android.tools.smali.dexlib2.iface.Method.accessesAnyField(definingClass: String, vararg fieldNames: String): Boolean =
    cachedInstructions().any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is FieldReference &&
            (instr.reference as FieldReference).definingClass == definingClass &&
            (instr.reference as FieldReference).name in fieldNames
    }

@Suppress("unused")
@JvmField
val liveStreamingPatch = bytecodePatch(
    name = "Live Streaming Enhancement",
    description = "Live streaming enhancement: push limit bypass, swipe card unlimited, chat rate limit removal, voice game access, all-day PK battles, gift leaderboard, knight privileges, entrance limits, permission control, daily payment, noble config, stealth privacy, video chat, voice features, monetization, game operations, star toggle, unlimited coins, free gifts, 1080p streaming, treasure box removal, beauty filters unlock",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;", "remaining")
                }
                .forEach { it.addInstructions(0, """
                    const v0, 0x7fffffff
                    return v0
                """) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Ljava/lang/Integer;" &&
                        method.parameterTypes.isEmpty() &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;", "minGrade")
                }
                .forEach { it.addInstructions(0, RETURN_INTEGER_0) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "J" &&
                        method.parameterTypes.isEmpty() &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;", "minSendIntervalMillSeconds", "floodsMinSendIntervalSeconds")
                }
                .forEach { it.addInstructions(0, RETURN_LONG_0) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;", "can")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;", "allDay")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;", "open")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;", "remain")
                }
                .forEach { it.addInstructions(0, """
                    const v0, 0x270f
                    return v0
                """) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;", "maxShow", "maxShowPerDay")
                }
                .forEach { it.addInstructions(0, """
                    const v0, 0x270f
                    return v0
                """) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;", "canUserStartLive", "canStartVoiceLive", "canUseMaskMode")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;", "isDailyLimitOn")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_FALSE) }
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;", "dailyAmount")
                }
                .forEach { it.addInstructions(0, RETURN_INT_200000) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;", "on")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;", "showCountPerDay")
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;", "remaining", "total")
                }
                .forEach { it.addInstructions(0, RETURN_INT_200000) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;", "isOpen")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;", "isOpen")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;", "canEnterTab")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;", "isOpen")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;", "isOpenLiveStatus", "isOpenVoiceLiveStatus")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;", "isOpen", "isShowHeartbeatReward")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "J" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;", "remainingMill")
                }
                .forEach { it.addInstructions(0, RETURN_LONG_999999999) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;", "isHideIntlLiveSquareActivity", "isHideIntlVoiceLiveSquareActivity")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_FALSE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;", "isPaidUser")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesAnyField("Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;", "totalBubbleEveryDayShowMaxCount", "totalBubbleUserShowMaxCount", "totalBubbleUserShowInRoomCount")
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;", "switchStar")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveCoin;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "J" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveCoin;", "available")
                }
                .forEach { it.addInstructions(0, RETURN_LONG_MAX) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "F" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;", "unitPrice")
                }
                .forEach { it.addInstructions(0, RETURN_FLOAT_0) }
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "J" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;", "purchasePrice")
                }
                .forEach { it.addInstructions(0, RETURN_LONG_0) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "I" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.name != "hashCode" &&
                        method.accessesAnyField(
                            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;",
                            "pushWidth", "pushHeight", "pushBitrate", "pushFps",
                            "captureWidth", "captureHeight", "captureFps"
                        )
                }
                .forEach { it.addInstructions(0, RETURN_INT_MAX) }
            mutableClassDef.methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.accessesField("Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;", "downGrade")
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_FALSE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "canShowTreasureBox" &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_FALSE) }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.name != "equals"
                }
                .forEach { it.addInstructions(0, RETURN_BOOLEAN_TRUE) }
        }
    }
}
