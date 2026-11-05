package io.github.jordanwoodson.patches.twitch.badges

import io.github.jordanwoodson.patches.twitch.chat.twitchRNChatPatch

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.emotes.thirdPartyEmotesPatch
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.emotes.chatImageSizePatch
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.chat.ChatLineSenderFingerprint
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val BADGES = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchBadges;"

@Suppress("unused")
val thirdPartyBadgesPatch = bytecodePatch(
    name = "Third-party badges",
    description = "Adds switches that show FrankerFaceZ, Chatterino and 7TV badges and pronouns.alejo.io pronouns " +
        "next to chatters' names in native and React Native chat. Each switch is off until turned on in Lurk settings. " +
        "The FrankerFaceZ and Chatterino switches download that service's public list of all badge holders " +
        "(api.frankerfacez.com, api.chatterino.com) about once an hour and check it on the phone, then load each " +
        "badge's image from the https address the list names (FrankerFaceZ: cdn.frankerfacez.com; Chatterino: " +
        "currently fourtf.com, but any host its list gives). The 7TV switch keeps a connection to 7TV's event " +
        "service (events.7tv.io) while a channel's chat is open, which tells 7TV the channel, as the 7TV emotes " +
        "switch does, and nothing about you or the chatters you see; 7TV sends the badges of that channel's " +
        "chatters and their images come from cdn.7tv.app. The pronouns switch sends the " +
        "username of each chatter whose message you see to pronouns.alejo.io.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    // Third-party emotes' chat-connect hook tells the 7TV badge connection which channel is open.
    dependsOn(twitchRNChatPatch, twitchSettingsPatch, chatImageSizePatch, thirdPartyEmotesPatch)
    execute {
        val spanGroup = SpanGroupFingerprint.twitchMatch("chat line span group").classDef.type
        val user = ChatLineSenderFingerprint.twitchMatch("chat message user").classDef.type
        val badge = BadgeViewModelFingerprint.twitchMatch("badge view model").classDef.type
        val method = ChatLineSpanBuilderFingerprint.twitchMatch("chat line span builder").method
        if (method.returnType != spanGroup || method.parameterTypes[3].toString() != user) {
            throw PatchException("Twitch: chat line span builder changed")
        }
        // The badge list (p2) is read as the badge view models.
        if (method.implementation!!.instructions.none {
                it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == badge
            }) throw PatchException("Twitch: chat line badges aren't $badge")
        method.requireLocals(3)
        // At the start every local is unset, so v0-v2 are free.
        method.addInstructions(0, """
            move-object/from16 v0, p2
            move-object/from16 v1, p3
            const-class v2, $badge
            invoke-static { v0, v1, v2 }, $BADGES->badges(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Class;)Ljava/util/List;
            move-result-object v0
            move-object/from16 p2, v0
        """)
        twitchSettings.add(
            SwitchSetting("badges_ffz", "FrankerFaceZ badges",
                "Shows FrankerFaceZ supporter, developer and bot badges in chat. Downloads FrankerFaceZ's list of " +
                    "badge holders from api.frankerfacez.com and the badge images from cdn.frankerfacez.com.",
                Section.CHAT, default = false),
            SwitchSetting("badges_chatterino", "Chatterino badges",
                "Shows Chatterino supporter and contributor badges in chat. Downloads Chatterino's list of badge " +
                    "holders from api.chatterino.com and the badge images from the https hosts that list names " +
                    "(fourtf.com today).",
                Section.CHAT, default = false),
            SwitchSetting("badges_7tv", "7TV badges",
                "Shows the 7TV badge each chatter chose (subscriber tiers, staff, event badges) in chat. Keeps a " +
                    "connection to events.7tv.io while a channel's chat is open, which tells 7TV the channel; 7TV " +
                    "sends its chatters' badges, and the images load from cdn.7tv.app. No chatter is looked up.",
                Section.CHAT, default = false),
            SwitchSetting("badges_pronouns", "Pronouns",
                "Shows chatters' pronouns from pronouns.alejo.io as a badge. Sends the username of each chatter " +
                    "whose message you see to pronouns.alejo.io (answers are kept for an hour).",
                Section.CHAT, default = false),
        )
    }
}
