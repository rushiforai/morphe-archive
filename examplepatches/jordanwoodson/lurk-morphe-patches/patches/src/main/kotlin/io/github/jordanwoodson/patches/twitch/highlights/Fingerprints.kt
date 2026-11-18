package io.github.jordanwoodson.patches.twitch.highlights

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// Top-of-chat highlights (Hype Train, gift banners, polls, raids...): one presenter receives every
// producer's Add/Update/Remove event through a single dispatch method.
internal object HighlightPresenterFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(string("processStateUpdate(Ltv/twitch/android/shared/community/highlights/CommunityHighlightPresenter\$State;Ltv/twitch/android/shared/community/highlights/CommunityHighlightPresenter\$UpdateEvent;)Ltv/twitch/android/core/mvp/presenter/StateAndAction;")),
)

internal object AddHighlightFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("AddCommunityHighlight(model="),
)

// A highlight type; its parent class holds the type's tracking id ("hype_train", "gift_sub", ...).
internal object HypeTrainHighlightTypeFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("HypeTrain(isGoldenKappaTrain="),
)

// Turns each chat notice event (USERNOTICE) into a chat line, or null for none. Its test notice names the
// "qa_partner" channel; the debug menu that also sends goal notices to it doesn't read gift months.
internal object ChatNoticeLineFingerprint : Fingerprint(
    parameters = listOf("L", "L"),
    strings = listOf("msg-param-goal-target-contributions", "msg-param-goal-contribution-type",
        "msg-param-gift-months", "qa_partner"),
)

internal object SubscriptionNoticeEventFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("SubscriptionNoticeEvent(channelId="),
)

internal object SubscriptionNoticeFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ChatSubscriptionNotice(userMessage="),
)

internal object GiftSubMatchNoticeEventFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("GiftSubMatchNoticeEvent(channelId="),
)

internal object RewardGiftNoticeEventFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("RewardGiftNoticeEvent(channelId="),
)

internal object ViewerMilestoneNoticeEventFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ViewerMilestoneNoticeEvent(channelId="),
)

internal object LeaderboardSettingsFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ChannelLeaderboardSettings(defaultLeaderboard=", ", isCheerEnabled=",
        ", isGiftSubEnabled=", ", isClipEnabled="),
)

internal object PaidPinnedChatLoadedFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("Loaded(isVisible=", ", uiModelList=", ", cheermotesHelper="),
)

internal object PrivateCalloutModelFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("PrivateCalloutsCommonModel(id=", ", type="),
)

internal object PrivateCalloutReceivedFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("PrivateCalloutReceived(privateCalloutsCommonModel="),
)

internal object CelebrationEnableEventFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("EnableEvent(shouldEnable=", ", shouldUpdateState="),
)
