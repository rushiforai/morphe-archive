package app.hushmessenger.patches.controls

/** Plugin gates checked in both supported 580 APKs. False is the normal disabled path. */
internal data class PluginGate(val anchors: Set<String>, val methods: Set<String>)

internal val pluginGates = mapOf(
    "people" to PluginGate(
        setOf(
            "com.facebook.messaging.friending.plugins.inboxunit.InboxPeopleYouMayKnowSectionKillSwitch",
        ),
        setOf("LX/1pm;->A0C()Z", "LX/2Wl;->A04()Z"),
    ),
    // The same suggestions repeated after the last chat; selected by the people control.
    "people_list_end" to PluginGate(
        setOf(
            "com.facebook.messaging.friending.plugins.inboxthreadlistend.InboxPYMKThreadListEndKillSwitch",
        ),
        setOf("LX/1pm;->A0B()Z", "LX/2Wl;->A03()Z"),
    ),
    "friend_requests" to PluginGate(
        setOf(
            "com.facebook.messaging.friending.plugins.friendrequestinboxunit.FriendingFriendrequestinboxunitKillSwitch",
        ),
        setOf("LX/1pm;->A09()Z", "LX/2Wl;->A02()Z"),
    ),
    "growth" to PluginGate(
        setOf(
            "com.facebook.messaging.friending.plugins.growthpromotioninboxunit.FriendingGrowthpromotioninboxunitKillSwitch",
        ),
        setOf("LX/1pm;->A0A()Z", "LX/2GE;->A0A(LX/2GE;)Z"),
    ),
    "moments" to PluginGate(
        setOf(
            "com.facebook.messaging.navigation.plugins.momentsfolder.NavigationMomentsfolderKillSwitch",
        ),
        setOf("LX/HFe;->A05()Z", "LX/Jiu;->A05()Z"),
    ),
    "ai_stickers" to PluginGate(
        setOf(
            "com.facebook.stickers.keyboardls.generatedtab.plugins.core.KeyboardlsGeneratedtabCoreKillSwitch",
            "com.facebook.messaging.suggestedkeyboard.plugins.core.composer.rows.genai.GenAiSearchSuggestedRow",
        ),
        setOf("LX/PKW;->A03(LX/PKW;)Z", "LX/PKz;->A07(LX/PKz;)Z"),
    ),
    "avatar_stickers" to PluginGate(
        setOf(
            "com.facebook.stickers.keyboardls.avatartab.plugins.core.KeyboardlsAvatartabCoreKillSwitch",
        ),
        setOf("LX/PKW;->A01(LX/PKW;)Z"),
    ),
    "inbox_promotions" to PluginGate(
        setOf(
            "com.facebook.messaging.quickpromotion.plugins.threadlist.QuickpromotionThreadlistKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadlistmsys.QuickpromotionThreadlistmsysKillSwitch",
        ),
        setOf("LX/2Ef;->A0J()Z", "LX/2Ef;->A0K()Z"),
    ),
    "chat_promotions" to PluginGate(
        setOf(
            "com.facebook.messaging.quickpromotion.plugins.threadview.QuickpromotionThreadviewKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadviewmsys.QuickpromotionThreadviewmsysKillSwitch",
        ),
        setOf("LX/ThP;->A0D()Z", "LX/ThP;->A0E()Z"),
    ),
    "suggested_replies" to PluginGate(
        setOf(
            "com.facebook.messaging.business.plugins.suggestedreply.SuggestedReplyKillSwitch",
        ),
        setOf("LX/7Sd;->A06(LX/7Sd;)Z", "LX/7Tb;->A05(LX/7Tb;)Z", "LX/ThO;->A05()Z"),
    ),
    "business_suggestions" to PluginGate(
        setOf(
            "com.facebook.messaging.business.plugins.suggestasyoutype.SAYTKillSwitch",
        ),
        setOf("LX/7Sd;->A05(LX/7Sd;)Z", "LX/7Tb;->A04(LX/7Tb;)Z", "LX/ThO;->A04()Z"),
    ),
    "event_prompts" to PluginGate(
        setOf(
            "com.facebook.messaging.events.plugins.qp.EventsQpKillSwitch",
        ),
        setOf("LX/ThP;->A07()Z", "LX/ThP;->A08()Z"),
    ),
    "reels_badge" to PluginGate(
        setOf(
            "com.facebook.messaging.reels.plugins.badge.ReelsBadgeKillSwitch",
        ),
        setOf("LX/7xF;->A09(LX/7xF;)Z"),
    ),
    "ai_toolbar" to PluginGate(
        setOf(
            "com.facebook.messaging.inbox.tab.plugins.core.tabtoolbarbutton.aihomebutton.AiHomeButtonKillSwitch",
        ),
        setOf("LX/2aP;->A04()Z"),
    ),
    // The Meta AI bottom tab. Its kill switch also gates the tab's own toolbar buttons, so the
    // anchor is the tab content, which only the bottom bar's gate builds.
    "ai_tab" to PluginGate(
        setOf(
            "com.facebook.messaging.aibot.plugins.tab.tabcontent.MetaAiTabContentImplementation",
        ),
        setOf("LX/1iN;->A02(LX/1iN;)Z"),
    ),
)
