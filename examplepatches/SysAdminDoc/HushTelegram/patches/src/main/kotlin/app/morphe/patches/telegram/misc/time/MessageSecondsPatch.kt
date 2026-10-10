/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.time

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val MESSAGE_TIME = "$EXTENSION_PACKAGE/misc/MessageTime;"
internal const val MESSAGE_TIME_SHOWN = "$MESSAGE_TIME->shown(Ljava/lang/Object;J)Ljava/lang/String;"
internal const val FAST_DATE_FORMAT = "Lorg/telegram/messenger/time/FastDateFormat;"
internal const val TIME_FORMAT = "$FAST_DATE_FORMAT->format(J)Ljava/lang/String;"
internal const val FORMATTER_DAY = "Lorg/telegram/messenger/LocaleController;->getFormatterDay()$FAST_DATE_FORMAT"
internal const val EDITED_MESSAGE = "Lorg/telegram/messenger/R\$string;->EditedMessage:I"

@Suppress("unused")
val messageSecondsPatch = bytecodePatch(
    name = "Message times with seconds",
    description = "Shows seconds in each message's time, like 9:41:27 PM, so messages sent close together are easy to " +
        "tell apart. Starts off. Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val (method, indices) = resolveMessageSeconds()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        replaceTimeCalls(MutableMethod(ImmutableMethod.of(method)), indices)
        writeStub(MESSAGE_TIME, "stockFormat", 3, """
            check-cast p0, $FAST_DATE_FORMAT
            invoke-virtual {p0, p1, p2}, $TIME_FORMAT
            move-result-object p0
            return-object p0
        """)
        replaceTimeCalls(method, indices)
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
 * A message bubble measures its time in one method that takes the message, writes "edited" before an
 * edited message's time, and formats each time with Telegram's time of day formatter.
 */
internal fun BytecodePatchContext.resolveMessageSeconds(): Pair<MutableMethod, List<Int>> {
    requireStatusMethod("messageSeconds")
    controlHook(MESSAGE_TIME, "shown", listOf("Ljava/lang/Object;", "J"), "Ljava/lang/String;")
    controlHook(MESSAGE_TIME, "stockFormat", listOf("Ljava/lang/Object;", "J"), "Ljava/lang/String;")
    controlShape(classDefByOrNull(FAST_DATE_FORMAT)?.methods?.any { "$FAST_DATE_FORMAT->${it.name}(J)${it.returnType}" == TIME_FORMAT &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) } == true, "Telegram's time formatter changed")

    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            if (method.parameterTypes.map(CharSequence::toString) == listOf("Lorg/telegram/messenger/MessageObject;") && method.returnType == "V" &&
                !AccessFlags.STATIC.isSet(method.accessFlags)) {
                val refs = method.controlBody().mapNotNull { it.controlRef() }.toSet()
                if (EDITED_MESSAGE in refs && FORMATTER_DAY in refs && TIME_FORMAT in refs) found += cls.type to method.name
            }
        }
    }
    val (type, name) = found.controlSingle("message time measuring")
    val method = mutableClassDefBy(type).methods.single { it.name == name && it.parameterTypes.size == 1 &&
        it.parameterTypes[0].toString() == "Lorg/telegram/messenger/MessageObject;" && it.returnType == "V" }
    val body = method.controlBody()
    val indices = body.indices.filter { body[it].controlRef() == TIME_FORMAT }
    controlShape(indices.all { body[it].opcode == Opcode.INVOKE_VIRTUAL || body[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE },
        "the message bubble formats its time in an unexpected way")
    return method to indices
}
