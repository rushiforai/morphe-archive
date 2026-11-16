package io.github.jordanwoodson.patches.rumble.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_CHAT
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.compose.constString
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals

// The key Twitch's and Kick's Anonymous chat use, with the same default.
private const val KEY = "chat_anonymous"
private const val SET_HEADER = "Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V"

@Suppress("unused")
val anonymousChatPatch = bytecodePatch(
    name = "Anonymous chat",
    description = "Adds a switch that opens a live stream's chat as a guest, the way Rumble opens it when you're " +
        "signed out, while the rest of the app stays signed in: the chat connection is made without your session " +
        "cookie, so Rumble's chat server doesn't list you among the chat's users. Sending chat messages and Rants " +
        "is disabled while it's on, moderator tools are missing from the chat, and messages that mention you may " +
        "not be highlighted. Rumble can still tell that you are watching: the video page's other requests, such as " +
        "the video's details and the chat's emote list, are still made as you. Applies to " +
        "chats opened afterwards. Starts off. Turn it on in Lurk settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    execute {
        // The chat is one long-lived GET of <chat endpoint>/chat/<video ID>/stream (server-sent events) through
        // HttpURLConnection, and the only thing in it that names the account is the Cookie header, set from the
        // session's cookies right after Accept. The extension sets that header instead, or leaves it out.
        ChatStreamRequestFingerprint.single("live chat stream request").method.apply {
            val code = implementation!!.instructions.toList()
            val name = code.indices.singleOrNull { code[it].constString() == "Cookie" }
                ?: throw PatchException("Rumble: the chat stream no longer sets one Cookie header")
            val set = name + 1
            val call = code[set] as? FiveRegisterInstruction
            if (code[set].opcode != Opcode.INVOKE_VIRTUAL || call == null || call.registerCount != 3 ||
                (code[set] as ReferenceInstruction).reference.toString() != SET_HEADER ||
                call.registerD != (code[name] as OneRegisterInstruction).registerA
            ) {
                throw PatchException("Rumble: unexpected Cookie header call in the chat stream")
            }
            replaceInstruction(
                set,
                invokeStatic(
                    "$RUMBLE_CHAT->streamCookie(Ljava/net/URLConnection;Ljava/lang/String;Ljava/lang/String;)V",
                    call.registerC, call.registerD, call.registerE,
                ),
            )
            Locators.record("rumble.anonymous_chat.stream_request", this)
        }

        // Messages and Rants go out through another request, made with the session: a guest can't send, so
        // the data source answers as it does without a chat API (null), which Rumble shows as a failed send.
        ChatSendFingerprint.single("live chat message send").method.apply {
            requireLocals(1)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $RUMBLE_CHAT->sendBlocked()Z
                    move-result v0
                    if-eqz v0, :lurk_send
                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("lurk_send", getInstruction(0)),
            )
            Locators.record("rumble.anonymous_chat.send", this)
        }

        rumbleSettings.add(
            SwitchSetting(
                KEY,
                "Anonymous chat",
                "Read live chat as a guest: the chat connection is made without your session. Sending messages " +
                    "is disabled while this is on. Applies to chats opened afterwards.",
                Section.CHAT,
                default = false,
            ),
        )
    }
}
