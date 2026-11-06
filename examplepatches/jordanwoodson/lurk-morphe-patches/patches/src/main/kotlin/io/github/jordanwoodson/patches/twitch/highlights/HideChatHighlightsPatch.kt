package io.github.jordanwoodson.patches.twitch.highlights

import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.tipping.filterUiFlag

internal const val HIGHLIGHTS_CLASS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchHighlights;"

private const val HYPE_TRAIN = "hide_hype_train"
private const val LEADERBOARDS = "hide_leaderboards"
private const val SUB_NOTICES = "hide_sub_notices"
private const val PINNED_CHEERS = "hide_pinned_cheers"
private const val WATCH_STREAKS = "hide_watch_streaks"
private const val CELEBRATIONS = "hide_celebrations"

@Suppress("unused")
val hideChatHighlightsPatch = bytecodePatch(
    name = "Hide chat highlights",
    description = "Hides the Hype Train, Bits and gift leaderboards, other viewers' sub and gift messages and " +
        "gift banners, pinned cheers and watch-streak pop-ups, each with its own switch. Celebrations can be " +
        "hidden too. Other chat messages are unchanged.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        hideHighlightTypes()
        hideChatNotices()
        listOf(", isCheerEnabled=", ", isGiftSubEnabled=", ", isClipEnabled=").forEach {
            filterUiFlag(LeaderboardSettingsFingerprint, it, "$HIGHLIGHTS_CLASS->leaderboardEnabled(Z)Z")
        }
        filterUiFlag(PaidPinnedChatLoadedFingerprint, "Loaded(isVisible=", "$HIGHLIGHTS_CLASS->pinnedCheersVisible(Z)Z")
        hidePrivateCallouts()
        filterUiFlag(CelebrationEnableEventFingerprint, "EnableEvent(shouldEnable=", "$HIGHLIGHTS_CLASS->celebrationsEnabled(Z)Z")
        filterUiFlag(CelebrationEnableEventFingerprint, ", shouldUpdateState=", "$HIGHLIGHTS_CLASS->celebrationsUpdate(Z)Z")
        twitchHermes.hideChatHighlights()

        twitchSettings.add(
            SwitchSetting(HYPE_TRAIN, "Hide Hype Train",
                "The Hype Train banner above chat and on the player, and its reward pop-ups.",
                Section.INTERFACE, restart = true),
            SwitchSetting(LEADERBOARDS, "Hide leaderboards",
                "The Bits, gift and clip leaderboards above chat.", Section.INTERFACE, restart = true),
            SwitchSetting(SUB_NOTICES, "Hide sub and gift messages",
                "Other viewers' subscription, resub and gifted-sub messages in chat (including the text they " +
                    "add to a resub), and gift banners above chat.", Section.INTERFACE, restart = true),
            SwitchSetting(PINNED_CHEERS, "Hide pinned cheers",
                "Paid messages pinned above chat.", Section.INTERFACE, restart = true),
            SwitchSetting(WATCH_STREAKS, "Hide watch streaks",
                "Watch-streak pop-ups and other viewers' watch-streak messages in chat.",
                Section.INTERFACE, restart = true),
            SwitchSetting(CELEBRATIONS, "Hide celebrations",
                "Full-screen celebration animations over the video.", Section.INTERFACE, default = false),
        )
    }
}

private fun instanceFields(type: ClassDef) = type.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }

private fun Field.reference() = "$definingClass->$name:$type"

/** Native top-of-chat highlights: drop Add events whose type is hidden, before the presenter sees them. */
private fun BytecodePatchContext.hideHighlightTypes() {
    val presenter = HighlightPresenterFingerprint.twitchMatch("community highlight presenter").classDef
    val add = AddHighlightFingerprint.twitchMatch("community highlight Add event").classDef
    val event = add.superclass ?: throw PatchException("Twitch: highlight Add event has no parent")
    val model = instanceFields(add).singleOrNull() ?: throw PatchException("Twitch: unexpected highlight Add event")
    val typeBase = HypeTrainHighlightTypeFingerprint.twitchMatch("Hype Train highlight type").classDef.superclass
        ?: throw PatchException("Twitch: Hype Train highlight type has no parent")
    val typeField = instanceFields(classDefBy(model.type)).singleOrNull { it.type == typeBase }
        ?: throw PatchException("Twitch: highlight model has no unique type")
    val id = instanceFields(classDefBy(typeBase)).singleOrNull { it.type == "Ljava/lang/String;" }
        ?: throw PatchException("Twitch: highlight type has no unique id")
    val dispatch = mutableClassDefBy(presenter.type).methods.singleOrNull { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map { it.toString() } == listOf(event)
    } ?: throw PatchException("Twitch: no unique highlight dispatch")
    Locators.record("twitch.hide_chat_highlights.dispatch", dispatch)
    Locators.record("twitch.hide_chat_highlights.highlight_model", model.reference())
    Locators.record("twitch.hide_chat_highlights.highlight_type", typeField.reference())
    Locators.record("twitch.hide_chat_highlights.highlight_id", id.reference())
    dispatch.requireLocals(2)
    dispatch.addInstructionsWithLabels(0, """
        move-object/from16 v0, p1
        instance-of v1, v0, ${add.type}
        if-eqz v1, :lurk_keep
        check-cast v0, ${add.type}
        iget-object v0, v0, ${model.reference()}
        iget-object v0, v0, ${typeField.reference()}
        iget-object v0, v0, ${id.reference()}
        invoke-static { v0 }, $HIGHLIGHTS_CLASS->hideHighlight(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :lurk_keep
        return-void
    """, ExternalLabel("lurk_keep", dispatch.getInstruction(0)))
}

