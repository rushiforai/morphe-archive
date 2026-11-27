package app.template.patches.zalo

// Smali descriptors of the extension classes (extensions/extension, package app.template.extension.zalo).
// Keep these in sync when an extension class moves.
private const val EXTENSION = "Lapp/template/extension/zalo"

internal const val NEZUMI_SETTINGS = "$EXTENSION/settings/NezumiSettings;"
internal const val CHAT_OPTIONS = "$EXTENSION/chat/ChatOptions;"
internal const val CHAT_HEAD_ACTION = "$EXTENSION/chat/ChatHeadAction;"
internal const val MARK_AS_READ = "$EXTENSION/chat/MarkAsRead;"
internal const val NOTIFICATION_MARK_AS_READ = "$EXTENSION/chat/NotificationMarkAsRead;"
internal const val ONLINE_STATUS = "$EXTENSION/chat/OnlineStatus;"
internal const val RECALLED_MESSAGES = "$EXTENSION/chat/RecalledMessages;"
internal const val EXTERNAL_LINKS = "$EXTENSION/chat/ExternalLinks;"
internal const val MESSAGES_TAB = "$EXTENSION/messages/MessagesTab;"
internal const val OFFICIAL_ACCOUNTS = "$EXTENSION/messages/OfficialAccounts;"
internal const val FEED_ADS = "$EXTENSION/feed/FeedAds;"
internal const val DISCOVERY_TAB = "$EXTENSION/navigation/DiscoveryTab;"
internal const val CUSTOM_FONT = "$EXTENSION/appearance/CustomFont;"
internal const val AMOLED_THEME = "$EXTENSION/appearance/AmoledTheme;"
internal const val CUSTOM_SOUNDS = "$EXTENSION/sound/CustomSounds;"
internal const val CALL_RECORDER = "$EXTENSION/call/CallRecorder;"
internal const val CALL_RECORDING_UI = "$EXTENSION/call/CallRecordingUi;"
internal const val SAVE_MEDIA = "$EXTENSION/media/SaveMedia;"
internal const val ZALO_VIDEO_SAVE = "$EXTENSION/media/ZaloVideoSave;"
internal const val POST_VIDEO_SAVE = "$EXTENSION/media/PostVideoSave;"
internal const val LOCAL_QUICK_MESSAGES = "$EXTENSION/quickmessage/LocalQuickMessages;"
internal const val MICROG_SUPPORT = "$EXTENSION/backup/ZaloMicroGSupport;"
internal const val DRIVE_TOKEN_RECOVERY = "$EXTENSION/backup/DriveTokenRecovery;"
internal const val NEZUMI_LOG = "$EXTENSION/buglog/NezumiLog;"
internal const val NEZUMI_LOG_HITS = "$EXTENSION/buglog/Hits;"
internal const val NEZUMI_LOG_PATCH = "$EXTENSION/buglog/Patch;"

/** Descriptor prefix of every extension class; methods under it are Nezumi code, not Zalo code. */
internal const val EXTENSION_DESCRIPTOR_PREFIX = "$EXTENSION/"

/** Class name (not descriptor) used where Android needs a component name, e.g. the manifest. */
internal const val SOUND_PROVIDER_CLASS = "app.template.extension.zalo.sound.SoundProvider"
