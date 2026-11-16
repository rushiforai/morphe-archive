package io.github.jordanwoodson.patches.twitch.chat

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.TextSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEYWORDS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchChatKeywords;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val KEY = "chat_keywords"

@Suppress("unused")
val chatKeywordsPatch = bytecodePatch(
    name = "Chat keywords",
    description = "Highlights chat messages that mention you, contain your highlight words or come from users or " +
        "roles you pick with a tinted background, optionally with a vibration, and hides messages with blocked words " +
        "or from blocked users. Mentions are on by default; the word and user lists start empty and are set in Lurk " +
        "settings. Native and React Native live chat and history, plus native VOD chat replay.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchRNChatPatch, twitchSettingsPatch)
    execute {
        markLines()
        filterLiveMessages()
        hookChatRows("$KEYWORDS->bindRow(Landroid/view/View;Landroid/widget/TextView;)V")
        twitchSettings.add(
            SwitchSetting(KEY, "Chat keywords",
                "Highlight and hide chat messages by the words and users below, in live chat, chat history and " +
                    "VOD chat replay. Whole words, any case.",
                Section.CHAT),
            SwitchSetting("chat_highlight_mentions", "Highlight mentions",
                "Tint messages that mention your username. Needs a signed-in account.", Section.CHAT, parent = KEY),
            TextSetting("chat_highlight_words", "Highlight words",
                "Tint messages containing any of these words or phrases, separated by commas.",
                Section.CHAT, parent = KEY),
            TextSetting("chat_highlight_users", "Highlight users",
                "Tint every message from these usernames, separated by commas. Add a color of its own as " +
                    "name=#RRGGBB. Roles by badge: @broadcaster, @mod, @vip, @sub, @founder, @staff, @verified, or " +
                    "any badge ID after @ (native chat; React Native chat matches names only, in the usual tint).",
                Section.CHAT, parent = KEY),
            SwitchSetting("chat_highlight_vibrate", "Vibrate on highlights",
                "Vibrate when a highlighted message arrives in live chat.", Section.CHAT, default = false, parent = KEY),
            TextSetting("chat_blocked_words", "Blocked words",
                "Hide messages containing any of these words or phrases, separated by commas.",
                Section.CHAT, parent = KEY),
            TextSetting("chat_blocked_users", "Blocked users",
                "Hide messages from these usernames (logins, as in twitch.tv/name), separated by commas.",
                Section.CHAT, parent = KEY),
        )
    }
}

/**
 * Every native chat line is built by one method, whether it is shown in live chat, chat history or VOD chat
 * replay. At its start, note the sender and where the line is shown; at its end, mark the sender span with the
 * line's verdict (highlighted or hidden), which the row binders read.
 */
private fun BytecodePatchContext.markLines() {
    val method = chatLineBuilder()
    // Parameter 2 is the sender's badges (view models with the badge set ID as name=), for highlighted roles.
    if (method.parameterTypes[2].toString() != "Ljava/util/List;") throw PatchException("Twitch: the chat line builder's badges moved")
    // At the start every local is unset.
    method.addInstructions(0, """
        move-object/from16 v0, p3
        move-object/from16 v1, p13
        move-object/from16 v2, p2
        invoke-static { v0, v1, v2 }, $KEYWORDS->beginLine(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V
    """)
    val (init, start) = method.spanGroupConstructor()
    val sender = start + 3
    // The sender, inline header and message spans are the constructor's 4th to 6th arguments.
    method.addInstructions(init, """
        invoke-static/range { v$sender .. v${sender + 2} }, $KEYWORDS->markLine($CHAR_SEQUENCE$CHAR_SEQUENCE$CHAR_SEQUENCE)$CHAR_SEQUENCE
        move-result-object v$sender
    """)
}

/**
 * Live messages enter the native chat list through its feeder. At its start, drop a live message that is
 * blocked, before the list (or the chat overlay) sees it, and vibrate for a highlighted one.
 */
private fun BytecodePatchContext.filterLiveMessages() {
    val line = liveChatLine()
    val parent = classDefBy(line.type).superclass ?: throw PatchException("Twitch: live chat message has no parent")
    val feeder = chatListFeederFingerprint(line, parent).twitchMatch("chat list feeder").method
    feeder.requireLocals(4)
    if (!AccessFlags.FINAL.isSet(classDefBy(line.type).accessFlags)) throw PatchException("Twitch: live chat message isn't final")
    // A class comparison rather than instance-of: Chat overlay finds its hook by the feeder's own instance-of.
    feeder.addInstructionsWithLabels(0, """
        move-object/from16 v0, p1
        invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
        move-result-object v1
        const-class v2, ${line.type}
        if-ne v1, v2, :lurk_keep
        check-cast v0, ${line.type}
        iget-object v1, v0, ${line.id}
        iget-object v2, v0, ${line.sender}
        iget-object v3, v0, ${line.badges}
        iget-object v0, v0, ${line.tokens}
        invoke-static { v1, v2, v0, v3 }, $KEYWORDS->onLiveMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)Z
        move-result v0
        if-eqz v0, :lurk_keep
        return-void
    """, ExternalLabel("lurk_keep", feeder.getInstruction(0)))
}
