package app.template.patches.telegram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ════════════════════════════════════════════════════════════════════════════════
// Telegram shared fingerprints
// Primary target: Telegram Android 12.10.4 (versionCode 70992).
// Cross-variant notes below are retained where Web/Plus signatures are known.
// Do not treat cross-variant comments as bytecode verification of 12.10.3.
// AccessFlags are omitted where known variants differ (e.g. protected vs public).
// ════════════════════════════════════════════════════════════════════════════════

// ─── Premium ──────────────────────────────────────────────────────────────────

val UserConfigIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "isPremium",
    returnType = "Z",
)

val MessagesControllerIsPremiumUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPremiumUser",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)

val StoriesControllerIsPremiumFingerprint = Fingerprint(
    definingClass = "Lsg/o5;",
    name = "isPremium",
    returnType = "Z",
    parameters = listOf("J"),
)

val StoriesControllerPremiumComparatorFingerprint = Fingerprint(
    definingClass = "Lah/x7;",
    name = "compare",
    returnType = "I",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
            ref?.definingClass == "Lorg/telegram/tgnet/TLRPC\$User;" && ref.name == "premium"
        } == true
    },
)

// ─── Integrity bypass ─────────────────────────────────────────────────────────

val AndroidUtilitiesGetCertFingerprintFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/AndroidUtilities;",
    name = "getCertificateSHA256Fingerprint",
    returnType = "Ljava/lang/String;",
)

val SafetyNetCheckFingerprint = Fingerprint(
    filters = listOf(
        string("basicIntegrity"),
        string("ctsProfileMatch"),
    ),
)

// ─── Ads ──────────────────────────────────────────────────────────────────────

val ChatActivityAddSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/no;",
    name = "s6",
    returnType = "V",
)

val MessagesControllerIsSponsoredDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSponsoredDisabled",
    returnType = "Z",
)

val MessageObjectIsSponsoredFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSponsored",
    returnType = "Z",
)

val VideoAdsLoadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/video/VideoAds;",
    name = "load",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE),
)

// ─── Auto-update ──────────────────────────────────────────────────────────────

val CheckAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    name = "H0",
    returnType = "V",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;", "Z"),
)

val BlockingUpdateViewShowFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    name = "H0",
    returnType = "V",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;", "Z"),
)

val SharedConfigIsAppUpdateAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "isAppUpdateAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val SharedConfigSetNewAppVersionAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "setNewAppVersionAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"),
)

val MessagesControllerCheckPromoInfoInternalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkPromoInfoInternal",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf("Z"),
)

// ─── No-forwards ──────────────────────────────────────────────────────────────

val MessagesControllerIsChatNoForwardsLongFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val MessagesControllerIsChatNoForwardsChatFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)

val MessagesControllerIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPeerNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val ChatActivityIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

val ProfileActivityIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ProfileActivity;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

val CanForwardMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "canForwardMessage",
    returnType = "Z",
    parameters = listOf(),
)

val ChatActivityHasSelectedNoforwardsMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "Z8",
    returnType = "Z",
)

val ChatActivityShowTextSelectionHintFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "Sb",
    returnType = "V",
    parameters = listOf("Lorg/telegram/messenger/MessageObject;"),
)

// ─── Channel restrictions ──────────────────────────────────────────────────────

val GetRestrictionReasonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getRestrictionReason",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)

val MessagesControllerIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSensitive",
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)

val ShowCantOpenAlertFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/q2;", "Ljava/lang/String;"),
)

val CheckChannelErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkChannelError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J"),
)

val CheckSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/q2;",
        "J",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

val ShowSensitiveContentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showSensitiveContent",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSensitive",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsHiddenSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isHiddenSensitive",
    returnType = "Z",
    parameters = listOf(),
)

val CreateNoAccessAlertFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/d5;",
    name = "F",
    returnType = "Lorg/telegram/ui/ActionBar/AlertDialog\$Builder;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

val LoadFullChatErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "checkChannelError",
        ),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/HashSet;" && ref.name == "remove"
        } == true
    },
)

val GetChannelDiffErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "checkChannelError",
        ),
        methodCall(
            definingClass = "Lorg/telegram/messenger/NotificationCenter;",
            name = "postNotificationName",
        ),
    ),
)

val SetContentSettingsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "setContentSettings",
    returnType = "V",
    parameters = listOf("Z"),
)

// ─── Anti-delete ──────────────────────────────────────────────────────────────

