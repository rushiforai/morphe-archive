/*
 * Dry-run compatibility report for Messenger APKs, and the source of each build's profile.
 *
 * Checks whether a given APK is compatible with every HushMessenger patch
 * without modifying the file. Prints package, version code, ABI, signer and
 * PASS/FAIL per patch, then exits non-zero on any failure.
 *
 * Every supported build is recorded in scripts/profiles/<version code>.txt: its
 * version, SHA-256, hooks, the other values ControlProfile pins and the permission
 * loads. This report compares an APK with its recorded build, and the Python
 * scripts read their version and checksum tables from the same files. A Gradle
 * test checks each record against the Kotlin profiles, so the copies can't drift.
 *
 * Adding a build:
 *   CompatReport <apk> --save <profiles dir> <desktop.jar> <bundle.mpp>
 *                                     records the build only after Desktop applies
 *                                     and rebuilds every patch, then prints Kotlin.
 *   CompatReport --kotlin <record.txt>  prints the Kotlin for a recorded build again.
 *
 * Compile:
 *   javac -cp <dexlib2.jar>;<guava.jar> scripts/CompatReport.java
 * Run:
 *   java -cp <dexlib2.jar>;<guava.jar>;scripts CompatReport <apk>
 * or run the source file directly:
 *   java -cp <dexlib2.jar>;<guava.jar> scripts/CompatReport.java <apk>
 *
 * Requires: JDK 21+, smali-dexlib2-3.0.9.jar, guava-33.x-jre.jar,
 *           aapt2 and apksigner from Android Build Tools.
 */

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
import java.util.zip.ZipFile;

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
    // The Notifications tab's server flag ID as 585 numbers it. Meta renumbers it with each release.
    static final long PEOPLE_SERVER_FLAG = 72344162845931861L;
    // The redesigned emoji drawer's server flag as 585 numbers it. Meta renumbers it with each release.
    static final long EMOJI_DRAWER_FLAG = 36320528377659062L;
    // The drawer renderer throws this when the redesign can't draw, which ties the flag to the emoji drawer
    static final String EMOJI_DRAWER_ANCHOR = "Cannot render redesigned drawer with search icon ";
    // Controls whose hook count follows how Redex inlined one flag read, so it differs between releases
    static final Set<String> RELEASE_HOOK_COUNTS = Set.of("emoji_drawer", "pinned_chats");

    // Material You theme finds its targets by shape when it patches (MaterialYouPatch.kt), so no profile records them
    static final String DARK_SCHEME = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;";
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
        PATCHES.put("Hide growth prompts", List.of("growth", "growth_notes", "growth_story_card"));
        PATCHES.put("Hide inbox promotions", List.of("inbox_promotions"));
        PATCHES.put("Hide stories and notes", List.of("stories"));
        PATCHES.put("Hide inbox tabs", List.of("subtabs"));
        PATCHES.put("Hide Mark as read", List.of("mark_read_action"));
        PATCHES.put("Pin more chats", List.of("pinned_chats"));
        PATCHES.put("Hide Facebook shortcuts", List.of("facebook", "facebook_profile", "facebook_profile_header"));
        PATCHES.put("Hide Meta AI", List.of("ai_menu", "ai_fab", "ai_toolbar", "ai_tab", "ai_muse_tab", "ai_search", "ai_search_chip", "ai_mentions", "ai_commands", "ai_search_hint", "ai_search_screen_hint", "ai_mention_rows", "tab_config"));
        PATCHES.put("Hide Chat Moments", List.of("moments"));
        PATCHES.put("Hide Reels badge", List.of("reels_badge"));
        PATCHES.put("Hide People tab", List.of("tab_people", "tab_config"));
        PATCHES.put("Hide Notifications tab", List.of("tab_notifications", "tab_config"));
        PATCHES.put("Hide tab badges", List.of("tab_badges", "facebook_badge"));
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
        PATCHES.put("Hide Your story when sharing", List.of("share_story"));
        PATCHES.put("Use the phone's camera app", List.of("system_camera"));
        PATCHES.put("Open your gallery app", List.of("external_gallery"));
        PATCHES.put("Stop analytics uploads", List.of("analytics_uploads"));
        PATCHES.put("Stop ad attribution uploads", List.of("attribution_uploads"));
        PATCHES.put("Stop inbox and ad link logging", List.of("ad_events"));
        PATCHES.put("Stop live connection logging", List.of("mqtt_telemetry"));
        PATCHES.put("Stop nearby scans", List.of("nearby_scans", "wifi_identity"));
        PATCHES.put("Stop app list and device ID sharing", List.of("phone_id_sync"));
        PATCHES.put("Keep a message log", List.of("message_log"));
        PATCHES.put("Auto reply", List.of("auto_reply"));
        PATCHES.put("Quiet incoming calls", List.of("quiet_call_ring", "quiet_call_notification"));
        PATCHES.put("Allow screenshots", List.of("allow_screenshot", "screenshot_viewers"));
        PATCHES.put("Hide read receipts", List.of("hide_read_receipts", "reply_read"));
        PATCHES.put("Mark as read button", List.of("mark_read_bar", "mark_read_click"));
        PATCHES.put("Keep unsent messages", List.of("keep_unsent", "unsent_indicator", "delta_unsent"));
        PATCHES.put("Unlock app icons", List.of("app_icons"));
        PATCHES.put("Square profile pictures", List.of("avatar_shape"));
        PATCHES.put("Use your own font", List.of("font_layout", "font_repository", "font_roboto", "font_by_name", "font_input"));
        PATCHES.put("View stories anonymously", List.of("anonymous_stories"));
        PATCHES.put("Save any story", List.of("save_stories"));
        PATCHES.put("Slide chats in and out", List.of("chat_animation", "chat_fragment", "chat_inbox", "chat_legacy"));
        PATCHES.put("Bold and italic text", List.of("text_style"));
        PATCHES.put("Open settings from menu", List.of("menu_settings"));
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
                switch (parts[0]) {
                    case "version" -> p.version = parts[1];
                    case "code" -> p.code = parts[1];
                    case "sha256" -> p.sha256 = parts[1];
                    case "hook" -> p.hooks.computeIfAbsent(parts[1], key -> new TreeSet<>()).add(parts[2]);
                    case "dexSite" -> p.dexSites.put(parts[1], parts[2]);
                    default -> {
                        if (!FIELD_CONTROLS.containsKey(parts[0])) throw new IOException(file + ": unknown line " + line);
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
     * True when a method copies a list into a fresh ImmutableList.Builder exactly once, through 585's plain
     * invoke-virtual addAll(Iterable) straight after ImmutableList.builder() and followed at once by the static
     * (Builder) -> ImmutableList build on the same builder, and no branch, switch case or catch lands on the addAll,
     * since the patch's hook goes just before it. Mirrors validateKeyboardTabsInline in ControlHooks.kt.
     */
    static boolean keyboardTabCopy(Method method) {
        String builder = "Lcom/google/common/collect/ImmutableList$Builder;";
        var c = instructions(method); var copies = new ArrayList<Integer>();
        for (int i = 0; i < c.size(); i++) if (c.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && c.get(i) instanceof ReferenceInstruction r &&
            r.getReference() instanceof MethodReference m && builder.equals(m.getDefiningClass()) && "addAll".equals(m.getName()) &&
            builder.equals(m.getReturnType()) &&
            m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/Iterable;"))) copies.add(i);
        if (copies.size() != 1) return false;
        int at = copies.get(0);
        if (at < 2 || at + 1 >= c.size() || mediaTargets(method).contains(at)) return false;
        if (c.get(at - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || c.get(at - 2).getOpcode() != Opcode.INVOKE_STATIC ||
            !(c.get(at - 2) instanceof ReferenceInstruction made) ||
            !(IMMUTABLE_LIST + "->builder()" + builder).equals(made.getReference().toString())) return false;
        int made1 = ((OneRegisterInstruction) c.get(at - 1)).getRegisterA();
        var add = (FiveRegisterInstruction) c.get(at);
        if (add.getRegisterCount() != 2 || add.getRegisterC() != made1 || add.getRegisterD() == made1) return false;
        if (c.get(at + 1).getOpcode() != Opcode.INVOKE_STATIC || !(c.get(at + 1) instanceof ReferenceInstruction next) ||
            !(next.getReference() instanceof MethodReference build) || !IMMUTABLE_LIST.equals(build.getReturnType()) ||
            !build.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(builder))) return false;
        var buildCall = (FiveRegisterInstruction) c.get(at + 1);
        return buildCall.getRegisterCount() == 1 && buildCall.getRegisterC() == made1;
    }

    /** "585.0.0.53.94 (version code 347015062)", joined with " or " across version names. */
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
        // Builds of one release share every count. A new release is held to any recorded build's counts, except
        // where the count follows Redex's inlining of one flag read, which needs only one hook or more.
        Profile sameRelease = recorded.stream().filter(p -> p.version.equals(found.version)).findFirst().orElse(null);
        Profile shape = sameRelease != null ? sameRelease : recorded.isEmpty() ? null : recorded.iterator().next();
        for (var key : CONTROL_KEYS) {
            int count = found.hooks.getOrDefault(key, Set.of()).size();
            int expected = shape == null ? Math.max(count, 1) : shape.hooks.getOrDefault(key, Set.of()).size();
            if (sameRelease == null && RELEASE_HOOK_COUNTS.contains(key) && count >= 1) continue;
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
            if (modeCode.size() == 25) {
                found.fields.put("bubbleCapabilityGetter", ref(modeCode.get(11)));
                found.fields.put("bubbleRolloutGetter", ref(modeCode.get(21)));
            }
            var routes = nativeBubbleRoutes(classes, hookId(modes.get(0)));
            if (routes != null) found.fields.put("nativeBubbleRoutes", routes);
        }
        var community = communityInbox(classes);
        if (community != null) found.fields.put("nativeCommunityInbox", community.identity());
        for (var site : findDexSites(classes)) found.dexSites.put(site.getKey(), site.getValue());
        return found;
    }

    static final String BUBBLE_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;";
    /** The specifier of the bubble rollout read as 585 numbers it. Each release renumbers it, as in NativeBubbles.kt. */
    static final long BUBBLE_ROLLOUT = 36312002867630111L;
    static final String BUBBLE_ACTIVITY = "com.facebook.messaging.msys.thread.bubbles.activity.StaxThreadViewBubblesActivity";
    static final String SHORTCUT_BUILDER = "Landroid/content/pm/ShortcutInfo$Builder;";
    static final String MESSAGING_STYLE = "Landroidx/core/app/NotificationCompat$MessagingStyle;";

    static boolean jumpsTo(List<Instruction> code, int at, int target) {
        if (!(code.get(at) instanceof OffsetInstruction jump)) return false;
        int source = code.subList(0, at).stream().mapToInt(Instruction::getCodeUnits).sum();
        return source + jump.getCodeOffset() == code.subList(0, target).stream().mapToInt(Instruction::getCodeUnits).sum();
    }

    static boolean calls(Instruction instruction, int... registers) {
        if (!(instruction instanceof FiveRegisterInstruction call) || call.getRegisterCount() != registers.length) return false;
        int[] actual = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
        return Arrays.equals(registers, Arrays.copyOf(actual, registers.length));
    }

    static boolean validBubbleEligibility(Method m) {
        var c = instructions(m);
        var shape = List.of(Opcode.SGET, Opcode.CONST_16, Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
            Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN);
        return !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getParameterTypes().isEmpty() && "Z".equals(m.getReturnType()) &&
            m.getImplementation() != null && m.getImplementation().getRegisterCount() == 3 && m.getImplementation().getTryBlocks().isEmpty() &&
            c.stream().map(Instruction::getOpcode).toList().equals(shape) &&
            "Landroid/os/Build$VERSION;->SDK_INT:I".equals(ref(c.get(0))) && register(c.get(0)) == 1 &&
            ((NarrowLiteralInstruction)c.get(1)).getNarrowLiteral() == 30 && register(c.get(1)) == 0 &&
            ((TwoRegisterInstruction)c.get(2)).getRegisterA() == 1 && ((TwoRegisterInstruction)c.get(2)).getRegisterB() == 0 &&
            jumpsTo(c,2,13) && "Landroid/app/ActivityManager;".equals(ref(c.get(7))) &&
            "Landroid/app/ActivityManager;->isLowRamDevice()Z".equals(ref(c.get(8))) && calls(c.get(8),0) &&
            register(c.get(9)) == 0 && register(c.get(10)) == 0 && jumpsTo(c,10,13) &&
            ((NarrowLiteralInstruction)c.get(11)).getNarrowLiteral() == 1 && register(c.get(11)) == 0 &&
            register(c.get(12)) == 0 && ((NarrowLiteralInstruction)c.get(13)).getNarrowLiteral() == 0 &&
            register(c.get(13)) == 0 && register(c.get(14)) == 0;
    }

    static boolean validNativeBubbleMode(Method m, String eligibility, Profile profile) {
        var c = instructions(m);
        var shape = List.of(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
            Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
            Opcode.CHECK_CAST, Opcode.CONST_16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_WIDE, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE,
            Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.RETURN);
        String capability = profile.fields.get("bubbleCapabilityGetter"), rollout = profile.fields.get("bubbleRolloutGetter");
        return capability != null && rollout != null && !AccessFlags.STATIC.isSet(m.getAccessFlags()) &&
            "Z".equals(m.getReturnType()) && m.getParameterTypes().equals(List.of(BUBBLE_SESSION)) && m.getImplementation() != null &&
            m.getImplementation().getRegisterCount() == 5 && m.getImplementation().getTryBlocks().isEmpty() &&
            c.stream().map(Instruction::getOpcode).toList().equals(shape) &&
            register(c.get(0)) == 2 && ((NarrowLiteralInstruction)c.get(0)).getNarrowLiteral() == 0 &&
            calls(c.get(1),4,2) && eligibility.equals(ref(c.get(2))) && calls(c.get(2),3) && register(c.get(3)) == 0 &&
            register(c.get(4)) == 0 && jumpsTo(c,4,24) && capability.split("->")[0].equals(ref(c.get(9))) && register(c.get(9)) == 1 &&
            register(c.get(10)) == 0 && ((NarrowLiteralInstruction)c.get(10)).getNarrowLiteral() == 28 &&
            capability.equals(ref(c.get(11))) && calls(c.get(11),1,4,0) && register(c.get(12)) == 0 &&
            register(c.get(13)) == 0 && jumpsTo(c,13,24) && register(c.get(18)) == 2 && register(c.get(19)) == 0 &&
            ((WideLiteralInstruction)c.get(19)).getWideLiteral() == BUBBLE_ROLLOUT && register(c.get(20)) == 2 &&
            "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;".equals(ref(c.get(20))) &&
            rollout.equals(ref(c.get(21))) && calls(c.get(21),2,0,1) && register(c.get(22)) == 0 &&
            register(c.get(23)) == 0 && register(c.get(24)) == 2;
    }

    static boolean reachesBubbleApi(Map<String,ClassDef> byType, Method m, String api, int depth, Map<String,Integer> seen) {
        if (seen.getOrDefault(hookId(m),-1) >= depth) return false;
        seen.put(hookId(m),depth);
        var calls = instructions(m).stream().filter(i -> i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference)
            .map(i -> (MethodReference)((ReferenceInstruction)i).getReference()).toList();
        if (calls.stream().anyMatch(r -> api.equals(r.toString()))) return true;
        if (depth == 0) return false;
        for (var call : calls) {
            var cls = byType.get(call.getDefiningClass());
            if (cls == null) continue;
            for (var target : cls.getMethods()) if (hookId(target).equals(call.toString()) &&
                reachesBubbleApi(byType,target,api,depth-1,seen)) return true;
        }
        return false;
    }

    /** NativeBubbles.kt's bubbleGateHelper: the gate is read through a static (session, lazy holder) helper returning its answer. */
    static boolean bubbleGateHelper(Method m, String gate) {
        var c = instructions(m); var p = bubbleParameters(m);
        var shape = List.of(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN);
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) || p.size() != 2 ||
            !BUBBLE_SESSION.equals(p.get(0)) || m.getImplementation() == null || m.getImplementation().getRegisterCount() != 3 ||
            !m.getImplementation().getTryBlocks().isEmpty() || !c.stream().map(Instruction::getOpcode).toList().equals(shape) ||
            !(((ReferenceInstruction)c.get(0)).getReference() instanceof FieldReference holder) ||
            !(((ReferenceInstruction)c.get(1)).getReference() instanceof MethodReference fetch)) return false;
        var read = (TwoRegisterInstruction)c.get(0);
        return read.getRegisterA() == 0 && read.getRegisterB() == 2 && holder.getDefiningClass().equals(p.get(1)) &&
            fetch.getDefiningClass().equals(holder.getType()) && fetch.getName().equals("get") && fetch.getParameterTypes().isEmpty() &&
            fetch.getReturnType().equals("Ljava/lang/Object;") && calls(c.get(1),0) && register(c.get(2)) == 0 &&
            register(c.get(3)) == 0 && gate.split("->")[0].equals(ref(c.get(3))) && gate.equals(ref(c.get(4))) &&
            calls(c.get(4),0,1) && register(c.get(5)) == 0 && register(c.get(6)) == 0;
    }

    /** The shortcut builder names its ID through a static (ThreadKey)String helper that does. As in NativeBubbles.kt. */
    static boolean namesThreadShortcut(Map<String,ClassDef> byType, List<Instruction> c) {
        for (var i : c) if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m &&
            m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(BUBBLE_THREAD)) && "Ljava/lang/String;".equals(m.getReturnType()) &&
            bubbleTarget(byType, m) instanceof Method helper && instructions(helper).stream().anyMatch(h -> "thread_shortcut_".equals(ref(h)))) return true;
        return false;
    }

    /** NativeBubbles.kt's immutable connected-route checks. */
    static String nativeBubbleRoutes(List<ClassDef> classes, String gate) {
        var byType = new HashMap<String,ClassDef>(); classes.forEach(c -> byType.put(c.getType(),c));
        var activity = byType.get("L"+BUBBLE_ACTIVITY.replace('.','/')+";");
        if (activity == null || !"Lcom/facebook/messaging/msys/thread/fragment/MsysThreadViewActivity;".equals(activity.getSuperclass())) return null;
        boolean guarded = false;
        for (var m : activity.getMethods()) if (m.getName().equals("onPostResume") && instructions(m).stream().anyMatch(i -> gate.equals(ref(i)))) guarded = true;
        if (!guarded) return null;
        var shortcuts = new ArrayList<Method>(); var attachments = new ArrayList<Method>(); var conversations = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            var c = instructions(m); var refs = c.stream().map(CompatReport::ref).filter(Objects::nonNull).collect(Collectors.toSet());
            if (bubbleParameters(m).equals(List.of("Landroid/content/Context;","Landroid/graphics/Bitmap;","Lcom/facebook/messaging/model/threadkey/ThreadKey;","Ljava/lang/String;")) &&
                namesThreadShortcut(byType, c) && refs.contains(SHORTCUT_BUILDER+"->setPerson(Landroid/app/Person;)"+SHORTCUT_BUILDER) &&
                refs.contains(SHORTCUT_BUILDER+"->setIntent(Landroid/content/Intent;)"+SHORTCUT_BUILDER) &&
                refs.contains(SHORTCUT_BUILDER+"->build()Landroid/content/pm/ShortcutInfo;")) {
                for (int at=0;at<c.size();at++) if ((SHORTCUT_BUILDER+"->setLongLived(Z)"+SHORTCUT_BUILDER).equals(ref(c.get(at))) &&
                    c.get(at) instanceof FiveRegisterInstruction call && call.getRegisterCount()==2 && m.getImplementation().getTryBlocks().isEmpty()) {
                    int write=-1; for(int j=0;j<at;j++) if(c.get(j).getOpcode().setsRegister() && register(c.get(j))==call.getRegisterD()) write=j;
                    if(write>=0 && write<=2 && c.get(write).getOpcode()==Opcode.CONST_4 && ((NarrowLiteralInstruction)c.get(write)).getNarrowLiteral()==1) shortcuts.add(m);
                }
            }
            if (refs.contains("shouldAttachBubbleMetadataToNotification") && refs.contains("attach_bubble_metadata") &&
                (refs.contains(gate) || c.stream().anyMatch(i -> i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference called && bubbleTarget(byType, called) instanceof Method helper && bubbleGateHelper(helper, gate))) &&
                c.stream().anyMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference)) attachments.add(m);
            if (refs.contains(MESSAGING_STYLE) && refs.contains("Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;") &&
                refs.contains("Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V")) conversations.add(m);
        }
        if(shortcuts.size()!=1 || attachments.size()!=1 || conversations.size()!=1) return null;
        var shortcut=shortcuts.get(0); var attachment=attachments.get(0); var conversation=conversations.get(0);
        var fields=instructions(attachment).stream().filter(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference)
            .map(i -> (FieldReference)((ReferenceInstruction)i).getReference()).toList();
        if(fields.size()!=1) return null;
        var field=fields.get(0); var c=instructions(conversation);
        if(c.stream().noneMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && field.toString().equals(ref(i))) ||
            c.stream().noneMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f &&
                f.getDefiningClass().equals(field.getDefiningClass()) && f.getType().equals("Ljava/lang/String;"))) return null;
        var builder=byType.get(field.getDefiningClass()); if(builder==null) return null;
        for(var api : List.of("Landroid/app/Notification$Builder;->setBubbleMetadata(Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;",
                             "Landroid/app/Notification$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification$Builder;")) {
            boolean reached=false; var seen=new HashMap<String,Integer>();
            for(var root:builder.getMethods()) if(root.getReturnType().equals("Landroid/app/Notification;") && reachesBubbleApi(byType,root,api,4,seen)) reached=true;
            if(!reached) return null;
        }
        if (!connectedBubbleValues(classes, shortcut, attachment, conversation, field)) return null;
        return String.join("|",hookId(attachment),hookId(shortcut),hookId(conversation));
    }

    static final String BUBBLE_SHORTCUT = "Landroid/content/pm/ShortcutInfo;";
    static final String BUBBLE_THREAD = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";
    static final String BUBBLE_BUILDER = "Landroid/app/Notification$Builder;";
    static final String BUBBLE_PLATFORM_METADATA = "Landroid/app/Notification$BubbleMetadata;";
    static final String BUBBLE_METADATA_BUILDER = "Landroid/app/Notification$BubbleMetadata$Builder;";
    static final String BUBBLE_PENDING = "Landroid/app/PendingIntent;";

    static List<Integer> bubbleArgs(Instruction i) {
        if (i instanceof RegisterRangeInstruction r)
            return java.util.stream.IntStream.range(r.getStartRegister(), r.getStartRegister() + r.getRegisterCount()).boxed().toList();
        if (i instanceof FiveRegisterInstruction r)
            return Arrays.asList(r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG()).subList(0, r.getRegisterCount());
        return List.of();
    }

    record BubbleField(FieldReference reference, String base) {}

    /** NativeBubbles.kt's bounded reaching-definition and connected-value contracts. */
    static final class BubbleValues {
        final Method method;
        final List<Instruction> code;
        final List<List<Integer>> predecessors;
        final int parameterStart;
        final boolean valid;
        BubbleValues(Method method) {
            this.method = method;
            code = instructions(method);
            parameterStart = (method.getImplementation() == null ? 0 : method.getImplementation().getRegisterCount()) -
                bubbleParameters(method).stream().mapToInt(p -> p.equals("J") || p.equals("D") ? 2 : 1).sum() -
                (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            predecessors = new ArrayList<>();
            for (int i = 0; i < code.size(); i++) predecessors.add(new ArrayList<>());
            var offsets = new HashMap<Integer, Integer>();
            int offset = 0;
            for (int at = 0; at < code.size(); at++) { offsets.put(offset, at); offset += code.get(at).getCodeUnits(); }
            boolean supported = !code.isEmpty() && code.size() <= 2048;
            if (!code.isEmpty()) predecessors.get(0).add(-1);
            offset = 0;
            for (int at = 0; at < code.size(); at++) {
                var i = code.get(at); String op = i.getOpcode().name();
                if (op.contains("SWITCH") || op.contains("PAYLOAD")) supported = false;
                if (op.startsWith("INVOKE") && (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference) ||
                    op.contains("POLYMORPHIC"))) supported = false;
                if (op.startsWith("IF_") || op.startsWith("GOTO")) {
                    Integer target = i instanceof OffsetInstruction jump ? offsets.get(offset + jump.getCodeOffset()) : null;
                    if (target == null) supported = false; else predecessors.get(target).add(at);
                }
                if (!op.startsWith("GOTO") && !op.startsWith("RETURN") && !op.equals("THROW") && at + 1 < code.size())
                    predecessors.get(at + 1).add(at);
                offset += i.getCodeUnits();
            }
            var normal = predecessors.stream().map(List::copyOf).toList();
            var blocks = method.getImplementation() == null ? List.<com.android.tools.smali.dexlib2.iface.TryBlock<? extends com.android.tools.smali.dexlib2.iface.ExceptionHandler>>of() : method.getImplementation().getTryBlocks();
            if (blocks.size() > 32) supported = false;
            int edges = normal.stream().mapToInt(List::size).sum();
            for (var block : blocks.subList(0, Math.min(32, blocks.size()))) for (var handler : block.getExceptionHandlers()) {
                Integer target = offsets.get(handler.getHandlerCodeAddress());
                if (target == null) { supported = false; continue; }
                int address = 0;
                for (int at = 0; at < code.size(); at++) {
                    if (address >= block.getStartCodeAddress() && address < block.getStartCodeAddress() + block.getCodeUnitCount() && code.get(at).getOpcode().canThrow()) {
                        // A throwing instruction may not write its destination. Use its incoming values.
                        edges += normal.get(at).size();
                        if (edges > 8192) supported = false; else predecessors.get(target).addAll(normal.get(at));
                    }
                    address += code.get(at).getCodeUnits();
                }
            }
            valid = supported;
        }
        Integer parameter(String type) {
            int register = parameterStart + (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            Integer found = null;
            for (var p : bubbleParameters(method)) {
                if (p.equals(type)) { if (found != null) return null; found = register; }
                register += p.equals("J") || p.equals("D") ? 2 : 1;
            }
            return found;
        }
        int parameterAt(int index) {
            int register = parameterStart + (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            for (int n = 0; n < index; n++) register += bubbleParameters(method).get(n).equals("J") || bubbleParameters(method).get(n).equals("D") ? 2 : 1;
            return register;
        }
        Set<Integer> definitions(int before, int register) {
            if (!valid || before < 0 || before >= code.size()) return Set.of();
            var pending = new ArrayDeque<List<Integer>>(); pending.add(List.of(before, register));
            var seen = new HashSet<List<Integer>>(); var result = new TreeSet<Integer>();
            while (!pending.isEmpty()) {
                var work = pending.removeFirst(); int at = work.get(0), r = work.get(1);
                if (!seen.add(work)) continue;
                if (seen.size() > 4096 || result.size() > 8) return Set.of();
                if (predecessors.get(at).isEmpty()) return Set.of();
                for (int previous : predecessors.get(at)) {
                    if (previous < 0) {
                        if (r < parameterStart) return Set.of();
                        result.add(-r - 1); continue;
                    }
                    var i = code.get(previous);
                    if (!i.getOpcode().setsRegister() || register(i) != r) pending.add(List.of(previous, r));
                    else if (i.getOpcode().name().startsWith("MOVE") && i instanceof TwoRegisterInstruction move)
                        pending.add(List.of(previous, move.getRegisterB()));
                    else if (i.getOpcode() == Opcode.CHECK_CAST) pending.add(List.of(previous, r));
                    else {
                        Instruction call = previous > 0 ? code.get(previous - 1) : null;
                        MethodReference ref = call instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr ? mr : null;
                        if (i.getOpcode() == Opcode.MOVE_RESULT_OBJECT && ref != null &&
                            Set.of(SHORTCUT_BUILDER, BUBBLE_BUILDER, BUBBLE_METADATA_BUILDER, "Landroid/content/Intent;").contains(ref.getDefiningClass()) &&
                            ref.getReturnType().equals(ref.getDefiningClass()) && !ref.getName().equals("build") && !bubbleArgs(call).isEmpty())
                            pending.add(List.of(previous - 1, bubbleArgs(call).get(0)));
                        else result.add(previous);
                    }
                }
            }
            return result;
        }
        String key(int before, int register) { return key(before, register, 8); }
        String key(int before, int register, int depth) {
            if (depth == 0) return null;
            var definitions = definitions(before, register);
            if (definitions.isEmpty()) return null;
            var keys = new ArrayList<String>();
            for (int at : definitions) {
                if (at < 0) keys.add("p" + (-at - 1));
                else {
                    var i = code.get(at);
                    if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof TwoRegisterInstruction read) {
                        String base = key(at, read.getRegisterB(), depth - 1);
                        if (base == null) return null;
                        keys.add(ref(i) + "[" + base + "]");
                    } else keys.add(i.getOpcode().name() + ":" + at + ":" + ref(i));
                }
            }
            return String.join("|", keys);
        }
        Integer callValue(int before, int register) {
            var defs = definitions(before, register);
            if (defs.size() != 1) return null;
            int at = defs.iterator().next();
            return at > 0 && code.get(at).getOpcode() == Opcode.MOVE_RESULT_OBJECT &&
                code.get(at - 1).getOpcode().name().startsWith("INVOKE") ? at - 1 : null;
        }
        BubbleField fieldKey(int before, int register) {
            var defs = definitions(before, register); if (defs.size() != 1) return null;
            int at = defs.iterator().next();
            if (at < 0 || code.get(at).getOpcode() != Opcode.IGET_OBJECT || !(code.get(at) instanceof TwoRegisterInstruction read) ||
                !(code.get(at) instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof FieldReference field)) return null;
            String base = key(at, read.getRegisterB());
            return base == null ? null : new BubbleField(field, base);
        }
        Set<Integer> fieldDefinitions(int before, int register) {
            var defs = definitions(before, register); if (defs.size() != 1) return Set.of();
            int at = defs.iterator().next();
            if (at < 0 || code.get(at).getOpcode() != Opcode.IGET_OBJECT || !(code.get(at) instanceof TwoRegisterInstruction read)) return Set.of();
            return definitions(at, read.getRegisterB());
        }
        boolean returns(String expected) {
            if (expected == null) return false;
            for (int at = 0; at < code.size(); at++)
                if (code.get(at).getOpcode() == Opcode.RETURN_OBJECT && expected.equals(key(at, register(code.get(at))))) return true;
            return false;
        }
        List<Integer> calls() {
            if (!valid) return List.of();
            var calls = new ArrayList<Integer>();
            for (int at = 0; at < code.size(); at++) if (code.get(at).getOpcode().name().startsWith("INVOKE")) calls.add(at);
            return calls;
        }
        MethodReference reference(int at) {
            return code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr ? mr : null;
        }
        Integer argument(int at, int n) { var args = bubbleArgs(code.get(at)); return n >= 0 && n < args.size() ? args.get(n) : null; }
    }

    static Method bubbleTarget(Map<String, ClassDef> byType, MethodReference reference) {
        if (reference == null || !byType.containsKey(reference.getDefiningClass())) return null;
        Method found = null;
        for (var m : byType.get(reference.getDefiningClass()).getMethods()) if (hookId(m).equals(reference.toString())) {
            if (found != null) return null; found = m;
        }
        return found;
    }
    static Integer bubbleSingle(List<Integer> sites, java.util.function.Predicate<Integer> predicate) {
        var matches = sites.stream().filter(predicate).toList(); return matches.size() == 1 ? matches.get(0) : null;
    }
    static boolean bubbleReturnsCall(Map<String, ClassDef> byType, Method method, Method shortcut, String id, int depth, Map<String, Integer> seen) {
        if (hookId(method).equals(id) || (method.getDefiningClass().equals(shortcut.getDefiningClass()) &&
            method.getReturnType().equals(shortcut.getReturnType()) &&
            Objects.equals(String.valueOf(bubbleShortcutField(byType, method)), String.valueOf(bubbleShortcutField(byType, shortcut))))) return true;
        if (depth == 0 || seen.getOrDefault(hookId(method), -1) >= depth) return false;
        seen.put(hookId(method), depth);
        var f = new BubbleValues(method);
        for (int at = 0; at < f.code.size(); at++) if (f.code.get(at).getOpcode() == Opcode.RETURN_OBJECT)
            for (int definition : f.definitions(at, register(f.code.get(at)))) {
                if (definition <= 0 || f.code.get(definition).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                var called = bubbleTarget(byType, f.reference(definition - 1));
                if (called != null && bubbleReturnsCall(byType, called, shortcut, id, depth - 1, seen)) return true;
            }
        return false;
    }
    static MethodReference bubbleFactory(BubbleValues f, int store, String container, String containerType, FieldReference metadata) {
        var write = (TwoRegisterInstruction)f.code.get(store);
        Integer pack = f.callValue(store, write.getRegisterA()); if (pack == null) return null;
        var packRef = f.reference(pack);
        if (packRef == null || !packRef.getReturnType().equals(metadata.getType()) || !bubbleParameters(packRef).isEmpty()) return null;
        Integer receiver = f.argument(pack, 0), make = receiver == null ? null : f.callValue(pack, receiver);
        if (make == null) return null;
        var ref = f.reference(make); if (ref == null) return null;
        int argument = bubbleParameters(ref).indexOf(containerType) + (f.code.get(make).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
        Integer input = f.argument(make, argument);
        if (!ref.getReturnType().equals(packRef.getDefiningClass()) ||
            bubbleParameters(ref).stream().filter(containerType::equals).count() != 1 ||
            input == null || !Objects.equals(f.key(make, input), container)) return null;
        return ref;
    }
    static FieldReference bubbleShortcutField(Map<String, ClassDef> byType, Method shortcut) {
        var s = new BubbleValues(shortcut);
        Integer build = bubbleSingle(s.calls(), at -> (SHORTCUT_BUILDER + "->build()" + BUBBLE_SHORTCUT).equals(s.reference(at).toString()));
        if (build == null) return null;
        String builderKey = s.key(build, s.argument(build, 0)); if (builderKey == null) return null;
        for (var entry : Map.of("setLongLived", "Z", "setPerson", "Landroid/app/Person;", "setIntent", "Landroid/content/Intent;").entrySet()) {
            Integer at = bubbleSingle(s.calls(), i -> s.reference(i).getName().equals(entry.getKey()) && s.reference(i).getDefiningClass().equals(SHORTCUT_BUILDER));
            if (at == null || !Objects.equals(s.key(at, s.argument(at, 0)), builderKey)) return null;
            Integer argument = s.argument(at, 1); if (argument == null) return null;
            if (entry.getKey().equals("setLongLived")) {
                var defs = s.definitions(at, argument);
                if (defs.size() != 1) return null;
                int d = defs.iterator().next();
                if (d < 0 || !(s.code.get(d) instanceof NarrowLiteralInstruction literal) || literal.getNarrowLiteral() != 1) return null;
            } else {
                Integer result = s.callValue(at, argument);
                if (result == null || !s.reference(result).getReturnType().equals(entry.getValue())) return null;
            }
        }
        Integer containerCtor = bubbleSingle(s.calls(), at -> {
            var ref = s.reference(at); int index = bubbleParameters(ref).indexOf(BUBBLE_SHORTCUT);
            Integer argument = s.argument(at, index + 1);
            return ref.getName().equals("<init>") && ref.getDefiningClass().equals(shortcut.getReturnType()) && index >= 0 &&
                argument != null && Objects.equals(s.callValue(at, argument), build);
        });
        if (containerCtor != null && s.returns(s.key(containerCtor, s.argument(containerCtor, 0)))) {
            var constructor = bubbleTarget(byType, s.reference(containerCtor)); if (constructor == null) return null;
            var cf = new BubbleValues(constructor); Integer shortcutRegister = cf.parameter(BUBBLE_SHORTCUT);
            if (shortcutRegister == null) return null;
            var shortcutFields = new ArrayList<FieldReference>();
            for (int at = 0; at < cf.code.size(); at++) {
                var i = cf.code.get(at);
                if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                    !(((ReferenceInstruction)i).getReference() instanceof FieldReference field)) continue;
                if (field.getType().equals(BUBBLE_SHORTCUT) && Objects.equals(cf.key(at, write.getRegisterA()), cf.key(0, shortcutRegister)) &&
                    Objects.equals(cf.key(at, write.getRegisterB()), cf.key(0, cf.parameterStart))) shortcutFields.add(field);
            }
            if (shortcutFields.size() == 1) return shortcutFields.get(0);
        }
        // 584.1 armv7 builds the shortcut into a holder, then copies it onto the returned container in the
        // container constructor. Follow the holder field through the container constructor to the field readers use.
        var holderFields = new ArrayList<FieldReference>();
        for (int at = 0; at < s.code.size(); at++) {
            var i = s.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) ||
                !field.getType().equals(BUBBLE_SHORTCUT) || !Objects.equals(s.callValue(at, write.getRegisterA()), build)) continue;
            holderFields.add(field);
        }
        if (holderFields.size() == 1) {
            var holderField = holderFields.get(0);
            for (int at : s.calls()) {
                var ref = s.reference(at);
                if (!ref.getName().equals("<init>") || !ref.getDefiningClass().equals(shortcut.getReturnType())) continue;
                var constructor = bubbleTarget(byType, ref); if (constructor == null) continue;
                var cf = new BubbleValues(constructor); Integer holder = cf.parameter(holderField.getDefiningClass());
                if (holder == null) continue;
                for (int site = 0; site < cf.code.size(); site++) {
                    var i = cf.code.get(site);
                    if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                        !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) ||
                        !field.getDefiningClass().equals(shortcut.getReturnType()) || !field.getType().equals(BUBBLE_SHORTCUT)) continue;
                    var definitions = cf.definitions(site, write.getRegisterA());
                    if (definitions.size() != 1) continue;
                    int definition = definitions.iterator().next();
                    if (definition < 0 || cf.code.get(definition).getOpcode() != Opcode.IGET_OBJECT ||
                        !holderField.toString().equals(ref(cf.code.get(definition)))) continue;
                    int read = ((TwoRegisterInstruction) cf.code.get(definition)).getRegisterB();
                    if (Objects.equals(cf.key(definition, read), cf.key(0, holder))) return field;
                }
            }
        }
        return null;
    }

    static boolean connectedBubbleValues(List<ClassDef> classes, Method shortcut, Method attachment, Method conversation, FieldReference metadata) {
        var byType = new HashMap<String, ClassDef>(); classes.forEach(c -> byType.put(c.getType(), c));
        var shortcutField = bubbleShortcutField(byType, shortcut); if (shortcutField == null) return false;
        var a = new BubbleValues(attachment); var c = new BubbleValues(conversation);
        var storesA = new ArrayList<Integer>(); var storesC = new ArrayList<Integer>();
        for (int at = 0; at < a.code.size(); at++) if (a.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && metadata.toString().equals(ref(a.code.get(at)))) storesA.add(at);
        for (int at = 0; at < c.code.size(); at++) if (c.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && metadata.toString().equals(ref(c.code.get(at)))) storesC.add(at);
        if (storesA.size() != 1 || storesC.size() != 1) return false;
        int attachmentStore = storesA.get(0), conversationStore = storesC.get(0);
        Integer ap = a.parameter(shortcut.getReturnType()), notificationParameter = a.parameter(metadata.getDefiningClass());
        if (ap == null || notificationParameter == null ||
            !Objects.equals(a.key(attachmentStore, ((TwoRegisterInstruction)a.code.get(attachmentStore)).getRegisterB()), a.key(0, notificationParameter))) return false;
        var attachedFactory = bubbleFactory(a, attachmentStore, a.key(0, ap), shortcut.getReturnType(), metadata);
        if (attachedFactory == null) return false;
        Integer push = bubbleSingle(c.calls(), at -> ("Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(" + BUBBLE_SHORTCUT + ")V").equals(c.reference(at).toString()));
        if (push == null || c.argument(push, 1) == null) return false;
        var pushed = c.fieldKey(push, c.argument(push, 1));
        if (pushed == null || !pushed.reference().toString().equals(shortcutField.toString())) return false;
        var idStores = new ArrayList<Integer>();
        for (int at = 0; at < c.code.size(); at++) {
            var i = c.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) ||
                !field.getDefiningClass().equals(metadata.getDefiningClass()) || !field.getType().equals("Ljava/lang/String;")) continue;
            Integer call = c.callValue(at, write.getRegisterA());
            if (call != null && (BUBBLE_SHORTCUT + "->getId()Ljava/lang/String;").equals(c.reference(call).toString())) idStores.add(at);
        }
        if (idStores.size() != 1) return false;
        int idStore = idStores.get(0); var idWrite = (TwoRegisterInstruction)c.code.get(idStore);
        int idCall = c.callValue(idStore, idWrite.getRegisterA());
        var read = c.fieldKey(idCall, c.argument(idCall, 0));
        var conversationFactory = read == null ? null : bubbleFactory(c, conversationStore, read.base(), shortcut.getReturnType(), metadata);
        if (read == null || !read.reference().toString().equals(pushed.reference().toString()) ||
            !c.fieldDefinitions(idCall, c.argument(idCall, 0)).containsAll(c.fieldDefinitions(push, c.argument(push, 1))) ||
            c.fieldDefinitions(idCall, c.argument(idCall, 0)).stream().anyMatch(d -> d <= 0 || c.code.get(d).getOpcode() != Opcode.MOVE_RESULT_OBJECT ||
                bubbleTarget(byType, c.reference(d - 1)) == null || !bubbleReturnsCall(byType, bubbleTarget(byType, c.reference(d - 1)), shortcut, hookId(shortcut), 5, new HashMap<>())) ||
            !Objects.equals(c.key(idStore, idWrite.getRegisterB()),
            c.key(conversationStore, ((TwoRegisterInstruction)c.code.get(conversationStore)).getRegisterB())) ||
            conversationFactory == null || !conversationFactory.toString().equals(attachedFactory.toString())) return false;
        var idField = (FieldReference)((ReferenceInstruction)c.code.get(idStore)).getReference();
        String notificationKey = c.key(idStore, idWrite.getRegisterB()); if (notificationKey == null) return false;
        boolean style = c.calls().stream().anyMatch(at -> {
            if (!c.reference(at).getDefiningClass().equals(metadata.getDefiningClass()) || c.argument(at, 1) == null ||
                !Objects.equals(c.key(at, c.argument(at, 0)), notificationKey)) return false;
            var defs = c.definitions(at, c.argument(at, 1));
            if (defs.size() != 1) return false;
            int d = defs.iterator().next();
            return d >= 0 && c.code.get(d).getOpcode() == Opcode.NEW_INSTANCE && MESSAGING_STYLE.equals(ref(c.code.get(d)));
        });
        if (!style) return false;
        var make = bubbleTarget(byType, attachedFactory); if (make == null) return false;
        var mf = new BubbleValues(make); Integer containerParameter = mf.parameter(shortcut.getReturnType());
        if (containerParameter == null) return false;
        Integer packAt = a.callValue(attachmentStore, ((TwoRegisterInstruction)a.code.get(attachmentStore)).getRegisterA());
        var packMethod = packAt == null ? null : bubbleTarget(byType, a.reference(packAt)); if (packMethod == null) return false;
        var pending = new ArrayList<FieldReference>();
        for (int at = 0; at < mf.code.size(); at++) {
            var i = mf.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) || !field.getType().equals(BUBBLE_PENDING) ||
                !mf.returns(mf.key(at, write.getRegisterB()))) continue;
            Integer call = mf.callValue(at, write.getRegisterA()); if (call == null) continue;
            var ref = mf.reference(call); int index = bubbleParameters(ref).indexOf(BUBBLE_THREAD) + (mf.code.get(call).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
            Integer arg = mf.argument(call, index); var thread = arg == null ? null : mf.fieldKey(call, arg);
            if (ref.getReturnType().equals(BUBBLE_PENDING) && bubbleParameters(ref).stream().filter(BUBBLE_THREAD::equals).count() == 1 &&
                thread != null && thread.reference().getType().equals(BUBBLE_THREAD) &&
                thread.reference().getDefiningClass().equals(shortcut.getReturnType()) && Objects.equals(thread.base(), mf.key(0, containerParameter))) {
                var linked = bubbleMetadataField(byType, packMethod, field); if (linked != null) pending.add(linked);
            }
        }
        if (pending.stream().noneMatch(field -> bubbleNotificationBridge(byType, metadata, idField, field))) return false;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (instructions(method).stream().noneMatch(i -> i.getOpcode().name().startsWith("INVOKE") && hookId(attachment).equals(ref(i)))) continue;
            var f = new BubbleValues(method);
            for (int at : f.calls()) {
                if (!f.reference(at).toString().equals(hookId(attachment))) continue;
                var args = bubbleArgs(f.code.get(at)); if (args.size() < 5) continue;
                String wrapper = f.key(at, args.get(2)); Integer producerAt = f.callValue(at, args.get(4));
                if (wrapper == null || producerAt == null) continue;
                var producer = bubbleTarget(byType, f.reference(producerAt));
                if (producer == null || !producer.getReturnType().equals(shortcut.getReturnType()) ||
                    !bubbleReturnsCall(byType, producer, shortcut, hookId(shortcut), 5, new HashMap<>())) continue;
                boolean built = false;
                for (int site : f.calls()) if (site > at && bubbleBuildCall(byType, f, site, wrapper, metadata.getDefiningClass())) built = true;
                if (!built) continue;
                var p = new BubbleValues(producer); Integer parent = p.parameter(metadata.getDefiningClass());
                int passed = bubbleParameters(producer).indexOf(metadata.getDefiningClass()) + (AccessFlags.STATIC.isSet(producer.getAccessFlags()) ? 0 : 1);
                Integer argument = f.argument(producerAt, passed);
                if (parent == null || argument == null || !Objects.equals(f.key(producerAt, argument), wrapper)) continue;
                for (int site = 0; site < p.code.size(); site++) {
                    var i = p.code.get(site);
                    if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                        !idField.toString().equals(ref(i)) || !Objects.equals(p.key(site, write.getRegisterB()), p.key(0, parent))) continue;
                    Integer idCallP = p.callValue(site, write.getRegisterA()); if (idCallP == null || p.argument(idCallP, 0) == null) continue;
                    var readP = p.fieldKey(idCallP, p.argument(idCallP, 0));
                    if ((BUBBLE_SHORTCUT + "->getId()Ljava/lang/String;").equals(p.reference(idCallP).toString()) &&
                        readP != null && readP.reference().toString().equals(shortcutField.toString()) && p.returns(readP.base())) return true;
                }
            }
        }
        return false;
    }
    static boolean bubbleBuildCall(Map<String, ClassDef> byType, BubbleValues f, int at, String wrapper, String type) {
        var ref = f.reference(at); if (ref == null || !ref.getReturnType().equals("Landroid/app/Notification;")) return false;
        if (ref.getDefiningClass().equals(type)) return f.argument(at, 0) != null && Objects.equals(f.key(at, f.argument(at, 0)), wrapper);
        int index = bubbleParameters(ref).indexOf(type) + (f.code.get(at).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
        if (bubbleParameters(ref).stream().filter(type::equals).count() != 1 || f.argument(at, index) == null || !Objects.equals(f.key(at, f.argument(at, index)), wrapper)) return false;
        var helper = bubbleTarget(byType, ref); if (helper == null) return false;
        var h = new BubbleValues(helper); Integer parent = h.parameter(type); if (parent == null) return false;
        for (int site : h.calls()) if (h.reference(site).getDefiningClass().equals(type) && h.reference(site).getReturnType().equals("Landroid/app/Notification;") &&
            h.argument(site, 0) != null && Objects.equals(h.key(site, h.argument(site, 0)), h.key(0, parent))) {
            for (int r = 0; r < h.code.size(); r++) if (h.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(h.callValue(r, register(h.code.get(r))), site)) return true;
        }
        return false;
    }
    static FieldReference bubbleStoredField(Map<String, ClassDef> byType, Method constructor, int index, int depth) {
        var f = new BubbleValues(constructor); String value = f.key(0, f.parameterAt(index)); if (value == null) return null;
        var fields = new ArrayList<FieldReference>();
        for (int at = 0; at < f.code.size(); at++) {
            var i = f.code.get(at);
            if (i.getOpcode() == Opcode.IPUT_OBJECT && i instanceof TwoRegisterInstruction write && i instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof FieldReference field && field.getType().equals(BUBBLE_PENDING) &&
                Objects.equals(f.key(at, write.getRegisterA()), value) && Objects.equals(f.key(at, write.getRegisterB()), f.key(0, f.parameterStart))) fields.add(field);
        }
        if (!fields.isEmpty()) return fields.size() == 1 ? fields.get(0) : null;
        if (depth == 0) return null;
        for (int at : f.calls()) {
            var ref = f.reference(at);
            if (ref == null || !ref.getName().equals("<init>") || !ref.getDefiningClass().equals(constructor.getDefiningClass()) || f.argument(at, 0) == null ||
                !Objects.equals(f.key(at, f.argument(at, 0)), f.key(0, f.parameterStart))) continue;
            Integer forwarded = null;
            for (int n = 0; n < bubbleParameters(ref).size(); n++) if (bubbleParameters(ref).get(n).equals(BUBBLE_PENDING) &&
                f.argument(at, n + 1) != null && Objects.equals(f.key(at, f.argument(at, n + 1)), value)) {
                if (forwarded != null) return null; forwarded = n;
            }
            var target = bubbleTarget(byType, ref); if (forwarded == null || target == null) continue;
            var field = bubbleStoredField(byType, target, forwarded, depth - 1); if (field != null) fields.add(field);
        }
        return fields.size() == 1 ? fields.get(0) : null;
    }
    static FieldReference bubbleMetadataField(Map<String, ClassDef> byType, Method pack, FieldReference pending) {
        var f = new BubbleValues(pack); var fields = new ArrayList<FieldReference>();
        for (int at : f.calls()) {
            var ref = f.reference(at); if (ref == null) continue;
            int index = bubbleParameters(ref).indexOf(BUBBLE_PENDING);
            if (!ref.getName().equals("<init>") || !ref.getDefiningClass().equals(pack.getReturnType()) || index < 0 || f.argument(at, 0) == null ||
                !f.returns(f.key(at, f.argument(at, 0))) || f.argument(at, index + 1) == null) continue;
            var read = f.fieldKey(at, f.argument(at, index + 1));
            if (read == null || !read.reference().toString().equals(pending.toString()) || !Objects.equals(read.base(), f.key(0, f.parameterStart))) continue;
            var target = bubbleTarget(byType, ref); if (target == null) continue;
            var field = bubbleStoredField(byType, target, index, 2); if (field != null) fields.add(field);
        }
        return fields.size() == 1 ? fields.get(0) : null;
    }
    static boolean bubbleConversion(Map<String, ClassDef> byType, Method conversion, FieldReference pending, int depth) {
        var f = new BubbleValues(conversion); Integer parent = f.parameter(pending.getDefiningClass()); if (parent == null) return false;
        for (int at : f.calls()) {
            var ref = f.reference(at); if (ref == null) continue;
            if (ref.toString().equals(BUBBLE_METADATA_BUILDER + "-><init>(" + BUBBLE_PENDING + "Landroid/graphics/drawable/Icon;)V")) {
                if (f.argument(at, 1) == null || f.argument(at, 0) == null) continue;
                var read = f.fieldKey(at, f.argument(at, 1)); int receiver = f.argument(at, 0);
                if (read == null || !read.reference().toString().equals(pending.toString()) || !Objects.equals(read.base(), f.key(0, parent))) continue;
                for (int site : f.calls()) if ((BUBBLE_METADATA_BUILDER + "->build()" + BUBBLE_PLATFORM_METADATA).equals(f.reference(site).toString()) &&
                    f.argument(site, 0) != null && f.definitions(site, f.argument(site, 0)).containsAll(f.definitions(at, receiver))) {
                    for (int r = 0; r < f.code.size(); r++) if (f.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(f.callValue(r, register(f.code.get(r))), site)) return true;
                }
            } else if (depth > 0 && ref.getReturnType().equals(BUBBLE_PLATFORM_METADATA) && bubbleParameters(ref).equals(List.of(pending.getDefiningClass())) &&
                f.argument(at, 0) != null && Objects.equals(f.key(at, f.argument(at, 0)), f.key(0, parent))) {
                boolean returned = false;
                for (int r = 0; r < f.code.size(); r++) if (f.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && f.definitions(r, register(f.code.get(r))).contains(at + 1)) returned = true;
                var target = bubbleTarget(byType, ref);
                if (returned && target != null && bubbleConversion(byType, target, pending, depth - 1)) return true;
            }
        }
        return false;
    }
    static boolean bubbleNotificationBridge(Map<String, ClassDef> byType, FieldReference metadata, FieldReference id, FieldReference pending) {
        var owner = byType.get(metadata.getDefiningClass()); if (owner == null) return false;
        var roots = new ArrayList<Method>();
        for (var m : owner.getMethods()) if (m.getReturnType().equals("Landroid/app/Notification;") && bubbleParameters(m).isEmpty()) roots.add(m);
        if (roots.size() != 1) return false;
        var r = new BubbleValues(roots.get(0));
        Integer build = bubbleSingle(r.calls(), at -> (BUBBLE_BUILDER + "->build()Landroid/app/Notification;").equals(r.reference(at).toString()));
        if (build == null || r.argument(build, 0) == null) return false;
        boolean builtReturn = false;
        for (int at = 0; at < r.code.size(); at++) if (r.code.get(at).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(r.callValue(at, register(r.code.get(at))), build)) builtReturn = true;
        if (!builtReturn) return false;
        var builder = r.fieldKey(build, r.argument(build, 0)); if (builder == null) return false;
        Integer ctorAt = bubbleSingle(r.calls(), at -> r.reference(at).getName().equals("<init>") &&
            r.reference(at).getDefiningClass().equals(builder.reference().getDefiningClass()) && r.argument(at, 1) != null &&
            Objects.equals(r.key(at, r.argument(at, 0)), builder.base()) && Objects.equals(r.key(at, r.argument(at, 1)), r.key(0, r.parameterStart)));
        if (ctorAt == null) return false;
        var constructor = bubbleTarget(byType, r.reference(ctorAt)); if (constructor == null) return false;
        var f = new BubbleValues(constructor); Integer parent = f.parameter(metadata.getDefiningClass()); if (parent == null) return false;
        Integer platformStore = bubbleSingle(java.util.stream.IntStream.range(0, f.code.size()).boxed().toList(), at -> f.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && builder.reference().toString().equals(ref(f.code.get(at))));
        if (platformStore == null) return false;
        var write = (TwoRegisterInstruction)f.code.get(platformStore); var values = f.definitions(platformStore, write.getRegisterA());
        if (values.size() != 1) return false;
        int value = values.iterator().next();
        if (value < 0 || f.code.get(value).getOpcode() != Opcode.NEW_INSTANCE || !BUBBLE_BUILDER.equals(ref(f.code.get(value))) ||
            !Objects.equals(f.key(platformStore, write.getRegisterB()), f.key(0, f.parameterStart))) return false;
        String platformKey = builder.reference() + "[" + f.key(0, f.parameterStart) + "]";
        Integer shortcut = bubbleSingle(f.calls(), at -> (BUBBLE_BUILDER + "->setShortcutId(Ljava/lang/String;)" + BUBBLE_BUILDER).equals(f.reference(at).toString()));
        if (shortcut == null || f.argument(shortcut, 1) == null || !Objects.equals(f.key(shortcut, f.argument(shortcut, 0)), platformKey) ||
            !bubbleReadsField(f, shortcut, f.argument(shortcut, 1), id, parent)) return false;
        for (int at : f.calls()) {
            var ref = f.reference(at);
            if (!bubbleParameters(ref).equals(List.of(BUBBLE_PLATFORM_METADATA, BUBBLE_BUILDER)) || !ref.getReturnType().equals("V")) continue;
            var args = bubbleArgs(f.code.get(at));
            if (args.size() != 2 || !Objects.equals(f.key(at, args.get(1)), platformKey)) continue;
            Integer convert = f.callValue(at, args.get(0)); if (convert == null) continue;
            var conversion = f.reference(convert);
            if (!bubbleParameters(conversion).equals(List.of(metadata.getType())) || !conversion.getReturnType().equals(BUBBLE_PLATFORM_METADATA) ||
                f.argument(convert, 0) == null || !bubbleReadsField(f, convert, f.argument(convert, 0), metadata, parent)) continue;
            var converter = bubbleTarget(byType, conversion); if (converter == null || !bubbleConversion(byType, converter, pending, 3)) continue;
            var delegate = bubbleTarget(byType, ref); if (delegate == null) continue;
            var d = new BubbleValues(delegate);
            Integer mp = d.parameter(BUBBLE_PLATFORM_METADATA), bp = d.parameter(BUBBLE_BUILDER); if (mp == null || bp == null) continue;
            for (int site : d.calls()) if ((BUBBLE_BUILDER + "->setBubbleMetadata(" + BUBBLE_PLATFORM_METADATA + ")" + BUBBLE_BUILDER).equals(d.reference(site).toString()) &&
                d.argument(site, 1) != null && Objects.equals(d.key(site, d.argument(site, 0)), d.key(0, bp)) &&
                Objects.equals(d.key(site, d.argument(site, 1)), d.key(0, mp))) return true;
        }
        return false;
    }
    static boolean bubbleReadsField(BubbleValues f, int at, int register, FieldReference field, int parent) {
        var read = f.fieldKey(at, register);
        return read != null && read.reference().toString().equals(field.toString()) && Objects.equals(read.base(), f.key(0, parent));
    }

    static List<String> bubbleParameters(MethodReference reference) {
        return reference.getParameterTypes().stream().map(CharSequence::toString).toList();
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

    /** The Kotlin a new build needs, reusing a recorded build's profile or sites when they're identical. */
    static void printKotlin(Profile build, Collection<Profile> others) {
        var sameControls = others.stream().filter(o -> o.sameControls(build)).map(o -> o.code).toList();
        var sameSites = others.stream().filter(o -> o.dexSites.equals(build.dexSites)).map(o -> o.code).toList();
        System.out.println("// MessengerTarget.kt: list " + build.code + " under \"" + build.version + "\" in VERSIONS.");
        if (sameControls.isEmpty()) {
            System.out.println("// ControlProfiles.kt: add this profile and map " + build.code + " to it in controlProfiles.");
            System.out.println();
            System.out.print(kotlinProfile(build));
        } else {
            System.out.println("// ControlProfiles.kt: the controls match build " + String.join(", ", sameControls) +
                ". Map " + build.code + " to the same profile in controlProfiles.");
        }
        System.out.println();
        if (sameSites.isEmpty()) {
            System.out.println("// InstallBesideMetaAppsPatch.kt: add these sites and map " + build.code + " to them in expectedDexSitesByBuild.");
            System.out.println();
            System.out.print(kotlinDexSites(build));
        } else {
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
        var container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (var name : container.getDexEntryNames()) {
            if (name.matches("classes[0-9]*\\.dex")) classes.addAll(container.getEntry(name).getDexFile().getClasses());
        }
        return classes;
    }

    static final String CLONE = "Clone install under another package name";

    /** Redex string pools' keys that give Messenger's name, as "pool#key". Mirrors ownNamePoolKeys in CloneInstallPatch.kt. */
    static Set<String> ownNamePoolKeys(List<ClassDef> classes) {
        var keys = new HashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Ljava/lang/String;".equals(m.getReturnType()) ||
                m.getParameterTypes().size() != 1 || !"I".equals(m.getParameterTypes().get(0).toString()) || m.getImplementation() == null) continue;
            var code = instructions(m);
            if (code.isEmpty() || !(code.get(0) instanceof OffsetInstruction table) ||
                (code.get(0).getOpcode() != Opcode.PACKED_SWITCH && code.get(0).getOpcode() != Opcode.SPARSE_SWITCH)) continue;
            var indexAt = new HashMap<Integer, Integer>();
            for (int i = 0, address = 0; i < code.size(); address += code.get(i).getCodeUnits(), i++) indexAt.put(address, i);
            var payloadAt = indexAt.get(table.getCodeOffset());
            if (payloadAt == null || !(code.get(payloadAt) instanceof SwitchPayload payload)) continue;
            for (var element : payload.getSwitchElements()) {
                var at = indexAt.get(element.getOffset());
                if (at == null || at + 1 >= code.size()) continue;
                var load = code.get(at);
                if ((load.getOpcode() == Opcode.CONST_STRING || load.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                    "com.facebook.orca".equals(((StringReference) ((ReferenceInstruction) load).getReference()).getString()) &&
                    code.get(at + 1).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(at + 1)) == register(load))
                    keys.add(hookId(m) + "#" + element.getKey());
            }
        }
        return keys;
    }

    /** Whether some move-result takes Messenger's name from a string pool lookup by a constant key. */
    static boolean pooledOwnName(List<Instruction> code, Set<String> pools) {
        for (int load = 1; load < code.size(); load++) {
            if (code.get(load).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(load - 1).getOpcode() != Opcode.INVOKE_STATIC ||
                !(code.get(load - 1) instanceof FiveRegisterInstruction lookup) || lookup.getRegisterCount() != 1) continue;
            int key = lookup.getRegisterC();
            for (int j = load - 2; j >= 0; j--) {
                if (!code.get(j).getOpcode().setsRegister() || register(code.get(j)) != key) continue;
                if (Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16).contains(code.get(j).getOpcode()) &&
                    pools.contains(ref(lookup) + "#" + ((NarrowLiteralInstruction) code.get(j)).getNarrowLiteral())) return true;
                break;
            }
        }
        return false;
    }

    /**
     * The two methods the clone patch edits (CloneInstallPatch.kt): the encrypted-backup preference lookup, a public
     * no-argument constructor that reads getPackageName once, and the static attachment authority check.
     */
    static List<String> cloneSites(List<ClassDef> classes, List<String> failures) {
        var lookups = new ArrayList<String>();
        var checks = new ArrayList<String>();
        var pools = ownNamePoolKeys(classes);
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                var strings = new ArrayList<String>();
                int packageReads = 0;
                for (var insn : impl.getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    if (ref.getReference() instanceof StringReference s) strings.add(s.getString());
                    if (ref.getReference() instanceof MethodReference m && "Landroid/content/Context;".equals(m.getDefiningClass()) &&
                        "getPackageName".equals(m.getName())) packageReads++;
                }
                // 583 takes Messenger's name from a string pool instead of a constant.
                if (strings.contains("autobackupprefs") && strings.contains("fbautobackupprefs") &&
                    (strings.contains("com.facebook.orca") || pooledOwnName(instructions(method), pools)) &&
                    "<init>".equals(method.getName()) && method.getParameterTypes().isEmpty() && AccessFlags.PUBLIC.isSet(method.getAccessFlags())) {
                    if (packageReads != 1) failures.add(hookId(method) + " reads its package name " + packageReads + " times");
                    lookups.add(hookId(method));
                }
                if (Collections.frequency(strings, "com.facebook.orca.tam-attachment") == 1 && strings.contains(".tam-attachment") &&
                    strings.contains("com.facebook.katana.tam-attachment") && AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
                    "Z".equals(method.getReturnType()) && List.of("Ljava/lang/String;").equals(method.getParameterTypes().stream().map(Object::toString).toList())) {
                    checks.add(hookId(method));
                }
            }
        }
        if (lookups.size() != 1) failures.add("expected one encrypted-backup lookup, found " + lookups.size());
        if (checks.size() != 1) failures.add("expected one attachment authority check, found " + checks.size());
        var sites = new ArrayList<String>(lookups);
        sites.addAll(checks);
        return sites;
    }

    static Method findSignerMethod(List<ClassDef> classes) {
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (!method.getParameterTypes().isEmpty()) continue;
                var impl = method.getImplementation();
                if (impl == null) continue;
                boolean hasApkContents = false, hasHistory = false, hasSignatures = false;
                for (var insn : impl.getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    var refObj = ref.getReference();
                    if (refObj instanceof MethodReference mRef &&
                        "Landroid/content/pm/SigningInfo;".equals(mRef.getDefiningClass())) {
                        if ("getApkContentsSigners".equals(mRef.getName())) hasApkContents = true;
                        if ("getSigningCertificateHistory".equals(mRef.getName())) hasHistory = true;
                    } else if (refObj instanceof FieldReference fRef &&
                        "Landroid/content/pm/PackageInfo;".equals(fRef.getDefiningClass()) &&
                        "signatures".equals(fRef.getName())) {
                        hasSignatures = true;
                    }
                }
                if (hasApkContents && hasHistory && hasSignatures) return method;
            }
        }
        return null;
    }

    /**
     * FBNS's package check (RestoreTrustPatch.kt's FbnsPackageCheckFingerprint): a void method that reads
     * PackageInfo.signatures once and logs "PackageInfoUtil" and "Failed to create SHA-256 hash". The read's
     * two registers must be distinct and at most v15, as routeFbnsSigners requires.
     */
    static List<String> fbnsCheckProblems(List<ClassDef> classes) {
        var problems = new ArrayList<String>();
        var checks = new ArrayList<Method>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (!"V".equals(method.getReturnType()) || method.getImplementation() == null) continue;
                // The fingerprint's filters match in order: the read, then the tag after it, then the hash failure.
                int step = 0;
                for (var insn : method.getImplementation().getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    if (step == 0 && ref.getReference() instanceof FieldReference f
                        && "Landroid/content/pm/PackageInfo;".equals(f.getDefiningClass()) && "signatures".equals(f.getName())) step = 1;
                    else if (step == 1 && ref.getReference() instanceof StringReference s && "PackageInfoUtil".equals(s.getString())) step = 2;
                    else if (step == 2 && ref.getReference() instanceof StringReference s
                        && "Failed to create SHA-256 hash".equals(s.getString())) step = 3;
                }
                if (step == 3) checks.add(method);
            }
        }
        if (checks.size() != 1) {
            problems.add("expected one FBNS package check, found " + checks.size());
            return problems;
        }
        var reads = new ArrayList<TwoRegisterInstruction>();
        for (var insn : checks.get(0).getImplementation().getInstructions()) {
            if (insn.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) insn).getReference() instanceof FieldReference f
                && "Landroid/content/pm/PackageInfo;".equals(f.getDefiningClass()) && "signatures".equals(f.getName())) {
                reads.add((TwoRegisterInstruction) insn);
            }
        }
        if (reads.size() != 1) problems.add("expected one PackageInfo.signatures read in " + hookId(checks.get(0)) + ", found " + reads.size());
        else if (reads.get(0).getRegisterA() == reads.get(0).getRegisterB() || reads.get(0).getRegisterA() > 15 || reads.get(0).getRegisterB() > 15) {
            problems.add("FBNS package check " + hookId(checks.get(0)) + " reads signatures into v" + reads.get(0).getRegisterA()
                + " from v" + reads.get(0).getRegisterB() + ", which the call can't name");
        }
        return problems;
    }

    /**
     * The Threads and Instagram link launchers (RestoreTrustPatch.kt's linkLaunchSites): a void (Context, Uri)
     * method with the app's log tag, with (Context, Intent)Z family launches whose answers the return-void after
     * each drops. Every launch must take the extension call the way the patch places it, and the app's package
     * must load before the tag, as a literal or, on some 585 builds, through a string table lookup.
     */
    static List<String> linkLauncherProblems(List<ClassDef> classes) {
        var problems = new ArrayList<String>();
        var tables = stringTables(classes);
        String[][] apps = {{"Threads", "com.instagram.barcelona", "ThreadsLinkLauncher"}, {"Instagram", "com.instagram.android", "InstagramLinkLauncher"}};
        for (var app : apps) {
            var launchers = new ArrayList<Method>();
            for (var cls : classes) {
                for (var method : cls.getMethods()) {
                    if (!"V".equals(method.getReturnType()) || method.getImplementation() == null) continue;
                    if (!List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(method.getParameterTypes().stream().map(CharSequence::toString).toList())) continue;
                    if (instructions(method).stream().anyMatch(i -> app[2].equals(inboxString(i)))) launchers.add(method);
                }
            }
            if (launchers.size() != 1) {
                problems.add("expected one " + app[0] + " link launcher, found " + launchers.size());
                continue;
            }
            var code = instructions(launchers.get(0));
            int named = -1, tag = -1;
            for (int i = 0; i < code.size(); i++) {
                if (named < 0 && (app[1].equals(inboxString(code.get(i))) || (i > 0 && tableStrings(code.subList(i - 1, i + 1), tables).contains(app[1])))) named = i;
                if (tag < 0 && app[2].equals(inboxString(code.get(i)))) tag = i;
            }
            if (named < 0 || named > tag) {
                problems.add(app[0] + "'s link launcher " + hookId(launchers.get(0)) + " doesn't load " + app[1] + " before its tag");
                continue;
            }
            String why = linkLaunchProblem(launchers.get(0));
            if (why != null) problems.add(app[0] + "'s link launcher " + hookId(launchers.get(0)) + " " + why);
        }
        return problems;
    }

    static String linkLaunchProblem(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags())) return "is static";
        var code = instructions(method);
        var launches = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m
                && "Z".equals(m.getReturnType()) && List.of("Landroid/content/Context;", "Landroid/content/Intent;").equals(m.getParameterTypes().stream().map(CharSequence::toString).toList())) {
                launches.add(i);
            }
        }
        if (launches.isEmpty()) return "has no launches";
        for (int index : launches) {
            String why = linkLaunchProblem(method, code, index);
            if (why != null) return why;
        }
        return null;
    }

    static String linkLaunchProblem(Method method, List<Instruction> code, int index) {
        if (index + 1 >= code.size() || code.get(index + 1).getOpcode() != Opcode.RETURN_VOID) return "uses its launch's answer";
        if (mediaTargets(method).contains(index + 1)) return "jumps to the return after its launch";
        var call = (FiveRegisterInstruction) code.get(index);
        int launcher = call.getRegisterC(), context = call.getRegisterD(), intent = call.getRegisterE();
        if (launcher == context || launcher == intent || context == intent || Math.max(launcher, Math.max(context, intent)) > 15) {
            return "launches with v" + launcher + ", v" + context + " and v" + intent + ", which the call can't name";
        }
        if (context != method.getImplementation().getRegisterCount() - 2) return "launches with a Context other than its own";
        int build = -1, builds = 0;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_STATIC && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m
                && "Landroid/content/Intent;".equals(m.getReturnType()) && List.of("Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(CharSequence::toString).toList())) {
                build = i;
                builds++;
            }
        }
        if (builds != 1) return "builds " + builds + " intents from its link, expected 1";
        if (build > index || code.get(build + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
            || ((OneRegisterInstruction) code.get(build + 1)).getRegisterA() != intent) {
            return "launches an intent other than the one it built from the link";
        }
        // The catch block after the return reuses the register for its log message, which can't reach the launch.
        for (int i = build + 2; i < index; i++) {
            if (code.get(i).getOpcode().setsRegister() && code.get(i) instanceof OneRegisterInstruction one && one.getRegisterA() == intent) {
                return "writes its intent's register again before its launch";
            }
        }
        int[] addresses = new int[code.size() + 1];
        for (int i = 0; i < code.size(); i++) addresses[i + 1] = addresses[i] + code.get(i).getCodeUnits();
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) indexAt.put(addresses[i], i);
        for (int i = index + 1; i < code.size(); i++) {
            if (!(code.get(i) instanceof OffsetInstruction jump)) continue;
            int landing = addresses[i] + jump.getCodeOffset();
            var cases = new ArrayList<Integer>();
            if (jump.getOpcode() == Opcode.PACKED_SWITCH || jump.getOpcode() == Opcode.SPARSE_SWITCH) {
                Integer at = indexAt.get(landing);
                if (at != null && code.get(at) instanceof SwitchPayload payload) for (var e : payload.getSwitchElements()) cases.add(addresses[i] + e.getOffset());
            } else {
                cases.add(landing);
            }
            for (int c : cases) if (c <= addresses[index]) return "jumps back to its launch from after it";
        }
        return null;
    }

    static final String EPHEMERAL_VIEWER = "Lcom/facebook/messaging/media/ephemeralmedia/viewer/EphemeralMediaViewerFragment;";
    static final String QUICKSNAP_VIEWER = "Lcom/facebook/messaging/quicksnap/consumption/viewer/MsgrQuicksnapViewerFragment;";
    static final String WINDOW = "Landroid/view/Window;";
    static final String SET_FLAGS = WINDOW + "->setFlags(II)V", ADD_FLAGS = WINDOW + "->addFlags(I)V";
    static final int GENERATE_AI_LABEL = 0x7f140560;
    // "Generate": the same cell's label when its tap opens the custom, AI and music sticker menu
    static final int GENERATE_MENU_LABEL = 0x7f141c2d;
    // The same menu label in the 585 armv7 builds, two resources later
    static final int GENERATE_MENU_LABEL_ARMV7 = 0x7f141c2f;
    // The viewer's onCreateDialog override: A1J in 585 arm64 and the 347014974 armv7 family, A1H in the 347014990 one
    static final String EPHEMERAL_DIALOG = "A1J";
    static final java.util.Set<String> EPHEMERAL_DIALOGS = Set.of(EPHEMERAL_DIALOG, "A1H");
    // The Quicksnap viewer's onCreateView frame: 40 registers on 585 arm64, 39 on armv7
    static final java.util.Set<Integer> QUICKSNAP_REGISTERS = Set.of(39, 40);

    static int mediaTarget(List<Instruction> code, int at) {
        if (!(code.get(at) instanceof OffsetInstruction jump)) return -1;
        int offset = 0;
        for (int i = 0; i < at; i++) offset += code.get(i).getCodeUnits();
        int target = offset + jump.getCodeOffset(); offset = 0;
        for (int i = 0; i < code.size(); i++) { if (offset == target) return i; offset += code.get(i).getCodeUnits(); }
        return -1;
    }
    static Set<Integer> mediaTargets(Method method) {
        var code = instructions(method); var offsets = new HashMap<Integer, Integer>(); int offset = 0;
        for (int i = 0; i < code.size(); i++) { offsets.put(offset, i); offset += code.get(i).getCodeUnits(); }
        var targets = new HashSet<Integer>(); offset = 0;
        for (var i : code) {
            if (i instanceof OffsetInstruction jump) {
                Integer landing = offsets.get(offset + jump.getCodeOffset());
                if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                    if (landing != null && code.get(landing) instanceof SwitchPayload payload)
                        for (var e : payload.getSwitchElements()) targets.add(offsets.getOrDefault(offset + e.getOffset(), -1));
                } else if (landing != null) targets.add(landing);
            }
            offset += i.getCodeUnits();
        }
        if (method.getImplementation() != null) for (var b : method.getImplementation().getTryBlocks())
            for (var h : b.getExceptionHandlers()) targets.add(offsets.getOrDefault(h.getHandlerCodeAddress(), -1));
        return targets;
    }
    static boolean mediaWrites(Instruction i, int r) {
        return i.getOpcode().setsRegister() && (register(i) == r || (i.getOpcode().name().contains("WIDE") && register(i) + 1 == r));
    }
    static boolean mediaOp(List<Instruction> c, int at, Opcode op) { return at < c.size() && c.get(at).getOpcode() == op; }
    static boolean mediaCall(List<Instruction> c, int at, String id, Integer... args) {
        return mediaOp(c, at, Opcode.INVOKE_VIRTUAL) && id.equals(ref(c.get(at))) && bubbleArgs(c.get(at)).equals(List.of(args));
    }
    static boolean mediaLiteral(List<Instruction> c, int at, int r) {
        return mediaOp(c, at, Opcode.CONST_16) && register(c.get(at)) == r && c.get(at) instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == 0x2000;
    }
    static boolean mediaNull(List<Instruction> c, int at, int r, int target) {
        return mediaOp(c, at, Opcode.IF_EQZ) && register(c.get(at)) == r && mediaTarget(c, at) == target;
    }
    static boolean mediaResult(List<Instruction> c, int at, String type, int r) {
        return at > 0 && mediaOp(c, at, Opcode.MOVE_RESULT_OBJECT) && register(c.get(at)) == r &&
            c.get(at - 1).getOpcode().name().startsWith("INVOKE") && c.get(at - 1) instanceof ReferenceInstruction ri &&
            ri.getReference() instanceof MethodReference mr && mr.getReturnType().equals(type);
    }
    static boolean mediaWindow(List<Instruction> c, int at, String owner, int source, int result, int target) {
        return mediaCall(c, at, owner + "->getWindow()" + WINDOW, source) && mediaOp(c, at + 1, Opcode.MOVE_RESULT_OBJECT) &&
            register(c.get(at + 1)) == result && mediaNull(c, at + 2, result, target);
    }
    /**
     * Mirrors NativeMediaControls.kt. No lifecycle body is eligible for an entry return, and no try block may cover a
     * guarded prefix: the Ephemeral viewer's bodies have none, and the Quicksnap viewer's all start past its site.
     */
    static List<Integer> screenshotViewerSites(Method method) {
        if (!Set.of(EPHEMERAL_VIEWER, QUICKSNAP_VIEWER).contains(method.getDefiningClass())) return List.of();
        var impl = method.getImplementation(); var c = instructions(method); var p = bubbleParameters(method);
        if (impl == null || AccessFlags.STATIC.isSet(method.getAccessFlags())) return List.of();
        List<Integer> sites; boolean valid, resume = false;
        if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && EPHEMERAL_DIALOGS.contains(method.getName()) &&
                p.equals(List.of("Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/app/Dialog;")) {
            sites = List.of(9);
            valid = impl.getTryBlocks().isEmpty() && impl.getRegisterCount() == 5 && c.size() == 15 && mediaResult(c, 4, "Landroid/app/Dialog;", 2) &&
                mediaWindow(c, 5, "Landroid/app/Dialog;", 2, 1, 10) && mediaLiteral(c, 8, 0) && mediaCall(c, 9, SET_FLAGS, 1, 0, 0);
        } else if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && method.getName().equals("onResume") && p.isEmpty() && method.getReturnType().equals("V")) {
            sites = List.of(14, 21); resume = true;
            valid = impl.getTryBlocks().isEmpty() && impl.getRegisterCount() == 5 && c.size() == 46 && mediaResult(c, 8, "Landroid/app/Activity;", 0) && mediaLiteral(c, 9, 1) &&
                mediaNull(c, 10, 0, 15) && mediaWindow(c, 11, "Landroid/app/Activity;", 0, 0, 15) && mediaCall(c, 14, SET_FLAGS, 0, 1, 1) &&
                mediaOp(c, 15, Opcode.INVOKE_VIRTUAL) && bubbleArgs(c.get(15)).equals(List.of(4)) &&
                c.get(15) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr && mr.getReturnType().equals("Landroid/app/Dialog;") &&
                mediaOp(c, 16, Opcode.MOVE_RESULT_OBJECT) && register(c.get(16)) == 0 && mediaNull(c, 17, 0, 22) &&
                mediaWindow(c, 18, "Landroid/app/Dialog;", 0, 0, 22) && mediaCall(c, 21, SET_FLAGS, 0, 1, 1);
            if (valid) for (int i = 10; i <= 21; i++) if (mediaWrites(c.get(i), 1)) valid = false;
        } else if (method.getDefiningClass().equals(QUICKSNAP_VIEWER) && method.getName().equals("onCreateView") &&
                p.equals(List.of("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/view/View;")) {
            // The one addFlags call is the site, as in NativeMediaControls.kt. 585's body has try blocks, all past it.
            var adds = new ArrayList<Integer>();
            for (int i = 0; i < c.size(); i++) if (ADD_FLAGS.equals(ref(c.get(i)))) adds.add(i);
            if (adds.size() != 1 || adds.getFirst() < 6) return List.of();
            int site = adds.getFirst();
            sites = List.of(site);
            int prefixEnd = 0;
            for (int i = 0; i <= site; i++) prefixEnd += c.get(i).getCodeUnits();
            boolean covered = false;
            for (var block : impl.getTryBlocks()) if (block.getStartCodeAddress() < prefixEnd) covered = true;
            valid = !covered && QUICKSNAP_REGISTERS.contains(impl.getRegisterCount()) && mediaResult(c, site - 6, "Landroid/app/Dialog;", 0) &&
                mediaNull(c, site - 5, 0, site + 1) && mediaWindow(c, site - 4, "Landroid/app/Dialog;", 0, 1, site + 1) &&
                mediaLiteral(c, site - 1, 0) && mediaCall(c, site, ADD_FLAGS, 1, 0);
        } else return List.of();
        var setters = new ArrayList<Integer>();
        for (int i = 0; i < c.size(); i++) if (ref(c.get(i)) != null && Set.of(SET_FLAGS, ADD_FLAGS, WINDOW + "->clearFlags(I)V").contains(ref(c.get(i)))) setters.add(i);
        if (!valid || !setters.equals(sites)) return List.of();
        if (resume && c.stream().anyMatch(i -> i.getOpcode().name().contains("SWITCH") || i.getOpcode().name().contains("PAYLOAD"))) return List.of();
        for (int t : mediaTargets(method)) if (t >= 1 && t <= sites.getLast() && (!resume || t != 15)) return List.of();
        if (resume) for (int i = 0; i < c.size(); i++) if (i != 10 && i != 13 && c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == 15) return List.of();
        return sites;
    }

    /**
     * Mirrors NativeMediaControls.kt: 585's cell, its label, how many renders offer that label, the same for its Generate
     * menu label, and its render's size (24 registers). Four renders offer the AI label and one the menu label.
     */
    record AiCell(String type, String superclass, String scope, String component, int label, int sources, int size, int menu, int menuSources) {
        String render() { return type + "->render(" + scope + ")" + component; }
    }
    static final List<AiCell> AI_CELLS = List.of(
        new AiCell("LX/R3i;", "LX/1No;", "LX/2ED;", "LX/1IG;", GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL, 1),
        new AiCell("LX/R3h;", "LX/1No;", "LX/2ED;", "LX/1IG;", GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL, 1),
        new AiCell("LX/OXo;", "LX/1Og;", "LX/2Fc;", "LX/1J8;", GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL_ARMV7, 1),
        new AiCell("LX/OGf;", "LX/1OE;", "LX/2Ed;", "LX/1Ig;", GENERATE_AI_LABEL, 4, 113, GENERATE_MENU_LABEL_ARMV7, 1));
    static List<Method> findAiStickerCells(List<ClassDef> classes) {
        var result = new ArrayList<Method>();
        for (var shape : AI_CELLS) {
            var matching = classes.stream().filter(c -> c.getType().equals(shape.type())).toList();
            if (matching.size() != 1) continue;
            var cls = matching.getFirst();
            if (!Objects.equals(cls.getSuperclass(), shape.superclass())) continue;
            int fields = 0; for (var f : cls.getFields()) if (f.getName().equals("A00") && f.getType().equals("I") && !AccessFlags.STATIC.isSet(f.getAccessFlags())) fields++;
            if (fields != 1) continue;
            var ctors = new ArrayList<Method>();
            for (var m : cls.getMethods()) { var p = bubbleParameters(m);
                if (m.getName().equals("<init>") && p.size() == 11 && p.getFirst().equals(BUBBLE_SESSION) && p.getLast().equals("I") &&
                        p.subList(7, 9).equals(List.of("Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;"))) ctors.add(m); }
            if (ctors.size() != 1) continue;
            var ctor = ctors.getFirst(); var b = instructions(ctor);
            if (AccessFlags.STATIC.isSet(ctor.getAccessFlags()) || ctor.getImplementation() == null || ctor.getImplementation().getRegisterCount() != 12 || b.size() != 15 ||
                    b.get(5).getOpcode() != Opcode.IPUT || !(b.get(5) instanceof TwoRegisterInstruction store) || store.getRegisterA() != 11 || store.getRegisterB() != 0 ||
                    !Objects.equals(ref(b.get(5)), shape.type() + "->A00:I") || b.stream().filter(i -> Objects.equals(ref(i), shape.type() + "->A00:I")).count() != 1 ||
                    b.subList(0, 5).stream().anyMatch(i -> mediaWrites(i, 0) || mediaWrites(i, 11)) ||
                    b.stream().anyMatch(i -> i instanceof OffsetInstruction) || !ctor.getImplementation().getTryBlocks().isEmpty()) continue;
            int sources = 0, menus = 0;
            for (var sourceClass : classes) for (var source : sourceClass.getMethods()) {
                if (!source.getName().equals("render")) continue;
                var c = instructions(source);
                for (int at = 0; at < c.size(); at++) {
                    if (!Set.of(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE).contains(c.get(at).getOpcode()) || !Objects.equals(ref(c.get(at)), hookId(ctor))) continue;
                    var args = bubbleArgs(c.get(at)); if (args.isEmpty()) continue; int arg = args.getLast(), literal = -1;
                    for (int j = at - 1; j >= Math.max(0, at - 24); j--) if (mediaWrites(c.get(j), arg)) { literal = j; break; }
                    if (literal < 0 || !(c.get(literal) instanceof NarrowLiteralInstruction n)) continue;
                    boolean branchFree = true; for (int j = literal + 1; j < at; j++) if (c.get(j) instanceof OffsetInstruction) branchFree = false;
                    if (!branchFree) continue;
                    boolean joined = false; for (int t : mediaTargets(source)) if (t > literal && t <= at) joined = true;
                    if (n.getNarrowLiteral() == shape.label() && !joined) sources++;
                    // The music sticker branch jumps into the menu cell's constructor call, so only the straight run from the literal counts.
                    if (n.getNarrowLiteral() == shape.menu()) menus++;
                }
            }
            if (sources != shape.sources() || menus != shape.menuSources()) continue;
            for (var m : cls.getMethods()) if (hookId(m).equals(shape.render()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null &&
                    m.getImplementation().getRegisterCount() == 24 && instructions(m).size() == shape.size() && m.getImplementation().getTryBlocks().size() == 4) result.add(m);
        }
        return result;
    }

    static final Set<Opcode> MEDIA_GOTOS = Set.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32);
    static final Set<Opcode> MEDIA_EXITS = Set.of(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW);
    static final String ITERATOR_HAS_NEXT = "Ljava/util/Iterator;->hasNext()Z", ITERATOR_NEXT = "Ljava/util/Iterator;->next()Ljava/lang/Object;";
    static boolean mediaIs(List<Instruction> c, int at, Opcode... ops) {
        return at >= 0 && at < c.size() && Arrays.asList(ops).contains(c.get(at).getOpcode());
    }

    /** Mirrors NativeMediaControls.kt feedsAiCell: the label at {@code at} reaches the cell's constructor, following plain gotos only. */
    static boolean feedsAiCell(List<Instruction> c, int at, AiCell cell) {
        int register = register(c.get(at));
        if (register < 0) return false;
        int i = at + 1;
        for (int step = 0; step < 48; step++) {
            if (i < 0 || i >= c.size()) return false;
            var instruction = c.get(i);
            if (MEDIA_GOTOS.contains(instruction.getOpcode())) { i = mediaTarget(c, i); continue; }
            if (Set.of(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE).contains(instruction.getOpcode()) && instruction instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference m && m.getDefiningClass().equals(cell.type()) && m.getName().equals("<init>")) {
                var args = bubbleArgs(instruction);
                return m.getParameterTypes().size() == 11 && m.getParameterTypes().getLast().toString().equals("I") && !args.isEmpty() && args.getLast() == register;
            }
            if (instruction instanceof OffsetInstruction || mediaWrites(instruction, register) || MEDIA_EXITS.contains(instruction.getOpcode())) return false;
            i++;
        }
        return false;
    }

    /**
     * Mirrors NativeMediaControls.kt aiStickerGrid: the Suggested grid loop whose instance-of chain sends the Generate menu
     * item (and, where a build still lists it, the Generate AI item) to the cell. Sites are where those branch bodies start,
     * skip is the loop head every item returns to.
     */
    record AiGrid(List<Integer> sites, int skip, int flag) {}
    static AiGrid aiStickerGrid(Method method, AiCell cell) {
        if (!method.getName().equals("render") || AccessFlags.STATIC.isSet(method.getAccessFlags())) return null;
        var c = instructions(method);
        java.util.function.IntPredicate labelled = at -> c.get(at).getOpcode() == Opcode.CONST && c.get(at) instanceof NarrowLiteralInstruction n &&
                (n.getNarrowLiteral() == cell.menu() || n.getNarrowLiteral() == cell.label());
        var labels = new ArrayList<Integer>();
        for (int at = 0; at < c.size(); at++) if (labelled.test(at)) labels.add(at);
        if (labels.isEmpty() || c.stream().noneMatch(i -> ITERATOR_HAS_NEXT.equals(ref(i)))) return null;
        var found = new ArrayList<AiGrid>();
        for (int head = 0; head < c.size(); head++) {
            if (!mediaIs(c, head, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || !ITERATOR_HAS_NEXT.equals(ref(c.get(head)))) continue;
            var iterators = bubbleArgs(c.get(head));
            if (iterators.size() != 1 || head + 5 >= c.size()) continue;
            int iterator = iterators.getFirst(), more = register(c.get(head + 1)), item = register(c.get(head + 4));
            if (!mediaIs(c, head + 1, Opcode.MOVE_RESULT) || !mediaIs(c, head + 2, Opcode.IF_EQZ) || register(c.get(head + 2)) != more ||
                    !mediaIs(c, head + 3, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || !ITERATOR_NEXT.equals(ref(c.get(head + 3))) ||
                    !bubbleArgs(c.get(head + 3)).equals(List.of(iterator)) || !mediaIs(c, head + 4, Opcode.MOVE_RESULT_OBJECT) ||
                    !mediaIs(c, head + 5, Opcode.CHECK_CAST) || register(c.get(head + 5)) != item) continue;
            // Every item goes back to the head through a plain goto.
            var backs = new ArrayList<Integer>();
            for (int i = 0; i < c.size(); i++) if (c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == head) backs.add(i);
            if (backs.isEmpty() || backs.stream().anyMatch(i -> !MEDIA_GOTOS.contains(c.get(i).getOpcode()))) continue;
            int link = head + 6;
            Integer flag = null;
            var menus = new ArrayList<Integer>();
            var ais = new ArrayList<Integer>();
            var bodies = new ArrayList<int[]>();
            while (mediaIs(c, link, Opcode.INSTANCE_OF)) {
                var test = (TwoRegisterInstruction) c.get(link);
                if (test.getRegisterB() != item || (flag != null && test.getRegisterA() != flag)) break;
                flag = test.getRegisterA();
                if (!mediaIs(c, link + 1, Opcode.IF_EQZ) || register(c.get(link + 1)) != flag) break;
                int end = mediaTarget(c, link + 1);
                if (end <= link + 2) break;
                for (int at = link + 2; at < end; at++) {
                    if (!labelled.test(at) || !feedsAiCell(c, at, cell)) continue;
                    if (((NarrowLiteralInstruction) c.get(at)).getNarrowLiteral() == cell.menu()) menus.add(link + 2); else ais.add(link + 2);
                    bodies.add(new int[] {link + 2, end});
                }
                link = end;
            }
            var sites = new ArrayList<Integer>(menus);
            sites.addAll(ais);
            Collections.sort(sites);
            var targets = mediaTargets(method);
            // One menu branch and at most one AI branch (585 dropped it from the grid), each entered only from its own
            // instance-of test, and no label outside them.
            if (flag == null || flag > 15 || menus.size() != 1 || ais.size() > 1 || menus.equals(ais) ||
                    List.of(item, iterator).contains(flag) || sites.stream().anyMatch(targets::contains) ||
                    labels.stream().anyMatch(at -> bodies.stream().noneMatch(b -> at >= b[0] && at < b[1]))) continue;
            found.add(new AiGrid(sites, head, flag));
        }
        return found.size() == 1 ? found.getFirst() : null;
    }
    static List<Method> findAiStickerGrids(List<ClassDef> classes) {
        var result = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (AI_CELLS.stream().anyMatch(cell -> aiStickerGrid(m, cell) != null)) result.add(m);
        return result;
    }

    record CommunityInbox(Method render, String identity) {}
    static CommunityInbox communityInbox(List<ClassDef> input) {
        if (input.stream().noneMatch(c->new CommunityDiscovery(List.of(c)).original(c).equals("InboxFragment"))) return null;
        try { return new CommunityDiscovery(input).prove(); } catch (RuntimeException changed) { return null; }
    }
    /** The same connected Main-only route and native subscribed predicate used by the injector. */
    static final class CommunityDiscovery {
        final Map<String,ClassDef> classes=new HashMap<>();
        static final String ROOT="Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;";
        static final String SUMMARY="Lcom/facebook/messaging/model/threads/ThreadSummary;";
        static final String KEY="Lcom/facebook/messaging/model/threadkey/ThreadKey;";
        static final String LIST="Lcom/google/common/collect/ImmutableList;";
        CommunityDiscovery(List<ClassDef> input) { input.forEach(c->classes.put(c.getType(),c)); }
        boolean literal(Instruction i,int register,int value) { return i.getOpcode()==Opcode.CONST_4 && i instanceof OneRegisterInstruction r && r.getRegisterA()==register && i instanceof NarrowLiteralInstruction l && l.getNarrowLiteral()==value; }
        List<Field> methodFields(ClassDef cls,String name) { var out=new ArrayList<Field>(); for(var f:cls.getFields()) if(f.getName().equals(name)) out.add(f); return out; }
        int branch(Method m,int at) {
            var c=instructions(m); int address=0;
            for(int i=0;i<at;i++) address+=c.get(i).getCodeUnits();
            int target=address+((OffsetInstruction)c.get(at)).getCodeOffset(); address=0;
            for(int i=0;i<c.size();i++) { if(address==target) return i; address+=c.get(i).getCodeUnits(); }
            throw new IllegalStateException("Disconnected community branch");
        }
    String id(MethodReference m) { return m.getDefiningClass() + "->" + m.getName() + "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType(); }
    void require(boolean condition, String reason) { if (!condition) throw new IllegalStateException(reason); }
    <T> T single(List<T> values, String what) { require(values.size() == 1, what + " count=" + values.size()); return values.getFirst(); }
    List<MethodReference> calls(Method method) {
        var out = new ArrayList<MethodReference>();
        for (var i : instructions(method)) if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr) out.add(mr);
        return out;
    }
    boolean hasString(Method method, String value) {
        return instructions(method).stream().anyMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && s.getString().equals(value));
    }
    Method definition(MethodReference ref) {
        var out = new ArrayList<Method>();
        for (var m : classes.get(ref.getDefiningClass()).getMethods()) if (id(m).equals(id(ref))) out.add(m);
        return single(out, "definition " + id(ref));
    }
    Map<String, FieldReference> enumMembers(String type) {
        var out = new LinkedHashMap<String, FieldReference>();
        var cls = classes.get(type); if (cls == null) return out;
        for (var m : cls.getMethods()) if (m.getName().equals("<clinit>")) {
            var code = instructions(m);
            for (int at = 0; at < code.size(); at++) {
                var i = code.get(at);
                if (!(i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s)) continue;
                String name = s.getString();
                if (!Set.of("INBOX", "PENDING", "COMMUNITY_FOLDER", "COMMUNITY_CHANNELS", "COMMUNITY_CHANNEL", "COMMUNITY_ANNOUNCEMENT_CHANNEL", "GROUP", "SOCIAL_CHANNEL", "BROADCAST_CHANNEL").contains(name)) continue;
                for (int after = at + 1; after < Math.min(code.size(), at + 14); after++) {
                    var next = code.get(after);
                    if (next.getOpcode().name().startsWith("SPUT") && next instanceof ReferenceInstruction fr && fr.getReference() instanceof FieldReference f && f.getType().equals(type)) { out.put(name, f); break; }
                }
            }
        }
        return out;
    }
    List<Field> fieldsOf(String type, String fieldType) {
        var out = new ArrayList<Field>();
        var cls = classes.get(type);
        if (cls != null) for (var f : cls.getInstanceFields()) if (f.getType().equals(fieldType)) out.add(f);
        return out;
    }
    void publicStatic(FieldReference field) {
        var cls=classes.get(field.getDefiningClass());
        var nativeField=single(methodFields(cls,field.getName()).stream().filter(f->f.getType().equals(field.getType())).toList(),"native enum member");
        require(AccessFlags.PUBLIC.isSet(cls.getAccessFlags()) && AccessFlags.PUBLIC.isSet(nativeField.getAccessFlags()) && AccessFlags.STATIC.isSet(nativeField.getAccessFlags()),"native enum member inaccessible");
    }
    Map<String, String> enumFieldNames(String type) {
        var out = new LinkedHashMap<String, String>();
        for (var m : classes.get(type).getMethods()) if (m.getName().equals("<clinit>")) {
            String label = null;
            for (var i : instructions(m)) {
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) label = s.getString();
                if (i.getOpcode().name().equals("SPUT_OBJECT") && i instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && f.getType().equals(type)) {
                    require(label != null, "missing enum label for " + f); out.put(f.getName(), label); label = null;
                }
            }
        }
        return out;
    }
    String original(ClassDef cls) {
        for (var f : cls.getFields()) if (f.getName().equals("__redex_internal_original_name") && f.getInitialValue() instanceof StringEncodedValue s) return s.getValue();
        return "";
    }
    Object ref(Instruction i) { return i instanceof ReferenceInstruction r ? r.getReference() : null; }
    List<Integer> args(Instruction i) {
        if (i instanceof FiveRegisterInstruction f) return List.of(f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()).subList(0, f.getRegisterCount());
        if (i instanceof RegisterRangeInstruction r) { var out = new ArrayList<Integer>(); for(int at=0;at<r.getRegisterCount();at++) out.add(r.getStartRegister()+at); return out; }
        return List.of();
    }
    List<Method> methods(ClassDef cls) { var out=new ArrayList<Method>(); cls.getMethods().forEach(out::add); return out; }
    boolean reads(Instruction i, String field) { return i.getOpcode() == Opcode.IGET_OBJECT && Objects.toString(ref(i)).equals(field); }
    boolean writes(Instruction i, int register) { return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction r && r.getRegisterA() == register; }
    boolean source(Instruction i,int value,int register) {
        String name=i.getOpcode().toString();
        return value==register || ((name.contains("WIDE") || name.contains("LONG") || name.contains("DOUBLE")) && value+1==register);
    }
    boolean operandReads(Instruction i,int register) {
        if(i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction) return args(i).stream().anyMatch(v->source(i,v,register));
        if(i instanceof ThreeRegisterInstruction r) return source(i,r.getRegisterB(),register) || source(i,r.getRegisterC(),register) || (!i.getOpcode().setsRegister() && source(i,r.getRegisterA(),register));
        if(i instanceof TwoRegisterInstruction r) return source(i,r.getRegisterB(),register) || ((!i.getOpcode().setsRegister() || i.getOpcode().toString().contains("2ADDR")) && source(i,r.getRegisterA(),register));
        return i instanceof OneRegisterInstruction r && (!i.getOpcode().setsRegister() || i.getOpcode()==Opcode.CHECK_CAST) && source(i,r.getRegisterA(),register);
    }
    Set<Integer> targets(Method method) {
        var code=instructions(method); var addresses=new HashMap<Integer,Integer>(); int address=0;
        for(int at=0;at<code.size();at++) { addresses.put(address,at); address+=code.get(at).getCodeUnits(); }
        var out=new HashSet<Integer>(); address=0;
        for(var i:code) { if(i instanceof OffsetInstruction j) {
            Integer target=addresses.get(address+j.getCodeOffset()); require(target!=null,"bad native branch"); out.add(target);
            if(code.get(target) instanceof SwitchPayload s) for(var e:s.getSwitchElements()) { Integer t=addresses.get(address+e.getOffset()); require(t!=null,"bad switch branch"); out.add(t); }
        } address+=i.getCodeUnits(); } return out;
    }
    /** No path from `from` reads the register before writing it. Mirrors the scratch proof in CommunityInbox.kt. */
    boolean deadFrom(Method method,int from,int register) {
        var code=instructions(method); var addresses=new HashMap<Integer,Integer>(); var units=new int[code.size()]; int address=0;
        for(int at=0;at<code.size();at++) { units[at]=address; addresses.put(address,at); address+=code.get(at).getCodeUnits(); }
        var pending=new ArrayDeque<Integer>(List.of(from)); var seen=new HashSet<Integer>();
        while(!pending.isEmpty()) {
            int at=pending.poll(); if(!seen.add(at)) continue;
            var i=code.get(at);
            if(operandReads(i,register)) return false;
            if(writes(i,register)) continue;
            if(i instanceof OffsetInstruction j && i.getOpcode()!=Opcode.FILL_ARRAY_DATA) {
                Integer landing=addresses.get(units[at]+j.getCodeOffset()); require(landing!=null,"bad native branch");
                if(i.getOpcode()==Opcode.PACKED_SWITCH || i.getOpcode()==Opcode.SPARSE_SWITCH) {
                    require(code.get(landing) instanceof SwitchPayload,"bad switch branch");
                    for(var e:((SwitchPayload)code.get(landing)).getSwitchElements()) { Integer t=addresses.get(units[at]+e.getOffset()); require(t!=null,"bad switch branch"); pending.add(t); }
                } else pending.add(landing);
            }
            if(i.getOpcode().canContinue()) { require(at+1<code.size(),"native code falls off the end"); pending.add(at+1); }
        }
        return true;
    }
    Method singleMethod(String type, String name) { return single(methods(classes.get(type)).stream().filter(m->m.getName().equals(name)).toList(),type+"->"+name); }
    boolean sessionCapturedFirst(List<Instruction> ctorCode) {
        var store=ctorCode.get(2);
        return store.getOpcode()==Opcode.IPUT_OBJECT && ref(store) instanceof FieldReference f && f.getName().equals("$fbUserSession") && f.getType().equals("Lcom/facebook/auth/usersession/FbUserSession;") &&
            ((TwoRegisterInstruction)store).getRegisterA()==2 && ((TwoRegisterInstruction)store).getRegisterB()==1;
    }
        CommunityInbox prove() {
        var immutable=classes.get(LIST);
        var copy=single(methods(immutable).stream().filter(m->id(m).equals(LIST+"->copyOf(Ljava/util/Collection;)"+LIST)).toList(),"native immutable projection");
        require(AccessFlags.PUBLIC.isSet(immutable.getAccessFlags()) && AccessFlags.PUBLIC.isSet(copy.getAccessFlags()) && AccessFlags.STATIC.isSet(copy.getAccessFlags()),"native immutable projection inaccessible");
        ClassDef main=single(classes.values().stream().filter(c->original(c).equals("InboxFragment")).toList(),"main InboxFragment");
        Method render=single(methods(main).stream().filter(m->hasString(m,"InboxFragment_updateSectionTree")).toList(),"main section tree render");
        require(render.getReturnType().equals("V") && render.getParameterTypes().size()==4 && render.getParameterTypes().get(0).toString().equals(main.getType()),"main void renderer changed");
        var renderCode=instructions(render);
        var folderConfigs=new ArrayList<Method>();
        for(var f:classes.get(ROOT).getInstanceFields()) if(classes.containsKey(f.getType())) for(var m:classes.get(f.getType()).getMethods()) if(hasString(m,"folderName") && enumMembers(m.getReturnType()).containsKey("INBOX")) folderConfigs.add(m);
        var folderGetter=single(folderConfigs,"typed folder getter"); String folderType=folderGetter.getReturnType();
        var mainLoaderCalls=new ArrayList<MethodReference>();
        for(var m:main.getMethods()) for(var c:calls(m)) if(c.getName().equals("<init>") && c.getParameterTypes().size()==6 && c.getParameterTypes().get(0).toString().equals("Landroid/content/Context;") && c.getParameterTypes().get(1).toString().equals("Lcom/facebook/auth/usersession/FbUserSession;") && c.getParameterTypes().get(2).toString().equals(main.getSuperclass()) && c.getParameterTypes().get(5).toString().equals("Ljava/util/List;")) mainLoaderCalls.add(c);
        var loaderCtor=definition(single(mainLoaderCalls,"main loader creation"));
        var coordinatorCtors=calls(loaderCtor).stream().filter(c->c.getName().equals("<init>") && classes.containsKey(c.getDefiningClass()) && original(classes.get(c.getDefiningClass())).equals("InboxLoaderCoordinator")).toList();
        var coordinatorCtor=definition(single(coordinatorCtors,"main inbox coordinator"));
        var configCtor=definition(single(calls(coordinatorCtor).stream().filter(c->c.getName().equals("<init>") && c.getDefiningClass().equals(folderGetter.getDefiningClass())).toList(),"default main list config"));
        String builder=configCtor.getParameterTypes().get(0).toString();
        var defaultBuilder=single(methods(classes.get(builder)).stream().filter(m->m.getName().equals("<init>") && m.getParameterTypes().isEmpty()).toList(),"default inbox config builder");
        require(instructions(defaultBuilder).size()==5 && calls(defaultBuilder).stream().anyMatch(c->c.getDefiningClass().equals("Ljava/util/HashSet;") && c.getParameterTypes().isEmpty()),"default config keys not empty");
        require(hasString(coordinatorCtor,"threadTypeFilter") && !hasString(coordinatorCtor,"folderName"),"main initializer overrides folder");
        var folders=enumMembers(folderType);
        require(instructions(folderGetter).stream().anyMatch(i->i.getOpcode()==Opcode.SGET_OBJECT && Objects.toString(ref(i)).equals(folders.get("INBOX").toString())),"default folder is not INBOX");
        var folderOverride=single(methods(main).stream().filter(m->hasString(m,"folderName")).toList(),"main typed folder override");
        var overrideCode=instructions(folderOverride);
        // Some 584.1 arm64 builds drop a flag store and move the config's apply into a static helper: 38 instructions, not 42.
        require(hasString(folderOverride,"InboxLoaderCoordinator.setFolderAndFilter") && (overrideCode.size()==42 || overrideCode.size()==38) && overrideCode.get(0).getOpcode()==Opcode.INVOKE_STATIC && overrideCode.get(1).getOpcode()==Opcode.MOVE_RESULT_OBJECT && folderOverride.getParameterTypes().size()==2,"main folder switch changed");
        String scopeType=folderOverride.getParameterTypes().get(1).toString();
        var scopeLabels=enumFieldNames(scopeType); var folderLabels=enumFieldNames(folderType);
        var pending=(FieldReference)ref(overrideCode.get(4)); var requests=(FieldReference)ref(overrideCode.get(2));
        require(scopeLabels.get(requests.getName()).equals("MESSAGE_REQUESTS") && folderLabels.get(pending.getName()).equals("PENDING"),"pending scope label changed");
        int inboxAt=branch(folderOverride,3), folderRegister=register(overrideCode.get(4));
        require(overrideCode.get(3).getOpcode()==Opcode.IF_NE && Objects.toString(ref(overrideCode.get(7))).equals(pending.toString()) && Objects.toString(ref(overrideCode.get(inboxAt))).equals(folders.get("INBOX").toString()),"main folder branches changed");
        // The switch's own scope parameter and the chosen folder are the two values stored into the new config.
        java.util.function.Function<String,TwoRegisterInstruction> stores=type->(TwoRegisterInstruction)overrideCode.get(single(java.util.stream.IntStream.range(0,overrideCode.size()).boxed()
            .filter(at->overrideCode.get(at).getOpcode()==Opcode.IPUT_OBJECT && ref(overrideCode.get(at)) instanceof FieldReference f && f.getType().equals(type)).toList(),"config store "+type));
        var scopeStore=stores.apply(scopeType); var folderStore=stores.apply(folderType);
        require(List.of(4,7,inboxAt).stream().allMatch(at->register(overrideCode.get(at))==folderRegister) &&
            scopeStore.getRegisterA()==folderOverride.getImplementation().getRegisterCount()-1 && folderStore.getRegisterA()==folderRegister &&
            scopeStore.getRegisterB()==folderStore.getRegisterB(),"folder/filter config connection changed");
        for(var m:main.getMethods()) {
            require(m.equals(folderOverride) || !hasString(m,"folderName"),"other main config folder override");
            require(calls(m).stream().noneMatch(c->c.getDefiningClass().equals(loaderCtor.getDefiningClass()) && c.getParameterTypes().contains(folderType)),"main renderer selects another folder");
        }
        var ctorCalls=calls(render).stream().filter(m->m.getName().equals("<init>") && m.getParameterTypes().contains(LIST)).toList();
        Method ctor=definition(single(ctorCalls,"dedicated immutable-list closure ctor"));
        var closure=classes.get(ctor.getDefiningClass());
        // The closure takes an $onThreadInViewport Function1 before the trailing flag, which then needs a move/from16 to be stored.
        var ctorParams=ctor.getParameterTypes().stream().map(Object::toString).toList();
        require(ctorParams.size()==15 && ctorParams.get(11).equals(LIST) && ctorParams.get(13).equals("Lkotlin/jvm/functions/Function1;") && ctorParams.get(14).equals("Z") && ctor.getReturnType().equals("V"),"captured list argument changed");
        var ctorCode=instructions(ctor);
        require(ctor.getImplementation().getRegisterCount()==17 && ctorCode.size()==19 && ctor.getImplementation().getTryBlocks().isEmpty(),"closure ctor shape changed");
        require(ctorCode.get(0).getOpcode()==Opcode.IPUT_OBJECT && ctorCode.get(0) instanceof TwoRegisterInstruction && ref(ctorCode.get(0)) instanceof FieldReference,"captured presentation store absent");
        var store=(TwoRegisterInstruction)ctorCode.get(0); var captured=(FieldReference)ref(ctorCode.get(0));
        require(store.getRegisterA()==13 && store.getRegisterB()==1 && captured.getName().equals("$inboxUnitItems") && captured.getType().equals(LIST),"captured parameter disconnected");
        // The session capture comes first, in slot 2, so the scope capture is in slot 5.
        require(sessionCapturedFirst(ctorCode),"session capture moved");
        int scopeAt=5;
        var scopeField=(FieldReference)ref(ctorCode.get(scopeAt));
        require(ctorCode.get(scopeAt).getOpcode()==Opcode.IPUT_OBJECT && scopeField.getName().equals("$threadTypeFilter") && scopeField.getType().equals(scopeType) && ((TwoRegisterInstruction)ctorCode.get(scopeAt)).getRegisterA()==10,"captured native scope disconnected");
        var ctorCallers=new ArrayList<String>(); var allocations=new ArrayList<String>(); var fieldWrites=new ArrayList<String>();
        for(var cls:classes.values()) for(var method:cls.getMethods()) { var code=instructions(method); for(int at=0;at<code.size();at++) {
            var i=code.get(at); Object r=ref(i);
            if(r instanceof MethodReference m && id(m).equals(id(ctor))) ctorCallers.add(id(method)+" @"+at);
            if(i.getOpcode()==Opcode.NEW_INSTANCE && Objects.toString(r).equals(closure.getType())) allocations.add(id(method)+" @"+at);
            if(i.getOpcode().toString().startsWith("IPUT") && Objects.toString(r).equals(captured.toString())) fieldWrites.add(id(method)+" @"+at);
        }}
        require(ctorCallers.size()==1 && ctorCallers.get(0).startsWith(id(render)+" @"),"foreign constructor caller: "+ctorCallers);
        require(allocations.size()==1 && allocations.get(0).startsWith(id(render)+" @"),"foreign closure allocation: "+allocations);
        require(fieldWrites.size()==1 && fieldWrites.get(0).equals(id(ctor)+" @0"),"shared captured-list mutation");
        int callAt=-1; for(int at=0;at<renderCode.size();at++) if(ref(renderCode.get(at)) instanceof MethodReference m && id(m).equals(id(ctor))) callAt=at;
        int listArgument=args(renderCode.get(callAt)).get(12);
        int scopeArgument=args(renderCode.get(callAt)).get(9);
        int scopeResult=-1; for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),scopeArgument)) { scopeResult=at; break; }
        require(scopeResult>=1 && renderCode.get(scopeResult).getOpcode()==Opcode.MOVE_RESULT_OBJECT && ref(renderCode.get(scopeResult-1)) instanceof MethodReference,"captured scope result disconnected");
        var scopeGetter=definition((MethodReference)ref(renderCode.get(scopeResult-1)));
        require(scopeGetter.getDefiningClass().equals(loaderCtor.getDefiningClass()) && scopeGetter.getReturnType().equals(scopeType) && instructions(scopeGetter).size()==13 && calls(scopeGetter).stream().anyMatch(m->m.getDefiningClass().equals(folderGetter.getDefiningClass()) && m.getReturnType().equals(scopeType)),"scope does not read current native config");
        int prefixAt=scopeAt+4;
        var prefix=(FieldReference)ref(ctorCode.get(prefixAt));
        require(prefix.getName().equals("$prefixOffsetCallback") && ctorCode.get(prefixAt).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)ctorCode.get(prefixAt)).getRegisterA()==8,"Main callback capture disconnected");
        int prefixArg=args(renderCode.get(callAt)).get(7), prefixMove=-1;
        for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),prefixArg)) { prefixMove=at; break; }
        require(prefixMove>=0 && renderCode.get(prefixMove).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"Main callback alias absent");
        int prefixSource=((TwoRegisterInstruction)renderCode.get(prefixMove)).getRegisterB(), prefixRead=-1;
        for(int at=prefixMove-1;at>=0;at--) if(writes(renderCode.get(at),prefixSource)) { prefixRead=at; break; }
        require(prefixRead>=0 && renderCode.get(prefixRead).getOpcode()==Opcode.IGET_OBJECT,"Main callback source absent");
        var mainPrefix=(FieldReference)ref(renderCode.get(prefixRead)); require(mainPrefix.getDefiningClass().equals(main.getType()) && mainPrefix.getType().equals(prefix.getType()),"foreign callback source");
        var prefixStores=new ArrayList<Method>(); int prefixStore=-1;
        for(var cls:classes.values()) for(var m:cls.getMethods()) { var body=instructions(m); for(int at=0;at<body.size();at++) if(body.get(at).getOpcode()==Opcode.IPUT_OBJECT && Objects.toString(ref(body.get(at))).equals(mainPrefix.toString())) { prefixStores.add(m); prefixStore=at; } }
        var mainCtor=single(prefixStores,"unique Main callback owner"); var mainCtorCode=instructions(mainCtor);
        require(mainCtor.getDefiningClass().equals(main.getType()) && mainCtor.getName().equals("<init>") && prefixStore>=2,"Main callback ownership changed");
        var callbackCtor=definition((MethodReference)ref(mainCtorCode.get(prefixStore-1))); var callbackCode=instructions(callbackCtor);
        require(callbackCtor.getParameterTypes().equals(List.of(main.getType())) && callbackCode.size()==3 && callbackCode.get(0).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)callbackCode.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)callbackCode.get(0)).getRegisterB()==0,"callback Main pointer disconnected");
        var callbackMain=(FieldReference)ref(callbackCode.get(0));
        int getterCall=scopeResult-1, getterReceiver=args(renderCode.get(getterCall)).get(0);
        // 584 reads the loader through a lazy field: the field, a null test that skips a checked static getter, then the call.
        require(getterCall>=4 && renderCode.get(getterCall-1).getOpcode()==Opcode.MOVE_RESULT_OBJECT && register(renderCode.get(getterCall-1))==getterReceiver &&
            renderCode.get(getterCall-2).getOpcode()==Opcode.INVOKE_STATIC && renderCode.get(getterCall-3).getOpcode()==Opcode.IF_NEZ &&
            register(renderCode.get(getterCall-3))==getterReceiver && branch(render,getterCall-3)==getterCall &&
            renderCode.get(getterCall-4).getOpcode()==Opcode.IGET_OBJECT && register(renderCode.get(getterCall-4))==getterReceiver,"Main loader source absent");
        var mainLoader=(FieldReference)ref(renderCode.get(getterCall-4));
        var checkedLoader=definition((MethodReference)ref(renderCode.get(getterCall-2))); var checkedCode=instructions(checkedLoader);
        require(AccessFlags.STATIC.isSet(checkedLoader.getAccessFlags()) && checkedLoader.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(main.getType())) &&
            checkedLoader.getReturnType().equals(mainLoader.getType()) && checkedCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,
            Opcode.IF_EQZ, Opcode.RETURN_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.THROW)) &&
            Objects.toString(ref(checkedCode.get(0))).equals(mainLoader.toString()),"Main loader getter changed");
        var getterCode=instructions(scopeGetter);
        var currentPath=List.of(callbackMain,mainLoader,(FieldReference)ref(getterCode.get(0)),(FieldReference)ref(getterCode.get(1)),(FieldReference)ref(getterCode.get(8)));
        String owner=callbackCtor.getDefiningClass();
        for(var f:currentPath) { require(f.getDefiningClass().equals(owner),"current folder path disconnected");
            var nativeField=single(methodFields(classes.get(owner),f.getName()),"current folder field");
            require(AccessFlags.PUBLIC.isSet(nativeField.getAccessFlags()) && !AccessFlags.STATIC.isSet(nativeField.getAccessFlags()) && AccessFlags.PUBLIC.isSet(classes.get(owner).getAccessFlags()),"current folder path inaccessible"); owner=f.getType(); }
        require(owner.equals(folderGetter.getDefiningClass()) && AccessFlags.PUBLIC.isSet(classes.get(owner).getAccessFlags()) && AccessFlags.PUBLIC.isSet(folderGetter.getAccessFlags()) && !AccessFlags.STATIC.isSet(folderGetter.getAccessFlags()),"current native folder getter inaccessible");
        var folderCode=instructions(folderGetter);
        require(folderGetter.getParameterTypes().isEmpty() && folderGetter.getImplementation().getRegisterCount()==3 &&
            folderCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.CONST_STRING,Opcode.INVOKE_INTERFACE,Opcode.MOVE_RESULT,Opcode.IF_EQZ,
                Opcode.IGET_OBJECT,Opcode.RETURN_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_NEZ,Opcode.MONITOR_ENTER,Opcode.SGET_OBJECT,Opcode.IF_NEZ,Opcode.SGET_OBJECT,
                Opcode.SPUT_OBJECT,Opcode.MONITOR_EXIT,Opcode.GOTO,Opcode.MOVE_EXCEPTION,Opcode.MONITOR_EXIT,Opcode.THROW,Opcode.SGET_OBJECT,Opcode.RETURN_OBJECT)) &&
            calls(folderGetter).stream().map(this::id).toList().equals(List.of("Ljava/util/Set;->contains(Ljava/lang/Object;)Z")) &&
            branch(folderGetter,4)==7 && branch(folderGetter,8)==19 && branch(folderGetter,11)==14 && branch(folderGetter,15)==19 &&
            ref(folderCode.get(0)) instanceof FieldReference keys && keys.getDefiningClass().equals(owner) && keys.getType().equals("Ljava/util/Set;") &&
            ref(folderCode.get(5)) instanceof FieldReference selected && selected.getDefiningClass().equals(owner) && selected.getType().equals(folderType) &&
            ref(folderCode.get(7)) instanceof FieldReference cached && cached.getDefiningClass().equals(owner) && cached.getType().equals(folderType) &&
            List.of(10,13,19).stream().allMatch(at->Objects.toString(ref(folderCode.get(at))).equals(Objects.toString(ref(folderCode.get(7))))) &&
            Objects.toString(ref(folderCode.get(12))).equals(folders.get("INBOX").toString()) &&
            ((TwoRegisterInstruction)folderCode.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)folderCode.get(0)).getRegisterB()==2 &&
            ((TwoRegisterInstruction)folderCode.get(5)).getRegisterA()==0 && ((TwoRegisterInstruction)folderCode.get(5)).getRegisterB()==2 &&
            ref(folderCode.get(1)) instanceof StringReference label && label.getString().equals("folderName") && args(folderCode.get(2)).equals(List.of(1,0)) &&
            List.of(1,3,4,6,7,8,10,11,12,13,16,18,19,20).stream().allMatch(at->((OneRegisterInstruction)folderCode.get(at)).getRegisterA()==0) &&
            List.of(9,14,17).stream().allMatch(at->((OneRegisterInstruction)folderCode.get(at)).getRegisterA()==2),"native folder getter changed");
        publicStatic(requests); publicStatic(folders.get("INBOX"));
        int listMove=-1; for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),listArgument)) { listMove=at; break; }
        require(listMove>=1 && renderCode.get(listMove).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"main list alias absent");
        var move=(TwoRegisterInstruction)renderCode.get(listMove); var source=renderCode.get(listMove-1);
        require(source.getOpcode()==Opcode.IGET_OBJECT && source instanceof TwoRegisterInstruction && ref(source) instanceof FieldReference,"snapshot source disconnected");
        var modelRows=(FieldReference)ref(source); var sourceReg=(TwoRegisterInstruction)source;
        require(sourceReg.getRegisterA()==move.getRegisterB() && modelRows.getDefiningClass().equals(render.getParameterTypes().get(1).toString()) && modelRows.getType().equals(LIST),"main snapshot does not reach ctor");
        Method invoke=single(methods(closure).stream().filter(m->m.getName().equals("invoke") && m.getParameterTypes().equals(List.of("Ljava/lang/Object;"))).toList(),"section closure invoke");
        var code=instructions(invoke);
        var listReads=new ArrayList<Integer>(); for(int at=0;at<code.size();at++) if(reads(code.get(at),captured.toString())) listReads.add(at);
        // The second read follows a session-gated block before the search bar, at 63.
        require(listReads.size()==2 && listReads.get(0)==5 && listReads.get(1)==63,"presentation read shape changed: "+listReads);
        int secondRead=listReads.get(1);
        require(hasString(invoke,"searchBarSection") && code.get(secondRead) instanceof TwoRegisterInstruction read && read.getRegisterA()==1 && read.getRegisterB()==4,"header or local presentation read changed");
        // The list goes into v1, and the sink takes an $onThreadInViewport after the list, moved into place after the alias.
        int listRegister=((TwoRegisterInstruction)code.get(secondRead)).getRegisterA(), aliasAt=-1;
        for(int at=secondRead+1;at<code.size() && aliasAt<0;at++) if(code.get(at).getOpcode()==Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction)code.get(at)).getRegisterA()==17) aliasAt=at;
        require(aliasAt>0 && ((TwoRegisterInstruction)code.get(aliasAt)).getRegisterB()==listRegister,"second list alias changed");
        require(aliasAt+1<code.size() && code.get(aliasAt+1).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"viewport callback alias changed");
        int sinkAt=aliasAt+2;
        require(sinkAt<code.size() && code.get(sinkAt).getOpcode()==Opcode.INVOKE_STATIC_RANGE && ref(code.get(sinkAt)) instanceof MethodReference,"list section sink changed");
        var sink=(MethodReference)ref(code.get(sinkAt));
        require(sink.getParameterTypes().size()==13 && sink.getParameterTypes().get(11).toString().equals("Ljava/util/List;") && args(code.get(sinkAt)).get(11)==17,"renderer list argument disconnected");
        require(code.size()==sinkAt+8 && invoke.getImplementation().getRegisterCount()==21 && invoke.getImplementation().getTryBlocks().isEmpty(),"presentation body shape changed");
        require(code.get(6).getOpcode()==Opcode.INVOKE_VIRTUAL && Objects.toString(ref(code.get(6))).equals("Ljava/util/AbstractCollection;->isEmpty()Z") && args(code.get(6)).equals(List.of(0)),"original empty/header gate changed");
        for(int at=secondRead+1;at<aliasAt;at++) require(!writes(code.get(at),listRegister),"list overwritten before render");
        require(targets(invoke).stream().noneMatch(t->t>secondRead && t<=sinkAt),"branch bypasses second-read hook");
        // The hook's two scratch registers are v0 and v3.
        for(int scratch:List.of(0,3)) require(deadFrom(invoke,secondRead+1,scratch),"scope scratch register still live");
        var search=classes.values().stream().filter(c->Set.of("MessagingTabbedSearchFragment","SearchListItemFragment","MsysMessageSearchThreadListFragment","FoldersFragment").contains(original(c))).toList();
        require(search.stream().anyMatch(c->original(c).equals("MessagingTabbedSearchFragment")) && search.stream().anyMatch(c->original(c).equals("SearchListItemFragment")) && search.stream().anyMatch(c->original(c).equals("FoldersFragment")),"separate native Search/folder fragments absent");
        require(search.stream().noneMatch(c->c.getType().equals(main.getType())),"Search shares main fragment");
        var joined=new ArrayList<Method>();
        for(var cls:classes.values()) for(var method:cls.getMethods()) if(method.getParameterTypes().equals(List.of(SUMMARY)) && method.getReturnType().equals("Z") && instructions(method).size()==9) {
            var b=instructions(method);
            if(b.get(0).getOpcode()==Opcode.IGET_OBJECT && ref(b.get(0)) instanceof FieldReference f && f.getDefiningClass().equals(SUMMARY) && f.getType().equals(KEY) && b.get(1).getOpcode()==Opcode.INVOKE_STATIC && ref(b.get(1)) instanceof MethodReference m && m.getDefiningClass().equals(KEY) && m.getParameterTypes().equals(List.of(KEY)) && m.getReturnType().equals("Z") && b.get(5).getOpcode()==Opcode.IGET_BOOLEAN) joined.add(method);
        }
        var predicate=single(joined,"native joined channel predicate"); var joinedCode=instructions(predicate);
        require(joinedCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.INVOKE_STATIC,Opcode.MOVE_RESULT,Opcode.CONST_4,Opcode.IF_EQZ,Opcode.IGET_BOOLEAN,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN)),"native joined branch changed");
        require(predicate.getImplementation().getRegisterCount()==3 && predicate.getImplementation().getTryBlocks().isEmpty() &&
            ((TwoRegisterInstruction)joinedCode.get(0)).getRegisterA()==0 && ((TwoRegisterInstruction)joinedCode.get(0)).getRegisterB()==2 && args(joinedCode.get(1)).equals(List.of(0)) &&
            ((OneRegisterInstruction)joinedCode.get(2)).getRegisterA()==0 && literal(joinedCode.get(3),1,0) && branch(predicate,4)==8 && branch(predicate,6)==8 &&
            ((TwoRegisterInstruction)joinedCode.get(5)).getRegisterA()==0 && ((TwoRegisterInstruction)joinedCode.get(5)).getRegisterB()==2 &&
            literal(joinedCode.get(7),1,1) && ((OneRegisterInstruction)joinedCode.get(8)).getRegisterA()==1,"native membership value flow changed");
        var subscribed=(FieldReference)ref(joinedCode.get(5)); require(classes.values().stream().anyMatch(c->methods(c).stream().anyMatch(m->hasString(m,"thread.isSubscribed") && instructions(m).stream().anyMatch(i->Objects.toString(ref(i)).equals(subscribed.toString())))),"subscribed native label absent");
        var keyPredicate=definition((MethodReference)ref(joinedCode.get(1)));
        var keyAny=definition(single(calls(keyPredicate).stream().filter(m->m.getDefiningClass().equals(KEY) && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Z")).toList(),"nullable key-to-community predicate"));
        require(instructions(keyPredicate).size()==8 && calls(keyPredicate).stream().anyMatch(m->id(m).equals(id(keyAny))),"null-safe community wrapper changed");
        var n=instructions(keyPredicate); var a=instructions(keyAny);
        require(n.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IF_EQZ,Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            keyPredicate.getImplementation().getRegisterCount()==1 && branch(keyPredicate,0)==6 && branch(keyPredicate,3)==6 && args(n.get(1)).equals(List.of(0)) && literal(n.get(4),0,1) && literal(n.get(6),0,0),"null/unknown key behavior changed");
        // 585 splits the community check: the key's own channel test first, then the announcement type compared inline.
        require(a.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_NEZ,Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_EQ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            keyAny.getImplementation().getRegisterCount()==3 && keyAny.getImplementation().getTryBlocks().isEmpty() && branch(keyAny,2)==8 && branch(keyAny,5)==8 &&
            literal(a.get(6),0,0) && literal(a.get(8),0,1) && args(a.get(0)).equals(List.of(2)) && register(a.get(1))==0 && register(a.get(2))==0 &&
            ((TwoRegisterInstruction)a.get(3)).getRegisterA()==1 && ((TwoRegisterInstruction)a.get(3)).getRegisterB()==2 && register(a.get(4))==0 &&
            ((TwoRegisterInstruction)a.get(5)).getRegisterA()==1 && ((TwoRegisterInstruction)a.get(5)).getRegisterB()==0 && register(a.get(7))==0 && register(a.get(9))==0 &&
            ref(a.get(0)) instanceof MethodReference channelCall && channelCall.getDefiningClass().equals(KEY) && channelCall.getParameterTypes().isEmpty() && channelCall.getReturnType().equals("Z"),"community OR predicate changed");
        var keyChannel=definition((MethodReference)ref(a.get(0))); var k=instructions(keyChannel);
        require(!AccessFlags.STATIC.isSet(keyChannel.getAccessFlags()) && keyChannel.getImplementation().getRegisterCount()==3 && keyChannel.getImplementation().getTryBlocks().isEmpty() &&
            k.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_NE,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            Objects.toString(ref(k.get(0))).equals(Objects.toString(ref(a.get(3)))) && ((TwoRegisterInstruction)k.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)k.get(0)).getRegisterB()==2 &&
            register(k.get(1))==0 && ((TwoRegisterInstruction)k.get(2)).getRegisterA()==1 && ((TwoRegisterInstruction)k.get(2)).getRegisterB()==0 && branch(keyChannel,2)==5 &&
            literal(k.get(3),0,1) && register(k.get(4))==0 && literal(k.get(5),0,0) && register(k.get(6))==0,"community channel check changed");
        String keyField=Objects.toString(ref(a.get(3))), channelType=Objects.toString(ref(k.get(1))), announcementType=Objects.toString(ref(a.get(4)));
        var keyType=single(fieldsOf(KEY, keyField.substring(keyField.lastIndexOf(':')+1)),"typed key enum"); var enums=enumMembers(keyType.getType());
        require(keyField.equals(keyType.toString()) && channelType.equals(enums.get("COMMUNITY_CHANNEL").toString()) && announcementType.equals(enums.get("COMMUNITY_ANNOUNCEMENT_CHANNEL").toString()),"joined predicate accepts other types");
        String rowType=single(renderCode.stream().filter(i->i.getOpcode()==Opcode.INSTANCE_OF).map(i->((TypeReference)ref(i)).getType()).distinct().filter(t->fieldsOf(t,SUMMARY).size()==1).toList(),"native row type");
        var rowSummary=single(fieldsOf(rowType,SUMMARY),"native row summary");
        require(AccessFlags.PUBLIC.isSet(classes.get(rowType).getAccessFlags()) && AccessFlags.PUBLIC.isSet(rowSummary.getAccessFlags()) && AccessFlags.FINAL.isSet(rowSummary.getAccessFlags()) &&
            AccessFlags.PUBLIC.isSet(classes.get(predicate.getDefiningClass()).getAccessFlags()) && AccessFlags.PUBLIC.isSet(predicate.getAccessFlags()) && AccessFlags.STATIC.isSet(predicate.getAccessFlags()),"typed native contract inaccessible");
        var identityParts=new ArrayList<>(List.of(id(render),id(ctor),id(scopeGetter),id(folderOverride),rowSummary.toString(),id(predicate),id(keyPredicate),id(keyAny),id(keyChannel)));
        identityParts.add(requests.toString()); identityParts.add(prefix.toString());
        currentPath.forEach(f->identityParts.add(f.toString())); identityParts.add(id(folderGetter)); identityParts.add(folders.get("INBOX").toString());
        String identity=String.join("|",identityParts);
        return new CommunityInbox(invoke, identity);
        }
    }

    static final String INBOX_SUPPLIER = "Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;";
    static final String INBOX_ITEMS_TRACE = "ThreadListItemSupplierImplementation.getInboxItems";
    static final String INBOX_SUBSCRIBE_WARNING =
        "useSecondaryParentThreadKey set without a parentThreadKey; folder read falls back to the full Meta AI inbox";

    static String inboxString(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr ? sr.getString() : null;
    }

    static List<String> inboxParams(MethodReference m) {
        return m.getParameterTypes().stream().map(CharSequence::toString).toList();
    }

    static boolean inboxLiteral(Instruction i, int register, int value) {
        return i.getOpcode() == Opcode.CONST_4 && register(i) == register && ((NarrowLiteralInstruction) i).getNarrowLiteral() == value;
    }

    /**
     * The chat list refresh route the patch proves, as "subscribe call|listed count", or null. The items read starts with
     * its trace outside any branch, the final supplier has one static subscribe call holding the folder warning, that call
     * creates its observer just before the observer's (supplier, int) constructor, and the observer's one list callback sets
     * one declared int to 5 or 1, which the items read checks. 585's subscribe call also takes a boolean.
     */
    /**
     * 585's listed-count update, size < limit ? 5 : 1: const/4 vR, 1 earlier in the same straight run, then
     * if-ge ..., <the write>; const/4 vR, 5; iput vR, supplier->F:I, with no write to vR and no jump landing between that
     * const and the branch. Mirrors isListedWrite in InboxRefresh.kt.
     */
    static boolean inboxListedWrite(List<Instruction> list, Set<Integer> targets, int at) {
        if (at < 3 || list.get(at).getOpcode() != Opcode.IPUT || !(((ReferenceInstruction) list.get(at)).getReference() instanceof FieldReference f) ||
            !INBOX_SUPPLIER.equals(f.getDefiningClass()) || !"I".equals(f.getType())) return false;
        int value = ((TwoRegisterInstruction) list.get(at)).getRegisterA();
        if (list.get(at - 2).getOpcode() != Opcode.IF_GE || !jumpsTo(list, at - 2, at) || !inboxLiteral(list.get(at - 1), value, 5)) return false;
        for (int i = at - 3; i >= 0; i--) {
            if (targets.contains(i + 1)) return false;
            var op = list.get(i).getOpcode();
            if (!(list.get(i) instanceof OneRegisterInstruction one)) continue;
            int written = one.getRegisterA();
            if (op.setsRegister() && (written == value || (op.setsWideRegister() && written + 1 == value))) return inboxLiteral(list.get(i), value, 1);
        }
        return false;
    }

    static String inboxRefreshRoute(Map<String, ClassDef> byType, Method items) {
        var code = instructions(items);
        if (!INBOX_SUPPLIER.equals(items.getDefiningClass()) || AccessFlags.STATIC.isSet(items.getAccessFlags()) ||
            !items.getParameterTypes().isEmpty() || !IMMUTABLE_LIST.equals(items.getReturnType()) || code.isEmpty() ||
            (code.get(0).getOpcode() != Opcode.CONST_STRING && code.get(0).getOpcode() != Opcode.CONST_STRING_JUMBO) ||
            !INBOX_ITEMS_TRACE.equals(inboxString(code.get(0))) || mediaTargets(items).contains(0)) return null;
        var supplier = byType.get(INBOX_SUPPLIER);
        if (supplier == null || !AccessFlags.FINAL.isSet(supplier.getAccessFlags())) return null;
        Method subscribe = null;
        for (var m : supplier.getMethods()) {
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || !inboxParams(m).equals(List.of(INBOX_SUPPLIER, "Z")) ||
                instructions(m).stream().noneMatch(i -> INBOX_SUBSCRIBE_WARNING.equals(inboxString(i)))) continue;
            if (subscribe != null) return null;
            subscribe = m;
        }
        if (subscribe == null) return null;
        var body = instructions(subscribe);
        // The observer has a class of its own, built from the supplier and the subscription's generation. Mirrors OBSERVER_INIT in InboxRefresh.kt.
        int at = -1;
        for (int i = 0; i < body.size(); i++) {
            if (body.get(i).getOpcode() == Opcode.INVOKE_DIRECT && body.get(i) instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof MethodReference mr && "<init>".equals(mr.getName()) && "V".equals(mr.getReturnType()) &&
                inboxParams(mr).equals(List.of(INBOX_SUPPLIER, "I"))) {
                if (at >= 0) return null;
                at = i;
            }
        }
        if (at < 1 || body.get(at - 1).getOpcode() != Opcode.NEW_INSTANCE) return null;
        var init = (FiveRegisterInstruction) body.get(at);
        var observerType = ((TypeReference) ((ReferenceInstruction) body.get(at - 1)).getReference()).getType();
        if (init.getRegisterCount() != 3 || register(body.get(at - 1)) != init.getRegisterC() ||
            !observerType.equals(((MethodReference) ((ReferenceInstruction) body.get(at)).getReference()).getDefiningClass())) return null;
        var observer = byType.get(observerType);
        if (observer == null) return null;
        Method callback = null;
        for (var m : observer.getMethods()) {
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) ||
                !inboxParams(m).equals(List.of("Ljava/util/List;"))) continue;
            if (callback != null) return null;
            callback = m;
        }
        if (callback == null) return null;
        var list = instructions(callback);
        var targets = mediaTargets(callback);
        String listed = null, name = null;
        for (int k = 3; k < list.size(); k++) {
            if (!inboxListedWrite(list, targets, k)) continue;
            if (listed != null) return null;
            name = ((FieldReference) ((ReferenceInstruction) list.get(k)).getReference()).getName();
            listed = INBOX_SUPPLIER + "->" + name + ":I";
        }
        if (listed == null) return null;
        int declared = 0;
        for (var f : supplier.getFields())
            if (f.getName().equals(name) && "I".equals(f.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) declared++;
        boolean read = false;
        for (var i : code) if (i.getOpcode() == Opcode.IGET && listed.equals(ref(i))) read = true;
        return declared == 1 && read ? hookId(subscribe) + "|" + listed : null;
    }

    /**
     * The constructor of the holder Messenger keeps its downloaded emoji font in, or null. The getter reads the holder's
     * Typeface and returns it at once; the final holder has that Typeface, the font's File and one constructor taking both.
     */
    static String emojiFontHolder(Map<String, ClassDef> byType, Method getter) {
        var code = instructions(getter);
        var holders = new LinkedHashSet<String>();
        for (int i = 0; i + 1 < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.IGET_OBJECT && code.get(i) instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof FieldReference fr && "Landroid/graphics/Typeface;".equals(fr.getType()) &&
                code.get(i + 1).getOpcode() == Opcode.RETURN_OBJECT && code.get(i) instanceof TwoRegisterInstruction read &&
                ((OneRegisterInstruction) code.get(i + 1)).getRegisterA() == read.getRegisterA()) holders.add(fr.getDefiningClass());
        }
        if (holders.size() != 1 || holders.contains(getter.getDefiningClass())) return null;
        var holder = byType.get(holders.iterator().next());
        if (holder == null || !AccessFlags.FINAL.isSet(holder.getAccessFlags())) return null;
        var fields = new ArrayList<String>();
        for (var f : holder.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) fields.add(f.getType());
        Collections.sort(fields);
        if (!fields.equals(List.of("Landroid/graphics/Typeface;", "Ljava/io/File;"))) return null;
        Method init = null;
        for (var m : holder.getMethods()) {
            if (!"<init>".equals(m.getName())) continue;
            if (init != null) return null;
            init = m;
        }
        if (init == null || !hookId(init).equals(holder.getType() + "-><init>(Landroid/graphics/Typeface;Ljava/io/File;)V")) return null;
        var body = instructions(init);
        if (body.isEmpty() || body.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !(body.get(0) instanceof ReferenceInstruction call) ||
            !(call.getReference() instanceof MethodReference mr) || !"Ljava/lang/Object;".equals(mr.getDefiningClass()) ||
            !"<init>".equals(mr.getName()) || mediaTargets(init).contains(1)) return null;
        return hookId(init);
    }

    static final String SNIPPET_MAKER = "Lcom/facebook/messaging/threadlist/plugins/core/threadsnippet/lastmessage/LastMessageSnippetImpl;";

    /**
     * The chat list snippet's constructor that Use system emoji passes a Like through (#34 follow-up), or null. Mirrors
     * likeSnippetInit in EmojiFont.kt: the one class LastMessageSnippetImpl builds from a CharSequence that names itself
     * LastMessageThreadSnippet, final, with that one field and one constructor.
     */
    static String likeSnippetInit(Map<String, ClassDef> byType) {
        var maker = byType.get(SNIPPET_MAKER);
        if (maker == null) return null;
        var built = new LinkedHashSet<String>();
        for (var m : maker.getMethods()) for (var i : instructions(m)) {
            if (i.getOpcode() == Opcode.INVOKE_DIRECT && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
                "<init>".equals(mr.getName()) && mr.getParameterTypes().size() == 1 &&
                "Ljava/lang/CharSequence;".equals(mr.getParameterTypes().get(0).toString())) built.add(mr.getDefiningClass());
        }
        var named = new ArrayList<ClassDef>();
        for (var type : built) {
            var cls = byType.get(type);
            if (cls == null) continue;
            boolean names = false;
            for (var m : cls.getMethods()) if ("toString".equals(m.getName())) for (var i : instructions(m))
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s &&
                    s.getString().startsWith("LastMessageThreadSnippet(text=")) names = true;
            if (names) named.add(cls);
        }
        if (named.size() != 1) return null;
        var snippet = named.get(0);
        var fields = new ArrayList<String>();
        for (var f : snippet.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) fields.add(f.getType());
        Method init = null;
        for (var m : snippet.getMethods()) {
            if (!"<init>".equals(m.getName())) continue;
            if (init != null) return null;
            init = m;
        }
        if (!AccessFlags.FINAL.isSet(snippet.getAccessFlags()) || !fields.equals(List.of("Ljava/lang/CharSequence;")) || init == null ||
            !hookId(init).equals(snippet.getType() + "-><init>(Ljava/lang/CharSequence;)V")) return null;
        var body = instructions(init);
        if (body.isEmpty() || body.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !(body.get(0) instanceof ReferenceInstruction call) ||
            !(call.getReference() instanceof MethodReference mr) || !"Ljava/lang/Object;".equals(mr.getDefiningClass()) ||
            !"<init>".equals(mr.getName()) || mediaTargets(init).contains(1) || init.getImplementation().getRegisterCount() - 2 + 1 > 15) return null;
        return hookId(init);
    }

    /**
     * 585's renderer asks a static ()Z getter instead of loading the flag. The getter has to be the read alone: the
     * config object from a no-argument static call, the flag, an optional cast of another register, one (J)Z check
     * handed the flag last, and its answer returned as is. Mirrors EmojiDrawer.kt's isEmojiDrawerGetter.
     */
    static boolean emojiDrawerGetter(Method method) {
        if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Z".equals(method.getReturnType()) ||
            !method.getParameterTypes().isEmpty()) return false;
        var code = instructions(method);
        if (code.size() != 6 && code.size() != 7) return false;
        if (code.get(0).getOpcode() != Opcode.INVOKE_STATIC || ((FiveRegisterInstruction) code.get(0)).getRegisterCount() != 0 ||
            code.get(1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(2).getOpcode() != Opcode.CONST_WIDE ||
            ((WideLiteralInstruction) code.get(2)).getWideLiteral() != EMOJI_DRAWER_FLAG) return false;
        int pair = ((OneRegisterInstruction) code.get(2)).getRegisterA();
        int call = 3;
        if (code.size() == 7) {
            if (code.get(3).getOpcode() != Opcode.CHECK_CAST) return false;
            int held = ((OneRegisterInstruction) code.get(3)).getRegisterA();
            if (held == pair || held == pair + 1) return false;
            call = 4;
        }
        if (!(code.get(call) instanceof FiveRegisterInstruction invoke) ||
            !Set.of(Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL).contains(invoke.getOpcode()) ||
            !(((ReferenceInstruction) invoke).getReference() instanceof MethodReference check) || !"Z".equals(check.getReturnType()) ||
            check.getParameterTypes().isEmpty() || !"J".equals(check.getParameterTypes().get(check.getParameterTypes().size() - 1).toString())) return false;
        var arguments = List.of(invoke.getRegisterC(), invoke.getRegisterD(), invoke.getRegisterE(), invoke.getRegisterF(), invoke.getRegisterG())
            .subList(0, invoke.getRegisterCount());
        if (arguments.size() < 2 || !arguments.subList(arguments.size() - 2, arguments.size()).equals(List.of(pair, pair + 1))) return false;
        var result = code.get(call + 1);
        var back = code.get(call + 2);
        return result.getOpcode() == Opcode.MOVE_RESULT && back.getOpcode() == Opcode.RETURN &&
            ((OneRegisterInstruction) back).getRegisterA() == ((OneRegisterInstruction) result).getRegisterA();
    }

    /**
     * Every method that loads the emoji drawer flag, but only when the one renderer that throws the anchor loads it
     * too, itself or through a call to an emojiDrawerGetter reader. Mirrors EmojiDrawer.kt.
     */
    static List<Method> emojiDrawerReaders(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        var anchors = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            boolean reads = false, anchor = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) i).getWideLiteral() == EMOJI_DRAWER_FLAG) reads = true;
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                    EMOJI_DRAWER_ANCHOR.equals(sr.getString())) anchor = true;
            }
            if (reads) readers.add(method);
            if (anchor) anchors.add(method);
        }
        if (anchors.size() != 1) return List.of();
        var anchor = hookId(anchors.get(0));
        var getters = readers.stream().filter(CompatReport::emojiDrawerGetter).map(CompatReport::hookId).collect(Collectors.toSet());
        boolean linked = readers.stream().anyMatch(reader -> hookId(reader).equals(anchor)) || instructions(anchors.get(0)).stream().anyMatch(i ->
            i.getOpcode() == Opcode.INVOKE_STATIC && getters.contains(((ReferenceInstruction) i).getReference().toString()));
        return linked ? readers : List.of();
    }

    // The analytics logger's upload components and the entry points Android starts them through. Mirrors AnalyticsUploads.kt.
    static final String ANALYTICS2_UPLOAD_SERVICE = "Lcom/facebook/analytics2/logger/legacy/uploader/Analytics2UploadService;";
    static final String START_COMMAND = "onStartCommand(Landroid/content/Intent;II)I";
    static final String START_JOB = "onStartJob(Landroid/app/job/JobParameters;)Z";
    static final Map<String, Set<String>> ANALYTICS_UPLOAD_ENTRIES = Map.of(
        "Lcom/facebook/analytics2/logger/legacy/uploader/AlarmBasedUploadService;", Set.of(START_COMMAND),
        "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;", Set.of(START_COMMAND, START_JOB),
        "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;", Set.of(START_COMMAND, START_JOB),
        "Lcom/facebook/analytics2/logger/GooglePlayUploadService;", Set.of(START_COMMAND),
        "Lcom/facebook/analytics2/logger/legacy/uploader/HighPriUploadRetryReceiver;",
            Set.of("onReceive(Landroid/content/Context;Landroid/content/Intent;)V"));

    static String entryPoint(Method m) {
        return m.getName() + "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }

    // The message log's capture point: the one new-message notification constructor. Mirrors MessageLog.kt.
    static final String NEW_MESSAGE_NOTIFICATION = "Lcom/facebook/messaging/notify/type/NewMessageNotification;";
    static final String MESSENGER_ACCOUNT_TYPE = "Lcom/facebook/messaging/accountswitch/model/MessengerAccountType;";
    static final String MESSAGE_TYPE = "Lcom/facebook/messaging/model/messages/Message;";
    static final String THREAD_SUMMARY_TYPE = "Lcom/facebook/messaging/model/threads/ThreadSummary;";

    static final String MESSENGER_BROWSER_LAUNCHER = "Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;";
    static final List<String> REVOKE_HANDLER = List.of("Landroid/content/Intent;", BUBBLE_SESSION, "Ljava/lang/String;", "Ljava/util/Map;");
    static final String JSON_PUT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;";

    /**
     * Message String fields the browser launcher reads straight after loading "message_id" and puts into a JSONObject
     * under that key, all three on the same registers. Mirrors findMessageIdFields.
     */
    static Set<String> messageIdFields(List<ClassDef> classes) {
        var fields = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!MESSENGER_BROWSER_LAUNCHER.equals(cls.getType())) continue;
            for (var m : cls.getMethods()) {
                if (m.getImplementation() == null) continue;
                var code = new ArrayList<Instruction>();
                m.getImplementation().getInstructions().forEach(code::add);
                for (int at = 0; at + 2 < code.size(); at++) {
                    var key = code.get(at);
                    if ((key.getOpcode() != Opcode.CONST_STRING && key.getOpcode() != Opcode.CONST_STRING_JUMBO) ||
                        !(((ReferenceInstruction) key).getReference() instanceof StringReference name) || !"message_id".equals(name.getString())) continue;
                    if (code.get(at + 1).getOpcode() != Opcode.IGET_OBJECT ||
                        !(((ReferenceInstruction) code.get(at + 1)).getReference() instanceof FieldReference field) ||
                        !MESSAGE_TYPE.equals(field.getDefiningClass()) || !"Ljava/lang/String;".equals(field.getType())) continue;
                    if (code.get(at + 2).getOpcode() != Opcode.INVOKE_VIRTUAL || !(code.get(at + 2) instanceof FiveRegisterInstruction put) ||
                        !JSON_PUT.equals(((ReferenceInstruction) put).getReference().toString()) || put.getRegisterCount() != 3 ||
                        put.getRegisterD() != ((OneRegisterInstruction) key).getRegisterA() ||
                        put.getRegisterE() != ((TwoRegisterInstruction) code.get(at + 1)).getRegisterA()) continue;
                    fields.add(field.getDefiningClass() + "->" + field.getName() + ":" + field.getType());
                }
            }
        }
        return fields;
    }

    /** The one id field, public so the notification class can read it, or null when there isn't exactly one. */
    static String messageIdField(List<ClassDef> classes) {
        var fields = messageIdFields(classes);
        if (fields.size() != 1) return null;
        var id = fields.iterator().next();
        for (var cls : classes) {
            if (!MESSAGE_TYPE.equals(cls.getType())) continue;
            for (var f : cls.getFields()) {
                if ((MESSAGE_TYPE + "->" + f.getName() + ":" + f.getType()).equals(id) && AccessFlags.PUBLIC.isSet(f.getAccessFlags())) return id;
            }
        }
        return null;
    }

    /**
     * The Message boolean that the notification text builder, the one (Message, ThreadSummary)String method, reads to
     * show "Secret conversation" instead of the text. Public, or null when there isn't exactly one. Mirrors
     * findHiddenTextFields.
     */
    static String hiddenTextField(List<ClassDef> classes) {
        var fields = new LinkedHashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                var params = m.getParameterTypes();
                if (!"Ljava/lang/String;".equals(m.getReturnType()) || params.size() != 2 || !MESSAGE_TYPE.contentEquals(params.get(0)) ||
                    !THREAD_SUMMARY_TYPE.contentEquals(params.get(1)) || m.getImplementation() == null) continue;
                for (var insn : m.getImplementation().getInstructions()) {
                    if (insn.getOpcode() == Opcode.IGET_BOOLEAN && ((ReferenceInstruction) insn).getReference() instanceof FieldReference field &&
                        MESSAGE_TYPE.equals(field.getDefiningClass()) && "Z".equals(field.getType()))
                        fields.add(field.getDefiningClass() + "->" + field.getName() + ":" + field.getType());
                }
            }
        }
        if (fields.size() != 1) return null;
        var hidden = fields.iterator().next();
        for (var cls : classes) {
            if (!MESSAGE_TYPE.equals(cls.getType())) continue;
            for (var f : cls.getFields()) {
                if ((MESSAGE_TYPE + "->" + f.getName() + ":" + f.getType()).equals(hidden) && AccessFlags.PUBLIC.isSet(f.getAccessFlags())) return hidden;
            }
        }
        return null;
    }

    /**
     * The non-Parcel NewMessageNotification constructor, whose message and thread parameters the hook reads. Without one
     * readable message id the log couldn't tell two messages apart, and without the hidden-text flag it would log a
     * disappearing chat's stand-in, so either way the build reports no hook.
     */
    static List<Method> messageLogHooks(List<ClassDef> classes) {
        if (messageIdField(classes) == null || hiddenTextField(classes) == null) return List.of();
        for (var cls : classes) {
            if (!NEW_MESSAGE_NOTIFICATION.equals(cls.getType())) continue;
            var ctors = new ArrayList<Method>();
            for (var m : cls.getMethods()) {
                var params = m.getParameterTypes();
                if ("<init>".equals(m.getName()) && "V".equals(m.getReturnType()) && params.size() >= 3 &&
                    MESSENGER_ACCOUNT_TYPE.contentEquals(params.get(0)) && MESSAGE_TYPE.contentEquals(params.get(1)) &&
                    THREAD_SUMMARY_TYPE.contentEquals(params.get(2)) && m.getImplementation() != null) ctors.add(m);
            }
            return ctors.size() == 1 && messageLogRoom(ctors.get(0)) && messageLogContract(classes, ctors.get(0)) ? ctors : List.of();
        }
        return List.of();
    }

    static final String SECRET_STRING = "Lcom/facebook/secure/secrettypes/SecretString;";
    static final String MESSAGES_NOTIFICATION_MANAGER = "Lcom/facebook/messaging/notify/client/MessagesNotificationManager;";
    static final String UNSEND_RETRACTION = "messenger_android_unsend_notificaiton_retraction";

    /** Two free locals past the parameters, as MessageLog.kt's validateMessageLog needs for the hook. */
    static boolean messageLogRoom(Method ctor) {
        int words = 1;
        for (var type : ctor.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        return !AccessFlags.STATIC.isSet(ctor.getAccessFlags()) && ctor.getImplementation().getRegisterCount() >= words + 2;
    }

    static String fieldId(FieldReference field) {
        return field.getDefiningClass() + "->" + field.getName() + ":" + field.getType();
    }

    /** The instance fields of owner with this type that the method reads with iget-object, as MessageLog.kt's fieldReads. */
    static Set<String> objectReads(Method method, String owner, String type) {
        var reads = new LinkedHashSet<String>();
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f &&
                owner.equals(f.getDefiningClass()) && type.equals(f.getType())) reads.add(fieldId(f));
        return reads;
    }

    /** Whether cls declares the field where the notification class can read it: public, or non-private in its package. */
    static boolean readableFromNotification(ClassDef cls, String id) {
        for (var f : cls.getFields()) {
            if (!(cls.getType() + "->" + f.getName() + ":" + f.getType()).equals(id)) continue;
            String pkg = cls.getType().substring(0, cls.getType().lastIndexOf('/'));
            return AccessFlags.PUBLIC.isSet(f.getAccessFlags()) || (!AccessFlags.PRIVATE.isSet(f.getAccessFlags()) &&
                pkg.equals(NEW_MESSAGE_NOTIFICATION.substring(0, NEW_MESSAGE_NOTIFICATION.lastIndexOf('/'))));
        }
        return false;
    }

    /**
     * The rest of MessageLog.kt's resolveMessageLogContract, which messageIdField and hiddenTextField start: one text
     * field Message's SecretString getter reads, one String field SecretString's constructor fills from its argument,
     * both readable from the notification, one ThreadKey field the constructor loads and one unsent check.
     */
    static boolean messageLogContract(List<ClassDef> classes, Method ctor) {
        ClassDef message = null, secret = null;
        for (var cls : classes) {
            if (message == null && MESSAGE_TYPE.equals(cls.getType())) message = cls;
            if (secret == null && SECRET_STRING.equals(cls.getType())) secret = cls;
        }
        if (message == null || secret == null) return false;
        var bodies = new LinkedHashSet<String>();
        for (var m : message.getMethods())
            if (SECRET_STRING.equals(m.getReturnType()) && m.getImplementation() != null && stringsOf(m).contains("text"))
                bodies.addAll(objectReads(m, MESSAGE_TYPE, SECRET_STRING));
        var secretCtors = new ArrayList<Method>();
        for (var m : secret.getMethods())
            if ("<init>".equals(m.getName()) && m.getImplementation() != null &&
                m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/String;"))) secretCtors.add(m);
        if (bodies.size() != 1 || secretCtors.size() != 1) return false;
        int argument = secretCtors.get(0).getImplementation().getRegisterCount() - 1;
        var texts = new LinkedHashSet<String>();
        for (var i : instructions(secretCtors.get(0)))
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f && SECRET_STRING.equals(f.getDefiningClass()) &&
                "Ljava/lang/String;".equals(f.getType()) && i instanceof TwoRegisterInstruction t && t.getRegisterA() == argument) texts.add(fieldId(f));
        return texts.size() == 1 && readableFromNotification(message, bodies.iterator().next()) &&
            readableFromNotification(secret, texts.iterator().next()) && objectReads(ctor, MESSAGE_TYPE, THREAD_KEY).size() == 1 &&
            unsentChecks(classes).size() == 1;
    }

    /**
     * MessageLog.kt's findUnsentChecks: the (Message)Z checks the notification manager calls where it logs an unsend
     * retraction, kept when their public class holds them as public static checks of one long Message field.
     */
    static Set<String> unsentChecks(List<ClassDef> classes) {
        ClassDef manager = null;
        for (var cls : classes) if (MESSAGES_NOTIFICATION_MANAGER.equals(cls.getType())) { manager = cls; break; }
        if (manager == null) return Set.of();
        var called = new HashSet<String>();
        for (var m : manager.getMethods()) {
            if (m.getImplementation() == null || !stringsOf(m).contains(UNSEND_RETRACTION)) continue;
            for (var i : instructions(m))
                if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) && i instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference mr && "Z".equals(mr.getReturnType()) &&
                    mr.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MESSAGE_TYPE))) called.add(mr.toString());
        }
        var owners = new HashSet<String>();
        for (var id : called) owners.add(id.substring(0, id.indexOf("->")));
        var checks = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!owners.contains(cls.getType()) || !AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) continue;
            for (var m : cls.getMethods()) if (called.contains(hookId(m)) && unsentCheck(m)) checks.add(hookId(m));
        }
        return checks;
    }

    static Long wide(Instruction i) {
        return i instanceof WideLiteralInstruction w ? w.getWideLiteral() : null;
    }

    static boolean isNarrow(Instruction i, long value) {
        return i instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == value;
    }

    static TwoRegisterInstruction twoRegister(List<Instruction> code, int at, Opcode op) {
        return code.get(at).getOpcode() == op && code.get(at) instanceof TwoRegisterInstruction t ? t : null;
    }

    /**
     * OriginalVideo.kt's videoPassthroughSite: the one size check against the bitrate limit plus Messenger's configured
     * margin, with the limit arithmetic, the metadata reads and the registers the hook needs all where 583 has them.
     */
    /**
     * XheAudio.kt's source checks for xhe_transcode: the worker's source path (its first String parameter, the fourth
     * register from the top) is read before anything overwrites it, and it or a plain copy of it reaches a static
     * (String)Uri call, Messenger parsing the source it's about to read.
     */
    static boolean transcodeSourceParsed(Method method) {
        var code = instructions(method);
        int source = method.getImplementation().getRegisterCount() - 6 + 3;
        var holders = new HashSet<Integer>(List.of(source));
        boolean read = false;
        for (Instruction insn : code) {
            List<Integer> named = new ArrayList<>();
            if (insn instanceof FiveRegisterInstruction f) {
                int[] all = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
                for (int i = 0; i < f.getRegisterCount(); i++) named.add(all[i]);
            } else if (insn instanceof RegisterRangeInstruction r) {
                for (int i = 0; i < r.getRegisterCount(); i++) named.add(r.getStartRegister() + i);
            }
            Opcode op = insn.getOpcode();
            Integer written = op.setsRegister() && !op.name.endsWith("/2addr") && insn instanceof OneRegisterInstruction o
                ? o.getRegisterA() : null;
            if (insn instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference m &&
                (op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE) && "Landroid/net/Uri;".equals(m.getReturnType()) &&
                m.getParameterTypes().size() == 1 && "Ljava/lang/String;".contentEquals(m.getParameterTypes().get(0)) &&
                named.size() == 1 && holders.contains(named.get(0))) return true;
            if ((op == Opcode.MOVE_OBJECT || op == Opcode.MOVE_OBJECT_FROM16 || op == Opcode.MOVE_OBJECT_16) &&
                holders.contains(((TwoRegisterInstruction) insn).getRegisterB())) {
                holders.add(((TwoRegisterInstruction) insn).getRegisterA());
                read = true;
                continue;
            }
            if (!read && written != null && (written == source || (op.setsWideRegister() && written + 1 == source))) return false;
            if (named.contains(source)) read = true;
            if (written != null) {
                holders.remove(written);
                if (op.setsWideRegister()) holders.remove(written + 1);
            }
            if (holders.isEmpty()) return false;
        }
        return false;
    }

    static boolean videoPassthroughSite(Method method) {
        var code = instructions(method);
        var sites = new ArrayList<Integer>();
        for (int c = 9; c < code.size() - 1; c++) {
            if (code.get(c).getOpcode() != Opcode.CMP_LONG) continue;
            boolean configured = c >= 11 && code.get(c + 1).getOpcode() == Opcode.IF_LTZ &&
                code.get(c - 6).getOpcode() == Opcode.CONST_WIDE_16 && Long.valueOf(8000L).equals(wide(code.get(c - 6))) &&
                isNarrow(code.get(c - 3), 1000);
            boolean constant = code.get(c + 1).getOpcode() == Opcode.IF_GEZ &&
                code.get(c - 4).getOpcode() == Opcode.CONST_WIDE_16 && Long.valueOf(8000L).equals(wide(code.get(c - 4))) &&
                code.get(c - 2).getOpcode() == Opcode.CONST_WIDE_32 && Long.valueOf(5_000_000L).equals(wide(code.get(c - 2))) &&
                code.get(c - 3).getOpcode() == Opcode.DIV_LONG_2ADDR && code.get(c - 5).getOpcode() == Opcode.MUL_LONG_2ADDR;
            if (configured || constant) sites.add(c);
        }
        if (sites.size() != 1) return false;
        int c = sites.get(0);
        boolean constant = code.get(c - 2).getOpcode() == Opcode.CONST_WIDE_32 && Long.valueOf(5_000_000L).equals(wide(code.get(c - 2)));
        var cmp = (ThreeRegisterInstruction) code.get(c);
        int limit = cmp.getRegisterC(), size = cmp.getRegisterB(), result = cmp.getRegisterA();
        var add = twoRegister(code, c - 1, Opcode.ADD_LONG_2ADDR);
        var div = twoRegister(code, constant ? c - 3 : c - 5, Opcode.DIV_LONG_2ADDR);
        var mul = twoRegister(code, constant ? c - 5 : c - 7, Opcode.MUL_LONG_2ADDR);
        var duration = twoRegister(code, constant ? c - 6 : c - 8, Opcode.IGET_WIDE);
        var widen = twoRegister(code, constant ? c - 7 : c - 9, Opcode.INT_TO_LONG);
        var bytes = twoRegister(code, constant ? c - 9 : c - 11, Opcode.IGET_WIDE);
        if (add == null || div == null || mul == null || duration == null || widen == null || bytes == null) return false;
        int temp = register(code.get(constant ? c - 2 : c - 6));
        if (constant) {
            if (register(code.get(c - 2)) != temp) return false;
        } else {
            var widenMargin = twoRegister(code, c - 2, Opcode.INT_TO_LONG);
            var margin = twoRegister(code, c - 3, Opcode.MUL_INT_LIT16);
            if (widenMargin == null || margin == null || widenMargin.getRegisterA() != temp || widenMargin.getRegisterB() != temp ||
                margin.getRegisterA() != temp || margin.getRegisterB() != temp) return false;
        }
        if (add.getRegisterA() != limit || add.getRegisterB() != temp || div.getRegisterA() != limit ||
            div.getRegisterB() != temp || mul.getRegisterA() != limit || mul.getRegisterB() != duration.getRegisterA() ||
            widen.getRegisterA() != limit || widen.getRegisterB() != limit) return false;
        var bytesField = (FieldReference) ((ReferenceInstruction) bytes).getReference();
        var durationField = (FieldReference) ((ReferenceInstruction) duration).getReference();
        if (bytes.getRegisterA() != size || !"J".equals(bytesField.getType()) || !"J".equals(durationField.getType()) ||
            !bytesField.getDefiningClass().equals(durationField.getDefiningClass()) || bytesField.getName().equals(durationField.getName()) ||
            bytes.getRegisterB() != duration.getRegisterB()) return false;
        // Nothing between the size read and the compare may write the size pair.
        for (int at = (constant ? c - 8 : c - 10); at < c; at++) {
            if (!(code.get(at) instanceof OneRegisterInstruction one)) continue;
            int written = one.getRegisterA();
            if (written == size || written == size + 1 || written + 1 == size) return false;
        }
        return register(code.get(c + 1)) == result && !mediaTargets(method).contains(c + 1) &&
            result <= 15 && size + 1 <= 15 && result != size && result != size + 1;
    }

    /** Static, public, (Message)Z, and all it reads is one long field of the message, compared once. */
    static boolean unsentCheck(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) ||
            !m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MESSAGE_TYPE))) return false;
        var code = instructions(m);
        var touches = code.stream().filter(i -> i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference).toList();
        if (touches.size() != 1 || touches.get(0).getOpcode() != Opcode.IGET_WIDE) return false;
        var field = (FieldReference) ((ReferenceInstruction) touches.get(0)).getReference();
        return MESSAGE_TYPE.equals(field.getDefiningClass()) && "J".equals(field.getType()) &&
            code.stream().filter(i -> i.getOpcode() == Opcode.CMP_LONG).count() == 1;
    }

    /**
     * Every upload entry point. Analytics2UploadService inherits its two from an obfuscated job service base, which
     * counts only while it's abstract, extends JobService directly and has no other subclass.
     */
    static final String MONTAGE_PARAMS = "Lcom/facebook/messaging/montage/composer/model/MontageComposerFragmentParams;";
    static final String NAVIGATION_TRIGGER = "Lcom/facebook/messaging/send/trigger/NavigationTrigger;";
    static final String MONTAGE_ACTIVITY = "Lcom/facebook/messaging/montage/composer/MontageComposerActivity;";

    static boolean hasLiteral(Method m, int value) {
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == value) return true;
        return false;
    }

    static boolean isFragmentStart(MethodReference mr) {
        return "Z".equals(mr.getReturnType()) && List.of("Landroid/content/Intent;", "Landroidx/fragment/app/Fragment;", "I")
            .equals(mr.getParameterTypes().stream().map(Object::toString).toList());
    }

    static Set<String> stringsOf(Method m) {
        var strings = new HashSet<String>();
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference sr) strings.add(sr.getString());
        return strings;
    }

    static boolean isCameraClass(Instruction i) {
        return i.getOpcode() == Opcode.CONST_CLASS && ((ReferenceInstruction) i).getReference() instanceof TypeReference t &&
            MONTAGE_ACTIVITY.equals(t.getType());
    }

    /** The static factory Messenger 583's chat screen gets its camera launcher from. Mirrors SystemCamera.kt. */
    static boolean isChatCameraFactory(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getParameterTypes().isEmpty() ||
            !"Landroid/content/Context;".equals(m.getParameterTypes().get(0).toString())) return false;
        var strings = stringsOf(m);
        boolean cameraClass = false;
        for (var i : m.getImplementation().getInstructions()) if (isCameraClass(i)) cameraClass = true;
        return strings.contains("fragment_params") && strings.contains("trigger2") && hasLiteral(m, 7376) && cameraClass;
    }

    /** What the factory's builder returns right after it's handed the camera screen's class. */
    static String chatCameraLauncherType(Method factory) {
        var code = new ArrayList<Instruction>();
        factory.getImplementation().getInstructions().forEach(code::add);
        int at = -1;
        for (int i = 0; i < code.size(); i++) if (isCameraClass(code.get(i))) { at = i; break; }
        if (at < 0 || at + 1 >= code.size() || code.get(at + 1).getOpcode() != Opcode.IPUT_OBJECT) return null;
        var builder = ((FieldReference) ((ReferenceInstruction) code.get(at + 1)).getReference()).getDefiningClass();
        for (int i = at + 2; i < code.size(); i++)
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference mr &&
                builder.equals(mr.getDefiningClass())) return mr.getReturnType();
        return null;
    }

    /** The check Messenger 583's chat runs on where a picked photo comes from. Mirrors SystemCamera.kt. */
    static boolean isThirdPartyUriCheck(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Ljava/lang/Boolean;".equals(m.getReturnType()) ||
            !List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(Object::toString).toList())) return false;
        var strings = stringsOf(m);
        return strings.contains("Unable to get providerInfo for authority ") && strings.contains("content");
    }

    /** The open that refuses a picked photo whose file Messenger itself owns. Mirrors SystemCamera.kt. */
    static boolean isInternalFileOpen(Method m) {
        return AccessFlags.STATIC.isSet(m.getAccessFlags()) && "Landroid/content/res/AssetFileDescriptor;".equals(m.getReturnType()) &&
            List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(Object::toString).toList()) &&
            stringsOf(m).contains("Attempted to retrieve internal file.");
    }

    static boolean isLauncherStart(Method m) {
        if (!"Z".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getParameterTypes().size() != 2 ||
            !"Landroid/os/Bundle;".equals(m.getParameterTypes().get(0).toString()) ||
            !m.getParameterTypes().get(1).toString().startsWith("L") || !stringsOf(m).contains("ActivityLauncher")) return false;
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr && isFragmentStart(mr)) return true;
        return false;
    }

    static boolean isLauncherCall(MethodReference mr) {
        return "Z".equals(mr.getReturnType()) && mr.getParameterTypes().size() == 2 &&
            "Landroid/os/Bundle;".equals(mr.getParameterTypes().get(0).toString()) && mr.getParameterTypes().get(1).toString().startsWith("L");
    }

    /**
     * The launcher interface a capture handler starts the camera through, or null. An instance method that casts its event to
     * ActivateCameraEvent, or (585) the static helper both dispatchers hand the cast event to, that makes exactly one
     * launcher call. Mirrors SystemCamera.kt captureLauncherType.
     */
    static String captureLauncherType(Method m) {
        if (!"V".equals(m.getReturnType())) return null;
        boolean casts = AccessFlags.STATIC.isSet(m.getAccessFlags()) && !m.getParameterTypes().isEmpty() &&
            "Lcom/facebook/xapp/messaging/composer/camera/event/ActivateCameraEvent;".equals(m.getParameterTypes().get(0).toString());
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && !casts) return null;
        var calls = new ArrayList<MethodReference>();
        for (var i : m.getImplementation().getInstructions()) {
            if (i.getOpcode() == Opcode.CHECK_CAST && ((ReferenceInstruction) i).getReference() instanceof TypeReference t &&
                "Lcom/facebook/xapp/messaging/composer/camera/event/ActivateCameraEvent;".equals(t.getType())) casts = true;
            if (i.getOpcode() == Opcode.INVOKE_INTERFACE && ((ReferenceInstruction) i).getReference() instanceof MethodReference mr && isLauncherCall(mr)) calls.add(mr);
        }
        return casts && calls.size() == 1 ? calls.get(0).getDefiningClass() : null;
    }

    /**
     * system_camera: the chat composer's camera listener, which builds MontageComposerActivity's intent and starts it
     * with request code 7377. Counted only while exactly one chat fragment also reads a photo picked in another app
     * (request code 1112), the path the switch hands the phone camera's photo to. While that reader also reads 7376, the
     * code Messenger 583's chat screen starts its camera with, the chat camera's factory, its launcher's start and the
     * chat's checks on where a picked photo comes from and who owns its file count too.
     */
    static List<Method> systemCameraLaunches(List<ClassDef> classes) {
        var launches = new ArrayList<Method>();
        var factories = new ArrayList<Method>();
        var captures = new ArrayList<Method>();
        var starts = new ArrayList<Method>();
        var checks = new ArrayList<Method>();
        int readers = 0;
        boolean readsChatCamera = false;
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            var params = new ArrayList<String>();
            for (var t : m.getParameterTypes()) params.add(t.toString());
            var strings = new HashSet<String>();
            boolean buildsIntent = false;
            for (var i : m.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction r)) continue;
                if (r.getReference() instanceof StringReference sr) strings.add(sr.getString());
                if (r.getReference() instanceof MethodReference mr && MONTAGE_ACTIVITY.equals(mr.getDefiningClass()) &&
                    "Landroid/content/Intent;".equals(mr.getReturnType()) &&
                    List.of("Landroid/content/Context;", MONTAGE_PARAMS, NAVIGATION_TRIGGER).equals(mr.getParameterTypes().stream().map(Object::toString).toList()))
                    buildsIntent = true;
            }
            if ("onActivityResult".equals(m.getName()) && "V".equals(m.getReturnType()) && params.equals(List.of("I", "I", "Landroid/content/Intent;")) &&
                hasLiteral(m, 7377) && hasLiteral(m, 1112) && strings.contains("ComposeFragment:externalMediaGalleryActivityResultNullData") &&
                strings.contains("ComposeFragment:montageMessageActivityResultNullData")) {
                readers++;
                readsChatCamera = hasLiteral(m, 7376);
            }
            if ("V".equals(m.getReturnType()) && params.equals(List.of(MONTAGE_PARAMS, NAVIGATION_TRIGGER)) &&
                !AccessFlags.STATIC.isSet(m.getAccessFlags()) && buildsIntent && hasLiteral(m, 7377)) launches.add(m);
            if (isChatCameraFactory(m)) factories.add(m);
            if (captureLauncherType(m) != null) captures.add(m);
            if (isLauncherStart(m)) starts.add(m);
            if (isThirdPartyUriCheck(m) || isInternalFileOpen(m)) checks.add(m);
        }
        if (readers != 1) return List.of();
        if (!readsChatCamera) return launches;
        launches.addAll(factories);
        var launcherInterface = factories.size() == 1 ? factories.get(0).getReturnType() : null;
        for (var m : captures) if (captureLauncherType(m).equals(launcherInterface)) launches.add(m);
        var launcher = factories.size() == 1 ? chatCameraLauncherType(factories.get(0)) : null;
        for (var m : starts) if (m.getDefiningClass().equals(launcher)) launches.add(m);
        launches.addAll(checks);
        return launches;
    }

    static final String ACTIVATE_GALLERY = "Lcom/facebook/xapp/messaging/composer/gallery/event/ActivateGalleryEvent;";
    static final String EDIT_GALLERY_ITEM = "Lcom/facebook/xapp/messaging/composer/gallery/event/EditGalleryItemEvent;";

    static String dotted(String type) {
        return type.substring(1, type.length() - 1).replace('/', '.');
    }

    static String packageOf(String type) {
        int slash = type.lastIndexOf('/');
        return slash < 0 ? "" : type.substring(0, slash);
    }

    static boolean isComposerResult(Method m) {
        if (!"onActivityResult".equals(m.getName()) || !"V".equals(m.getReturnType()) ||
            !List.of("I", "I", "Landroid/content/Intent;").equals(m.getParameterTypes().stream().map(Object::toString).toList())) return false;
        var strings = stringsOf(m);
        return hasLiteral(m, 7377) && hasLiteral(m, 1112) && strings.contains("ComposeFragment:externalMediaGalleryActivityResultNullData") &&
            strings.contains("ComposeFragment:montageMessageActivityResultNullData");
    }

    static final String COMPOSER_EVENT = "Lcom/facebook/xapp/messaging/composer/event/ComposerEvent;";

    /** The older handler given the event's class name, or the composer plugin given the event. Mirrors galleryHandlerKind. */
    static String galleryHandlerKind(Method m) {
        var params = m.getParameterTypes().stream().map(Object::toString).toList();
        if (params.size() == 2 && "Ljava/lang/String;".equals(params.get(1))) return "by name";
        if (params.size() == 4 && COMPOSER_EVENT.equals(params.get(3))) return "plugin";
        return null;
    }

    static boolean typeIs(Instruction i, Opcode opcode, String type) {
        return i.getOpcode() == opcode && i instanceof ReferenceInstruction r && r.getReference() instanceof TypeReference t && type.equals(t.getType());
    }

    /** A chat composer event handler, opening Messenger's gallery and its editor by event name or class. Mirrors ExternalGallery.kt. */
    static boolean isGalleryHandler(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType())) return false;
        var kind = galleryHandlerKind(m);
        if ("by name".equals(kind)) {
            var strings = stringsOf(m);
            if (!strings.contains(dotted(ACTIVATE_GALLERY)) || !strings.contains(dotted(EDIT_GALLERY_ITEM))) return false;
        } else if ("plugin".equals(kind)) {
            for (var event : List.of(ACTIVATE_GALLERY, EDIT_GALLERY_ITEM)) {
                boolean checked = false;
                for (var i : m.getImplementation().getInstructions()) if (typeIs(i, Opcode.INSTANCE_OF, event)) checked = true;
                if (!checked) return false;
            }
        } else return false;
        int casts = 0;
        for (var i : m.getImplementation().getInstructions()) if (typeIs(i, Opcode.CHECK_CAST, ACTIVATE_GALLERY)) casts++;
        return casts == 1;
    }

    static boolean implementsThrough(ClassDef cls, String iface, Map<String, ClassDef> byType) {
        for (int depth = 0; cls != null && depth < 16; depth++, cls = cls.getSuperclass() == null ? null : byType.get(cls.getSuperclass()))
            if (cls.getInterfaces().contains(iface)) return true;
        return false;
    }

    /** A class and the classes above it, as far as the dex has them. */
    static List<ClassDef> lineage(ClassDef cls, Map<String, ClassDef> byType) {
        var up = new ArrayList<ClassDef>();
        for (int depth = 0; cls != null && depth < 16; depth++, cls = cls.getSuperclass() == null ? null : byType.get(cls.getSuperclass())) up.add(cls);
        return up;
    }

    static boolean declaresStart(ClassDef cls, Method start) {
        var signature = start.getParameterTypes().stream().map(CharSequence::toString).toList();
        for (var m : cls.getMethods())
            if (m.getName().equals(start.getName()) && m.getReturnType().equals(start.getReturnType()) &&
                m.getParameterTypes().stream().map(CharSequence::toString).toList().equals(signature)) return true;
        return false;
    }

    /** The one concrete class that runs the launcher's own start, with nothing below it bringing another. Mirrors galleryTarget. */
    static ClassDef galleryTarget(List<ClassDef> classes, ClassDef launcher, Method start, Map<String, ClassDef> byType) {
        var below = new ArrayList<ClassDef>();
        for (var cls : classes)
            if (!cls.getType().equals(launcher.getType()) && lineage(cls, byType).stream().anyMatch(up -> up.getType().equals(launcher.getType()))) below.add(cls);
        // 584's launcher is abstract with two final subclasses that both inherit its start, so every object of it runs this start.
        if (below.stream().noneMatch(other -> declaresStart(other, start))) return launcher;
        var candidates = new ArrayList<ClassDef>(below);
        candidates.add(0, launcher);
        ClassDef target = null;
        for (var cls : candidates) {
            if (AccessFlags.ABSTRACT.isSet(cls.getAccessFlags())) continue;
            boolean runs = true;
            for (var up : lineage(cls, byType)) {
                if (up.getType().equals(launcher.getType())) break;
                if (declaresStart(up, start)) runs = false;
            }
            if (!runs) continue;
            boolean replaced = false;
            for (var other : below)
                if (declaresStart(other, start) && lineage(other, byType).stream().anyMatch(up -> up.getType().equals(cls.getType()))) replaced = true;
            if (replaced) continue;
            if (target != null) return null;
            target = cls;
        }
        return target;
    }

    /** The editor gets the launcher from its last parameter and starts it straight away. Mirrors startsFromProvider. */
    static boolean startsFromProvider(Method editor, String providerType, String start) {
        var code = instructions(editor);
        var params = editor.getParameterTypes();
        if (params.isEmpty() || !providerType.equals(params.get(params.size() - 1).toString())) return false;
        int provider = editor.getImplementation().getRegisterCount() - 1;
        int get = -1;
        for (int i = 0; i < code.size(); i++) {
            if (writesRegister(code.get(i), provider)) return false;
            if (code.get(i).getOpcode() == Opcode.INVOKE_INTERFACE && callArgs(code.get(i)).equals(List.of(provider)) &&
                (providerType + "->get()Ljava/lang/Object;").equals(ref(code.get(i)))) {
                if (get >= 0) return false;
                get = i;
            }
        }
        if (get < 0 || get + 2 >= code.size() || code.get(get + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
        int launcher = ((OneRegisterInstruction) code.get(get + 1)).getRegisterA();
        var cast = code.get(get + 2);
        if (cast.getOpcode() != Opcode.CHECK_CAST || ((OneRegisterInstruction) cast).getRegisterA() != launcher ||
            !(((ReferenceInstruction) cast).getReference() instanceof TypeReference t) || !start.startsWith(t.getType() + "->")) return false;
        for (int i = get + 3; i < code.size(); i++) {
            var instruction = code.get(i);
            if (instruction.getOpcode() == Opcode.INVOKE_INTERFACE && start.equals(ref(instruction)))
                return !callArgs(instruction).isEmpty() && callArgs(instruction).get(0) == launcher;
            if (writesRegister(instruction, launcher) || instruction instanceof OffsetInstruction) return false;
        }
        return false;
    }

    /** The handler's field its Edit branch hands the editor, the chat camera launcher's provider. Mirrors galleryProvider. */
    static FieldReference galleryProvider(Method handler, String iface, Method start, Map<String, ClassDef> byType) {
        var code = instructions(handler);
        int e = -1;
        for (int i = 0; i < code.size(); i++)
            if ((code.get(i).getOpcode() == Opcode.INVOKE_STATIC || code.get(i).getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                code.get(i) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr && refParams(mr).contains(EDIT_GALLERY_ITEM)) {
                if (e >= 0) return null;
                e = i;
            }
        if (e < 0) return null;
        var edit = (MethodReference) ((ReferenceInstruction) code.get(e)).getReference();
        var editParams = refParams(edit);
        var args = callArgs(code.get(e));
        if (editParams.isEmpty() || args.isEmpty()) return null;
        String providerType = editParams.get(editParams.size() - 1);
        int provider = args.get(args.size() - 1);
        int load = -1;
        for (int i = e - 1; i >= 0 && load < 0; i--) if (writesRegister(code.get(i), provider)) load = i;
        // 585 reads the field into another register and moves it into the call's range, so plain moves are followed.
        for (int hops = 0; load >= 0 && hops < 4 && Set.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
            .contains(code.get(load).getOpcode()); hops++) {
            int from = ((TwoRegisterInstruction) code.get(load)).getRegisterB(), at = load;
            load = -1;
            for (int i = at - 1; i >= 0 && load < 0; i--) if (writesRegister(code.get(i), from)) load = i;
        }
        if (load < 0 || code.get(load).getOpcode() != Opcode.IGET_OBJECT ||
            !(((ReferenceInstruction) code.get(load)).getReference() instanceof FieldReference field)) return null;
        if (!field.getDefiningClass().equals(handler.getDefiningClass()) || !field.getType().equals(providerType)) return null;
        var edges = edges(handler);
        if (edges == null) return null;
        // Branches may run between the read and the call, but only the read leads in: no catch, no switch case, and no
        // branch from outside lands there.
        for (var edge : edges) {
            if (edge[1] <= load || edge[1] > e) continue;
            var from = edge[0] < 0 ? null : code.get(edge[0]).getOpcode();
            if (from == null || from == Opcode.PACKED_SWITCH || from == Opcode.SPARSE_SWITCH || edge[0] < load || edge[0] >= e) return null;
        }
        var home = byType.get(handler.getDefiningClass());
        if (home == null) return null;
        int fields = 0;
        for (var f : home.getFields())
            if (f.getName().equals(field.getName()) && f.getType().equals(field.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) fields++;
        if (fields != 1) return null;
        var editorClass = byType.get(edit.getDefiningClass());
        if (editorClass == null) return null;
        Method editor = null;
        for (var m : editorClass.getMethods()) if (hookId(m).equals(edit.toString())) {
            if (editor != null) return null;
            editor = m;
        }
        if (editor == null || editor.getImplementation() == null) return null;
        var startParams = new StringBuilder();
        for (var type : start.getParameterTypes()) startParams.append(type);
        return startsFromProvider(editor, providerType, iface + "->" + start.getName() + "(" + startParams + ")Z") ? field : null;
    }

    static final String ACTIVITY_RESULT_EVENT = "Lcom/facebook/xapp/messaging/composer/activity/event/ActivityResultEvent;";

    /** The p-number of the method's one parameter of this type, or -1 when it has none or several. */
    static int onlyParameter(Method m, String type) {
        int at = -1, found = 0, words = AccessFlags.STATIC.isSet(m.getAccessFlags()) ? 0 : 1;
        for (var param : m.getParameterTypes()) {
            if (type.contentEquals(param)) { found++; at = words; }
            words += "J".contentEquals(param) || "D".contentEquals(param) ? 2 : 1;
        }
        return found == 1 ? at : -1;
    }

    /**
     * The chat's static handler for a photo picked in another app: handed one thread and one result event, it checks for
     * 1112 and reads the event's one intent field from that parameter, which it never writes. Mirrors galleryItemsIntent
     * in ExternalGallery.kt.
     */
    static boolean isGalleryItemsHandler(Method m, Map<String, ClassDef> byType) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || m.getImplementation() == null ||
            onlyParameter(m, THREAD_KEY) < 0 || onlyParameter(m, ACTIVITY_RESULT_EVENT) < 0 || !hasLiteral(m, 1112)) return false;
        int event = galleryItemsRegister(m, ACTIVITY_RESULT_EVENT);
        var intents = new LinkedHashMap<String, FieldReference>();
        for (var i : instructions(m)) {
            if (writesRegister(i, event)) return false;
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) i).getRegisterB() == event &&
                ((ReferenceInstruction) i).getReference() instanceof FieldReference f && ACTIVITY_RESULT_EVENT.equals(f.getDefiningClass()) &&
                "Landroid/content/Intent;".equals(f.getType())) intents.put(f.toString(), f);
        }
        if (intents.size() != 1) return false;
        var intent = intents.values().iterator().next();
        var eventClass = byType.get(ACTIVITY_RESULT_EVENT);
        if (eventClass == null) return false;
        int fields = 0;
        for (var field : eventClass.getFields())
            if (field.getName().equals(intent.getName()) && field.getType().equals(intent.getType()) && !AccessFlags.STATIC.isSet(field.getAccessFlags())) fields++;
        return fields == 1;
    }

    /** The register that holds the static method's one parameter of this type. */
    static int galleryItemsRegister(Method m, String type) {
        int words = 0;
        for (var param : m.getParameterTypes()) words += "J".contentEquals(param) || "D".contentEquals(param) ? 2 : 1;
        return m.getImplementation().getRegisterCount() - words + onlyParameter(m, type);
    }

    /**
     * external_gallery: the chat's gallery event handlers (at most one of each kind, every one routing), the chat camera
     * launcher's start (the one way each handler's Edit branch reaches that launcher), the chat's result reader and its
     * one handler for a photo from another app, counted only while the reader is an instance method that reads the chat
     * camera's request code and the launcher is the camera switch's own. Mirrors findExternalGallery in ExternalGallery.kt.
     * Each gallery handler needs three locals for its scratch registers, and the photo handler's hook reaches its thread
     * and event with plain instructions, so both sit below v16.
     */
    static List<Method> externalGalleryHooks(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        var factories = new ArrayList<Method>();
        var handlers = new ArrayList<Method>();
        var items = new ArrayList<Method>();
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (m.getImplementation() == null) continue;
                if (isComposerResult(m)) readers.add(m);
                if (isChatCameraFactory(m)) factories.add(m);
                if (isGalleryHandler(m)) handlers.add(m);
                if (isGalleryItemsHandler(m, byType)) items.add(m);
            }
        }
        if (readers.size() != 1 || !hasLiteral(readers.get(0), 7376) || AccessFlags.STATIC.isSet(readers.get(0).getAccessFlags()) ||
            factories.size() != 1 || handlers.isEmpty() || items.size() != 1) return List.of();
        if (galleryItemsRegister(items.get(0), THREAD_KEY) > 15 || galleryItemsRegister(items.get(0), ACTIVITY_RESULT_EVENT) > 15) return List.of();
        var kinds = new HashSet<String>();
        for (var handler : handlers) if (!kinds.add(galleryHandlerKind(handler))) return List.of();
        var factory = factories.get(0);
        String launcher = chatCameraLauncherType(factory);
        var launcherClass = launcher == null ? null : byType.get(launcher);
        if (launcherClass == null || !implementsThrough(launcherClass, factory.getReturnType(), byType)) return List.of();
        Method start = null;
        for (var m : launcherClass.getMethods()) if (m.getImplementation() != null && isLauncherStart(m)) {
            if (start != null) return List.of();
            start = m;
        }
        if (start == null) return List.of();
        // The hook has no host to hand the start, so it passes null, which only works while the start never reads it.
        for (var i : instructions(start)) if (mayRead(i, start.getImplementation().getRegisterCount() - 1)) return List.of();
        var target = galleryTarget(classes, launcherClass, start, byType);
        if (target == null) return List.of();
        for (var handler : handlers) {
            var provider = galleryProvider(handler, factory.getReturnType(), start, byType);
            var providerClass = provider == null ? null : byType.get(provider.getType());
            if (providerClass == null || !AccessFlags.INTERFACE.isSet(providerClass.getAccessFlags())) return List.of();
            String home = packageOf(handler.getDefiningClass());
            for (var cls : List.of(providerClass, launcherClass, target))
                if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags()) && !packageOf(cls.getType()).equals(home)) return List.of();
            if (AccessFlags.PRIVATE.isSet(start.getAccessFlags()) ||
                (!AccessFlags.PUBLIC.isSet(start.getAccessFlags()) && !packageOf(launcher).equals(home))) return List.of();
            int words = 1;
            for (var type : handler.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
            if (handler.getImplementation().getRegisterCount() - words < 3) return List.of();
        }
        var hooks = new ArrayList<Method>(handlers);
        hooks.add(start);
        hooks.add(readers.get(0));
        hooks.add(items.get(0));
        return hooks;
    }

    static final String FONT_LAYOUT_ANCHOR = "Hit OEM font NPE in Paint.setTypeface, keeping previous typeface";
    static final String FONT_REPOSITORY_ANCHOR = "The requested font, %s, does not have a backing source. " +
        "You need to provide either a systemFontName, assetFontName, or a fileDescriptor.";
    static final String FONT_ROBOTO_ANCHOR = "Unable to create roboto typeface: %s";
    static final String TYPEFACE = "Landroid/graphics/Typeface;";
    static final String FONT_COLORS = "Landroid/content/res/ColorStateList;";

    static List<String> fontParameters(Method m) {
        return m.getParameterTypes().stream().map(Object::toString).toList();
    }

    static Set<String> fontCalls(Method m) {
        var calls = new HashSet<String>();
        for (var i : instructions(m)) if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference) calls.add(ref(i));
        return calls;
    }

    /**
     * custom_font: Litho's text layout setTypeface, Messenger's typeface repository and its Roboto builder, each the one
     * holder of its string, the by-name lookup that asks that repository, and every Litho text input that hands its
     * EditText a typeface. Mirrors CustomFont.kt.
     */
    static Map<String, List<Method>> customFontHooks(List<ClassDef> classes) {
        var holders = new LinkedHashMap<String, Set<Method>>();
        for (var anchor : List.of(FONT_LAYOUT_ANCHOR, FONT_REPOSITORY_ANCHOR, FONT_ROBOTO_ANCHOR)) holders.put(anchor, new LinkedHashSet<>());
        var byName = new ArrayList<Method>();
        var inputs = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference sr && holders.containsKey(sr.getString()))
                    holders.get(sr.getString()).add(m);
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags())) continue;
            var params = fontParameters(m);
            if (TYPEFACE.equals(m.getReturnType()) && params.equals(List.of("Landroid/content/Context;", "Ljava/lang/String;", "I"))) {
                var calls = fontCalls(m);
                if (calls.contains(TYPEFACE + "->create(Ljava/lang/String;I)" + TYPEFACE) && calls.contains(TYPEFACE + "->create(" + TYPEFACE + "I)" + TYPEFACE))
                    byName.add(m);
            }
            if ("V".equals(m.getReturnType()) && params.size() >= 3 && params.subList(0, 3).equals(List.of(FONT_COLORS, FONT_COLORS, TYPEFACE)) &&
                params.contains("Landroid/widget/EditText;") && fontCalls(m).contains("Landroid/widget/TextView;->setTypeface(" + TYPEFACE + "I)V"))
                inputs.add(m);
        }
        var layout = holders.get(FONT_LAYOUT_ANCHOR).size() == 1 ? holders.get(FONT_LAYOUT_ANCHOR).iterator().next() : null;
        if (layout != null && (AccessFlags.STATIC.isSet(layout.getAccessFlags()) || !"V".equals(layout.getReturnType()) ||
            !fontParameters(layout).equals(List.of(TYPEFACE)))) layout = null;
        var repository = holders.get(FONT_REPOSITORY_ANCHOR).size() == 1 ? holders.get(FONT_REPOSITORY_ANCHOR).iterator().next() : null;
        if (repository != null) {
            var params = fontParameters(repository);
            if (!AccessFlags.STATIC.isSet(repository.getAccessFlags()) || !TYPEFACE.equals(repository.getReturnType()) || params.size() != 4 ||
                !params.get(0).startsWith("L") || !params.get(1).equals(repository.getDefiningClass()) || !"I".equals(params.get(3)) ||
                !fontCalls(repository).contains("Ljava/lang/Enum;->name()Ljava/lang/String;")) repository = null;
        }
        var roboto = holders.get(FONT_ROBOTO_ANCHOR).size() == 1 ? holders.get(FONT_ROBOTO_ANCHOR).iterator().next() : null;
        if (roboto != null && (!AccessFlags.STATIC.isSet(roboto.getAccessFlags()) || !TYPEFACE.equals(roboto.getReturnType()) ||
            !fontParameters(roboto).equals(List.of("Landroid/content/Context;", "Ljava/lang/Integer;")))) roboto = null;
        var asked = new ArrayList<Method>();
        if (repository != null) for (var m : byName) {
            boolean asks = false;
            for (var i : instructions(m))
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr &&
                    mr.getDefiningClass().equals(repository.getDefiningClass()) && TYPEFACE.equals(mr.getReturnType()) &&
                    List.of(fontParameters(repository).get(0)).equals(mr.getParameterTypes().stream().map(Object::toString).toList())) asks = true;
            if (asks) asked.add(m);
        }
        var found = new LinkedHashMap<String, List<Method>>();
        found.put("font_layout", layout == null ? List.of() : List.of(layout));
        found.put("font_repository", repository == null ? List.of() : List.of(repository));
        found.put("font_roboto", roboto == null ? List.of() : List.of(roboto));
        found.put("font_by_name", asked);
        found.put("font_input", inputs);
        return found;
    }

    // Google Play's bound task route into GooglePlayUploadService, which skips onStartCommand. Mirrors AnalyticsUploads.kt.
    static final String GOOGLE_PLAY_UPLOAD_SERVICE = "Lcom/facebook/analytics2/logger/GooglePlayUploadService;";
    static final String TASK_SERVICE_COMPAT = "Lcom/facebook/common/jobscheduler/compat/GcmTaskServiceCompat;";
    static final String BOUND_UPLOAD_MARK = "Job with no build ID, cancelling job";
    // 584 moved the first message into a string table, so the stale build ID message marks it too
    static final String OLD_BUILD_UPLOAD_MARK = "Job with old build ID: %d, cancelling job, expected: %d";

    static boolean holdsBoundUploadMark(Method m) {
        if (m.getImplementation() == null) return false;
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s &&
                (BOUND_UPLOAD_MARK.equals(s.getString()) || OLD_BUILD_UPLOAD_MARK.equals(s.getString()))) return true;
        return false;
    }

    static boolean typeChecked(Method m, Opcode opcode, String type) {
        for (var i : m.getImplementation().getInstructions())
            if (i.getOpcode() == opcode && type.equals(((ReferenceInstruction) i).getReference().toString())) return true;
        return false;
    }

    /** The Runnable's run() with the uploader's task inlined: reads its service field first and reports through one (I)V. */
    static boolean isInlinedUploadTask(Method m, String base) {
        if (!"run()V".equals(entryPoint(m)) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !holdsBoundUploadMark(m) ||
            !typeChecked(m, Opcode.INSTANCE_OF, TASK_SERVICE_COMPAT) || !typeChecked(m, Opcode.CHECK_CAST, GOOGLE_PLAY_UPLOAD_SERVICE)) return false;
        var code = m.getImplementation();
        var first = code.getInstructions().iterator().next();
        if (first.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) first).getRegisterB() != code.getRegisterCount() - 1 ||
            !(((ReferenceInstruction) first).getReference() instanceof FieldReference field) ||
            !m.getDefiningClass().equals(field.getDefiningClass()) || !base.equals(field.getType())) return false;
        var reporters = new TreeSet<String>();
        for (var i : code.getInstructions())
            if (i.getOpcode() == Opcode.INVOKE_DIRECT && ((ReferenceInstruction) i).getReference() instanceof MethodReference r &&
                m.getDefiningClass().equals(r.getDefiningClass()) && "V".equals(r.getReturnType()) &&
                r.getParameterTypes().size() == 1 && "I".contentEquals(r.getParameterTypes().get(0))) reporters.add(r.toString());
        return reporters.size() == 1;
    }

    static List<Method> boundUploadTasks(List<ClassDef> classes) {
        ClassDef play = null;
        for (var cls : classes) if (GOOGLE_PLAY_UPLOAD_SERVICE.equals(cls.getType())) play = cls;
        if (play == null || play.getSuperclass() == null) return List.of();
        var base = play.getSuperclass();
        ClassDef baseClass = null;
        for (var cls : classes) if (base.equals(cls.getType())) baseClass = cls;
        if (baseClass == null || !"Landroid/app/Service;".equals(baseClass.getSuperclass())) return List.of();
        // Every 583 build inlines the upload into the Runnable; the uploader keeps no task override of its own.
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            if (!cls.getInterfaces().contains("Ljava/lang/Runnable;")) continue;
            boolean holdsService = false;
            for (var f : cls.getFields()) if (base.equals(f.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) holdsService = true;
            if (holdsService) for (var m : cls.getMethods()) if (isInlinedUploadTask(m, base)) found.add(m);
        }
        return found;
    }

    static final String XANALYTICS_FLUSH = "Lcom/facebook/xanalytics/XAnalyticsHolder;->flush()V";
    static final String XANALYTICS_UPLOAD = "Lcom/facebook/xanalytics/XAnalyticsNative;->kickOffUpload()V";

    /** The XAnalytics timer: a Runnable's run() that flushes, then uploads, once each, and otherwise only calls ()Object getters. */
    static boolean isXAnalyticsUploadTimer(Method m) {
        if (!"run()V".equals(entryPoint(m)) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null) return false;
        int flushes = 0, uploads = 0, returns = 0;
        boolean uploadAfterFlush = false;
        Instruction last = null;
        for (var i : m.getImplementation().getInstructions()) {
            last = i;
            if (i.getOpcode() == Opcode.RETURN_VOID) returns++;
            if (!i.getOpcode().name.startsWith("invoke")) continue;
            if (!(((ReferenceInstruction) i).getReference() instanceof MethodReference r)) return false;
            var name = r.getDefiningClass() + "->" + r.getName() + "(" + String.join("", r.getParameterTypes()) + ")" + r.getReturnType();
            if (XANALYTICS_FLUSH.equals(name)) flushes++;
            else if (XANALYTICS_UPLOAD.equals(name)) { uploads++; uploadAfterFlush = flushes == 1; }
            else if (!"get".equals(r.getName()) || !r.getParameterTypes().isEmpty() || !"Ljava/lang/Object;".equals(r.getReturnType())) return false;
        }
        return flushes == 1 && uploads == 1 && uploadAfterFlush && returns == 1 && last.getOpcode() == Opcode.RETURN_VOID;
    }

    static List<Method> xanalyticsUploadTimers(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes)
            if (cls.getInterfaces().contains("Ljava/lang/Runnable;"))
                for (var m : cls.getMethods()) if (isXAnalyticsUploadTimer(m)) found.add(m);
        return found.size() == 1 ? found : List.of();
    }

    static final List<String> UPLOAD_ACTIONS = List.of("com.facebook.analytics2.logger.UPLOAD_NOW",
        "com.facebook.analytics2.logger.USER_LOGOUT", "Unknown action=");

    static String methodId(MethodReference r) {
        return r.getDefiningClass() + "->" + r.getName() + "(" + String.join("", r.getParameterTypes()) + ")" + r.getReturnType();
    }

    /** The uploader's (params, callback, action)V dispatcher, which names both upload actions and the unknown one. */
    static boolean isUploadActionDispatcher(Method m) {
        if (!"V".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null ||
            m.getParameterTypes().size() != 3 || !"Ljava/lang/String;".contentEquals(m.getParameterTypes().get(2))) return false;
        var strings = new HashSet<String>();
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) strings.add(s.getString());
        return strings.containsAll(UPLOAD_ACTIONS);
    }

    /** (params, action)V that only calls the dispatcher with this, its params, a null callback and its action. */
    static boolean startsUploadInProcess(Method m, Method dispatcher) {
        if (!"V".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null ||
            m.getParameterTypes().size() != 2 || !"Ljava/lang/String;".contentEquals(m.getParameterTypes().get(1))) return false;
        var code = new ArrayList<Instruction>();
        m.getImplementation().getInstructions().forEach(code::add);
        if (code.size() != 3 || code.get(0).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() != 0 ||
            code.get(1).getOpcode() != Opcode.INVOKE_DIRECT || code.get(2).getOpcode() != Opcode.RETURN_VOID) return false;
        if (!(((ReferenceInstruction) code.get(1)).getReference() instanceof MethodReference target) ||
            !methodId(target).equals(methodId(dispatcher)) ||
            !m.getParameterTypes().get(0).toString().equals(target.getParameterTypes().get(0).toString())) return false;
        var call = (FiveRegisterInstruction) code.get(1);
        int self = m.getImplementation().getRegisterCount() - 3;
        int callback = ((OneRegisterInstruction) code.get(0)).getRegisterA();
        return callback < self && call.getRegisterCount() == 4 && call.getRegisterC() == self && call.getRegisterD() == self + 1 &&
            call.getRegisterE() == callback && call.getRegisterF() == self + 2;
    }

    /** The in-process upload start beside the one dispatcher, when there's exactly one. Mirrors AnalyticsUploads.kt. */
    static List<Method> inProcessUploadStarts(List<ClassDef> classes) {
        var dispatchers = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (isUploadActionDispatcher(m)) dispatchers.add(m);
        if (dispatchers.size() != 1) return List.of();
        var dispatcher = dispatchers.get(0);
        var starts = new ArrayList<Method>();
        for (var cls : classes)
            if (cls.getType().equals(dispatcher.getDefiningClass()))
                for (var m : cls.getMethods()) if (startsUploadInProcess(m, dispatcher)) starts.add(m);
        return starts.size() == 1 ? starts : List.of();
    }

    static List<Method> analyticsUploads(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        ClassDef uploader = null;
        for (var cls : classes) {
            var entries = ANALYTICS_UPLOAD_ENTRIES.get(cls.getType());
            if (entries != null) for (var m : cls.getMethods())
                if (entries.contains(entryPoint(m)) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) found.add(m);
            if (ANALYTICS2_UPLOAD_SERVICE.equals(cls.getType())) uploader = cls;
        }
        if (uploader == null || uploader.getSuperclass() == null) return found;
        var jobs = Set.of(START_COMMAND, START_JOB);
        for (var m : uploader.getMethods()) if (jobs.contains(entryPoint(m))) return found;
        var base = uploader.getSuperclass();
        ClassDef baseClass = null;
        int subclasses = 0;
        for (var cls : classes) {
            if (base.equals(cls.getType())) baseClass = cls;
            if (base.equals(cls.getSuperclass())) subclasses++;
        }
        if (baseClass == null || !AccessFlags.ABSTRACT.isSet(baseClass.getAccessFlags()) ||
            !"Landroid/app/job/JobService;".equals(baseClass.getSuperclass()) || subclasses != 1) return found;
        for (var m : baseClass.getMethods())
            if (jobs.contains(entryPoint(m)) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) found.add(m);
        return found;
    }

    /**
     * emoji_search: the composer's text watcher, (Editable, boolean)V, which names both "afterTextChanged" and the plain
     * "expression" tray mode. Counted only when exactly one method looks like it. Mirrors EmojiSearch.kt.
     */
    static List<Method> emojiSearchWatchers(List<ClassDef> classes) {
        var watchers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of("Landroid/text/Editable;", "Z"))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("afterTextChanged") && strings.contains("expression")) watchers.add(method);
        }
        return watchers.size() == 1 ? watchers : List.of();
    }

    static final String TAB_CONTENT_SPEC = "messaging.navigation.home.tabs.tabcontent.TabContentInterfaceSpec";
    static final String FACEBOOK_BUTTON =
        "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;";

    /**
     * tab_badges: the bottom bar's badge dispatcher, an instance (String) method naming the tab content spec and
     * "getBadgeController", whose no-badge tabs all read one static field of its return type. Every match must hold that
     * field and keep its tab id within v15, or none counts. Mirrors TabBadges.kt.
     */
    static List<Method> tabBadgeDispatchers(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !method.getReturnType().startsWith("L") || method.getParameterTypes().size() != 1 ||
                !"Ljava/lang/String;".equals(method.getParameterTypes().get(0).toString())) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains(TAB_CONTENT_SPEC) && strings.contains("getBadgeController")) found.add(method);
        }
        for (var method : found) {
            var none = new HashSet<String>();
            for (var i : instructions(method))
                if (i.getOpcode() == Opcode.SGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                    method.getReturnType().equals(f.getType())) none.add(f.toString());
            // The tab id is p1, the method's last register.
            if (none.size() != 1 || method.getImplementation().getRegisterCount() - 1 > 15) return List.of();
        }
        return found;
    }

    /**
     * facebook_badge: the Facebook button's build, whose one (FbUserSession)Z check drops the cast badge controller to
     * null right before the button is made with it, and whose check result no other path jumps past. Mirrors TabBadges.kt.
     */
    static List<Method> facebookBadgeChecks(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            if (!FACEBOOK_BUTTON.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) if (facebookBadgeCheck(method) >= 0) found.add(method);
        }
        for (var method : found) {
            int result = facebookBadgeCheck(method);
            if (register(instructions(method).get(result)) > 15 || mediaTargets(method).contains(result + 1)) return List.of();
        }
        return found;
    }

    static final String HEADER_ROW = "ThreadHeaderMessageActionRowComponent";

    record HeaderActions(int read, List<FieldReference> checked) {}

    /**
     * facebook_profile_header: the empty chat header row's render, which names its component, reads its own action list
     * once and then asks that list for each action it may draw. Null when the shape moved. Mirrors ProfileHeader.kt.
     */
    static HeaderActions headerActions(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getParameterTypes().size() != 1) return null;
        var code = instructions(method);
        boolean named = false;
        int read = -1, reads = 0;
        for (int at = 0; at < code.size(); at++) {
            var i = code.get(at);
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && HEADER_ROW.equals(sr.getString())) named = true;
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                f.getDefiningClass().equals(method.getDefiningClass()) && "Ljava/util/List;".equals(f.getType())) { read = at; reads++; }
        }
        if (!named || reads != 1) return null;
        int list = ((TwoRegisterInstruction) code.get(read)).getRegisterA();
        var checked = new ArrayList<FieldReference>();
        for (int at = read + 2; at < code.size(); at++) {
            var action = code.get(at - 1);
            if (writesRegister(action, list)) break;
            if (!(code.get(at) instanceof FiveRegisterInstruction call) || !(action instanceof ReferenceInstruction ai) ||
                !(ai.getReference() instanceof FieldReference constant)) continue;
            if (call.getOpcode() != Opcode.INVOKE_INTERFACE || !"Ljava/util/List;->contains(Ljava/lang/Object;)Z".equals(ref(call)) ||
                call.getRegisterCount() != 2 || call.getRegisterC() != list || action.getOpcode() != Opcode.SGET_OBJECT ||
                register(action) != call.getRegisterD() || !constant.getType().equals(constant.getDefiningClass())) continue;
            checked.add(constant);
        }
        return checked.isEmpty() ? null : new HeaderActions(read, checked);
    }

    /** The name an enum's initializer gives constant: the one string loaded since the previous constant was stored. */
    static String headerEnumName(ClassDef cls, FieldReference constant) {
        if (!"Ljava/lang/Enum;".equals(cls.getSuperclass())) return null;
        var inits = new ArrayList<Method>();
        for (var method : cls.getMethods()) if ("<clinit>".equals(method.getName())) inits.add(method);
        if (inits.size() != 1 || inits.get(0).getImplementation() == null) return null;
        var code = instructions(inits.get(0));
        int store = -1, matches = 0, previous = -1;
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.SPUT_OBJECT) continue;
            if (constant.toString().equals(ref(code.get(at)))) { store = at; matches++; }
            else if (matches == 0) previous = at;
        }
        if (matches != 1) return null;
        var names = new ArrayList<String>();
        for (int at = previous + 1; at < store; at++)
            if (code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) names.add(sr.getString());
        return names.size() == 1 ? names.get(0) : null;
    }

    /**
     * The one header row render that asks its list for VIEW_PROFILE, or none when more than one does or a jump lands
     * right past its list read.
     */
    static List<Method> profileHeaders(List<ClassDef> classes) {
        var renders = new ArrayList<Map.Entry<Method, HeaderActions>>();
        var wanted = new HashSet<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var actions = headerActions(method);
            if (actions == null) continue;
            renders.add(Map.entry(method, actions));
            for (var constant : actions.checked()) wanted.add(constant.getDefiningClass());
        }
        var enums = new HashMap<String, ClassDef>();
        for (var cls : classes) if (wanted.contains(cls.getType())) enums.put(cls.getType(), cls);
        var found = new ArrayList<Map.Entry<Method, HeaderActions>>();
        for (var render : renders) for (var constant : render.getValue().checked()) {
            var enumClass = enums.get(constant.getDefiningClass());
            if (enumClass != null && "VIEW_PROFILE".equals(headerEnumName(enumClass, constant))) { found.add(render); break; }
        }
        if (found.size() != 1 || mediaTargets(found.get(0).getKey()).contains(found.get(0).getValue().read() + 1)) return List.of();
        return List.of(found.get(0).getKey());
    }

    static final String TAB_CONFIG_TRACE = "MessengerTabConfigurationCreator.createTabConfiguration";
    static final Set<String> HIDABLE_TABS = Set.of("PEOPLE", "JEWEL", "AI", "MUSE");

    /**
     * tab_config: the bottom bar's tab-list builder, an instance (Context, FbUserSession) method naming its trace. Every
     * match must have one configuration site with nothing jumping to it, or none counts. Mirrors TabConfig.kt.
     */
    static List<Method> tabConfigurations(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !method.getReturnType().startsWith("L") || method.getParameterTypes().size() != 2 ||
                !"Landroid/content/Context;".equals(method.getParameterTypes().get(0).toString()) ||
                !BUBBLE_SESSION.equals(method.getParameterTypes().get(1).toString())) continue;
            boolean traced = false;
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && TAB_CONFIG_TRACE.equals(sr.getString())) traced = true;
            if (traced) found.add(method);
        }
        for (var method : found) {
            int site = tabConfigSite(method);
            if (site < 0) return List.of();
            var targets = mediaTargets(method);
            if (targets.contains(site) || targets.contains(site + 1)) return List.of();
        }
        return found;
    }

    /**
     * Index of the new-instance right before the builder's one (List, List) configuration constructor, or -1. The builder
     * must read PEOPLE, JEWEL, AI and MUSE as constants of one enum.
     */
    static int tabConfigSite(Method method) {
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            var op = code.get(i).getOpcode();
            if ((op == Opcode.INVOKE_DIRECT || op == Opcode.INVOKE_DIRECT_RANGE) &&
                ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m &&
                "<init>".equals(m.getName()) && method.getReturnType().equals(m.getDefiningClass())) {
                if (at >= 0) return -1;
                at = i;
            }
        }
        if (at < 1 || !(code.get(at) instanceof FiveRegisterInstruction build) || build.getRegisterCount() != 3) return -1;
        var params = new ArrayList<String>();
        for (var t : ((MethodReference) ((ReferenceInstruction) build).getReference()).getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("Ljava/util/List;", "Ljava/util/List;"))) return -1;
        var start = code.get(at - 1);
        if (start.getOpcode() != Opcode.NEW_INSTANCE || register(start) != build.getRegisterC() ||
            !method.getReturnType().equals(((TypeReference) ((ReferenceInstruction) start).getReference()).getType())) return -1;
        var names = new HashSet<String>();
        var types = new HashSet<String>();
        for (var i : code)
            if (i.getOpcode() == Opcode.SGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                HIDABLE_TABS.contains(f.getName()) && f.getType().equals(f.getDefiningClass())) {
                names.add(f.getName());
                types.add(f.getType());
            }
        return names.equals(HIDABLE_TABS) && types.size() == 1 ? at - 1 : -1;
    }

    /** Index of the check's MOVE_RESULT, or -1. */
    static int facebookBadgeCheck(Method method) {
        if (!FACEBOOK_BUTTON.equals(method.getDefiningClass()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !method.getParameterTypes().isEmpty() || !method.getReturnType().startsWith("L")) return -1;
        var code = instructions(method);
        int at = -1, sites = 0;
        for (int i = 0; i + 3 < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL ||
                !(((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference callee) ||
                !"Z".equals(callee.getReturnType()) || callee.getParameterTypes().size() != 1 ||
                !"Lcom/facebook/auth/usersession/FbUserSession;".equals(callee.getParameterTypes().get(0).toString())) continue;
            if (code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT || code.get(i + 2).getOpcode() != Opcode.IF_NEZ ||
                register(code.get(i + 2)) != register(code.get(i + 1)) || !jumpsTo(code, i + 2, i + 4) ||
                code.get(i + 3).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) code.get(i + 3)).getNarrowLiteral() != 0) continue;
            at = i;
            sites++;
        }
        if (sites != 1) return -1;
        int controller = register(code.get(at + 3));
        Instruction cast = null;
        for (int i = 0; i < at; i++)
            if (code.get(i).getOpcode() == Opcode.CHECK_CAST && register(code.get(i)) == controller) cast = code.get(i);
        if (cast == null) return -1;
        var type = ((TypeReference) ((ReferenceInstruction) cast).getReference()).getType();
        Instruction build = null;
        for (int i = at + 4; i < code.size() && build == null; i++)
            if ((code.get(i).getOpcode() == Opcode.INVOKE_DIRECT || code.get(i).getOpcode() == Opcode.INVOKE_DIRECT_RANGE) &&
                ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference init && "<init>".equals(init.getName()) &&
                method.getReturnType().equals(init.getDefiningClass())) build = code.get(i);
        if (build == null) return -1;
        // The dropped register is the controller argument of the button the method returns, and nothing else.
        var arguments = bubbleArgs(build);
        int word = 1, uses = 0;
        String usedAs = null;
        for (var parameter : ((MethodReference) ((ReferenceInstruction) build).getReference()).getParameterTypes()) {
            var name = parameter.toString();
            if (word < arguments.size() && arguments.get(word) == controller) {
                uses++;
                usedAs = name;
            }
            word += "J".equals(name) || "D".equals(name) ? 2 : 1;
        }
        return uses == 1 && type.equals(usedAs) ? at + 1 : -1;
    }

    static final Set<String> AI_MENTION_PLUGINS = Set.of(
        "messaging.aibot.core.mentionai.MentionAiRowSupplier", "messaging.aibot.core.imagine.ImagineRowSupplier",
        "messaging.communitymessaging.ai.mentionrowsupplier.CommunityAiRowSupplier");

    /**
     * ai_mentions: the @ suggestion row dispatchers, non-static (query, ImmutableList.Builder)V methods traced as
     * MentionRowSupplierSpec that run a Meta AI, imagine or community AI section. Mirrors AiMentions.kt.
     */
    static List<Method> aiMentionDispatchers(List<ClassDef> classes) {
        var dispatchers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getParameterTypes().size() != 2 ||
                !"Lcom/google/common/collect/ImmutableList$Builder;".equals(method.getParameterTypes().get(1).toString())) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("messaging.mentions.composer.MentionRowSupplierSpec") &&
                strings.stream().anyMatch(AI_MENTION_PLUGINS::contains)) dispatchers.add(method);
        }
        return dispatchers;
    }

    /**
     * ai_commands: the static (controller, ThreadKey)List that turns the open chat's AiPageCustomCommands into
     * suggestions. Counted only when exactly one method looks like it. Mirrors AiMentions.kt.
     */
    static List<Method> aiCommandLists(List<ClassDef> classes) {
        var lists = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"Ljava/util/List;".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of(cls.getType(), "Lcom/facebook/messaging/model/threadkey/ThreadKey;"))) continue;
            for (var i : method.getImplementation().getInstructions())
                if (i.getOpcode() == Opcode.CHECK_CAST && ((ReferenceInstruction) i).getReference() instanceof TypeReference tr &&
                    "Lcom/facebook/messaging/aibot/page/customcommand/AiPageCustomCommand;".equals(tr.getType())) {
                    lists.add(method);
                    break;
                }
        }
        return lists.size() == 1 ? lists : List.of();
    }

    /**
     * ai_search_hint: the inbox search bar builder, which names "search_bar" and picks its hint between two constants on a
     * (FbUserSession)Z check right before Resources.getString. Counted only when exactly one method looks like it.
     * Mirrors AiSearchHint.kt.
     */
    static List<Method> searchBarBuilders(List<ClassDef> classes) {
        var builders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var code = instructions(method);
            if (code.stream().noneMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "search_bar".equals(sr.getString()))) continue;
            if (searchBarPick(code) >= 0) builders.add(method);
        }
        return builders.size() == 1 ? builders : List.of();
    }

    /** Index of the bar's getString call, with the check 7 lines up, the plain id 3 up and the Meta AI id 1 up, or -1. */
    static int searchBarPick(List<Instruction> code) {
        for (int pick = 7; pick < code.size(); pick++) {
            if (code.get(pick).getOpcode() != Opcode.INVOKE_VIRTUAL ||
                !"Landroid/content/res/Resources;->getString(I)Ljava/lang/String;".equals(ref(code.get(pick)))) continue;
            var get = (FiveRegisterInstruction) code.get(pick);
            if (!(code.get(pick - 7) instanceof ReferenceInstruction ci && ci.getReference() instanceof MethodReference check) ||
                (code.get(pick - 7).getOpcode() != Opcode.INVOKE_VIRTUAL && code.get(pick - 7).getOpcode() != Opcode.INVOKE_INTERFACE) || !"Z".equals(check.getReturnType()) ||
                check.getParameterTypes().size() != 1 ||
                !"Lcom/facebook/auth/usersession/FbUserSession;".equals(check.getParameterTypes().get(0).toString())) continue;
            int held = register(code.get(pick - 6));
            if (code.get(pick - 6).getOpcode() != Opcode.MOVE_RESULT ||
                !(code.get(pick - 5) instanceof ReferenceInstruction rr && rr.getReference() instanceof MethodReference resources) ||
                !"Landroid/content/res/Resources;".equals(resources.getReturnType()) ||
                code.get(pick - 4).getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(code.get(pick - 4)) != get.getRegisterC() ||
                code.get(pick - 3).getOpcode() != Opcode.CONST || register(code.get(pick - 3)) != get.getRegisterD() ||
                code.get(pick - 1).getOpcode() != Opcode.CONST || register(code.get(pick - 1)) != get.getRegisterD() ||
                code.get(pick - 2).getOpcode() != Opcode.IF_EQZ || register(code.get(pick - 2)) != held ||
                !jumpsTo(code, pick - 2, pick)) continue;
            return pick;
        }
        return -1;
    }

    /**
     * ai_search_screen_hint: the search screen's header, which reads the inbox bar's own Meta AI check and, within a few
     * lines that leave the answer alone, picks between the bar's two hint ids with if-nez right before reading the string.
     * Counted only when the bar is unambiguous and exactly one method matches. Mirrors AiSearchHint.kt.
     */
    static List<Method> searchScreenHints(List<ClassDef> classes, List<Method> bars) {
        if (bars.size() != 1) return List.of();
        var bar = instructions(bars.get(0));
        int pick = searchBarPick(bar);
        if (pick < 0) return List.of();
        String check = ref(bar.get(pick - 7));
        int plain = ((NarrowLiteralInstruction) bar.get(pick - 3)).getNarrowLiteral();
        int metaAi = ((NarrowLiteralInstruction) bar.get(pick - 1)).getNarrowLiteral();
        var screens = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (searchScreenHintSite(instructions(method), check, plain, metaAi)) screens.add(method);
        return screens.size() == 1 ? screens : List.of();
    }

    static boolean searchScreenHintSite(List<Instruction> code, String check, int plain, int metaAi) {
        for (int result = 1; result < code.size(); result++) {
            var call = code.get(result - 1);
            if (code.get(result).getOpcode() != Opcode.MOVE_RESULT ||
                (call.getOpcode() != Opcode.INVOKE_VIRTUAL && call.getOpcode() != Opcode.INVOKE_INTERFACE) || !check.equals(ref(call))) continue;
            int held = register(code.get(result));
            for (int ai = result + 1; ai <= Math.min(result + 7, code.size() - 4); ai++) {
                if (ai > result + 1 && writesRegister(code.get(ai - 1), held)) break;
                var hint = code.get(ai);
                var branch = code.get(ai + 1);
                var other = code.get(ai + 2);
                if (hint.getOpcode() != Opcode.CONST || branch.getOpcode() != Opcode.IF_NEZ || other.getOpcode() != Opcode.CONST ||
                    register(hint) == held || register(other) != register(hint) || register(branch) != held || !jumpsTo(code, ai + 1, ai + 3) ||
                    ((NarrowLiteralInstruction) hint).getNarrowLiteral() != metaAi || ((NarrowLiteralInstruction) other).getNarrowLiteral() != plain ||
                    !readsHint(code.get(ai + 3), register(hint))) continue;
                return true;
            }
        }
        return false;
    }

    /** Resources.getString(id), or a static (Resources, I)String helper, with the id in [hint]. */
    static boolean readsHint(Instruction i, int hint) {
        if (!(i instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 2 || call.getRegisterD() != hint ||
            !(i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target)) return false;
        return (i.getOpcode() == Opcode.INVOKE_VIRTUAL && "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;".equals(target.toString())) ||
            (i.getOpcode() == Opcode.INVOKE_STATIC && "Ljava/lang/String;".equals(target.getReturnType()) &&
                refParams(target).equals(List.of("Landroid/content/res/Resources;", "I")));
    }

    /** 584's numbering of the @ list row flags. Meta renumbers them with each release. Mirrors AiMentionRows.kt. */
    record AiRowFlags(Set<Long> row, Set<Long> chat, long shared, long encrypted, long imagine, long imagineYourself) {}
    static final AiRowFlags AI_ROW_FLAGS =
        new AiRowFlags(Set.of(0x810620011b2d61L, 0x81062001042d5aL), Set.of(0x810620011b2d61L, 0x81062000042d17L),
            0x810620011b2d61L, 0x81062000052d18L, 0x81062000402d28L, 0x81062000f92d56L);
    static final String CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;";
    static final String FB_SESSION_TYPE = "Lcom/facebook/auth/usersession/FbUserSession;";

    /**
     * ai_mention_rows: the instance checks behind the Meta AI, imagine and imagine yourself rows of the newer @ list, told
     * apart by parameters and the server flag each reads: ()Z reading both row flags (community channels),
     * (FbUserSession, Capabilities)Z reading both chat flags (regular chats), (FbUserSession)Z reading the shared flag and
     * the encrypted flag (encrypted chats), (FbUserSession, ThreadKey, Capabilities, Z, Z)Z reading the imagine flag and
     * (FbUserSession, ThreadKey, Capabilities)Z reading the imagine yourself flag. Counted only when there is exactly one
     * of each, all five share a class and all read 584's flags. Mirrors AiMentionRows.kt.
     */
    static List<Method> aiMentionRowChecks(List<ClassDef> classes) {
        return aiMentionRowChecks(classes, AI_ROW_FLAGS);
    }

    static List<Method> aiMentionRowChecks(List<ClassDef> classes, AiRowFlags build) {
        var rows = new TreeMap<String, List<Method>>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Z".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var p : method.getParameterTypes()) params.add(p.toString());
            var flags = new HashSet<Long>();
            for (var i : method.getImplementation().getInstructions())
                if (i.getOpcode() == Opcode.CONST_WIDE && i instanceof WideLiteralInstruction flag) flags.add(flag.getWideLiteral());
            String row = null;
            if (params.isEmpty() && flags.containsAll(build.row())) row = "meta_ai";
            else if (params.equals(List.of(FB_SESSION_TYPE, CAPABILITIES)) && flags.containsAll(build.chat())) row = "meta_ai_chats";
            else if (params.equals(List.of(FB_SESSION_TYPE)) && flags.containsAll(Set.of(build.shared(), build.encrypted()))) row = "meta_ai_encrypted";
            else if (params.equals(List.of(FB_SESSION_TYPE, THREAD_KEY, CAPABILITIES, "Z", "Z")) && flags.contains(build.imagine())) row = "imagine";
            else if (params.equals(List.of(FB_SESSION_TYPE, THREAD_KEY, CAPABILITIES)) && flags.contains(build.imagineYourself())) row = "imagine_yourself";
            if (row != null) rows.computeIfAbsent(row, k -> new ArrayList<>()).add(method);
        }
        if (rows.size() != 5 || rows.values().stream().anyMatch(m -> m.size() != 1)) return List.of();
        var checks = rows.values().stream().map(m -> m.get(0)).toList();
        return checks.stream().map(Method::getDefiningClass).distinct().count() == 1 ? checks : List.of();
    }

    /**
     * xhe_audio: the no-argument call() that names its copies "orca_share_media" and ends one copy with
     * new FileOutputStream(File, Z), a static (InputStream, OutputStream)V copy, OutputStream.close() and Uri.fromFile on
     * the same File. Counted only when exactly one method looks like it. Mirrors XheAudio.kt.
     */
    static List<Method> shareCopies(List<ClassDef> classes) {
        var copies = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            boolean call = "call".equals(method.getName()) && method.getParameterTypes().isEmpty() && !isStatic;
            // Some 584.1 arm64 builds move call()'s body into a static method that takes its own class.
            boolean outlined = isStatic && method.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(cls.getType()));
            if (!(call || outlined) || !"Ljava/lang/Object;".equals(method.getReturnType())) continue;
            var code = instructions(method);
            if (code.stream().noneMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "orca_share_media".equals(sr.getString()))) continue;
            int sites = 0;
            for (int at = 3; at < code.size(); at++) {
                if (!(code.get(at) instanceof FiveRegisterInstruction point) || code.get(at).getOpcode() != Opcode.INVOKE_STATIC ||
                    !"Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;".equals(ref(code.get(at)))) continue;
                if (!(code.get(at - 1) instanceof FiveRegisterInstruction close) || close.getOpcode() != Opcode.INVOKE_VIRTUAL ||
                    !"Ljava/io/OutputStream;->close()V".equals(ref(close))) continue;
                if (!(code.get(at - 2) instanceof FiveRegisterInstruction copy) || copy.getOpcode() != Opcode.INVOKE_STATIC ||
                    !(((ReferenceInstruction) copy).getReference() instanceof MethodReference copier) || !"V".equals(copier.getReturnType()) ||
                    !copier.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/io/InputStream;", "Ljava/io/OutputStream;"))) continue;
                if (!(code.get(at - 3) instanceof FiveRegisterInstruction open) || open.getOpcode() != Opcode.INVOKE_DIRECT ||
                    !"Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V".equals(ref(open))) continue;
                if (open.getRegisterD() == point.getRegisterC() && open.getRegisterC() == close.getRegisterC() && copy.getRegisterD() == close.getRegisterC()) sites++;
            }
            if (sites == 1) copies.add(method);
        }
        return copies.size() == 1 ? copies : List.of();
    }

    static final String OVERSCROLL_BEHAVIOR = "Lcom/facebook/messaging/threadview/overscroll/ui/OverScrollActionBehavior;";

    /**
     * disappearing_swipe: the chat overscroll behavior's own non-static onStartNestedScroll, which still logs
     * "dm_swipe_up_impression". The class keeps its name in every build. Mirrors DisappearingSwipe.kt.
     */
    static List<Method> disappearingSwipeStarts(List<ClassDef> classes) {
        var starts = new ArrayList<Method>();
        for (var cls : classes) {
            if (!OVERSCROLL_BEHAVIOR.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                    !"onStartNestedScroll".equals(method.getName()) || !"Z".equals(method.getReturnType())) continue;
                var params = new ArrayList<String>();
                for (var t : method.getParameterTypes()) params.add(t.toString());
                if (!params.equals(List.of("Landroidx/coordinatorlayout/widget/CoordinatorLayout;", "Landroid/view/View;",
                    "Landroid/view/View;", "Landroid/view/View;", "I", "I"))) continue;
                for (var i : method.getImplementation().getInstructions())
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        "dm_swipe_up_impression".equals(sr.getString())) {
                        starts.add(method);
                        break;
                    }
            }
        }
        return starts;
    }

    static final String QUICK_SEND_SHOW = "Lcom/facebook/xapp/messaging/composer/recentmedia/quicksend/event/QuickSendShowEvent;";
    static final String IMAGES_URI = "Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;";

    /**
     * recent_media: the static void detector that reads the newest photo from the media store and makes the recent photo
     * card's event with the event's own static factory. The quick send handler that takes the event and makes another is
     * left out. Mirrors RecentMedia.kt.
     */
    static List<Method> recentMediaDetectors(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"V".equals(method.getReturnType()) || QUICK_SEND_SHOW.equals(cls.getType())) continue;
            boolean takesEvent = false;
            for (var t : method.getParameterTypes()) takesEvent |= QUICK_SEND_SHOW.equals(t.toString());
            if (takesEvent) continue;
            boolean factory = false, images = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction ri)) continue;
                if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                    ri.getReference() instanceof MethodReference mr && QUICK_SEND_SHOW.equals(mr.getDefiningClass()) &&
                    QUICK_SEND_SHOW.equals(mr.getReturnType())) factory = true;
                if (ri.getReference() instanceof FieldReference fr && IMAGES_URI.equals(fr.toString())) images = true;
            }
            if (factory && images) found.add(method);
        }
        return found;
    }

    static final String SEND_MESSAGE_EVENT = "Lcom/facebook/xapp/messaging/composer/send/event/SendMessageEvent;";

    /**
     * hide_read_receipts: the open chat's seen handler, a static (FbUserSession, own class, String)V that names
     * MARK_THREAD_AS_SEEN_JOB and broadcast_message_seen_internal. reply_read: the common typed composer
     * dispatcher. Mirrors ReadReceipts.kt.
     */
    static List<Method> chatSeenBroadcasts(List<ClassDef> classes) {
        var seen = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"V".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of("Lcom/facebook/auth/usersession/FbUserSession;", cls.getType(), "Ljava/lang/String;"))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("MARK_THREAD_AS_SEEN_JOB") && strings.contains("broadcast_message_seen_internal") && seenThreadStore(cls))
                seen.add(method);
        }
        return seen;
    }

    static final String THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";

    /**
     * The seen hook reads the chat from the handler's own ThreadKey field, which ReadReceipts.kt's
     * resolveReadReceiptThreadFields takes as the class's one public final ThreadKey field, stored once by its
     * (FbUserSession, ThreadKey, ...) constructor straight from that parameter into this. Mirrored so a changed field or
     * constructor shows up here instead of at patch time.
     */
    static boolean seenThreadStore(ClassDef owner) {
        Field field = null;
        for (var f : owner.getFields()) {
            if (!THREAD_KEY.equals(f.getType()) || !AccessFlags.PUBLIC.isSet(f.getAccessFlags()) || !AccessFlags.FINAL.isSet(f.getAccessFlags())) continue;
            if (field != null) return false;
            field = f;
        }
        if (field == null) return false;
        Method ctor = null;
        for (var m : owner.getMethods()) {
            var p = m.getParameterTypes();
            if (!"<init>".equals(m.getName()) || m.getImplementation() == null || p.size() < 2 ||
                    !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(p.get(0)) || !THREAD_KEY.contentEquals(p.get(1))) continue;
            if (ctor != null) return false;
            ctor = m;
        }
        if (ctor == null) return false;
        int parameterRegisters = 1;
        for (var t : ctor.getParameterTypes()) parameterRegisters += t.charAt(0) == 'J' || t.charAt(0) == 'D' ? 2 : 1;
        int self = ctor.getImplementation().getRegisterCount() - parameterRegisters;
        int stores = 0;
        boolean direct = false;
        for (var i : ctor.getImplementation().getInstructions()) {
            // Like the patch, a constructor that reuses this or the ThreadKey's register before the store doesn't count.
            if (stores == 0 && i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction written) {
                int low = written.getRegisterA(), high = low + (i.getOpcode().setsWideRegister() ? 1 : 0);
                if (low <= self && self <= high || low <= self + 2 && self + 2 <= high) return false;
            }
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(((ReferenceInstruction) i).getReference() instanceof FieldReference ref) ||
                    !owner.getType().equals(ref.getDefiningClass()) || !field.getName().equals(ref.getName()) || !field.getType().equals(ref.getType()))
                continue;
            stores++;
            var registers = (TwoRegisterInstruction) i;
            direct = registers.getRegisterA() == self + 2 && registers.getRegisterB() == self;
        }
        return stores == 1 && direct;
    }

    static List<Method> replyReadDispatches(List<ClassDef> classes) {
        var events = new ArrayList<Method>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var params = method.getParameterTypes();
                if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || params.size() != 15 ||
                        !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(params.get(0)) || !SEND_MESSAGE_EVENT.contentEquals(params.get(11)) ||
                        method.getImplementation() == null) continue;
                var strings = new HashSet<String>();
                for (var i : method.getImplementation().getInstructions())
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
                if (strings.contains("AdapterSender") && strings.contains("meta_ai_invocation") && replyReadShape(method)) events.add(method);
            }
        }
        return events;
    }

    /**
     * Where ReadReceipts.kt's REPLY_READ_SHAPE puts the pieces: composer copy, account copy, the thread's null default,
     * the null path's copy, the dispatch, the composer copy's register and how far before the dispatch v12 is staged.
     */
    static final int[] REPLY_READ_SHAPE = {10, 20, 26, 71, 233, 19, 4};

    /** Its body sizes: 397 instructions on arm64, 393 on the 32-bit builds, the seam at the same indices in both. */
    static final Set<Integer> REPLY_READ_SIZES = Set.of(393, 397);

    /**
     * reply_read injects at fixed indices, so ReadReceipts.kt's validateReplyRead pins the method's shape. The same
     * outline is checked here, so a changed body shows up as unresolved instead of passing until patch time: 35
     * registers, 585's 397 or 393 instructions, the typed ThreadKey getter on p7's type two after the null default with its
     * result in v12, v12 taking v10 four before the dispatch, and the five-argument dispatch on p4's type that starts
     * with the FbUserSession and ends with two Strings. The dataflow proof stays in the patch.
     */
    static boolean replyReadShape(Method method) {
        var impl = method.getImplementation();
        if (impl == null || impl.getRegisterCount() != 35) return false;
        var code = new ArrayList<Instruction>();
        impl.getInstructions().forEach(code::add);
        int[] shape = REPLY_READ_SHAPE;
        if (!REPLY_READ_SIZES.contains(code.size())) return false;
        int composer = shape[0], session = shape[1], n = shape[2], absent = shape[3], d = shape[4], cr = shape[5], s = d - shape[6];
        var params = method.getParameterTypes();
        if (code.get(n + 2).getOpcode() != Opcode.INVOKE_INTERFACE_RANGE || !(code.get(n + 2) instanceof ReferenceInstruction g) ||
                !(g.getReference() instanceof MethodReference getter) || !params.get(7).toString().equals(getter.getDefiningClass()) ||
                !getter.getParameterTypes().isEmpty() || !"Lcom/facebook/messaging/model/threadkey/ThreadKey;".equals(getter.getReturnType()))
            return false;
        if (code.get(n + 3).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) code.get(n + 3)).getRegisterA() != 12) return false;
        if (code.get(s).getOpcode() != Opcode.MOVE_OBJECT || ((TwoRegisterInstruction) code.get(s)).getRegisterA() != 12 ||
                ((TwoRegisterInstruction) code.get(s)).getRegisterB() != 10) return false;
        if (code.get(d).getOpcode() != Opcode.INVOKE_INTERFACE_RANGE || !(code.get(d) instanceof ReferenceInstruction di) ||
                !(di.getReference() instanceof MethodReference dispatch) || !params.get(4).toString().equals(dispatch.getDefiningClass()) ||
                !"V".equals(dispatch.getReturnType())) return false;
        var types = dispatch.getParameterTypes();
        if (types.size() != 5 || !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(types.get(0)) ||
            !"Ljava/lang/String;".contentEquals(types.get(3)) || !"Ljava/lang/String;".contentEquals(types.get(4)) ||
            ((RegisterRangeInstruction) code.get(d)).getStartRegister() != 11 || ((RegisterRangeInstruction) code.get(d)).getRegisterCount() != 6)
            return false;
        // The registers and branches validateReplyRead proves its dataflow on.
        int[] p = new int[params.size()];
        int next = impl.getRegisterCount() - params.stream().mapToInt(t -> t.charAt(0) == 'J' || t.charAt(0) == 'D' ? 2 : 1).sum();
        for (int at = 0; at < p.length; at++) { p[at] = next; next += params.get(at).charAt(0) == 'J' || params.get(at).charAt(0) == 'D' ? 2 : 1; }
        var getterArgs = (RegisterRangeInstruction) code.get(n + 2);
        if (getterArgs.getStartRegister() != p[7] || getterArgs.getRegisterCount() != 1) return false;
        if (!moves(code.get(4), Opcode.MOVE_OBJECT_FROM16, 7, p[11]) || !moves(code.get(composer), Opcode.MOVE_OBJECT_FROM16, cr, p[4]) ||
            !moves(code.get(session), Opcode.MOVE_OBJECT_FROM16, 10, p[0]) || !moves(code.get(s - 1), Opcode.MOVE_OBJECT_FROM16, 11, cr) ||
            !moves(code.get(absent), Opcode.MOVE_OBJECT, 12, 5)) return false;
        int stringMoves = 0;
        for (int at = s + 1; at < d; at++) if (moves(code.get(at), Opcode.MOVE_OBJECT, 15, 0)) stringMoves++;
        if (stringMoves != 1) return false;
        if (code.get(n).getOpcode() != Opcode.CONST_4 || ((OneRegisterInstruction) code.get(n)).getRegisterA() != 5 ||
            ((NarrowLiteralInstruction) code.get(n)).getNarrowLiteral() != 0 || code.get(n + 1).getOpcode() != Opcode.IF_EQZ ||
            ((OneRegisterInstruction) code.get(n + 1)).getRegisterA() != p[7] || !jumpsTo(code, n + 1, absent)) return false;
        int[] address = new int[code.size() + 1];
        var index = new HashMap<Integer, Integer>();
        for (int at = 0; at < code.size(); at++) { index.put(address[at], at); address[at + 1] = address[at] + code.get(at).getCodeUnits(); }
        var targets = new HashSet<Integer>();
        for (int at = 0; at < code.size(); at++) {
            if (!(code.get(at) instanceof OffsetInstruction jump)) continue;
            Integer landed = index.get(address[at] + jump.getCodeOffset());
            if (landed == null) return false;
            if (code.get(landed) instanceof SwitchPayload payload) {
                for (var element : payload.getSwitchElements()) targets.add(index.get(address[at] + element.getOffset()));
            } else targets.add(landed);
        }
        for (var block : impl.getTryBlocks()) {
            for (var handler : block.getExceptionHandlers()) targets.add(index.get(handler.getHandlerCodeAddress()));
            // Code inserted at the dispatch would land inside a try that covers the seam.
            for (int at = s - 3; at <= d + 1; at++)
                if (address[at] >= block.getStartCodeAddress() && address[at] < block.getStartCodeAddress() + block.getCodeUnitCount()) return false;
        }
        for (int at = s; at <= d + 1; at++) if (targets.contains(at)) return false;
        for (int at : new int[] {n, n + 1, n + 2, n + 3}) if (targets.contains(at)) return false;
        return true;
    }

    static boolean moves(Instruction instruction, Opcode opcode, int to, int from) {
        return instruction.getOpcode() == opcode && instruction instanceof TwoRegisterInstruction move &&
            move.getRegisterA() == to && move.getRegisterB() == from;
    }

    /**
     * attribution_uploads: the one void worker that takes the session and names both the AttributionIdUpdate failure
     * text and the IAdvertisingIdService Binder fallback. 585 moved it off LatStatusJob onto an obfuscated class.
     * Mirrors AttributionUploads.kt.
     */
    static List<Method> attributionUploads(List<ClassDef> classes) {
        var uploads = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                method.getParameterTypes().stream().noneMatch(t -> "Lcom/facebook/auth/usersession/FbUserSession;".equals(t.toString()))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("Failure while creating and sending attribution state through AttributionIdUpdate.") &&
                strings.contains("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService")) uploads.add(method);
        }
        return uploads.size() == 1 ? uploads : List.of();
    }

    /**
     * ad_events: the static (context, FbUserSession, four Strings)V click-to-message entry event that reads ad_id and
     * page_id, and the inbox tracker's non-static (rows, Z)V callback that names InboxCustomizedImpressionTracker and
     * inbox2_vr. Mirrors AdEvents.kt.
     */
    static List<Method> adEvents(List<ClassDef> classes) {
        var events = new ArrayList<Method>();
        var string = "Ljava/lang/String;";
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            var isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            var entry = isStatic && params.size() == 6 && params.get(1).equals("Lcom/facebook/auth/usersession/FbUserSession;") &&
                params.subList(2, 6).equals(List.of(string, string, string, string));
            var visibility = !isStatic && params.size() == 2 && params.get(1).equals("Z");
            if (!entry && !visibility) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (entry && strings.contains("ad_id") && strings.contains("page_id") ||
                visibility && strings.contains("inbox2_vr") && strings.contains("InboxCustomizedImpressionTracker")) events.add(method);
        }
        return events;
    }

    static Set<String> literals(Method method) {
        var strings = new HashSet<String>();
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
        return strings;
    }

    /** The publish's not-connected answer: the first sget-object after "not_connected", returned at once, of its own class. */
    static boolean hasNotSentAnswer(List<Instruction> code) {
        int logged = -1;
        for (int i = 0; i < code.size(); i++) {
            if (!(code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "not_connected".equals(sr.getString()))) continue;
            if (logged >= 0) return false;
            logged = i;
        }
        if (logged < 0) return false;
        for (int i = logged + 1; i < code.size() - 1; i++) {
            if (code.get(i).getOpcode() != Opcode.SGET_OBJECT) continue;
            if (!(((ReferenceInstruction) code.get(i)).getReference() instanceof FieldReference field)) return false;
            return code.get(i + 1).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(i + 1)) == register(code.get(i)) &&
                field.getType().equals(field.getDefiningClass());
        }
        return false;
    }

    /** One iget-boolean tested by the next if-eqz whose false branch is the plain ping, a static (own class, X)V call. */
    static boolean hasHealthKeepaliveFlag(Method method) {
        var code = instructions(method);
        int topic = -1;
        for (int i = 0; i < code.size() && topic < 0; i++)
            if (code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "/mqtt_health_stats".equals(sr.getString())) topic = i;
        int sites = 0;
        for (int at = 0; at < topic; at++) {
            if (code.get(at).getOpcode() != Opcode.IGET_BOOLEAN || code.get(at + 1).getOpcode() != Opcode.IF_EQZ ||
                ((TwoRegisterInstruction) code.get(at)).getRegisterA() != register(code.get(at + 1))) continue;
            for (int target = 0; target < code.size(); target++) {
                if (!jumpsTo(code, at + 1, target)) continue;
                if (code.get(target).getOpcode() == Opcode.INVOKE_STATIC &&
                    ((ReferenceInstruction) code.get(target)).getReference() instanceof MethodReference ping &&
                    ping.getDefiningClass().equals(method.getDefiningClass()) && "V".equals(ping.getReturnType()) &&
                    ping.getParameterTypes().size() == 2 && ping.getParameterTypes().get(0).toString().equals(method.getDefiningClass())) sites++;
                break;
            }
        }
        return sites == 1;
    }

    /**
     * mqtt_telemetry: the MQTT client's instance publish (two callbacks, Integer, String, String, [B, I, J) that names
     * exception/publish, not_connected and /mqtt_health_stats and returns a singleton when not connected, and the same
     * class's instance (String)V keepalive that names exception/send_keepalive and /mqtt_health_stats and picks the plain
     * ping on one config flag. Both or neither. Mirrors MqttTelemetry.kt.
     */
    static List<Method> mqttTelemetry(List<ClassDef> classes) {
        var publish = new ArrayList<Method>();
        var keepalive = new ArrayList<Method>();
        var tail = List.of("Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;", "[B", "I", "J");
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            var strings = literals(method);
            if (params.size() == 8 && method.getReturnType().startsWith("L") && params.get(0).startsWith("L") &&
                params.get(1).startsWith("L") && params.subList(2, 8).equals(tail) &&
                strings.containsAll(List.of("exception/publish", "not_connected", "/mqtt_health_stats")) &&
                hasNotSentAnswer(instructions(method))) publish.add(method);
            if (params.equals(List.of("Ljava/lang/String;")) && "V".equals(method.getReturnType()) &&
                strings.containsAll(List.of("exception/send_keepalive", "/mqtt_health_stats")) &&
                hasHealthKeepaliveFlag(method)) keepalive.add(method);
        }
        if (publish.size() != 1 || keepalive.size() != 1 ||
            !publish.get(0).getDefiningClass().equals(keepalive.get(0).getDefiningClass())) return List.of();
        return List.of(publish.get(0), keepalive.get(0));
    }

    /** The focus change's one invoke-super of Android's onFocusChanged, made on this. */
    static boolean hasFocusSuperCall(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getImplementation() == null ||
            !"onFocusChanged".equals(method.getName()) || !"V".equals(method.getReturnType())) return false;
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("Z", "I", "Landroid/graphics/Rect;"))) return false;
        int self = method.getImplementation().getRegisterCount() - 4;
        int calls = 0;
        for (var i : instructions(method)) {
            if (i.getOpcode() != Opcode.INVOKE_SUPER && i.getOpcode() != Opcode.INVOKE_SUPER_RANGE) continue;
            if (!(((ReferenceInstruction) i).getReference() instanceof MethodReference call)) continue;
            int receiver = i instanceof FiveRegisterInstruction f ? f.getRegisterC() : ((RegisterRangeInstruction) i).getStartRegister();
            var types = new ArrayList<String>();
            for (var t : call.getParameterTypes()) types.add(t.toString());
            if (Set.of("Landroid/widget/TextView;", "Landroid/widget/EditText;").contains(call.getDefiningClass()) &&
                "onFocusChanged".equals(call.getName()) && "V".equals(call.getReturnType()) && types.equals(params) &&
                receiver == self) calls++;
        }
        return calls == 1;
    }

    /**
     * text_style: the one method of an EditText subclass that names updateState:TextInputComponent.remeasureForUpdatedText
     * has to be its instance onTextChanged(CharSequence, III)V, and the hook is the same class's
     * onFocusChanged(ZILandroid/graphics/Rect;)V that calls Android's own on this. Mirrors TextStyle.kt.
     */
    static List<Method> textStyleField(List<ClassDef> classes) {
        ClassDef field = null;
        Method anchor = null;
        int anchors = 0;
        for (var cls : classes) {
            if (!"Landroid/widget/EditText;".equals(cls.getSuperclass())) continue;
            for (var method : cls.getMethods()) {
                if (!literals(method).contains("updateState:TextInputComponent.remeasureForUpdatedText")) continue;
                anchors++;
                field = cls;
                anchor = method;
            }
        }
        if (anchors != 1 || AccessFlags.STATIC.isSet(anchor.getAccessFlags()) ||
            !hookId(anchor).endsWith(";->onTextChanged(Ljava/lang/CharSequence;III)V")) return List.of();
        var focus = new ArrayList<Method>();
        for (var method : field.getMethods()) if (hasFocusSuperCall(method)) focus.add(method);
        return focus.size() == 1 ? focus : List.of();
    }

    static final long PINNED_CHAT_LIMIT_CONFIG = 0x8205ad0002101eL;

    /**
     * pinned_chats: every method that reads the pinned chat limit's config id, 585 having inlined 584's getter. Each one
     * loads the id once, hands that register pair straight to a static (Object, J)I config read and takes its answer
     * with the next instruction. Counted only when every reader looks like that. Mirrors PinnedChats.kt.
     */
    static List<Method> pinnedChatLimit(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = instructions(method);
            var loads = new ArrayList<Integer>();
            for (int at = 0; at < code.size(); at++)
                if (code.get(at).getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) code.get(at)).getWideLiteral() == PINNED_CHAT_LIMIT_CONFIG) loads.add(at);
            if (loads.isEmpty()) continue;
            if (loads.size() != 1) return List.of();
            int at = loads.get(0), id = register(code.get(at));
            if (at + 2 >= code.size() || !(code.get(at + 1) instanceof FiveRegisterInstruction read) || read.getOpcode() != Opcode.INVOKE_STATIC ||
                !(((ReferenceInstruction) read).getReference() instanceof MethodReference target) || !"I".equals(target.getReturnType()) ||
                !target.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/Object;", "J")) ||
                read.getRegisterCount() != 3 || read.getRegisterD() != id || read.getRegisterE() != id + 1 ||
                code.get(at + 2).getOpcode() != Opcode.MOVE_RESULT) return List.of();
            found.add(method);
        }
        return found;
    }

    static boolean calls(Method method, String owner) {
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call &&
                owner.equals(call.getDefiningClass())) return true;
        return false;
    }

    /**
     * nearby_scans: the foreground location controller's one static (Context, FbUserSession, controller, J)V that names
     * the task it queues, and the app's one reader of WifiManager.getScanResults. Both are taken only while the app's
     * single WifiManager.startScan sits in the class that scheduler instantiates, its single BluetoothLeScanner.startScan
     * sits in a class holding the BleScanOperation that queued class drives, and the reader has the shape
     * scanResultReader checks. Mirrors NearbyScans.kt.
     */
    static List<Method> nearbyScans(List<ClassDef> classes) {
        final String controller = "Lcom/facebook/location/foreground/ForegroundLocationFrameworkController;";
        final String operation = "Lcom/facebook/blescan/BleScanOperation;";
        var schedulers = new ArrayList<Method>();
        var wifi = new ArrayList<ClassDef>();
        var bluetooth = new ArrayList<ClassDef>();
        var readers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            if (controller.equals(cls.getType()) && AccessFlags.STATIC.isSet(method.getAccessFlags()) && "V".equals(method.getReturnType())) {
                var params = new ArrayList<String>();
                for (var t : method.getParameterTypes()) params.add(t.toString());
                if (params.equals(List.of("Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", controller, "J")) &&
                    literals(method).contains("ForegroundLocationFrameworkController_scheduleRequestLocationWithDelay")) schedulers.add(method);
            }
            for (var i : instructions(method)) {
                if (!(i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call)) continue;
                if (readsScanResults(call)) readers.add(method);
                if (!"startScan".equals(call.getName())) continue;
                if ("Landroid/net/wifi/WifiManager;".equals(call.getDefiningClass())) wifi.add(cls);
                if ("Landroid/bluetooth/le/BluetoothLeScanner;".equals(call.getDefiningClass())) bluetooth.add(cls);
            }
        }
        if (schedulers.size() != 1 || wifi.size() != 1 || bluetooth.size() != 1 || readers.size() != 1 || !scanResultReader(readers.get(0))) return List.of();
        boolean queued = false;
        for (var i : instructions(schedulers.get(0)))
            if (i.getOpcode() == Opcode.NEW_INSTANCE && ((ReferenceInstruction) i).getReference() instanceof TypeReference type &&
                type.getType().equals(wifi.get(0).getType())) queued = true;
        boolean holdsOperation = false;
        for (var field : bluetooth.get(0).getFields()) if (operation.equals(field.getType())) holdsOperation = true;
        boolean drives = false;
        for (var method : wifi.get(0).getMethods()) if (calls(method, operation)) drives = true;
        return queued && holdsOperation && drives ? List.of(schedulers.get(0), readers.get(0)) : List.of();
    }

    static boolean readsScanResults(MethodReference call) {
        return "Landroid/net/wifi/WifiManager;".equals(call.getDefiningClass()) && "getScanResults".equals(call.getName());
    }

    static boolean readsWifiIdentity(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call &&
            "Landroid/net/wifi/WifiInfo;".equals(call.getDefiningClass()) && call.getParameterTypes().isEmpty() &&
            "Ljava/lang/String;".equals(call.getReturnType()) &&
            ("getSSID".equals(call.getName()) || "getBSSID".equals(call.getName()));
    }

    /**
     * wifi_identity: every method outside org.webrtc that reads the connected network's SSID or BSSID, taken only while
     * every such read's answer is kept by the next instruction (move-result-object). Mirrors NearbyScans.kt.
     */
    static List<Method> wifiIdentityReads(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        for (var cls : classes) {
            if (cls.getType().startsWith("Lorg/webrtc/")) continue;
            for (var method : cls.getMethods()) {
                var implementation = method.getImplementation();
                if (implementation == null) continue;
                boolean reads = false;
                boolean pending = false;
                for (var instruction : implementation.getInstructions()) {
                    if (pending && instruction.getOpcode() != Opcode.MOVE_RESULT_OBJECT) return List.of();
                    pending = readsWifiIdentity(instruction);
                    reads |= pending;
                }
                if (pending) return List.of();
                if (reads) readers.add(method);
            }
        }
        return readers;
    }

    static final String STORY_FINISHED = "story_playback_finished";
    static final String MONTAGE_VIEWER = "Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;";

    /**
     * story_hold: the app's only story_playback_finished logger, a public instance ()V whose one hand-off is an
     * invoke-virtual or invoke-interface {callback, this} of a (page)V method, right after an if-eqz on the callback and
     * right before return-void, with nothing jumping straight to it and a local other than the callback to spare. The
     * callback has to call a static (MontageViewerFragment, Integer)V on the viewer. Mirrors StoryHold.kt.
     */
    static List<Method> storyHold(List<ClassDef> classes) {
        var loggers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (literals(method).contains(STORY_FINISHED)) loggers.add(method);
        if (loggers.size() != 1) return List.of();
        var completion = loggers.get(0);
        int flags = completion.getAccessFlags();
        if (!AccessFlags.PUBLIC.isSet(flags) || AccessFlags.STATIC.isSet(flags) || !completion.getParameterTypes().isEmpty() ||
            !"V".equals(completion.getReturnType()) || completion.getImplementation() == null) return List.of();
        var code = instructions(completion);
        int page = completion.getImplementation().getRegisterCount() - 1;
        var hands = new ArrayList<Integer>();
        for (int i = 1; i + 1 < code.size(); i++) {
            if (!(code.get(i) instanceof FiveRegisterInstruction call) || !(code.get(i) instanceof ReferenceInstruction ri) ||
                !(ri.getReference() instanceof MethodReference target)) continue;
            var op = call.getOpcode();
            if ((op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_INTERFACE) && call.getRegisterCount() == 2 && call.getRegisterD() == page &&
                target.getParameterTypes().size() == 1 && "V".equals(target.getReturnType()) && code.get(i + 1).getOpcode() == Opcode.RETURN_VOID &&
                code.get(i - 1).getOpcode() == Opcode.IF_EQZ && ((OneRegisterInstruction) code.get(i - 1)).getRegisterA() == call.getRegisterC())
                hands.add(i);
        }
        if (hands.size() != 1 || mediaTargets(completion).contains(hands.get(0))) return List.of();
        var call = (FiveRegisterInstruction) code.get(hands.get(0));
        boolean spare = false;
        for (int r = 0; r < page; r++) if (r != call.getRegisterC()) { spare = true; break; }
        if (!spare) return List.of();
        var target = (MethodReference) ((ReferenceInstruction) call).getReference();
        var targetParams = target.getParameterTypes().stream().map(Object::toString).toList();
        for (var cls : classes) {
            if (!cls.getType().equals(target.getDefiningClass())) continue;
            Method callback = null;
            int matches = 0;
            for (var method : cls.getMethods()) {
                if (method.getName().equals(target.getName()) && params(method).equals(targetParams) && method.getReturnType().equals(target.getReturnType())) {
                    callback = method;
                    matches++;
                }
            }
            if (matches != 1) return List.of();
            for (var i : instructions(callback)) {
                if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction cr && cr.getReference() instanceof MethodReference viewer &&
                    MONTAGE_VIEWER.equals(viewer.getDefiningClass()) && "V".equals(viewer.getReturnType()) &&
                    viewer.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MONTAGE_VIEWER, "Ljava/lang/Integer;")))
                    return List.of(completion);
            }
            return List.of();
        }
        return List.of();
    }

    static final String HOISTED_SHARE_LOADER = "Lcom/facebook/messaging/sharing/broadcastflow/mutation/loader/plugins/sections/" +
        "morewaystoshare/hoisted/BroadcastFlowHoistedMoreWaysToShareSectionsLoader;";
    static final String UNHOISTED_SHARE_TRACE = "messaging.sharing.broadcastflow.mutation.loader.sections.morewaystoshare.unhoisted." +
        "BroadcastFlowUnhoistedMoreWaysToShareSectionsLoader";

    static String created(Instruction i) {
        return i.getOpcode() == Opcode.NEW_INSTANCE ? ((TypeReference) ((ReferenceInstruction) i).getReference()).getType() : null;
    }

    static String text(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr ? sr.getString() : null;
    }

    static List<Integer> reads(Instruction i) {
        var out = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction call) {
            int[] all = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
            for (int r = 0; r < call.getRegisterCount(); r++) out.add(all[r]);
        } else if (i instanceof RegisterRangeInstruction range) {
            for (int r = 0; r < range.getRegisterCount(); r++) out.add(range.getStartRegister() + r);
        }
        return out;
    }

    /** getId() is just ADD_TO_STORY_ID: the literal, or the constant looked up in a stringTables table and returned as is. */
    static boolean storyRow(ClassDef cls, Map<String, Map<Integer, String>> tables) {
        for (var method : cls.getMethods()) {
            if (!"getId".equals(method.getName()) || !"Ljava/lang/String;".equals(method.getReturnType()) ||
                !method.getParameterTypes().isEmpty() || AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var code = instructions(method);
            if (code.size() == 2 && code.get(0).getOpcode() == Opcode.CONST_STRING && "ADD_TO_STORY_ID".equals(text(code.get(0))) &&
                code.get(1).getOpcode() == Opcode.RETURN_OBJECT) return true;
            if (code.size() == 4 && tableStrings(code.subList(0, 2), tables).equals(Set.of("ADD_TO_STORY_ID")) &&
                code.get(2).getOpcode() == Opcode.MOVE_RESULT_OBJECT && code.get(3).getOpcode() == Opcode.RETURN_OBJECT &&
                register(code.get(2)) == register(code.get(3))) return true;
        }
        return false;
    }

    /** The gate kind on the one row this method creates: 1 hoisted, 2 unhoisted, 0 neither. Mirrors ShareStory.kt. */
    static int storyGate(Method method, String row) {
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (!row.equals(created(code.get(i)))) continue;
            if (at >= 0) return 0;
            at = i;
        }
        if (at < 0) return 0;
        if (hoistedStoryGate(method, code, at)) return 1;
        return unhoistedStoryGate(method, code, at) ? 2 : 0;
    }

    static boolean hoistedStoryGate(Method method, List<Instruction> code, int at) {
        if (!HOISTED_SHARE_LOADER.equals(method.getDefiningClass()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !method.getParameterTypes().isEmpty() || !"V".equals(method.getReturnType()) || at < 3) return false;
        int gate = at - 1;
        if (code.get(gate).getOpcode() != Opcode.IF_EQZ || mediaTarget(code, gate) <= at) return false;
        int value = register(code.get(gate));
        if (code.get(at - 2).getOpcode() != Opcode.MOVE_RESULT || register(code.get(at - 2)) != value || value > 15) return false;
        if (code.get(at - 3).getOpcode() != Opcode.INVOKE_STATIC || !(code.get(at - 3) instanceof ReferenceInstruction ri) ||
            !(ri.getReference() instanceof MethodReference call) || !"Z".equals(call.getReturnType())) return false;
        return !mediaTargets(method).contains(gate);
    }

    static boolean unhoistedStoryGate(Method method, List<Instruction> code, int at) {
        boolean traced = false;
        for (var i : code) if (UNHOISTED_SHARE_TRACE.equals(text(i))) traced = true;
        if (!traced) return false;
        int gate = -1;
        for (int i = at - 1; i >= 1; i--) if (code.get(i).getOpcode() == Opcode.IF_EQ) { gate = i; break; }
        if (gate < 0) return false;
        var compare = (TwoRegisterInstruction) code.get(gate);
        int state = compare.getRegisterA(), skip = compare.getRegisterB();
        if (state > 15 || skip > 15 || state == skip) return false;
        var read = code.get(gate - 1);
        if (read.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) read).getRegisterA() != state ||
            !(((ReferenceInstruction) read).getReference() instanceof FieldReference field) ||
            !field.getDefiningClass().equals(method.getDefiningClass()) || !"Ljava/lang/Object;".equals(field.getType())) return false;
        boolean started = false;
        for (int i = gate + 1; i < at; i++) if (UNHOISTED_SHARE_TRACE.equals(text(code.get(i)))) started = true;
        if (!started) return false;
        int skipTo = mediaTarget(code, gate);
        if (skipTo <= at || at + 2 >= code.size() || skipTo + 1 >= code.size()) return false;
        int made = register(code.get(at));
        var list = code.get(at + 2);
        if (list.getOpcode() != Opcode.INVOKE_STATIC ||
            !(IMMUTABLE_LIST + "->of(Ljava/lang/Object;)" + IMMUTABLE_LIST).equals(ref(list)) || !reads(list).equals(List.of(made))) return false;
        var first = code.get(skipTo);
        var write = code.get(skipTo + 1);
        if (!(first instanceof FiveRegisterInstruction) && !(first instanceof RegisterRangeInstruction)) return false;
        if (reads(first).contains(state) || (write.getOpcode() != Opcode.MOVE_RESULT && write.getOpcode() != Opcode.MOVE_RESULT_OBJECT) ||
            register(write) != state) return false;
        return !mediaTargets(method).contains(gate);
    }

    /**
     * share_story: the one class whose getId() is just ADD_TO_STORY_ID, and the two methods that create it, each creating
     * it once behind its proven gate, one of them in the hoisted more-ways-to-share loader. Mirrors ShareStory.kt.
     */
    static List<Method> shareStory(List<ClassDef> classes) {
        var rows = new ArrayList<String>();
        var tables = stringTables(classes);
        for (var cls : classes) if (storyRow(cls, tables)) rows.add(cls.getType());
        if (rows.size() != 1) return List.of();
        var row = rows.get(0);
        var creators = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            for (var i : instructions(method)) if (row.equals(created(i))) { creators.add(method); break; }
        }
        if (creators.size() != 2) return List.of();
        int hoisted = 0;
        for (var method : creators) {
            int kind = storyGate(method, row);
            if (kind == 0) return List.of();
            if (kind == 1) hoisted++;
        }
        return hoisted == 1 ? creators : List.of();
    }

    /** The register holding parameter n, counting this as 0 on an instance method. */
    static int parameterSlot(Method method, int n) {
        int words = AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1;
        for (var type : method.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        return method.getImplementation().getRegisterCount() - words + n;
    }

    /** RoundingOptions' isCircular: the own boolean its toString() last read into the register it appends right after the class name. */
    static String vitoCircle(ClassDef cls) {
        Method printer = null;
        for (var method : cls.getMethods()) {
            if (!"toString".equals(method.getName()) || !method.getParameterTypes().isEmpty() || !"Ljava/lang/String;".equals(method.getReturnType())) continue;
            if (printer != null) return null;
            printer = method;
        }
        if (printer == null || AccessFlags.STATIC.isSet(printer.getAccessFlags())) return null;
        var code = instructions(printer);
        int named = -1;
        for (int i = 0; i < code.size() && named < 0; i++) {
            String value = text(code.get(i));
            if (value != null && value.startsWith("RoundingOptions(isCircular=")) named = i;
        }
        if (named < 0) return null;
        int append = -1;
        for (int i = named + 1; i < code.size() && append < 0; i++) {
            if (code.get(i) instanceof ReferenceInstruction call && call.getReference() instanceof MethodReference target &&
                "Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;".equals(target.toString())) append = i;
        }
        if (append < 0) return null;
        var targets = mediaTargets(printer);
        for (int i = 0; i < append; i++) if (code.get(i) instanceof OffsetInstruction || targets.contains(i + 1)) return null;
        var appended = reads(code.get(append));
        if (appended.size() < 2) return null;
        int value = appended.get(1);
        for (int i = append - 1; i >= 0; i--) {
            if (!(code.get(i) instanceof OneRegisterInstruction one) || one.getRegisterA() != value) continue;
            if (code.get(i).getOpcode() != Opcode.IGET_BOOLEAN || ((TwoRegisterInstruction) code.get(i)).getRegisterB() != parameterSlot(printer, 0)) return null;
            var field = (FieldReference) ((ReferenceInstruction) code.get(i)).getReference();
            return field.getDefiningClass().equals(cls.getType()) && "Z".equals(field.getType()) ? field.toString() : null;
        }
        return null;
    }

    /** Mirrors AvatarShape.kt's vitoRounding: Object's constructor, one own-parameter store per field, return. */
    static boolean vitoRounding(Method method, String circleField) {
        if (!"<init>".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType())) return false;
        if (!circleField.startsWith(method.getDefiningClass() + "->")) return false;
        var code = instructions(method);
        if (code.size() < 3 || code.get(code.size() - 1).getOpcode() != Opcode.RETURN_VOID) return false;
        int self = parameterSlot(method, 0);
        if (code.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !"Ljava/lang/Object;-><init>()V".equals(ref(code.get(0))) ||
            !reads(code.get(0)).equals(List.of(self))) return false;
        var params = new HashMap<Integer, String>();
        var types = method.getParameterTypes();
        for (int i = 0; i < types.size(); i++) {
            String type = types.get(i).toString();
            if ("J".equals(type) || "D".equals(type)) return false;
            params.put(parameterSlot(method, i + 1), type);
        }
        var names = new HashSet<String>();
        var values = new HashSet<Integer>();
        int circle = -1, radius = -1, radii = -1, floats = 0, arrays = 0, circles = 0;
        for (var store : code.subList(1, code.size() - 1)) {
            var op = store.getOpcode();
            if (op != Opcode.IPUT && op != Opcode.IPUT_BOOLEAN && op != Opcode.IPUT_OBJECT) return false;
            var field = (FieldReference) ((ReferenceInstruction) store).getReference();
            var put = (TwoRegisterInstruction) store;
            if (put.getRegisterB() != self || !field.getDefiningClass().equals(method.getDefiningClass()) ||
                !field.getType().equals(params.get(put.getRegisterA()))) return false;
            if (!names.add(field.getName()) || !values.add(put.getRegisterA())) return false;
            if (field.toString().equals(circleField)) { circle = put.getRegisterA(); circles++; }
            if ("F".equals(field.getType())) { radius = put.getRegisterA(); floats++; }
            if ("[F".equals(field.getType())) { radii = put.getRegisterA(); arrays++; }
        }
        return circles == 1 && floats == 1 && arrays == 1 && Math.max(circle, Math.max(radius, radii)) <= 15;
    }

    /** Mirrors AvatarShape.kt's legacyRounding: the params' flag, then their radii, handed to the layer, then a spare read. */
    static boolean legacyRounding(Method method) {
        if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 2) return false;
        String layerType = method.getParameterTypes().get(0).toString(), paramsType = method.getParameterTypes().get(1).toString();
        if (!layerType.startsWith("L") || !paramsType.startsWith("L") || layerType.equals(paramsType)) return false;
        var code = instructions(method);
        if (code.size() < 6) return false;
        int layer = parameterSlot(method, 0), params = parameterSlot(method, 1);
        int flag = legacyRead(code.get(0), Opcode.IGET_BOOLEAN, "Z", layer, params, paramsType);
        if (flag < 0 || !legacyHands(code.get(1), layer, flag, layerType, "Z")) return false;
        int radii = legacyRead(code.get(2), Opcode.IGET_OBJECT, "[F", layer, params, paramsType);
        if (radii < 0 || !legacyHands(code.get(3), layer, radii, layerType, "[F")) return false;
        var next = code.get(4);
        if ((next.getOpcode() != Opcode.IGET && next.getOpcode() != Opcode.IGET_BOOLEAN) || ((TwoRegisterInstruction) next).getRegisterB() != params) return false;
        int spare = ((TwoRegisterInstruction) next).getRegisterA();
        if (spare == layer || spare == params || spare == radii || spare > 15) return false;
        var targets = mediaTargets(method);
        for (int i = 0; i <= 4; i++) if (targets.contains(i)) return false;
        return true;
    }

    static int legacyRead(Instruction get, Opcode opcode, String type, int layer, int params, String paramsType) {
        if (get.getOpcode() != opcode || !(get instanceof TwoRegisterInstruction two) || two.getRegisterB() != params) return -1;
        var field = (FieldReference) ((ReferenceInstruction) get).getReference();
        if (!field.getDefiningClass().equals(paramsType) || !field.getType().equals(type)) return -1;
        int value = two.getRegisterA();
        return value == layer || value == params || value > 15 ? -1 : value;
    }

    static boolean legacyHands(Instruction call, int layer, int value, String layerType, String parameter) {
        if (call.getOpcode() != Opcode.INVOKE_INTERFACE || !(((ReferenceInstruction) call).getReference() instanceof MethodReference target)) return false;
        return target.getDefiningClass().equals(layerType) && "V".equals(target.getReturnType()) && target.getParameterTypes().size() == 1 &&
            parameter.contentEquals(target.getParameterTypes().get(0)) && reads(call).equals(List.of(layer, value));
    }

    static final String TILE_SET_SHAPE = "Landroid/graphics/drawable/ShapeDrawable;->setShape(Landroid/graphics/drawable/shapes/Shape;)V";
    static final String TILE_PATH_SHAPE = "Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V";
    static final String TILE_DRAW_OVAL = "Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V";

    /** Mirrors AvatarShape.kt's tileShapeFlag: a (Z)V that makes an OvalShape and a RectShape, sets one, and branches first on the flag. */
    static boolean tileShapeFlag(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 1 ||
            !"Z".contentEquals(method.getParameterTypes().get(0)) || method.getImplementation() == null) return false;
        var code = instructions(method);
        var created = new HashSet<String>();
        boolean sets = false;
        Instruction branch = null;
        for (var i : code) {
            if (i.getOpcode() == Opcode.NEW_INSTANCE && ((ReferenceInstruction) i).getReference() instanceof TypeReference type) created.add(type.getType());
            if (TILE_SET_SHAPE.equals(ref(i))) sets = true;
            if (branch == null && i instanceof OffsetInstruction) branch = i;
        }
        if (!created.contains("Landroid/graphics/drawable/shapes/OvalShape;") || !created.contains("Landroid/graphics/drawable/shapes/RectShape;") || !sets) return false;
        int flag = parameterSlot(method, 1);
        if (branch == null || (branch.getOpcode() != Opcode.IF_EQZ && branch.getOpcode() != Opcode.IF_NEZ) || register(branch) != flag) return false;
        return flag <= 15 && !mediaTargets(method).contains(0);
    }

    /** Mirrors AvatarShape.kt's tilePath: the setter's class, one Path parameter, made into a PathShape, and the setter called. */
    static boolean tilePath(Method method, String setter) {
        if (!setter.startsWith(method.getDefiningClass() + "->") || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !"V".equals(method.getReturnType()) || method.getImplementation() == null) return false;
        var types = method.getParameterTypes();
        int paths = 0, index = -1, words = 1;
        for (int i = 0; i < types.size(); i++) {
            String type = types.get(i).toString();
            if ("Landroid/graphics/Path;".equals(type)) { paths++; if (index < 0) index = words; }
            words += "J".equals(type) || "D".equals(type) ? 2 : 1;
        }
        if (paths != 1) return false;
        var code = instructions(method);
        boolean shaped = false, set = false;
        for (var i : code) { shaped |= TILE_PATH_SHAPE.equals(ref(i)); set |= setter.equals(ref(i)); }
        return shaped && set && parameterSlot(method, index) <= 15 && !mediaTargets(method).contains(0);
    }

    /** Mirrors AvatarShape.kt's tileOvals: the placeholder's draw(Canvas), every oval it draws an invoke-virtual drawOval. */
    static boolean tileOvals(Method method) {
        if (!"draw".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) ||
            method.getParameterTypes().size() != 1 || !"Landroid/graphics/Canvas;".contentEquals(method.getParameterTypes().get(0)) ||
            method.getImplementation() == null) return false;
        int ovals = 0;
        for (var i : instructions(method)) {
            if (!TILE_DRAW_OVAL.equals(ref(i))) continue;
            if (i.getOpcode() != Opcode.INVOKE_VIRTUAL) return false;
            ovals++;
        }
        return ovals > 0;
    }

    /**
     * avatar_shape: Vito's one RoundingOptions constructor in its proven shape, the one legacy rounding helper, then the
     * user tile's one shape setter, the one setup in its class that hands it a clip path, and the draw of the placeholder
     * type that setup takes. Mirrors AvatarShape.kt.
     */
    static List<Method> avatarShape(List<ClassDef> classes) {
        ClassDef vito = null;
        String circle = null;
        for (var cls : classes) {
            String field = vitoCircle(cls);
            if (field == null) continue;
            if (vito != null) return List.of();
            vito = cls;
            circle = field;
        }
        if (vito == null) return List.of();
        Method constructor = null;
        for (var method : vito.getMethods()) {
            if (!vitoRounding(method, circle)) continue;
            if (constructor != null) return List.of();
            constructor = method;
        }
        if (constructor == null) return List.of();
        Method legacy = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!legacyRounding(method)) continue;
            if (legacy != null) return List.of();
            legacy = method;
        }
        if (legacy == null) return List.of();
        Method setter = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!tileShapeFlag(method)) continue;
            if (setter != null) return List.of();
            setter = method;
        }
        if (setter == null) return List.of();
        String setterId = hookId(setter);
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        var tile = byType.get(setter.getDefiningClass());
        if (tile == null) return List.of();
        Method setup = null;
        for (var method : tile.getMethods()) {
            if (!tilePath(method, setterId)) continue;
            if (setup != null) return List.of();
            setup = method;
        }
        if (setup == null) return List.of();
        Method placeholder = null;
        for (var type : new LinkedHashSet<String>(setup.getParameterTypes().stream().map(Object::toString).toList())) {
            var cls = byType.get(type);
            if (cls == null) continue;
            for (var method : cls.getMethods()) {
                if (!tileOvals(method)) continue;
                if (placeholder != null) return List.of();
                placeholder = method;
            }
        }
        return placeholder == null ? List.of() : List.of(constructor, legacy, setter, setup, placeholder);
    }

    static final String RTC_NOTIFICATION_SERVICE ="Lcom/facebook/rtc/notification/RtcNotificationForegroundService;";

    /**
     * The flag register of the log entry built right after a name: a static (Object, boolean) call that takes the
     * name's register first and the flag second, in either invoke form, or -1.
     */
    static int namedFlag(Instruction i, int name) {
        if (i.getOpcode() != Opcode.INVOKE_STATIC && i.getOpcode() != Opcode.INVOKE_STATIC_RANGE) return -1;
        if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference target)) return -1;
        if (!List.of("Ljava/lang/Object;", "Z").equals(target.getParameterTypes().stream().map(Object::toString).toList())) return -1;
        if (i instanceof FiveRegisterInstruction call && call.getRegisterCount() == 2 && call.getRegisterC() == name) return call.getRegisterD();
        if (i instanceof RegisterRangeInstruction range && range.getRegisterCount() == 2 && range.getStartRegister() == name) return name + 1;
        return -1;
    }

    /**
     * The flag logged under the name at logged: the entry right after the name takes it directly, or the 32-bit
     * builds' copy of it made just before the entry, or -1.
     */
    static int loggedFlag(List<Instruction> code, int logged) {
        if (!(code.get(logged) instanceof OneRegisterInstruction named) || logged + 1 >= code.size()) return -1;
        int name = named.getRegisterA();
        var next = code.get(logged + 1);
        if (!Set.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16).contains(next.getOpcode())) return namedFlag(next, name);
        var copy = (TwoRegisterInstruction) next;
        if (copy.getRegisterA() == name || logged + 2 >= code.size()) return -1;
        return namedFlag(code.get(logged + 2), name) == copy.getRegisterA() ? copy.getRegisterB() : -1;
    }

    /** Index of the one const-string with this text, or -1 when there are none or several. */
    static int onlyString(List<Instruction> code, String text) {
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && text.equals(sr.getString())) {
                if (at >= 0) return -1;
                at = i;
            }
        }
        return at;
    }

    /**
     * quiet_call_ring: the app's only method naming "Maybe start ringing", an instance run()V that also names
     * ringtone_disabled and notifications_blocked once each. The flag the log entry pairs with ringtone_disabled has
     * exactly one if-nez before "Maybe start ringing" that lands after it and at or before that log, and nothing jumps
     * to the instruction after that branch. Mirrors QuietCalls.kt.
     */
    static List<Method> quietCallRing(List<ClassDef> classes) {
        var deciders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (literals(method).contains("Maybe start ringing")) deciders.add(method);
        if (deciders.size() != 1) return List.of();
        var decider = deciders.get(0);
        if (AccessFlags.STATIC.isSet(decider.getAccessFlags()) || !"run".equals(decider.getName()) ||
            !decider.getParameterTypes().isEmpty() || !"V".equals(decider.getReturnType())) return List.of();
        var code = instructions(decider);
        int ring = onlyString(code, "Maybe start ringing"), logged = onlyString(code, "ringtone_disabled");
        if (ring < 0 || logged < 0 || onlyString(code, "notifications_blocked") < 0) return List.of();
        int flag = loggedFlag(code, logged);
        if (flag < 0) return List.of();
        var branches = new ArrayList<Integer>();
        for (int i = 0; i < ring; i++) {
            if (code.get(i).getOpcode() != Opcode.IF_NEZ || register(code.get(i)) != flag) continue;
            int target = mediaTarget(code, i);
            if (target > ring && target <= logged) branches.add(i);
        }
        if (branches.size() != 1 || mediaTargets(decider).contains(branches.get(0) + 1)) return List.of();
        return List.of(decider);
    }

    /**
     * quiet_call_notification: the call service's only static (Notification, Context, ...)V method that also takes the
     * service and makes an invoke-virtual startForeground(int, Notification...) call, when nothing jumps to its first
     * instruction. Mirrors QuietCalls.kt.
     */
    static List<Method> quietCallNotification(List<ClassDef> classes) {
        var posters = new ArrayList<Method>();
        for (var cls : classes) {
            if (!RTC_NOTIFICATION_SERVICE.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                var types = params(method);
                if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) ||
                    types.size() < 3 || !"Landroid/app/Notification;".equals(types.get(0)) || !"Landroid/content/Context;".equals(types.get(1)) ||
                    !types.contains(RTC_NOTIFICATION_SERVICE)) continue;
                for (var i : instructions(method)) {
                    if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target &&
                        "startForeground".equals(target.getName()) && target.getParameterTypes().size() >= 2 &&
                        "I".contentEquals(target.getParameterTypes().get(0)) && "Landroid/app/Notification;".contentEquals(target.getParameterTypes().get(1))) {
                        posters.add(method);
                        break;
                    }
                }
            }
        }
        if (posters.size() != 1 || mediaTargets(posters.get(0)).contains(0)) return List.of();
        return posters;
    }

    static final String PHONE_ID_PROVIDER = ".provider.phoneid";
    static final String GET_PHONE_ID = "com.facebook.GET_PHONE_ID";
    static final String INSTALLED_PACKAGES = "Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;";

    static List<String> methodCalls(Method method) {
        var called = new ArrayList<String>();
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call) called.add(call.toString());
        return called;
    }

    static List<String> params(Method method) {
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        return params;
    }

    /**
     * phone_id_sync: the phoneid requester's static (requester)ArrayList with one getInstalledPackages call, and its
     * instance (String)V that sends GET_PHONE_ID as an ordered broadcast. Taken only while one class holds every
     * phoneid provider query, the sync takes the list and is the app's only GET_PHONE_ID sender, and every other caller
     * of a query also calls the list. Mirrors PhoneIdSync.kt.
     */
    static List<Method> phoneIdSync(List<ClassDef> classes) {
        var requesters = new ArrayList<ClassDef>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (literals(method).contains(PHONE_ID_PROVIDER)) { requesters.add(cls); break; }
        if (requesters.size() != 1) return List.of();
        var requester = requesters.get(0);
        var lists = new ArrayList<Method>();
        var syncs = new ArrayList<Method>();
        var queries = new HashSet<String>();
        for (var method : requester.getMethods()) {
            boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            var called = methodCalls(method);
            if (isStatic && "Ljava/util/ArrayList;".equals(method.getReturnType()) && params(method).equals(List.of(requester.getType())) &&
                called.stream().filter(INSTALLED_PACKAGES::equals).count() == 1) lists.add(method);
            if (!isStatic && "V".equals(method.getReturnType()) && params(method).equals(List.of("Ljava/lang/String;")) &&
                literals(method).contains(GET_PHONE_ID) && called.stream().anyMatch(c -> c.contains(";->sendOrderedBroadcast("))) syncs.add(method);
            if (literals(method).contains(PHONE_ID_PROVIDER)) queries.add(hookId(method));
        }
        if (lists.size() != 1 || syncs.size() != 1) return List.of();
        String list = hookId(lists.get(0)), sync = hookId(syncs.get(0));
        if (!methodCalls(syncs.get(0)).contains(list)) return List.of();
        var senders = new ArrayList<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (literals(method).contains(GET_PHONE_ID)) senders.add(hookId(method));
            var called = methodCalls(method);
            if (queries.contains(hookId(method)) || called.stream().noneMatch(queries::contains)) continue;
            if (!hookId(method).equals(sync) && !called.contains(list)) return List.of();
        }
        if (!senders.equals(List.of(sync))) return List.of();
        return List.of(lists.get(0), syncs.get(0));
    }

    static final String QR_BUTTON = "Lcom/facebook/messaging/payments/plugins/core/qrscannerbutton/ThreadViewTitleBarQRScannerButtonImplementation;";
    static final String QR_BUTTON_NAME = "messaging.payments.core.qrscannerbutton.ThreadViewTitleBarQRScannerButtonImplementation";
    static final String QR_BUTTON_TAG = "thread_view_title_bar_qr_scanner_button";
    static final String THREAD_SCHEME = "Lcom/facebook/messaging/threadview/scheme/interfaces/ThreadViewColorScheme;";
    static final String MIG_SCHEME = "Lcom/facebook/mig/scheme/interfaces/MigColorScheme;";
    static final String COLLECTION_ITERATOR = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;";
    static final String COLLECTION_ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z";
    static final String TOP_BAR_CUT = "Lcom/google/common/collect/ImmutableList;->subList(II)Lcom/google/common/collect/ImmutableList;";
    /** MarkReadButton.MOST_BUTTONS. */
    static final int TOP_BAR_BUTTONS = 3;

    static List<Integer> callArgs(Instruction i) {
        var out = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction f) {
            int[] r = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
            for (int k = 0; k < f.getRegisterCount(); k++) out.add(r[k]);
        } else if (i instanceof RegisterRangeInstruction r) {
            for (int k = 0; k < r.getRegisterCount(); k++) out.add(r.getStartRegister() + k);
        }
        return out;
    }

    /** Whether this may read the register, erring toward yes. Mirrors galleryReads. */
    static boolean mayRead(Instruction i, int register) {
        var op = i.getOpcode().toString();
        boolean onlyWrites = i.getOpcode().setsRegister() && i.getOpcode() != Opcode.CHECK_CAST && !op.endsWith("_2ADDR");
        var read = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction) read.addAll(callArgs(i));
        else if (i instanceof ThreeRegisterInstruction t) {
            if (!onlyWrites) read.add(t.getRegisterA());
            read.add(t.getRegisterB());
            read.add(t.getRegisterC());
        } else if (i instanceof TwoRegisterInstruction t) {
            if (!onlyWrites) read.add(t.getRegisterA());
            read.add(t.getRegisterB());
        } else if (i instanceof OneRegisterInstruction o) {
            if (!onlyWrites) read.add(o.getRegisterA());
        }
        boolean wide = op.contains("WIDE") || op.contains("LONG") || op.contains("DOUBLE");
        for (int r : read) if (r == register || (wide && r + 1 == register)) return true;
        return false;
    }

    /**
     * Which instructions can define the register as it is read at the target: their indices, -1 for none before the
     * method. Null when a branch lands between instructions. Mirrors ReadFlow.definitionsAt.
     */
    static Set<Integer> definitionsAt(Method method, int target, int register) {
        var code = instructions(method);
        int[] address = new int[code.size() + 1];
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) { indexAt.put(address[i], i); address[i + 1] = address[i] + code.get(i).getCodeUnits(); }
        var found = new HashSet<Integer>();
        var seen = new HashSet<Long>();
        var pending = new ArrayDeque<int[]>();
        pending.add(new int[] {0, -1});
        while (!pending.isEmpty()) {
            var state = pending.poll();
            if (!seen.add(((long) state[0] << 32) | (state[1] & 0xffffffffL))) continue;
            int i = state[0], origin = state[1];
            if (i == target) found.add(origin);
            var insn = code.get(i);
            int next = writesRegister(insn, register) ? i : origin;
            if (insn instanceof OffsetInstruction jump && insn.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                Integer landing = indexAt.get(address[i] + jump.getCodeOffset());
                if (landing == null) return null;
                if (code.get(landing) instanceof SwitchPayload payload) {
                    for (var element : payload.getSwitchElements()) {
                        Integer to = indexAt.get(address[i] + element.getOffset());
                        if (to == null) return null;
                        pending.add(new int[] {to, next});
                    }
                } else pending.add(new int[] {landing, next});
            }
            if (insn.getOpcode().canContinue() && i + 1 < code.size()) pending.add(new int[] {i + 1, next});
            if (insn.getOpcode().canThrow()) for (var block : method.getImplementation().getTryBlocks()) {
                if (address[i] < block.getStartCodeAddress() || address[i] >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                for (var handler : block.getExceptionHandlers()) {
                    Integer to = indexAt.get(handler.getHandlerCodeAddress());
                    if (to == null) return null;
                    pending.add(new int[] {to, origin});
                }
            }
        }
        return found;
    }

    static boolean writesRegister(Instruction i, int register) {
        return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction o &&
            (o.getRegisterA() == register || (i.getOpcode().setsWideRegister() && o.getRegisterA() + 1 == register));
    }

    static List<String> refParams(MethodReference m) {
        var out = new ArrayList<String>();
        for (var t : m.getParameterTypes()) out.add(t.toString());
        return out;
    }

    /** Every branch, switch case and catch handler as {source, landing}, a handler's source -1; null if one lands mid-instruction. */
    static List<int[]> edges(Method method) {
        var code = instructions(method);
        int[] at = new int[code.size() + 1];
        for (int i = 0; i < code.size(); i++) at[i + 1] = at[i] + code.get(i).getCodeUnits();
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) indexAt.put(at[i], i);
        var edges = new ArrayList<int[]>();
        for (int i = 0; i < code.size(); i++) {
            if (!(code.get(i) instanceof OffsetInstruction o) || code.get(i).getOpcode() == Opcode.FILL_ARRAY_DATA) continue;
            Integer landing = indexAt.get(at[i] + o.getCodeOffset());
            if (landing == null) return null;
            if (code.get(i).getOpcode() == Opcode.PACKED_SWITCH || code.get(i).getOpcode() == Opcode.SPARSE_SWITCH) {
                if (!(code.get(landing) instanceof SwitchPayload payload)) return null;
                for (var element : payload.getSwitchElements()) {
                    Integer target = indexAt.get(at[i] + element.getOffset());
                    if (target == null) return null;
                    edges.add(new int[] {i, target});
                }
            } else edges.add(new int[] {i, landing});
        }
        for (var block : method.getImplementation().getTryBlocks()) for (var handler : block.getExceptionHandlers()) {
            Integer target = indexAt.get(handler.getHandlerCodeAddress());
            if (target == null) return null;
            edges.add(new int[] {-1, target});
        }
        return edges;
    }

    /** The builder's one walk of the finished list, right after the socket's plugin count. Mirrors markReadSite in MarkReadButton.kt. */
    static int markReadSite(Method bar, int list, int socket, String socketType) {
        var code = instructions(bar);
        int site = -1;
        for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && COLLECTION_ITERATOR.equals(ref(code.get(i)))) {
            if (site >= 0) return -1;
            site = i;
        }
        if (site < 0 || !callArgs(code.get(site)).equals(List.of(list)) || list > 15 || socket > 15) return -1;
        int count = -1;
        for (int i = site - 1; i >= 0 && count < 0; i--) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_STATIC && code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                socketType.equals(m.getDefiningClass()) && refParams(m).equals(List.of(socketType)) && "I".equals(m.getReturnType())) count = i;
        }
        if (count < 0 || !callArgs(code.get(count)).equals(List.of(socket))) return -1;
        for (int i = count + 1; i < site; i++) if (writesRegister(code.get(i), list) || writesRegister(code.get(i), socket)) return -1;
        var edges = edges(bar);
        if (edges == null) return -1;
        for (var e : edges) if (e[1] > count && e[1] <= site && (e[0] < count || e[0] >= site || e[1] == site)) return -1;
        return site;
    }

    /**
     * The top bar keeps its first TOP_BAR_BUTTONS buttons: the subList end is moved from a register whose one reaching
     * definition is that constant. The 585 armv7 bar reuses the register for other values before it sets the cap, so the
     * definition is the one that reaches the cut, not the only write.
     */
    static boolean topBarCapMatches(Method bar) {
        var code = instructions(bar);
        int cut = -1;
        for (int i = 0; i < code.size(); i++) if (TOP_BAR_CUT.equals(ref(code.get(i)))) {
            if (cut >= 0) return false;
            cut = i;
        }
        if (cut < 1) return false;
        var args = callArgs(code.get(cut));
        if (args.size() != 3 || !(code.get(cut - 1) instanceof TwoRegisterInstruction move) || move.getRegisterA() != args.get(2) ||
            !Set.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16).contains(code.get(cut - 1).getOpcode())) return false;
        Integer cap = narrowConstantAt(bar, code, cut - 1, move.getRegisterB(), 0);
        return cap != null && cap == TOP_BAR_BUTTONS;
    }

    /**
     * The narrow constant a register holds at {@code target}, following plain moves to the register they copy. The
     * armv7 bars hoist the listener case into a high register and move it down at the call. Returns null unless
     * one definition reaches each step.
     */
    static Integer narrowConstantAt(Method method, List<Instruction> code, int target, int register, int depth) {
        if (depth < 0) return null;
        var defs = definitionsAt(method, target, register);
        if (defs == null || defs.size() != 1) return null;
        int at = defs.iterator().next();
        if (at < 0) return null;
        var insn = code.get(at);
        if (insn instanceof NarrowLiteralInstruction lit && (insn.getOpcode() == Opcode.CONST_4 || insn.getOpcode() == Opcode.CONST_16 || insn.getOpcode() == Opcode.CONST))
            return lit.getNarrowLiteral();
        if (insn instanceof TwoRegisterInstruction move && insn.getOpcode().name().startsWith("MOVE") &&
            !insn.getOpcode().name().startsWith("MOVE_RESULT")) return narrowConstantAt(method, code, at, move.getRegisterB(), depth - 1);
        return null;
    }

    /**
     * mark_read_bar and mark_read_click: the chat top bar's builder (the one method naming the QR scanner plugin and
     * reading it from the socket) and its shared listener's onClick, taken only when every value the generated button
     * copies from the QR block resolves, the classes and helpers it names are public, the list walk seam and the
     * three-button limit hold, and the listener's onClick has two locals. The newer top bar's factory, the one other
     * caller of the details button's builder, joins mark_read_bar when its return seam holds. Returns bar, click,
     * factory. Mirrors MarkReadButton.kt.
     */
    static List<Method> markReadButton(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        Method bar = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean names = false, reads = false;
            for (var i : instructions(method)) {
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && QR_BUTTON_NAME.equals(s.getString())) names = true;
                if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && QR_BUTTON.equals(f.getType())) reads = true;
            }
            if (!names || !reads) continue;
            if (bar != null) return List.of();
            bar = method;
        }
        if (bar == null) return List.of();
        var c = instructions(bar);
        int name = -1;
        for (int i = 0; i < c.size(); i++) if (c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && QR_BUTTON_NAME.equals(s.getString())) {
            if (name >= 0) return List.of();
            name = i;
        }
        int plugin = -1;
        for (int i = name; i < c.size() && plugin < 0; i++)
            if (c.get(i).getOpcode() == Opcode.IGET_OBJECT && c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && QR_BUTTON.equals(f.getType())) plugin = i;
        if (plugin < 0) return List.of();
        var pluginRead = (TwoRegisterInstruction) c.get(plugin);
        String socketType = ((FieldReference) ((ReferenceInstruction) c.get(plugin)).getReference()).getDefiningClass();
        int add = -1;
        for (int i = plugin; i < c.size() && add < 0; i++) if (COLLECTION_ADD.equals(ref(c.get(i)))) add = i;
        if (add < 0) return List.of();
        int list = callArgs(c.get(add)).get(0);
        var qr = byType.get(QR_BUTTON);
        if (qr == null) return List.of();
        String builder = null, mig = null, builderScheme = null, tagField = null, listenerField = null, iconProvider = null, listener = null, spec = null;
        FieldReference iconRead = null;
        Integer listenerCase = null;
        int listenerRegister = -1;
        var strings = new HashMap<Integer, String>();
        // The button's builder is the one class the block constructs from a label String.
        var builders = new LinkedHashSet<String>();
        for (int i = plugin; i <= add; i++)
            if (c.get(i).getOpcode() == Opcode.INVOKE_DIRECT && c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                "<init>".equals(m.getName()) && refParams(m).equals(List.of("Ljava/lang/String;"))) builders.add(m.getDefiningClass());
        if (builders.size() != 1) return List.of();
        builder = builders.iterator().next();
        for (int i = plugin; i <= add; i++) {
            var insn = c.get(i);
            var r = insn instanceof ReferenceInstruction ri ? ri.getReference() : null;
            if (r instanceof StringReference s && insn instanceof OneRegisterInstruction o) strings.put(o.getRegisterA(), s.getString());
            else if (insn.getOpcode() == Opcode.IGET_OBJECT && r instanceof FieldReference f) {
                if (THREAD_SCHEME.equals(f.getDefiningClass()) && MIG_SCHEME.equals(f.getType())) mig = f.toString();
                if (QR_BUTTON.equals(f.getDefiningClass()) && !THREAD_SCHEME.equals(f.getType()) && !"Landroid/content/Context;".equals(f.getType())) iconRead = f;
            } else if (insn.getOpcode() == Opcode.INVOKE_STATIC && r instanceof MethodReference m && iconRead != null && iconProvider == null &&
                refParams(m).equals(List.of(iconRead.getType())) && m.getReturnType().startsWith("L")) {
                if (c.get(i - 1).getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) c.get(i - 1)).getRegisterA() == callArgs(insn).get(0)) iconProvider = m.toString();
            } else if (insn.getOpcode() == Opcode.IPUT_OBJECT && r instanceof FieldReference f && builder.equals(f.getDefiningClass())) {
                int value = ((TwoRegisterInstruction) insn).getRegisterA();
                if (MIG_SCHEME.equals(f.getType())) builderScheme = f.toString();
                else if ("Ljava/lang/String;".equals(f.getType()) && QR_BUTTON_TAG.equals(strings.get(value))) tagField = f.toString();
                else if (value == listenerRegister) listenerField = f.toString();
            } else if (insn.getOpcode() == Opcode.INVOKE_DIRECT && r instanceof MethodReference m && "<init>".equals(m.getName())) {
                var args = callArgs(insn);
                if (refParams(m).equals(List.of("Ljava/lang/Object;", "I")) && args.size() == 3 && args.get(1) == pluginRead.getRegisterA()) {
                    listener = m.getDefiningClass();
                    // The case is a constant set wherever the method keeps it: the one definition that reaches the call.
                    listenerCase = narrowConstantAt(bar, c, i, args.get(2), 4);
                    listenerRegister = args.get(0);
                } else if (refParams(m).equals(List.of(builder))) spec = m.getDefiningClass();
            }
        }
        if (builder == null || iconRead == null || iconProvider == null || mig == null || builderScheme == null ||
            tagField == null || listenerField == null || listener == null || listenerCase == null || spec == null) return List.of();
        // The plugin keeps more than one lazy of the icon's type, so the field is the one the block reads, by name.
        Field iconField = null;
        for (var f : qr.getFields())
            if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getType().equals(iconRead.getType()) && f.getName().equals(iconRead.getName())) iconField = f;
        if (iconField == null) return List.of();
        var sources = new LinkedHashSet<String>();
        for (var ctor : qr.getMethods()) if ("<init>".equals(ctor.getName())) {
            var ic = instructions(ctor);
            for (int k = 2; k < ic.size(); k++) {
                if (ic.get(k).getOpcode() == Opcode.IPUT_OBJECT && ic.get(k) instanceof ReferenceInstruction store && store.getReference() instanceof FieldReference f &&
                    f.getName().equals(iconField.getName()) && ic.get(k - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && ic.get(k - 2).getOpcode() == Opcode.INVOKE_STATIC &&
                    ic.get(k - 2) instanceof ReferenceInstruction src && src.getReference() instanceof MethodReference m && m.getParameterTypes().isEmpty() &&
                    m.getReturnType().equals(iconField.getType())) sources.add(m.toString());
            }
        }
        if (sources.size() != 1) return List.of();
        String iconSource = sources.iterator().next();
        // The builder keeps its icon in an int field, which a public static helper fills from the provider's result. 585
        // keeps identical copies of it on public classes other than the builder: every copy must resolve the same icon
        // into the same field, and the first by name is used. Mirrors resolveMarkReadRecipe.
        String providerType = iconProvider.substring(iconProvider.indexOf(')') + 1);
        var setters = new TreeMap<String, Method>();
        String setterSteps = null;
        for (var cls : classes) {
            if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) continue;
            for (var m : cls.getMethods()) {
                var ps = params(m);
                if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) ||
                    ps.size() != 3 || !ps.get(1).equals(providerType) || !ps.get(2).equals(builder) || m.getImplementation() == null) continue;
                var steps = iconSetterSteps(m, providerType, builder);
                if (steps == null) continue;
                if (setterSteps != null && !setterSteps.equals(steps)) return List.of();
                setterSteps = steps;
                setters.put(hookId(m), m);
            }
        }
        if (setters.isEmpty()) return List.of();
        var setterMethod = setters.firstEntry().getValue();
        String iconSetter = hookId(setterMethod);
        String iconType = params(setterMethod).get(0);
        var sc = instructions(setterMethod);
        var resolve = (MethodReference) ((ReferenceInstruction) sc.get(0)).getReference();
        var store = (FieldReference) ((ReferenceInstruction) sc.get(2)).getReference();
        // The QR block does the same two steps inline, so the helper is the button's own way of setting an icon.
        boolean resolves = false, stores = false;
        for (int i = plugin; i <= add; i++) {
            if (resolve.toString().equals(ref(c.get(i)))) resolves = true;
            if (c.get(i).getOpcode() == Opcode.IPUT && store.toString().equals(ref(c.get(i)))) stores = true;
        }
        if (!resolves || !stores) return List.of();
        var iconClass = byType.get(iconType);
        if (iconClass == null) return List.of();
        var icons = new LinkedHashSet<String>();
        for (var init : iconClass.getMethods()) if ("<clinit>".equals(init.getName())) {
            var ic = instructions(init);
            for (int k = 0; k < ic.size(); k++) {
                if (!(ic.get(k) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && "ENVELOPE_OPEN".equals(s.getString()))) continue;
                for (int j = k + 1; j < Math.min(ic.size(), k + 8); j++) {
                    if (ic.get(j).getOpcode() == Opcode.SPUT_OBJECT && ic.get(j) instanceof ReferenceInstruction put && put.getReference() instanceof FieldReference f &&
                        iconType.equals(f.getType()) && iconType.equals(f.getDefiningClass())) { icons.add(f.toString()); break; }
                }
            }
        }
        if (icons.size() != 1) return List.of();
        var socketClass = byType.get(socketType);
        if (socketClass == null) return List.of();
        for (var type : List.of("Lcom/facebook/auth/usersession/FbUserSession;", THREAD_KEY, THREAD_SCHEME)) {
            Field only = null;
            for (var f : socketClass.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && type.equals(f.getType())) {
                if (only != null) return List.of();
                only = f;
            }
            if (only == null || !AccessFlags.FINAL.isSet(only.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(only.getAccessFlags())) return List.of();
        }
        var listenerClass = byType.get(listener);
        if (listenerClass == null) return List.of();
        String target = null;
        int targets = 0;
        Method click = null;
        for (var m : listenerClass.getMethods()) {
            if ("<init>".equals(m.getName()) && params(m).equals(List.of("Ljava/lang/Object;", "I")) && m.getImplementation() != null) {
                int p1 = m.getImplementation().getRegisterCount() - 3 + 1;
                for (var i : instructions(m))
                    if (i.getOpcode() == Opcode.IPUT_OBJECT && ((TwoRegisterInstruction) i).getRegisterA() == p1 && i instanceof ReferenceInstruction ri &&
                        ri.getReference() instanceof FieldReference f && listener.equals(f.getDefiningClass()) && "Ljava/lang/Object;".equals(f.getType())) { target = f.toString(); targets++; }
            }
            if ("onClick".equals(m.getName()) && params(m).equals(List.of("Landroid/view/View;")) && "V".equals(m.getReturnType())) {
                if (click != null) return List.of();
                click = m;
            }
        }
        if (target == null || targets != 1 || click == null || click.getImplementation() == null || AccessFlags.STATIC.isSet(click.getAccessFlags())) return List.of();
        // The tap hook writes v0 and v1 before the stock body.
        if (click.getImplementation().getRegisterCount() - 2 < 2) return List.of();
        var builderClass = byType.get(builder);
        var specClass = byType.get(spec);
        if (builderClass == null || specClass == null) return List.of();
        boolean labelled = false;
        for (var m : builderClass.getMethods()) if ("<init>".equals(m.getName()) && params(m).equals(List.of("Ljava/lang/String;"))) labelled = true;
        if (!labelled) return List.of();
        for (var cls : List.of(socketClass, builderClass, specClass, listenerClass)) if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) return List.of();
        for (var helper : List.of(iconSource, iconProvider, iconSetter)) {
            var owner = byType.get(helper.substring(0, helper.indexOf("->")));
            if (owner == null || !AccessFlags.PUBLIC.isSet(owner.getAccessFlags())) return List.of();
            Method found = null;
            for (var m : owner.getMethods()) if (hookId(m).equals(helper)) found = m;
            if (found == null || !AccessFlags.PUBLIC.isSet(found.getAccessFlags()) || !AccessFlags.STATIC.isSet(found.getAccessFlags())) return List.of();
        }
        if (markReadSite(bar, list, pluginRead.getRegisterB(), socketType) < 0 || !topBarCapMatches(bar)) return List.of();
        // The details button's builder: the bar's one call that takes the chat colors last and returns a button.
        var detailsRefs = new LinkedHashSet<String>();
        for (var insn : c)
            if (insn.getOpcode() == Opcode.INVOKE_VIRTUAL && insn instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                spec.equals(m.getReturnType()) && !m.getParameterTypes().isEmpty() &&
                MIG_SCHEME.equals(m.getParameterTypes().get(m.getParameterTypes().size() - 1).toString())) detailsRefs.add(m.toString());
        if (detailsRefs.size() != 1) return List.of();
        String detailsRef = detailsRefs.iterator().next();
        var detailsOwner = byType.get(detailsRef.substring(0, detailsRef.indexOf("->")));
        Method details = null;
        if (detailsOwner != null) for (var m : detailsOwner.getMethods()) if (hookId(m).equals(detailsRef)) details = m;
        if (details == null || !tagsDetails(details, tagField)) return List.of();
        // The newer bar is the one other method that makes the details button.
        Method factory = null;
        String barId = hookId(bar);
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (hookId(m).equals(barId)) continue;
            boolean calls = false;
            for (var i : instructions(m)) if (detailsRef.equals(ref(i))) { calls = true; break; }
            if (!calls) continue;
            if (factory != null) return List.of();
            factory = m;
        }
        if (factory == null || !markReadFactorySite(factory, detailsRef, byType)) return List.of();
        var immutable = byType.get(IMMUTABLE_LIST);
        boolean copies = false;
        if (immutable != null) for (var m : immutable.getMethods())
            if (LIST_COPY.equals(hookId(m)) && AccessFlags.STATIC.isSet(m.getAccessFlags()) && AccessFlags.PUBLIC.isSet(m.getAccessFlags())) copies = true;
        if (!copies) return List.of();
        return List.of(bar, click, factory);
    }

    static final String LIST_BUILD = "Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;";
    static final String LIST_COPY = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;";
    /** MarkReadButton.DETAILS_TAG. */
    static final String DETAILS_TAG = "settings_button";
    static final Set<String> FACTORY_RETURNS = Set.of("Ljava/lang/Object;", "Ljava/lang/Iterable;", "Ljava/util/Collection;", "Ljava/util/List;", IMMUTABLE_LIST);

    /**
     * An icon setter's two steps, "resolve store": the provider resolves the icon (parameter 0) to an int and the builder
     * (parameter 2) stores it in its own int field, and nothing else. Null for any other body. Mirrors iconSetterSteps in MarkReadButton.kt.
     */
    static String iconSetterSteps(Method m, String providerType, String builder) {
        var sc = instructions(m);
        // Static, three one-word parameters: p0 the icon, p1 the provider, p2 the builder.
        int p0 = m.getImplementation().getRegisterCount() - 3;
        if (sc.size() != 4 || p0 < 0 || sc.get(0).getOpcode() != Opcode.INVOKE_VIRTUAL || sc.get(1).getOpcode() != Opcode.MOVE_RESULT ||
            sc.get(2).getOpcode() != Opcode.IPUT || sc.get(3).getOpcode() != Opcode.RETURN_VOID ||
            !(sc.get(0) instanceof ReferenceInstruction rr && rr.getReference() instanceof MethodReference resolve) ||
            !(sc.get(2) instanceof ReferenceInstruction sr && sr.getReference() instanceof FieldReference store) ||
            !resolve.getDefiningClass().equals(providerType) || !refParams(resolve).equals(List.of(params(m).get(0))) || !"I".equals(resolve.getReturnType()) ||
            !store.getDefiningClass().equals(builder) || !"I".equals(store.getType())) return null;
        var put = (TwoRegisterInstruction) sc.get(2);
        if (!callArgs(sc.get(0)).equals(List.of(p0 + 1, p0)) || register(sc.get(1)) != put.getRegisterA() || put.getRegisterB() != p0 + 2) return null;
        return resolve + " " + store;
    }

    /** The details builder stores DETAILS_TAG in the button builder's tag field. */
    static boolean tagsDetails(Method details, String tagField) {
        var dc = instructions(details);
        for (int k = 0; k < dc.size(); k++) {
            if (dc.get(k).getOpcode() != Opcode.IPUT_OBJECT || !tagField.equals(ref(dc.get(k)))) continue;
            int value = ((TwoRegisterInstruction) dc.get(k)).getRegisterA();
            for (int j = k - 1; j >= 0; j--) if (writesRegister(dc.get(j), value)) {
                if (DETAILS_TAG.equals(dc.get(j) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s ? s.getString() : null)) return true;
                break;
            }
        }
        return false;
    }

    /**
     * The newer bar's factory, static or (585) an instance method whose receiver comes before the parameters. Its one
     * call to the details builder reaches exactly one return, of the list an ImmutableList builder just built, directly
     * or (585) through a static helper that only builds it. Returns the details button never reaches, such as 585's
     * early lists, are left alone. Nothing between the build and that return writes the list, branches or is landed on,
     * the account, chat and colors are each one parameter never reassigned, and three low locals are free. Mirrors
     * markReadFactorySite in MarkReadButton.kt.
     */
    static boolean markReadFactorySite(Method factory, String detailsRef, Map<String, ClassDef> byType) {
        if (!FACTORY_RETURNS.contains(factory.getReturnType()) || factory.getImplementation() == null) return false;
        var code = instructions(factory);
        int details = -1;
        for (int i = 0; i < code.size(); i++) if (detailsRef.equals(ref(code.get(i)))) {
            if (details >= 0) return false;
            details = i;
        }
        if (details < 0) return false;
        var reached = reachableFrom(factory, details);
        if (reached == null) return false;
        int site = -1;
        for (int i : reached) if (code.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
            if (site >= 0) return false;
            site = i;
        }
        if (site < 0) return false;
        int list = ((OneRegisterInstruction) code.get(site)).getRegisterA();
        int build = -1;
        for (int i = site - 1; i >= 0 && build < 0; i--) if (LIST_BUILD.equals(ref(code.get(i))) || listBuildHelper(code.get(i), byType)) build = i;
        if (build < 0 || code.get(build + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) code.get(build + 1)).getRegisterA() != list) return false;
        for (int i = build + 2; i < site; i++) if (writesRegister(code.get(i), list) || code.get(i) instanceof OffsetInstruction) return false;
        var edges = edges(factory);
        if (edges == null) return false;
        for (var e : edges) if (e[1] > build && e[1] <= site) return false;
        var types = params(factory);
        int self = AccessFlags.STATIC.isSet(factory.getAccessFlags()) ? 0 : 1;
        int words = self;
        for (var t : types) words += "J".equals(t) || "D".equals(t) ? 2 : 1;
        int first = factory.getImplementation().getRegisterCount() - words;
        var registers = new ArrayList<Integer>();
        for (var type : List.of("Lcom/facebook/auth/usersession/FbUserSession;", THREAD_KEY, MIG_SCHEME)) {
            int at = -1, offset = self;
            for (var t : types) {
                if (t.equals(type)) {
                    if (at >= 0) return false;
                    at = first + offset;
                }
                offset += "J".equals(t) || "D".equals(t) ? 2 : 1;
            }
            if (at < 0) return false;
            registers.add(at);
        }
        for (var i : code) for (int r : registers) if (writesRegister(i, r)) return false;
        int scratch = 0;
        for (int r = 0; r < Math.min(16, first); r++) if (r != list) scratch++;
        return list <= 15 && scratch >= 3;
    }

    /**
     * A call to a static helper that takes an ImmutableList builder and does nothing but build it, null-check it and
     * return the list, which 585's factory builds its button list through. Mirrors isListBuildHelper in MarkReadButton.kt.
     */
    static boolean listBuildHelper(Instruction call, Map<String, ClassDef> byType) {
        if (call.getOpcode() != Opcode.INVOKE_STATIC || !(call instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference m) ||
            !refParams(m).equals(List.of("Lcom/google/common/collect/ImmutableList$Builder;")) || !IMMUTABLE_LIST.equals(m.getReturnType())) return false;
        var owner = byType.get(m.getDefiningClass());
        if (owner == null) return false;
        Method helper = null;
        for (var candidate : owner.getMethods()) if (hookId(candidate).equals(m.toString())) helper = candidate;
        if (helper == null || !AccessFlags.STATIC.isSet(helper.getAccessFlags()) || helper.getImplementation() == null) return false;
        var hc = new ArrayList<>(instructions(helper));
        int p0 = helper.getImplementation().getRegisterCount() - 1;
        // 585's helper null-checks the list before it returns it: a static (Object)V call on the list and nothing else.
        if (hc.size() == 4 && hc.get(2).getOpcode() == Opcode.INVOKE_STATIC && hc.get(2) instanceof ReferenceInstruction ci &&
            ci.getReference() instanceof MethodReference check && refParams(check).equals(List.of("Ljava/lang/Object;")) && "V".equals(check.getReturnType()) &&
            callArgs(hc.get(2)).equals(List.of(register(hc.get(1))))) hc.remove(2);
        return hc.size() == 3 && LIST_BUILD.equals(ref(hc.get(0))) && hc.get(0).getOpcode() == Opcode.INVOKE_VIRTUAL && callArgs(hc.get(0)).equals(List.of(p0)) &&
            hc.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && hc.get(2).getOpcode() == Opcode.RETURN_OBJECT && register(hc.get(1)) == register(hc.get(2));
    }

    /** Every instruction reachable from start, catch handlers included; null when a branch lands between instructions. Mirrors ReadFlow.successors. */
    static Set<Integer> reachableFrom(Method method, int start) {
        var code = instructions(method);
        int[] address = new int[code.size() + 1];
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) { indexAt.put(address[i], i); address[i + 1] = address[i] + code.get(i).getCodeUnits(); }
        var seen = new TreeSet<Integer>();
        var pending = new ArrayDeque<Integer>(List.of(start));
        while (!pending.isEmpty()) {
            int i = pending.poll();
            if (!seen.add(i)) continue;
            var insn = code.get(i);
            if (insn instanceof OffsetInstruction jump && insn.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                Integer landing = indexAt.get(address[i] + jump.getCodeOffset());
                if (landing == null) return null;
                if (code.get(landing) instanceof SwitchPayload payload) {
                    for (var element : payload.getSwitchElements()) {
                        Integer to = indexAt.get(address[i] + element.getOffset());
                        if (to == null) return null;
                        pending.add(to);
                    }
                } else pending.add(landing);
            }
            if (insn.getOpcode().canContinue() && i + 1 < code.size()) pending.add(i + 1);
            if (insn.getOpcode().canThrow()) for (var block : method.getImplementation().getTryBlocks()) {
                if (address[i] < block.getStartCodeAddress() || address[i] >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                for (var handler : block.getExceptionHandlers()) {
                    Integer to = indexAt.get(handler.getHandlerCodeAddress());
                    if (to == null) return null;
                    pending.add(to);
                }
            }
        }
        return seen;
    }

    /**
     * The scan-result reader's shape: an instance (Z)ArrayList with one getScanResults call that also returns a register
     * it loads with null, the answer it gives when Messenger may not read the list.
     */
    static boolean scanResultReader(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Ljava/util/ArrayList;".equals(method.getReturnType())) return false;
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("Z"))) return false;
        var nulls = new HashSet<Integer>();
        var reads = 0;
        for (var i : instructions(method)) {
            if (i.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) i).getNarrowLiteral() == 0) nulls.add(((OneRegisterInstruction) i).getRegisterA());
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call && readsScanResults(call)) reads++;
        }
        if (reads != 1) return false;
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.RETURN_OBJECT && nulls.contains(((OneRegisterInstruction) i).getRegisterA())) return true;
        return false;
    }

    static Map<String, List<Method>> findControls(List<ClassDef> classes) {
        var found = new LinkedHashMap<String, List<Method>>();
        for (var key : CONTROL_KEYS) found.put(key, new ArrayList<>());
        var inboxTypes = new HashMap<String, ClassDef>();
        classes.forEach(c -> inboxTypes.put(c.getType(), c));
        found.get("ai_sticker_cell").addAll(findAiStickerCells(classes));
        found.get("ai_sticker_grid").addAll(findAiStickerGrids(classes));
        var community = communityInbox(classes);
        if (community != null) found.get("community_inbox").add(community.render());
        found.get("emoji_drawer").addAll(emojiDrawerReaders(classes));
        found.get("emoji_search").addAll(emojiSearchWatchers(classes));
        found.get("tab_badges").addAll(tabBadgeDispatchers(classes));
        found.get("facebook_badge").addAll(facebookBadgeChecks(classes));
        found.get("facebook_profile_header").addAll(profileHeaders(classes));
        found.get("tab_config").addAll(tabConfigurations(classes));
        found.get("ai_mentions").addAll(aiMentionDispatchers(classes));
        found.get("ai_commands").addAll(aiCommandLists(classes));
        var searchBars = searchBarBuilders(classes);
        found.get("ai_search_hint").addAll(searchBars);
        found.get("ai_search_screen_hint").addAll(searchScreenHints(classes, searchBars));
        found.get("ai_mention_rows").addAll(aiMentionRowChecks(classes));
        found.get("xhe_audio").addAll(shareCopies(classes));
        found.get("disappearing_swipe").addAll(disappearingSwipeStarts(classes));
        found.get("recent_media").addAll(recentMediaDetectors(classes));
        found.get("hide_read_receipts").addAll(chatSeenBroadcasts(classes));
        found.get("reply_read").addAll(replyReadDispatches(classes));
        found.get("analytics_uploads").addAll(analyticsUploads(classes));
        found.get("analytics_uploads").addAll(boundUploadTasks(classes));
        found.get("analytics_uploads").addAll(xanalyticsUploadTimers(classes));
        found.get("analytics_uploads").addAll(inProcessUploadStarts(classes));
        found.get("attribution_uploads").addAll(attributionUploads(classes));
        found.get("ad_events").addAll(adEvents(classes));
        found.get("mqtt_telemetry").addAll(mqttTelemetry(classes));
        found.get("pinned_chats").addAll(pinnedChatLimit(classes));
        found.get("nearby_scans").addAll(nearbyScans(classes));
        found.get("wifi_identity").addAll(wifiIdentityReads(classes));
        found.get("phone_id_sync").addAll(phoneIdSync(classes));
        found.get("story_hold").addAll(storyHold(classes));
        found.get("share_story").addAll(shareStory(classes));
        found.get("avatar_shape").addAll(avatarShape(classes));
        found.get("quiet_call_ring").addAll(quietCallRing(classes));
        found.get("quiet_call_notification").addAll(quietCallNotification(classes));
        var markRead = markReadButton(classes);
        if (!markRead.isEmpty()) {
            found.get("mark_read_bar").add(markRead.get(0));
            found.get("mark_read_bar").add(markRead.get(2));
            found.get("mark_read_click").add(markRead.get(1));
        }
        found.get("text_style").addAll(textStyleField(classes));
        found.get("message_log").addAll(messageLogHooks(classes));
        found.get("auto_reply").addAll(messageLogHooks(classes));
        found.get("system_camera").addAll(systemCameraLaunches(classes));
        found.get("external_gallery").addAll(externalGalleryHooks(classes));
        customFontHooks(classes).forEach((key, methods) -> found.get(key).addAll(methods));
        // Every viewer method with an entry point's name is checked, whatever its signature, and one that doesn't match
        // leaves the control unresolved, as findControls in ControlHooks.kt clears it then.
        boolean changedViewer = false;
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean candidate = (EPHEMERAL_VIEWER.equals(cls.getType()) && (EPHEMERAL_DIALOGS.contains(method.getName()) || "onResume".equals(method.getName()))) ||
                (QUICKSNAP_VIEWER.equals(cls.getType()) && "onCreateView".equals(method.getName()));
            if (!candidate) continue;
            if (screenshotViewerSites(method).isEmpty()) changedViewer = true;
            else found.get("screenshot_viewers").add(method);
        }
        if (changedViewer) found.get("screenshot_viewers").clear();
        var jewelCandidates = new ArrayList<Map.Entry<Method, Set<String>>>();

        // Collect people jewel key fields
        var peopleJewelKeys = new HashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"<clinit>".equals(m.getName())) continue;
                var impl = m.getImplementation();
                if (impl == null) continue;
                var code = new ArrayList<Instruction>();
                for (var i : impl.getInstructions()) code.add(i);
                boolean hasKey = false;
                for (var i : code) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) {
                        if (PEOPLE_JEWEL_KEY.equals(sr.getString())) { hasKey = true; break; }
                    }
                }
                if (!hasKey) continue;
                for (var i : code) {
                    if (i.getOpcode() == Opcode.SPUT_OBJECT && i instanceof ReferenceInstruction ri) {
                        peopleJewelKeys.add(ri.getReference().toString());
                    }
                }
            }
        }

        // The static field a class initializer stores the story card's last-shown date key in
        var storyCardKeys = new HashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"<clinit>".equals(m.getName()) || m.getImplementation() == null) continue;
                boolean pending = false;
                for (var i : m.getImplementation().getInstructions()) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        STORY_CARD_DATE_KEY.equals(sr.getString())) pending = true;
                    else if (pending && i.getOpcode() == Opcode.SPUT_OBJECT) {
                        storyCardKeys.add(((ReferenceInstruction) i).getReference().toString());
                        pending = false;
                    }
                }
            }
        }

        String msgTextGetterName = "", msgIdGetterName = "", msgIsUnsentGetterName = "";
        String rawText = "", rawId = "", rawUnsent = "";
        outer:
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                var mImpl = m.getImplementation();
                if (mImpl == null) continue;
                var mCode = new ArrayList<Instruction>();
                for (var i : mImpl.getInstructions()) mCode.add(i);
                boolean hasText = false, hasMsgId = false, hasUnsent = false;
                for (var i : mCode) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) {
                        if ("text=".equals(sr.getString())) hasText = true;
                        if ("message_id=".equals(sr.getString())) hasMsgId = true;
                        if ("is_unsent=".equals(sr.getString())) hasUnsent = true;
                    }
                }
                if (!hasText || !hasMsgId || !hasUnsent) continue;
                MethodReference lastRef = null;
                for (var i : mCode) {
                    if (!(i instanceof ReferenceInstruction ri)) continue;
                    var ref = ri.getReference();
                    if (i.getOpcode() == Opcode.INVOKE_INTERFACE && ref instanceof MethodReference mr) {
                        lastRef = mr;
                    } else if (ref instanceof StringReference sr && lastRef != null) {
                        switch (sr.getString()) {
                            case "text=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawText = lastRef.getName(); lastRef = null; } }
                            case "message_id=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawId = lastRef.getName(); lastRef = null; } }
                            case "is_unsent=" -> { if ("Z".equals(lastRef.getReturnType())) { rawUnsent = lastRef.getName(); lastRef = null; } }
                        }
                    }
                }
                break outer;
            }
        }

        if (!rawText.isEmpty()) {
            msgTextGetterName = rawText;
            msgIdGetterName = rawId;
            msgIsUnsentGetterName = rawUnsent;
            for (var wCls : classes) {
                if (!AccessFlags.ABSTRACT.isSet(wCls.getAccessFlags())) continue;
                if (wCls.getInterfaces().size() != 1) continue;
                long instFields = 0; String fieldType = null;
                for (var f : wCls.getFields()) {
                    if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) { instFields++; fieldType = f.getType(); }
                }
                if (instFields != 1 || !"Ljava/util/List;".equals(fieldType)) continue;
                boolean hasGetCount = false;
                for (var wm : wCls.getMethods()) {
                    if ("getCount".equals(wm.getName()) && "I".equals(wm.getReturnType()) && wm.getParameterTypes().isEmpty()) {
                        hasGetCount = true; break;
                    }
                }
                if (!hasGetCount) continue;
                msgTextGetterName = resolveWrapper(wCls, rawText, "Ljava/lang/String;");
                msgIdGetterName = resolveWrapper(wCls, rawId, "Ljava/lang/String;");
                msgIsUnsentGetterName = resolveWrapper(wCls, rawUnsent, "Z");
                break;
            }
        }

        // The app icon manager maps "default" to the start screen and every other icon to a LauncherAlias.
        var appIconManagers = new HashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!"<clinit>".equals(m.getName()) || m.getImplementation() == null) continue;
            var literals = new HashSet<String>();
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) literals.add(sr.getString());
            if (literals.contains("com.facebook.orca.auth.StartScreenActivity") &&
                literals.stream().anyMatch(s -> s.startsWith("com.facebook.orca.LauncherAlias"))) appIconManagers.add(cls.getType());
        }

        var stringTables = stringTables(classes);
        for (var cls : classes) {
            String original = null;
            for (var f : cls.getFields()) {
                if ("__redex_internal_original_name".equals(f.getName())) {
                    var iv = f.getInitialValue();
                    if (iv instanceof StringEncodedValue sev) original = sev.getValue();
                }
            }
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                var instructions = new ArrayList<Instruction>();
                for (var i : impl.getInstructions()) instructions.add(i);
                var refs = new ArrayList<Object>();
                var strings = new HashSet<String>();
                for (var i : instructions) {
                    if (i instanceof ReferenceInstruction ri) {
                        refs.add(ri.getReference());
                        if (ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
                    }
                }
                var paramTypes = method.getParameterTypes().stream()
                    .map(CharSequence::toString).toList();
                boolean gate = "Z".equals(method.getReturnType()) && paramTypes.isEmpty();
                boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());

                // Plugin gates
                if ("Z".equals(method.getReturnType()) &&
                    (paramTypes.isEmpty() ||
                     (isStatic && paramTypes.equals(List.of(cls.getType()))))) {
                    var anchors = new HashSet<>(strings);
                    anchors.addAll(tableStrings(instructions, stringTables));
                    for (var entry : PLUGIN_GATE_ANCHORS.entrySet()) {
                        for (var s : anchors) {
                            if (entry.getValue().contains(s)) {
                                found.get(entry.getKey()).add(method);
                                break;
                            }
                        }
                    }
                }

                // stories
                if (gate && strings.contains("com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch")) {
                    found.get("stories").add(method);
                }

                // app_icons: the icon manager's subscription benefit checks, a static one on the session and, in 585,
                // an instance one that also reads a Context
                if (appIconManagers.contains(cls.getType()) && "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(isStatic ? List.of(BUBBLE_SESSION) : List.of("Landroid/content/Context;", BUBBLE_SESSION)) &&
                    strings.contains("CUSTOM_APP_ICON")) {
                    found.get("app_icons").add(method);
                }

                // facebook, and facebook_profile for a gate that builds only the chat details Profile button
                if (gate) {
                    Set<String> shortcuts = new HashSet<>();
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.NEW_INSTANCE && i instanceof ReferenceInstruction ri &&
                            ri.getReference() instanceof TypeReference tr && FACEBOOK_PLUGINS.contains(tr.getType())) {
                            shortcuts.add(tr.getType());
                        }
                    }
                    if (shortcuts.equals(Set.of(FACEBOOK_PROFILE_BUTTON))) found.get("facebook_profile").add(method);
                    else if (!shortcuts.isEmpty()) found.get("facebook").add(method);
                }

                // ai_menu
                if (gate && (strings.contains("com.facebook.messaging.navigation.plugins.aicreationfolder.folderitem.AiCreationFolderItem") ||
                             strings.contains("com.facebook.messaging.navigation.plugins.aihomefolder.folderitem.AiHomeFolderItem"))) {
                    found.get("ai_menu").add(method);
                }

                // ai_fab
                if (strings.contains("AiFabComponent")) {
                    boolean hasReturnObject = false;
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.RETURN_OBJECT) { hasReturnObject = true; break; }
                    }
                    if (hasReturnObject) found.get("ai_fab").add(method);
                }

                // redex-named run()V methods
                if ("run".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && original != null) {
                    switch (original) {
                        case "InboxSubtabsItemSupplierImplementation$onSubscribe$1" -> found.get("subtabs").add(method);
                        case "ConversationTypingContext$sendActiveStateRunnable$1" -> found.get("typing").add(method);
                        case "SecureWindowUtils$1" -> found.get("allow_screenshot").add(method);
                    }
                }

                // bubbles
                if (gate) {
                    boolean hasSdkInt = false, hasLowRam = false;
                    for (var r : refs) {
                        String rs = r.toString();
                        if ("Landroid/os/Build$VERSION;->SDK_INT:I".equals(rs)) hasSdkInt = true;
                        if ("Landroid/app/ActivityManager;->isLowRamDevice()Z".equals(rs)) hasLowRam = true;
                    }
                    if (hasSdkInt && hasLowRam) found.get("bubbles").add(method);
                }
                if (!isStatic && "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of(BUBBLE_SESSION)) && instructions.stream().anyMatch(i ->
                        i.getOpcode() == Opcode.CONST_WIDE && i instanceof WideLiteralInstruction flag &&
                        flag.getWideLiteral() == BUBBLE_ROLLOUT)) found.get("bubble_mode").add(method);

                // browser: the launcher's own (Uri, session) instance check, which logs no skip reason
                if ("Z".equals(method.getReturnType()) && MESSENGER_BROWSER_LAUNCHER.equals(cls.getType()) && !isStatic &&
                    paramTypes.equals(List.of("Landroid/net/Uri;", BUBBLE_SESSION))) {
                    found.get("browser").add(method);
                }

                // people_jewel, kept once discovery knows the preference getter. It takes the suggestions logger, then its owner.
                if ("Z".equals(method.getReturnType()) && isStatic && paramTypes.size() == 2 && paramTypes.get(1).equals(cls.getType())) {
                    var refIds = refs.stream().map(Object::toString).collect(Collectors.toSet());
                    if (!Collections.disjoint(refIds, peopleJewelKeys)) jewelCandidates.add(Map.entry(method, refIds));
                }

                // ScreenshotContentObserver.onChange
                if ("Lcom/facebook/screenshot/ScreenshotContentObserver;".equals(cls.getType()) &&
                    "onChange".equals(method.getName()) && "V".equals(method.getReturnType())) {
                    found.get("allow_screenshot").add(method);
                }

                // Android 14+ screenshot callback (in-chat notice)
                if ("onScreenCaptured".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && cls.getInterfaces().contains("Landroid/app/Activity$ScreenCaptureCallback;")) {
                    found.get("allow_screenshot").add(method);
                }

                // Media viewers' window lock: FLAG_SECURE through Window.addFlags
                if ("V".equals(method.getReturnType()) && !isStatic &&
                    paramTypes.equals(List.of("Landroid/view/Window;"))) {
                    boolean secureFlag = false, addFlags = false;
                    for (var i : instructions) {
                        if (i instanceof NarrowLiteralInstruction lit && lit.getNarrowLiteral() == 0x2000) secureFlag = true;
                    }
                    for (var r : refs) if ("Landroid/view/Window;->addFlags(I)V".equals(r.toString())) addFlags = true;
                    if (secureFlag && addFlags) found.get("allow_screenshot").add(method);
                }

                // keep_unsent: the instance (Intent, session, String, Map) revoke handler
                if ("V".equals(method.getReturnType()) && !isStatic && paramTypes.equals(REVOKE_HANDLER) &&
                    strings.stream().anyMatch(s -> s.contains("ACTION_REVOKE_MESSAGE"))) {
                    found.get("keep_unsent").add(method);
                }

                // unsent_indicator
                if (!msgTextGetterName.isEmpty() &&
                    method.getName().equals(msgTextGetterName) &&
                    "Ljava/lang/String;".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("I")) &&
                    AccessFlags.ABSTRACT.isSet(cls.getAccessFlags()) &&
                    cls.getInterfaces().size() == 1) {
                    long instanceFieldCount = 0;
                    boolean hasListField = false;
                    for (var f : cls.getFields()) {
                        if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) {
                            instanceFieldCount++;
                            if ("Ljava/util/List;".equals(f.getType())) hasListField = true;
                        }
                    }
                    boolean hasGetCount = false;
                    for (var m : cls.getMethods()) {
                        if ("getCount".equals(m.getName()) && "I".equals(m.getReturnType()) &&
                            m.getParameterTypes().isEmpty()) { hasGetCount = true; break; }
                    }
                    if (instanceFieldCount == 1 && hasListField && hasGetCount) {
                        found.get("unsent_indicator").add(method);
                    }
                }

                // delta_unsent
                if (!msgIsUnsentGetterName.isEmpty() &&
                    method.getName().equals(msgIsUnsentGetterName) &&
                    "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("I")) &&
                    AccessFlags.ABSTRACT.isSet(cls.getAccessFlags()) &&
                    cls.getInterfaces().size() == 1) {
                    long instanceFieldCount2 = 0;
                    boolean hasListField2 = false;
                    for (var f : cls.getFields()) {
                        if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) {
                            instanceFieldCount2++;
                            if ("Ljava/util/List;".equals(f.getType())) hasListField2 = true;
                        }
                    }
                    boolean hasGetCount2 = false;
                    for (var m : cls.getMethods()) {
                        if ("getCount".equals(m.getName()) && "I".equals(m.getReturnType()) &&
                            m.getParameterTypes().isEmpty()) { hasGetCount2 = true; break; }
                    }
                    if (instanceFieldCount2 == 1 && hasListField2 && hasGetCount2) {
                        found.get("delta_unsent").add(method);
                    }
                }

                // ai_search
                if ("Z".equals(method.getReturnType()) && isStatic &&
                    paramTypes.equals(List.of(cls.getType())) &&
                    strings.stream().anyMatch(s -> s.contains("SearchAiagentImplementationsKillSwitch"))) {
                    found.get("ai_search").add(method);
                }

                // original_photo: the encrypted-chat photo transcoder's entry points, its config and its Java decode, named the same in every build
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) &&
                    !isStatic && ORIGINAL_PHOTO_HOOKS.contains(hookId(method))) {
                    found.get("original_photo").add(method);
                }

                // original_video: the video transcoder's private worker, which holds the passthrough size check
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) && !isStatic &&
                    ORIGINAL_VIDEO_HOOK.equals(hookId(method)) && strings.contains("mci_video_passthrough") && videoPassthroughSite(method)) {
                    found.get("original_video").add(method);
                }

                // xhe_transcode: the same worker, counted only when its first String still reaches Messenger's source Uri parse
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) && !isStatic &&
                    ORIGINAL_VIDEO_HOOK.equals(hookId(method)) && strings.contains("mci_video_passthrough") && transcodeSourceParsed(method)) {
                    found.get("xhe_transcode").add(method);
                }

                // emoji_typeface: Messenger's emoji getter, counted only when its downloaded font holder proves out (#34)
                if ("Landroid/graphics/Typeface;".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && !isStatic &&
                    strings.contains("FacebookEmojiTypefaceProviderImpl") && emojiFontHolder(inboxTypes, method) != null) {
                    found.get("emoji_typeface").add(method);
                }

                // typing_mailbox: the msys call that sends typing in encrypted chats
                if (paramTypes.equals(List.of("Ljava/lang/String;", "Z")) &&
                    strings.contains("setTypingIndicatorForThreadWithThreadIdentifier")) {
                    found.get("typing_mailbox").add(method);
                }

                // anonymous_stories: the story mark-read handler that reports a viewed card
                if ("V".equals(method.getReturnType()) && paramTypes.equals(List.of(MONTAGE_CARD, "Z")) &&
                    !isStatic && strings.contains("MontageMsysMarkReadHandler")) {
                    found.get("anonymous_stories").add(method);
                }

                // anonymous_stories: the story preview's constructor, where a card opened anonymously loses its new-story ring (#35)
                if (MONTAGE_BUCKET_PREVIEW.equals(cls.getType()) && "<init>".equals(method.getName()) && paramTypes.contains(MONTAGE_CARD)) {
                    found.get("anonymous_stories").add(method);
                }

                // save_stories: the story viewer's More options menu, which adds Save to your own story's menu
                if ("onClick".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("Landroid/view/View;")) && strings.contains("toolbar_click_menu_button")) {
                    found.get("save_stories").add(method);
                }

                // chat_animation: androidx's answer of no animation, which every fragment is asked for first
                if (FRAGMENT_ANIMATION.equals(hookId(method))) found.get("chat_animation").add(method);

                // chat_fragment and chat_inbox: the chat and the inbox under it, named by the constructor androidx needs
                if ("<init>".equals(method.getName()) && paramTypes.isEmpty()) {
                    if ("MsysThreadViewFragment".equals(original)) found.get("chat_fragment").add(method);
                    if ("M4TabNavigationFragment".equals(original)) found.get("chat_inbox").add(method);
                }

                // chat_legacy: the chat fragment on Messenger's older route, which loads its own animation
                if ("ThreadViewFragment".equals(original) &&
                    (cls.getType() + "->onCreateAnimation(IZI)" + ANIMATION).equals(hookId(method))) {
                    found.get("chat_legacy").add(method);
                }

                // growth_notes: the launcher every notes tip sheet (Make my notes public, Add lyrics) goes through
                if (!isStatic && "Ljava/lang/Object;".equals(method.getReturnType()) &&
                    strings.contains("NotesMigNuxBottomSheet") && strings.contains("arg_nux_type")) {
                    found.get("growth_notes").add(method);
                }

                // growth_story_card: the daily cap check the story viewer's Share your own story card waits on
                if (isStatic && "Z".equals(method.getReturnType()) && paramTypes.equals(List.of(cls.getType())) &&
                    refs.stream().anyMatch(r -> storyCardKeys.contains(r.toString()))) {
                    found.get("growth_story_card").add(method);
                }

                // people_tab: the People tab suggestion handler handing its list and filter map to the tab
                if ("V".equals(method.getReturnType()) && isStatic && paramTypes.equals(List.of(cls.getType())) &&
                    refs.stream().anyMatch(r -> r instanceof MethodReference mr && "V".equals(mr.getReturnType()) &&
                        mr.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of(IMMUTABLE_LIST, "Ljava/util/Map;"))) &&
                    classReferencesType(cls, PEOPLE_TAB_FETCH)) {
                    found.get("people_tab").add(method);
                }

                // people_search: the search screen's empty-state suggestions source
                if (!isStatic && strings.contains("PeopleYouMayKnowSectionDataSource") &&
                    strings.contains("Failed to load people you may know")) {
                    found.get("people_search").add(method);
                }

                // people_story: the story viewer's once-per-viewer request for a page of suggested people
                if ("V".equals(method.getReturnType()) && isStatic && paramTypes.equals(List.of(cls.getType())) &&
                    (strings.contains("MsgrPeopleYouMayKnowQuery") ||
                        tableStrings(instructions, stringTables).contains("MsgrPeopleYouMayKnowQuery"))) {
                    found.get("people_story").add(method);
                }

                // people_inbox_refresh: the chat list supplier's items read, counted only when the whole refresh route proves out
                if (INBOX_SUPPLIER.equals(cls.getType()) && !isStatic && IMMUTABLE_LIST.equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && strings.contains(INBOX_ITEMS_TRACE) && inboxRefreshRoute(inboxTypes, method) != null) {
                    found.get("people_inbox_refresh").add(method);
                }

                // avatar_tabs: the sticker keyboard's tab list, filled inline in a composer factory method that
                // copies it into a builder once and returns the built list.
                if (IMMUTABLE_LIST.equals(method.getReturnType()) && keyboardTabCopy(method) &&
                    "Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;".equals(cls.getType()) &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(
                        "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;->")) &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(IMMUTABLE_LIST + "->builder()"))) {
                    found.get("avatar_tabs").add(method);
                }

                // menu_settings: Settings folder builder, grid binder, folder click and legacy section refresh.
                if ("Ljava/util/ArrayList;".equals(method.getReturnType()) && paramTypes.size() == 1 && !isStatic &&
                    strings.stream().anyMatch(s -> s.contains("settingsfolder.folderitem.SettingsFolderItem"))) {
                    found.get("menu_settings").add(method);
                }
                if ("V".equals(method.getReturnType()) && paramTypes.size() == 2 && "I".equals(paramTypes.get(1)) &&
                    !isStatic && strings.contains("Unknown ViewHolder")) {
                    found.get("menu_settings").add(method);
                }
                if ("onClick".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("Landroid/view/View;")) &&
                    strings.contains("HomeDrawerFragmentBase.handleOnFolderSelected")) {
                    found.get("menu_settings").add(method);
                }
                if ("V".equals(method.getReturnType()) && paramTypes.isEmpty() && !isStatic &&
                    strings.contains("HomeDrawerFragmentBase.refreshDrawerItems")) {
                    found.get("menu_settings").add(method);
                }
            }
        }
        // ai_search_chip: the first component with a render method that the search field creates.
        Method searchField = null;
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"render".equals(m.getName()) || m.getImplementation() == null) continue;
                for (var i : m.getImplementation().getInstructions()) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        "messenger_search_clear_button_tag".equals(sr.getString())) searchField = m;
                }
            }
        }
        if (searchField != null) {
            var byType = new HashMap<String, ClassDef>();
            for (var cls : classes) byType.put(cls.getType(), cls);
            chip:
            for (var i : searchField.getImplementation().getInstructions()) {
                if (i.getOpcode() != Opcode.NEW_INSTANCE || !(i instanceof ReferenceInstruction ri) ||
                    !(ri.getReference() instanceof TypeReference tr)) continue;
                var cls = byType.get(tr.getType());
                if (cls == null) continue;
                boolean renders = false;
                for (var m : cls.getMethods()) if ("render".equals(m.getName())) renders = true;
                if (!renders) continue;
                for (var m : cls.getMethods()) {
                    if ("render".equals(m.getName()) && m.getReturnType().equals(searchField.getReturnType())) {
                        found.get("ai_search_chip").add(m);
                    }
                }
                break chip;
            }
        }
        // menu_settings: the plain-list drawer items setter lives in the class that creates the grid binder.
        String gridBinderType = null;
        for (var m : found.get("menu_settings")) {
            if ("V".equals(m.getReturnType()) && m.getParameterTypes().size() == 2 &&
                "I".equals(m.getParameterTypes().get(1).toString())) {
                gridBinderType = m.getDefiningClass();
                break;
            }
        }
        if (gridBinderType != null) {
            outer:
            for (var cls : classes) {
                for (var m : cls.getMethods()) {
                    var impl = m.getImplementation();
                    if (impl == null) continue;
                    for (var i : impl.getInstructions()) {
                        if (i.getOpcode() != Opcode.NEW_INSTANCE || !(i instanceof ReferenceInstruction ri) ||
                            !(ri.getReference() instanceof TypeReference tr) || !gridBinderType.equals(tr.getType())) continue;
                        Method setter = null;
                        int setters = 0;
                        for (var candidate : cls.getMethods()) {
                            if ("V".equals(candidate.getReturnType()) && !AccessFlags.STATIC.isSet(candidate.getAccessFlags()) &&
                                candidate.getParameterTypes().size() == 1 &&
                                "Ljava/util/List;".equals(candidate.getParameterTypes().get(0).toString())) {
                                setter = candidate;
                                setters++;
                            }
                        }
                        if (setters == 1) found.get("menu_settings").add(setter);
                        break outer;
                    }
                }
            }
        }
        // The Notifications tab reads its preference through the getter the external-browser check uses.
        var read = browserPreferenceRead(found.get("browser"));
        for (var candidate : jewelCandidates) {
            if (read != null && candidate.getValue().contains(read.getter())) found.get("people_jewel").add(candidate.getKey());
        }
        // The patches refuse these hooks without a free local register, mostly for the scratch v0 their edits write.
        for (var key : NEEDS_A_LOCAL) {
            var methods = found.get(key);
            // ad_events' visibility callback reuses its event register, so only the static entry event needs a local.
            if (methods != null && methods.stream().anyMatch(m -> !hasLocal(m) &&
                (!"ad_events".equals(key) || AccessFlags.STATIC.isSet(m.getAccessFlags())))) methods.clear();
        }
        return found;
    }

    /**
     * Every hook whose method the patches refuse when it has no local register, through validateScratch or a register
     * check of its own. The control tests' zero-local check (MirroredFinders.kt) fails when this set and the patches part.
     */
    static final Set<String> NEEDS_A_LOCAL = Set.of("ad_events", "ai_commands", "ai_fab", "ai_mention_rows", "ai_menu", "ai_search",
        "ai_search_chip", "allow_screenshot", "analytics_uploads", "app_icons", "attribution_uploads", "bubbles", "delta_unsent",
        "disappearing_swipe", "external_gallery", "facebook", "facebook_profile", "font_by_name", "font_repository", "growth_notes", "growth_story_card", "keep_unsent",
        "mqtt_telemetry", "nearby_scans", "original_photo", "people_story", "phone_id_sync", "people_tab", "recent_media", "stories", "system_camera",
        "tab_badges", "typing", "unsent_indicator");

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
        }
        return abis;
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
     * What LegacyDrawer.kt's prepareLegacyDrawer checks in Messenger before Open settings from menu edits anything: the
     * side menu's refresh handoff, the Settings row and its icon, the Settings key, the metadata map and the native
     * section. Its checks on HushMessenger's own extension stub and helpers are left out, since a stock APK has none.
     * A miss here is the same miss that stops the patch, reported before anyone patches.
     */
    static List<String> legacyDrawerProblems(List<ClassDef> classes, List<Method> menu) {
        var adds = menu.stream().filter(m -> "Ljava/util/ArrayList;".equals(m.getReturnType())).toList();
        var refreshes = menu.stream().filter(m -> "V".equals(m.getReturnType()) && m.getParameterTypes().isEmpty()).toList();
        if (adds.size() != 1 || refreshes.size() != 1)
            return List.of("legacy drawer needs one menu builder and one refresh, found " + adds.size() + " and " + refreshes.size());
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        try {
            new LegacyDrawer(byType).check(refreshes.get(0), adds.get(0));
            return List.of();
        } catch (LegacyDrawer.Changed e) {
            return List.of(e.getMessage());
        } catch (RuntimeException e) {
            // The patch would stop on the same surprise, just with a stack trace instead of a reason.
            return List.of("legacy drawer preflight stopped: " + e);
        }
    }

    /** LegacyDrawer.kt's checks, line for line, with its PatchException messages. */
    static final class LegacyDrawer {
        static final String MODEL = "Lcom/facebook/messaging/navigation/home/drawer/model/";
        static final String KEY = MODEL + "DrawerFolderKey;";
        static final String SETTINGS_KEY = MODEL + "SettingsFolderKey;";
        static final String METADATA = "Lcom/facebook/xapp/messaging/map/HeterogeneousMap;";
        static final String SECTION = "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/settingsfoldersection/SettingsDrawerFolderSectionImplementation;";
        static final String REFRESH = "HomeDrawerFragmentBase.refreshDrawerItems";
        static final String CONTEXT = "Landroid/content/Context;";
        static final String LIST = "Ljava/util/List;";
        static final String INTEGER = "Ljava/lang/Integer;";
        static final String STRING = "Ljava/lang/String;";
        static final String FRAGMENT = "Landroidx/fragment/app/Fragment;";
        static final Set<Opcode> OBJECT_MOVES = EnumSet.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);

        static final class Changed extends RuntimeException {
            Changed(String detail) { super("legacy drawer " + detail); }
        }

        final Map<String, ClassDef> classes;
        LegacyDrawer(Map<String, ClassDef> classes) { this.classes = classes; }

        static Changed changed(String detail) { return new Changed(detail); }
        static List<Instruction> code(Method m) {
            if (m.getImplementation() == null) throw changed(m.getName() + " has no code");
            return instructions(m);
        }
        static List<String> params(MethodReference m) {
            var out = new ArrayList<String>();
            for (var p : m.getParameterTypes()) out.add(p.toString());
            return out;
        }
        static Object reference(Instruction i) { return i instanceof ReferenceInstruction r ? r.getReference() : null; }
        static boolean is(AccessFlags flag, int flags) { return flag.isSet(flags); }
        static List<Method> methods(ClassDef c) {
            var out = new ArrayList<Method>();
            c.getMethods().forEach(out::add);
            return out;
        }
        static List<Field> fields(ClassDef c) {
            var out = new ArrayList<Field>();
            c.getFields().forEach(out::add);
            return out;
        }
        static boolean folderKey(String type) { return type.startsWith(MODEL) && type.endsWith("FolderKey;"); }
        static boolean definesEquality(ClassDef c) {
            return methods(c).stream().anyMatch(m -> m.getName().equals("equals") || m.getName().equals("hashCode"));
        }

        /** Follow one register only within its straight-line path; an incoming branch makes its value ambiguous. */
        static int origin(Method m, int before, int register) {
            var code = code(m);
            var landings = mediaTargets(m);
            int wanted = register;
            for (int i = before - 1; i >= 0; i--) {
                var instruction = code.get(i);
                if (instruction instanceof OffsetInstruction || landings.contains(i + 1)) throw changed(m.getName() + " has ambiguous model values");
                if (!instruction.getOpcode().setsRegister() || register(instruction) != wanted) continue;
                if (OBJECT_MOVES.contains(instruction.getOpcode())) wanted = ((TwoRegisterInstruction) instruction).getRegisterB();
                else return i;
            }
            throw changed(m.getName() + " has an uninitialized model value");
        }

        /** The only folder row built with SettingsFolderKey.A00 as its key. */
        static int settingsRowCall(Method add) {
            var code = code(add);
            var settings = new ArrayList<Integer>();
            for (int i = 0; i < code.size(); i++) {
                if (code.get(i).getOpcode() != Opcode.INVOKE_DIRECT_RANGE || !(reference(code.get(i)) instanceof MethodReference call) ||
                    !"<init>".equals(call.getName()) || params(call).size() <= 3 || !KEY.equals(params(call).get(3))) continue;
                var args = callArgs(code.get(i));
                if (args.size() <= 4) throw changed("settings row key is missing");
                int key = origin(add, i, args.get(4));
                if (code.get(key).getOpcode() == Opcode.SGET_OBJECT && (SETTINGS_KEY + "->A00:" + SETTINGS_KEY).equals(ref(code.get(key))))
                    settings.add(i);
            }
            if (settings.size() != 1) throw changed("builder makes " + settings.size() + " Settings rows, expected 1");
            return settings.get(0);
        }

        /** ControlHooks.kt's menuFolderItemType: the row class, when the builder makes only rows, one inline icon and folder keys. */
        static String menuFolderItemType(Method add) {
            var code = code(add);
            var types = new LinkedHashSet<String>();
            for (var i : code) if (i.getOpcode() == Opcode.NEW_INSTANCE) types.add(((TypeReference) reference(i)).getType());
            int rowCall = settingsRowCall(add);
            String row = ((MethodReference) reference(code.get(rowCall))).getDefiningClass();
            var extras = types.stream().filter(t -> !t.equals(row) && !folderKey(t)).toList();
            int iconAt = -1;
            var rowArgs = callArgs(code.get(rowCall));
            if (extras.size() == 1 && rowArgs.size() > 3) iconAt = origin(add, rowCall, rowArgs.get(3));
            String icon = null;
            if (iconAt >= 0 && code.get(iconAt).getOpcode() == Opcode.NEW_INSTANCE) {
                String type = ((TypeReference) reference(code.get(iconAt))).getType();
                var inserted = iconAt + 1 < code.size() ? code.get(iconAt + 1) : null;
                if (type.equals(extras.get(0)) && inserted instanceof FiveRegisterInstruction five && inserted.getOpcode() == Opcode.INVOKE_DIRECT &&
                    reference(inserted) instanceof MethodReference ctor && ctor.getDefiningClass().equals(type) && "<init>".equals(ctor.getName()) &&
                    five.getRegisterC() == register(code.get(iconAt))) icon = type;
            }
            boolean unexpected = !types.contains(row);
            for (var type : types) if (!type.equals(row) && !type.equals(icon) && !folderKey(type)) unexpected = true;
            if (unexpected) throw changed("menu settings item builder creates " + types.size() + " types, expected its rows, icons and folder keys");
            return row;
        }

        void refresh(Method m) {
            var code = code(m);
            int registers = m.getImplementation().getRegisterCount();
            long markers = code.stream().filter(i -> reference(i) instanceof StringReference s && REFRESH.equals(s.getString())).count();
            if (!m.getParameterTypes().isEmpty() || !"V".equals(m.getReturnType()) || is(AccessFlags.STATIC, m.getAccessFlags()) ||
                registers < 1 || registers > 16 || markers != 1) throw changed("refresh signature changed");
            int receiver = registers - 1;
            var candidates = new ArrayList<Integer>();
            for (int i = 0; i < code.size(); i++)
                if (code.get(i).getOpcode() == Opcode.IPUT_OBJECT && reference(code.get(i)) instanceof FieldReference f &&
                    f.getDefiningClass().equals(m.getDefiningClass()) && "A0G".equals(f.getName()) && LIST.equals(f.getType())) candidates.add(i);
            if (candidates.size() != 1 || candidates.get(0) < 2) throw changed("refresh must store one section list");
            int store = candidates.get(0);
            var put = (TwoRegisterInstruction) code.get(store);
            var call = code.get(store - 2);
            if (!(reference(call) instanceof MethodReference producer)) throw changed("refresh section producer changed");
            var producerArgs = callArgs(call);
            var landings = mediaTargets(m);
            if (put.getRegisterB() != receiver || put.getRegisterA() == receiver || put.getRegisterA() < 0 || put.getRegisterA() >= registers ||
                code.get(store - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(code.get(store - 1)) != put.getRegisterA() ||
                call.getOpcode() != Opcode.INVOKE_INTERFACE || !"Ljava/util/ArrayList;".equals(producer.getReturnType()) ||
                !producer.getParameterTypes().isEmpty() || producerArgs.size() != 1 ||
                producerArgs.get(0) < 0 || producerArgs.get(0) >= registers ||
                landings.contains(store - 1) || landings.contains(store)) throw changed("refresh list handoff changed");
            var owner = classes.get(m.getDefiningClass());
            if (owner == null) throw changed("refresh owner is missing");
            if (fields(owner).stream().filter(f -> !is(AccessFlags.STATIC, f.getAccessFlags()) && "A0G".equals(f.getName()) &&
                LIST.equals(f.getType())).count() != 1) throw changed("refresh list field changed");
            var provider = classes.get(producer.getDefiningClass());
            if (provider == null) throw changed("section provider is missing");
            String producerId = producer.toString();
            if (!is(AccessFlags.INTERFACE, provider.getAccessFlags()) || methods(provider).stream()
                .filter(p -> hookId(p).equals(producerId) && !is(AccessFlags.STATIC, p.getAccessFlags())).count() != 1)
                throw changed("section provider changed");
            ClassDef ancestor = owner;
            for (int depth = 0; depth < 32; depth++) {
                if (ancestor != null && FRAGMENT.equals(ancestor.getType())) {
                    var getters = methods(ancestor).stream().filter(g -> g.getName().equals("getContext") && g.getParameterTypes().isEmpty() &&
                        CONTEXT.equals(g.getReturnType()) && is(AccessFlags.PUBLIC, g.getAccessFlags()) &&
                        !is(AccessFlags.STATIC, g.getAccessFlags())).toList();
                    if (getters.size() != 1) throw changed("fragment context getter changed");
                    if (getters.get(0).getImplementation() == null) throw changed("fragment context getter has no code");
                    return;
                }
                ancestor = ancestor == null || ancestor.getSuperclass() == null ? null : classes.get(ancestor.getSuperclass());
            }
            throw changed("refresh owner is not a supported fragment");
        }

        ClassDef type(String name) {
            var model = classes.get(name);
            if (model == null || !is(AccessFlags.PUBLIC, model.getAccessFlags())) throw changed("model " + name + " is missing or inaccessible");
            return model;
        }

        ClassDef allocatable(String name) {
            var model = type(name);
            if (is(AccessFlags.ABSTRACT, model.getAccessFlags()) || is(AccessFlags.INTERFACE, model.getAccessFlags()))
                throw changed("model " + name + " cannot be allocated");
            return model;
        }

        /** All factory arguments checked here are nonnull. That path must return without doing any work. */
        void nullCheck(MethodReference call) {
            String id = call.toString();
            var checks = methods(type(call.getDefiningClass())).stream().filter(m -> hookId(m).equals(id)).toList();
            if (checks.size() != 1) throw changed("model null check is missing");
            var check = checks.get(0);
            var body = code(check);
            int registers = check.getImplementation().getRegisterCount();
            var first = body.isEmpty() ? null : body.get(0);
            if (!is(AccessFlags.PUBLIC, check.getAccessFlags()) || !is(AccessFlags.STATIC, check.getAccessFlags()) ||
                !check.getImplementation().getTryBlocks().isEmpty() || registers < 2 || first == null ||
                first.getOpcode() != Opcode.IF_NEZ || register(first) != registers - 2 || !(first instanceof OffsetInstruction))
                throw changed("model null check changed");
            int offset = ((OffsetInstruction) first).getCodeOffset();
            int address = 0;
            Instruction target = null;
            for (var instruction : body) {
                if (address == offset) { target = instruction; break; }
                address += instruction.getCodeUnits();
            }
            if (target == null || target.getOpcode() != Opcode.RETURN_VOID) throw changed("model null check has side effects on nonnull values");
        }

        void field(FieldReference reference, boolean isStatic) {
            var found = fields(type(reference.getDefiningClass())).stream()
                .filter(f -> f.getName().equals(reference.getName()) && f.getType().equals(reference.getType())).toList();
            if (found.size() != 1) throw changed("model field " + reference + " is missing");
            if (!is(AccessFlags.PUBLIC, found.get(0).getAccessFlags()) || is(AccessFlags.STATIC, found.get(0).getAccessFlags()) != isStatic)
                throw changed("model field " + reference + " changed access");
        }

        /** The name an enum constant is declared with: its initializer loads exactly one string after the previous store. */
        String enumName(FieldReference constant) {
            var inits = methods(type(constant.getDefiningClass())).stream().filter(m -> m.getName().equals("<clinit>")).toList();
            if (inits.size() != 1) throw changed("enum " + constant.getDefiningClass() + " has no initializer");
            var code = code(inits.get(0));
            var stores = new ArrayList<Integer>();
            for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.SPUT_OBJECT) stores.add(i);
            var matching = stores.stream().filter(i -> constant.toString().equals(ref(code.get(i)))).toList();
            if (matching.size() != 1) throw changed("enum constant " + constant + " is not stored once");
            int store = matching.get(0);
            int previous = -1;
            for (int at : stores) if (at < store) previous = at;
            var names = new ArrayList<String>();
            for (int i = previous + 1; i < store; i++) if (reference(code.get(i)) instanceof StringReference s) names.add(s.getString());
            if (names.size() != 1) throw changed("enum constant " + constant + " has no single name");
            return names.get(0);
        }

        boolean subtype(String child, String parent) {
            var pending = new ArrayDeque<String>();
            var seen = new HashSet<String>();
            pending.add(child);
            while (!pending.isEmpty() && seen.size() < 32) {
                String name = pending.removeFirst();
                if (name.equals(parent)) return true;
                if (!seen.add(name)) continue;
                var model = classes.get(name);
                if (model == null) continue;
                if (model.getSuperclass() != null) pending.add(model.getSuperclass());
                pending.addAll(model.getInterfaces());
            }
            return false;
        }

        /** Constructors may only check allowed arguments, invoke Object's constructor and store their own parameters. */
        Method constructor(String owner, List<String> params, List<String> names, Set<Integer> checked, boolean isPublic, boolean allocated) {
            var model = allocated ? allocatable(owner) : type(owner);
            var ctors = methods(model).stream().filter(m -> m.getName().equals("<init>") && params(m).equals(params)).toList();
            if (ctors.size() != 1) throw changed("model constructor " + owner + " changed");
            var method = ctors.get(0);
            if (!"V".equals(method.getReturnType()) || is(AccessFlags.STATIC, method.getAccessFlags()) ||
                (isPublic && !is(AccessFlags.PUBLIC, method.getAccessFlags())) ||
                (method.getImplementation() != null && !method.getImplementation().getTryBlocks().isEmpty()))
                throw changed("model constructor " + owner + " changed access");
            var code = code(method);
            int receiver = method.getImplementation().getRegisterCount() - params.size() - 1;
            if (receiver < 0 || code.isEmpty() || code.get(code.size() - 1).getOpcode() != Opcode.RETURN_VOID ||
                code.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count() != 1) throw changed("model constructor " + owner + " changed exits");
            var declared = fields(model).stream().filter(f -> !is(AccessFlags.STATIC, f.getAccessFlags())).map(Field::getName).toList();
            if (!new HashSet<>(declared).equals(new HashSet<>(names)) || declared.size() != names.size())
                throw changed("model fields " + owner + " changed");
            var writes = new HashSet<Integer>();
            int baseCalls = 0;
            for (var instruction : code) switch (instruction.getOpcode()) {
                case IPUT_OBJECT, IPUT_BOOLEAN -> {
                    if (!(reference(instruction) instanceof FieldReference stored)) throw changed("model store changed");
                    int slot = names.indexOf(stored.getName());
                    var store = (TwoRegisterInstruction) instruction;
                    if (slot < 0 || !stored.getDefiningClass().equals(owner) || !stored.getType().equals(params.get(slot)) ||
                        store.getRegisterB() != receiver || store.getRegisterA() != receiver + slot + 1 || !writes.add(slot) ||
                        (instruction.getOpcode() == Opcode.IPUT_BOOLEAN) != "Z".equals(params.get(slot)))
                        throw changed("model parameter store changed");
                    field(stored, false);
                }
                case INVOKE_DIRECT -> {
                    if (!"Ljava/lang/Object;-><init>()V".equals(ref(instruction)) || !callArgs(instruction).equals(List.of(receiver)))
                        throw changed("model constructor " + owner + " has an unsupported call");
                    baseCalls++;
                }
                case INVOKE_STATIC -> {
                    if (!(reference(instruction) instanceof MethodReference call)) throw changed("model check changed");
                    var arguments = callArgs(instruction);
                    if (!"V".equals(call.getReturnType()) || !params(call).equals(List.of("Ljava/lang/Object;", "I")) || arguments.size() != 2 ||
                        !checked.contains(arguments.get(0) - receiver - 1))
                        throw changed("model constructor " + owner + " checks unsupported parameters");
                    nullCheck(call);
                }
                case CONST_4 -> {
                    if (register(instruction) >= receiver) throw changed("model constructor " + owner + " overwrites a parameter");
                }
                case RETURN_VOID -> { }
                default -> throw changed("model constructor " + owner + " contains unsupported instructions");
            }
            if (writes.size() != params.size() || baseCalls != 1) throw changed("model constructor " + owner + " is incomplete");
            return method;
        }

        void check(Method refreshMethod, Method add) {
            refresh(refreshMethod);
            String row = menuFolderItemType(add);
            var addCode = code(add);
            int rowCallAt = settingsRowCall(add);
            var rowCall = (MethodReference) reference(addCode.get(rowCallAt));
            if (!rowCall.getDefiningClass().equals(row)) throw changed("settings row constructor call changed");
            var rowParams = params(rowCall);
            if (rowParams.size() != 8 || !CONTEXT.equals(rowParams.get(0)) || !KEY.equals(rowParams.get(3)) || !METADATA.equals(rowParams.get(4)) ||
                !rowParams.subList(5, 8).equals(List.of(INTEGER, STRING, LIST)) || !rowParams.get(1).startsWith("L") ||
                !rowParams.get(2).startsWith("L")) throw changed("settings row constructor signature changed");
            type(rowParams.get(1));
            type(rowParams.get(2));
            constructor(row, rowParams, List.of("A00", "A01", "A02", "A03", "A04", "A05", "A06", "A07"), Set.of(3, 6), true, true);
            var rowArgs = callArgs(addCode.get(rowCallAt));
            int addRegisters = add.getImplementation().getRegisterCount();
            if (rowArgs.size() != 9 || rowArgs.stream().anyMatch(r -> r < 0 || r >= addRegisters)) throw changed("settings row constructor arguments changed");
            int rowAt = origin(add, rowCallAt, rowArgs.get(0));
            if (addCode.get(rowAt).getOpcode() != Opcode.NEW_INSTANCE || !row.equals(ref(addCode.get(rowAt)))) throw changed("settings row receiver changed");
            int iconResult = origin(add, rowCallAt, rowArgs.get(3));
            String iconType;
            List<String> iconCtorParams;
            boolean iconCtorPublic;
            FieldReference settingsGlyph;
            if (addCode.get(iconResult).getOpcode() == Opcode.NEW_INSTANCE) {
                // 584.1 builds the Settings icon in place, straight into the row constructor's icon argument.
                if (!(reference(addCode.get(iconResult)) instanceof TypeReference allocated)) throw changed("settings icon construction changed");
                iconType = allocated.getType();
                type(iconType);
                if (!subtype(iconType, rowParams.get(2))) throw changed("settings icon type changed");
                int ctorAt = iconResult + 1;
                var ctorInsn = ctorAt < addCode.size() ? addCode.get(ctorAt) : null;
                if (ctorInsn == null || ctorInsn.getOpcode() != Opcode.INVOKE_DIRECT || !(reference(ctorInsn) instanceof MethodReference ctor) ||
                    !ctor.getDefiningClass().equals(iconType) || !"<init>".equals(ctor.getName())) throw changed("settings icon construction changed");
                var ctorArgs = callArgs(ctorInsn);
                iconCtorParams = params(ctor);
                if (iconCtorParams.size() != 2 || ctorArgs.size() != 3 || ctorArgs.get(0) != register(addCode.get(iconResult)))
                    throw changed("settings icon construction changed");
                int glyphAt = origin(add, ctorAt, ctorArgs.get(1));
                int colorAt = origin(add, ctorAt, ctorArgs.get(2));
                if (!(reference(addCode.get(glyphAt)) instanceof FieldReference glyph)) throw changed("settings glyph changed");
                if (!(reference(addCode.get(colorAt)) instanceof FieldReference color)) throw changed("settings icon color changed");
                if (addCode.get(glyphAt).getOpcode() != Opcode.SGET_OBJECT || addCode.get(colorAt).getOpcode() != Opcode.SGET_OBJECT ||
                    !glyph.getType().equals(iconCtorParams.get(0)) || !subtype(color.getType(), iconCtorParams.get(1)))
                    throw changed("settings icon contract changed");
                field(glyph, true);
                field(color, true);
                settingsGlyph = glyph;
                iconCtorPublic = true;
            } else {
                // 584 calls the icon's static factory with the glyph.
                var factoryCall = iconResult >= 1 ? addCode.get(iconResult - 1) : null;
                if (factoryCall == null || !(reference(factoryCall) instanceof MethodReference icon)) throw changed("settings icon factory changed");
                if (addCode.get(iconResult).getOpcode() != Opcode.MOVE_RESULT_OBJECT || factoryCall.getOpcode() != Opcode.INVOKE_STATIC ||
                    icon.getParameterTypes().size() != 1 || !subtype(icon.getReturnType(), rowParams.get(2))) throw changed("settings icon flow changed");
                String iconId = icon.toString();
                var factories = methods(type(icon.getDefiningClass())).stream().filter(m -> hookId(m).equals(iconId)).toList();
                if (factories.size() != 1) throw changed("settings icon factory is missing");
                var iconFactory = factories.get(0);
                var factoryArgs = callArgs(factoryCall);
                if (factoryArgs.size() != 1) throw changed("settings icon flow changed");
                int glyphAt = origin(add, iconResult - 1, factoryArgs.get(0));
                if (!(reference(addCode.get(glyphAt)) instanceof FieldReference glyph)) throw changed("settings glyph changed");
                if (addCode.get(glyphAt).getOpcode() != Opcode.SGET_OBJECT || !glyph.getType().equals(params(icon).get(0)) ||
                    !is(AccessFlags.PUBLIC, iconFactory.getAccessFlags()) || !is(AccessFlags.STATIC, iconFactory.getAccessFlags()) ||
                    (iconFactory.getImplementation() != null && !iconFactory.getImplementation().getTryBlocks().isEmpty()))
                    throw changed("settings icon contract changed");
                var iconCode = code(iconFactory);
                var builds = new ArrayList<Integer>();
                for (int i = 0; i < iconCode.size(); i++) if (iconCode.get(i).getOpcode() == Opcode.INVOKE_DIRECT) builds.add(i);
                if (builds.size() != 1) throw changed("settings icon construction changed");
                if (!(reference(iconCode.get(builds.get(0))) instanceof MethodReference iconCtor)) throw changed("settings icon constructor changed");
                var iconArgs = callArgs(iconCode.get(builds.get(0)));
                var ctorParams = params(iconCtor);
                // 584.1's second arm64 family keeps the factory on the icon's parent type (G7K.A00 returns a new G7P).
                if (!subtype(icon.getReturnType(), icon.getDefiningClass()) || !iconCtor.getDefiningClass().equals(icon.getReturnType()) ||
                    !"<init>".equals(iconCtor.getName()) || ctorParams.size() != 2 || !ctorParams.get(0).equals(glyph.getType()) ||
                    iconArgs.size() != 3 || iconArgs.get(1) != iconFactory.getImplementation().getRegisterCount() - 1 ||
                    iconCode.size() != 4 || iconCode.get(0).getOpcode() != Opcode.SGET_OBJECT || iconCode.get(1).getOpcode() != Opcode.NEW_INSTANCE ||
                    !icon.getReturnType().equals(ref(iconCode.get(1))) || register(iconCode.get(1)) != iconArgs.get(0) ||
                    iconCode.get(3).getOpcode() != Opcode.RETURN_OBJECT || register(iconCode.get(3)) != iconArgs.get(0) ||
                    register(iconCode.get(0)) != iconArgs.get(2)) throw changed("settings icon is not freshly constructed");
                if (!(reference(iconCode.get(0)) instanceof FieldReference color)) throw changed("settings icon color changed");
                if (!subtype(color.getType(), ctorParams.get(1))) throw changed("settings icon color type changed");
                field(color, true);
                iconType = icon.getReturnType();
                iconCtorParams = ctorParams;
                iconCtorPublic = false;
                settingsGlyph = glyph;
            }
            constructor(iconType, iconCtorParams, List.of("A00", "A01"), Set.of(0, 1), iconCtorPublic, true);
            // Obfuscated glyph names move between versions; the enum's own name for the Settings gear doesn't.
            if (!"SETTINGS".equals(enumName(settingsGlyph))) throw changed("settings glyph is not the Settings gear");
            field(settingsGlyph, true);
            var key = allocatable(SETTINGS_KEY);
            var keyCtors = methods(key).stream().filter(m -> m.getName().equals("<init>") && m.getParameterTypes().isEmpty()).toList();
            if (keyCtors.size() != 1) throw changed("settings key constructor changed");
            var keyCtor = keyCtors.get(0);
            var keyCode = code(keyCtor);
            int keyRegisters = keyCtor.getImplementation().getRegisterCount();
            if (!KEY.equals(key.getSuperclass()) || !key.getInterfaces().contains("Landroid/os/Parcelable;") ||
                !is(AccessFlags.PUBLIC, keyCtor.getAccessFlags()) || is(AccessFlags.STATIC, keyCtor.getAccessFlags()) ||
                !"V".equals(keyCtor.getReturnType()) || !keyCtor.getImplementation().getTryBlocks().isEmpty() ||
                keyCode.size() != 3 || keyCode.get(0).getOpcode() != Opcode.CONST_STRING ||
                !(reference(keyCode.get(0)) instanceof StringReference label && "Settings".equals(label.getString())) ||
                keyCode.get(1).getOpcode() != Opcode.INVOKE_DIRECT || !(KEY + "-><init>(" + STRING + ")V").equals(ref(keyCode.get(1))) ||
                keyCode.get(2).getOpcode() != Opcode.RETURN_VOID ||
                !callArgs(keyCode.get(1)).equals(List.of(keyRegisters - 1, register(keyCode.get(0)))) ||
                definesEquality(key) || definesEquality(type(KEY))) throw changed("settings key is not independently constructible");
            constructor(KEY, List.of(STRING), List.of("A00"), Set.of(), false, false);
            constructor(METADATA, List.of("Ljava/util/Map;"), List.of("A00"), Set.of(), true, true);
            var sources = methods(type(SECTION)).stream().filter(m -> m.getParameterTypes().isEmpty() && m.getReturnType().startsWith("LX/")).toList();
            if (sources.size() != 1) throw changed("native settings section factory changed");
            var sectionSource = sources.get(0);
            if (is(AccessFlags.STATIC, sectionSource.getAccessFlags()) || !is(AccessFlags.PUBLIC, sectionSource.getAccessFlags()) ||
                (sectionSource.getImplementation() != null && !sectionSource.getImplementation().getTryBlocks().isEmpty()))
                throw changed("native section factory changed access");
            String section = sectionSource.getReturnType();
            var sectionParams = List.of("Landroid/view/View$OnClickListener;", INTEGER, INTEGER, STRING, STRING, STRING, LIST, "Z");
            var sectionCtor = constructor(section, sectionParams, List.of("A00", "A02", "A01", "A05", "A03", "A04", "A06", "A07"), Set.of(6), true, true);
            var sectionCode = code(sectionSource);
            String ctorId = hookId(sectionCtor);
            var calls = new ArrayList<Integer>();
            for (int i = 0; i < sectionCode.size(); i++) if (ctorId.equals(ref(sectionCode.get(i)))) calls.add(i);
            if (calls.size() != 1) throw changed("native settings section constructor call changed");
            int sectionAt = calls.get(0);
            var sectionArgs = callArgs(sectionCode.get(sectionAt));
            int sourceRegisters = sectionSource.getImplementation().getRegisterCount();
            if (sectionCode.get(sectionAt).getOpcode() != Opcode.INVOKE_DIRECT_RANGE || sectionArgs.size() != 9 ||
                sectionArgs.stream().anyMatch(r -> r < 0 || r >= sourceRegisters)) throw changed("native section arguments changed");
            int allocation = origin(sectionSource, sectionAt, sectionArgs.get(0));
            var returns = sectionCode.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).toList();
            if (sectionCode.get(allocation).getOpcode() != Opcode.NEW_INSTANCE || !section.equals(ref(sectionCode.get(allocation))) ||
                returns.size() != 1 || register(returns.get(0)) != sectionArgs.get(0)) throw changed("native section return changed");
            int kindAt = origin(sectionSource, sectionAt, sectionArgs.get(2));
            int stateAt = origin(sectionSource, sectionAt, sectionArgs.get(3));
            if (!(reference(sectionCode.get(kindAt)) instanceof FieldReference kind)) throw changed("native section kind changed");
            if (!(reference(sectionCode.get(stateAt)) instanceof FieldReference state)) throw changed("native section state changed");
            if (sectionCode.get(kindAt).getOpcode() != Opcode.SGET_OBJECT || sectionCode.get(stateAt).getOpcode() != Opcode.SGET_OBJECT ||
                !"A1P".equals(kind.getName()) || !"A01".equals(state.getName()) || !INTEGER.equals(kind.getType()) ||
                !INTEGER.equals(state.getType()) || !kind.getDefiningClass().equals(state.getDefiningClass()))
                throw changed("native section constants changed");
            field(kind, true);
            field(state, true);
        }
    }

    /**
     * What MaterialYouPatch.kt finds by shape when it patches: one DarkColorScheme token resolver, one dark mode
     * check called by FDSColors' (Context, ?, ?)I resolvers, FDSColors' int returns, and the constants and calls
     * routes 3 and 4 rewrite. The patch quietly skips its FDS half when it can't find it, so this is where a build
     * that resolves only part of it fails. Found targets go in targets.
     */
    static List<String> materialYouProblems(List<ClassDef> classes, List<String> targets) {
        var problems = new ArrayList<String>();
        ClassDef scheme = null, fds = null;
        var fdsShapes = new ArrayList<ClassDef>();
        int surfaces = 0, colorCalls = 0;
        var editableClasses = new TreeSet<String>();
        for (ClassDef cls : classes) {
            if (cls.getType().equals(DARK_SCHEME)) scheme = cls;
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
        if (args.length == 2 && "--kotlin".equals(args[0])) {
            System.exit(printKotlin(Path.of(args[1])));
        }
        if (args.length < 1 || (args.length > 3 && args.length != 5) || (args.length > 1 && !"--save".equals(args[1]))) {
            System.err.println("Usage: CompatReport <apk> [--save <profiles dir> <desktop.jar> <bundle.mpp>]");
            System.err.println("       CompatReport --kotlin <recorded build .txt>");
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
        if (info != null && expected == null) {
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
