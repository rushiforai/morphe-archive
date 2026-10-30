package app.hushmessenger.patches.controls

import org.junit.jupiter.api.extension.BeforeEachCallback
import org.junit.jupiter.api.extension.ExtensionContext
import org.junit.jupiter.api.extension.TestInstanceFactoryContext
import org.junit.jupiter.api.extension.TestInstancePreConstructCallback

/** The synthetic notifications preference read. */
internal const val PREFERENCE_GETTER = "Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z"

/**
 * The mapping the synthetic fixtures are written against. Discovery matches what code does, not what a class is
 * called, so these names are only labels the fixtures and the validators share. They started out as one older
 * build's names. The native tests check the real supported builds against ControlProfiles.kt.
 */
internal val syntheticHooks: Map<String, Set<String>> = mapOf(
    COMMUNITY_INBOX to setOf("LX/2GW;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"),
    "stories" to setOf("LX/1mi;->A00()Z"),
    "facebook" to setOf(
        "LX/Sc2;->A06()Z", "LX/YFi;->A04()Z", "LX/2aP;->A0C()Z", "LX/3Ec;->A00()Z",
        "LX/3me;->A00()Z", "LX/HFd;->A02()Z", "LX/HRL;->A06()Z", "LX/HRM;->A02()Z",
        "LX/JiY;->A06()Z", "LX/Jir;->A02()Z", "LX/JjE;->A00()Z", "LX/JjM;->A01()Z",
        "LX/JjO;->A02()Z", "LX/JjQ;->A02()Z",
        "LX/JjY;->A01()Z", "LX/JjZ;->A01()Z", "LX/Jjb;->A06()Z", "LX/Jjc;->A06()Z", "LX/Jjd;->A06()Z",
    ),
    FACEBOOK_PROFILE to setOf("LX/JjV;->A03()Z", "LX/JjW;->A03()Z"),
    FACEBOOK_PROFILE_HEADER to setOf(SYNTHETIC_PROFILE_HEADER),
    "ai_menu" to setOf("LX/HFe;->A00()Z", "LX/HFe;->A01()Z", "LX/Jiu;->A00()Z", "LX/Jiu;->A01()Z"),
    "ai_fab" to setOf("LX/6k8;->render(LX/2MZ;)LX/1GG;"),
    "ai_sticker_cell" to setOf("LX/R3i;->render(LX/2ED;)LX/1IG;"),
    "ai_sticker_grid" to setOf("LX/CZ2;->render(LX/2ED;)LX/1IG;"),
    "subtabs" to setOf("LX/2UL;->run()V"),
    "typing" to setOf("LX/Ahp;->run()V"),
    "typing_mailbox" to setOf("LX/8eb;->A0I(Ljava/lang/String;Z)LX/325;"),
    "bubbles" to setOf("LX/2ZW;->A00()Z"),
    "bubble_mode" to setOf("LX/2ZW;->A01(Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "browser" to setOf("Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;->A0L(Landroid/net/Uri;Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "people_jewel" to setOf(PEOPLE_JEWEL_HOOK),
    "people_tab" to setOf("LX/JZ6;->A01(LX/JZ6;)V"),
    "people_search" to setOf("LX/CX5;->DLP(LX/EA8;Ljava/lang/Object;)LX/EBu;"),
    "people_story" to setOf("Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;->" +
        "A0Y(Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;)V"),
    INBOX_REFRESH_HOOK to setOf("$INBOX_SUPPLIER->A0B()$IMMUTABLE_LIST"),
    "allow_screenshot" to setOf(
        "LX/N2h;->run()V",
        "Lcom/facebook/screenshot/ScreenshotContentObserver;->onChange(ZLandroid/net/Uri;)V",
        "LX/8xp;->onScreenCaptured()V",
        "LX/4nW;->A00(Landroid/view/Window;)V",
    ),
    "screenshot_viewers" to screenshotViewerHooks(),
    HIDE_READ_RECEIPTS to setOf(SYNTHETIC_CHAT_SEEN),
    REPLY_READ to setOf(SYNTHETIC_SEND_EVENT),
    "keep_unsent" to setOf("LX/SH3;->A01(Landroid/content/Intent;Lcom/facebook/auth/usersession/FbUserSession;Ljava/lang/String;Ljava/util/Map;)V"),
    "anonymous_stories" to setOf("LX/HNV;->C1V(${MONTAGE_CARD}Z)V", STORY_PREVIEW_INIT),
    APP_ICONS to setOf("LX/7Ya;->A02($FB_USER_SESSION)Z", "LX/7Ya;->A03(Landroid/content/Context;$FB_USER_SESSION)Z"),
    "save_stories" to setOf("LX/JgG;->onClick(Landroid/view/View;)V"),
    "growth_notes" to setOf("Lcom/facebook/presence/note/ui/nux/controller/NotesNuxController;->" +
        "A01(Landroidx/fragment/app/Fragment;LX/Ocr;Ljava/util/List;LX/5MS;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;"),
    "growth_story_card" to setOf("Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;->" +
        "A0x(Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;)Z"),
    "unsent_indicator" to setOf("LX/K1Y;->BWo(I)Ljava/lang/String;"),
    "delta_unsent" to setOf("LX/K1Y;->Btd(I)Z"),
    "ai_search" to setOf("LX/5OA;->A0A(LX/5OA;)Z", "LX/5OA;->A0B(LX/5OA;)Z"),
    "ai_search_chip" to setOf("LX/D8E;->render(LX/2MZ;)LX/1GG;"),
    "emoji_typeface" to setOf("LX/1KV;->A00()Landroid/graphics/Typeface;"),
    ANALYTICS_UPLOADS to setOf(
        "LX/0c0;->onStartCommand(Landroid/content/Intent;II)I",
        "LX/0c0;->onStartJob(Landroid/app/job/JobParameters;)Z",
        "LX/2Hd;->A05(LX/3Pq;Ljava/lang/String;)V",
        "LX/T7W;->run()V",
        "LX/Wq1;->run()V",
        "Lcom/facebook/analytics2/logger/GooglePlayUploadService;->onStartCommand(Landroid/content/Intent;II)I",
        "Lcom/facebook/analytics2/logger/legacy/uploader/AlarmBasedUploadService;->onStartCommand(Landroid/content/Intent;II)I",
        "Lcom/facebook/analytics2/logger/legacy/uploader/HighPriUploadRetryReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;->onStartCommand(Landroid/content/Intent;II)I",
        "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;->onStartJob(Landroid/app/job/JobParameters;)Z",
        "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;->onStartCommand(Landroid/content/Intent;II)I",
        "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;->onStartJob(Landroid/app/job/JobParameters;)Z",
    ),
    ATTRIBUTION_UPLOADS to setOf(ATTRIBUTION_WORKER),
    AD_EVENTS to setOf(SYNTHETIC_INBOX_VISIBILITY, SYNTHETIC_AD_ENTRY),
    MQTT_TELEMETRY to setOf(SYNTHETIC_MQTT_PUBLISH, SYNTHETIC_MQTT_KEEPALIVE),
    PINNED_CHATS to setOf(SYNTHETIC_PINNED_CHAT_LIMIT),
    NEARBY_SCANS to setOf(SYNTHETIC_NEARBY_SCAN_SCHEDULER, SYNTHETIC_SCAN_RESULT_READER),
    WIFI_IDENTITY to setOf(SYNTHETIC_WIFI_NAME_READER, SYNTHETIC_WIFI_BSSID_READER),
    PHONE_ID_SYNC to setOf(SYNTHETIC_PHONE_ID_LIST, SYNTHETIC_PHONE_ID_SYNC),
    STORY_HOLD to setOf(SYNTHETIC_STORY_COMPLETION),
    SHARE_STORY to setOf(SYNTHETIC_HOISTED_STORY, SYNTHETIC_UNHOISTED_STORY),
    AVATAR_SHAPE to setOf(SYNTHETIC_VITO_ROUNDING, SYNTHETIC_LEGACY_ROUNDING, SYNTHETIC_TILE_SHAPE, SYNTHETIC_TILE_SETUP, SYNTHETIC_TILE_PLACEHOLDER),
    QUIET_CALL_RING to setOf(SYNTHETIC_RING_DECISION),
    QUIET_CALL_NOTIFICATION to setOf(SYNTHETIC_CALL_POSTER),
    MARK_READ_BAR to setOf(SYNTHETIC_MARK_READ_BAR, SYNTHETIC_MARK_READ_FACTORY),
    MARK_READ_CLICK to setOf(SYNTHETIC_MARK_READ_CLICK),
    TEXT_STYLE to setOf(SYNTHETIC_TEXT_FIELD_FOCUS),
    MESSAGE_LOG to setOf(newMessageNotificationCtor("LX/5qJ;", "LX/5Yc;")),
    AUTO_REPLY to setOf(newMessageNotificationCtor("LX/5qJ;", "LX/5Yc;")),
    EMOJI_SEARCH to setOf("LX/7TX;->A8Y(Landroid/text/Editable;Z)V"),
    TAB_BADGES to setOf(SYNTHETIC_TAB_BADGES),
    FACEBOOK_BADGE to setOf(SYNTHETIC_FACEBOOK_BADGE),
    TAB_CONFIG to setOf(SYNTHETIC_TAB_CONFIG),
    AI_MENTIONS to setOf(SYNTHETIC_MENTION_AI, SYNTHETIC_IMAGINE, SYNTHETIC_COMMUNITY_AI),
    AI_COMMANDS to setOf(SYNTHETIC_AI_COMMANDS),
    AI_SEARCH_HINT to setOf(SYNTHETIC_SEARCH_BAR),
    AI_SEARCH_SCREEN_HINT to setOf(SYNTHETIC_SEARCH_SCREEN),
    AI_MENTION_ROWS to setOf(SYNTHETIC_META_AI_ROW, SYNTHETIC_META_AI_CHATS_ROW, SYNTHETIC_META_AI_ENCRYPTED_ROW,
        SYNTHETIC_IMAGINE_ROW, SYNTHETIC_IMAGINE_YOURSELF_ROW),
    XHE_AUDIO to setOf(SYNTHETIC_SHARE_COPY),
    XHE_TRANSCODE to setOf(VIDEO_TRANSCODE),
    DISAPPEARING_SWIPE to setOf(OVERSCROLL_START),
    RECENT_MEDIA to setOf(RECENT_MEDIA_DETECTOR),
    EMOJI_DRAWER to setOf(DRAWER_RENDERER, DRAWER_EFFECT),
    "original_photo" to ORIGINAL_PHOTO_HOOKS,
    ORIGINAL_VIDEO to setOf(VIDEO_TRANSCODE),
    SYSTEM_CAMERA to setOf("LX/7Jp;->DXV($MONTAGE_PARAMS$NAVIGATION_TRIGGER)V", CHAT_CAMERA_FACTORY, CHAT_CAMERA_START, CHAT_CAPTURE, THIRD_PARTY_URI_CHECK,
        INTERNAL_FILE_OPEN),
    EXTERNAL_GALLERY to setOf(GALLERY_HANDLER, GALLERY_PLUGIN, CHAT_CAMERA_START, "LX/7Rm;->onActivityResult(IILandroid/content/Intent;)V", GALLERY_ITEMS),
    FONT_LAYOUT to setOf(FONT_LAYOUT_SETTER),
    FONT_REPOSITORY to setOf(FONT_RESOLVER),
    FONT_ROBOTO to setOf(FONT_ROBOTO_BUILDER),
    FONT_BY_NAME to setOf(FONT_BY_NAME_LOOKUP),
    FONT_INPUT to setOf(FONT_INPUT_FIELD, FONT_INPUT_ALIGNED, FONT_INPUT_HINTED),
    "avatar_tabs" to setOf("$COMPOSER_FACTORY->A0S()$IMMUTABLE_LIST"),
    "menu_settings" to setOf(
        "LX/9rv;->A1i()V",
        "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;",
        "LX/TxV;->CAo(LX/4jw;I)V",
        "LX/Txc;->A0I(Ljava/util/List;)V",
        "LX/Jwp;->onClick(Landroid/view/View;)V",
    ),
    "chat_animation" to setOf(FRAGMENT_ANIMATION),
    "chat_fragment" to setOf("LX/1hl;-><init>()V"),
    "chat_inbox" to setOf("LX/1fs;-><init>()V"),
    "chat_legacy" to setOf("LX/1hd;->onCreateAnimation(IZI)$ANIMATION"),
    "people" to setOf("LX/1pm;->A0C()Z", "LX/2Wl;->A04()Z"),
    "people_list_end" to setOf("LX/1pm;->A0B()Z", "LX/2Wl;->A03()Z"),
    "friend_requests" to setOf("LX/1pm;->A09()Z", "LX/2Wl;->A02()Z"),
    "growth" to setOf("LX/1pm;->A0A()Z", "LX/2GE;->A0A(LX/2GE;)Z"),
    "moments" to setOf("LX/HFe;->A05()Z", "LX/Jiu;->A05()Z"),
    "ai_stickers" to setOf("LX/PKW;->A03(LX/PKW;)Z", "LX/PKz;->A07(LX/PKz;)Z"),
    "avatar_stickers" to setOf("LX/PKW;->A01(LX/PKW;)Z"),
    "inbox_promotions" to setOf("LX/2Ef;->A0J()Z", "LX/2Ef;->A0K()Z"),
    "chat_promotions" to setOf("LX/ThP;->A0D()Z", "LX/ThP;->A0E()Z"),
    AD_CONTEXT_BANNER to setOf(SYNTHETIC_AD_BANNER_GATE),
    "suggested_replies" to setOf("LX/7Sd;->A06(LX/7Sd;)Z", "LX/7Tb;->A05(LX/7Tb;)Z", "LX/ThO;->A05()Z"),
    "business_suggestions" to setOf("LX/7Sd;->A05(LX/7Sd;)Z", "LX/7Tb;->A04(LX/7Tb;)Z", "LX/ThO;->A04()Z"),
    "event_prompts" to setOf("LX/ThP;->A07()Z", "LX/ThP;->A08()Z"),
    "reels_badge" to setOf("LX/7xF;->A09(LX/7xF;)Z"),
    "ai_toolbar" to setOf("LX/2aP;->A04()Z"),
    "ai_tab" to setOf("LX/1iN;->A02(LX/1iN;)Z"),
    AI_MUSE_TAB to setOf("LX/1iN;->A01(LX/1iN;)Z"),
    TAB_PEOPLE to setOf("LX/1iN;->A0D(LX/1iN;)Z"),
    TAB_NOTIFICATIONS to setOf("LX/1iN;->A08(LX/1iN;)Z"),
    "mark_read_action" to setOf("LX/KHu;->A0W()Z", "LX/MKS;->A0F()Z"),
)

/**
 * Every test starts on [SYNTHETIC_PROFILE], from before its class is built, and a test of a real build picks that
 * build's profile itself. JUnit loads this through META-INF/services, with extension autodetection switched on in
 * junit-platform.properties.
 */
class SyntheticProfileExtension : TestInstancePreConstructCallback, BeforeEachCallback {
    override fun preConstructTestInstance(factoryContext: TestInstanceFactoryContext, context: ExtensionContext) = reset()
    override fun beforeEach(context: ExtensionContext) = reset()
    private fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        controlProfilesInUse = controlProfiles
    }
}

/** The other values the synthetic fixtures pin, next to [syntheticHooks]. */
internal val SYNTHETIC_PROFILE = ControlProfile(
    hooks = syntheticHooks,
    pluginSentinel = "LX/1dj;->A03:Ljava/lang/Object;",
    preferenceGetter = PREFERENCE_GETTER,
    peopleKey = "LX/JTx;->A01:LX/1BL;",
    peopleFlagCheck = "LX/16z;->A1Z(Ljava/lang/Object;J)Z",
    subtabsSupplier = "LX/2UL;->A00:Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;",
    browserPreferenceKey = "LX/1D1;->A1U:LX/1BK;",
    browserPreferenceIndex = 60,
    bubbleCapabilityGetter = "LX/1hy;->A03(Lcom/facebook/auth/usersession/FbUserSession;I)Z",
    bubbleRolloutGetter = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;->Ah8(J)Z",
    nativeBubbleRoutes = "LX/8qv;->A02(Landroid/graphics/Bitmap;LX/0MX;Lcom/facebook/auth/usersession/FbUserSession;LX/8qz;Lcom/facebook/messaging/model/threads/ThreadSummary;LX/6ev;Lcom/facebook/push/constants/PushProperty;Z)V|LX/8qx;->A04(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/facebook/messaging/model/threadkey/ThreadKey;Ljava/lang/String;)LX/8qz;|LX/MP1;->A04(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/facebook/auth/usersession/FbUserSession;LX/MP1;Lcom/facebook/messaging/model/threads/ThreadSummary;)Z",
    nativeCommunityInbox = "LX/1k3;->A0G(LX/1k3;LX/1mM;Ljava/lang/String;Z)V|LX/2GW;-><init>(Lcom/facebook/auth/usersession/FbUserSession;LX/2Fu;LX/2GC;LX/2GU;LX/2EW;LX/2GR;LX/4mt;LX/4sx;LX/1lQ;Lcom/facebook/mig/scheme/interfaces/MigColorScheme;LX/4pk;Lcom/google/common/collect/ImmutableList;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Z)V|LX/1mE;->A01()LX/1lQ;|LX/1k3;->A0H(LX/1k3;LX/1lQ;)V|LX/2WR;->A03:Lcom/facebook/messaging/model/threads/ThreadSummary;|LX/2hK;->A03(Lcom/facebook/messaging/model/threads/ThreadSummary;)Z|Lcom/facebook/messaging/model/threadkey/ThreadKey;->A0o(Lcom/facebook/messaging/model/threadkey/ThreadKey;)Z|Lcom/facebook/messaging/model/threadkey/ThreadKey;->A1J()Z|Lcom/facebook/messaging/model/threadkey/ThreadKey;->A1W()Z|LX/1lQ;->A0E:LX/1lQ;|LX/2GW;->\$prefixOffsetCallback:LX/4mt;|LX/1kf;->A00:LX/1k3;|LX/1k3;->A0Y:LX/1mE;|LX/1mE;->A07:LX/1mH;|LX/1mH;->A01:LX/1ma;|LX/1ma;->A00:LX/1mZ;|LX/1mZ;->A00()LX/1V4;|LX/1V4;->A0L:LX/1V4;",
)