val MarkMessagesAsDeletedFingerprint1 = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    custom = { method, classDef ->
        classDef.type == "Lorg/telegram/messenger/MessagesStorage;" &&
            method.name == "markMessagesAsDeleted" &&
            method.returnType == "Ljava/util/ArrayList;" &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes[0] == "J" &&
            method.parameterTypes[1] == "I" &&
            method.parameterTypes[2] == "Z" &&
            method.parameterTypes[3] == "Z"
    },
)

val MarkMessagesAsDeletedFingerprint2 = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    custom = { method, classDef ->
        classDef.type == "Lorg/telegram/messenger/MessagesStorage;" &&
            method.name == "markMessagesAsDeleted" &&
            method.returnType == "Ljava/util/ArrayList;" &&
            method.parameterTypes.size == 6 &&
            method.parameterTypes[0] == "J" &&
            method.parameterTypes[1] == "Ljava/util/ArrayList;" &&
            method.parameterTypes[2] == "Z" &&
            method.parameterTypes[3] == "Z" &&
            method.parameterTypes[4] == "I" &&
            method.parameterTypes[5] == "I"
    },
)

val DeleteMessagesByPushFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "deleteMessagesByPush",
    returnType = "V",
    parameters = listOf("J", "Ljava/util/ArrayList;", "J"),
)

val NotificationsControllerRemoveDeletedMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/NotificationsController;",
    name = "removeDeletedMessagesFromNotifications",
    returnType = "V",
    parameters = listOf("Lz/f;", "Z"),
)

// ─── Anti-disappearing media ──────────────────────────────────────────────────

val IsSecretMediaInstanceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(),
)

val IsSecretMediaStaticFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

val IsSecretPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

val ShouldEncryptPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$Message;"),
)

val IsVoiceOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce",
    returnType = "Z",
)

val IsRoundOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce",
    returnType = "Z",
)

val SendSecretMediaDeleteFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "N4",
    returnType = "Lorg/telegram/messenger/video/k;",
    parameters = listOf("Lorg/telegram/ui/po;", "Lorg/telegram/messenger/MessageObject;"),
)

val SendSecretMessageReadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "db",
    returnType = "Lorg/telegram/ui/ef;",
    parameters = listOf("Lorg/telegram/messenger/MessageObject;", "Z"),
)

val SecretMediaViewerClosePhotoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/SecretMediaViewer;",
    name = "e",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Z", "Z"),
)

// ─── Download boost ───────────────────────────────────────────────────────────

val FileLoadOperationUpdateParamsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/FileLoadOperation;",
    name = "updateParams",
    returnType = "V",
    parameters = listOf(),
)

// ─── Stories / translate / misc premium UI ────────────────────────────────────

val ApplicationLoaderOnCreateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

val MessagesControllerStoriesEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storiesEnabled",
    returnType = "Z",
)

val MessagesControllerStoryEntitiesAllowedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storyEntitiesAllowed",
    returnType = "Z",
    parameters = listOf(),
)

val MessagesControllerStoryEntitiesAllowedUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storyEntitiesAllowed",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)

val StoriesControllerHasStoriesFingerprint = Fingerprint(
    definingClass = "Lsg/o5;",
    name = "hasStories",
    returnType = "Z",
    parameters = listOf(),
)

val StoriesControllerMarkStoryAsReadFingerprint = Fingerprint(
    definingClass = "Lsg/o5;",
    name = "markStoryAsRead",
    returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;"),
)

val PeerStoriesViewAllowScreenshotsFingerprint = Fingerprint(
    definingClass = "Lsg/i3;",
    name = "d",
    returnType = "Z",
)

val TranslateControllerIsTranslateDialogHiddenFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/TranslateController;",
    name = "isTranslateDialogHidden",
    returnType = "Z",
    parameters = listOf("J"),
)

val ProfileActivityIsSwipeBackEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ProfileActivity;",
    name = "isSwipeBackEnabled",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

val ChatActivityIsSwipeBackEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ActionBar/q2;",
    name = "isSwipeBackEnabled",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

val MediaDataControllerLoadPinnedMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MediaDataController;",
    name = "loadPinnedMessages",
    returnType = "V",
    parameters = listOf("J", "I", "I"),
)

val MessageObjectIsVoiceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoice",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsMusicFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isMusic",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessageObject;",
            name = "isMusicMessage",
        ),
    ),
)

val MessageObjectNeedDrawBluredPreviewFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "needDrawBluredPreview",
    returnType = "Z",
    parameters = listOf(),
)

val SendScreenshotMessageUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SendMessagesHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;",
        "I",
        "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)

val SendScreenshotMessageSecretFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SecretChatHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;",
        "Ljava/util/ArrayList;",
        "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)

val MessagesControllerIsUserNoForwardsLongFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isUserNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val MessagesControllerIsUserNoForwardsUserFullFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isUserNoForwards",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)

val ChatPullingDownDrawableGetNextFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/mq;",
    name = "c",
    returnType = "Lorg/telegram/tgnet/TLRPC\$Dialog;",
    parameters = listOf("J", "I", "I", "Z", "[I"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val ChatPullingDownDrawableDrawBottomPanelFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/mq;",
    name = "b",
    returnType = "V",
)

val ChatPullingDownDrawableNeedDrawBottomPanelFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/mq;",
    name = "e",
    returnType = "Z",
)

val UserConfigGetMaxAccountCountFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "getMaxAccountCount",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val UserConfigHasPremiumOnAccountsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "hasPremiumOnAccounts",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val SharedConfigGetDevicePerformanceClassFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "getDevicePerformanceClass",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val MessagesControllerSponsoredMessagesResponseFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    custom = { method, _ ->
        method.name.startsWith("lambda\$getSponsoredMessages\$") &&
            method.implementation?.instructions?.any { instr ->
                val ref = (instr as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
                ref?.definingClass == "Lorg/telegram/messenger/MessageObject;" &&
                    ref.name == "sponsoredId"
            } == true
    },
)

val MessagesControllerGetSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getSponsoredMessages",
    returnType = "Lorg/telegram/messenger/MessagesController\$SponsoredMessagesInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("J"),
)

val MessageObjectUpdateMessageTextFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "updateMessageText",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

val DialogCellBuildLayoutFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Cells/t2;",
    name = "buildLayout",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "getRestrictionReason",
        ),
    ),
)

val DialogCellUpdateMessageThumbsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Cells/t2;",
    name = "updateMessageThumbs",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "getRestrictionReason",
        ),
    ),
)

val PremiumFeaturesBlockedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "premiumFeaturesBlocked",
    returnType = "Z",
)

val PlusUpdaterCheckAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/update/PlusUpdater;",
    name = "checkAppUpdate",
    returnType = "V",
)

val PlusSettingsIsUpdateEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ActionBar/PlusSettings;",
    name = "isUpdateEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val AdsControllerAdsDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsController;",
    name = "adsDisabled",
    returnType = "Z",
)

val AdsInstanceLoadAdsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadAds",
    returnType = "V",
)

val AdsInstanceLoadNativeAdFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadNativeAd",
    parameters = listOf(
        "Landroid/content/Context;",
        "Z",
        "Lorg/telegram/plus/ads/AdsInstance\$AdsInstanceInterface;",
    ),
)

val PlusSendTypingFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "sendTyping",
    returnType = "Z",
    parameters = listOf("J", "J", "I", "I"),
)

val AnalyticsEnableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "enableAnalytics",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
)

val AnalyticsTrackEventFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

val AnalyticsTrackEventMapFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/HashMap;"),
)

val ChatActivityEnterViewHandleRichHtmlPasteFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/ChatActivityEnterView;",
    name = "handleRichHtmlPaste",
    returnType = "Z",
    parameters = listOf(),
)

val PhotoViewerC2Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/PhotoViewer;",
    name = "C2",
    returnType = "V",
    parameters = listOf("I", "Z", "Z", "Z"),
)

val FileLoaderCanSaveToPublicStorageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/FileLoader;",
    name = "canSaveToPublicStorage",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf("Ljava/lang/Object;"),
)

val PhotoViewerG2Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/PhotoViewer;",
    name = "G2",
    returnType = "V",
    parameters = listOf("I", "Z", "Z", "Z"),
)

val ChatActivitySaveToDownloadsGateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ao;",
    name = "a0",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/ui/Cells/v1;"),
)

val MessageObjectNeedDrawShareButtonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "needDrawShareButton",
    returnType = "Z",
    parameters = listOf(),
)

val ChatActivityForwardMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/po;",
    name = "s8",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/ArrayList;",
        "Z",
        "Z",
        "Z",
        "I",
        "J",
    ),
)

val TelegramRichPasteFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/du;",
    name = "onTextContextMenuItem",
    returnType = "Z",
    parameters = listOf("I"),
)
