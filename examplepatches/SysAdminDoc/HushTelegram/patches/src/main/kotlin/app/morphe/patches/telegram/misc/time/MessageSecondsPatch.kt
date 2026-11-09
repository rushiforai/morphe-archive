/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.time

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val MESSAGE_TIME = "$EXTENSION_PACKAGE/misc/MessageTime;"
internal const val MESSAGE_TIME_SHOWN = "$MESSAGE_TIME->shown(Ljava/lang/Object;J)Ljava/lang/String;"
internal const val FAST_DATE_FORMAT = "Lorg/telegram/messenger/time/FastDateFormat;"
internal const val TIME_FORMAT = "$FAST_DATE_FORMAT->format(J)Ljava/lang/String;"
internal const val FORMATTER_DAY = "Lorg/telegram/messenger/LocaleController;->getFormatterDay()$FAST_DATE_FORMAT"
internal const val EDITED_MESSAGE = "Lorg/telegram/messenger/R\$string;->EditedMessage:I"
private const val MESSAGE_OBJECT_TYPE = "Lorg/telegram/messenger/MessageObject;"
private const val STRING = "Ljava/lang/String;"

/**
 * Sends the bubble's times through the extension. Keep deleted messages marks its label on the same
 * calls, so it carries this along when Message times with seconds is left out, and the seconds switch
 * stays hidden then (#49).
 */
internal val messageTimePatch = bytecodePatch {
    dependsOn(telegramExtensionPatch)

    execute {
        val (method, indices) = resolveMessageTime()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        replaceTimeCalls(MutableMethod(ImmutableMethod.of(method)), indices)
        writeStub(MESSAGE_TIME, "stockFormat", 3, """
            check-cast p0, $FAST_DATE_FORMAT
            invoke-virtual {p0, p1, p2}, $TIME_FORMAT
            move-result-object p0
            return-object p0
        """)
        replaceTimeCalls(method, indices)
    }
}

@Suppress("unused")
val messageSecondsPatch = bytecodePatch(
    name = "Message times with seconds",
    description = "Shows seconds in each message's time, like 9:41:27 PM, so messages sent close together are easy to " +
        "tell apart. Starts off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch, messageTimePatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        requireStatusMethod("messageSeconds")
        enableStatus("messageSeconds")
    }
}

/** The formatter and the moment go to the extension instead, in the same registers. */
internal fun replaceTimeCalls(target: MutableMethod, indices: List<Int>) {
    for (index in indices) {
        val call = target.getInstruction(index)
        val registers = call.namedRegisters()
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $MESSAGE_TIME_SHOWN"
        } else {
            "invoke-static {${registers.joinToString { "v$it" }}}, $MESSAGE_TIME_SHOWN"
        })
    }
}

/**
 * Where a message bubble formats its time: the one method that takes a message, writes "edited"
 * before an edited message's time, and formats each time through [formats] with Telegram's time of
 * day formatter. Up to 13.1 that's the bubble's measuring itself, `(MessageObject)V`; 13.2 moved it
 * into a static helper of the bubble's, `(MessageObject, MessageObject, boolean, int)String`, which
 * the measuring and a message preview elsewhere both call.
 *
 * @return the owner's source name and the method
 */
internal fun BytecodePatchContext.timeFormatting(formats: String): Pair<String, MutableMethod> {
    val found = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.allReferences(listOf(EDITED_MESSAGE, FORMATTER_DAY, formats))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { method ->
            if (MESSAGE_OBJECT_TYPE in method.origParameterTypes && (method.origReturnType == "V" || method.origReturnType == STRING)) {
                val refs = method.controlBody().mapNotNull { it.controlRef() }.toSet()
                if (EDITED_MESSAGE in refs && FORMATTER_DAY in refs && formats in refs) found += cls.origType to method
            }
        }
    }
    val (type, method) = found.controlSingle("message time measuring")
    return type to tgMutableClassDefBy(type).methods.single { it.name == method.name && it.returnType == method.returnType &&
        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString) }
}

/** The bubble's time formatting, and each call of the formatter in it. */
internal fun BytecodePatchContext.resolveMessageTime(): Pair<MutableMethod, List<Int>> {
    controlHook(MESSAGE_TIME, "shown", listOf("Ljava/lang/Object;", "J"), "Ljava/lang/String;")
    controlHook(MESSAGE_TIME, "stockFormat", listOf("Ljava/lang/Object;", "J"), "Ljava/lang/String;")
    controlShape(tgClassDefByOrNull(FAST_DATE_FORMAT)?.methods?.any { "$FAST_DATE_FORMAT->${it.origName}(J)${it.origReturnType}" == TIME_FORMAT &&
        it.origParameterTypes == listOf("J") && AccessFlags.PUBLIC.isSet(it.accessFlags) } == true, "Telegram's time formatter changed")
    val method = timeFormatting(TIME_FORMAT).second
    val body = method.controlBody()
    val indices = body.indices.filter { body[it].controlRef() == TIME_FORMAT }
    controlShape(indices.all { body[it].opcode == Opcode.INVOKE_VIRTUAL || body[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE },
        "the message bubble formats its time in an unexpected way")
    return method to indices
}
