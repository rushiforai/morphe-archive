#!/usr/bin/env python3
"""
Porting & verification assistant for upgrading Venus Patches to a new Discord Android release.

Usage:
    python3 scripts/hbc/port_check.py [work/new/assets/index.android.bundle]
    python3 scripts/hbc/port_check.py --map      # rewrite module-map.md from BOOTSTRAP_MODULES

Prints:
1. HbcPrelude.kt & HbcPrivacy.kt bundle constants (ORIGINAL_SHA256, FUNCTION_COUNT, GLOBAL_OFFSET,
   GLOBAL_SIZE, GLOBAL_SHA256, JOIN_ID, EVAL_ID, PROMISE_ID, RESOLVE_ID).
2. Resolution status of all Metro modules hooked or demand-loaded by bootstrap.js (by source path
   and exported identifiers).
3. Resolution status and auto-located candidates for every HbcPrivacy function.
4. Metro module IDs used in bootstrap.js that BOOTSTRAP_MODULES doesn't check yet.

Exits 1 when anything needs attention, so it can gate a port.
"""
import sys, os, hashlib, struct
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from hbc import Bundle, CLOSURES
from privacy_targets import G

BOOTSTRAP_MODULES = [
    (17, None, ['AccessibilityInfo', 'Alert', 'AppRegistry', 'Pressable'], 'React Native'),
    (19, None, ['exports'], 'React'),
    (81, None, ['pickScale', 'setCustomSourceTransformer', 'addCustomSourceTransformer', 'default'], 'resolveAssetSource (Icon packs)'),
    (84, None, ['registerAsset', 'getAssetByID'], 'AssetRegistry (Icon packs)'),
    (120, None, ['enableIntersectionObserverByDefault', 'enableMutationObserverByDefault'], 'RN Environment setup'),
    (328, None, ['displayName', 'getSize', 'prefetch', 'resolveAssetSource', 'default'], 'RN.Image (Icon packs)'),
    (414, None, ['Pressable', 'android_disableSound'], 'Chat Picker Pressable'),
    (510, '../discord_common/js/packages/storage/Storage.tsx', ['Storage'], 'Storage (hasLoaded gate for Account switcher)'),
    (584, None, ['default', 'DispatchBand', 'STORAGE_KEY_LOG_DISPATCHES'], 'Flux Dispatcher instance (578 is only the class)'),
    (587, '../discord_common/js/packages/tokens/native.tsx', ['default', 'Theme', 'RawColor'], 'Theme tokens'),
    (589, '../discord_common/js/packages/tokens/colors/generated/native/generated-definitions.tsx', ['_private', 'SemanticColors'], 'SemanticColors'),
    (590, '../discord_common/js/packages/tokens/colors/generated/native/experiment-definitions.tsx', ['_private', 'SemanticColorExperiments'], 'SemanticColorExperiments (Custom themes: experiment overrides win over SemanticColors)'),
    (591, '../discord_common/js/packages/tokens/colors/generated/raw-color-definitions.tsx', ['_private', 'RawColors'], 'RawColors'),
    (1085, None, ['A11Y_RUNTIME_VIOLATION', 'ACCOUNT_SCHEDULED_FOR_DELETION'], 'Discord Constants'),
    (1096, '../discord_common/js/shared/Constants.tsx', ['PRIMARY_NORMAL', 'PRIMARY_NORMAL_ITALIC', 'PRIMARY_MEDIUM'], 'Permissions constant'),
    (1111, '../discord_common/js/shared/lib/TokenManager.tsx', ['init', 'getAnalyticsToken', 'getToken'], 'TokenManager'),
    (1112, 'modules/routing/router_utils.tsx', ['shouldNavigate', 'transitionTo', 'transitionToGuild'], 'NavigationUtils'),
    (1126, 'intl/index.native.tsx', ['intl', 'getSystemLocale', 'getAvailableLocales'], 'Intl / Locale strings'),
    (1162, '../discord_common/js/packages/rtn-codegen/js/NativeFileModule.tsx', ['default'], 'NativeFileModule'),
    (1203, 'design/void/Button/native/Button.tsx', ['ButtonColors'], 'ButtonColors (red confirm on risky features)'),
    (1205, 'modules/user_settings/ThemeStore.tsx', ['default', 'UNSET', 'SET'], 'ThemeStore'),
    (1264, None, ['murmur', 'noConflict'], 'MurmurHashV3'),
    (1295, '../discord_common/js/packages/http-utils/HTTPUtils.tsx', ['INVALID_FORM_BODY_ERROR_CODE', 'convertSkemaError', 'stringifyErrors'], 'HTTPUtils'),
    (1360, '../discord_common/js/packages/analytics-utils/getSuperProperties.tsx', ['browser_user_agent', 'browser_version', 'os_sdk_version'], 'SuperProperties'),
    (1390, 'stores/UserStore.tsx', ['default', 'users', 'ASSISTANT_WUMPUS_VOICE_USER'], 'UserStore'),
    (1415, 'utils/AvatarUtils.tsx', ['default'], 'AvatarUtils'),
    (1503, 'design/components/Navigator/native/useNavigation.native.tsx', ['useNavigation', 'useNativeStackNavigation', 'useStackNavigation'], 'useStackNavigation'),
    (1999, 'stores/native/AppStateStore.tsx', ['default'], 'AppStateStore'),
    (2065, 'stores/ChannelStore.tsx', ['Basic', 'Full', 'default'], 'ChannelStore'),
    (2087, 'stores/GuildStore.tsx', ['default'], 'GuildStore'),
    (2116, 'stores/SelectedChannelStore.tsx', ['default', 'findFirstVoiceChannelId', 'handleConnectionOpen'], 'SelectedChannelStore (Hidden channels never opens a locked channel by itself)'),
    (2119, 'stores/GuildRoleStore.tsx', ['default', 'getNumRoles'], 'GuildRoleStore'),
    (2125, 'stores/GuildMemberStore.tsx', ['GUILD', 'USER', 'default'], 'GuildMemberStore'),
    (2129, 'modules/user_settings/LocaleStore.tsx', ['default'], 'LocaleStore'),
    (4748, 'stores/GuildChannelStore.tsx', ['default', 'GUILD_SELECTABLE_CHANNELS_KEY', 'GUILD_VOCAL_CHANNELS_KEY'], 'GuildChannelsStore'),
    (4750, 'stores/PermissionStore.tsx', ['default'], 'PermissionStore'),
    (4751, 'modules/lurker_mode/LurkingStore.tsx', ['default'], 'LurkingStore'),
    (4757, 'modules/app_channels/AppChannelPermissions.tsx', ['APP_CHANNEL_MINIMUM_BOT_PERMISSIONS', 'SWAP_APP_CHANNEL_APPLICATION_PERMISSION_LIST', 'SWAP_APP_CHANNEL_APPLICATION_PERMISSIONS'], 'computePermissions'),
    (4760, 'stores/RelationshipStore.tsx', ['default'], 'RelationshipStore'),
    (4769, 'utils/PremiumUtils.tsx', ['BUNDLE', 'TIER_0', 'TIER_1'], 'PremiumUtils'),
    (4809, 'modules/toast/native/ToastActionCreators.tsx', ['default'], 'ToastActionCreators'),
    (4817, 'design/components/Icon/native/BaseIconImage.tsx', ['BaseIconImage'], 'BaseIconImage (Icon packs)'),
    (4831, '../discord_common/js/packages/design/components/ThemeContextProvider/ThemeContext.tsx', ['createThemedContext', 'useThemeContext', 'FALLBACK_THEME_CONTEXT_VALUE'], 'ThemeContext'),
    (4937, 'modules/client_themes/ClientThemesBackgroundStore.tsx', ['default'], 'ClientThemesBackgroundStore (Unlock Nitro themes)'),
    (4976, 'modules/main_tabs_v2/helpers/NavigationRouteUtils.native.tsx', ['navigateToChannel', 'navigateToRootTab', 'pushModal', 'popModal'], 'ModalAPI'),
    (4977, 'modules/main_tabs_v2/RootNavigationRef.native.tsx', ['getRootNavigationRef'], 'RootNavigationRef'),
    (5020, 'stores/GuildMemberCountStore.tsx', ['default', 'getMemberCount', 'getOnlineCount'], 'GuildMemberCountStore'),
    (6623, 'modules/auth/native/components/Login.tsx', ['default', 'LinkButton'], 'Login: Add account screen (Account switcher)'),
    (6868, 'design/components/Icon/native/redesign/generated/CircleCheckIcon.tsx', ['CircleCheckIcon'], 'CircleCheckIcon'),
    (6296, 'design/components/Icon/native/redesign/generated/CircleXIcon.tsx', ['CircleXIcon'], 'CircleXIcon'),
    (5046, 'design/components/Icon/native/redesign/generated/CircleInformationIcon.tsx', ['CircleInformationIcon'], 'CircleInformationIcon'),
    (6770, 'design/components/Icon/native/redesign/generated/EnvelopeIcon.tsx', ['EnvelopeIcon'], 'EnvelopeIcon'),
    (4815, 'design/components/Icon/native/redesign/generated/FriendsIcon.tsx', ['FriendsIcon'], 'FriendsIcon'),
    (5032, 'design/components/Icon/native/redesign/generated/UserPlusIcon.tsx', ['UserPlusIcon'], 'UserPlusIcon'),
    (5038, 'design/components/Icon/native/redesign/generated/LinkIcon.tsx', ['LinkIcon'], 'LinkIcon'),
    (5040, 'design/components/Icon/native/redesign/generated/SendMessageIcon.tsx', ['SendMessageIcon'], 'SendMessageIcon (preview message bar)'),
    (5042, 'design/components/Icon/native/redesign/generated/CopyIcon.tsx', ['CopyIcon'], 'CopyIcon'),
    (5044, 'design/components/Icon/native/redesign/generated/DownloadIcon.tsx', ['DownloadIcon'], 'DownloadIcon'),
    (5049, 'design/components/Icon/native/redesign/generated/TrashIcon.tsx', ['TrashIcon'], 'TrashIcon'),
    (5056, 'modules/action_sheet/native/ActionSheetActionCreators.tsx', ['default', 'ACTION_SHEET_HEIGHT_HALF', 'ACTION_SHEET_HEIGHT_EXPANDED'], 'ActionSheetActionCreators'),
    (5057, 'modules/haptics/HapticUtils.native.tsx', ['HapticFeedbackTypes', 'triggerHapticFeedback'], 'HapticUtils'),
    (5058, 'modules/haptics/HapticFeedbackTypes.tsx', ['IMPACT_LIGHT', 'IMPACT_MEDIUM', 'SELECTION', 'default'], 'HapticFeedbackTypes'),
    (6185, 'design/void/Pressables/native/Pressables.tsx', ['PressableOpacity'], 'PressableOpacity (translate bar, #82)'),
    (5088, 'design/components/Text/native/Text.tsx', ['TextStyleSheet', 'Text', 'Heading'], 'Design Text'),
    (5092, 'design/components/Styles/native/createStyles.tsx', ['experimental_createToken', 'createStyles', 'createLegacyClassComponentStyles'], 'createStyles'),
    (6035, 'stores/ReadStateStore.tsx', ['IS_GUILD_CHANNEL', 'IS_THREAD', 'IS_MENTION_LOW_IMPORTANCE'], 'ReadStateStore'),
    (5112, 'stores/SessionsStore.tsx', ['default'], 'SessionsStore'),
    (5108, 'stores/PresenceStore.tsx', ['default', 'sortActivity'], 'PresenceStore'),
    (5421, 'modules/channel/useChannelName.tsx', ['default', 'computeDefaultGroupDmNameFromUserIds', 'computeDefaultGroupDmName'], 'ChannelNameUtils'),
    (5967, 'modules/read_states/ReadStateConstants.tsx', ['CHANNEL', 'GUILD_EVENT', 'NOTIFICATION_CENTER'], 'ReadStateTypes'),
    (5432, 'stores/MessageStore.tsx', ['default'], 'MessageStore'),
    (5632, 'modules/messages/isMessageMentioned.tsx', ['isRawMessageMentioned', 'isMentioned', 'mention_roles'], 'isMessageMentioned (Message highlights: role mentions)'),
    (5434, 'modules/messages/MessageRecordUtils.tsx', ['createMessageRecord', 'updateServerMessage', 'updateMessageRecord'], 'MessageRecordUtils'),
    (5377, 'design/components/Stack/native/Stack.native.tsx', ['Stack'], 'Stack'),
    (5379, 'design/components/Button/native/Button.native.tsx', ['Button'], 'Button'),
    (5963, 'stores/SortedGuildStore.tsx', ['default', 'GuildsNodeType', 'insertUnsortedGuilds'], 'SortedGuildStore'),
    (5979, '../discord_common/js/shared/shared-constants/AdCreativeType.tsx', ['INVALID', 'QUEST', 'QUEST_HOME_HERO'], 'AdCreativeType'),
    (5987, 'modules/emojis/EmojiStore.tsx', ['Unloaded', 'Loading', 'Loaded'], 'EmojiStore'),
    (5989, 'modules/emojis/RawGuildEmojiStore.tsx', ['default', 'getGuildEmojis'], 'RawGuildEmojiStore'),
    (6030, 'modules/stickers/StickersStore.tsx', ['Unloaded', 'Loaded', 'default'], 'StickersStore'),
    (6031, 'modules/stickers/GuildStickersStore.tsx', ['default', 'getStickersByGuildId'], 'GuildStickersStore'),
    (6098, 'actions/GuildActionCreators.tsx', ['default', 'requestMembersById'], 'GuildActionCreators'),
    (5300, 'actions/native/AlertActionCreators.tsx', ['default'], 'AlertActionCreators'),
    (5412, 'modules/markup/MarkupChannelMentionRule.tsx', ['default', 'getChannel', 'parseChannel'], 'MarkupChannelMentionRule'),
    (7567, 'design/components/Icon/native/redesign/generated/WarningIcon.tsx', ['WarningIcon'], 'WarningIcon (Risky chip)'),
    (8194, 'design/components/Icon/native/redesign/generated/ChatIcon.tsx', ['ChatIcon'], 'ChatIcon'),
    (8196, 'design/components/Icon/native/redesign/generated/ThreadIcon.tsx', ['ThreadIcon'], 'ThreadIcon (preview channel header)'),
    (8201, 'design/components/Icon/native/redesign/generated/TextLockIcon.tsx', ['TextLockIcon'], 'TextLockIcon'),
    (8203, 'design/components/Icon/native/redesign/generated/TextIcon.tsx', ['TextIcon'], 'TextIcon'),
    (8210, 'design/components/Icon/native/redesign/generated/ImageIcon.tsx', ['ImageIcon'], 'ImageIcon'),
    (8212, 'design/components/Icon/native/redesign/generated/GroupIcon.tsx', ['GroupIcon'], 'GroupIcon'),
    (8213, 'design/components/Icon/native/redesign/generated/AtIcon.tsx', ['AtIcon'], 'AtIcon'),
    (8218, 'design/components/Icon/native/redesign/generated/LockIcon.tsx', ['LockIcon'], 'LockIcon'),
    (8229, 'design/components/Icon/native/redesign/generated/AppsIcon.tsx', ['AppsIcon'], 'AppsIcon'),
    (6114, 'design/components/Icon/native/redesign/generated/ClipboardListIcon.tsx', ['ClipboardListIcon'], 'ClipboardListIcon'),
    (6177, 'design/components/TableRow/native/TableCheckboxRow.native.tsx', ['TableCheckboxRow'], 'TableCheckboxRow'),
    (6180, 'design/components/TableRow/native/TableRow.native.tsx', ['Icon', 'Arrow', 'TrailingText'], 'TableRow'),
    (6182, 'design/components/Card/native/Card.native.tsx', ['Card', 'InternalCard'], 'Card'),
    (6188, 'design/components/TableRow/native/TableRowIcon.native.tsx', ['TableRowIcon'], 'TableRowIcon'),
    (6205, 'design/components/Icon/native/redesign/generated/ArrowLargeLeftIcon.tsx', ['ArrowLargeLeftIcon'], 'ArrowLargeLeftIcon (preview channel header)'),
    (6208, 'design/components/Icon/native/redesign/generated/XSmallIcon.tsx', ['XSmallIcon'], 'XSmallIcon'),
    (6262, 'design/components/TableRow/native/TableRadioRow.native.tsx', ['TableRadioRow'], 'TableRadioRow'),
    (6263, 'design/components/TableRow/native/TableRadioGroup.native.tsx', ['TableRadioGroupContext', 'TableRadioGroup'], 'TableRadioGroup'),
    (6265, 'design/components/TableRow/native/TableRowGroup.native.tsx', ['TableRowGroupTitle', 'TableRowGroup'], 'TableRowGroup'),
    (6307, None, ['BottomSheetScrollView', 'BottomSheetFlatList', 'BottomSheetModal'], '@gorhom/bottom-sheet (Server info sheet scrolling)'),
    (6286, 'design/components/TextInput/native/TextInput.native.tsx', ['TextInput'], 'TextInput'),
    (6923, 'stores/views/PrivateChannelSortStore.tsx', ['default'], 'PrivateChannelSortStore (Read all, more than 20 unread DMs)'),
    (6640, 'design/components/Icon/native/redesign/generated/KeyIcon.tsx', ['KeyIcon'], 'KeyIcon'),
    (6642, 'design/components/Icon/native/redesign/generated/MobilePhoneIcon.tsx', ['MobilePhoneIcon'], 'MobilePhoneIcon'),
    (6650, 'design/components/Icon/native/redesign/generated/EyeSlashIcon.tsx', ['EyeSlashIcon'], 'EyeSlashIcon'),
    (6739, 'design/components/TextField/native/SearchField.native.tsx', ['SearchField'], 'SearchField'),
    (6740, 'design/components/Icon/native/redesign/generated/MagnifyingGlassIcon.tsx', ['MagnifyingGlassIcon'], 'MagnifyingGlassIcon'),
    (6800, 'actions/ReadStateActionCreators.tsx', ['ack', 'ackCategory', 'ackChannel'], 'ReadStateActionCreators'),
    (6820, 'modules/emojis/native/Emoji.tsx', ['default'], 'Emoji'),
    (6823, 'design/components/Icon/native/redesign/generated/CheckmarkSmallIcon.tsx', ['CheckmarkSmallIcon'], 'CheckmarkSmallIcon'),
    (6839, 'design/components/Sheet/native/BottomSheetTitleHeader.native.tsx', ['BottomSheetTitleHeader'], 'BottomSheetTitleHeader'),
    (6889, None, ['Clipboard', 'Platform', 'addListener'], 'Clipboard'),
    (6891, 'modules/action_sheet/native/showSimpleActionSheet.tsx', ['showSimpleActionSheet'], 'SimpleActionSheet'),
    (6894, 'design/components/Sheet/native/ActionSheetCloseButton.native.tsx', ['ActionSheetCloseButton'], 'ActionSheetCloseButton'),
    (6896, 'design/components/TableRow/native/TableSwitchRow.native.tsx', ['TableSwitchRow'], 'TableSwitchRow'),
    (6897, 'design/components/Forms/native/FormSwitch.native.tsx', ['FormSwitch'], 'FormSwitch'),
    (6899, 'design/components/Sheet/native/ActionSheet.native.tsx', ['ActionSheet'], 'ActionSheet'),
    (6906, 'design/components/Icon/native/redesign/generated/ChevronSmallRightIcon.tsx', ['ChevronSmallRightIcon'], 'ChevronSmallRightIcon'),
    (7012, 'actions/GuildSubscriptionsActionCreators.tsx', ['subscribeGuild'], 'GuildSubscriptionsActionCreators'),
    (7047, 'modules/stickers/StickerSendability.tsx', ['SENDABLE', 'SENDABLE_WITH_PREMIUM', 'NONSENDABLE'], 'StickerUtils'),
    (7092, 'design/components/Icon/native/redesign/generated/SettingsIcon.tsx', ['SettingsIcon'], 'SettingsIcon'),
    (7094, 'modules/user_settings/core/native/openUserSettings.tsx', ['openUserSettings'], 'UserSettingsActionCreators'),
    (7174, 'actions/MessageActionCreators.tsx', ['default'], 'MessageActionCreators'),
    (6054, 'modules/guild_scheduled_events/GuildScheduledEventStore.tsx', ['default', 'getGuildScheduledEventsForGuild'], 'GuildScheduledEventStore'),
    (7246, 'modules/guild_sidebar/ChannelListState.tsx', ['CannotShow', 'DoNotShow', 'WouldShowIfUncollapsed'], 'useGuildChannelsList'),
    (6078, 'stores/GuildReadStateStore.tsx', ['default'], 'GuildReadStateStore'),
    (7365, 'modules/messages/MessageParser.tsx', ['default', 'parseAndRebuild', 'createParserState'], 'MessageParser'),
    (7371, 'modules/chat/SlowmodeUtils.tsx', ['canBypassSlowmode', 'canBypassSlowmodeHelper', 'useCanBypassSlowmode'], 'SlowmodeUtils'),
    (7382, 'modules/quests/utils/QuestDataUtils.tsx', ['THIRTY_DAYS_MS', 'earnedDecisionIsValid', 'findQuestOrReplacement'], 'QuestDataUtils'),
    (7386, 'modules/quests/QuestStore.tsx', ['default'], 'QuestStore'),
    (7394, 'modules/quests/utils/QuestServerUtils.tsx', ['isQuestWithKnownConfigVersion', 'questConfigFromServer', 'questUserStatusFromServer'], 'questUserStatusFromServer'),
    (7755, 'utils/UploadUtils.tsx', ['MAX_TOTAL_ATTACHMENT_SIZE', 'MAX_TOTAL_ATTACHMENT_SIZE_1GB', 'MAX_TOTAL_ATTACHMENT_SIZE_MB'], 'AttachmentUtils'),
    (9115, 'modules/main_tabs_v2/native/tabs/you/YouBannerDecorations.tsx', ['default'], 'YouBannerDecorations (Hide extra buttons: profile pill)'),
    (9699, 'modules/foreground_service/mobile/ForegroundServiceManager.android.tsx', ['default'], 'ForegroundServiceManager'),
    (7752, 'lib/uploader/CloudUpload.tsx', ['NOT_STARTED', 'STARTED', 'UPLOADING'], 'CloudUpload'),
    (9317, 'design/components/Icon/native/redesign/generated/PhoneCallIcon.tsx', ['PhoneCallIcon'], 'PhoneCallIcon'),
    (9337, 'design/components/Icon/native/redesign/generated/PaperIcon.tsx', ['PaperIcon'], 'PaperIcon'),
    (9354, 'design/components/Icon/native/redesign/generated/ThumbsUpIcon.tsx', ['ThumbsUpIcon'], 'ThumbsUpIcon'),
    (9237, 'design/components/Icon/native/redesign/generated/MoreHorizontalIcon.tsx', ['MoreHorizontalIcon'], 'MoreHorizontalIcon (preview server header)'),
    (7742, 'modules/messages/native/renderer/RowGenerator.tsx', ['default'], 'RowGenerator'),
    (7982, 'modules/double_tap_to_react/native/DoubleTapToReactUtils.tsx', ['getFallbackDoubleTapDisambiguatedEmoji', 'reactionEmojiFromSettingsValue', 'disambiguatedEmojiFromSettingsValue'], 'DoubleTapToReactUtils'),
    (7989, 'modules/replies/canReplyToMessage.tsx', ['useCanReplyToMessage', 'canReplyToMessage'], 'canReplyToMessage'),
    (8299, 'modules/user_profile/native/showUserProfileActionSheet.tsx', ['default', 'showUserProfileActionSheet'], 'showUserProfileActionSheet'),
    (8301, 'actions/UserActionCreators.tsx', ['fetchCurrentUser', 'acceptAgreements', 'setFlag'], 'UserActionCreators'),
    (8396, 'design/components/Icon/native/redesign/generated/PlayIcon.tsx', ['PlayIcon'], 'PlayIcon (preview Watch button)'),
    (8398, 'design/components/Icon/native/redesign/generated/PauseIcon.tsx', ['PauseIcon'], 'PauseIcon (preview player)'),
    (7701, 'design/components/Icon/native/redesign/generated/LinkExternalSmallIcon.tsx', ['LinkExternalSmallIcon'], 'LinkExternalSmallIcon'),
    (9031, 'design/components/Icon/native/redesign/generated/NitroWheelIcon.tsx', ['NitroWheelIcon'], 'NitroWheelIcon'),
    (8956, 'design/components/Icon/native/redesign/generated/ReactionIcon.tsx', ['ReactionIcon'], 'ReactionIcon'),
    (9071, 'design/components/Icon/native/redesign/generated/TagIcon.tsx', ['TagIcon'], 'TagIcon'),
    (9099, 'design/components/Icon/native/redesign/generated/GlobeEarthIcon.tsx', ['GlobeEarthIcon'], 'GlobeEarthIcon'),
    (10022, 'design/components/Icon/native/redesign/generated/PollsIcon.tsx', ['PollsIcon'], 'PollsIcon (Hide extra buttons)'),
    (10028, 'modules/media_keyboard/native/components/MediaKeyboardBottomSheetActions.tsx', ['default'], 'MediaKeyboardBottomSheetActions (Hide extra buttons: attach menu)'),
    (11828, 'design/components/Icon/native/redesign/generated/ShopIcon.tsx', ['ShopIcon'], 'ShopIcon (Hide extra buttons)'),
    (13262, 'design/components/Icon/native/redesign/generated/QuoteIcon.tsx', ['QuoteIcon'], 'QuoteIcon'),
    (10725, 'modules/oauth2/native/OAuth2AuthorizeModal.tsx', ['default'], 'OAuth2AuthorizeModal'),
    (9207, 'design/components/Icon/native/redesign/generated/GameControllerIcon.tsx', ['GameControllerIcon'], 'GameControllerIcon'),
    (9239, 'design/components/Icon/native/redesign/generated/ServerIcon.tsx', ['ServerIcon'], 'ServerIcon'),
    (9255, 'modules/messages/useMessageMaxLength.tsx', ['default', 'getMaxMessageLength'], 'useMessageMaxLength'),
    (9464, 'modules/app_icons/native/AppIconConstants.tsx', ['getDefaultIcon', 'getOfficialAlternateIcons', 'getLimitedAlternateIcons'], 'AppIconConstants'),
    (9401, 'design/components/Icon/native/redesign/generated/UploadIcon.tsx', ['UploadIcon'], 'UploadIcon'),
    (8575, 'design/void/Form/native/index.tsx', ['Form', 'FormArrow', 'FormCheckbox'], 'Form'),
    (10410, 'design/components/Icon/native/redesign/generated/ShieldIcon.tsx', ['ShieldIcon'], 'ShieldIcon'),
    (12901, 'design/components/Icon/native/redesign/generated/ChatSmileIcon.tsx', ['ChatSmileIcon'], 'ChatSmileIcon'),
    (11033, 'lib/pushnotification/PushNotification.tsx', ['default'], 'PushNotification'),
    (9379, 'modules/chat_input/native/useChatBottomManagerUIStore.tsx', ['default', 'updateChatInputContainerHeight', 'updateShowingAutoComplete'], 'ChatInputHeightContext'),
    (8617, 'design/components/Icon/native/redesign/generated/ShieldUserIcon.tsx', ['ShieldUserIcon'], 'ShieldUserIcon'),
    (8768, 'design/components/Icon/native/redesign/generated/BellIcon.tsx', ['BellIcon'], 'BellIcon'),
    (8675, 'design/components/Icon/native/redesign/generated/CalendarIcon.tsx', ['CalendarIcon'], 'CalendarIcon'),
    (8792, 'modules/voice_panel/native/shared/FormComponents.tsx', ['VoicePanelFormSection', 'MemberRowItem'], 'VoiceChannelMembers'),
    (10994, 'design/components/Icon/native/redesign/generated/DoorExitIcon.tsx', ['DoorExitIcon'], 'DoorExitIcon'),
    (11015, 'design/components/Icon/native/redesign/generated/HandRequestSpeakIcon.tsx', ['HandRequestSpeakIcon'], 'HandRequestSpeakIcon (preview Try it button)'),
    (11063, 'design/components/Icon/native/redesign/generated/ImageSparkleIcon.tsx', ['ImageSparkleIcon'], 'ImageSparkleIcon (Icon packs)'),
    (9778, 'modules/premium/components/native/NitroUpsellButton.tsx', ['default'], 'NitroUpsellButton'),
    (11106, 'design/components/Icon/native/redesign/generated/MicrophoneIcon.tsx', ['MicrophoneIcon'], 'MicrophoneIcon (preview message bar)'),
    (11191, 'design/components/ThemeContextProvider/native/RootThemeContextProvider.native.tsx', ['RootThemeContextProvider', 'DisableCustomTheme'], 'RootThemeContextProvider (Custom themes re-keys its memoized context)'),
    (10368, 'modules/chat/native/ChatViewWrapper.tsx', ['default'], 'ChatViewWrapper'),
    (10347, 'design/components/Icon/native/redesign/generated/BellSlashIcon.tsx', ['BellSlashIcon'], 'BellSlashIcon'),
    (9434, 'modules/double_tap_to_react/native/DoubleTapReminderToast.tsx', ['maybeShowDoubleTapReminderToast'], 'DoubleTapReminderToast'),
    (9549, 'design/components/Icon/native/redesign/generated/StarIcon.tsx', ['StarIcon'], 'StarIcon'),
    (9578, 'design/components/Icon/native/redesign/generated/BackspaceIcon.tsx', ['BackspaceIcon'], 'BackspaceIcon'),
    (9167, 'modules/quests/QuestActionCreators.tsx', ['SUCCESS', 'UNKNOWN_ERROR', 'fetchCurrentQuests'], 'QuestActionCreators'),
    (9720, 'design/components/Icon/native/redesign/generated/PencilIcon.tsx', ['PencilIcon'], 'PencilIcon'),
    (9732, 'actions/GIFPickerActionCreators.tsx', ['trackSearchStart', 'trackSearchResultViewed', 'search'], 'GIFPickerActionCreators'),
    (9735, 'modules/gif_picker/native/GIFPickerUtils.tsx', ['GIF_HEADER_HEIGHT', 'useFavoriteGIFsMobile', 'GIF_PICKER_ITEM_ESIMTATED_HEIGHT'], 'useFavoriteGIFsMobile'),
    (10013, 'design/components/Icon/native/redesign/generated/IdIcon.tsx', ['IdIcon'], 'IdIcon'),
    (10024, 'design/components/Icon/native/redesign/generated/AttachmentIcon.tsx', ['AttachmentIcon'], 'AttachmentIcon'),
    (10229, 'modules/main_tabs_v2/native/shared_components/user_list/UserRow.tsx', ['CALL', 'MESSAGE', 'ACCEPT'], 'UserRow'),
    (10262, 'design/components/Icon/native/redesign/generated/CrownIcon.tsx', ['CrownIcon'], 'CrownIcon'),
    (10287, 'design/components/Icon/native/redesign/generated/UserCircleIcon.tsx', ['UserCircleIcon'], 'UserCircleIcon'),
    (10310, 'design/components/Icon/native/redesign/generated/PlusLargeIcon.tsx', ['PlusLargeIcon'], 'PlusLargeIcon (preview message bar)'),
    (10334, 'design/components/Icon/native/redesign/generated/PinIcon.tsx', ['PinIcon'], 'PinIcon (Icon packs preview)'),
    (11540, 'design/components/Icon/native/redesign/generated/GiftIcon.tsx', ['GiftIcon'], 'GiftIcon'),
    (10533, 'modules/user_profile/native/UserProfilePrimaryInfo.tsx', ['default', 'DisplayName', 'UserTagAndPronouns'], 'UserProfileHeaderName'),
    (10534, 'design/components/Icon/native/redesign/generated/ChevronSmallDownIcon.tsx', ['ChevronSmallDownIcon'], 'ChevronSmallDownIcon (preview channel category)'),
    (10615, 'modules/profile_customization/native/BioText.tsx', ['default'], 'UserProfileBio'),
    (12803, None, ['pick', 'saveDocuments', 'keepLocalCopy', 'errorCodes', 'isErrorWithCode', 'types'], 'DocumentPicker (Backup and restore, 1.16.0)'),
    (12822, 'design/components/Icon/native/redesign/generated/KeyboardIcon.tsx', ['KeyboardIcon'], 'KeyboardIcon'),
    (10473, 'design/components/Icon/native/redesign/generated/ArrowLargeUpIcon.tsx', ['ArrowLargeUpIcon'], 'ArrowLargeUpIcon'),
    (10664, 'modules/settings/native/renderer/SettingBuilders.tsx', ['createToggle', 'createStatic', 'createRoute'], 'createSettingsList'),
    (10694, 'modules/messages/native/MessagesHandlers.tsx', ['MessagesHandlers'], 'MessagesHandlers'),
    (10764, 'design/components/Icon/native/redesign/generated/TimerIcon.tsx', ['TimerIcon'], 'TimerIcon'),
    (10771, 'design/components/Icon/native/redesign/generated/VideoIcon.tsx', ['VideoIcon'], 'VideoIcon'),
    (9675, 'modules/messages/native/long_press/LongPressMessageActionSheet.tsx', ['default'], 'LongPressMessageActionSheet'),
    (9685, 'modules/messages/native/long_press/LongPressMessageActionSheetUtils.tsx', ['getContextBarCancelReason', 'handleEdit', 'handleCreateThread'], 'LongPressMessageActionSheetUtils'),
    (10782, 'modules/replies/native/replyToMessage.tsx', ['default'], 'replyToMessage'),
    (12837, 'modules/double_tap_to_react/native/DoubleTapEmojiEditNudge.tsx', ['DoubleTapEmojiEditNudge'], 'DoubleTapEmojiEditNudge'),
    (12627, 'design/components/Icon/native/redesign/generated/RetryIcon.tsx', ['RetryIcon'], 'RetryIcon (preview Start over / New people)'),
    (12838, 'design/components/Icon/native/redesign/generated/ArrowAngleLeftUpIcon.tsx', ['ArrowAngleLeftUpIcon'], 'ArrowAngleLeftUpIcon'),
    (10783, 'modules/messages/canEditMessage.tsx', ['default'], 'canEditMessage'),
    (11382, 'design/components/Icon/native/redesign/generated/UserIcon.tsx', ['UserIcon'], 'UserIcon'),
    (11668, 'actions/TypingActionCreators.tsx', ['default'], 'TypingActionCreators'),
    (11841, 'design/components/Icon/native/redesign/generated/ArrowsUpDownIcon.tsx', ['ArrowsUpDownIcon'], 'ArrowsUpDownIcon'),
    (11935, 'modules/chat_input/native/action_buttons/ChatInputActions.tsx', ['displayName', 'default'], 'ChatInputSendAndGiftButton'),
    (11968, 'components_native/chat/JumpToPresentButton.tsx', ['default'], 'JumpToPresentButton'),
    (11969, 'modules/chat_input/native/ChatFloatingNavButton.tsx', ['default'], 'JumpToPresentPill'),
    (11970, None, ['__packager_asset', 'registerAsset'], 'JumpToPresent arrow asset'),
    (11990, 'modules/double_tap_to_react/native/DoubleTapToReactChatInputBanner.tsx', ['DoubleTapToReactChatInputBanner'], 'DoubleTapToReactChatInputBanner'),
    (12129, 'modules/multi_account/MultiAccountStore.tsx', ['INVALID', 'VALIDATING', 'VALID'], 'MultiAccountStore'),
    (12130, 'modules/multi_account/Constants.tsx', ['YOU_ACCOUNT_ACTION_SHEET', 'CHOOSE_ACCOUNT', 'MANAGE_ACCOUNTS_MODAL'], 'MultiAccountConstants'),
    (12131, 'modules/user/isStaffFromRawUser.tsx', ['default'], 'isStaffFromRawUser'),
    (12133, 'modules/multi_account/MultiAccountActionCreators.tsx', ['validateMultiAccountTokens', 'switchAccount', 'moveAccount'], 'MultiAccountActionCreators'),
    (12146, 'modules/chat_input/native/action_buttons/ChatInputRightActions.tsx', ['displayName', 'default'], 'ChatInputGiftButton'),
    (12178, 'design/components/Icon/native/redesign/generated/ChatWarningIcon.tsx', ['ChatWarningIcon'], 'ChatWarningIcon'),
    (12274, 'design/components/Icon/native/redesign/generated/StickerIcon.tsx', ['StickerIcon'], 'StickerIcon'),
    (12325, 'design/components/Icon/native/redesign/generated/BoostTier1Icon.tsx', ['BoostTier1Icon'], 'BoostTier1Icon'),
    (12595, 'design/components/Icon/native/redesign/generated/WaveformIcon.tsx', ['WaveformIcon'], 'WaveformIcon'),
    (12605, 'design/components/Icon/native/redesign/generated/MagicWandIcon.tsx', ['MagicWandIcon'], 'MagicWandIcon'),
    (13066, 'modules/media_viewer/native/components/overlay/MediaViewerOverlayButtonFavoriteGIF.tsx', ['default'], 'MediaViewerHeader'),
    (13156, 'modules/user_profile/native/UserProfileActivityVoiceChannelUsers.tsx', ['default'], 'UserProfileActivityVoiceChannelUsers'),
    (13181, 'modules/user_profile/native/UserProfileNote.tsx', ['default'], 'UserProfileNote'),
    (13425, 'modules/user_profile/native/UserProfileContactButtons.tsx', ['default'], 'UserProfileContactButtons'),
    (12862, 'modules/main_tabs_v2/native/channel/header/PrivateChannelHeader.tsx', ['default'], 'PrivateChannelHeader'),
    (13820, 'design/components/Icon/native/redesign/generated/BoostTier3Icon.tsx', ['BoostTier3Icon'], 'BoostTier3Icon'),
    (13933, 'modules/gateway/GatewaySocketSingleton.tsx', ['handleIdentify', 'socket', 'localPresenceState'], 'GatewaySocketSingleton'),
    (13968, 'modules/gateway/PauseGatewaySocket.tsx', ['getIsPaused', 'setIsPaused'], 'PauseGatewaySocket'),
    (14048, 'stores/PrivateChannelReadStateStore.tsx', ['default'], 'PrivateChannelReadStateStore'),
    (6076, 'modules/message_request/MessageRequestUtils.tsx', ['filterOutMessageRequestsAndSpam', 'filterOutMessageRequestsAndSpamById', 'isMessageRequestOrSpamRequest'], 'MessageRequestUtils'),
    (14193, 'modules/guild/markGuildsAsRead.tsx', ['default'], 'markGuildsAsRead'),
    (14213, 'modules/guild_action_sheet/native/components/GuildActionSheetProgress.tsx', ['default'], 'GuildActionSheetJoinRequestRow'),
    (14299, 'modules/premium/ProductCatalog.tsx', ['ANIMATED_EMOJIS', 'EMOJIS_EVERYWHERE', 'STICKERS_EVERYWHERE', 'CLIENT_THEMES'], 'EmojiPermissions'),
    (14419, 'design/void/Status/native/Status.tsx', ['default', 'StatusWithTyping'], 'Status'),
    (14281, 'design/components/ContextMenu/native/ContextMenuPopout.native.tsx', ['ContextMenuPopout'], 'ContextMenuPopout'),
    (14839, 'modules/user_settings/core/native/SettingsRendererConfig.tsx', ['SETTING_RENDERER_CONFIG'], 'SettingRendererConfig'),
    (14850, 'modules/color_picker/native/showCustomColorPickerActionSheet.tsx', ['CUSTOM_COLOR_PICKER_KEY', 'CustomColorPicker'], 'showCustomColorPickerActionSheet'),
    (14971, 'modules/settings/native/renderer/SettingListRenderer.tsx', ['SettingsList', 'SearchableSettingsList'], 'SettingsList'),
    (14974, 'modules/settings/native/renderer/SettingRendererUtils.tsx', ['onRouteSettingOnPress', 'getSettingTitle', 'getSettingSearchableTitles'], 'SettingScreens'),
    (15232, 'design/components/Icon/native/redesign/generated/LaptopPhoneIcon.tsx', ['LaptopPhoneIcon'], 'LaptopPhoneIcon'),
    (15241, 'design/components/Icon/native/redesign/generated/PuzzlePieceIcon.tsx', ['PuzzlePieceIcon'], 'PuzzlePieceIcon'),
    (13012, 'design/components/Icon/native/redesign/generated/QuestsIcon.tsx', ['QuestsIcon'], 'QuestsIcon'),
    (15371, 'modules/quests/native/QuestHooks.native.tsx', ['useMobileQuestDockHeight', 'useMobileQuestDock', 'useIsMobileQuestDockVisibleToUser'], 'useMobileQuestDock'),
    (15378, 'modules/main_tabs_v2/native/you_bar/YouBarConstants.tsx', ['CONNECTION_BANNER_HEIGHT', 'YOU_BAR_SPRING_CONFIG', 'YOU_BAR_PADDING'], 'YouBarConstants'),
    (15465, 'modules/quests/native/QuestDock/QuestDock.tsx', ['PENDING', 'SUCCEEDED', 'FAILED'], 'QuestDock'),
    (9733, 'modules/gif_picker/GifProvider.tsx', ['GIF_PROVIDER', 'GIF_PROVIDER_EMBED_NAME', 'getSearchPlaceholder'], 'GifProvider (Bring back Tenor GIFs)'),
    (9748, 'design/components/Icon/native/redesign/generated/GifIcon.tsx', ['GifIcon'], 'GifIcon (Bring back Tenor GIFs)'),
    (11587, 'design/components/Icon/native/redesign/generated/ImagesIcon.tsx', ['ImagesIcon'], 'ImagesIcon (Bring back Tenor GIFs)'),
    (8204, 'design/components/Icon/native/redesign/generated/ImageWarningIcon.tsx', ['ImageWarningIcon'], 'ImageWarningIcon (Bring back Tenor GIFs)'),
    (12910, 'design/components/Icon/native/redesign/generated/EmbedIcon.tsx', ['EmbedIcon'], 'EmbedIcon (Fix link previews)'),
    (8128, 'design/components/Icon/native/redesign/generated/XNeutralIcon.tsx', ['XNeutralIcon'], 'XNeutralIcon (Fix link previews)'),
    (8132, 'design/components/Icon/native/redesign/generated/InstagramNeutralIcon.tsx', ['InstagramNeutralIcon'], 'InstagramNeutralIcon (Fix link previews)'),
    (12055, 'design/components/Icon/native/redesign/generated/TiktokNeutralIcon.tsx', ['TiktokNeutralIcon'], 'TiktokNeutralIcon (Fix link previews)'),
    (9105, 'design/components/Icon/native/redesign/generated/RedditNeutralIcon.tsx', ['RedditNeutralIcon'], 'RedditNeutralIcon (Fix link previews)'),
    (9103, 'design/components/Icon/native/redesign/generated/BlueskyNeutralIcon.tsx', ['BlueskyNeutralIcon'], 'BlueskyNeutralIcon (Fix link previews)'),
    (8130, 'design/components/Icon/native/redesign/generated/FacebookNeutralIcon.tsx', ['FacebookNeutralIcon'], 'FacebookNeutralIcon (Fix link previews)'),
    (15285, 'design/components/Icon/native/redesign/generated/FiltersHorizontalIcon.tsx', ['FiltersHorizontalIcon'], 'FiltersHorizontalIcon (translate bar, #82)'),
    (15560, 'design/components/Icon/native/redesign/generated/PaintPaletteIcon.tsx', ['PaintPaletteIcon'], 'PaintPaletteIcon'),
    (15566, 'modules/user_settings/appearance/native/SettingsAppearanceThemePickerScreen.tsx', ['default'], 'Theme picker (Unlock Nitro themes)'),
    (15612, 'design/components/Icon/native/redesign/generated/CircleMinusIcon.tsx', ['CircleMinusIcon'], 'CircleMinusIcon (Hide extra buttons)'),
    (15652, 'design/components/Icon/native/redesign/generated/EyeDropperIcon.tsx', ['EyeDropperIcon'], 'EyeDropperIcon'),
    (15723, 'design/components/Icon/native/redesign/generated/LanguageIcon.tsx', ['LanguageIcon'], 'LanguageIcon'),
    (15831, 'modules/user_settings/app_icon/native/UserSettingsAppIcons.tsx', ['default'], 'UserSettingsAppIcons'),
    (15832, 'modules/app_icons/native/AppIconRows.tsx', ['default'], 'AppIconRows'),
    (15892, 'design/components/Icon/native/redesign/generated/HashmarkIcon.tsx', ['HashmarkIcon'], 'HashmarkIcon'),
    (15894, 'design/components/Icon/native/redesign/generated/BeakerIcon.tsx', ['BeakerIcon'], 'BeakerIcon (Experimental chip)'),
    (15928, 'design/components/Icon/native/redesign/generated/DoubleCheckmarkIcon.tsx', ['DoubleCheckmarkIcon'], 'DoubleCheckmarkIcon'),
    (15974, 'design/components/Icon/native/redesign/generated/LettersIcon.tsx', ['LettersIcon'], 'LettersIcon'),
    (16121, 'design/components/Icon/native/redesign/generated/BugIcon.tsx', ['BugIcon'], 'BugIcon'),
    (16475, 'modules/main_tabs_v2/native/tabs/messages/items/channel/MessagesItemChannelContent.tsx', ['default'], 'MessagesItemChannelContent'),
    (16663, 'design/components/Icon/native/redesign/generated/BoostTier2Icon.tsx', ['BoostTier2Icon'], 'BoostTier2Icon'),
    (16671, 'modules/guild_sidebar/native/ChannelInfo.tsx', ['default'], 'ChannelInfo'),
    (16744, 'modules/guilds_bar/native/GuildsBarConstants.tsx', ['MESSAGES', 'FAVORITES', 'PENDING_JOIN_REQUESTS'], 'FastListRenderSections'),
    (16748, 'modules/guilds_bar/native/utils/getGuildsBarGuildMenuItems.tsx', ['default'], 'getGuildsBarGuildMenuItems (Server info menu row)'),
    (16754, 'modules/guilds_bar/native/hooks/useGuildsBarProps.tsx', ['MESSAGES', 'FAVORITES', 'PENDING_JOIN_REQUESTS'], 'useGuildsBarProps'),
    (16834, 'modules/main_tabs_v2/native/tabs/you/utils/showYouAccountActionSheet.tsx', ['showYouAccountActionSheet'], 'showYouAccountActionSheet'),
    (16839, 'modules/multi_account/native/openManageAccountsModal.tsx', ['default'], 'openManageAccountsModal'),
    (16841, 'modules/multi_account/native/ManageAccountsConstants.tsx', ['MANAGE_ACCOUNTS', 'LOGIN', 'ACCOUNT_DISABLED_OR_DELETION_SCHEDULED'], 'ManageAccountsConstants'),
    (16857, 'modules/main_tabs_v2/native/you_bar/YouBarButton.tsx', ['default', 'YouBarButtonIcon', 'YouBarButtonContainer'], 'YouBarButton'),
    (16858, 'modules/main_tabs_v2/native/you_bar/YouBarNotificationsButton.tsx', ['default'], 'YouBarButtons'),
    (16947, 'design/components/Icon/native/redesign/generated/PaintbrushThinIcon.tsx', ['PaintbrushThinIcon'], 'PaintbrushThinIcon'),
    (17143, 'design/components/Icon/native/redesign/generated/SparklesIcon.tsx', ['SparklesIcon'], 'SparklesIcon (Unlock Nitro themes)'),
    (17697, 'modules/app_icons/native/AppIconsCoachmark.tsx', ['default'], 'AppIconsCoachmark'),
    (18051, 'modules/app_icons/native/AppIconPremiumManager.tsx', ['default'], 'AppIconPremiumManager'),
    (502, 'stores/AuthenticationStore.tsx', ['default'], 'AuthenticationStore (Badge Completer)'),
    (2012, 'stores/MediaEngineStore.tsx', ['default'], 'MediaEngineStore (Badge Completer)'),
    (2037, 'stores/DetectableGameStore.tsx', ['default'], 'DetectableGameStore (Badge Completer)'),
    (5051, 'design/components/Icon/native/redesign/generated/ClockIcon.tsx', ['ClockIcon'], 'ClockIcon (Badge Completer)'),
    (5113, 'stores/VoiceStateStore.tsx', ['default'], 'VoiceStateStore (Badge Completer)'),
    (5759, 'stores/SelfPresenceStore.tsx', ['default'], 'SelfPresenceStore (Badge Completer)'),
    (5932, 'stores/ConsentStore.tsx', ['default'], 'ConsentStore (Badge Completer)'),
    (6853, 'modules/applications/ApplicationActionCreators.tsx', ['fetchApplication'], 'ApplicationActionCreators (Badge Completer)'),
    (8304, '../discord_common/js/shared/shared-constants/BadgeId.tsx', ['BadgeId'], 'BadgeId (Badge Completer)'),
    (8312, 'modules/badges/BadgeDirectoryStore.tsx', ['default'], 'BadgeDirectoryStore (Badge Completer)'),
    (8317, 'modules/badges/BadgeDirectoryActionCreators.tsx', ['fetchBadgeDirectory'], 'BadgeDirectoryActionCreators (Badge Completer)'),
    (8921, 'design/components/Icon/native/redesign/generated/TrophyIcon.tsx', ['TrophyIcon'], 'TrophyIcon (Badge Completer)'),
    (10649, 'stores/LocalActivityStore.tsx', ['default'], 'LocalActivityStore (Badge Completer)'),
    (15139, 'actions/ConsentActionCreators.tsx', ['setConsents'], 'ConsentActionCreators (Badge Completer)'),
    (1095, 'modules/user_settings/UserSettingsConstants.tsx', ['UserSettingsDelay'], 'UserSettingsConstants (Unlock Nitro themes)'),
    (1209, '../discord_common/js/packages/protos/discord_protos/discord_users/v1/preloaded_user_settings.tsx', ['ClientThemeSettings'], 'ClientThemeSettings proto (Unlock Nitro themes)'),
    (1240, '../discord_common/js/packages/protos/google/protobuf/wrappers.tsx', ['UInt64Value', 'UInt32Value', 'FloatValue'], 'Protobuf wrappers (Unlock Nitro themes)'),
    (2046, 'modules/user_settings/UserSettingsProtoActionCreators.tsx', ['PreloadedUserSettingsActionCreators'], 'UserSettingsProtoActionCreators (Unlock Nitro themes)'),
    (5930, 'actions/AuthenticationActionCreators.tsx', ['default'], 'AuthenticationActionCreators (Account switcher)'),
    (6201, 'design/components/Navigator/native/NavigatorHeader.native.tsx', ['default', 'HeaderBackImage'], 'NavigatorHeader (Account switcher)'),
    (15460, 'modules/client_themes/ClientThemesBackgroundActionCreators.tsx', ['updateBackgroundGradientPreset', 'resetPreviewClientTheme'], 'ClientThemesBackgroundActionCreators (Unlock Nitro themes)'),
    (16373, 'modules/auth/native/components/Auth.tsx', ['default', 'TrackRegistrationContext'], 'Auth & TrackRegistrationContext (Account switcher)'),
    (16375, 'modules/auth/native/RegistrationStepsUtils.tsx', ['getAllAuthScreens'], 'RegistrationStepsUtils (Account switcher)'),
    (16376, 'modules/auth/native/RegistrationUIStore.tsx', ['resetRegistration'], 'RegistrationUIStore (Account switcher)'),
    (16384, 'modules/auth/native/RegistrationUtils.tsx', ['BackButtonWithTracking', 'getTrackRegTransition'], 'RegistrationUtils (Account switcher)'),
    (16387, 'modules/auth/register.tsx', ['default', 'registerFull'], 'register (Account switcher)'),
    (16840, 'modules/multi_account/native/ManageAccountsModal.tsx', ['default'], 'ManageAccountsModal (Account switcher)'),
    (5938, 'utils/TrackedHTTPUtils.tsx', ['default'], 'TrackedHTTPUtils (Account switcher: sign-up requests go out signed out)'),
]


