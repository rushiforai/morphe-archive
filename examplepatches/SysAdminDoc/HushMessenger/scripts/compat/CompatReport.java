package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.Bubbles.*;
import static compat.Coexist.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/**
 * The compatibility report: the patch and control tables, recorded profiles, discovery, Kotlin output,
 * the APK checks and main. The checks for each family of patches live beside it in this package, and
 * scripts/CompatReport.java compiles them all and runs this class.
 */
public class CompatReport {

    static final String PACKAGE = "com.facebook.orca";

    static final String FACEBOOK_SIGNER =
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1";
    static final String META_SIGNER =
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27";

    static final String IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;";
    static final String PREFERENCES = "Lcom/facebook/prefs/shared/FbSharedPreferences;";
    static final String MONTAGE_CARD = "Lcom/facebook/messaging/montage/model/MontageCard;";
    static final String MONTAGE_BUCKET_PREVIEW = "Lcom/facebook/messaging/montage/model/MontageBucketPreview;";
    static final String ANIMATION = "Landroid/view/animation/Animation;";
    static final String FRAGMENT_ANIMATION = "Landroidx/fragment/app/Fragment;->onCreateAnimation(IZI)" + ANIMATION;
    static final String PEOPLE_TAB_FETCH = "Lcom/facebook/messaging/peopletab/segments/friendrequests/usecase/"
        + "PeopleTabPYMKHandler$fetchPymkSuggestions$$inlined$CoroutineExceptionHandler$1;";
    static final String PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden";
    static final String STORY_CARD_DATE_KEY = "last_date_creation_card_shown";
    // The Notifications tab's server flag ID as 587 numbers it (586 read 72344145666062935). Meta renumbers it with each release.
    static final long PEOPLE_SERVER_FLAG = 72344137076128710L;
    // The redesigned emoji drawer's server flag as 587 numbers it (586 read 36320416708509435). Meta renumbers it with each release.
    static final long EMOJI_DRAWER_FLAG = 36320360873934571L;
    // The drawer renderer throws this when the redesign can't draw, which ties the flag to the emoji drawer
    static final String EMOJI_DRAWER_ANCHOR = "Cannot render redesigned drawer with search icon ";
    // The server test that swaps the chat list's search bar for a top bar icon, as 587 numbers it (586 read 0x810b0200004674). Meta renumbers it with each release.
    static final long SEARCH_ICON_FLAG = 0x810af1000046adL;
    // Only the method that builds the top bar's search icon names this class, which ties the flag to the search bar
    static final String SEARCH_ICON_ANCHOR = "com.facebook.messaging.search.plugins.toolbarbutton.searchbutton.InboxSearchToolbarButtonImplementation";
    // Controls whose hook count follows how Redex inlined one flag read, so it differs between releases and between
    // builds of one release: 586's family B (347215273, 275 and 277) reads the emoji drawer once and the font three times, and 587 reads the chat preview flag in three methods
    static final Set<String> RELEASE_HOOK_COUNTS = Set.of("chat_preview", "emoji_drawer", "font_roboto", "inbox_search_bar", "pinned_chats");

    // Material You theme finds its targets by shape when it patches (MaterialYouPatch.kt), so no profile records them
    static final String DARK_SCHEME = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;";
    static final String LIGHT_SCHEME = "Lcom/facebook/mig/scheme/schemes/LightColorScheme;";
    static final String FDS_COLORS = "Lcom/facebook/fds/core/theme/component/FDSColors;";
    static final Set<Integer> DARK_SURFACES = Set.of(0xFF080809, 0xFF1C1C1D, 0xFF252728, 0xFF333334, 0xFF323339);
    static final Set<String> COLOR_CALLS = Set.of(
        "Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I", "Landroid/content/Context;->getColor(I)I");

    static final String FACEBOOK_PROFILE_BUTTON =
        "Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/facebookprofile/ThreadSettingsFacebookProfileActionButton;";
    static final Set<String> FACEBOOK_PLUGINS = Set.of(
        "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;",
        "Lcom/facebook/messaging/marketplace/plugins/folder/navbarmenuitem/NavBarMenuItemImplementation;",
        FACEBOOK_PROFILE_BUTTON,
        "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/fbshortcutsfoldersection/FacebookShortcutsFolderSection;",
        "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/subscriptionsfoldersection/SubscriptionsFolderSection;",
        "Lcom/facebook/messaging/communitymessaging/plugins/channelinvite/sharetofacebookbutton/ShareToFacebookButtonImplementation;",
        "Lcom/facebook/messaging/publicchats/plugins/externalsharehscrollbuttons/sharetofacebook/ShareToFacebookHScrollButtonImplementation;"
    );

    static final Map<String, Set<String>> PLUGIN_GATE_ANCHORS = Map.ofEntries(
        Map.entry("people", Set.of("com.facebook.messaging.friending.plugins.inboxunit.InboxPeopleYouMayKnowSectionKillSwitch")),
        Map.entry("people_list_end", Set.of("com.facebook.messaging.friending.plugins.inboxthreadlistend.InboxPYMKThreadListEndKillSwitch")),
        Map.entry("friend_requests", Set.of("com.facebook.messaging.friending.plugins.friendrequestinboxunit.FriendingFriendrequestinboxunitKillSwitch")),
        Map.entry("growth", Set.of("com.facebook.messaging.friending.plugins.growthpromotioninboxunit.FriendingGrowthpromotioninboxunitKillSwitch")),
        Map.entry("moments", Set.of("com.facebook.messaging.navigation.plugins.momentsfolder.NavigationMomentsfolderKillSwitch")),
        Map.entry("ai_stickers", Set.of(
            "com.facebook.stickers.keyboardls.generatedtab.plugins.core.KeyboardlsGeneratedtabCoreKillSwitch",
            "com.facebook.messaging.suggestedkeyboard.plugins.core.composer.rows.genai.GenAiSearchSuggestedRow"
        )),
        Map.entry("avatar_stickers", Set.of("com.facebook.stickers.keyboardls.avatartab.plugins.core.KeyboardlsAvatartabCoreKillSwitch")),
        Map.entry("inbox_promotions", Set.of(
            "com.facebook.messaging.quickpromotion.plugins.threadlist.QuickpromotionThreadlistKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadlistmsys.QuickpromotionThreadlistmsysKillSwitch"
        )),
        Map.entry("chat_promotions", Set.of(
            "com.facebook.messaging.quickpromotion.plugins.threadview.QuickpromotionThreadviewKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadviewmsys.QuickpromotionThreadviewmsysKillSwitch"
        )),
        Map.entry("ad_context_banner", Set.of("com.facebook.messaging.nativepagereply.plugins.adscontextprovider.threadviewbanner.CTMAdsThreadViewBannerImplementation")),
        Map.entry("suggested_replies", Set.of("com.facebook.messaging.business.plugins.suggestedreply.SuggestedReplyKillSwitch")),
        Map.entry("business_suggestions", Set.of("com.facebook.messaging.business.plugins.suggestasyoutype.SAYTKillSwitch")),
        Map.entry("event_prompts", Set.of("com.facebook.messaging.events.plugins.qp.EventsQpKillSwitch")),
        Map.entry("reels_badge", Set.of("com.facebook.messaging.reels.plugins.badge.ReelsBadgeKillSwitch")),
        Map.entry("ai_toolbar", Set.of("com.facebook.messaging.inbox.tab.plugins.core.tabtoolbarbutton.aihomebutton.AiHomeButtonKillSwitch")),
        Map.entry("ai_tab", Set.of("com.facebook.messaging.aibot.plugins.tab.tabcontent.MetaAiTabContentImplementation")),
        Map.entry("ai_muse_tab", Set.of("com.facebook.messaging.aiagent.plugins.tab.tabcontent.MuseTabContentImplementation")),
        Map.entry("tab_people", Set.of("com.facebook.messaging.peopletab.plugins.tab.tabcontent.PeopleTabContentImplementation")),
        Map.entry("tab_notifications", Set.of("com.facebook.messaging.inbox.jewel.jeweltab.plugins.core.tabcontent.JewelTabContentImplementation")),
        Map.entry("mark_read_action", Set.of("com.facebook.messaging.threadlist.threaditemmenu.plugins.core.markreadmenuitem.MarkReadMenuItemImplementation"))
    );

    static final String APP_COMMUNICATION = "com.facebook.permission.prod.FB_APP_COMMUNICATION";
    static final String RECEIVER_ACCESS = "com.facebook.receiver.permission.ACCESS";
    static final String APP_COMMUNICATION_FORMAT = "com.facebook.permission.%s.FB_APP_COMMUNICATION";
    static final Set<String> DEX_NAMES = Set.of(APP_COMMUNICATION, RECEIVER_ACCESS, APP_COMMUNICATION_FORMAT);
    /** The Kotlin constant InstallBesideMetaAppsPatch.kt writes each shared name as. */
    static final Map<String, String> DEX_NAME_CONSTANTS = Map.of(
        APP_COMMUNICATION, "APP_COMMUNICATION",
        RECEIVER_ACCESS, "RECEIVER_ACCESS",
        APP_COMMUNICATION_FORMAT, "APP_COMMUNICATION_FORMAT"
    );

    static final Map<String, Integer> EXPECTED_MANIFEST_MENTIONS = Map.of(
        APP_COMMUNICATION, 26, RECEIVER_ACCESS, 3
    );

