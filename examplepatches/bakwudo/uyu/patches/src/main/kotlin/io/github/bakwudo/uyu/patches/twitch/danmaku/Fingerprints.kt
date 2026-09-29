package io.github.bakwudo.uyu.patches.twitch.danmaku

import app.morphe.patcher.Fingerprint

/**
 * MessagesReceivedEvent(channelId, messages, fromHistory). The chat connection creates one for
 * every batch of chat messages it receives, whether or not the chat is shown.
 */
internal object MessagesReceivedEventToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("MessagesReceivedEvent(channelId="),
)

/** ChatLiveMessage(messageId, messageInfo): one received chat message. */
internal object ChatLiveMessageToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("ChatLiveMessage(messageId="),
)

/** ChatMessageInfo: sender, flags, timestamp, and the message text as a list of tokens. */
internal object ChatMessageInfoToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("ChatMessageInfo(userInfo="),
)

/**
 * The Twitch emote token of ChatMessageInfo. Its superclass is the base class of all its tokens.
 * The other token classes have the same toString texts as tokens elsewhere in the app, so they
 * are told apart by that superclass.
 */
internal object EmoteTokenToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("EmoteToken(text="),
)

/**
 * Constructor of the live theatre's view delegate, which creates the player, its controls and
 * the chat containers. The class is found by the Kotlin property metadata of its PlayerMode
 * observer.
 */
internal object TheatreViewDelegateConstructorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("getPlayerModeAnimationsControlObserver()"),
    ),
    name = "<init>",
)

/**
 * The player presenter's update of the playback state it shows (playing, paused, stopped,
 * error). It checks errors for "widevine". The presenter is found by the Kotlin property
 * metadata of its player state subscription.
 */
internal object PlayerStateUpdateFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("getPlayerStateAndEventDisposable()"),
    ),
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("widevine"),
)

/**
 * Constructor of Twitch's theatre preferences, which include the landscape chat mode. Their
 * superclass reads every string preference.
 */
internal object TheatrePreferencesConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/app/Application;"),
    strings = listOf("pref_landscape_chat_mode"),
)

/** State of the player's bottom controls, which include the chat mode button. */
internal object BottomControlsStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(", nextLandscapeChatMode="),
)

/** The theatre's chat view model: the landscape chat mode and what else opens the chat. */
internal object TheatreChatViewModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("TheatreChatViewModel(landscapeChatModePreference="),
)
