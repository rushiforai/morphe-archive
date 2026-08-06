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

private const val RETURN_LONG_MAX = """
    const-wide v0, 0x7fffffffffffffffL
    return-wide v0
"""

private const val CHAT_PARTNER_CONFIG_NULL_CHECK_BODY = """
    if-eqz p0, :cpc_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->messageLimit:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->perday:I
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->enable:Z
    :cpc_skip
"""

private const val ODIAMOND_VISITOR_CONFIG_NULL_CHECK_BODY = """
    if-eqz p0, :odvmgc_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondVisitorMessageGuideConfig;->total_limit_daily:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondVisitorMessageGuideConfig;->user_limit_daily:I
    :odvmgc_skip
"""

private const val PROLOGUE_CONFIG_NULL_CHECK_BODY = """
    if-eqz p0, :pc_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->enter_conv_limit:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->untalked_daily_show_count:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->unreply_daily_show_count:I
    :pc_skip
"""

private const val LIVE_CHAT_LIMIT_NULL_CHECK_BODY = """
    if-eqz p0, :lcl_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveChatLimit;->total:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveChatLimit;->remaining:I
    :lcl_skip
"""

private const val LOVE_BUZZ_DATA_NULL_CHECK_BODY = """
    if-eqz p0, :lbd_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z
    :lbd_skip
"""

private const val COUNTER_SECRET_CRUSH_LIMIT_NULL_CHECK_BODY = """
    if-eqz p0, :cscl_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->remaining:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->total:I
    :cscl_skip
"""

private const val BOOST_LIMIT_NULL_CHECK_BODY = """
    if-eqz p0, :bl_skip
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/BoostLimit;->remaining:I
    const v0, 0xf423f
    iput v0, p0, Lcom/p1/mobile/putong/data/BoostLimit;->total:I
    :bl_skip
"""

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
    description = "Removes message limits, unlimited pin chat, voice/video calls, quick chat, typing indicator, free gifts, letter, greeting, ice breaker, read receipts, AI translation, message recall, group chat, live chat, message filter, chat partner config, ODiamond visitor config, prologue config, love buzz data, secret crush limit, boost limit",
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

        h6wClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "a" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Ljava/lang/String;" &&
                        method.returnType == "Z"
                }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
        }

        jlm0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "j0" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        eii0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "j0" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        q1l0ClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "j0" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        dgyClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name == "j0" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V"
                }
                .forEach { it.addInstructions(0, RETURN_VOID) }
        }

        fczClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(RECALL_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(RECALL_CONFIG_CLASS, "minutes") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_1440) }
        }

        classDefByOrNull(GROUP_CREATION_LIMIT_CLASS)?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(GROUP_CREATION_LIMIT_CLASS, "groupRemaining") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_999) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(GROUP_CREATION_LIMIT_CLASS, "memberLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_500) }
        }

        classDefByOrNull(LIVE_CHAT_LIMIT_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(LIVE_CHAT_LIMIT_CLASS, "remaining") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(MESSAGE_FILTER_CONFIG_CLASS)?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "convUnreadLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "redDotLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson") &&
                        method.accessesField(MESSAGE_FILTER_CONFIG_CLASS, "shownDayLimit") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(MSG_ICEBREAK_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(MSG_ICEBREAK_CONFIG_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(MSG_ICEBREAK_CONFIG_V2_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(MSG_ICEBREAK_CONFIG_V2_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(GREETING_PERMISSION_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(GREETING_PERMISSION_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(GREETING_PERMISSION_FEED_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(GREETING_PERMISSION_FEED_CLASS, "enable") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(CHAT_ROUNDS_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(CHAT_ROUNDS_CONFIG_CLASS, "enabled") &&
                        method.returnType == "Z" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull(QUICK_CHAT_LOFT_CONFIG_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(QUICK_CHAT_LOFT_CONFIG_CLASS, "online_count_max") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_9999) }
        }

        classDefByOrNull(CONTINUOUS_CHAT_CLASS)?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "days") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_999) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "lastTime") &&
                        method.returnType == "J" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_LONG_MAX) }
            mutableClass.methods
                .filter { method ->
                    method.name !in setOf("<init>", "<clinit>", "hashCode", "equals", "clone", "toString", "nullCheck", "getClassParseName", "toJson", "mo225055clone") &&
                        method.accessesField(CONTINUOUS_CHAT_CLASS, "todayMM") &&
                        method.returnType == "I" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_INT_999) }
        }

        // NOTE: nullCheck() methods are empty no-ops in the original APK - no patching needed
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

private val h6wClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            name = "remainingVoiceBuzz",
        ),
        string("voiceBuzz"),
        string("videoBuzz"),
        string("memojiBuzz"),
    ),
)

private val jlm0ClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            name = "remainingVoiceBuzz",
        ),
        methodCall(name = "getNOT_LIMIT_VALUE"),
    ),
)

private val eii0ClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            name = "remainingTextBuzz",
        ),
        methodCall(name = "getNOT_LIMIT_VALUE"),
    ),
)

private val q1l0ClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            name = "remainingVideoBuzz",
        ),
        methodCall(name = "getNOT_LIMIT_VALUE"),
    ),
)

private val dgyClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            name = "remainingMemojiBuzz",
        ),
        methodCall(name = "getNOT_LIMIT_VALUE"),
    ),
)

private val fczClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/KeepConnection;",
            name = "chatTypingOpen",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/KeepConnection;",
            name = "chatTypingInterval",
        ),
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