    // Patch name -> hook keys
    static final Map<String, List<String>> PATCHES = new LinkedHashMap<>();
    static {
        PATCHES.put("Hide People You May Know", List.of("people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story",
            "people_inbox_refresh"));
        PATCHES.put("Hide friend request cards", List.of("friend_requests"));
        PATCHES.put("Hide joined community chats", List.of("community_inbox"));
        PATCHES.put("Hide growth prompts", List.of("growth", "growth_active_status", "growth_notes", "growth_story_card"));
        PATCHES.put("Hide inbox promotions", List.of("inbox_promotions"));
        PATCHES.put("Hide stories and notes", List.of("stories", "story_ring"));
        PATCHES.put("Hide inbox tabs", List.of("subtabs"));
        PATCHES.put("Typing in your chat list", List.of("inbox_typing"));
        PATCHES.put("Put your words above the photo", List.of("media_caption"));
        PATCHES.put("Keep the search bar", List.of("inbox_search_bar"));
        PATCHES.put("Preview chats on long press", List.of("chat_preview"));
        PATCHES.put("Bigger chat preview", List.of("chat_preview_size"));
        PATCHES.put("Hide Mark as read", List.of("mark_read_action"));
        PATCHES.put("Pin more chats", List.of("pinned_chats", "pin_rows", "pin_ask", "pin_drop", "pin_full", "pin_list"));
        PATCHES.put("Hide chosen chats", List.of("hidden_chat_list", "hidden_chat_row", "hidden_chat_tap"));
        PATCHES.put("Hide chat menu items", List.of("chat_menu_items"));
        PATCHES.put("Hide Facebook shortcuts", List.of("facebook", "facebook_profile", "facebook_profile_header"));
        PATCHES.put("Hide Meta AI", List.of("ai_menu", "ai_fab", "ai_toolbar", "ai_tab", "ai_muse_tab", "ai_search", "ai_search_chip", "ai_mentions", "ai_commands", "ai_search_hint", "ai_search_screen_hint", "ai_mention_rows", "ai_summary", "tab_config"));
        PATCHES.put("Hide Chat Moments", List.of("moments"));
        PATCHES.put("Hide Reels badge", List.of("reels_badge"));
        PATCHES.put("Hide People tab", List.of("tab_people", "tab_config"));
        PATCHES.put("Show People tab", List.of("tab_config"));
        PATCHES.put("Show settings tab", List.of("tab_config"));
        PATCHES.put("Hide Notifications tab", List.of("tab_notifications", "tab_config"));
        PATCHES.put("Hide Stories tab", List.of("tab_config"));
        PATCHES.put("Hide tab labels", List.of("tab_labels"));
        PATCHES.put("Your own tab icons", List.of("tab_icons"));
        PATCHES.put("Hide tab badges", List.of("tab_badges", "facebook_badge"));
        PATCHES.put("Hide the tab bar while scrolling", List.of("tab_bar_scroll_away", "tab_bar_overlay"));
        PATCHES.put("Floating tab bar", List.of("floating_tab_bar"));
        PATCHES.put("Swipe between tabs", List.of("tab_swipe"));
        PATCHES.put("Hold stories at the end", List.of("story_hold"));
        PATCHES.put("Hide AI sticker tools", List.of("ai_stickers", "ai_sticker_cell", "ai_sticker_grid"));
        PATCHES.put("Hide avatar stickers", List.of("avatar_stickers", "avatar_tabs"));
        PATCHES.put("Restore old emoji drawer", List.of("emoji_drawer"));
        PATCHES.put("Keep emoji search on emoji", List.of("emoji_search"));
        PATCHES.put("Hide chat promotions", List.of("chat_promotions"));
        PATCHES.put("Hide ad banners in business chats", List.of("ad_context_banner"));
        PATCHES.put("Hide business reply suggestions", List.of("suggested_replies"));
        PATCHES.put("Hide business typing suggestions", List.of("business_suggestions"));
        PATCHES.put("Hide event prompts", List.of("event_prompts"));
        PATCHES.put("Hide typing indicator", List.of("typing", "typing_mailbox"));
        PATCHES.put("Open web links externally", List.of("browser"));
        PATCHES.put("Allow chat bubbles", List.of("bubbles", "bubble_mode"));
        PATCHES.put("Use system emoji", List.of("emoji_typeface"));
        PATCHES.put("Send photos at original quality", List.of("original_photo"));
        PATCHES.put("Send videos without re-encoding", List.of("original_video"));
        PATCHES.put("Fix videos that won't send", List.of("xhe_audio", "xhe_transcode"));
        PATCHES.put("Ignore the swipe up for disappearing messages", List.of("disappearing_swipe"));
        PATCHES.put("Hide the recent photo card", List.of("recent_media"));
        PATCHES.put("Save voice messages you play", List.of("save_voice"));
        PATCHES.put("Save button for voice messages", List.of("save_voice_menu"));
        PATCHES.put("Customize message actions", List.of("message_actions", "message_actions_more"));
        PATCHES.put("Hide the Instants button", List.of("instants_button"));
        PATCHES.put("Hide Your story when sharing", List.of("share_story", "share_story_target"));
        PATCHES.put("Hide pictures on the Blocked list", List.of("blocked_list_pictures"));
        PATCHES.put("Notify for restricted chats", List.of("restricted_notify"));
        PATCHES.put("Use the phone's camera app", List.of("system_camera"));
        PATCHES.put("Open your gallery app", List.of("external_gallery", "gallery_temp_file"));
        PATCHES.put("Put gallery picks in the chat", List.of("gallery_to_chat"));
        PATCHES.put("Paste a photo into the chat", List.of("paste_photo"));
        PATCHES.put("Send Instants from your gallery", List.of("instant_gallery"));
        PATCHES.put("Offer View once in every chat", List.of("view_once_anywhere"));
        PATCHES.put("Special contacts", List.of("special_contacts", "hidden_chat_list", "hidden_chat_row", "hidden_chat_tap"));
        PATCHES.put("Play video links in the chat", List.of("link_player"));
        PATCHES.put("Stop analytics uploads", List.of("analytics_uploads"));
        PATCHES.put("Stop ad attribution uploads", List.of("attribution_uploads"));
        PATCHES.put("Stop inbox and ad link logging", List.of("ad_events"));
        PATCHES.put("Stop attention time logging", List.of("dwell_tracking"));
        PATCHES.put("Stop live connection logging", List.of("mqtt_telemetry"));
        PATCHES.put("Stop nearby scans", List.of("nearby_scans", "wifi_identity"));
        PATCHES.put("Stop app list and device ID sharing", List.of("phone_id_sync"));
        PATCHES.put("Skip passkey sign-in", List.of("passkey_login"));
        PATCHES.put("Keep a message log", List.of("message_log", "unsent_recall", "unsent_clear", "message_log_button", "message_log_click",
            "quiet_log_check", "quiet_log_drop", "hidden_chat_list", "hidden_chat_row", "hidden_chat_tap"));
        PATCHES.put("Auto reply", List.of("auto_reply"));
        PATCHES.put("Quiet incoming calls", List.of("quiet_call_ring", "quiet_call_notification"));
        PATCHES.put("Quiet mode", List.of("quiet_mode", "quiet_call_ring", "quiet_call_notification"));
        PATCHES.put("Android Auto messages", List.of("car_messages", "car_extension_gate"));
        PATCHES.put("Search saved messages", List.of("local_chat_search"));
        PATCHES.put("Jump to the first message or a date", List.of("chat_jump"));
        PATCHES.put("Allow landscape", List.of("landscape_lock", "landscape_media"));
        PATCHES.put("Record calls", List.of("call_recording"));
        PATCHES.put("Live captions on calls", List.of("call_recording"));
        PATCHES.put("Hide call buttons", List.of("hide_call_bar", "hide_call_lists"));
        PATCHES.put("Ask before a call", List.of("hide_call_bar", "call_button_built"));
        PATCHES.put("Allow screenshots", List.of("allow_screenshot", "screenshot_viewers"));
        PATCHES.put("Block screenshots in chats", List.of("secure_chat"));
        PATCHES.put("Invisible buttons", List.of("invisible_buttons"));
        PATCHES.put("Translucent chat bars", List.of("ios_bars"));
        PATCHES.put("Appear offline", List.of("appear_offline", "availability_setting"));
        PATCHES.put("Hide read receipts", List.of("hide_read_receipts", "reply_read", "delivery_receipt"));
        PATCHES.put("Mark chats read on this phone", List.of("local_read"));
        PATCHES.put("Mark as read button", List.of("mark_read_bar", "mark_read_click"));
        PATCHES.put("Keep unsent messages", List.of("keep_unsent", "unsent_indicator", "delta_unsent", "unsent_recall", "unsent_clear"));
        PATCHES.put("Unlock app icons", List.of("app_icons"));
        PATCHES.put("Unlock app themes", List.of("app_themes", "app_theme_pick"));
        PATCHES.put("Square profile pictures", List.of("avatar_shape", "story_ring"));
        PATCHES.put("Your own home header", List.of("home_header"));
        PATCHES.put("Use your own font", List.of("font_layout", "font_repository", "font_roboto", "font_by_name", "font_input"));
        PATCHES.put("Blur behind menus", List.of("menu_blur"));
        PATCHES.put("View stories anonymously", List.of("anonymous_stories"));
        PATCHES.put("Save any story", List.of("save_stories"));
        PATCHES.put("Slide chats in and out", List.of("chat_animation", "chat_fragment", "chat_inbox", "chat_legacy"));
        PATCHES.put("Bold and italic text", List.of("text_style"));
        PATCHES.put("Open settings from menu", List.of("menu_settings"));
        PATCHES.put("Keep chat pop-ups", List.of("chat_channel_keep", "chat_channel_raise"));
        PATCHES.put("Fix videos in chat heads", List.of("chat_head_video"));
    }