/** Native chat lines for sub, gift and watch-streak notices: the mapper returns null for "no line". */
private fun BytecodePatchContext.hideChatNotices() {
    val mapper = ChatNoticeLineFingerprint.twitchMatch("chat notice line mapper").method
    val subscription = SubscriptionNoticeEventFingerprint.twitchMatch("subscription notice event").classDef
    val notice = SubscriptionNoticeFingerprint.twitchMatch("subscription notice").classDef
    val giftMatch = GiftSubMatchNoticeEventFingerprint.twitchMatch("gift match notice event").classDef.type
    val rewardGift = RewardGiftNoticeEventFingerprint.twitchMatch("reward gift notice event").classDef.type
    val milestone = ViewerMilestoneNoticeEventFingerprint.twitchMatch("viewer milestone notice event").classDef.type
    val events = listOf(subscription.type, giftMatch, rewardGift, milestone)
    val parent = classDefBy(subscription.type).superclass
    if (events.any { classDefBy(it).superclass != parent } || mapper.parameterTypes.first().toString() != parent) {
        throw PatchException("Twitch: chat notice events don't share the mapper's parameter type")
    }
    val noticeField = instanceFields(subscription).singleOrNull { it.type == notice.type }
        ?: throw PatchException("Twitch: subscription notice event has no unique notice")
    // The notice kind: the enum with Sub, Resub, SubGift, SubMassGift...
    val kind = instanceFields(notice).singleOrNull { field ->
        classDefByOrNull(field.type)?.let { type ->
            AccessFlags.ENUM.isSet(type.accessFlags) && type.fields.any { it.name == "SubMassGift" }
        } == true
    } ?: throw PatchException("Twitch: subscription notice has no unique kind")
    mapper.requireLocals(2)
    mapper.addInstructionsWithLabels(0, """
        move-object/from16 v0, p1
        instance-of v1, v0, ${subscription.type}
        if-eqz v1, :lurk_not_subscription
        check-cast v0, ${subscription.type}
        iget-object v0, v0, ${noticeField.reference()}
        iget-object v0, v0, ${kind.reference()}
        invoke-static { v0 }, $HIGHLIGHTS_CLASS->hideSubscriptionNotice(Ljava/lang/Enum;)Z
        move-result v1
        if-eqz v1, :lurk_keep
        goto :lurk_drop
        :lurk_not_subscription
        instance-of v1, v0, $giftMatch
        if-nez v1, :lurk_gift
        instance-of v1, v0, $rewardGift
        if-eqz v1, :lurk_not_gift
        :lurk_gift
        invoke-static { }, $HIGHLIGHTS_CLASS->hideGiftNotice()Z
        move-result v1
        if-eqz v1, :lurk_keep
        goto :lurk_drop
        :lurk_not_gift
        instance-of v1, v0, $milestone
        if-eqz v1, :lurk_keep
        invoke-static { }, $HIGHLIGHTS_CLASS->hideWatchStreakNotice()Z
        move-result v1
        if-eqz v1, :lurk_keep
        :lurk_drop
        const/4 v0, 0x0
        return-object v0
    """, ExternalLabel("lurk_keep", mapper.getInstruction(0)))
}

/**
 * Private pop-ups (watch streak reached, Hype Train rewards) all reach their presenter through one
 * lambda case: cast the model, then queue a PrivateCalloutReceived event. Skip that for hidden types.
 */
