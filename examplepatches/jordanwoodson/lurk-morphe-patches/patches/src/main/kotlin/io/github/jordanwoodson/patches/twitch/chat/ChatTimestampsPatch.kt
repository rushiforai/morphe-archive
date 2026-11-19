package io.github.jordanwoodson.patches.twitch.chat

import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

@Suppress("unused")
val chatTimestampsPatch = bytecodePatch(
    name = "Chat timestamps",
    description = "Shows the time each live chat message was sent in front of it, the way Twitch already shows " +
        "it on chat history, in 24-hour or 12-hour format. Whispers are unchanged.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchRNChatPatch, twitchSettingsPatch)
    execute {
        showTimeOnLiveMessages()
        timeOwnMessages()
        chooseTimeFormat()
        twitchSettings.add(
            SwitchSetting("chat_timestamps", "Chat timestamps", "The time in front of each chat message.", Section.CHAT),
            // Read only while the switch is on: the same formatter draws Twitch's own history timestamps,
            // which keep their stock clock with the switch off.
            ChoiceSetting("chat_timestamp_format", "Chat timestamps clock", "", Section.CHAT, "0",
                listOf("24-hour (13:05)" to "0", "12-hour (1:05)" to "1"), restart = true, parent = "chat_timestamps"),
        )
    }
}

/**
 * Chat history passes true for "show the time" and live messages pass false. Ask the extension, with the
 * line's click configuration, whose source enum tells channel chat from whispers.
 */
private fun BytecodePatchContext.showTimeOnLiveMessages() {
    val method = ChatLineItemFingerprint.twitchMatch("chat line item").method
    if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("Twitch: unexpected chat line item")
    val config = classDefBy(method.parameterTypes[2].toString())
    val sources = config.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) &&
            classDefByOrNull(field.type)?.let { AccessFlags.ENUM.isSet(it.accessFlags) } == true
    }
    val source = sources.singleOrNull()?.let { classDefBy(it.type) }
    if (source == null || source.fields.none { it.name == "Chat" } || source.fields.none { it.name == "Whisper" }) {
        throw PatchException("Twitch: chat line configuration has no unique message source")
    }
    Locators.record("twitch.chat_timestamps.line_config", config.type)
    Locators.record("twitch.chat_timestamps.message_source", source.type)
    // p3 (configuration) and p4 (show the time) are adjacent parameters. p4 is only passed on to the line's
    // span builder, so replacing it at the start changes nothing else.
    method.addInstructions(0, """
        invoke-static/range { p3 .. p4 }, $CHAT->timestamps(Ljava/lang/Object;Z)Z
        move-result p4
    """)
}

/**
 * A message you send shows at once from a copy Twitch builds as an IRC line, without the server's tmi-sent-ts
 * tag, so it had no time to show (issue 79). The send time goes to the event's constructor; the extension fills
 * it in when it is missing.
 */
private fun BytecodePatchContext.timeOwnMessages() {
    val method = IrcMessageTagsFingerprint.twitchMatch("IRC message tags").method
    val event = method.returnType
    val instructions = method.instructionList()
    val create = instructions.indices.singleOrNull { index ->
        instructions[index].opcode == Opcode.INVOKE_DIRECT_RANGE && instructions[index].methodRef?.let {
            it.definingClass == event && it.name == "<init>" && it.parameterTypes.getOrNull(2)?.toString() == "Ljava/lang/Long;"
        } == true
    } ?: throw PatchException("Twitch: IRC message event isn't made once with a send time")
    // Range registers: the event, then its parameters; the send time is the third.
    val register = (instructions[create] as RegisterRangeInstruction).startRegister + 3
    if (register > 255) throw PatchException("Twitch: IRC message send time register is too large")
    method.requireNotBranchTarget(create, "IRC message event")
    Locators.record("twitch.chat_timestamps.irc_event", event)
    method.addInstructions(create, """
        invoke-static/range { v$register .. v$register }, $CHAT->sentTime(Ljava/lang/Long;)Ljava/lang/Long;
        move-result-object v$register
    """)
}

/** The chat line formatter's "H:mm" pattern, made once with the formatter. */
private fun BytecodePatchContext.chooseTimeFormat() {
    val method = ChatLineFormatterFingerprint.twitchMatch("chat time formatter").method
    val instructions = method.instructionList()
    val pattern = instructions.indices.single { instructions[it].stringRef == "H:mm" }
    val register = (instructions[pattern] as OneRegisterInstruction).registerA
    val init = instructions[pattern + 1].methodRef
    if (instructions[pattern + 1].opcode != Opcode.INVOKE_DIRECT || init?.definingClass != "Ljava/text/SimpleDateFormat;" ||
        register > 255) throw PatchException("Twitch: unexpected chat time formatter")
    method.requireNotBranchTarget(pattern + 1, "chat time formatter")
    method.addInstructions(pattern + 1, """
        invoke-static/range { v$register .. v$register }, $CHAT->timestampPattern(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$register
    """)
}