    static final Set<String> ORIGINAL_PHOTO_HOOKS = Set.of(
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->getTranscodeConfig()Ljava/util/Map;",
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->decodeBitmap(Ljava/lang/String;DD)Landroid/graphics/Bitmap;",
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->transcodeImage(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B",
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->transcodeImageAsync(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Lcom/facebook/msys/mci/TranscodeImageCompletionCallback;)V");
    static final String ORIGINAL_VIDEO_HOOK = "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->A05(" +
        "Lcom/facebook/msys/mci/TranscodeVideoCompletionCallback;Lcom/facebook/msys/mci/VideoEdits;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V";

    /** Every control key, in patch order. */
    static final Set<String> CONTROL_KEYS = new LinkedHashSet<>();
    static {
        for (var keys : PATCHES.values()) CONTROL_KEYS.addAll(keys);
    }

    /**
     * ControlProfile's values besides the hooks, in constructor order, and the controls whose
     * validators pin each one. Discovery reads them from the same instructions.
     */
    static final Map<String, Set<String>> FIELD_CONTROLS = new LinkedHashMap<>();
    static {
        // The @ suggestion hook checks its sections' disabled marker against the same sentinel.
        var sentinelControls = new LinkedHashSet<>(PLUGIN_GATE_ANCHORS.keySet());
        sentinelControls.add("ai_mentions");
        FIELD_CONTROLS.put("pluginSentinel", sentinelControls);
        FIELD_CONTROLS.put("preferenceGetter", Set.of("browser", "people_jewel"));
        FIELD_CONTROLS.put("peopleKey", Set.of("people_jewel"));
        FIELD_CONTROLS.put("peopleFlagCheck", Set.of("people_jewel"));
        FIELD_CONTROLS.put("subtabsSupplier", Set.of("subtabs"));
        FIELD_CONTROLS.put("browserPreferenceKey", Set.of("browser"));
        FIELD_CONTROLS.put("browserPreferenceIndex", Set.of("browser"));
        FIELD_CONTROLS.put("bubbleCapabilityGetter", Set.of("bubble_mode"));
        FIELD_CONTROLS.put("bubbleRolloutGetter", Set.of("bubble_mode"));
        FIELD_CONTROLS.put("nativeBubbleRoutes", Set.of("bubbles", "bubble_mode"));
        FIELD_CONTROLS.put("nativeCommunityInbox", Set.of("community_inbox"));
    }
    static final Set<String> NUMBER_FIELDS = Set.of("browserPreferenceIndex");
    static final String PERMISSION_LOADS = "Install beside Meta apps";

    /**
     * What the patches pin for one build. scripts/profiles/<version code>.txt records it one
     * value per line: "hook <control> <method>", "<field> <value>" and "dexSite <site> <name>".
     */
    static final class Profile {
        String version = "", code = "", sha256 = "";
        final Map<String, Set<String>> hooks = new TreeMap<>();
        final Map<String, String> fields = new HashMap<>();
        final Map<String, String> dexSites = new TreeMap<>();

        boolean sameControls(Profile other) {
            return hooks.equals(other.hooks) && fields.equals(other.fields);
        }

        List<String> lines() {
            var lines = new ArrayList<String>();
            lines.add("# Messenger " + version + " (" + code + "), written by CompatReport.java --save. Record the APK again instead of editing this.");
            lines.add("version " + version);
            lines.add("code " + code);
            lines.add("sha256 " + sha256);
            hooks.forEach((key, ids) -> new TreeSet<>(ids).forEach(id -> lines.add("hook " + key + " " + id)));
            for (var name : FIELD_CONTROLS.keySet()) {
                if (fields.containsKey(name)) lines.add(name + " " + fields.get(name));
            }
            dexSites.forEach((site, name) -> lines.add("dexSite " + site + " " + name));
            return lines;
        }

        static Profile read(Path file) throws IOException {
            var p = new Profile();
            for (var line : Files.readAllLines(file)) {
                if (line.isBlank() || line.startsWith("#")) continue;
                var parts = line.split(" ", 3);
                int needs = "hook".equals(parts[0]) || "dexSite".equals(parts[0]) ? 3 : 2;
                if (parts.length < needs) throw new Unreadable(file + ": malformed line " + line);
                switch (parts[0]) {
                    case "version" -> p.version = parts[1];
                    case "code" -> p.code = parts[1];
                    case "sha256" -> p.sha256 = parts[1];
                    case "hook" -> p.hooks.computeIfAbsent(parts[1], key -> new TreeSet<>()).add(parts[2]);
                    case "dexSite" -> p.dexSites.put(parts[1], parts[2]);
                    default -> {
                        if (!FIELD_CONTROLS.containsKey(parts[0])) throw new Unreadable(file + ": unknown line " + line);
                        p.fields.put(parts[0], line.substring(parts[0].length() + 1));
                    }
                }
            }
            return p;
        }
    }

    /** The directory this report was started from, as a source file or as a compiled class. */
    static Path scriptDir() {
        String source = System.getProperty("jdk.launcher.sourcefile");
        if (source != null) return Path.of(source).toAbsolutePath().getParent();
        try {
            return Path.of(CompatReport.class.getProtectionDomain().getCodeSource().getLocation().toURI());
        } catch (Exception e) {
            return Path.of("scripts");
        }
    }

    static final Path PROFILES = scriptDir().resolve("profiles");

    /** Python 3 from PATH: the py launcher first on Windows, then python3 or python. */
    static List<String> python() throws IOException {
        boolean win = System.getProperty("os.name", "").toLowerCase().contains("win");
        String path = System.getenv("PATH");
        for (var name : win ? List.of("py", "python3", "python") : List.of("python3", "python")) {
            for (var dir : (path == null ? "" : path).split(File.pathSeparator)) {
                if (dir.isBlank()) continue;
                Path exe;
                try { exe = Path.of(dir.strip(), win ? name + ".exe" : name); } catch (InvalidPathException e) { continue; }
                // WindowsApps holds the Store's python stubs, which open the Store instead of running a script.
                if (!Files.isRegularFile(exe) || (win && exe.toString().toLowerCase().contains("\\windowsapps\\"))) continue;
                return "py".equals(name) ? List.of(exe.toString(), "-3") : List.of(exe.toString());
            }
        }
        throw new IOException("verify_compat_patch.py needs Python 3. Put the py launcher, python3 or python on PATH");
    }

    /** Discovery isn't patch application. Never publish a profile on discovery evidence alone. */
    static boolean verifyPatch(File apk, String apkHash, Path desktop, Path bundle) throws IOException, InterruptedException {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) throw new IOException("Android Build Tools aapt2 is required to validate the rebuilt APK");
        var command = new ArrayList<>(python());
        command.addAll(List.of(scriptDir().resolve("verify_compat_patch.py").toString(),
            "--apk", apk.getAbsolutePath(), "--apk-sha256", apkHash, "--desktop", desktop.toAbsolutePath().toString(),
            "--bundle", bundle.toAbsolutePath().toString(), "--java",
            Path.of(System.getProperty("java.home"), "bin", "java").toString(), "--aapt2", aapt2));
        var names = new TreeSet<>(PATCHES.keySet());
        names.addAll(List.of("Install beside Meta apps", "Restore screens on re-signed builds", "Material You theme", CLONE));
        for (var name : names) { command.add("--enable"); command.add(name); }
        return new ProcessBuilder(command).inheritIO().start().waitFor() == 0;
    }

    /** A damaged APK or record. That isn't an incompatible build, so the report names the file and exits 2. */
    static final class Unreadable extends IOException {
        Unreadable(String message) {
            super(message);
        }
    }

    /** Version code -> recorded build. */
    static Map<String, Profile> recorded(Path dir) throws IOException {
        var builds = new TreeMap<String, Profile>();
        if (!Files.isDirectory(dir)) return builds;
        try (var files = Files.list(dir)) {
            for (var file : files.filter(f -> f.toString().endsWith(".txt")).sorted().toList()) {
                var build = Profile.read(file);
                builds.put(build.code, build);
            }
        }
        return builds;
    }

    /**
     * True when a method copies a list into a fresh ImmutableList.Builder exactly once, through one static
     * (Builder, Iterable) -> ImmutableList call straight after ImmutableList.builder() on that builder, and no branch,
     * switch case or catch lands on the copy, since the patch's hook goes just before it. Mirrors
     * validateKeyboardTabsInline in ControlHooks.kt.
     */
    static boolean keyboardTabCopy(Method method) {
        String builder = "Lcom/google/common/collect/ImmutableList$Builder;";
        var c = instructions(method); var copies = new ArrayList<Integer>();
        for (int i = 0; i < c.size(); i++) if (c.get(i).getOpcode() == Opcode.INVOKE_STATIC && c.get(i) instanceof ReferenceInstruction r &&
            r.getReference() instanceof MethodReference m && IMMUTABLE_LIST.equals(m.getReturnType()) &&
            m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(builder, "Ljava/lang/Iterable;"))) copies.add(i);
        if (copies.size() != 1) return false;
        int at = copies.get(0);
        if (at < 2 || mediaTargets(method).contains(at)) return false;
        if (c.get(at - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || c.get(at - 2).getOpcode() != Opcode.INVOKE_STATIC ||
            !(c.get(at - 2) instanceof ReferenceInstruction made) ||
            !(IMMUTABLE_LIST + "->builder()" + builder).equals(made.getReference().toString())) return false;
        int made1 = ((OneRegisterInstruction) c.get(at - 1)).getRegisterA();
        var add = (FiveRegisterInstruction) c.get(at);
        return add.getRegisterCount() == 2 && add.getRegisterC() == made1 && add.getRegisterD() != made1;
    }

    /** "586.0.0.55.92 (version code 347215348)", joined with " or " across version names. */
    static String supported(Map<String, Profile> builds) {
        var codes = new TreeMap<String, List<String>>();
        for (var build : builds.values()) codes.computeIfAbsent(build.version, v -> new ArrayList<>()).add(build.code);
        return codes.entrySet().stream()
            .map(e -> e.getKey() + " (version code " + String.join(" or ", e.getValue()) + ")")
            .collect(Collectors.joining(" or "));
    }

    /** A value that didn't resolve: what it is, the controls that need it, and why. */
    record Problem(String label, Set<String> controls, String detail) {
        @Override public String toString() {
            return label + ": " + detail;
        }
    }

    /**
     * Why a discovered profile can't be written. Every recorded build has the same number of hooks
     * per control and the same permission loads by name, so a new build must too. An empty list
     * means every control resolved.
     */
    static List<Problem> unresolved(Profile found, Collection<Profile> recorded) {
        var problems = new ArrayList<Problem>();
        // Builds of one release share every other count. A new release is held to any recorded build's counts, except
        // where the count follows Redex's inlining of one flag read, which needs only one hook or more in any build.
        Profile sameRelease = recorded.stream().filter(p -> p.version.equals(found.version)).findFirst().orElse(null);
        Profile shape = sameRelease != null ? sameRelease : recorded.isEmpty() ? null : recorded.iterator().next();
        for (var key : CONTROL_KEYS) {
            int count = found.hooks.getOrDefault(key, Set.of()).size();
            int expected = shape == null ? Math.max(count, 1) : shape.hooks.getOrDefault(key, Set.of()).size();
            if (RELEASE_HOOK_COUNTS.contains(key) && count >= 1) continue;
            if (count != expected) problems.add(new Problem(key, Set.of(key), "expected " + expected + " hooks, found " + count));
        }
        for (var entry : FIELD_CONTROLS.entrySet()) {
            if (found.fields.containsKey(entry.getKey())) continue;
            var label = entry.getValue().size() > 2 ? "plugin gates" : String.join(", ", new TreeSet<>(entry.getValue()));
            problems.add(new Problem(label, entry.getValue(), entry.getKey() + " not found"));
        }
        if (shape != null) {
            var names = new ArrayList<>(found.dexSites.values());
            var expected = new ArrayList<>(shape.dexSites.values());
            Collections.sort(names);
            Collections.sort(expected);
            if (!names.equals(expected)) {
                problems.add(new Problem(PERMISSION_LOADS, Set.of(PERMISSION_LOADS),
                    "expected " + expected.size() + " permission loads, found " + names.size()));
            }
        }
        return problems;
    }

    /** How a patch's controls differ from the recorded build. */
    static List<String> differences(Profile expected, Profile found, List<String> keys) {
        var failures = new ArrayList<String>();
        for (var key : keys) {
            var want = expected.hooks.getOrDefault(key, Set.of());
            var got = found.hooks.getOrDefault(key, Set.of());
            if (!want.equals(got)) {
                failures.add(key + ": expected " + want.size() + " hooks " + want + ", found " + got.size() + " " + got);
            }
        }
        for (var entry : FIELD_CONTROLS.entrySet()) {
            if (Collections.disjoint(entry.getValue(), keys)) continue;
            var want = expected.fields.get(entry.getKey());
            var got = found.fields.get(entry.getKey());
            if (!Objects.equals(want, got)) failures.add(entry.getKey() + ": expected " + want + ", found " + got);
        }
        return failures;
    }

    static List<Instruction> instructions(Method method) {
        var code = new ArrayList<Instruction>();
        if (method.getImplementation() != null) method.getImplementation().getInstructions().forEach(code::add);
        return code;
    }

    static String ref(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ri ? ri.getReference().toString() : null;
    }

    static int register(Instruction instruction) {
        return instruction instanceof OneRegisterInstruction r ? r.getRegisterA() : -1;
    }

    /** Every plugin gate compares its cached answer with one "not computed yet" sentinel. */
    static String pluginSentinel(Map<String, List<Method>> controls) {
        var sentinels = new TreeSet<String>();
        for (var key : PLUGIN_GATE_ANCHORS.keySet()) {
            for (var method : controls.getOrDefault(key, List.of())) {
                if (!pluginGateShape(method)) return null;
                var code = instructions(method);
                sentinels.add(ref(code.get(code.size() - 4)));
            }
        }
        return sentinels.size() == 1 ? sentinels.first() : null;
    }

    /**
     * ControlHooks.kt's validatePluginGate, but for the sentinel, which the profile pins: a local v0, the cache read into
     * v0 from this, 1 and 0 loaded into two locals nothing later writes, and a tail that reads the same cache into v1,
     * compares it with the sentinel and returns the 1 or skips to the 0.
     */
    static boolean pluginGateShape(Method method) {
        var impl = method.getImplementation();
        if (impl == null) return false;
        int registers = impl.getRegisterCount(), words = AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1;
        for (var type : method.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        var code = instructions(method);
        // Fewer than eight instructions can't hold both the head and the tail.
        if (registers <= words || code.size() < 8) return false;
        var tail = code.subList(code.size() - 5, code.size());
        if (!tail.stream().map(Instruction::getOpcode).toList().equals(
                List.of(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.RETURN, Opcode.RETURN))) return false;
        if (code.get(0).getOpcode() != Opcode.IGET_OBJECT || code.get(1).getOpcode() != Opcode.CONST_4 ||
            code.get(2).getOpcode() != Opcode.CONST_4) return false;
        var first = (TwoRegisterInstruction) code.get(0);
        int enabled = register(code.get(1)), disabled = register(code.get(2));
        if (first.getRegisterA() != 0 || first.getRegisterB() != registers - 1 || !Long.valueOf(1L).equals(wide(code.get(1))) ||
            !Long.valueOf(0L).equals(wide(code.get(2))) || enabled < 2 || enabled >= registers - 1 || disabled < 2 ||
            disabled >= registers - 1 || enabled == disabled) return false;
        var rethrown = rethrowOnlyWrites(code, impl.getTryBlocks());
        for (int k = 3; k < code.size(); k++) {
            if (!rethrown.contains(k) && (writes(code.get(k), enabled) || writes(code.get(k), disabled))) return false;
        }
        var cache = (TwoRegisterInstruction) tail.get(0);
        var compare = (TwoRegisterInstruction) tail.get(2);
        return cache.getRegisterA() == 1 && cache.getRegisterB() == first.getRegisterB() &&
            Objects.equals(ref(tail.get(0)), ref(code.get(0))) && register(tail.get(1)) == 0 &&
            compare.getRegisterA() == 1 && compare.getRegisterB() == 0 && ((OffsetInstruction) tail.get(2)).getCodeOffset() == 3 &&
            register(tail.get(3)) == enabled && register(tail.get(4)) == disabled;
    }

    /** Whether the instruction writes the register, counting the high half of a wide write. */
    static boolean writes(Instruction i, int register) {
        if (!i.getOpcode().setsRegister() || !(i instanceof OneRegisterInstruction one)) return false;
        int written = one.getRegisterA();
        return written == register || (i.getOpcode().setsWideRegister() && written + 1 == register);
    }

    static final Set<Opcode> RETURNS = EnumSet.of(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT);

    /**
     * ControlHooks.kt's rethrowOnlyWrites: the move-exception writes that can only be rethrown. From the move-exception
     * to the first throw nothing returns, branches or switches out, writes the caught register again or sits inside a
     * try block, and that throw rethrows the caught register.
     */
    static Set<Integer> rethrowOnlyWrites(List<Instruction> code, List<? extends com.android.tools.smali.dexlib2.iface.TryBlock<?>> tryBlocks) {
        var addresses = new int[code.size() + 1];
        for (int k = 0; k < code.size(); k++) addresses[k + 1] = addresses[k] + code.get(k).getCodeUnits();
        var found = new HashSet<Integer>();
        for (int start = 0; start < code.size(); start++) {
            if (code.get(start).getOpcode() != Opcode.MOVE_EXCEPTION) continue;
            int caught = register(code.get(start)), end = -1;
            for (int k = start + 1; k < code.size() && end < 0; k++) if (code.get(k).getOpcode() == Opcode.THROW) end = k;
            if (end < 0 || register(code.get(end)) != caught) continue;
            int from = addresses[start], to = addresses[end + 1];
            if (tryBlocks.stream().anyMatch(b -> b.getStartCodeAddress() < to && from < b.getStartCodeAddress() + b.getCodeUnitCount())) continue;
            boolean closed = true;
            for (int k = start + 1; k < end && closed; k++) {
                var i = code.get(k);
                Integer target = i instanceof OffsetInstruction o ? addresses[k] + o.getCodeOffset() : null;
                closed = !RETURNS.contains(i.getOpcode()) && !writes(i, caught) &&
                    (target == null || (target >= addresses[start + 1] && target <= addresses[end]));
            }
            if (closed) found.add(start);
        }
        return found;
    }

    record PreferenceRead(int index, String key, String getter) {}

    /** The check's register count and false-default register; it returns when the answer is on. As in ControlHooks.kt. */
    static final Set<Integer> BROWSER_PREFERENCE_REGISTERS = Set.of(8, 9);
    static final int BROWSER_PREFERENCE_DEFAULT = 2;

    /** The one boolean preference read the external-browser check branches on. */
    static PreferenceRead browserPreferenceRead(List<Method> browser) {
        if (browser.size() != 1 || !BROWSER_PREFERENCE_REGISTERS.contains(browser.get(0).getImplementation().getRegisterCount())) return null;
        var code = instructions(browser.get(0));
        PreferenceRead read = null;
        for (int k = 0; k + 3 < code.size(); k++) {
            if (code.get(k).getOpcode() != Opcode.SGET_OBJECT || register(code.get(k)) != 0 ||
                !(code.get(k + 1) instanceof FiveRegisterInstruction call) || call.getOpcode() != Opcode.INVOKE_INTERFACE ||
                call.getRegisterCount() != 3 || call.getRegisterC() != 1 || call.getRegisterD() != 0 ||
                call.getRegisterE() != BROWSER_PREFERENCE_DEFAULT ||
                !(((ReferenceInstruction) call).getReference() instanceof MethodReference getter) ||
                !PREFERENCES.equals(getter.getDefiningClass()) || !"Z".equals(getter.getReturnType()) ||
                code.get(k + 2).getOpcode() != Opcode.MOVE_RESULT || register(code.get(k + 2)) != 0 ||
                code.get(k + 3).getOpcode() != Opcode.IF_NEZ || register(code.get(k + 3)) != 0) continue;
            if (read != null) return null;
            read = new PreferenceRead(k, ref(code.get(k)), getter.toString());
        }
        return read;
    }

    /** The Notifications tab's preference key and its server-override check, checked as validatePeopleSection does. */
    static List<String> peopleSection(List<Method> jewel, String getter) {
        if (jewel.size() != 1 || jewel.get(0).getImplementation() == null) return null;
        var code = instructions(jewel.get(0));
        // The false default is a local loaded at 9, past v0 and v1 and below the two parameters, as in ControlHooks.kt.
        int registers = jewel.get(0).getImplementation().getRegisterCount();
        Integer no = code.size() > 9 && code.get(9).getOpcode() == Opcode.CONST_4 && register(code.get(9)) >= 2 &&
            register(code.get(9)) < registers - 2 ? Integer.valueOf(register(code.get(9))) : null;
        // The server flag loads at 17.
        var flags = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.CONST_WIDE && code.get(i) instanceof WideLiteralInstruction flag &&
                flag.getWideLiteral() == PEOPLE_SERVER_FLAG) flags.add(i);
        }
        if (no == null || flags.size() != 1 || flags.get(0) != 17) return null;
        int at = flags.get(0), last = code.size() - 1;
        // Both branches return the false default, so nothing between the getter and the server branch may overwrite it.
        for (int i = 10; i <= Math.min(at + 3, last); i++) {
            var opcode = code.get(i).getOpcode();
            int target = register(code.get(i));
            if (opcode.setsRegister() && (target == no || (opcode.setsWideRegister() && target + 1 == no))) return null;
        }
        // Both branches land on the final return of the false default, after the "hidden" true return.
        if (code.size() < at + 7 || register(code.get(at)) != 0 ||
            code.get(at + 1).getOpcode() != Opcode.INVOKE_STATIC ||
            code.get(at + 2).getOpcode() != Opcode.MOVE_RESULT || register(code.get(at + 2)) != 0 ||
            code.get(at + 3).getOpcode() != Opcode.IF_NEZ || register(code.get(at + 3)) != 0 ||
            !jumpsTo(code, 12, last) || !jumpsTo(code, at + 3, last) ||
            code.get(last).getOpcode() != Opcode.RETURN || register(code.get(last)) != no ||
            code.get(last - 1).getOpcode() != Opcode.RETURN || register(code.get(last - 1)) != 0 ||
            code.get(last - 2).getOpcode() != Opcode.CONST_4 ||
            !(code.get(last - 2) instanceof NarrowLiteralInstruction one) || one.getNarrowLiteral() != 1 ||
            code.get(8).getOpcode() != Opcode.SGET_OBJECT || register(code.get(8)) != 0 ||
            code.get(9).getOpcode() != Opcode.CONST_4 || register(code.get(9)) != no ||
            !(code.get(9) instanceof NarrowLiteralInstruction zero) || zero.getNarrowLiteral() != 0 ||
            code.get(10).getOpcode() != Opcode.INVOKE_INTERFACE || !getter.equals(ref(code.get(10))) ||
            !(code.get(10) instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 3 ||
            call.getRegisterC() != 1 || call.getRegisterD() != 0 || call.getRegisterE() != no ||
            code.get(11).getOpcode() != Opcode.MOVE_RESULT || register(code.get(11)) != 0 ||
            code.get(12).getOpcode() != Opcode.IF_EQZ || register(code.get(12)) != 0) return null;
        return List.of(ref(code.get(8)), ref(code.get(at + 1)));
    }

    static final String SUBTABS_SUPPLIER_CLASS =
        "Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;";

    /**
     * The supplier field the inbox tabs run() reads, once the body is ControlHooks.kt's validateSubtabs shape: three
     * registers, the supplier into v0 from this, its A07 holder into v0, the holder's AtomicBoolean into v1, 1 into v0,
     * then v1.set(v0).
     */
    static String subtabsSupplier(List<Method> subtabs) {
        if (subtabs.size() != 1 || subtabs.get(0).getImplementation() == null ||
            subtabs.get(0).getImplementation().getRegisterCount() != 3) return null;
        var code = instructions(subtabs.get(0));
        if (!code.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
            Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID))) return null;
        var supplier = (TwoRegisterInstruction) code.get(0);
        var holder = (TwoRegisterInstruction) code.get(1);
        var flag = (TwoRegisterInstruction) code.get(2);
        var set = (FiveRegisterInstruction) code.get(4);
        var holderRef = (FieldReference) ((ReferenceInstruction) code.get(1)).getReference();
        var flagRef = (FieldReference) ((ReferenceInstruction) code.get(2)).getReference();
        boolean shaped = supplier.getRegisterA() == 0 && supplier.getRegisterB() == 2 && holder.getRegisterA() == 0 &&
            holder.getRegisterB() == 0 && flag.getRegisterA() == 1 && flag.getRegisterB() == 0 &&
            register(code.get(3)) == 0 && Long.valueOf(1L).equals(wide(code.get(3))) &&
            set.getRegisterCount() == 2 && set.getRegisterC() == 1 && set.getRegisterD() == 0 &&
            holderRef.getDefiningClass().equals(SUBTABS_SUPPLIER_CLASS) && holderRef.getName().equals("A07") &&
            flagRef.getDefiningClass().equals(holderRef.getType()) && flagRef.getName().equals("A00") &&
            flagRef.getType().equals("Ljava/util/concurrent/atomic/AtomicBoolean;") &&
            "Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V".equals(ref(code.get(4)));
        return shaped ? ref(code.get(0)) : null;
    }

    /** Everything the patches pin, read from the APK's DEX. Values that don't resolve are left out. */
    static Profile discover(List<ClassDef> classes, Map<String, List<Method>> controls) {
        var found = new Profile();
        controls.forEach((key, methods) -> {
            if (!methods.isEmpty()) {
                found.hooks.put(key, methods.stream().map(CompatReport::hookId).collect(Collectors.toCollection(TreeSet::new)));
            }
        });
        var sentinel = pluginSentinel(controls);
        if (sentinel != null) found.fields.put("pluginSentinel", sentinel);
        var read = browserPreferenceRead(controls.get("browser"));
        if (read != null) {
            found.fields.put("preferenceGetter", read.getter());
            found.fields.put("browserPreferenceKey", read.key());
            found.fields.put("browserPreferenceIndex", String.valueOf(read.index()));
            var people = peopleSection(controls.get("people_jewel"), read.getter());
            if (people != null) {
                found.fields.put("peopleKey", people.get(0));
                found.fields.put("peopleFlagCheck", people.get(1));
            }
        }
        var supplier = subtabsSupplier(controls.get("subtabs"));
        if (supplier != null) found.fields.put("subtabsSupplier", supplier);
        var modes = controls.get("bubble_mode");
        if (modes.size() == 1) {
            var modeCode = instructions(modes.get(0));
            // Family B's mode gate inlines the eligibility check (8 more) and fetches its config by number (2 more).
            if (modeCode.size() == 25 || modeCode.size() == 35) {
                int e = modeCode.size() == 35 ? 8 : 0, f = modeCode.size() == 35 ? 10 : 0;
                found.fields.put("bubbleCapabilityGetter", ref(modeCode.get(11 + e)));
                found.fields.put("bubbleRolloutGetter", ref(modeCode.get(21 + f)));
            }
            var routes = nativeBubbleRoutes(classes, hookId(modes.get(0)));
            if (routes != null) found.fields.put("nativeBubbleRoutes", routes);
        }
        var community = communityInbox(classes);
        if (community != null) found.fields.put("nativeCommunityInbox", community.identity());
        for (var site : findDexSites(classes)) found.dexSites.put(site.getKey(), site.getValue());
        return found;
    }

    static boolean calls(Instruction instruction, int... registers) {
        if (!(instruction instanceof FiveRegisterInstruction call) || call.getRegisterCount() != registers.length) return false;
        int[] actual = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
        return Arrays.equals(registers, Arrays.copyOf(actual, registers.length));
    }

    static final int KOTLIN_WIDTH = 120;

    static String kotlinString(String value) {
        return "\"" + value.replace("\\", "\\\\").replace("\"", "\\\"").replace("$", "\\$") + "\"";
    }

    /** The ControlProfile declaration for ControlProfiles.kt, wrapped like the hand-written ones. */
    static String kotlinProfile(Profile build) {
        var out = new StringBuilder("internal val PROFILE_" + build.code + " = ControlProfile(\n    hooks = mapOf(\n");
        build.hooks.forEach((key, ids) -> {
            var quoted = new TreeSet<>(ids).stream().map(CompatReport::kotlinString).toList();
            var head = "        " + kotlinString(key) + " to setOf(";
            var line = head + String.join(", ", quoted) + "),";
            if (quoted.size() == 1 || line.length() <= KOTLIN_WIDTH) {
                out.append(line).append('\n');
                return;
            }
            out.append(head).append('\n');
            var row = new StringBuilder("           ");
            for (var id : quoted) {
                if (row.length() > 11 && row.length() + id.length() + 2 > KOTLIN_WIDTH) {
                    out.append(row).append('\n');
                    row = new StringBuilder("           ");
                }
                row.append(' ').append(id).append(',');
            }
            out.append(row).append("\n        ),\n");
        });
        out.append("    ),\n");
        for (var name : FIELD_CONTROLS.keySet()) {
            var value = build.fields.get(name);
            var kotlin = NUMBER_FIELDS.contains(name) ? value : kotlinString(value);
            out.append("    ").append(name).append(" = ").append(kotlin).append(",\n");
        }
        return out.append(")\n").toString();
    }

    /** The permission load sites for InstallBesideMetaAppsPatch.kt. */
    static String kotlinDexSites(Profile build) {
        var out = new StringBuilder("internal val expectedDexSites" + build.code + " = mapOf(\n");
        build.dexSites.forEach((site, name) ->
            out.append("    ").append(kotlinString(site)).append(" to ").append(DEX_NAME_CONSTANTS.get(name)).append(",\n"));
        return out.append(")\n").toString();
    }

    static final String PATCH_SOURCES = "patches/src/main/kotlin/app/hushmessenger/patches/";

    /** Whether the patch source at -file (under PATCH_SOURCES) matches -regex; false when it can't be read. */
    static boolean patchSourceHas(String file, String regex) {
        try {
            return Pattern.compile(regex).matcher(Files.readString(scriptDir().getParent().resolve(PATCH_SOURCES + file))).find();
        } catch (IOException | InvalidPathException | NullPointerException e) {
            return false;
        }
    }

    /**
     * The Kotlin a new build needs, reusing a recorded build's profile or sites when they're identical. Only what the
     * patch sources don't already declare is printed: the release's build stage re-records every supported family,
     * and a "list it in VERSIONS" line for a build that's been listed for days read as a missing build.
     */
    static void printKotlin(Profile build, Collection<Profile> others) {
        var sameControls = others.stream().filter(o -> o.sameControls(build)).map(o -> o.code).toList();
        var sameSites = others.stream().filter(o -> o.dexSites.equals(build.dexSites)).map(o -> o.code).toList();
        var code = "\\b" + Pattern.quote(build.code) + "\\b";
        boolean listed = patchSourceHas("MessengerTarget.kt", "(?s)val VERSIONS\\b.*?" + code + ".*?val VERSION_CODES")
            && patchSourceHas("MessengerTarget.kt", code + " to SupportedAbi\\.");
        boolean controlsMapped = patchSourceHas("controls/ControlProfiles.kt", code + " to PROFILE_");
        boolean sitesMapped = patchSourceHas("coexist/InstallBesideMetaAppsPatch.kt", code + " to expectedDexSites");
        if (listed && controlsMapped && sitesMapped) {
            System.out.println("// " + build.code + " is already declared: MessengerTarget.kt lists it, and controlProfiles and" +
                " expectedDexSitesByBuild map it. Nothing to add.");
            return;
        }
        if (!listed) {
            System.out.println("// MessengerTarget.kt: list " + build.code + " under \"" + build.version + "\" in VERSIONS, with its ABI in ABIS.");
        }
        if (!controlsMapped && sameControls.isEmpty()) {
            System.out.println("// ControlProfiles.kt: add this profile and map " + build.code + " to it in controlProfiles.");
            System.out.println();
            System.out.print(kotlinProfile(build));
        } else if (!controlsMapped) {
            System.out.println("// ControlProfiles.kt: the controls match build " + String.join(", ", sameControls) +
                ". Map " + build.code + " to the same profile in controlProfiles.");
        }
        if (!sitesMapped) System.out.println();
        if (!sitesMapped && sameSites.isEmpty()) {
            System.out.println("// InstallBesideMetaAppsPatch.kt: add these sites and map " + build.code + " to them in expectedDexSitesByBuild.");
            System.out.println();
            System.out.print(kotlinDexSites(build));
        } else if (!sitesMapped) {
            System.out.println("// InstallBesideMetaAppsPatch.kt: the permission loads match build " + String.join(", ", sameSites) +
                ". Map " + build.code + " to the same sites in expectedDexSitesByBuild.");
        }
    }

    /** --kotlin: the Kotlin for a recorded build, or the controls that keep it from resolving. */
    static int printKotlin(Path record) throws IOException {
        var build = Profile.read(record);
        var others = recorded(PROFILES);
        others.remove(build.code);
        var problems = unresolved(build, others.values());
        if (!problems.isEmpty()) {
            System.out.println("No profile generated. These controls did not resolve:");
            for (var problem : problems) System.out.println("       " + problem);
            return 1;
        }
        printKotlin(build, others.values());
        return 0;
    }

    static final String CONTROL_PROFILES = "controls/ControlProfiles.kt";

    /**
     * --record-control: a control's hooks in every recorded build, read from the stock APKs in [apkDir] (matched by
     * their recorded SHA-256) and written into each record and each profile in ControlProfiles.kt. --save holds a build
     * to the recorded hook counts, so a control none of the records has yet gets its ids here instead of by hand. The
     * builds one profile serves must resolve to the same methods, or nothing is written.
     */
    static int recordControl(String key, Path apkDir) throws Exception {
        if (!CONTROL_KEYS.contains(key)) {
            System.err.println(key + " isn't a control. Add it to PATCHES and its finder to Controls.findControls first.");
            return 2;
        }
        var records = new TreeMap<String, Path>();
        var builds = new TreeMap<String, Profile>();
        try (var files = Files.list(PROFILES)) {
            for (var file : files.filter(f -> f.toString().endsWith(".txt")).sorted().toList()) {
                var build = Profile.read(file);
                records.put(build.code, file);
                builds.put(build.code, build);
            }
        }
        var apks = new HashMap<String, File>();
        try (var files = Files.list(apkDir)) {
            for (var file : files.filter(f -> f.toString().endsWith(".apk")).sorted().toList()) apks.put(sha256(file.toFile()), file.toFile());
        }
        var missing = builds.values().stream().filter(b -> !apks.containsKey(b.sha256)).map(b -> b.code).toList();
        if (!missing.isEmpty()) {
            System.err.println("No APK in " + apkDir + " has the recorded SHA-256 of build " + String.join(", ", missing));
            return 2;
        }
        var source = scriptDir().getParent().resolve(PATCH_SOURCES + CONTROL_PROFILES);
        var original = Files.readString(source);
        boolean crlf = original.contains("\r\n");
        var kotlin = original.replace("\r\n", "\n");
        var families = new TreeMap<String, String>();
        var mapped = Pattern.compile("(?m)^\\s*(\\d+) to PROFILE_(\\d+),$").matcher(kotlin);
        while (mapped.find()) families.put(mapped.group(1), mapped.group(2));
        if (!families.keySet().equals(builds.keySet())) {
            System.err.println(CONTROL_PROFILES + " maps builds " + families.keySet() + ", but scripts/profiles records " + builds.keySet());
            return 2;
        }

        var found = new TreeMap<String, Set<String>>();
        for (var build : builds.values()) {
            var ids = findControls(loadDex(apks.get(build.sha256))).get(key).stream().map(CompatReport::hookId)
                .collect(Collectors.toCollection(TreeSet::new));
            System.out.println(build.code + ": " + (ids.isEmpty() ? "nothing found" : String.join(", ", ids)));
            found.put(build.code, ids);
        }
        var problems = new ArrayList<String>();
        found.forEach((code, ids) -> { if (ids.isEmpty()) problems.add(code + " has no " + key + " hook"); });
        var profiles = new TreeSet<>(families.values());
        for (var profile : profiles) {
            var served = families.entrySet().stream().filter(e -> e.getValue().equals(profile)).map(Map.Entry::getKey).toList();
            var shapes = served.stream().map(found::get).distinct().toList();
            if (shapes.size() > 1) {
                problems.add("PROFILE_" + profile + " serves " + String.join(", ", served) + ", which don't resolve to the same methods");
            }
        }
        if (!problems.isEmpty()) {
            System.out.println();
            System.out.println("Nothing written:");
            for (var problem : problems) System.out.println("       " + problem);
            return 1;
        }

        for (var build : builds.values()) {
            build.hooks.put(key, found.get(build.code));
            Files.writeString(records.get(build.code), String.join("\n", build.lines()) + "\n");
        }
        for (var profile : profiles) {
            var head = "internal val PROFILE_" + profile + " = ControlProfile(\n";
            int start = kotlin.indexOf(head);
            int end = start < 0 ? -1 : kotlin.indexOf("\n)\n", start);
            if (end < 0) {
                System.err.println(CONTROL_PROFILES + " has no PROFILE_" + profile + " declaration to replace");
                return 2;
            }
            kotlin = kotlin.substring(0, start) + kotlinProfile(builds.get(profile)) + kotlin.substring(end + 3);
        }
        Files.writeString(source, crlf ? kotlin.replace("\n", "\r\n") : kotlin);
        System.out.println();
        System.out.println("Wrote " + key + " into " + builds.size() + " records and " + profiles.size() + " profiles in " + CONTROL_PROFILES + ".");
        return 0;
    }

    static String sha256(File apk) throws Exception {
        var digest = MessageDigest.getInstance("SHA-256");
        try (var in = new FileInputStream(apk); var out = new DigestOutputStream(OutputStream.nullOutputStream(), digest)) {
            in.transferTo(out);
        }
        return HexFormat.of().formatHex(digest.digest());
    }

    /**
     * Redex's string tables: static (I)String methods that switch on the key straight to a constant, by method and key.
     * 583 keeps some kill switch names in one, so a gate loads its anchor with `const/16 key` and a lookup. Mirrors PluginGates.kt.
     */
    static Map<String, Map<Integer, String>> stringTables(List<ClassDef> classes) {
        var tables = new HashMap<String, Map<Integer, String>>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("Ljava/lang/String;") || !bubbleParameters(m).equals(List.of("I"))) continue;
            var c = instructions(m);
            if (c.isEmpty() || !Set.of(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH).contains(c.get(0).getOpcode())) continue;
            var indexAt = new HashMap<Integer, Integer>(); int address = 0;
            for (int i = 0; i < c.size(); i++) { indexAt.put(address, i); address += c.get(i).getCodeUnits(); }
            Integer payloadAt = indexAt.get(((OffsetInstruction) c.get(0)).getCodeOffset());
            if (payloadAt == null || !(c.get(payloadAt) instanceof SwitchPayload payload)) continue;
            var cases = new HashMap<Integer, String>();
            for (var e : payload.getSwitchElements()) {
                Integer at = indexAt.get(e.getOffset());
                if (at == null || at + 1 >= c.size()) continue;
                var load = c.get(at); var exit = c.get(at + 1);
                if (Set.of(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO).contains(load.getOpcode()) && exit.getOpcode() == Opcode.RETURN_OBJECT &&
                        register(load) == register(exit) && load instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s)
                    cases.put(e.getKey(), s.getString());
            }
            if (!cases.isEmpty()) tables.put(hookId(m), cases);
        }
        return tables;
    }

    /** The strings a method looks up in a stringTables table by a constant key loaded right before the call. */
    static Set<String> tableStrings(List<Instruction> c, Map<String, Map<Integer, String>> tables) {
        var out = new HashSet<String>();
        for (int at = 1; at < c.size(); at++) {
            if (!(c.get(at) instanceof FiveRegisterInstruction call) || call.getOpcode() != Opcode.INVOKE_STATIC || call.getRegisterCount() != 1) continue;
            var table = tables.get(ref(call)); var key = c.get(at - 1);
            if (table != null && Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST).contains(key.getOpcode()) && register(key) == call.getRegisterC() &&
                    key instanceof NarrowLiteralInstruction n && table.containsKey(n.getNarrowLiteral())) out.add(table.get(n.getNarrowLiteral()));
        }
        return out;
    }

    static String hookId(Method m) {
        var params = new StringBuilder();
        for (var p : m.getParameterTypes()) params.append(p);
        return m.getDefiningClass() + "->" + m.getName() + "(" + params + ")" + m.getReturnType();
    }

    static boolean classReferencesType(ClassDef cls, String type) {
        for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof TypeReference tr && type.equals(tr.getType())) return true;
        }
        return false;
    }

    static List<ClassDef> loadDex(File apk) throws Exception {
        // The container API reads the same in upstream dexlib2 and in the patcher's fork the tests use.
        var classes = new ArrayList<ClassDef>();
        try {
            var container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
            for (var name : container.getDexEntryNames()) {
                if (name.matches("classes[0-9]*\\.dex")) classes.addAll(container.getEntry(name).getDexFile().getClasses());
            }
        } catch (IOException | RuntimeException damaged) {
            String why = damaged.getMessage() == null ? "" : damaged.getMessage().lines().findFirst().orElse("");
            throw new Unreadable(apk + ": can't read its dex files (" + damaged.getClass().getSimpleName() + (why.isEmpty() ? "" : ": " + why) + ")");
        }
        return classes;
    }

    static boolean calls(Method method, String owner) {
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call &&
                owner.equals(call.getDefiningClass())) return true;
        return false;
    }

    /**
     * Every hook whose method the patches refuse when it has no local register, through validateScratch or a register
     * check of its own. The control tests' zero-local check (MirroredFinders.kt) fails when this set and the patches part.
     */
    static final Set<String> NEEDS_A_LOCAL = Set.of("ad_events", "ai_commands", "ai_fab", "ai_mention_rows", "ai_menu", "ai_search",
        "ai_search_chip", "ai_summary", "allow_screenshot", "analytics_uploads", "app_icons", "app_themes", "attribution_uploads", "bubbles", "call_recording", "delta_unsent",
        "disappearing_swipe", "external_gallery", "facebook", "facebook_profile", "font_by_name", "font_repository", "growth_active_status", "growth_notes", "growth_story_card", "instant_gallery", "instants_button", "keep_unsent", "link_player",
        "mqtt_telemetry", "nearby_scans", "original_photo", "passkey_login", "people_story", "phone_id_sync", "people_tab", "recent_media", "stories", "system_camera",
        "tab_badges", "typing", "unsent_indicator", "unsent_recall");

    /** More registers than the parameters take, as ControlHooks.kt's validateScratch asks. */
    static boolean hasLocal(Method method) {
        if (method.getImplementation() == null) return false;
        int words = AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1;
        for (var type : method.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        return method.getImplementation().getRegisterCount() > words;
    }

    static List<Map.Entry<String, String>> findDexSites(List<ClassDef> classes) {
        var sites = new ArrayList<Map.Entry<String, String>>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                boolean hasShared = false;
                for (var i : impl.getInstructions()) {
                    if ((i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                        i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        DEX_NAMES.contains(sr.getString())) {
                        hasShared = true;
                        break;
                    }
                }
                if (!hasShared) continue;
                int index = 0;
                for (var i : impl.getInstructions()) {
                    if ((i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                        i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        DEX_NAMES.contains(sr.getString())) {
                        var params = new StringBuilder();
                        for (var p : method.getParameterTypes()) params.append(p);
                        String siteId = method.getDefiningClass() + "->" + method.getName() +
                            "(" + params + ")" + method.getReturnType() + "@" + index;
                        sites.add(Map.entry(siteId, sr.getString()));
                    }
                    index++;
                }
            }
        }
        return sites;
    }

    static Set<String> findAbis(File apk) throws Exception {
        var abis = new TreeSet<String>();
        try (var zip = new ZipFile(apk)) {
            for (var e : Collections.list(zip.entries())) {
                String name = e.getName();
                if (name.startsWith("lib/") && name.endsWith(".so")) {
                    String[] parts = name.split("/");
                    if (parts.length >= 3) abis.add(parts[1]);
                }
            }
        } catch (ZipException damaged) {
            throw new Unreadable(apk + ": isn't a readable APK (" + damaged.getMessage() + ")");
        }
        return abis;
    }

    /**
     * An encrypted chat's row class: built on a CQL result set, serving the message row interface and the getters its
     * text hook reads (threading id, time, sender and content type), each a name and return type taking the row index.
     */
    static boolean isCqlRow(ClassDef cls, String rowInterface, List<Map.Entry<String, String>> getters) {
        if (rowInterface.isEmpty() || getters.stream().anyMatch(g -> g.getKey().isEmpty())) return false;
        if (AccessFlags.ABSTRACT.isSet(cls.getAccessFlags()) || AccessFlags.INTERFACE.isSet(cls.getAccessFlags())) return false;
        if (!List.of(rowInterface).equals(cls.getInterfaces())) return false;
        boolean built = false;
        var served = new HashSet<Map.Entry<String, String>>();
        for (var m : cls.getMethods()) {
            var params = m.getParameterTypes().stream().map(Object::toString).toList();
            if ("<init>".equals(m.getName()) && params.equals(List.of("Lcom/facebook/msys/mci/CQLResultSet;"))) built = true;
            if (params.equals(List.of("I"))) served.add(Map.entry(m.getName(), m.getReturnType()));
        }
        return built && served.containsAll(getters);
    }

    static String resolveWrapper(ClassDef wCls, String rawName, String returnType) {
        for (var wm : wCls.getMethods()) {
            if (wm.getName().equals(rawName) && wm.getReturnType().equals(returnType)
                    && wm.getParameterTypes().size() == 1 && "I".equals(wm.getParameterTypes().get(0).toString()))
                return rawName;
        }
        for (var wm : wCls.getMethods()) {
            if (!wm.getReturnType().equals(returnType)) continue;
            if (wm.getParameterTypes().size() != 1 || !"I".equals(wm.getParameterTypes().get(0).toString())) continue;
            var impl = wm.getImplementation();
            if (impl == null) continue;
            for (var insn : impl.getInstructions()) {
                if (insn.getOpcode() == Opcode.INVOKE_INTERFACE && insn instanceof ReferenceInstruction ri
                        && ri.getReference() instanceof MethodReference mr && rawName.equals(mr.getName()))
                    return wm.getName();
            }
        }
        return rawName;
    }

    static String findTool(String name) {
        String sdk = System.getenv("ANDROID_HOME");
        if (sdk == null) sdk = System.getenv("ANDROID_SDK_ROOT");
        if (sdk == null) {
            String home = System.getProperty("user.home");
            File local = new File(home, "AppData/Local/Android/Sdk");
            if (local.isDirectory()) sdk = local.getAbsolutePath();
        }
        if (sdk == null) return null;
        File buildTools = new File(sdk, "build-tools");
        if (!buildTools.isDirectory()) return null;
        String[] versions = buildTools.list();
        if (versions == null || versions.length == 0) return null;
        // As text, 9.0.0 outranks 36.1.0 and 37.0.0-rc1 outranks 37.0.0, so sort by the numbers.
        Arrays.sort(versions, Comparator.comparing(CompatReport::versionKey).reversed());
        boolean win = System.getProperty("os.name", "").toLowerCase().contains("win");
        for (String v : versions) {
            File dir = new File(buildTools, v);
            if (win) {
                for (String ext : new String[]{".exe", ".bat", ""}) {
                    File tool = new File(dir, name + ext);
                    if (tool.isFile()) return tool.getAbsolutePath();
                }
            } else {
                File tool = new File(dir, name);
                if (tool.isFile()) return tool.getAbsolutePath();
            }
        }
        return null;
    }

    record ApkInfo(String packageName, String versionName, String versionCode) {}

    static ApkInfo parseApkInfo(File apk) {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) return null;
        try {
            var pb = new ProcessBuilder(aapt2, "dump", "badging", apk.getAbsolutePath());
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            proc.waitFor();
            String pkg = null, ver = null, code = null;
            var m = Pattern.compile("package:\\s+name='([^']+)'").matcher(output);
            if (m.find()) pkg = m.group(1);
            m = Pattern.compile("versionName='([^']+)'").matcher(output);
            if (m.find()) ver = m.group(1);
            m = Pattern.compile("versionCode='([^']+)'").matcher(output);
            if (m.find()) code = m.group(1);
            return new ApkInfo(pkg, ver, code);
        } catch (Exception e) {
            return null;
        }
    }

    static String parseSignerFingerprint(File apk) {
        String tool = findTool("apksigner");
        if (tool == null) return null;
        try {
            ProcessBuilder pb;
            // apksigner.bat through cmd splits an APKMirror name like "(213,240dpi)" at the comma, so run its jar.
            File jar = new File(new File(tool).getParentFile(), "lib/apksigner.jar");
            if (tool.endsWith(".bat") && jar.isFile()) {
                pb = new ProcessBuilder(Path.of(System.getProperty("java.home"), "bin", "java").toString(), "-jar",
                    jar.getAbsolutePath(), "verify", "--print-certs", apk.getAbsolutePath());
            } else if (tool.endsWith(".bat")) {
                pb = new ProcessBuilder("cmd", "/c", tool, "verify", "--print-certs", apk.getAbsolutePath());
            } else {
                pb = new ProcessBuilder(tool, "verify", "--print-certs", apk.getAbsolutePath());
            }
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            if (proc.waitFor() != 0) return null;
            var m = Pattern.compile("certificate sha-256 digest:\\s+([0-9a-f]+)").matcher(output.toLowerCase());
            if (m.find()) return m.group(1);
            return null;
        } catch (Exception e) {
            System.out.println("[WARN] apksigner couldn't run, so the signer line is skipped: " + e);
            return null;
        }
    }

    /** A sort key where 36.1.0 outranks 9.0.0 and a final build outranks its release candidates. */
    static String versionKey(String name) {
        var key = new StringBuilder();
        var part = Pattern.compile("\\d+|[^\\d.]+").matcher(name);
        while (part.find()) {
            String piece = part.group();
            if (Character.isDigit(piece.charAt(0))) key.append(String.format("%012d", Long.parseLong(piece.length() > 12 ? piece.substring(0, 12) : piece))).append('.');
            else key.append(piece);
        }
        return key.append('~').toString();
    }

    static final String APP_COMPONENT_FACTORY = "com.facebook.common.appcomponentfactory.m4a.M4aAppComponentFactory";
    static final String SCREEN_HOST = "com.facebook.messaging.about.preference.NeueAboutPreferenceActivity";
    static final String SHORTCUT_HOST = "com.facebook.zero.upsell.activity.ZeroUpsellBuyConfirmInterstitialActivity";

    static boolean nativeBubbleActivityAvailable(File apk) {
        String tool = findTool("aapt2");
        if (tool == null) return false;
        try {
            var process = new ProcessBuilder(tool,"dump","xmltree",apk.getAbsolutePath(),"--file","AndroidManifest.xml")
                .redirectErrorStream(true).start();
            var lines = Arrays.asList(new String(process.getInputStream().readAllBytes()).split("\\r?\\n"));
            if (process.waitFor()!=0) return false;
            var attribute = Pattern.compile("^\\s*A: http://schemas.android.com/apk/res/android:(\\w+)\\(0x[0-9a-f]+\\)=(\"[^\"]*\"|\\S+)");
            int found=0; boolean valid=false;
            for(int i=0;i<lines.size();i++) {
                String tag=lines.get(i).trim();
                if(!tag.startsWith("E: activity ") && !tag.startsWith("E: activity-alias ")) continue;
                int depth=lines.get(i).indexOf('E'); var attrs=new HashMap<String,String>();
                for(int j=i+1;j<lines.size() && lines.get(j).indexOf(lines.get(j).trim())>depth;j++) {
                    String line=lines.get(j); var match=attribute.matcher(line);
                    if(line.indexOf(line.trim())==depth+2 && match.find()) attrs.put(match.group(1),match.group(2));
                }
                if(!("\""+BUBBLE_ACTIVITY+"\"").equals(attrs.get("name"))) continue;
                found++;
                valid=tag.startsWith("E: activity ") && "false".equals(attrs.get("exported")) &&
                    "true".equals(attrs.get("allowEmbedded")) && "true".equals(attrs.get("resizeableActivity")) &&
                    !"false".equals(attrs.get("enabled")) && !attrs.containsKey("process") && !attrs.containsKey("permission");
            }
            return found==1 && valid;
        } catch(Exception failure) { return false; }
    }

    /**
     * What SettingsShortcut.kt and ScreenHosts.kt need for settings on a Root Mount install: the stock factory's two
     * entry points in the shape the hooks expect, and two stock activities with exactly the tested attributes.
     */
    static List<String> screenHostProblems(File apk, List<ClassDef> classes) {
        var problems = new ArrayList<String>();
        String factory = "L" + APP_COMPONENT_FACTORY.replace('.', '/') + ";";
        ClassDef factoryClass = classes.stream().filter(c -> c.getType().equals(factory)).findFirst().orElse(null);
        if (factoryClass == null) {
            problems.add("no " + APP_COMPONENT_FACTORY);
        } else {
            Method activity = null, application = null;
            for (Method m : factoryClass.getMethods()) {
                String id = hookId(m);
                if (id.equals(factory + "->instantiateActivity(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;")) activity = m;
                if (id.equals(factory + "->instantiateApplication(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroid/app/Application;")) application = m;
            }
            if (activity == null || AccessFlags.STATIC.isSet(activity.getAccessFlags()) || activity.getImplementation() == null ||
                activity.getImplementation().getRegisterCount() <= 4) problems.add("instantiateActivity has no local register to use");
            if (application == null || AccessFlags.STATIC.isSet(application.getAccessFlags()) || application.getImplementation() == null) {
                problems.add("no instantiateApplication");
            } else {
                var code = instructions(application);
                if (code.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count() != 1 ||
                    code.stream().anyMatch(i -> i.getOpcode().name.startsWith("if-") || i.getOpcode().name.startsWith("goto")
                        || i.getOpcode().name.endsWith("-switch")))
                    problems.add("instantiateApplication isn't one straight path to its return");
            }
        }
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) {
            problems.add("aapt2 unavailable, cannot check the stock activities");
            return problems;
        }
        List<String> lines;
        try {
            var proc = new ProcessBuilder(aapt2, "dump", "xmltree", apk.getAbsolutePath(), "--file", "AndroidManifest.xml")
                .redirectErrorStream(true).start();
            lines = Arrays.asList(new String(proc.getInputStream().readAllBytes()).split("\\r?\\n"));
            proc.waitFor();
        } catch (Exception e) {
            problems.add("aapt2 failed: " + e);
            return problems;
        }
        var attribute = Pattern.compile("^\\s*A: http://schemas.android.com/apk/res/android:(\\w+)\\(0x[0-9a-f]+\\)=(\"[^\"]*\"|\\S+)");
        if (lines.stream().noneMatch(l -> l.contains(":appComponentFactory(") && l.contains("=\"" + APP_COMPONENT_FACTORY + "\"")))
            problems.add("the manifest's app component factory differs");
        Map<String, Map<String, String>> expected = Map.of(
            SCREEN_HOST, Map.of("exported", "false", "parentActivityName", "\"com.facebook.messenger.neue.MainActivity\""),
            SHORTCUT_HOST, Map.of("exported", "false", "taskAffinity", "\"\"", "theme", "@0x01030010", "configChanges", "*"));
        for (var host : expected.entrySet()) {
            int found = 0;
            for (int i = 0; i < lines.size(); i++) {
                if (!lines.get(i).trim().startsWith("E: activity ")) continue;
                int depth = lines.get(i).indexOf('E');
                var attributes = new TreeMap<String, String>();
                var children = new TreeSet<String>();
                for (int j = i + 1; j < lines.size() && lines.get(j).indexOf(lines.get(j).trim()) > depth; j++) {
                    String line = lines.get(j);
                    int indent = line.indexOf(line.trim());
                    Matcher m = attribute.matcher(line);
                    if (indent == depth + 2 && m.find()) attributes.put(m.group(1), m.group(2));
                    else if (line.trim().startsWith("E: ")) children.add(line.trim().split(" ")[1]);
                }
                if (!("\"" + host.getKey() + "\"").equals(attributes.remove("name"))) continue;
                found++;
                for (var want : host.getValue().entrySet()) {
                    String value = attributes.remove(want.getKey());
                    if (value == null || !(want.getValue().equals("*") || want.getValue().equals(value)))
                        problems.add(host.getKey() + " " + want.getKey() + " is " + value);
                }
                if (!attributes.isEmpty()) problems.add(host.getKey() + " has " + attributes);
                children.remove("meta-data");
                if (!children.isEmpty()) problems.add(host.getKey() + " has " + children);
            }
            if (found != 1) problems.add("expected one " + host.getKey() + ", found " + found);
        }
        return problems;
    }

    /** MaterialYouPatch.kt's isTokenColorMethod: one class-typed parameter, an int result, and ()I called on that parameter's type. */
    static boolean isTokenColorMethod(Method m) {
        if (m.getParameterTypes().size() != 1 || !"I".equals(m.getReturnType())) return false;
        String token = m.getParameterTypes().get(0).toString();
        return token.startsWith("L") && instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.INVOKE_INTERFACE &&
            i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
            mr.getDefiningClass().equals(token) && "I".equals(mr.getReturnType()) && mr.getParameterTypes().isEmpty());
    }

    /** The one candidate, or null after noting that there were none or several. */
    static Method onlyOne(List<Method> candidates, String what, List<String> problems) {
        if (candidates.size() == 1) return candidates.get(0);
        problems.add("expected one " + what + ", found " + candidates.size() + (candidates.isEmpty() ? "" :
            ": " + candidates.stream().map(CompatReport::hookId).collect(Collectors.joining(", "))));
        return null;
    }

    /** A method the patch hooks just before it returns. */
    static void hookBeforeReturn(Method m, List<String> problems, List<String> targets) {
        if (instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.RETURN)) targets.add(hookId(m));
        else problems.add(hookId(m) + " has no return to hook");
    }

    static boolean takesOnlyContext(List<? extends CharSequence> parameters) {
        return parameters.size() == 1 && "Landroid/content/Context;".equals(parameters.get(0).toString());
    }

    /** MaterialYouPatch.kt's isFdsColorsShape: the only field is a static instance of the class, with (Context, ?, ?)I methods asking a (Context)Z. */
    static boolean isFdsColorsShape(ClassDef cls) {
        var fields = new ArrayList<Field>();
        for (Field f : cls.getFields()) fields.add(f);
        if (fields.size() != 1 || !fields.get(0).getType().equals(cls.getType()) || !AccessFlags.STATIC.isSet(fields.get(0).getAccessFlags())) return false;
        for (Method m : cls.getMethods()) {
            if (!"I".equals(m.getReturnType()) || m.getParameterTypes().size() != 3 || !"Landroid/content/Context;".equals(m.getParameterTypes().get(0).toString())) continue;
            if (instructions(m).stream().anyMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
                "Z".equals(mr.getReturnType()) && takesOnlyContext(mr.getParameterTypes()))) return true;
        }
        return false;
    }

    /**
     * What MaterialYouPatch.kt finds by shape when it patches: one DarkColorScheme and one LightColorScheme token resolver, one dark mode
     * check called by FDSColors' (Context, ?, ?)I resolvers, FDSColors' int returns, and the constants and calls
     * routes 3 and 4 rewrite. The patch quietly skips its FDS half when it can't find it, so this is where a build
     * that resolves only part of it fails. Found targets go in targets.
     */
    static List<String> materialYouProblems(List<ClassDef> classes, List<String> targets) {
        var problems = new ArrayList<String>();
        ClassDef scheme = null, lightScheme = null, fds = null;
        var fdsShapes = new ArrayList<ClassDef>();
        int surfaces = 0, colorCalls = 0;
        var editableClasses = new TreeSet<String>();
        for (ClassDef cls : classes) {
            if (cls.getType().equals(DARK_SCHEME)) scheme = cls;
            if (cls.getType().equals(LIGHT_SCHEME)) lightScheme = cls;
            if (cls.getType().equals(FDS_COLORS)) fds = cls;
            if (isFdsColorsShape(cls)) fdsShapes.add(cls);
            for (Method m : cls.getMethods()) {
                for (Instruction i : instructions(m)) {
                    Opcode op = i.getOpcode();
                    if ((op == Opcode.CONST || op == Opcode.CONST_HIGH16) && i instanceof NarrowLiteralInstruction literal &&
                        DARK_SURFACES.contains(literal.getNarrowLiteral())) {
                        surfaces++;
                        editableClasses.add(cls.getType());
                    }
                    if ((op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_VIRTUAL ||
                         op == Opcode.INVOKE_STATIC_RANGE || op == Opcode.INVOKE_VIRTUAL_RANGE) && COLOR_CALLS.contains(ref(i))) {
                        colorCalls++;
                        editableClasses.add(cls.getType());
                    }
                }
            }
        }
        if (scheme == null) {
            problems.add("no " + DARK_SCHEME);
        } else {
            var resolvers = new ArrayList<Method>();
            for (Method m : scheme.getMethods()) if (isTokenColorMethod(m)) resolvers.add(m);
            Method resolver = onlyOne(resolvers, "DarkColorScheme token resolver", problems);
            if (resolver != null) {
                hookBeforeReturn(resolver, problems, targets);
                editableClasses.add(scheme.getType());
            }
        }
        // The patch skips light mode's accent (#132) on a build without the light scheme, so this is where that shows.
        if (lightScheme == null) {
            problems.add("no " + LIGHT_SCHEME);
        } else {
            var resolvers = new ArrayList<Method>();
            for (Method m : lightScheme.getMethods()) if (isTokenColorMethod(m)) resolvers.add(m);
            Method resolver = onlyOne(resolvers, "LightColorScheme token resolver", problems);
            if (resolver != null) {
                hookBeforeReturn(resolver, problems, targets);
                editableClasses.add(lightScheme.getType());
            }
        }
        // 584 dropped FDSColors' name (LX/9TH;), so the patch falls back to its shape
        if (fds == null && fdsShapes.size() == 1) fds = fdsShapes.get(0);
        if (fds == null) {
            problems.add("no " + FDS_COLORS + ", and " + fdsShapes.size() + " classes shaped like it");
        } else {
            var resolvers = new ArrayList<Method>();
            int intReturns = 0;
            for (Method m : fds.getMethods()) {
                if (!"I".equals(m.getReturnType()) || m.getImplementation() == null) continue;
                intReturns += (int) instructions(m).stream().filter(i -> i.getOpcode() == Opcode.RETURN).count();
                if (m.getParameterTypes().size() == 3 && "Landroid/content/Context;".equals(m.getParameterTypes().get(0).toString()))
                    resolvers.add(m);
            }
            // The 21 builds have two, A00 and A01, calling the same check; the patch reads the check from the first.
            // Only static calls count, as in the patch: 584's A01 asks the check's own instance instead.
            var calls = new TreeMap<String, MethodReference>();
            boolean firstCalls = false;
            for (Method resolver : resolvers) {
                for (Instruction i : instructions(resolver)) {
                    if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
                        "Z".equals(mr.getReturnType()) && takesOnlyContext(mr.getParameterTypes())) {
                        calls.putIfAbsent(mr.toString(), mr);
                        if (resolver == resolvers.get(0)) firstCalls = true;
                    }
                }
            }
            if (resolvers.isEmpty()) {
                problems.add("no FDSColors (Context, ?, ?)I resolver");
            } else if (calls.size() != 1) {
                problems.add("expected one (Context)Z dark mode check in FDSColors' resolvers, found " + calls.size() +
                    (calls.isEmpty() ? "" : ": " + String.join(", ", calls.keySet())));
            } else if (!firstCalls) {
                problems.add(hookId(resolvers.get(0)) + ", where the patch looks, doesn't call " + calls.firstKey());
            } else {
                MethodReference call = calls.firstEntry().getValue();
                var checks = new ArrayList<Method>();
                classes.stream().filter(c -> c.getType().equals(call.getDefiningClass())).findFirst().ifPresent(owner -> {
                    for (Method m : owner.getMethods()) {
                        if (m.getName().equals(call.getName()) && "Z".equals(m.getReturnType()) &&
                            takesOnlyContext(m.getParameterTypes()) && m.getImplementation() != null) checks.add(m);
                    }
                });
                Method check = onlyOne(checks, "dark mode check " + call, problems);
                if (check != null) {
                    hookBeforeReturn(check, problems, targets);
                    editableClasses.add(check.getDefiningClass());
                }
            }
            if (intReturns == 0) problems.add("FDSColors has no int return to hook");
            else {
                targets.add(intReturns + " FDSColors int returns");
                editableClasses.add(fds.getType());
            }
        }
        if (surfaces == 0) problems.add("no dark surface constants for route 3");
        else targets.add(surfaces + " dark surface constants");
        if (colorCalls == 0) problems.add("no Color.parseColor or Context.getColor calls for route 4");
        else targets.add(colorCalls + " Color.parseColor and Context.getColor calls");
        targets.add(editableClasses.size() + " Material You editable classes");
        return problems;
    }

    static int countManifestMentions(File apk, String permName) {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) return -1;
        try {
            var pb = new ProcessBuilder(aapt2, "dump", "xmltree", apk.getAbsolutePath(), "--file", "AndroidManifest.xml");
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            proc.waitFor();
            int count = 0;
            // Count attribute lines (not Raw annotations) containing the permission name
            for (String line : output.split("\n")) {
                String trimmed = line.trim();
                if (trimmed.startsWith("(Raw:")) continue;
                if (trimmed.contains("\"" + permName + "\"")) count++;
            }
            return count;
        } catch (Exception e) {
            return -1;
        }
    }

    public static void main(String[] args) throws Exception {
        try {
            report(args);
        } catch (Unreadable unreadable) {
            System.err.println(unreadable.getMessage());
            System.exit(2);
        }
    }

    static void report(String[] args) throws Exception {
        if (args.length == 2 && "--kotlin".equals(args[0])) {
            System.exit(printKotlin(Path.of(args[1])));
        }
        if (args.length == 3 && "--record-control".equals(args[0])) {
            System.exit(recordControl(args[1], Path.of(args[2])));
        }
        if (args.length < 1 || (args.length > 3 && args.length != 5) || (args.length > 1 && !"--save".equals(args[1]))) {
            System.err.println("Usage: CompatReport <apk> [--save <profiles dir> <desktop.jar> <bundle.mpp>]");
            System.err.println("       CompatReport --kotlin <recorded build .txt>");
            System.err.println("       CompatReport --record-control <control> <stock APK dir>");
            System.exit(2);
        }
        File apk = new File(args[0]);
        if (!apk.isFile()) {
            System.err.println("File not found: " + apk);
            System.exit(2);
        }
        boolean save = args.length > 1;
        Path saveDir = args.length > 2 ? Path.of(args[2]) : PROFILES;
        var builds = recorded(PROFILES);

        // Header info
        ApkInfo info = parseApkInfo(apk);
        Set<String> abis = findAbis(apk);
        String signer = parseSignerFingerprint(apk);

        String pkgName = info != null ? info.packageName : "(aapt2 unavailable)";
        String verName = info != null ? info.versionName : "(aapt2 unavailable)";
        String verCode = info != null ? info.versionCode : "(aapt2 unavailable)";
        String abiStr = abis.isEmpty() ? "(none)" : String.join(", ", abis);
        String sigStr = signer != null ? signer : "(apksigner unavailable)";

        System.out.println("Package:      " + pkgName);
        System.out.println("Version:      " + verName + " (" + verCode + ")");
        System.out.println("ABI:          " + abiStr);
        System.out.println("Signer:       " + sigStr);
        System.out.println();

        boolean anyFail = false;
        // Failed checks that aren't about the recorded profile; a new build with any of these isn't recorded
        var blockers = new ArrayList<String>();

        // Pre-checks
        if (info != null && !PACKAGE.equals(info.packageName)) {
            System.out.println("[FAIL] Package name: expected " + PACKAGE + ", got " + info.packageName);
            blockers.add("Package name");
            anyFail = true;
        }
        String code = info != null ? info.versionCode : null;
        Profile expected = code != null ? builds.get(code) : null;
        if (info != null && expected == null && save && code != null) {
            // --save is how a new build gets its record, so the missing one is what this run writes. Every way the
            // write can fall through below fails the run on its own.
            System.out.println("[INFO] Version code: " + code + " has no recorded build in scripts/profiles yet, so --save records it");
        } else if (info != null && expected == null) {
            System.out.println("[FAIL] Version code: " +
                (code == null ? "aapt2 couldn't read it" : code + " has no recorded build in scripts/profiles"));
            anyFail = true;
        } else if (expected != null && !expected.version.equals(info.versionName)) {
            System.out.println("[FAIL] Version name: expected " + expected.version + ", got " + info.versionName);
            anyFail = true;
        }
        boolean stockSigner = FACEBOOK_SIGNER.equals(signer) || META_SIGNER.equals(signer);
        if (signer != null && !stockSigner) {
            System.out.println("[WARN] Signer: " + signer + " is not the stock Facebook or Meta certificate");
        }
        // A record pins the APK's hash, so it may only ever describe the stock file from Meta.
        if (save && !stockSigner) {
            System.out.println("[FAIL] Signer: " + (signer == null ? "apksigner couldn't read it" : "not stock") +
                ", and --save records only an APK signed by Facebook or Meta");
            blockers.add("Signer");
            anyFail = true;
        }

        // Load DEX
        System.out.println("Loading DEX classes...");
        List<ClassDef> classes = loadDex(apk);
        System.out.println("Loaded " + classes.size() + " classes from " + apk.getName());
        System.out.println();

        // Find controls and everything else the build's profile pins
        Map<String, List<Method>> controls = findControls(classes);
        Profile found = discover(classes, controls);
        found.version = info != null && info.versionName != null ? info.versionName : "";
        found.code = code != null ? code : "";
        found.sha256 = sha256(apk);
        var problems = unresolved(found, builds.values());
        int totalHooks = controls.values().stream().mapToInt(List::size).sum();
        System.out.println("Discovered " + totalHooks + " hooks across " + controls.size() + " feature keys");
        System.out.println();

        // Check Install beside Meta apps (DEX sites + manifest mentions)
        {
            var failures = new ArrayList<String>();
            if (expected == null) {
                for (var problem : problems) {
                    if (problem.controls().contains(PERMISSION_LOADS)) failures.add(problem.detail());
                }
            } else if (found.dexSites.size() != expected.dexSites.size()) {
                failures.add("expected " + expected.dexSites.size() + " permission loads, found " + found.dexSites.size());
            } else if (!found.dexSites.equals(expected.dexSites)) {
                failures.add("permission instruction sites differ from the tested build");
            }
            for (var entry : EXPECTED_MANIFEST_MENTIONS.entrySet()) {
                int count = countManifestMentions(apk, entry.getKey());
                if (count == -1) {
                    failures.add("aapt2 unavailable, cannot check manifest for " + entry.getKey());
                } else if (count != entry.getValue()) {
                    failures.add("expected " + entry.getValue() + " manifest uses of " + entry.getKey() + ", found " + count);
                }
            }
            if (failures.isEmpty()) {
                System.out.println("[PASS] Install beside Meta apps");
            } else {
                System.out.println("[FAIL] Install beside Meta apps");
                for (var f : failures) System.out.println("       " + f);
                blockers.add("Install beside Meta apps");
                anyFail = true;
            }
        }

        // Check what settings need on a Root Mount install (every patch depends on them)
        {
            var failures = screenHostProblems(apk, classes);
            if (failures.isEmpty()) {
                System.out.println("[PASS] Settings on Root Mount installs");
            } else {
                System.out.println("[FAIL] Settings on Root Mount installs");
                for (var f : failures) System.out.println("       " + f);
                blockers.add("Settings on Root Mount installs");
                anyFail = true;
            }
        }

        // Check Restore screens on re-signed builds (signer lookup fingerprint)
        {
            Method signerMethod = findSignerMethod(classes);
            var fbns = fbnsCheckProblems(classes);
            fbns.addAll(linkLauncherProblems(classes));
            if (signerMethod != null && fbns.isEmpty()) {
                System.out.println("[PASS] Restore screens on re-signed builds (" + hookId(signerMethod) + ")");
            } else {
                System.out.println("[FAIL] Restore screens on re-signed builds");
                if (signerMethod == null) System.out.println("       No method found matching the signer lookup pattern");
                for (var f : fbns) System.out.println("       " + f);
                blockers.add("Restore screens on re-signed builds");
                anyFail = true;
            }
        }

        // Check the clone patch's two DEX sites. CloneInstallPatch.kt pins each family's names.
        {
            var failures = new ArrayList<String>();
            var sites = cloneSites(classes, failures);
            if (failures.isEmpty()) {
                System.out.println("[PASS] " + CLONE);
                for (var site : sites) System.out.println("       " + site);
            } else {
                System.out.println("[FAIL] " + CLONE);
                for (var f : failures) System.out.println("       " + f);
                blockers.add(CLONE);
                anyFail = true;
            }
        }

        // Check Material You theme, which finds its targets when it patches instead of reading the profile
        {
            var targets = new ArrayList<String>();
            var failures = materialYouProblems(classes, targets);
            if (failures.isEmpty()) {
                System.out.println("[PASS] Material You theme");
                for (var t : targets) System.out.println("       " + t);
            } else {
                System.out.println("[FAIL] Material You theme");
                for (var f : failures) System.out.println("       " + f);
                blockers.add("Material You theme");
                anyFail = true;
            }
        }

        // Use system emoji's chat list Like is optional: the switch applies without it, so a miss only warns
        {
            var byType = new HashMap<String, ClassDef>();
            classes.forEach(c -> byType.put(c.getType(), c));
            var snippet = likeSnippetInit(byType);
            if (snippet != null) System.out.println("[PASS] Use system emoji: chat list Like\n       " + snippet);
            else System.out.println("[WARN] Use system emoji: the chat list snippet changed, so a Like there can still show as a box until Messenger's emoji font loads");
        }

        // Check each control patch: against the recorded build, or for a new build, that it resolves
        for (var entry : PATCHES.entrySet()) {
            String patchName = entry.getKey();
            List<String> hookKeys = entry.getValue();
            var failures = new ArrayList<String>();
            if ("Allow chat bubbles".equals(patchName)) {
                var eligibility=controls.get("bubbles"); var modes=controls.get("bubble_mode");
                if(eligibility.size()!=1 || !validBubbleEligibility(eligibility.get(0))) failures.add("SDK/low-memory eligibility contract differs");
                if(modes.size()!=1 || eligibility.size()!=1 || !validNativeBubbleMode(modes.get(0),hookId(eligibility.get(0)),expected!=null?expected:found))
                    failures.add("native capability/rollout/return contract differs");
                if(!nativeBubbleActivityAvailable(apk)) failures.add("native bubble activity is not a direct enabled embedded/resizable activity");
                if(!found.fields.containsKey("nativeBubbleRoutes")) failures.add("native notification/conversation/long-lived shortcut routes are missing");
                if(!failures.isEmpty()) blockers.add("Allow chat bubbles");
            }
            if ("Open settings from menu".equals(patchName)) {
                failures.addAll(legacyDrawerProblems(classes, controls.getOrDefault("menu_settings", List.of())));
                if (!failures.isEmpty()) blockers.add(patchName);
            }
            if (expected != null) {
                failures.addAll(differences(expected, found, hookKeys));
            } else {
                for (var problem : problems) {
                    if (!Collections.disjoint(problem.controls(), hookKeys)) failures.add(problem.toString());
                }
            }
            if (failures.isEmpty()) {
                System.out.println("[PASS] " + patchName);
            } else {
                System.out.println("[FAIL] " + patchName);
                for (var f : failures) System.out.println("       " + f);
                anyFail = true;
            }
        }

        // Even re-recording a known build requires current patch application evidence.
        if (save && problems.isEmpty() && blockers.isEmpty()) {
            if (args.length != 5 || !verifyPatch(apk, found.sha256, Path.of(args[3]), Path.of(args[4]))) {
                System.out.println("PROFILE: not written. --save requires a successful Desktop run; supply <profiles dir> <desktop.jar> <bundle.mpp>.");
                printKotlin(found, builds.values());
                System.exit(1);
            }
        }

        // The build's profile: recorded already, written now, or the controls that keep it from being written
        System.out.println();
        if (!problems.isEmpty()) {
            System.out.println("PROFILE: not written. These controls did not resolve:");
            for (var problem : problems) System.out.println("       " + problem);
            anyFail = true;
        } else if (!save && expected != null && expected.sameControls(found) && expected.dexSites.equals(found.dexSites)) {
            System.out.println("PROFILE: matches scripts/profiles/" + found.code + ".txt" +
                (expected.sha256.equals(found.sha256) ? "" : " (from a different APK file than the recorded one)"));
        } else if (expected != null && (!expected.sameControls(found) || !expected.dexSites.equals(found.dexSites))) {
            System.out.println("PROFILE: differs from scripts/profiles/" + found.code + ".txt; see the failures above.");
            anyFail = true;
        } else if (!blockers.isEmpty()) {
            System.out.println("PROFILE: not written. Every control resolved, but these checks failed: " + String.join(", ", blockers) + ".");
        } else if (!save) {
            System.out.println("PROFILE: every control resolved. Run again with --save to record this build.");
        } else if (found.code.isEmpty()) {
            System.out.println("PROFILE: not written. aapt2 couldn't read the version code.");
            anyFail = true;
        } else if (!found.code.matches("\\d{1,10}")) {
            // The code names the record file, so only a plain number may reach the path.
            System.out.println("PROFILE: not written. The version code " + found.code + " isn't a plain number.");
            anyFail = true;
        } else {
            Path record = saveDir.resolve(found.code + ".txt");
            if (Files.exists(record) && !Profile.read(record).lines().equals(found.lines())) {
                System.out.println("PROFILE: not written. " + record + " records a different APK with this version code;");
                System.out.println("         delete it first to replace it.");
                anyFail = true;
            } else {
                Files.createDirectories(saveDir);
                Files.writeString(record, String.join("\n", found.lines()) + "\n");
                System.out.println("PROFILE: wrote " + record);
                System.out.println();
                var others = new TreeMap<>(builds);
                others.remove(found.code);
                printKotlin(found, others.values());
            }
        }

        System.out.println();
        if (anyFail) {
            System.out.println("RESULT: FAIL - one or more patches are incompatible with this APK.");
            if (!builds.isEmpty()) System.out.println("Use an unmodified Messenger " + supported(builds) + ".");
            System.exit(1);
        } else {
            System.out.println("RESULT: PASS - all " + (PATCHES.size() + 3) + " patches are compatible.");
            System.exit(0);
        }
    }
}