private fun BytecodePatchContext.hidePrivateCallouts() {
    val model = PrivateCalloutModelFingerprint.twitchMatch("private callout model").classDef
    val received = PrivateCalloutReceivedFingerprint.twitchMatch("private callout received event").classDef.type
    val typeField = instanceFields(model).singleOrNull { field ->
        classDefByOrNull(field.type)?.fields?.any { it.name == "WATCH_STREAK_REACHED" } == true
    } ?: throw PatchException("Twitch: private callout model has no unique type")
    val sites = mutableListOf<Pair<String, String>>()
    classDefForEach { type ->
        type.methods.filter { method ->
            method.name == "invoke" && method.returnType == "Ljava/lang/Object;" &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == received
                } == true
        }.forEach { sites += type.type to it.name }
    }
    val (owner, name) = sites.singleOrNull() ?: throw PatchException("Twitch: expected one private callout dispatch, found ${sites.size}")
    val method = mutableClassDefBy(owner).methods.single { it.name == name && it.returnType == "Ljava/lang/Object;" }
    val instructions = method.implementation!!.instructions.toList()
    val create = instructions.indices.single {
        instructions[it].opcode == Opcode.NEW_INSTANCE &&
            ((instructions[it] as ReferenceInstruction).reference as TypeReference).type == received
    }
    // check-cast <model>; getClass() null check; then the presenter field read and new-instance.
    val cast = (create - 1 downTo 0).first { instructions[it].opcode == Opcode.CHECK_CAST }
    if (((instructions[cast] as ReferenceInstruction).reference as TypeReference).type != model.type ||
        instructions[cast + 1].opcode != Opcode.INVOKE_VIRTUAL || cast + 3 != create) {
        throw PatchException("Twitch: unexpected private callout dispatch")
    }
    val modelRegister = (instructions[cast] as OneRegisterInstruction).registerA
    val scratch = (instructions[create] as OneRegisterInstruction).registerA
    val read = instructions[cast + 2]
    if (read.opcode != Opcode.IGET_OBJECT || (read as TwoRegisterInstruction).registerA == scratch ||
        read.registerB == scratch) throw PatchException("Twitch: private callout scratch register is in use")
    // The case returns the same Unit it loaded before its switch; reuse it for the early return.
    val returned = (create until instructions.size).first { instructions[it].opcode == Opcode.RETURN_OBJECT }
    val result = (instructions[returned] as OneRegisterInstruction).registerA
    val writes = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction !is FiveRegisterInstruction &&
            (instruction as? OneRegisterInstruction)?.registerA == result &&
            instruction.opcode.setsRegister()
    }
    if (writes.size != 1 || writes.single() >= cast || instructions[writes.single()].opcode != Opcode.SGET_OBJECT ||
        modelRegister > 15 || scratch > 15) {
        throw PatchException("Twitch: private callout result register is not a plain constant")
    }
    method.addInstructionsWithLabels(cast + 2, """
        iget-object v$scratch, v$modelRegister, ${typeField.reference()}
        invoke-static { v$scratch }, $HIGHLIGHTS_CLASS->hideCallout(Ljava/lang/Enum;)Z
        move-result v$scratch
        if-eqz v$scratch, :lurk_keep_callout
        return-object v$result
    """, ExternalLabel("lurk_keep_callout", method.getInstruction(cast + 2)))
}

/** RN Ultralight theatre: services and components return nothing, chat client handlers drop the line. */
internal fun HermesBundle.hideChatHighlights() {
    // Hype Train: the highlight service feeds the top-of-chat banner and the Skyline host; the
    // landscape overlay and the rewards callout are separate.
    listOf("HypeTrainHighlightService", "TheatrePlayerHypeTrain", "useHypeTrainRewardsService").forEach {
        returnNull(it, HYPE_TRAIN)
    }
    returnNull("ChannelLeaderboardStripHost", LEADERBOARDS)
    falseProperty("SkylineLeaderboardTrophy", "hasBoards", LEADERBOARDS)
    listOf("CommunityGiftHighlightService", "MysterySubGiftHighlightService").forEach { returnNull(it, SUB_NOTICES) }
    // LibraryTmiClient's USERNOTICE handlers each emit one chat line and return undefined.
    listOf(
        "onSubscriptionEvent", "onResubscriptionEvent", "onPrimePaidUpgradeEvent", "onExtendSubscriptionEvent",
        "onSubsidizedSubEvent", "onSubscriptionGiftEvent", "onAnonSubscriptionGiftEvent", "onSubMysteryGiftEvent",
        "onAnonSubMysteryGiftEvent", "onSubsidizedSubMysteryGiftEvent", "onGiftPaidUpgradeEvent",
        "onAnonGiftPaidUpgradeEvent", "onPrimeCommunityGiftReceivedEvent", "onGiftSubBaseMatchEvent",
        "onGiftSubBonusMatchSummaryEvent", "onGiftSubBonusMatchIndividualEvent", "onCommunityPayForwardEvent",
        "onStandardPayForwardEvent",
    ).forEach { returnAtEntry(it, SUB_NOTICES, undefined = true) }
    returnNull("PaidPinnedChat", PINNED_CHEERS)
    listOf("useMaintainWatchStreakService", "SkylineWatchStreakMilestoneCallout", "WatchStreakShareComposer").forEach {
        returnNull(it, WATCH_STREAKS)
    }
    returnAtEntry("onViewerMilestoneEvent", WATCH_STREAKS, undefined = true)
}