def main():
    path = next((a for a in sys.argv[1:] if not a.startswith('--')), 'work/new/assets/index.android.bundle')
    with open(path, 'rb') as fp:
        raw_bytes = fp.read()

    bundle_sha256 = hashlib.sha256(raw_bytes).hexdigest()
    B = Bundle(path)
    h = B.h
    b = h.b

    f0 = h.func(0)
    g0_sha256 = hashlib.sha256(b[f0['offset']:f0['offset'] + f0['size']]).hexdigest()

    def find_ascii_string_id(target):
        for i in range(h.h['stringCount']):
            if h.string(i) == target:
                return i
        return None

    join_id = find_ascii_string_id('join')
    eval_id = find_ascii_string_id('eval')
    promise_id = find_ascii_string_id('Promise')
    resolve_id = find_ascii_string_id('resolve')
    empty_id = find_ascii_string_id('')

    print("=== 1. Bundle & Global Function Constants ===")
    print(f'HbcPrivacy.ORIGINAL_SHA256 = "{bundle_sha256}"')
    print(f"HbcPrelude.FUNCTION_COUNT  = {h.h['functionCount']}")
    print(f"HbcPrelude.GLOBAL_OFFSET   = {f0['offset']}")
    print(f"HbcPrelude.GLOBAL_SIZE     = {f0['size']}")
    print(f'HbcPrelude.GLOBAL_SHA256   = "{g0_sha256}"')
    print(f"Global #0 frame={f0['frame']}, reads={f0['read']}, flags=0x{f0['flags']:02x}")
    print(f"String IDs: JOIN_ID={join_id}, EVAL_ID={eval_id}, PROMISE_ID={promise_id}, RESOLVE_ID={resolve_id}, EMPTY_ID={empty_id}")

    path_to_mid = {}
    for mid, p in B.paths().items():
        path_to_mid[p] = mid
        path_to_mid[os.path.basename(p)] = mid

    print("\n=== 2. Bootstrap Metro Module Verification ===")
    moved = 0
    for mid, path_hint, exports, desc in BOOTSTRAP_MODULES:
        actual_path = B.paths().get(mid)
        if mid in B.modules:
            mstrings = B.strs(mid, deep=True)
            if all(e in mstrings for e in exports) and (path_hint is None or actual_path == path_hint):
                continue
        candidate = path_to_mid.get(path_hint) if path_hint else (B.find(*exports, deep=True)[0] if exports and B.find(*exports, deep=True) else None)
        print(f"  [MOVED/CHECK] id={mid:5d} ({desc}): actual_path={actual_path!r}, candidate_in_new_bundle={candidate}")
        moved += 1
    if moved == 0:
        print(f"  OK: All {len(BOOTSTRAP_MODULES)} inspected Metro modules verified at their pinned IDs.")

    def locate_hbc_target(mod_hint, fn_name):
        if mod_hint:
            mid = path_to_mid.get(mod_hint) or path_to_mid.get(os.path.basename(mod_hint))
            if mid is not None:
                matches = [f for f in B.tree(mid) if h.fname(f) == fn_name and h.func(f)['expanded'] and (h.func(f)['flags'] & 0xc8 == 0)]
                if len(matches) == 1:
                    return matches[0]
                elif matches:
                    return matches
        return None

    print("\n=== 3. HbcPrivacy Target Verification ===")
    missing_hbc = 0
    for group, targets in G.items():
        for mod, fid, name, promise in targets:
            f = h.func(fid) if fid < h.h['functionCount'] else None
            if f is not None and h.fname(fid) == name and f['expanded'] and (f['flags'] & 0xc8 == 0):
                continue
            candidate = locate_hbc_target(mod, name)
            print(f"  [CHANGED] {group} #{fid} expected {name!r} (mod={mod}), got {h.fname(fid) if f else None!r} -> candidate={candidate}")
            missing_hbc += 1
    if missing_hbc == 0:
        print(f"  OK: All {sum(len(v) for v in G.values())} HbcPrivacy targets verified (expanded, no exception handlers, register-safe).")

    print("\n=== 4. Module IDs bootstrap.js uses that this script doesn't check ===")
    unchecked = sorted(bootstrap_module_ids() - {m[0] for m in BOOTSTRAP_MODULES})
    for mid in unchecked:
        print(f"  [UNCHECKED] id={mid:5d} path={B.paths().get(mid)!r}: add it to BOOTSTRAP_MODULES, then run --map")
    if not unchecked:
        print("  OK: every module ID in bootstrap.js is checked above.")
    return 1 if moved or missing_hbc or unchecked else 0


