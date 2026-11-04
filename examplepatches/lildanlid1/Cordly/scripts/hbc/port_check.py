#!/usr/bin/env python3
"""
Porting & verification assistant for upgrading Conduit Patches to a new Discord Android release.

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
    (1087, None, ['A11Y_RUNTIME_VIOLATION', 'ACCOUNT_SCHEDULED_FOR_DELETION', 'MessageTypesSets', 'Endpoints'], 'Discord Constants'),
    (1098, '../discord_common/js/shared/Constants.tsx', ['PRIMARY_NORMAL', 'PRIMARY_NORMAL_ITALIC', 'PRIMARY_MEDIUM'], 'Permissions constant'),
    (1113, '../discord_common/js/shared/lib/TokenManager.tsx', ['init', 'getAnalyticsToken', 'getToken'], 'TokenManager'),
    (1114, 'modules/routing/router_utils.tsx', ['shouldNavigate', 'transitionTo', 'transitionToGuild'], 'NavigationUtils'),
    (1128, 'intl/index.native.tsx', ['intl', 'getSystemLocale', 'getAvailableLocales'], 'Intl / Locale strings'),
    (1164, '../discord_common/js/packages/rtn-codegen/js/NativeFileModule.tsx', ['default'], 'NativeFileModule'),
    (1205, 'design/void/Button/native/Button.tsx', ['ButtonColors'], 'ButtonColors (red confirm on risky features)'),
    (1207, 'modules/user_settings/ThemeStore.tsx', ['default', 'UNSET', 'SET'], 'ThemeStore'),
    (1266, None, ['murmur', 'noConflict'], 'MurmurHashV3'),
    (1297, '../discord_common/js/packages/http-utils/HTTPUtils.tsx', ['INVALID_FORM_BODY_ERROR_CODE', 'convertSkemaError', 'stringifyErrors', 'HTTP'], 'HTTPUtils'),
    (1362, '../discord_common/js/packages/analytics-utils/getSuperProperties.tsx', ['browser_user_agent', 'browser_version', 'os_sdk_version'], 'SuperProperties'),
    (1403, 'modules/user/UserStoreUtils.tsx', ['isStaffEnv', 'isStaffEnvRawData', 'getEnv'], 'UserStoreUtils.isStaffEnv (Unlock Discord experiments)'),
    (1392, 'stores/UserStore.tsx', ['default', 'users', 'ASSISTANT_WUMPUS_VOICE_USER'], 'UserStore'),
    (1417, 'utils/AvatarUtils.tsx', ['default'], 'AvatarUtils'),
    (1505, 'design/components/Navigator/native/useNavigation.native.tsx', ['useNavigation', 'useNativeStackNavigation', 'useStackNavigation'], 'useStackNavigation'),
    (2001, 'stores/native/AppStateStore.tsx', ['default'], 'AppStateStore'),
    (2068, 'stores/ChannelStore.tsx', ['Basic', 'Full', 'default'], 'ChannelStore'),
    (2090, 'stores/GuildStore.tsx', ['default'], 'GuildStore'),
    (2119, 'stores/SelectedChannelStore.tsx', ['default', 'findFirstVoiceChannelId', 'handleConnectionOpen'], 'SelectedChannelStore (Hidden channels never opens a locked channel by itself)'),
    (2122, 'stores/GuildRoleStore.tsx', ['default', 'getNumRoles'], 'GuildRoleStore'),
    (2128, 'stores/GuildMemberStore.tsx', ['GUILD', 'USER', 'default'], 'GuildMemberStore'),
    (2132, 'modules/user_settings/LocaleStore.tsx', ['default'], 'LocaleStore'),
    (4843, 'stores/GuildChannelStore.tsx', ['default', 'GUILD_SELECTABLE_CHANNELS_KEY', 'GUILD_VOCAL_CHANNELS_KEY'], 'GuildChannelsStore'),
    (4845, 'stores/PermissionStore.tsx', ['default'], 'PermissionStore'),
    (4846, 'modules/lurker_mode/LurkingStore.tsx', ['default'], 'LurkingStore'),
    (4852, 'modules/app_channels/AppChannelPermissions.tsx', ['APP_CHANNEL_MINIMUM_BOT_PERMISSIONS', 'SWAP_APP_CHANNEL_APPLICATION_PERMISSION_LIST', 'SWAP_APP_CHANNEL_APPLICATION_PERMISSIONS'], 'computePermissions'),
    (4855, 'stores/RelationshipStore.tsx', ['default'], 'RelationshipStore'),
    (4864, 'utils/PremiumUtils.tsx', ['BUNDLE', 'TIER_0', 'TIER_1'], 'PremiumUtils'),
    (4904, 'modules/toast/native/ToastActionCreators.tsx', ['default'], 'ToastActionCreators'),
    (4912, 'design/components/Icon/native/BaseIconImage.tsx', ['BaseIconImage'], 'BaseIconImage (Icon packs)'),
    (4926, '../discord_common/js/packages/design/components/ThemeContextProvider/ThemeContext.tsx', ['createThemedContext', 'useThemeContext', 'FALLBACK_THEME_CONTEXT_VALUE'], 'ThemeContext'),
    (4934, '../discord_common/js/packages/design/components/ThemeContextProvider/ThemeContextProvider.tsx', ['ThemeContextProvider'], 'ThemeContextProvider (Custom themes re-keys the server list and DMs too)'),
    (5032, 'modules/client_themes/ClientThemesBackgroundStore.tsx', ['default'], 'ClientThemesBackgroundStore (Unlock Nitro themes)'),
    (5072, 'modules/main_tabs_v2/helpers/NavigationRouteUtils.native.tsx', ['navigateToChannel', 'navigateToRootTab', 'pushModal', 'popModal'], 'ModalAPI'),
    (5073, 'modules/main_tabs_v2/RootNavigationRef.native.tsx', ['getRootNavigationRef'], 'RootNavigationRef'),
    (5116, 'stores/GuildMemberCountStore.tsx', ['default', 'getMemberCount', 'getOnlineCount'], 'GuildMemberCountStore'),
    (6900, 'modules/auth/native/components/Login.tsx', ['default', 'LinkButton'], 'Login: Add account screen (Account switcher)'),
    (7144, 'design/components/Icon/native/redesign/generated/CircleCheckIcon.tsx', ['CircleCheckIcon'], 'CircleCheckIcon'),
    (6573, 'design/components/Icon/native/redesign/generated/CircleXIcon.tsx', ['CircleXIcon'], 'CircleXIcon'),
    (5145, 'design/components/Icon/native/redesign/generated/CircleInformationIcon.tsx', ['CircleInformationIcon'], 'CircleInformationIcon'),
    (7047, 'design/components/Icon/native/redesign/generated/EnvelopeIcon.tsx', ['EnvelopeIcon'], 'EnvelopeIcon'),
    (4910, 'design/components/Icon/native/redesign/generated/FriendsIcon.tsx', ['FriendsIcon'], 'FriendsIcon'),
    (5131, 'design/components/Icon/native/redesign/generated/UserPlusIcon.tsx', ['UserPlusIcon'], 'UserPlusIcon'),
    (14059, 'design/components/Icon/native/redesign/generated/NewUserIcon.tsx', ['NewUserIcon'], 'NewUserIcon (Create a new account)'),
    (5137, 'design/components/Icon/native/redesign/generated/LinkIcon.tsx', ['LinkIcon'], 'LinkIcon'),
    (5139, 'design/components/Icon/native/redesign/generated/SendMessageIcon.tsx', ['SendMessageIcon'], 'SendMessageIcon (preview message bar)'),
    (5141, 'design/components/Icon/native/redesign/generated/CopyIcon.tsx', ['CopyIcon'], 'CopyIcon'),
    (5143, 'design/components/Icon/native/redesign/generated/DownloadIcon.tsx', ['DownloadIcon'], 'DownloadIcon'),
    (5148, 'design/components/Icon/native/redesign/generated/TrashIcon.tsx', ['TrashIcon'], 'TrashIcon'),
    (5155, 'modules/action_sheet/native/ActionSheetActionCreators.tsx', ['default', 'ACTION_SHEET_HEIGHT_HALF', 'ACTION_SHEET_HEIGHT_EXPANDED'], 'ActionSheetActionCreators'),
    (5156, 'modules/haptics/HapticUtils.native.tsx', ['HapticFeedbackTypes', 'triggerHapticFeedback'], 'HapticUtils'),
    (5157, 'modules/haptics/HapticFeedbackTypes.tsx', ['IMPACT_LIGHT', 'IMPACT_MEDIUM', 'SELECTION', 'default'], 'HapticFeedbackTypes'),
    (6462, 'design/void/Pressables/native/Pressables.tsx', ['PressableOpacity'], 'PressableOpacity (translate bar, #82)'),
    (5187, 'design/components/Text/native/Text.tsx', ['TextStyleSheet', 'Text', 'Heading'], 'Design Text'),
    (5191, 'design/components/Styles/native/createStyles.tsx', ['experimental_createToken', 'createStyles', 'createLegacyClassComponentStyles'], 'createStyles'),
    (6291, 'stores/ReadStateStore.tsx', ['IS_GUILD_CHANNEL', 'IS_THREAD', 'IS_MENTION_LOW_IMPORTANCE'], 'ReadStateStore'),
    (5211, 'stores/SessionsStore.tsx', ['default'], 'SessionsStore'),
    (5207, 'stores/PresenceStore.tsx', ['default', 'sortActivity'], 'PresenceStore'),
    (5521, 'modules/channel/useChannelName.tsx', ['default', 'computeDefaultGroupDmNameFromUserIds', 'computeDefaultGroupDmName'], 'ChannelNameUtils'),
    (6223, 'modules/read_states/ReadStateConstants.tsx', ['CHANNEL', 'GUILD_EVENT', 'NOTIFICATION_CENTER'], 'ReadStateTypes'),
    (5532, 'stores/MessageStore.tsx', ['default'], 'MessageStore'),
    (5888, 'modules/messages/isMessageMentioned.tsx', ['isRawMessageMentioned', 'isMentioned', 'mention_roles'], 'isMessageMentioned (Message highlights: role mentions)'),
    (5534, 'modules/messages/MessageRecordUtils.tsx', ['createMessageRecord', 'updateServerMessage', 'updateMessageRecord'], 'MessageRecordUtils'),
    (5477, 'design/components/Stack/native/Stack.native.tsx', ['Stack'], 'Stack'),
    (5479, 'design/components/Button/native/Button.native.tsx', ['Button'], 'Button'),
    (6219, 'stores/SortedGuildStore.tsx', ['default', 'GuildsNodeType', 'insertUnsortedGuilds'], 'SortedGuildStore'),
    (6235, '../discord_common/js/shared/shared-constants/AdCreativeType.tsx', ['INVALID', 'QUEST', 'QUEST_HOME_HERO'], 'AdCreativeType'),
    (6243, 'modules/emojis/EmojiStore.tsx', ['Unloaded', 'Loading', 'Loaded'], 'EmojiStore'),
    (6245, 'modules/emojis/RawGuildEmojiStore.tsx', ['default', 'getGuildEmojis'], 'RawGuildEmojiStore'),
    (6286, 'modules/stickers/StickersStore.tsx', ['Unloaded', 'Loaded', 'default'], 'StickersStore'),
    (6287, 'modules/stickers/GuildStickersStore.tsx', ['default', 'getStickersByGuildId'], 'GuildStickersStore'),
    (6377, 'actions/GuildActionCreators.tsx', ['default', 'requestMembersById', 'deleteGuild', 'joinGuild', 'transitionToGuildSync'], 'GuildActionCreators (Preview servers without joining: joinGuild lurker)'),
    (1498, 'utils/native/ImageUtils.tsx', ['default', 'getMobileOptimizedSrc', 'getSrcWithWidthAndHeight'], 'ImageUtils (Load full-quality images)'),
    (8666, 'modules/media_viewer/native/MediaSourceUtil.tsx', ['extractMediaFromAttachment', 'extractMediaFromEmbed', 'extractMediaFromMessageComponents', 'extractMediaSourcesFromMessage', 'extractMediaSourcesFromEmbed', 'extractMediaSourcesFromComponent'], 'MediaSourceUtil (Load full-quality images)'),
    (15471, 'modules/notifications/native/NotificationTokenManager.tsx', ['default'], 'NotificationTokenManager'),
    (16089, 'design/components/Icon/native/redesign/generated/FullscreenEnterIcon.tsx', ['FullscreenEnterIcon'], 'FullscreenEnterIcon (Load full-quality images)'),
    (7293, 'actions/RelationshipActionCreators.tsx', ['default', 'removeFriend', 'removeRelationship'], 'RelationshipActionCreators (Alert when you\'re removed)'),
    (8910, 'modules/guild_settings/GuildSettingsActionCreators.tsx', ['default', 'leaveGuild', 'deleteGuild'], 'GuildSettingsActionCreators (Alert when you\'re removed)'),
    (8911, 'modules/guild_settings/GuildSettingsStore.tsx', ['default', 'EMPTY_METADATA'], 'GuildSettingsStore (Edit servers locally: imports the real GuildStore)'),
    (18678, 'modules/guild_settings/native/GuildSettingsModalLanding.tsx', ['default'], 'GuildSettingsModalLanding (Edit servers locally: imports the real GuildStore)'),
    (6221, 'stores/GuildAvailabilityStore.tsx', ['default', 'isUnavailable'], 'GuildAvailabilityStore (Alert when you\'re removed)'),
    (5400, 'actions/native/AlertActionCreators.tsx', ['default'], 'AlertActionCreators'),
    (5512, 'modules/markup/MarkupChannelMentionRule.tsx', ['default', 'getChannel', 'parseChannel'], 'MarkupChannelMentionRule'),
    (7838, 'design/components/Icon/native/redesign/generated/WarningIcon.tsx', ['WarningIcon'], 'WarningIcon (Risky chip)'),
    (8471, 'design/components/Icon/native/redesign/generated/ChatIcon.tsx', ['ChatIcon'], 'ChatIcon'),
    (8473, 'design/components/Icon/native/redesign/generated/ThreadIcon.tsx', ['ThreadIcon'], 'ThreadIcon (preview channel header)'),
    (8478, 'design/components/Icon/native/redesign/generated/TextLockIcon.tsx', ['TextLockIcon'], 'TextLockIcon'),
    (8480, 'design/components/Icon/native/redesign/generated/TextIcon.tsx', ['TextIcon'], 'TextIcon'),
    (8487, 'design/components/Icon/native/redesign/generated/ImageIcon.tsx', ['ImageIcon'], 'ImageIcon'),
    (8489, 'design/components/Icon/native/redesign/generated/GroupIcon.tsx', ['GroupIcon'], 'GroupIcon'),
    (8490, 'design/components/Icon/native/redesign/generated/AtIcon.tsx', ['AtIcon'], 'AtIcon'),
    (8495, 'design/components/Icon/native/redesign/generated/LockIcon.tsx', ['LockIcon'], 'LockIcon'),
    (8506, 'design/components/Icon/native/redesign/generated/AppsIcon.tsx', ['AppsIcon'], 'AppsIcon'),
    (6393, 'design/components/Icon/native/redesign/generated/ClipboardListIcon.tsx', ['ClipboardListIcon'], 'ClipboardListIcon'),
    (6454, 'design/components/TableRow/native/TableCheckboxRow.native.tsx', ['TableCheckboxRow'], 'TableCheckboxRow'),
    (6457, 'design/components/TableRow/native/TableRow.native.tsx', ['Icon', 'Arrow', 'TrailingText'], 'TableRow'),
    (6459, 'design/components/Card/native/Card.native.tsx', ['Card', 'InternalCard'], 'Card'),
    (6465, 'design/components/TableRow/native/TableRowIcon.native.tsx', ['TableRowIcon'], 'TableRowIcon'),
    (6482, 'design/components/Icon/native/redesign/generated/ArrowLargeLeftIcon.tsx', ['ArrowLargeLeftIcon'], 'ArrowLargeLeftIcon (preview channel header)'),
    (6485, 'design/components/Icon/native/redesign/generated/XSmallIcon.tsx', ['XSmallIcon'], 'XSmallIcon'),
    (6539, 'design/components/TableRow/native/TableRadioRow.native.tsx', ['TableRadioRow'], 'TableRadioRow'),
    (6540, 'design/components/TableRow/native/TableRadioGroup.native.tsx', ['TableRadioGroupContext', 'TableRadioGroup'], 'TableRadioGroup'),
    (6542, 'design/components/TableRow/native/TableRowGroup.native.tsx', ['TableRowGroupTitle', 'TableRowGroup'], 'TableRowGroup'),
    (6584, None, ['BottomSheetScrollView', 'BottomSheetFlatList', 'BottomSheetModal'], '@gorhom/bottom-sheet (Server info sheet scrolling)'),
    (6727, None, ['LegacyScrollView', 'LegacyFlatList', 'LegacyTextInput'], 'react-native-gesture-handler GestureComponents (View raw data sideways scrolling)'),
    (6563, 'design/components/TextInput/native/TextInput.native.tsx', ['TextInput'], 'TextInput'),
    (7199, 'stores/views/PrivateChannelSortStore.tsx', ['default'], 'PrivateChannelSortStore (Read all, more than 20 unread DMs)'),
    (6917, 'design/components/Icon/native/redesign/generated/KeyIcon.tsx', ['KeyIcon'], 'KeyIcon'),
    (6919, 'design/components/Icon/native/redesign/generated/MobilePhoneIcon.tsx', ['MobilePhoneIcon'], 'MobilePhoneIcon'),
    (6927, 'design/components/Icon/native/redesign/generated/EyeSlashIcon.tsx', ['EyeSlashIcon'], 'EyeSlashIcon'),
    (6929, 'design/components/Icon/native/redesign/generated/EyeIcon.tsx', ['EyeIcon'], 'EyeIcon'),
    (7016, 'design/components/TextField/native/SearchField.native.tsx', ['SearchField'], 'SearchField'),
    (7017, 'design/components/Icon/native/redesign/generated/MagnifyingGlassIcon.tsx', ['MagnifyingGlassIcon'], 'MagnifyingGlassIcon'),
    (7077, 'actions/ReadStateActionCreators.tsx', ['ack', 'ackCategory', 'ackChannel'], 'ReadStateActionCreators'),
    (7098, 'modules/emojis/native/Emoji.tsx', ['default'], 'Emoji'),
    (7101, 'design/components/Icon/native/redesign/generated/CheckmarkSmallIcon.tsx', ['CheckmarkSmallIcon'], 'CheckmarkSmallIcon'),
    (7117, 'design/components/Sheet/native/BottomSheetTitleHeader.native.tsx', ['BottomSheetTitleHeader'], 'BottomSheetTitleHeader'),
    (7165, None, ['Clipboard', 'Platform', 'addListener'], 'Clipboard'),
    (7167, 'modules/action_sheet/native/showSimpleActionSheet.tsx', ['showSimpleActionSheet'], 'SimpleActionSheet'),
    (7170, 'design/components/Sheet/native/ActionSheetCloseButton.native.tsx', ['ActionSheetCloseButton'], 'ActionSheetCloseButton'),
    (7172, 'design/components/TableRow/native/TableSwitchRow.native.tsx', ['TableSwitchRow'], 'TableSwitchRow'),
    (7173, 'design/components/Forms/native/FormSwitch.native.tsx', ['FormSwitch'], 'FormSwitch'),
    (7175, 'design/components/Sheet/native/ActionSheet.native.tsx', ['ActionSheet'], 'ActionSheet'),
    (7182, 'design/components/Icon/native/redesign/generated/ChevronSmallRightIcon.tsx', ['ChevronSmallRightIcon'], 'ChevronSmallRightIcon'),
    (7254, 'actions/GuildSubscriptionsActionCreators.tsx', ['subscribeGuild'], 'GuildSubscriptionsActionCreators'),
    (7323, 'modules/stickers/StickerSendability.tsx', ['SENDABLE', 'SENDABLE_WITH_PREMIUM', 'NONSENDABLE'], 'StickerUtils'),
    (7368, 'design/components/Icon/native/redesign/generated/SettingsIcon.tsx', ['SettingsIcon'], 'SettingsIcon'),
    (7370, 'modules/user_settings/core/native/openUserSettings.tsx', ['openUserSettings'], 'UserSettingsActionCreators'),
    (7445, 'actions/MessageActionCreators.tsx', ['default'], 'MessageActionCreators'),
    (7748, 'utils/native/PrivateChannelCallUtils.tsx', ['openGuildVoiceModal', 'navigateToVoiceChannel', 'openChannelCallModal'], 'PrivateChannelCallUtils (Hidden channels asks before a locked voice channel opens)'),
    (8727, 'modules/icymi/ICYMIStore.tsx', ['ICYMIStore'], 'ICYMIStore (Hidden channels keeps its real VIEW_CHANNEL answers)'),
    (14788, 'modules/guilds_bar/GuildMediaStateStore.tsx', ['GuildMediaStateStore'], 'GuildMediaStateStore (Hidden channels keeps its real VIEW_CHANNEL answers)'),
    (17190, 'modules/main_tabs_v2/native/shared_components/happening_now/useHappeningNowData.tsx', ['HappeningNowItem', 'MemberListRowTypes'], 'useHappeningNowData (Hidden channels keeps its real VIEW_CHANNEL answers)'),
    (6332, 'modules/guild_scheduled_events/GuildScheduledEventStore.tsx', ['default', 'getGuildScheduledEventsForGuild'], 'GuildScheduledEventStore'),
    (7517, 'modules/guild_sidebar/ChannelListState.tsx', ['CannotShow', 'DoNotShow', 'WouldShowIfUncollapsed'], 'useGuildChannelsList'),
    (6362, 'stores/GuildReadStateStore.tsx', ['default'], 'GuildReadStateStore'),
    (7635, 'modules/messages/MessageParser.tsx', ['default', 'parseAndRebuild', 'createParserState'], 'MessageParser'),
    (7641, 'modules/chat/SlowmodeUtils.tsx', ['canBypassSlowmode', 'canBypassSlowmodeHelper', 'useCanBypassSlowmode'], 'SlowmodeUtils'),
    (7652, 'modules/quests/utils/QuestDataUtils.tsx', ['THIRTY_DAYS_MS', 'earnedDecisionIsValid', 'findQuestOrReplacement'], 'QuestDataUtils'),
    (7656, 'modules/quests/QuestStore.tsx', ['default'], 'QuestStore'),
    (7664, 'modules/quests/utils/QuestServerUtils.tsx', ['isQuestWithKnownConfigVersion', 'questConfigFromServer', 'questUserStatusFromServer'], 'questUserStatusFromServer'),
    (8026, 'utils/UploadUtils.tsx', ['MAX_TOTAL_ATTACHMENT_SIZE', 'MAX_TOTAL_ATTACHMENT_SIZE_1GB', 'MAX_TOTAL_ATTACHMENT_SIZE_MB'], 'AttachmentUtils'),
    (9419, 'modules/main_tabs_v2/native/tabs/you/YouBannerDecorations.tsx', ['default'], 'YouBannerDecorations (Hide extra buttons: profile pill)'),
    (10002, 'modules/foreground_service/mobile/ForegroundServiceManager.android.tsx', ['default'], 'ForegroundServiceManager'),
    (8023, 'lib/uploader/CloudUpload.tsx', ['NOT_STARTED', 'STARTED', 'UPLOADING'], 'CloudUpload'),
    (8046, 'modules/media_uploads/native/VideoUploadUtils.tsx', ['calculateOptimalBitrate', 'calculateTargetDimensions', 'canSkipVideoTranscode'], 'VideoUploadUtils (Compress big files: video bitrate and size)'),
    (8047, 'modules/media_uploads/UploadLimits.tsx', ['FREE_UPLOAD_LIMIT_BYTES', 'getEffectiveUploadLimit'], 'UploadLimits (Compress big files)'),
    (8057, 'lib/uploader/UploadTargets.tsx', ['getUploadTarget'], 'UploadTargets (Compress big files: the limit for this chat)'),
    (10006, 'lib/uploader/native/getPreCompressionFileSize.tsx', ['getPreCompressionFileSize'], 'getPreCompressionFileSize (Compress big files: size gate)'),
    (11636, 'design/components/Icon/native/redesign/generated/FileUpIcon.tsx', ['FileUpIcon'], 'FileUpIcon (Compress big files)'),
    (10551, 'design/components/Icon/native/redesign/generated/MusicIcon.tsx', ['MusicIcon'], 'MusicIcon (Compress big files)'),
    (8056, 'lib/uploader/native/CloudUploaderUtils.tsx', ['default', 'prepareMessagePayload', 'getUploadPayload'], 'CloudUploaderUtils (Anonymous file names)'),
    (9621, 'design/components/Icon/native/redesign/generated/PhoneCallIcon.tsx', ['PhoneCallIcon'], 'PhoneCallIcon'),
    (9641, 'design/components/Icon/native/redesign/generated/PaperIcon.tsx', ['PaperIcon'], 'PaperIcon'),
    (9658, 'design/components/Icon/native/redesign/generated/ThumbsUpIcon.tsx', ['ThumbsUpIcon'], 'ThumbsUpIcon'),
    (9543, 'design/components/Icon/native/redesign/generated/MoreHorizontalIcon.tsx', ['MoreHorizontalIcon'], 'MoreHorizontalIcon (preview server header)'),
    (8013, 'modules/messages/native/renderer/RowGenerator.tsx', ['default'], 'RowGenerator'),
    (8254, 'modules/double_tap_to_react/native/DoubleTapToReactUtils.tsx', ['getFallbackDoubleTapDisambiguatedEmoji', 'reactionEmojiFromSettingsValue', 'disambiguatedEmojiFromSettingsValue'], 'DoubleTapToReactUtils'),
    (8261, 'modules/replies/canReplyToMessage.tsx', ['useCanReplyToMessage', 'canReplyToMessage'], 'canReplyToMessage'),
    (8577, 'modules/user_profile/native/showUserProfileActionSheet.tsx', ['default', 'showUserProfileActionSheet'], 'showUserProfileActionSheet'),
    (8579, 'actions/UserActionCreators.tsx', ['fetchCurrentUser', 'acceptAgreements', 'setFlag'], 'UserActionCreators'),
    (8674, 'design/components/Icon/native/redesign/generated/PlayIcon.tsx', ['PlayIcon'], 'PlayIcon (preview Watch button)'),
    (8676, 'design/components/Icon/native/redesign/generated/PauseIcon.tsx', ['PauseIcon'], 'PauseIcon (preview player)'),
    (7972, 'design/components/Icon/native/redesign/generated/LinkExternalSmallIcon.tsx', ['LinkExternalSmallIcon'], 'LinkExternalSmallIcon'),
    (9327, 'design/components/Icon/native/redesign/generated/NitroWheelIcon.tsx', ['NitroWheelIcon'], 'NitroWheelIcon'),
    (9252, 'design/components/Icon/native/redesign/generated/ReactionIcon.tsx', ['ReactionIcon'], 'ReactionIcon'),
    (9365, 'design/components/Icon/native/redesign/generated/TagIcon.tsx', ['TagIcon'], 'TagIcon'),
    (9393, 'design/components/Icon/native/redesign/generated/GlobeEarthIcon.tsx', ['GlobeEarthIcon'], 'GlobeEarthIcon'),
    (10325, 'design/components/Icon/native/redesign/generated/PollsIcon.tsx', ['PollsIcon'], 'PollsIcon (Hide extra buttons)'),
    (10331, 'modules/media_keyboard/native/components/MediaKeyboardBottomSheetActions.tsx', ['default'], 'MediaKeyboardBottomSheetActions (Hide extra buttons: attach menu)'),
    (11964, 'design/components/Icon/native/redesign/generated/ShopIcon.tsx', ['ShopIcon'], 'ShopIcon (Hide extra buttons)'),
    (14150, 'design/components/Icon/native/redesign/generated/QuoteIcon.tsx', ['QuoteIcon'], 'QuoteIcon'),
    (11024, 'modules/oauth2/native/OAuth2AuthorizeModal.tsx', ['default'], 'OAuth2AuthorizeModal'),
    (9514, 'design/components/Icon/native/redesign/generated/GameControllerIcon.tsx', ['GameControllerIcon'], 'GameControllerIcon'),
    (9545, 'design/components/Icon/native/redesign/generated/ServerIcon.tsx', ['ServerIcon'], 'ServerIcon'),
    (11630, 'design/components/Icon/native/redesign/generated/RefreshIcon.tsx', ['RefreshIcon'], 'RefreshIcon'),
    (11657, 'design/components/Icon/native/redesign/generated/ImagePlusIcon.tsx', ['ImagePlusIcon'], 'ImagePlusIcon'),
    (10604, 'design/components/Icon/native/redesign/generated/ArrowSmallRightIcon.tsx', ['ArrowSmallRightIcon'], 'ArrowSmallRightIcon'),
    (9561, 'modules/messages/useMessageMaxLength.tsx', ['default', 'getMaxMessageLength'], 'useMessageMaxLength'),
    (9995, 'modules/forums/native/composer/ForumComposer.tsx', ['default'], 'ForumComposer (Send long messages keeps the real limit)'),
    (13811, 'modules/scheduled_messages/native/ScheduledMessageEditContentModal.tsx', ['default'], 'ScheduledMessageEditContentModal (Send long messages keeps the real limit)'),
    (9767, 'modules/app_icons/native/AppIconConstants.tsx', ['getDefaultIcon', 'getOfficialAlternateIcons', 'getLimitedAlternateIcons'], 'AppIconConstants'),
    (9705, 'design/components/Icon/native/redesign/generated/UploadIcon.tsx', ['UploadIcon'], 'UploadIcon'),
    (8855, 'design/void/Form/native/index.tsx', ['Form', 'FormArrow', 'FormCheckbox'], 'Form'),
    (10733, 'design/components/Icon/native/redesign/generated/ShieldIcon.tsx', ['ShieldIcon'], 'ShieldIcon'),
    (13827, 'design/components/Icon/native/redesign/generated/ChatSmileIcon.tsx', ['ChatSmileIcon'], 'ChatSmileIcon'),
    (11028, 'lib/pushnotification/PushNotification.tsx', ['default'], 'PushNotification'),
    (7772, '../discord_common/js/packages/rtn-codegen/js/NativePermissionManagerModule.tsx', ['default'], 'NativePermissionManagerModule'),
    (9683, 'modules/chat_input/native/useChatBottomManagerUIStore.tsx', ['default', 'updateChatInputContainerHeight', 'updateShowingAutoComplete'], 'ChatInputHeightContext'),
    (8895, 'design/components/Icon/native/redesign/generated/ShieldUserIcon.tsx', ['ShieldUserIcon'], 'ShieldUserIcon'),
    (9045, 'design/components/Icon/native/redesign/generated/BellIcon.tsx', ['BellIcon'], 'BellIcon'),
    (8952, 'design/components/Icon/native/redesign/generated/CalendarIcon.tsx', ['CalendarIcon'], 'CalendarIcon'),
    (9069, 'modules/voice_panel/native/shared/FormComponents.tsx', ['VoicePanelFormSection', 'MemberRowItem'], 'VoiceChannelMembers'),
    (11384, 'design/components/Icon/native/redesign/generated/DoorExitIcon.tsx', ['DoorExitIcon'], 'DoorExitIcon'),
    (11405, 'design/components/Icon/native/redesign/generated/HandRequestSpeakIcon.tsx', ['HandRequestSpeakIcon'], 'HandRequestSpeakIcon (preview Try it button)'),
    (11449, 'design/components/Icon/native/redesign/generated/ImageSparkleIcon.tsx', ['ImageSparkleIcon'], 'ImageSparkleIcon (Icon packs)'),
    (10081, 'modules/premium/components/native/NitroUpsellButton.tsx', ['default'], 'NitroUpsellButton'),
    (11492, 'design/components/Icon/native/redesign/generated/MicrophoneIcon.tsx', ['MicrophoneIcon'], 'MicrophoneIcon (preview message bar)'),
    (11577, 'design/components/ThemeContextProvider/native/RootThemeContextProvider.native.tsx', ['RootThemeContextProvider', 'DisableCustomTheme'], 'RootThemeContextProvider (Custom themes re-keys its memoized context)'),
    (10692, 'modules/chat/native/ChatViewWrapper.tsx', ['default'], 'ChatViewWrapper'),
    (10654, 'design/components/Icon/native/redesign/generated/BellSlashIcon.tsx', ['BellSlashIcon'], 'BellSlashIcon'),
    (13603, 'design/components/Icon/native/redesign/generated/BellZIcon.tsx', ['BellZIcon'], 'BellZIcon (Banners in Do Not Disturb)'),
    (9738, 'modules/double_tap_to_react/native/DoubleTapReminderToast.tsx', ['maybeShowDoubleTapReminderToast'], 'DoubleTapReminderToast'),
    (9851, 'design/components/Icon/native/redesign/generated/StarIcon.tsx', ['StarIcon'], 'StarIcon'),
    (9880, 'design/components/Icon/native/redesign/generated/BackspaceIcon.tsx', ['BackspaceIcon'], 'BackspaceIcon'),
    (9474, 'modules/quests/QuestActionCreators.tsx', ['SUCCESS', 'UNKNOWN_ERROR', 'fetchCurrentQuests'], 'QuestActionCreators'),
    (10023, 'design/components/Icon/native/redesign/generated/PencilIcon.tsx', ['PencilIcon'], 'PencilIcon'),
    (10035, 'actions/GIFPickerActionCreators.tsx', ['trackSearchStart', 'trackSearchResultViewed', 'search'], 'GIFPickerActionCreators'),
    (10038, 'modules/gif_picker/native/GIFPickerUtils.tsx', ['GIF_HEADER_HEIGHT', 'useFavoriteGIFsMobile', 'GIF_PICKER_ITEM_ESIMTATED_HEIGHT'], 'useFavoriteGIFsMobile'),
    (10316, 'design/components/Icon/native/redesign/generated/IdIcon.tsx', ['IdIcon'], 'IdIcon'),
    (10327, 'design/components/Icon/native/redesign/generated/AttachmentIcon.tsx', ['AttachmentIcon'], 'AttachmentIcon'),
    (10531, 'modules/main_tabs_v2/native/shared_components/user_list/UserRow.tsx', ['CALL', 'MESSAGE', 'ACCEPT'], 'UserRow'),
    (10563, 'design/components/Icon/native/redesign/generated/CrownIcon.tsx', ['CrownIcon'], 'CrownIcon'),
    (10598, 'design/components/Icon/native/redesign/generated/UserCircleIcon.tsx', ['UserCircleIcon'], 'UserCircleIcon'),
    (10621, 'design/components/Icon/native/redesign/generated/PlusLargeIcon.tsx', ['PlusLargeIcon'], 'PlusLargeIcon (preview message bar)'),
    (10641, 'design/components/Icon/native/redesign/generated/PinIcon.tsx', ['PinIcon'], 'PinIcon (Icon packs preview)'),
    (12668, 'design/components/Icon/native/redesign/generated/GiftIcon.tsx', ['GiftIcon'], 'GiftIcon'),
    (10858, 'modules/user_profile/native/UserProfilePrimaryInfo.tsx', ['default', 'DisplayName', 'UserTagAndPronouns'], 'UserProfileHeaderName'),
    (10859, 'design/components/Icon/native/redesign/generated/ChevronSmallDownIcon.tsx', ['ChevronSmallDownIcon'], 'ChevronSmallDownIcon (preview channel category)'),
    (10940, 'modules/profile_customization/native/BioText.tsx', ['default'], 'UserProfileBio'),
    (11600, None, ['pick', 'saveDocuments', 'keepLocalCopy', 'errorCodes', 'isErrorWithCode', 'types'], 'DocumentPicker (Backup and restore, 1.16.0)'),
    (13747, 'design/components/Icon/native/redesign/generated/KeyboardIcon.tsx', ['KeyboardIcon'], 'KeyboardIcon'),
    (10796, 'design/components/Icon/native/redesign/generated/ArrowLargeUpIcon.tsx', ['ArrowLargeUpIcon'], 'ArrowLargeUpIcon'),
    (11084, 'modules/settings/native/renderer/SettingBuilders.tsx', ['createToggle', 'createStatic', 'createRoute'], 'createSettingsList'),
    (11114, 'modules/messages/native/MessagesHandlers.tsx', ['MessagesHandlers'], 'MessagesHandlers'),
    (11180, 'design/components/Icon/native/redesign/generated/TimerIcon.tsx', ['TimerIcon'], 'TimerIcon'),
    (11187, 'design/components/Icon/native/redesign/generated/VideoIcon.tsx', ['VideoIcon'], 'VideoIcon'),
    (9978, 'modules/messages/native/long_press/LongPressMessageActionSheet.tsx', ['default'], 'LongPressMessageActionSheet'),
    (13759, 'modules/action_sheet/native/components/EmojiRow.tsx', ['default'], 'EmojiRow (Remove anything: quick reactions in the message menu)'),
    (12696, 'design/components/Icon/native/redesign/generated/ArrowAngleRightUpIcon.tsx', ['ArrowAngleRightUpIcon'], 'ArrowAngleRightUpIcon (Remove anything: Forward)'),
    (10650, 'design/components/Icon/native/redesign/generated/ChatMarkUnreadIcon.tsx', ['ChatMarkUnreadIcon'], 'ChatMarkUnreadIcon (Remove anything: Mark Unread)'),
    (13769, 'design/components/Icon/native/redesign/generated/BookmarkOutlineIcon.tsx', ['BookmarkOutlineIcon'], 'BookmarkOutlineIcon (Remove anything: Bookmark Message)'),
    (8494, 'design/components/Icon/native/redesign/generated/AnnouncementsIcon.tsx', ['AnnouncementsIcon'], 'AnnouncementsIcon (Remove anything: Publish)'),
    (9873, 'design/components/Icon/native/redesign/generated/FlagIcon.tsx', ['FlagIcon'], 'FlagIcon (Remove anything: Report)'),
    (9988, 'modules/messages/native/long_press/LongPressMessageActionSheetUtils.tsx', ['getContextBarCancelReason', 'handleEdit', 'handleCreateThread'], 'LongPressMessageActionSheetUtils'),
    (11198, 'modules/replies/native/replyToMessage.tsx', ['default'], 'replyToMessage'),
    (13762, 'modules/double_tap_to_react/native/DoubleTapEmojiEditNudge.tsx', ['DoubleTapEmojiEditNudge'], 'DoubleTapEmojiEditNudge'),
    (11632, 'design/components/Icon/native/redesign/generated/RetryIcon.tsx', ['RetryIcon'], 'RetryIcon (preview Start over / New people)'),
    (12274, 'design/components/Icon/native/redesign/generated/ArrowAngleLeftUpIcon.tsx', ['ArrowAngleLeftUpIcon'], 'ArrowAngleLeftUpIcon'),
    (11199, 'modules/messages/canEditMessage.tsx', ['default'], 'canEditMessage'),
    (11671, 'design/components/Icon/native/redesign/generated/UserIcon.tsx', ['UserIcon'], 'UserIcon'),
    (12849, 'actions/TypingActionCreators.tsx', ['default'], 'TypingActionCreators'),
    (11977, 'design/components/Icon/native/redesign/generated/ArrowsUpDownIcon.tsx', ['ArrowsUpDownIcon'], 'ArrowsUpDownIcon'),
    (12892, 'modules/chat_input/native/action_buttons/ChatInputActions.tsx', ['displayName', 'default'], 'ChatInputSendAndGiftButton'),
    (12920, 'components_native/chat/JumpToPresentButton.tsx', ['default'], 'JumpToPresentButton'),
    (12921, 'modules/chat_input/native/ChatFloatingNavButton.tsx', ['default'], 'JumpToPresentPill'),
    (12922, None, ['__packager_asset', 'registerAsset'], 'JumpToPresent arrow asset'),
    (12935, 'modules/double_tap_to_react/native/DoubleTapToReactChatInputBanner.tsx', ['DoubleTapToReactChatInputBanner'], 'DoubleTapToReactChatInputBanner'),
    (13073, 'actions/native/PushNotificationActionCreators.tsx', ['default', 'setPushPermissionState'], 'PushNotificationActionCreators'),
    (13074, 'modules/multi_account/MultiAccountStore.tsx', ['INVALID', 'VALIDATING', 'VALID'], 'MultiAccountStore'),
    (13075, 'modules/multi_account/Constants.tsx', ['YOU_ACCOUNT_ACTION_SHEET', 'CHOOSE_ACCOUNT', 'MANAGE_ACCOUNTS_MODAL'], 'MultiAccountConstants'),
    (13076, 'modules/user/isStaffFromRawUser.tsx', ['default'], 'isStaffFromRawUser'),
    (13078, 'modules/multi_account/MultiAccountActionCreators.tsx', ['validateMultiAccountTokens', 'switchAccount', 'moveAccount'], 'MultiAccountActionCreators'),
    (13090, 'modules/chat_input/native/action_buttons/ChatInputRightActions.tsx', ['displayName', 'default'], 'ChatInputGiftButton'),
    (13123, 'design/components/Icon/native/redesign/generated/ChatWarningIcon.tsx', ['ChatWarningIcon'], 'ChatWarningIcon'),
    (13217, 'design/components/Icon/native/redesign/generated/StickerIcon.tsx', ['StickerIcon'], 'StickerIcon'),
    (13268, 'design/components/Icon/native/redesign/generated/BoostTier1Icon.tsx', ['BoostTier1Icon'], 'BoostTier1Icon'),
    (13531, 'design/components/Icon/native/redesign/generated/WaveformIcon.tsx', ['WaveformIcon'], 'WaveformIcon'),
    (10946, 'design/components/Icon/native/redesign/generated/SlashBoxIcon.tsx', ['SlashBoxIcon'], 'SlashBoxIcon (Clean channel names)'),
    (12158, 'design/components/Icon/native/redesign/generated/MagicWandIcon.tsx', ['MagicWandIcon'], 'MagicWandIcon'),
    (13989, 'modules/media_viewer/native/components/overlay/MediaViewerOverlayButtonFavoriteGIF.tsx', ['default'], 'MediaViewerHeader'),
    (14076, 'modules/user_profile/native/UserProfileActivityVoiceChannelUsers.tsx', ['default'], 'UserProfileActivityVoiceChannelUsers'),
    (14101, 'modules/user_profile/native/UserProfileNote.tsx', ['default'], 'UserProfileNote'),
    (14204, 'modules/user_profile/native/UserProfileContactButtons.tsx', ['default'], 'UserProfileContactButtons'),
    (7840, 'design/components/Button/native/IconButton.native.tsx', ['IconButton'], 'IconButton (Remove anything: Messages header search / new message)'),
    (10561, 'design/components/Icon/native/redesign/generated/XLargeIcon.tsx', ['XLargeIcon'], 'XLargeIcon (Remove anything icon)'),
    (10806, 'design/components/Icon/native/redesign/generated/XSmallBoldIcon.tsx', ['XSmallBoldIcon'], 'XSmallBoldIcon (Remove anything: red X badge)'),
    (12093, 'design/components/Icon/native/redesign/generated/UndoIcon.tsx', ['UndoIcon'], 'UndoIcon (Remove anything: bring everything back)'),
    (9662, 'design/components/ContextMenu/native/ContextMenu.native.tsx', ['ContextMenu'], 'ContextMenu (Remove anything: attach button wrapper)'),
    (12895, 'modules/media_keyboard/native/MediaKeyboardButtonIcon.tsx', ['MediaKeyboardButtonIcon'], 'MediaKeyboardButtonIcon (Remove anything: attach button)'),
    (14015, 'modules/user_profile/native/UserProfileOverflowMenu.tsx', ['default'], 'UserProfileOverflowMenu (Remove anything: profile menu items)'),
    (15600, 'modules/settings/native/renderer/SettingHookHarness.tsx', ['default', 'getCachedSettingTitle', 'getCachedSettingSearchTerms'], 'SettingHookHarness (Remove anything: setting titles)'),
    (15601, 'modules/settings/native/renderer/stores/SettingBlocklistStore.tsx', ['default'], 'SettingBlocklistStore (Remove anything: redraws Settings)'),
    (15735, 'modules/settings/native/renderer/SettingRenderer.tsx', ['GuildSelectDefaultIcon', 'renderSettingItem', 'renderSettingSearchResultItem', 'renderSettingSearchResultPlaceholderItem'], 'SettingRenderer (Remove anything: marks Settings rows)'),
    (12897, 'modules/chat_input/native/action_buttons/ChatInputActionButtonApps.tsx', ['default'], 'ChatInputActionButtonApps (Remove anything: Apps button)'),
    (12901, 'modules/chat_input/native/action_buttons/ChatInputActionButtonGiftOrThread.tsx', ['default'], 'ChatInputActionButtonGiftOrThread (Remove anything: gift/thread button)'),
    (12908, 'modules/chat_input/native/accessories/ChatInputSendButton.tsx', ['default'], 'ChatInputSendButton (Remove anything: canSendVoiceMessage)'),
    (12909, 'modules/voice_messages/native/components/VoiceMessageButton.tsx', ['default'], 'VoiceMessageButton (Remove anything: voice message button)'),
    (13780, 'modules/main_tabs_v2/native/channel/header/PrivateChannelButtons.tsx', ['default'], 'PrivateChannelButtons (Remove anything: DM call / video / search)'),
    (15590, 'components_native/AppContainer.tsx', ['default'], 'AppContainer (Remove anything: removal mode bar)'),
    (17157, 'modules/main_tabs_v2/native/tabs/messages/MessagesHeader.tsx', ['default', 'getMessagesHeaderHeight'], 'MessagesHeader (Remove anything: Messages tab buttons)'),
    (17158, 'modules/main_tabs_v2/native/shared_components/MessageRequestsButton.tsx', ['default'], 'MessageRequestsButton (Remove anything: message requests)'),
    (15046, 'design/components/ContextMenu/native/ContextMenuItem.native.tsx', ['ContextMenuItem'], 'ContextMenuItem (Remove anything: marks profile menu items)'),
    (9663, 'design/components/ContextMenu/native/ContextMenuState.native.tsx', ['hideContextMenu'], 'ContextMenuState (Remove anything: closes the menu before asking)'),
    (8805, 'design/components/SegmentedControl/native/SegmentedControlState.native.tsx', ['useSegmentedControlState'], 'SegmentedControlState (Remove anything: profile tabs)'),
    (9052, 'design/components/SegmentedControl/native/SegmentedControlItem.native.tsx', ['SegmentedControlItem'], 'SegmentedControlItem (Remove anything: marks profile tabs)'),
    (12942, 'modules/channel_list_v2/native/components/GuildSearchAndInvite.tsx', ['default'], 'GuildSearchAndInvite (Remove anything: Search / Invite / Events)'),
    (14988, 'modules/guild_action_sheet/native/components/GuildActionSheetHeader.tsx', ['default'], 'GuildActionSheetHeader (Remove anything: Community Server pill)'),
    (14994, 'modules/guild_action_sheet/native/components/GuildActionSheetTabItems.tsx', ['default'], 'GuildActionSheetTabItems (Remove anything: Boost / Invite / Notifications)'),
    (14925, 'modules/guild_action_sheet/native/components/GuildActionSheetActions.tsx', ['GuildUnreadAction', 'GuildActionSheetSecondaryActions'], 'GuildActionSheetActions (Remove anything: server menu rows)'),
    (14998, 'modules/guild_action_sheet/native/components/GuildActionSheetEmojiSection.tsx', ['default'], 'GuildActionSheetEmojiSection (Remove anything: Server Emoji)'),
    (9709, 'design/components/Icon/native/redesign/generated/BoostGemIcon.tsx', ['BoostGemIcon'], 'BoostGemIcon (Remove anything: Boost button in the server menu)'),
    (11678, 'design/components/Tabs/native/Tabs.native.tsx', ['Tabs'], 'Tabs (Remove anything: profile tab bar)'),
    (11679, 'design/components/Tabs/native/TabItem.native.tsx', ['TabItem'], 'TabItem (Remove anything: marks Activity / Wishlist)'),
    (14197, 'modules/user_profile/native/UserProfileMutuals.tsx', ['default'], 'UserProfileMutuals (Remove anything: mutual servers)'),
    (10939, 'modules/user_profile/native/UserProfileAboutMeCard.tsx', ['default', 'a6XYD9'], 'UserProfileAboutMeCard (Remove anything: Member Since dates)'),
    (7158, 'modules/user_profile/native/UserProfileRolesCard.tsx', ['default'], 'UserProfileRolesCard (Remove anything: Roles)'),
    (14182, 'modules/user_profile/native/UserProfileConnections.tsx', ['UserProfileAccountConnectionsCard'], 'UserProfileConnections (Remove anything: Connections)'),
    (17156, 'modules/main_tabs_v2/native/tabs/messages/useMessagesSpecs.tsx', ['default', 'headerSize'], 'useMessagesSpecs (Remove anything: Messages header closes up)'),
    (17263, 'modules/channel_list_v2/native/RedesignGuildHeader.tsx', ['useRedesignGuildHeaderHeight'], 'RedesignGuildHeader (Remove anything: channel list header closes up)'),
    (13151, 'components_native/chat/ChatBeginningRow.tsx', ['default'], 'ChatBeginningRow (Remove anything: bot DM Mute / Deauthorize / Report Spam)'),
    (12000, 'modules/chat_input/native/accessories/ChatInputExpressionButton.tsx', ['default'], 'ChatInputExpressionButton (Remove anything: emoji button)'),
    (10838, 'modules/user_profile/native/UserProfileCustomStatusBubble.tsx', ['default'], 'UserProfileCustomStatusBubble (Remove anything: your status bubble)'),
    (17949, 'modules/user_profile/native/UserProfileYourFriendsCard.tsx', ['default'], 'UserProfileYourFriendsCard (Remove anything: Friends)'),
    (16773, 'modules/virtual_currency/native/BalanceWidgetMenu.tsx', ['default'], 'BalanceWidgetMenu (Remove anything: Orbs Balance)'),
    (17265, 'modules/channel_list_v2/native/components/ChannelListStickyHeader.tsx', ['default'], 'ChannelListStickyHeader (Remove anything: member count / Community)'),
    (17881, 'modules/main_tabs_v2/native/sidebar/details/header_v2/ChannelDetailsNavigationBar.tsx', ['default'], 'ChannelDetailsNavigationBar (Remove anything: details search / mute / settings / more)'),
    (17869, 'modules/search/native/components/tabs/hooks/useSearchSegmentedControlState.tsx', ['useSearchSegmentedControlState'], 'useSearchSegmentedControlState (Remove anything: details tabs)'),
    (11164, 'modules/main_tabs_v2/native/shared_components/user_list/useMemberListAction.tsx', ['default'], 'useMemberListAction (Remove anything: New Group)'),
    (9331, 'design/components/Icon/native/redesign/generated/OrbsIcon.tsx', ['OrbsIcon'], 'OrbsIcon'),
    (8474, 'design/components/Icon/native/redesign/generated/FolderIcon.tsx', ['FolderIcon'], 'FolderIcon'),
    (11175, 'design/components/Icon/native/redesign/generated/ChatPlusIcon.tsx', ['ChatPlusIcon'], 'ChatPlusIcon'),
    (6333, 'modules/message_request/MessageRequestStore.tsx', ['getMessageRequestsCount'], 'MessageRequestStore (Remove anything: message requests count)'),
    (6334, 'modules/message_request/SpamMessageRequestStore.tsx', ['getSpamChannelsCount'], 'SpamMessageRequestStore (Remove anything: message requests count)'),
    (5484, 'design/components/Button/native/ButtonConstants.native.tsx', ['SMALL_BUTTON_HEIGHT'], 'ButtonConstants (Remove anything: header row height)'),
    (11895, 'modules/channel_list_v2/native/RedesignChannelListConstants.tsx', ['SEARCH_BAR_MARGIN_BOTTOM'], 'RedesignChannelListConstants (Remove anything: search row margin)'),
    (10475, 'design/components/Icon/native/redesign/generated/ClydeIcon.tsx', ['ClydeIcon'], 'ClydeIcon (Remove anything: Discord join date)'),
    (13788, 'modules/main_tabs_v2/native/channel/header/PrivateChannelHeader.tsx', ['default'], 'PrivateChannelHeader'),
    (14600, 'design/components/Icon/native/redesign/generated/BoostTier3Icon.tsx', ['BoostTier3Icon'], 'BoostTier3Icon'),
    (14713, 'modules/gateway/GatewaySocketSingleton.tsx', ['handleIdentify', 'socket', 'localPresenceState'], 'GatewaySocketSingleton'),
    (14748, 'modules/gateway/PauseGatewaySocket.tsx', ['getIsPaused', 'setIsPaused'], 'PauseGatewaySocket'),
    (14830, 'stores/PrivateChannelReadStateStore.tsx', ['default'], 'PrivateChannelReadStateStore'),
    (6360, 'modules/message_request/MessageRequestUtils.tsx', ['filterOutMessageRequestsAndSpam', 'filterOutMessageRequestsAndSpamById', 'isMessageRequestOrSpamRequest'], 'MessageRequestUtils'),
    (14975, 'modules/guild/markGuildsAsRead.tsx', ['default'], 'markGuildsAsRead'),
    (14995, 'modules/guild_action_sheet/native/components/GuildActionSheetProgress.tsx', ['default'], 'GuildActionSheetJoinRequestRow'),
    (15066, 'modules/premium/ProductCatalog.tsx', ['ANIMATED_EMOJIS', 'EMOJIS_EVERYWHERE', 'STICKERS_EVERYWHERE', 'CLIENT_THEMES'], 'EmojiPermissions'),
    (15185, 'design/void/Status/native/Status.tsx', ['default', 'StatusWithTyping'], 'Status'),
    (15048, 'design/components/ContextMenu/native/ContextMenuPopout.native.tsx', ['ContextMenuPopout'], 'ContextMenuPopout'),
    (15602, 'modules/user_settings/core/native/SettingsRendererConfig.tsx', ['SETTING_RENDERER_CONFIG'], 'SettingRendererConfig'),
    (15613, 'modules/color_picker/native/showCustomColorPickerActionSheet.tsx', ['CUSTOM_COLOR_PICKER_KEY', 'CustomColorPicker'], 'showCustomColorPickerActionSheet'),
    (15733, 'modules/settings/native/renderer/SettingListRenderer.tsx', ['SettingsList', 'SearchableSettingsList'], 'SettingsList'),
    (15736, 'modules/settings/native/renderer/SettingRendererUtils.tsx', ['onRouteSettingOnPress', 'getSettingTitle', 'getSettingSearchableTitles'], 'SettingScreens'),
    (15994, 'design/components/Icon/native/redesign/generated/LaptopPhoneIcon.tsx', ['LaptopPhoneIcon'], 'LaptopPhoneIcon'),
    (16003, 'design/components/Icon/native/redesign/generated/PuzzlePieceIcon.tsx', ['PuzzlePieceIcon'], 'PuzzlePieceIcon'),
    (13929, 'design/components/Icon/native/redesign/generated/QuestsIcon.tsx', ['QuestsIcon'], 'QuestsIcon'),
    (16133, 'modules/quests/native/QuestHooks.native.tsx', ['useMobileQuestDockHeight', 'useMobileQuestDock', 'useIsMobileQuestDockVisibleToUser'], 'useMobileQuestDock'),
    (16140, 'modules/main_tabs_v2/native/you_bar/YouBarConstants.tsx', ['CONNECTION_BANNER_HEIGHT', 'YOU_BAR_SPRING_CONFIG', 'YOU_BAR_PADDING'], 'YouBarConstants'),
    (16225, 'modules/quests/native/QuestDock/QuestDock.tsx', ['PENDING', 'SUCCEEDED', 'FAILED'], 'QuestDock'),
    (10036, 'modules/gif_picker/GifProvider.tsx', ['GIF_PROVIDER', 'GIF_PROVIDER_EMBED_NAME', 'getSearchPlaceholder'], 'GifProvider (Bring back Tenor GIFs)'),
    (10051, 'design/components/Icon/native/redesign/generated/GifIcon.tsx', ['GifIcon'], 'GifIcon (Bring back Tenor GIFs)'),
    (12328, 'design/components/Icon/native/redesign/generated/ImagesIcon.tsx', ['ImagesIcon'], 'ImagesIcon (Bring back Tenor GIFs)'),
    (8481, 'design/components/Icon/native/redesign/generated/ImageWarningIcon.tsx', ['ImageWarningIcon'], 'ImageWarningIcon (Bring back Tenor GIFs)'),
    (13836, 'design/components/Icon/native/redesign/generated/EmbedIcon.tsx', ['EmbedIcon'], 'EmbedIcon (Fix link previews)'),
    (8404, 'design/components/Icon/native/redesign/generated/XNeutralIcon.tsx', ['XNeutralIcon'], 'XNeutralIcon (Fix link previews)'),
    (8408, 'design/components/Icon/native/redesign/generated/InstagramNeutralIcon.tsx', ['InstagramNeutralIcon'], 'InstagramNeutralIcon (Fix link previews)'),
    (13000, 'design/components/Icon/native/redesign/generated/TiktokNeutralIcon.tsx', ['TiktokNeutralIcon'], 'TiktokNeutralIcon (Fix link previews)'),
    (9399, 'design/components/Icon/native/redesign/generated/RedditNeutralIcon.tsx', ['RedditNeutralIcon'], 'RedditNeutralIcon (Fix link previews)'),
    (9397, 'design/components/Icon/native/redesign/generated/BlueskyNeutralIcon.tsx', ['BlueskyNeutralIcon'], 'BlueskyNeutralIcon (Fix link previews)'),
    (8406, 'design/components/Icon/native/redesign/generated/FacebookNeutralIcon.tsx', ['FacebookNeutralIcon'], 'FacebookNeutralIcon (Fix link previews)'),
    (9395, 'design/components/Icon/native/redesign/generated/YoutubeNeutralIcon.tsx', ['YoutubeNeutralIcon'], 'YoutubeNeutralIcon (Fix link previews)'),
    (9401, 'design/components/Icon/native/redesign/generated/TwitchNeutralIcon.tsx', ['TwitchNeutralIcon'], 'TwitchNeutralIcon (Fix link previews)'),
    (17210, 'design/components/Icon/native/redesign/generated/SpotifyNeutralIcon.tsx', ['SpotifyNeutralIcon'], 'SpotifyNeutralIcon (Fix link previews)'),
    (13620, 'design/components/Icon/native/redesign/generated/ThemeDarkIcon.tsx', ['ThemeDarkIcon'], 'ThemeDarkIcon (Fix link previews, Dark Tumblr posts)'),
    (12331, 'design/components/Icon/native/redesign/generated/FiltersHorizontalIcon.tsx', ['FiltersHorizontalIcon'], 'FiltersHorizontalIcon (translate bar, #82)'),
    (16320, 'design/components/Icon/native/redesign/generated/PaintPaletteIcon.tsx', ['PaintPaletteIcon'], 'PaintPaletteIcon'),
    (16326, 'modules/user_settings/appearance/native/SettingsAppearanceThemePickerScreen.tsx', ['default'], 'Theme picker (Unlock Nitro themes)'),
    (16372, 'design/components/Icon/native/redesign/generated/CircleMinusIcon.tsx', ['CircleMinusIcon'], 'CircleMinusIcon (Hide extra buttons)'),
    (16412, 'design/components/Icon/native/redesign/generated/EyeDropperIcon.tsx', ['EyeDropperIcon'], 'EyeDropperIcon'),
    (9415, 'design/components/Icon/native/redesign/generated/LanguageIcon.tsx', ['LanguageIcon'], 'LanguageIcon'),
    (16589, 'modules/user_settings/app_icon/native/UserSettingsAppIcons.tsx', ['default'], 'UserSettingsAppIcons'),
    (16590, 'modules/app_icons/native/AppIconRows.tsx', ['default'], 'AppIconRows'),
    (16648, 'design/components/Icon/native/redesign/generated/HashmarkIcon.tsx', ['HashmarkIcon'], 'HashmarkIcon'),
    (5112, 'modules/experiments/ExperimentStore.tsx', ['default', 'registerExperiment'], 'ExperimentStore (Unlock Discord experiments)'),
    (7674, 'stores/DeveloperExperimentStore.tsx', ['default'], 'DeveloperExperimentStore (Unlock Discord experiments)'),
    (16625, 'design/components/Icon/native/redesign/generated/WrenchIcon.tsx', ['WrenchIcon'], 'WrenchIcon (Advanced group)'),
    (13214, 'design/components/Icon/native/redesign/generated/HeadphonesIcon.tsx', ['HeadphonesIcon'], 'HeadphonesIcon (Keep Bluetooth audio clear in calls, Listen along)'),
    (14082, 'modules/user_profile/native/UserProfileActivityButtons.tsx', ['PlayOnSpotifyButton'], 'UserProfileActivityButtons (Listen along)'),
    (6017, 'stores/ConnectedAccountsStore.tsx', ['default'], 'ConnectedAccountsStore (Listen along)'),
    (15065, 'design/components/Slider/native/Slider.native.tsx', ['Slider'], 'Slider (Listen along)'),
    (5343, 'actions/AudioActionCreators.tsx', ['default'], 'AudioActionCreators (Voice channel options)'),
    (5528, 'modules/soundboard/SoundboardStore.tsx', ['default'], 'SoundboardStore (Voice channel options)'),
    (5530, 'modules/soundboard/SoundboardConstants.tsx', ['DEFAULT_SOUND_GUILD_ID'], 'SoundboardConstants (Voice channel options)'),
    (6145, 'actions/SelectedChannelActionCreators.tsx', ['default'], 'SelectedChannelActionCreators (Voice channel options)'),
    (7324, 'modules/soundboard/SoundboardActionCreators.tsx', ['maybeFetchSoundboardSounds'], 'SoundboardActionCreators (Voice channel options)'),
    (13212, 'design/components/Icon/native/redesign/generated/SoundboardIcon.tsx', ['SoundboardIcon'], 'SoundboardIcon (Voice channel options)'),
    (5216, '../discord_common/js/packages/media-engine/Constants.tsx', ['MediaEngineContextTypes'], 'MediaEngineContextTypes (Voice channel options)'),
    (9059, 'modules/voice_calls/native/AudioManagerStore.android.tsx', ['default'], 'AudioManagerStore (Voice channel options)'),
    (9060, '../discord_common/js/packages/rtn-codegen/js/NativeAudioManagerModule.tsx', ['AudioDeviceType', 'getInvalidAndroidDevice'], 'NativeAudioManagerModule (Voice channel options)'),
    (9068, 'modules/voice_calls/native/AudioManagerActionCreator.tsx', ['setAudioOutputDevice'], 'AudioManagerActionCreator (Voice channel options)'),
    (11372, 'modules/sound_playback/SoundUtils.tsx', ['createSoundForPack', 'createSound', 'playSound'], 'SoundUtils (Voice channel options)'),
    (11376, 'modules/sound_playback/native/SoundUtils.tsx', ['MobileAudioSound'], 'MobileAudioSound (Voice channel options)'),
    (8501, 'design/components/Icon/native/redesign/generated/VoiceNormalIcon.tsx', ['VoiceNormalIcon'], 'VoiceNormalIcon (Voice channel options)'),
    (12666, 'design/components/Icon/native/redesign/generated/PhoneIcon.tsx', ['PhoneIcon'], 'PhoneIcon (Voice channel options)'),
    (16650, 'design/components/Icon/native/redesign/generated/BeakerIcon.tsx', ['BeakerIcon'], 'BeakerIcon (Experimental chip)'),
    (16684, 'design/components/Icon/native/redesign/generated/DoubleCheckmarkIcon.tsx', ['DoubleCheckmarkIcon'], 'DoubleCheckmarkIcon'),
    (16730, 'design/components/Icon/native/redesign/generated/LettersIcon.tsx', ['LettersIcon'], 'LettersIcon'),
    (12113, 'design/components/Icon/native/redesign/generated/BugIcon.tsx', ['BugIcon'], 'BugIcon'),
    (17165, 'modules/main_tabs_v2/native/tabs/messages/items/channel/MessagesItemChannelContent.tsx', ['default'], 'MessagesItemChannelContent'),
    (17349, 'design/components/Icon/native/redesign/generated/BoostTier2Icon.tsx', ['BoostTier2Icon'], 'BoostTier2Icon'),
    (17357, 'modules/guild_sidebar/native/ChannelInfo.tsx', ['default'], 'ChannelInfo'),
    (17429, 'modules/guilds_bar/native/GuildsBarConstants.tsx', ['MESSAGES', 'FAVORITES', 'PENDING_JOIN_REQUESTS'], 'FastListRenderSections'),
    (17433, 'modules/guilds_bar/native/utils/getGuildsBarGuildMenuItems.tsx', ['default'], 'getGuildsBarGuildMenuItems (Server info menu row)'),
    (17439, 'modules/guilds_bar/native/hooks/useGuildsBarProps.tsx', ['MESSAGES', 'FAVORITES', 'PENDING_JOIN_REQUESTS'], 'useGuildsBarProps'),
    (17514, 'modules/main_tabs_v2/native/tabs/you/utils/showYouAccountActionSheet.tsx', ['showYouAccountActionSheet'], 'showYouAccountActionSheet'),
    (17519, 'modules/multi_account/native/openManageAccountsModal.tsx', ['default'], 'openManageAccountsModal'),
    (17521, 'modules/multi_account/native/ManageAccountsConstants.tsx', ['MANAGE_ACCOUNTS', 'LOGIN', 'ACCOUNT_DISABLED_OR_DELETION_SCHEDULED'], 'ManageAccountsConstants'),
    (17537, 'modules/main_tabs_v2/native/you_bar/YouBarButton.tsx', ['default', 'YouBarButtonIcon', 'YouBarButtonContainer'], 'YouBarButton'),
    (17538, 'modules/main_tabs_v2/native/you_bar/YouBarNotificationsButton.tsx', ['default'], 'YouBarButtons'),
    (17627, 'design/components/Icon/native/redesign/generated/PaintbrushThinIcon.tsx', ['PaintbrushThinIcon'], 'PaintbrushThinIcon'),
    (11733, 'design/components/Icon/native/redesign/generated/SparklesIcon.tsx', ['SparklesIcon'], 'SparklesIcon (Unlock Nitro themes)'),
    (18079, 'modules/app_icons/native/AppIconsCoachmark.tsx', ['default'], 'AppIconsCoachmark'),
    (18444, 'modules/app_icons/native/AppIconPremiumManager.tsx', ['default'], 'AppIconPremiumManager'),
    (9074, 'design/components/Icon/native/redesign/generated/HeadphonesSlashIcon.tsx', ['HeadphonesSlashIcon'], 'HeadphonesSlashIcon (Fake deafen)'),
    (14755, 'modules/gateway/LocalVoiceStateManager.tsx', ['default'], 'LocalVoiceStateManager (Fake deafen)'),
    (18341, 'modules/voice_panel/native/controls/VoicePanelVoiceControlsButtons.tsx', ['DeafenSwitch'], 'VoicePanelVoiceControlsButtons (Fake deafen)'),
    (502, 'stores/AuthenticationStore.tsx', ['default'], 'AuthenticationStore (Badge Completer)'),
    (2014, 'stores/MediaEngineStore.tsx', ['default'], 'MediaEngineStore (Badge Completer)'),
    (2040, 'stores/DetectableGameStore.tsx', ['default'], 'DetectableGameStore (Badge Completer)'),
    (5150, 'design/components/Icon/native/redesign/generated/ClockIcon.tsx', ['ClockIcon'], 'ClockIcon (Badge Completer)'),
    (5212, 'stores/VoiceStateStore.tsx', ['default'], 'VoiceStateStore (Badge Completer)'),
    (6015, 'stores/SelfPresenceStore.tsx', ['default'], 'SelfPresenceStore (Badge Completer)'),
    (6188, 'stores/ConsentStore.tsx', ['default'], 'ConsentStore (Badge Completer)'),
    (6357, 'modules/applications/ApplicationActionCreators.tsx', ['fetchApplication'], 'ApplicationActionCreators (Badge Completer)'),
    (8582, '../discord_common/js/shared/shared-constants/BadgeId.tsx', ['BadgeId'], 'BadgeId (Badge Completer)'),
    (8590, 'modules/badges/BadgeDirectoryStore.tsx', ['default'], 'BadgeDirectoryStore (Badge Completer)'),
    (8595, 'modules/badges/BadgeDirectoryActionCreators.tsx', ['fetchBadgeDirectory'], 'BadgeDirectoryActionCreators (Badge Completer)'),
    (9211, 'design/components/Icon/native/redesign/generated/TrophyIcon.tsx', ['TrophyIcon'], 'TrophyIcon (Badge Completer)'),
    (10974, 'stores/LocalActivityStore.tsx', ['default'], 'LocalActivityStore (Badge Completer)'),
    (15901, 'actions/ConsentActionCreators.tsx', ['setConsents'], 'ConsentActionCreators (Badge Completer)'),
    (1097, 'modules/user_settings/UserSettingsConstants.tsx', ['UserSettingsDelay'], 'UserSettingsConstants (Unlock Nitro themes)'),
    (1211, '../discord_common/js/packages/protos/discord_protos/discord_users/v1/preloaded_user_settings.tsx', ['ClientThemeSettings'], 'ClientThemeSettings proto (Unlock Nitro themes)'),
    (1242, '../discord_common/js/packages/protos/google/protobuf/wrappers.tsx', ['UInt64Value', 'UInt32Value', 'FloatValue'], 'Protobuf wrappers (Unlock Nitro themes)'),
    (2049, 'modules/user_settings/UserSettingsProtoActionCreators.tsx', ['PreloadedUserSettingsActionCreators'], 'UserSettingsProtoActionCreators (Unlock Nitro themes)'),
    (6186, 'actions/AuthenticationActionCreators.tsx', ['default'], 'AuthenticationActionCreators (Account switcher)'),
    (6478, 'design/components/Navigator/native/NavigatorHeader.native.tsx', ['default', 'HeaderBackImage'], 'NavigatorHeader (Account switcher)'),
    (16220, 'modules/client_themes/ClientThemesBackgroundActionCreators.tsx', ['updateBackgroundGradientPreset', 'resetPreviewClientTheme'], 'ClientThemesBackgroundActionCreators (Unlock Nitro themes)'),
    (17062, 'modules/auth/native/components/Auth.tsx', ['default', 'TrackRegistrationContext'], 'Auth & TrackRegistrationContext (Account switcher)'),
    (17064, 'modules/auth/native/RegistrationStepsUtils.tsx', ['getAllAuthScreens'], 'RegistrationStepsUtils (Account switcher)'),
    (17065, 'modules/auth/native/RegistrationUIStore.tsx', ['resetRegistration'], 'RegistrationUIStore (Account switcher)'),
    (17073, 'modules/auth/native/RegistrationUtils.tsx', ['BackButtonWithTracking', 'getTrackRegTransition'], 'RegistrationUtils (Account switcher)'),
    (17076, 'modules/auth/register.tsx', ['default', 'registerFull'], 'register (Account switcher)'),
    (17520, 'modules/multi_account/native/ManageAccountsModal.tsx', ['default'], 'ManageAccountsModal (Account switcher)'),
    (6194, 'utils/TrackedHTTPUtils.tsx', ['default'], 'TrackedHTTPUtils (Account switcher: sign-up requests go out signed out)'),
    (5135, 'design/components/Icon/native/redesign/generated/UserMinusIcon.tsx', ['UserMinusIcon'], 'UserMinusIcon (Hide blocked or ignored messages)'),
    (7579, 'modules/replies/ReferencedMessageStore.tsx', ['default'], 'ReferencedMessageStore (Hide blocked or ignored messages: replies)'),
    (12809, 'modules/messages/native/createChannelStream.tsx', ['default'], 'createChannelStream (Hide blocked or ignored messages)'),
    (11619, 'design/components/Icon/native/redesign/generated/ChatShieldIcon.tsx', ['ChatShieldIcon'], 'ChatShieldIcon (Hide blocked or ignored messages)'),
    (13422, 'modules/accept_invite/native/InviteDetails.tsx', ['ACCEPT', 'DECLINE', 'default'], 'InviteDetails (Preview servers without joining: Preview button on the join screen)'),
    (6214, 'design/components/ButtonGroup/native/ButtonGroup.native.tsx', ['ButtonGroup'], 'ButtonGroup (the join screen\'s Accept and Decline)'),
    (7290, 'actions/ChannelActionCreators.tsx', ['default'], 'ChannelActionCreators (Hide blocked: Close their DM; Leave group DMs silently: closePrivateChannel)'),
    (8537, 'modules/suspicious_downloads/SuspiciousDownloadUtils.tsx', ['isSuspiciousDownload'], 'SuspiciousDownloadUtils (Always trust)'),
    (8766, 'stores/MaskedLinkStore.tsx', ['default'], 'MaskedLinkStore (Always trust)'),
    (12818, 'modules/chat_input/native/ChatInput.tsx', ['displayName', 'default'], 'ChatInput (Expand the message bar: the button sits on the bar)'),
    (12337, 'modules/chat_input/native/ChatInputNativeComponent.tsx', ['displayName', 'default'], 'ChatInputNativeComponent (Tap mentions to open profiles; Expand the message bar)'),
    (12338, 'modules/chat_input/native/useChatInputMaxHeight.tsx', ['getChatInputMaxHeightWorklet', 'getChatInputHeightAnimationTimingWorklet', 'getChatInputMaxHeight'], 'useChatInputMaxHeight (Expand the message bar: the height cap)'),
    (12887, 'modules/chat_input/native/useChatInputHeightWorklet.native.tsx', ['default', 'getIsChatInputHeightWorkletEnabled'], 'useChatInputHeightWorklet (Expand the message bar: the live height)'),
    (1658, None, ['makeMutable', 'withTiming', 'Easing'], 'react-native-reanimated (Expand the message bar: the shared height reserve)'),
    (10696, 'modules/safe_area/useSafeAreaInsetsSharedValue.native.tsx', ['getSafeAreaInsetsWorklet'], 'useSafeAreaInsetsSharedValue (Expand the message bar: room for the navigation bar)'),
    (7846, None, ['Svg', 'Path'], 'react-native-svg (Expand the message bar: the collapse arrows)'),
    (9990, 'modules/replies/PendingReplyActionCreators.tsx', ['createPendingReply', 'createShallowPendingReply'], 'PendingReplyActionCreators (Reply without pinging)'),
    (13511, 'modules/notifications/NotificationTextUtils.tsx', ['shouldNotify'], 'NotificationTextUtils (Banners in Do Not Disturb)'),
    (13523, 'modules/notifications/native/playInAppMessageSound.tsx', ['playInAppMessageSound'], 'playInAppMessageSound (Banners in Do Not Disturb: no sound)'),
    (1447, '../discord_common/js/packages/rtn-codegen/js/NativeMediaManagerModule.tsx', ['default'], 'NativeMediaManagerModule (Download voice messages)'),
    (9976, 'modules/messages/native/snowflake/MessageDataSnowflakeUtils.tsx', ['getNativeSyntheticEventData'], 'MessageDataSnowflakeUtils (Download voice messages)'),
    (9839, 'modules/messages/native/emoji/MessageEmojiActionSheet.tsx', ['default'], 'MessageEmojiActionSheet (Clone emojis and stickers)'),
    (10078, 'modules/stickers/native/StickerDetailActionSheet.tsx', ['default'], 'StickerDetailActionSheet (Clone emojis and stickers)'),
    (9845, 'actions/EmojiActionCreators.tsx', ['uploadEmoji'], 'EmojiActionCreators (Clone emojis and stickers)'),
    (10058, 'modules/stickers/StickersActionCreators.tsx', ['createGuildSticker'], 'StickersActionCreators (Clone emojis and stickers)'),
    (8294, 'utils/GuildBoostingUtils.tsx', ['getMaxEmojiSlots', 'getTotalStickerCountForTier'], 'GuildBoostingUtils (Clone emojis and stickers: free slots)'),
    (5075, 'modules/chat/native/useChatLayout.tsx', ['default', 'getChatLayout'], 'useChatLayout (Full-screen chat in landscape)'),
    (5133, 'design/components/Icon/native/redesign/generated/UserPlatformIcon.tsx', ['UserPlatformIcon'], 'UserPlatformIcon (Platform spoof)'),
    (6473, 'design/components/Icon/native/redesign/generated/CheckmarkLargeIcon.tsx', ['CheckmarkLargeIcon'], 'CheckmarkLargeIcon'),
    (9386, 'design/components/Icon/native/redesign/generated/ScreenIcon.tsx', ['ScreenIcon'], 'ScreenIcon'),
    (13745, 'design/components/Icon/native/redesign/generated/PencilSparkleIcon.tsx', ['PencilSparkleIcon'], 'PencilSparkleIcon (Local edit)'),
    (14205, 'design/components/Icon/native/redesign/generated/UserClockIcon.tsx', ['UserClockIcon'], 'UserClockIcon (Custom idle)'),
    (18679, 'design/components/Icon/native/redesign/generated/ChannelListIcon.tsx', ['ChannelListIcon'], 'ChannelListIcon (Fast delete channels)'),
    (18747, 'design/components/Icon/native/redesign/generated/HomeIcon.tsx', ['HomeIcon'], 'HomeIcon (HypeSquad)'),
    (10596, 'modules/channel/native/ChannelLongPressActionSheet.tsx', ['default'], 'ChannelLongPressActionSheet (Fast delete channels menu row)'),
    (17245, 'modules/threads/native/components/ThreadLongPressActionSheet.tsx', ['default'], 'ThreadLongPressActionSheet (View raw data menu row)'),
    (10780, 'modules/action_sheet/native/components/LongPressForumPostActionSheet.tsx', ['default'], 'LongPressForumPostActionSheet (View raw data menu row)'),
    (12003, 'design/components/Icon/native/redesign/generated/FileIcon.tsx', ['FileIcon'], 'FileIcon (View raw data)'),
    (8488, 'design/components/Icon/native/redesign/generated/ForumIcon.tsx', ['ForumIcon'], 'ForumIcon (View raw data)'),
    (13951, 'design/components/Icon/native/redesign/generated/ShieldLockIcon.tsx', ['ShieldLockIcon'], 'ShieldLockIcon (View raw data)'),
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
    lines = ['# Metro modules Conduit uses', '',
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
