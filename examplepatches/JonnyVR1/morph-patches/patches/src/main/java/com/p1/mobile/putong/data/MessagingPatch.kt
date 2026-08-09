package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_VOID = "return-void"

private const val RETURN_INTEGER_9 = """
    const/16 v0, 0x9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

private const val RETURN_INT_1440 = """
    const/16 v0, 0x5a0
    return v0
"""

private const val RETURN_INT_999 = """
    const/16 v0, 0x3e7
    return v0
"""

private const val RETURN_INT_500 = """
    const/16 v0, 0x1f4
    return v0
"""

private const val RETURN_INT_9999 = """
    const/16 v0, 0x270f
    return v0
"""

private const val RETURN_INT_5 = """
    const/4 v0, 0x5
    return v0
"""

private const val RETURN_INT_10 = """
    const/16 v0, 0xa
    return v0
"""

private const val RETURN_LONG_MAX = """
    const-wide v0, 0x7fffffffffffffffL
    return-wide v0
"""

private const val RETURN_DOUBLE_MAX = """
    const-wide v0, 0x7fefffffffffffffL
    return-wide v0
"""

private const val RETURN_INT_99999 = """
    const v0, 0x1869f
    return v0
"""

private val EXCLUDED_METHODS = setOf(
    "<init>", "<clinit>", "hashCode", "equals", "clone",
    "toString", "nullCheck", "getClassParseName", "toJson"
)

private val EXCLUDED_METHODS_EXTENDED = EXCLUDED_METHODS + "mo225055clone"

private const val FREE_GIFT_INFO_CLASS = "Lcom/p1/mobile/putong/core/data/FreeGiftInfo;"
private const val MESSAGE_CLASS = "Lcom/p1/mobile/putong/core/data/Message;"
private const val MESSAGE_SETTING_CLASS = "Lcom/p1/mobile/putong/core/data/MessageSetting;"

private const val READ_RECEIPTS_CLASS = "Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;"
private const val AI_TRANSLATE_CLASS = "Lcom/p1/mobile/putong/core/api/CoreAITranslate;"
private const val RECALL_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/RecallConfig;"
private const val GROUP_CREATION_LIMIT_CLASS = "Lcom/p1/mobile/putong/core/data/GroupCreationLimit;"
private const val LIVE_CHAT_LIMIT_CLASS = "Lcom/p1/mobile/putong/data/LiveChatLimit;"
private const val MESSAGE_FILTER_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/MessageFilterConfig;"
private const val MSG_ICEBREAK_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;"
private const val MSG_ICEBREAK_CONFIG_V2_CLASS = "Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;"
private const val GREETING_PERMISSION_CLASS = "Lcom/p1/mobile/putong/core/data/GreetingPermission;"
private const val GREETING_PERMISSION_FEED_CLASS = "Lcom/p1/mobile/putong/feed/data/GreetingPermission;"
private const val CHAT_ROUNDS_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;"
private const val QUICK_CHAT_LOFT_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/QuickChatLoftConfig;"
private const val CONTINUOUS_CHAT_CLASS = "Lcom/p1/mobile/putong/core/data/ContinuousChat;"
private const val ODIAMOND_VISITOR_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/ODiamondVisitorMessageGuideConfig;"
private const val PROLOGUE_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/PrologueConfig;"
private const val MESSAGE_TAB_REVISION_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;"
private const val COLLAPSIBLE_CONVERSATION_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;"
private const val CHAT_HELPER_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/ChatHelperConfig;"
private const val CALL_RECORD_CLASS = "Lcom/p1/mobile/putong/core/data/CallRecord;"
private const val CONVERSATION_REFRESH_INTERVAL_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;"
private const val HEARTBEAT_MATCH_DATA_CLASS = "Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;"
private const val MESSAGE_INTEGRATION_CLASS = "Lcom/p1/mobile/putong/core/data/MessageIntegration;"
private const val ASSISTANT_MESSAGE_CLEAR_CLASS = "Lcom/p1/mobile/putong/core/data/AssistantMessageClear;"
private const val LOVE_BUZZ_DATA_CLASS = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;"
private const val ICEBREAK_DLG_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;"
private const val CONTINUES_OP_CONV_CONFIG_CLASS = "Lcom/p1/mobile/putong/core/data/ContinuesOpConvConfig;"

private val instructionCache = java.util.WeakHashMap<com.android.tools.smali.dexlib2.iface.Method, List<Instruction>>()

private fun com.android.tools.smali.dexlib2.iface.Method.cachedInstructions(): List<Instruction> =
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

@Suppress("unused")
@JvmField
val messagingPatch = bytecodePatch(
    name = "Messaging Enhancement",
    description = "Removes message limits, unlimited pin chat, voice/video calls, quick chat, typing indicator, free gifts, letter, greeting, ice breaker, read receipts, AI translation, message recall, group chat, live chat, message filter, chat partner config, ODiamond visitor config, prologue config, love buzz data, secret crush limit, boost limit, message tab revision, collapsible conversation, chat helper AI, call duration, conversation refresh interval, heartbeat match, message integration, assistant message clear, ice break dialog config, continues op conv config",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull(FREE_GIFT_INFO_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    (method.name == "hasRemaining" || method.name == "inDuration") &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z"
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(MESSAGE_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.accessesField(MESSAGE_SETTING_CLASS, "anonymous") &&
                        (method.returnType == "Ljava/lang/Boolean;" || method.returnType == "Z") &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        j15ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "g" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/ChatPartnerScene;" &&
                        method.returnType == "Z" &&
                        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                        AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
        }

        rd6ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "X" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/Conversation;" &&
                        method.returnType == "Z"
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        val loveBuzzDataClasses = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { classDef ->
            val hasLoveBuzzField = classDef.fields.any { field ->
                field.definingClass == "Lcom/p1/mobile/putong/core/data/LoveBuzzData;" &&
                    field.name in setOf("remainingVoiceBuzz", "remainingTextBuzz", "remainingVideoBuzz", "remainingMemojiBuzz")
            }
            if (hasLoveBuzzField) {
                loveBuzzDataClasses.add(classDef)
            }
        }

        loveBuzzDataClasses.forEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                when {
                    method.name == "a" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Z" -> method.addInstructions(0, RETURN_FALSE)
                    method.name == "j0" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        typingIndicatorClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "X2" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        swh0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                when {
                    method.name == "G" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z" -> method.addInstructions(0, RETURN_TRUE)
                    method.name == "x" &&
                        method.parameterTypes.size == 1 &&
                        method.returnType == "Z" -> method.addInstructions(0, RETURN_TRUE)
                }
            }
        }

        oxeClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "g" &&
                        method.parameterTypes.size == 1 &&
                        method.returnType == "Ljava/lang/Integer;"
                }
                .forEach { it.addInstructions(0, RETURN_INTEGER_9) }
        }

        chatGameInfoClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.accessesField("Lcom/p1/mobile/putong/core/data/ChatGameInfo;", "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        jailedGroupChatClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.accessesField("Lcom/p1/mobile/putong/data/JailedGroupChat;", "active") &&
                        method.accessesField("Lcom/p1/mobile/putong/data/JailedGroupChat;", "expireTime") &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        classDefByOrNull(READ_RECEIPTS_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "X" &&
                        method.parameterTypes.size == 1 &&
                        method.returnType == "V" &&
                        AccessFlags.PRIVATE.isSet(method.accessFlags)
                }
                .forEach {
                    it.addInstructions(0, """
                        invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->Y()V
                        return-void
                    """)
                }
        }

        classDefByOrNull(AI_TRANSLATE_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "p3" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z"
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(RECALL_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(RECALL_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(RECALL_CONFIG_CLASS, "minutes") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_1440)
                }
            }
        }

        classDefByOrNull(GROUP_CREATION_LIMIT_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(GROUP_CREATION_LIMIT_CLASS, "groupRemaining") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(GROUP_CREATION_LIMIT_CLASS, "memberLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_500)
                }
            }
        }

        classDefByOrNull(LIVE_CHAT_LIMIT_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(LIVE_CHAT_LIMIT_CLASS, "remaining") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(MESSAGE_FILTER_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "convUnreadLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "redDotLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "shownDayLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(MSG_ICEBREAK_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(MSG_ICEBREAK_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(MSG_ICEBREAK_CONFIG_V2_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(MSG_ICEBREAK_CONFIG_V2_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(GREETING_PERMISSION_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(GREETING_PERMISSION_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(GREETING_PERMISSION_FEED_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(GREETING_PERMISSION_FEED_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(CHAT_ROUNDS_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(CHAT_ROUNDS_CONFIG_CLASS, "enabled") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(QUICK_CHAT_LOFT_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(QUICK_CHAT_LOFT_CONFIG_CLASS, "online_count_max") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(CONTINUOUS_CHAT_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "days") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_999)

                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "lastTime") &&
                        method.returnType == "J" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_LONG_MAX)

                    method.name !in EXCLUDED_METHODS_EXTENDED &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "todayMM") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_999)
                }
            }
        }

        classDefByOrNull(ODIAMOND_VISITOR_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(ODIAMOND_VISITOR_CONFIG_CLASS, "total_limit_daily") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(ODIAMOND_VISITOR_CONFIG_CLASS, "user_limit_daily") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(PROLOGUE_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(PROLOGUE_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(PROLOGUE_CONFIG_CLASS, "enter_conv_limit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(PROLOGUE_CONFIG_CLASS, "untalked_daily_show_count") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(PROLOGUE_CONFIG_CLASS, "unreply_daily_show_count") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(MESSAGE_TAB_REVISION_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_TAB_REVISION_CONFIG_CLASS, "enabled") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_TAB_REVISION_CONFIG_CLASS, "new_tag_show_max_time") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_TAB_REVISION_CONFIG_CLASS, "new_tag_exposure_after_max_time") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_TAB_REVISION_CONFIG_CLASS, "click_chat_tab_interval_time") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_TAB_REVISION_CONFIG_CLASS, "new_tag_exposure_after_max_minutes") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "enabled") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "ignore_old_unread_msg") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "ignorable_unread_msg_days") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "ignore_msg_days") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "ignore_tip_expose_threshold") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(COLLAPSIBLE_CONVERSATION_CONFIG_CLASS, "last_conversation_not_participating") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(CHAT_HELPER_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CHAT_HELPER_CONFIG_CLASS, "female_chat_assistant_enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CHAT_HELPER_CONFIG_CLASS, "female_chat_assistant_profile_dlg_close_max") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(CALL_RECORD_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CALL_RECORD_CLASS, "duration") &&
                        method.returnType == "J" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_LONG_MAX) }
        }

        classDefByOrNull(CONVERSATION_REFRESH_INTERVAL_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONVERSATION_REFRESH_INTERVAL_CONFIG_CLASS, "conversationRefreshObsInterval") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_5)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONVERSATION_REFRESH_INTERVAL_CONFIG_CLASS, "conversationListRefreshInterval") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_10)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONVERSATION_REFRESH_INTERVAL_CONFIG_CLASS, "monitorEnable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)
                }
            }
        }

        classDefByOrNull(HEARTBEAT_MATCH_DATA_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(HEARTBEAT_MATCH_DATA_CLASS, "remaining") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(HEARTBEAT_MATCH_DATA_CLASS, "expiredTime") &&
                        method.returnType == "D" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_DOUBLE_MAX)
                }
            }
        }

        classDefByOrNull(MESSAGE_INTEGRATION_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_INTEGRATION_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(MESSAGE_INTEGRATION_CLASS, "limit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)
                }
            }
        }

        classDefByOrNull(ASSISTANT_MESSAGE_CLEAR_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(ASSISTANT_MESSAGE_CLEAR_CLASS, "enabled") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_FALSE)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(ASSISTANT_MESSAGE_CLEAR_CLASS, "limit_days") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_99999)
                }
            }
        }

        classDefByOrNull(LOVE_BUZZ_DATA_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(LOVE_BUZZ_DATA_CLASS, "remainingProlongCount") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(ICEBREAK_DLG_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(ICEBREAK_DLG_CONFIG_CLASS, "maxNum") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(CONTINUES_OP_CONV_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONTINUES_OP_CONV_CONFIG_CLASS, "max_count") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONTINUES_OP_CONV_CONFIG_CLASS, "branch_size") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_INT_9999)

                    method.name !in EXCLUDED_METHODS &&
                        method.accessesField(CONTINUES_OP_CONV_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_TRUE)
                }
            }
        }
    }
}

private val j15ClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;",
            name = "messageLimit",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;",
            name = "perday",
        ),
    ),
)

private val rd6ClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/PlatinumPinChat;",
            name = "expireTime",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/PlatinumPinChat;",
            name = "pin",
        ),
        methodCall(
            definingClass = "Lcom/p1/mobile/putong/core/data/Conversation;",
            name = "getLevel",
        ),
    ),
)

private val typingIndicatorClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/KeepConnection;",
            name = "chatTypingOpen",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/KeepConnection;",
            name = "chatTypingInterval",
        ),
        methodCall(name = "interval"),
    ),
)

private val swh0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("tantan_coin_intl_letter_confirm_dialog_shown_"),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/Privilege;",
            name = "letter",
        ),
    ),
)

private val oxeClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;",
            name = "iceBreakLastMessageShowCountLimit",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;",
            name = "iceBreakLastMessageShowCountLimit",
        ),
    ),
)

private val chatGameInfoClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/ChatGameInfo;",
            name = "enable",
        ),
        string("chatgameinfo"),
    ),
)

private val jailedGroupChatClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/JailedGroupChat;",
            name = "active",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/JailedGroupChat;",
            name = "expireTime",
        ),
        methodCall(name = "m174454o"),
    ),
)