def bootstrap_module_ids():
    """Metro module IDs bootstrap.js reads: selectModules lists, inspectedExport/venusIcon/rowIcon/__r calls, icon pairs."""
    import re
    src = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), '../../patches/src/main/resources/venus/bootstrap.js')).read()
    ids = set()
    for pattern in (r'(?<![\w.])(?:inspectedExport|venusIcon|rowIcon|global\.__r|serverStore|x)\((\d{2,5}),\s*["\w]',
                    r'selectModules\(\[([\d,\s]+)\]', r'\[(\d{3,5}),\s*"[A-Z]\w*Icon"\]', r'targetModules\[(\d+)\]\s*=\s*1'):
        for match in re.findall(pattern, src):
            ids.update(int(x) for x in re.findall(r'\d+', match))
    return ids


def write_module_map(out=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'module-map.md')):
    """module-map.md is generated from BOOTSTRAP_MODULES, so the two never disagree."""
    rows = sorted(BOOTSTRAP_MODULES, key=lambda m: m[0])
    lines = ['# Metro modules Venus uses', '',
             'Generated by `python3 scripts/hbc/port_check.py --map` from `BOOTSTRAP_MODULES`; edit that list, not this file.',
             'The supported Discord version and bundle hash live in `DiscordPatches.kt` and `HbcPrivacy.kt`.', '',
             '| ID | Source path | Exports checked | Used for |', '|---|---|---|---|']
    lines += [f"| {mid} | {('`' + path + '`') if path else '-'} | {', '.join(exports)} | {desc} |" for mid, path, exports, desc in rows]
    open(out, 'w').write('\n'.join(lines) + '\n')
    print(f"{os.path.relpath(out)}: {len(rows)} modules")


if __name__ == '__main__':
    if '--map' in sys.argv:
        write_module_map(); sys.exit(0)
    sys.exit(main())
