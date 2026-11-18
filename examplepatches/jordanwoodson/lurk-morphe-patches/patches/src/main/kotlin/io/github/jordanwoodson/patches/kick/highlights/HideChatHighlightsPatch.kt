package io.github.jordanwoodson.patches.kick.highlights

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.chat.kickChatPagePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesBundle.Constant
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val PINNED_MESSAGES = "hide_pinned_messages"
private const val POLLS = "hide_polls_predictions"
private const val GOALS = "hide_goals"
private const val SUBS = "hide_sub_messages"
private const val HOSTS = "hide_host_messages"
private const val REWARDS = "hide_reward_redemptions"
private const val BANNERS = "hide_banners"
private const val PINNED_KICKS = "hide_pinned_kicks"
private const val CELEBRATIONS = "hide_celebrations"

@Suppress("unused")
val hideChatHighlightsPatch = bytecodePatch(
    name = "Hide chat highlights",
    description = "Hides pinned messages, polls and predictions, goals, sub and gift messages, host messages, " +
        "reward redemptions, event and drops banners, pinned KICKs gifts and celebration prompts, each with its own " +
        "switch. Other chat messages are unchanged. The sub, gift, host and reward lines inside chat are found by " +
        "the class names of Kick's chat web page, which Kick can change at any time; those switches then stop " +
        "hiding the lines until Lurk is updated. Starts off. Turn them on in Lurk settings > Interface." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch, kickChatPagePatch)

    execute {
        // Components above and below chat render nothing. Their parents are ordinary lists and footers, so
        // the space closes up. A hidden poll can't be voted in.
        mapOf(
            "PinnedMessage" to PINNED_MESSAGES,
            "PollFloating" to POLLS,
            "PredictionBannerView" to POLLS,
            "FloatingGoalCard" to GOALS,
            "DropsBanner" to BANNERS,
            "StreamEventBanner" to BANNERS,
        ).forEach { (component, key) -> kickHermes.returnAtEntry(component, key, defaultEnabled = false) }
        kickHermes.returnAtEntry("PinnedKicks", PINNED_KICKS, defaultEnabled = false)
        kickHermes.returnAtEntry("ConsumingCelebration", CELEBRATIONS, defaultEnabled = false)

        // A new subscriber, a gift and a host each queue a timed card in the floating stack above chat. Each of
        // the three anonymous event callbacks schedules one card and returns; they now return first. The chat
        // lines for the same events, and for reward redemptions, are drawn by Kick's chat page, where KickChat's
        // script hides them (kickChatPagePatch).
        kickHermes.skipGuard(
            kickHermes.functionUsing("new subscriber card", reads = listOf("scheduleOnUI", "months"), loads = listOf("sub-")),
            SUBS,
            defaultEnabled = false,
        )
        mapOf("gift-" to SUBS, "host-" to HOSTS).forEach { (prefix, key) ->
            val card = kickHermes.functionUsing("$prefix card", reads = listOf("scheduleOnUI"), loads = listOf(prefix))
            kickHermes.returnAtEntry(card, key, Constant.UNDEFINED, defaultEnabled = false)
        }

        fun switch(key: String, title: String, summary: String) =
            SwitchSetting(key, title, summary, Section.INTERFACE, default = false, restart = true)
        kickSettings.add(
            switch(PINNED_MESSAGES, "Hide pinned messages", "The message pinned above chat."),
            switch(POLLS, "Hide polls and predictions", "Poll and prediction cards above chat. You can't vote in hidden ones."),
            switch(GOALS, "Hide goals", "The channel goal card above chat."),
            switch(SUBS, "Hide sub and gift messages",
                "New subs and gifted subs, in chat and as cards above it."),
            switch(HOSTS, "Hide host messages", "Another channel hosting this one, in chat and as a card above it."),
            switch(REWARDS, "Hide reward redemptions", "Viewers redeeming the channel's rewards, in chat."),
            switch(BANNERS, "Hide event and drops banners", "Drops campaign and event banners on the stream screen."),
            switch(PINNED_KICKS, "Hide pinned KICKs", "KICKs gifts pinned above chat."),
            switch(CELEBRATIONS, "Hide celebration prompts", "The celebration button in the chat footer."),
        )
    }
}
