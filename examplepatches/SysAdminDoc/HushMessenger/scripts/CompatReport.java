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

    static final String AD_ITEM = "Lcom/facebook/messaging/business/inboxads/common/InboxAdsItem;";
    static final String IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;";
    static final String PREFERENCES = "Lcom/facebook/prefs/shared/FbSharedPreferences;";
    static final String MONTAGE_CARD = "Lcom/facebook/messaging/montage/model/MontageCard;";
    static final String ANIMATION = "Landroid/view/animation/Animation;";
    static final String FRAGMENT_ANIMATION = "Landroidx/fragment/app/Fragment;->onCreateAnimation(IZI)" + ANIMATION;
    static final String PEOPLE_TAB_FETCH = "Lcom/facebook/messaging/peopletab/segments/friendrequests/usecase/"
        + "PeopleTabPYMKHandler$fetchPymkSuggestions$$inlined$CoroutineExceptionHandler$1;";
    static final String PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden";
    static final String STORY_CARD_DATE_KEY = "last_date_creation_card_shown";
    // The Notifications tab's server flag ID, renumbered by each release: 580's, then 581's
    static final Set<Long> PEOPLE_SERVER_FLAGS = Set.of(72344235860374863L, 72344231565407716L);
    // The redesigned emoji drawer's server flag, renumbered by each release: 580's, then 581's
    static final Set<Long> EMOJI_DRAWER_FLAGS = Set.of(36320734536089357L, 36320704471318256L);
    // The drawer renderer throws this when the redesign can't draw, which ties the flag to the emoji drawer
    static final String EMOJI_DRAWER_ANCHOR = "Cannot render redesigned drawer with search icon ";
    // Controls whose hook count follows how Redex inlined one flag read, so it differs between releases
    static final Set<String> RELEASE_HOOK_COUNTS = Set.of("emoji_drawer");
    // The inbox ad filter's exit registers, in order: v5 from both in 580, v7 then v2 in 581
    static final Set<List<Integer>> AD_FILTER_RESULTS = Set.of(List.of(5, 5), List.of(7, 2));

    // Material You theme finds its targets by shape when it patches (MaterialYouPatch.kt), so no profile records them
    static final String DARK_SCHEME = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;";
    static final String FDS_COLORS = "Lcom/facebook/fds/core/theme/component/FDSColors;";
    static final Set<Integer> DARK_SURFACES = Set.of(0xFF080809, 0xFF1C1C1D, 0xFF252728, 0xFF333334, 0xFF323339);
    static final Set<String> COLOR_CALLS = Set.of(
        "Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I", "Landroid/content/Context;->getColor(I)I");

    static final Set<String> FACEBOOK_PLUGINS = Set.of(
        "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;",
        "Lcom/facebook/messaging/marketplace/plugins/folder/navbarmenuitem/NavBarMenuItemImplementation;",
        "Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/facebookprofile/ThreadSettingsFacebookProfileActionButton;",
        "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/fbshortcutsfoldersection/FacebookShortcutsFolderSection;",
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
        Map.entry("suggested_replies", Set.of("com.facebook.messaging.business.plugins.suggestedreply.SuggestedReplyKillSwitch")),
        Map.entry("business_suggestions", Set.of("com.facebook.messaging.business.plugins.suggestasyoutype.SAYTKillSwitch")),
        Map.entry("event_prompts", Set.of("com.facebook.messaging.events.plugins.qp.EventsQpKillSwitch")),
        Map.entry("reels_badge", Set.of("com.facebook.messaging.reels.plugins.badge.ReelsBadgeKillSwitch")),
        Map.entry("ai_toolbar", Set.of("com.facebook.messaging.inbox.tab.plugins.core.tabtoolbarbutton.aihomebutton.AiHomeButtonKillSwitch")),
        Map.entry("ai_tab", Set.of("com.facebook.messaging.aibot.plugins.tab.tabcontent.MetaAiTabContentImplementation"))
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
        PATCHES.put("Hide inbox ads", List.of("ads"));
        PATCHES.put("Hide People You May Know", List.of("people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story",
            "people_inbox_refresh"));
        PATCHES.put("Hide friend request cards", List.of("friend_requests"));
        PATCHES.put("Hide joined community chats", List.of("community_inbox"));
        PATCHES.put("Hide growth prompts", List.of("growth", "growth_notes", "growth_story_card"));
        PATCHES.put("Hide inbox promotions", List.of("inbox_promotions"));
        PATCHES.put("Hide stories and notes", List.of("stories"));
        PATCHES.put("Hide inbox tabs", List.of("subtabs"));
        PATCHES.put("Hide Facebook shortcuts", List.of("facebook"));
        PATCHES.put("Hide Meta AI", List.of("ai_menu", "ai_fab", "ai_toolbar", "ai_tab", "ai_search", "ai_search_chip"));
        PATCHES.put("Hide Chat Moments", List.of("moments"));
        PATCHES.put("Hide Reels badge", List.of("reels_badge"));
        PATCHES.put("Hide AI sticker tools", List.of("ai_stickers", "ai_sticker_cell"));
        PATCHES.put("Hide avatar stickers", List.of("avatar_stickers", "avatar_tabs"));
        PATCHES.put("Restore old emoji drawer", List.of("emoji_drawer"));
        PATCHES.put("Hide chat promotions", List.of("chat_promotions"));
        PATCHES.put("Hide business reply suggestions", List.of("suggested_replies"));
        PATCHES.put("Hide business typing suggestions", List.of("business_suggestions"));
        PATCHES.put("Hide event prompts", List.of("event_prompts"));
        PATCHES.put("Hide typing indicator", List.of("typing", "typing_mailbox"));
        PATCHES.put("Open web links externally", List.of("browser"));
        PATCHES.put("Allow chat bubbles", List.of("bubbles", "bubble_mode"));
        PATCHES.put("Use system emoji", List.of("emoji_typeface"));
        PATCHES.put("Send photos at original quality", List.of("original_photo"));
        PATCHES.put("Send videos without re-encoding", List.of("original_video"));
        PATCHES.put("Use the phone's camera app", List.of("system_camera"));
        PATCHES.put("Stop analytics uploads", List.of("analytics_uploads"));
        PATCHES.put("Keep a message log", List.of("message_log"));
        PATCHES.put("Allow screenshots", List.of("allow_screenshot", "screenshot_viewers"));
        PATCHES.put("Hide read receipts", List.of("hide_read_receipts", "read_mailbox"));
        PATCHES.put("Keep unsent messages", List.of("keep_unsent", "unsent_indicator", "delta_unsent"));
        PATCHES.put("Unlock app icons", List.of("app_icons"));
        PATCHES.put("View stories anonymously", List.of("anonymous_stories"));
        PATCHES.put("Save any story", List.of("save_stories"));
        PATCHES.put("Slide chats in and out", List.of("chat_animation", "chat_fragment", "chat_inbox", "chat_legacy"));
        PATCHES.put("Open settings from menu", List.of("menu_settings"));
    }

    static final Set<String> ORIGINAL_PHOTO_HOOKS = Set.of(
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
        FIELD_CONTROLS.put("pluginSentinel", PLUGIN_GATE_ANCHORS.keySet());
        FIELD_CONTROLS.put("preferenceGetter", Set.of("browser", "people_jewel"));
        FIELD_CONTROLS.put("peopleKey", Set.of("people_jewel"));
        FIELD_CONTROLS.put("peopleFlagCheck", Set.of("people_jewel"));
        FIELD_CONTROLS.put("subtabsSupplier", Set.of("subtabs"));
        FIELD_CONTROLS.put("browserPreferenceKey", Set.of("browser"));
        FIELD_CONTROLS.put("browserPreferenceIndex", Set.of("browser"));
        FIELD_CONTROLS.put("adFilterSize", Set.of("ads"));
        FIELD_CONTROLS.put("adFilterExits", Set.of("ads"));
        FIELD_CONTROLS.put("bubbleCapabilityGetter", Set.of("bubble_mode"));
        FIELD_CONTROLS.put("bubbleRolloutGetter", Set.of("bubble_mode"));
        FIELD_CONTROLS.put("nativeBubbleRoutes", Set.of("bubbles", "bubble_mode"));
        FIELD_CONTROLS.put("nativeCommunityInbox", Set.of("community_inbox"));
    }
    static final Set<String> NUMBER_FIELDS = Set.of("browserPreferenceIndex", "adFilterSize");
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

    /** Discovery isn't patch application. Never publish a profile on discovery evidence alone. */
    static boolean verifyPatch(File apk, String apkHash, Path desktop, Path bundle) throws IOException, InterruptedException {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) throw new IOException("Android Build Tools aapt2 is required to validate the rebuilt APK");
        var command = new ArrayList<>(List.of("python", scriptDir().resolve("verify_compat_patch.py").toString(),
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

    /** "580.0.0.49.91 (version code 346013354 or 346013370)", joined with " or " across version names. */
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
                var code = instructions(method);
                if (code.size() < 5) return null;
                var tail = code.subList(code.size() - 5, code.size());
                if (!tail.stream().map(Instruction::getOpcode).toList().equals(
                        List.of(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.RETURN, Opcode.RETURN))) return null;
                sentinels.add(ref(tail.get(1)));
            }
        }
        return sentinels.size() == 1 ? sentinels.first() : null;
    }

    record PreferenceRead(int index, String key, String getter) {}

    /** The one boolean preference read the external-browser check branches on. */
    static PreferenceRead browserPreferenceRead(List<Method> browser) {
        if (browser.size() != 1) return null;
        var code = instructions(browser.get(0));
        PreferenceRead read = null;
        for (int k = 0; k + 3 < code.size(); k++) {
            if (code.get(k).getOpcode() != Opcode.SGET_OBJECT || register(code.get(k)) != 0 ||
                !(code.get(k + 1) instanceof FiveRegisterInstruction call) || call.getOpcode() != Opcode.INVOKE_INTERFACE ||
                call.getRegisterCount() != 3 || call.getRegisterC() != 1 || call.getRegisterD() != 0 || call.getRegisterE() != 3 ||
                !(((ReferenceInstruction) call).getReference() instanceof MethodReference getter) ||
                !PREFERENCES.equals(getter.getDefiningClass()) || !"Z".equals(getter.getReturnType()) ||
                code.get(k + 2).getOpcode() != Opcode.MOVE_RESULT || register(code.get(k + 2)) != 0 ||
                code.get(k + 3).getOpcode() != Opcode.IF_EQZ || register(code.get(k + 3)) != 0) continue;
            if (read != null) return null;
            read = new PreferenceRead(k, ref(code.get(k)), getter.toString());
        }
        return read;
    }

    /** The Notifications tab's preference key and its server-override check. */
    static List<String> peopleSection(List<Method> jewel, String getter) {
        if (jewel.size() != 1) return null;
        var code = instructions(jewel.get(0));
        // The server flag loads at 17, or at 16 where Redex inlined the list reset into one call (346013423).
        var flags = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.CONST_WIDE && code.get(i) instanceof WideLiteralInstruction flag &&
                PEOPLE_SERVER_FLAGS.contains(flag.getWideLiteral())) flags.add(i);
        }
        if (flags.size() != 1 || flags.get(0) < 16 || flags.get(0) > 17) return null;
        int at = flags.get(0);
        if (code.size() < at + 4 || code.get(8).getOpcode() != Opcode.SGET_OBJECT || register(code.get(8)) != 0 ||
            code.get(10).getOpcode() != Opcode.INVOKE_INTERFACE || !getter.equals(ref(code.get(10))) ||
            code.get(at + 1).getOpcode() != Opcode.INVOKE_STATIC) return null;
        return List.of(ref(code.get(8)), ref(code.get(at + 1)));
    }

    static String subtabsSupplier(List<Method> subtabs) {
        if (subtabs.size() != 1) return null;
        var code = instructions(subtabs.get(0));
        return code.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
            Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID)) ? ref(code.get(0)) : null;
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
        var ads = controls.get("ads");
        if (ads.size() == 1) {
            var code = instructions(ads.get(0));
            var exits = new ArrayList<String>();
            var results = new ArrayList<Integer>();
            for (int i = 0; i < code.size(); i++) {
                if (code.get(i).getOpcode() != Opcode.RETURN_OBJECT) continue;
                exits.add(String.valueOf(i));
                results.add(code.get(i) instanceof OneRegisterInstruction r ? r.getRegisterA() : -1);
            }
            // ControlHooks.kt wraps each exit's own result register, so only the release-pinned pairs record
            if (!exits.isEmpty() && ads.get(0).getImplementation().getRegisterCount() == 24 && AD_FILTER_RESULTS.contains(results)) {
                found.fields.put("adFilterSize", String.valueOf(code.size()));
                found.fields.put("adFilterExits", String.join(" ", exits));
            }
        }
        for (var site : findDexSites(classes)) found.dexSites.put(site.getKey(), site.getValue());
        return found;
    }

    static final String BUBBLE_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;";
    static final long BUBBLE_ROLLOUT = 36312032932401152L;
    /** 581 renumbered the specifier of the same rollout read. Exactly these two are accepted, as in NativeBubbles.kt. */
    static final long BUBBLE_ROLLOUT_581 = 36312028637433857L;
    static final Set<Long> BUBBLE_ROLLOUTS = Set.of(BUBBLE_ROLLOUT, BUBBLE_ROLLOUT_581);
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
            BUBBLE_ROLLOUTS.contains(((WideLiteralInstruction)c.get(19)).getWideLiteral()) && register(c.get(20)) == 2 &&
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

    /** NativeBubbles.kt's bubbleGateHelper: 581 reads the gate through a static (session, lazy holder) helper returning its answer. */
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
                refs.contains("thread_shortcut_") && refs.contains(SHORTCUT_BUILDER+"->setPerson(Landroid/app/Person;)"+SHORTCUT_BUILDER) &&
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
        if (containerCtor == null || !s.returns(s.key(containerCtor, s.argument(containerCtor, 0)))) return null;
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
        if (shortcutFields.size() != 1) return null;
        var shortcutField = shortcutFields.get(0);
        return shortcutField;
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
            var kotlin = NUMBER_FIELDS.contains(name) ? value
                : "adFilterExits".equals(name) ? "listOf(" + String.join(", ", value.split(" ")) + ")"
                : kotlinString(value);
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

    /**
     * The two methods the clone patch edits (CloneInstallPatch.kt): the encrypted-backup preference lookup, a public
     * no-argument constructor that reads getPackageName once, and the static attachment authority check.
     */
    static List<String> cloneSites(List<ClassDef> classes, List<String> failures) {
        var lookups = new ArrayList<String>();
        var checks = new ArrayList<String>();
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
                if (strings.contains("autobackupprefs") && strings.contains("fbautobackupprefs") && strings.contains("com.facebook.orca") &&
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

    static final String EPHEMERAL_VIEWER = "Lcom/facebook/messaging/media/ephemeralmedia/viewer/EphemeralMediaViewerFragment;";
    static final String QUICKSNAP_VIEWER = "Lcom/facebook/messaging/quicksnap/consumption/viewer/MsgrQuicksnapViewerFragment;";
    static final String WINDOW = "Landroid/view/Window;";
    static final String SET_FLAGS = WINDOW + "->setFlags(II)V", ADD_FLAGS = WINDOW + "->addFlags(I)V";
    static final int GENERATE_AI_LABEL = 0x7f1404fe, GENERATE_AI_LABEL_581 = 0x7f140511;
    static final Set<String> EPHEMERAL_DIALOGS = Set.of("A1A", "A1C", "A1E");

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
    /** Mirrors NativeMediaControls.kt. No lifecycle body is eligible for an entry return. */
    static List<Integer> screenshotViewerSites(Method method) {
        if (!Set.of(EPHEMERAL_VIEWER, QUICKSNAP_VIEWER).contains(method.getDefiningClass())) return List.of();
        var impl = method.getImplementation(); var c = instructions(method); var p = bubbleParameters(method);
        if (impl == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !impl.getTryBlocks().isEmpty()) return List.of();
        List<Integer> sites; boolean valid, resume = false; int d = 0;
        if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && EPHEMERAL_DIALOGS.contains(method.getName()) &&
                p.equals(List.of("Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/app/Dialog;")) {
            sites = List.of(9);
            valid = impl.getRegisterCount() == 5 && c.size() == 15 && mediaResult(c, 4, "Landroid/app/Dialog;", 2) &&
                mediaWindow(c, 5, "Landroid/app/Dialog;", 2, 1, 10) && mediaLiteral(c, 8, 0) && mediaCall(c, 9, SET_FLAGS, 1, 0, 0);
        } else if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && method.getName().equals("onResume") && p.isEmpty() && method.getReturnType().equals("V")) {
            // 581 casts the provider's Object result in v0 before asking it for the Activity, one instruction later.
            if (c.size() == 49 && mediaOp(c, 7, Opcode.CHECK_CAST) && register(c.get(7)) == 0) d = 1;
            sites = List.of(14 + d, 21 + d); resume = true;
            valid = impl.getRegisterCount() == 5 && c.size() == 48 + d && mediaResult(c, 8 + d, "Landroid/app/Activity;", 0) && mediaLiteral(c, 9 + d, 1) &&
                mediaNull(c, 10 + d, 0, 15 + d) && mediaWindow(c, 11 + d, "Landroid/app/Activity;", 0, 0, 15 + d) && mediaCall(c, 14 + d, SET_FLAGS, 0, 1, 1) &&
                mediaOp(c, 15 + d, Opcode.INVOKE_VIRTUAL) && bubbleArgs(c.get(15 + d)).equals(List.of(4)) &&
                c.get(15 + d) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr && mr.getReturnType().equals("Landroid/app/Dialog;") &&
                mediaOp(c, 16 + d, Opcode.MOVE_RESULT_OBJECT) && register(c.get(16 + d)) == 0 && mediaNull(c, 17 + d, 0, 22 + d) &&
                mediaWindow(c, 18 + d, "Landroid/app/Dialog;", 0, 0, 22 + d) && mediaCall(c, 21 + d, SET_FLAGS, 0, 1, 1);
            if (valid) for (int i = 10 + d; i <= 21 + d; i++) if (mediaWrites(c.get(i), 1)) valid = false;
        } else if (method.getDefiningClass().equals(QUICKSNAP_VIEWER) && method.getName().equals("onCreateView") &&
                p.equals(List.of("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/view/View;")) {
            sites = List.of(32);
            valid = impl.getRegisterCount() == 23 && Set.of(438, 439, 441, 442, 444, 448).contains(c.size()) && mediaResult(c, 26, "Landroid/app/Dialog;", 0) &&
                mediaNull(c, 27, 0, 33) && mediaWindow(c, 28, "Landroid/app/Dialog;", 0, 1, 33) && mediaLiteral(c, 31, 0) && mediaCall(c, 32, ADD_FLAGS, 1, 0);
        } else return List.of();
        var setters = new ArrayList<Integer>();
        for (int i = 0; i < c.size(); i++) if (ref(c.get(i)) != null && Set.of(SET_FLAGS, ADD_FLAGS, WINDOW + "->clearFlags(I)V").contains(ref(c.get(i)))) setters.add(i);
        if (!valid || !setters.equals(sites)) return List.of();
        if (resume && c.stream().anyMatch(i -> i.getOpcode().name().contains("SWITCH") || i.getOpcode().name().contains("PAYLOAD"))) return List.of();
        for (int t : mediaTargets(method)) if (t >= 1 && t <= sites.getLast() && (!resume || t != 15 + d)) return List.of();
        if (resume) for (int i = 0; i < c.size(); i++) if (i != 10 + d && i != 13 + d && c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == 15 + d) return List.of();
        return sites;
    }

    record AiCell(String type, String superclass, String scope, String component, int size, int registers, int label, int sources) {
        AiCell(String type, String superclass, String scope, String component, int size) { this(type, superclass, scope, component, size, 23, GENERATE_AI_LABEL, 4); }
        String render() { return type + "->render(" + scope + ")" + component; }
    }
    static List<Method> findAiStickerCells(List<ClassDef> classes) {
        var shapes = List.of(new AiCell("LX/FXP;", "LX/1Hx;", "LX/2MZ;", "LX/1GG;", 104),
            new AiCell("LX/FWm;", "LX/1Hx;", "LX/2MZ;", "LX/1GG;", 104), new AiCell("LX/FTy;", "LX/1Hw;", "LX/2MY;", "LX/1GF;", 104),
            new AiCell("LX/FfQ;", "LX/1Hw;", "LX/2MY;", "LX/1GF;", 106), new AiCell("LX/FSU;", "LX/1IL;", "LX/2Nf;", "LX/1Gf;", 104),
            new AiCell("LX/Ez5;", "LX/1IO;", "LX/2AL;", "LX/1Gd;", 105, 24, GENERATE_AI_LABEL_581, 5));
        var result = new ArrayList<Method>();
        for (var shape : shapes) {
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
            int sources = 0;
            for (var sourceClass : classes) for (var source : sourceClass.getMethods()) {
                if (!source.getName().equals("render")) continue;
                var c = instructions(source);
                for (int at = 0; at < c.size(); at++) {
                    if (!Set.of(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE).contains(c.get(at).getOpcode()) || !Objects.equals(ref(c.get(at)), hookId(ctor))) continue;
                    var args = bubbleArgs(c.get(at)); if (args.isEmpty()) continue; int arg = args.getLast(), literal = -1;
                    for (int j = at - 1; j >= Math.max(0, at - 24); j--) if (mediaWrites(c.get(j), arg)) { literal = j; break; }
                    if (literal < 0 || !(c.get(literal) instanceof NarrowLiteralInstruction n) || n.getNarrowLiteral() != shape.label()) continue;
                    boolean straight = true; for (int j = literal + 1; j < at; j++) if (c.get(j) instanceof OffsetInstruction) straight = false;
                    for (int t : mediaTargets(source)) if (t > literal && t <= at) straight = false;
                    if (straight) sources++;
                }
            }
            if (sources != shape.sources()) continue;
            for (var m : cls.getMethods()) if (hookId(m).equals(shape.render()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null &&
                    m.getImplementation().getRegisterCount() == shape.registers() && instructions(m).size() == shape.size() && m.getImplementation().getTryBlocks().size() == 4) result.add(m);
        }
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
    Method singleMethod(String type, String name) { return single(methods(classes.get(type)).stream().filter(m->m.getName().equals(name)).toList(),type+"->"+name); }
    boolean sessionFirst(List<Instruction> ctorCode) {
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
        require(hasString(folderOverride,"InboxLoaderCoordinator.setFolderAndFilter") && overrideCode.size()==45 && folderOverride.getParameterTypes().size()==2,"main folder switch changed");
        String scopeType=folderOverride.getParameterTypes().get(1).toString();
        var scopeLabels=enumFieldNames(scopeType); var folderLabels=enumFieldNames(folderType);
        var pending=(FieldReference)ref(overrideCode.get(4)); var requests=(FieldReference)ref(overrideCode.get(2));
        require(scopeLabels.get(requests.getName()).equals("MESSAGE_REQUESTS") && folderLabels.get(pending.getName()).equals("PENDING"),"pending scope label changed");
        require(overrideCode.get(3).getOpcode()==Opcode.IF_NE && branch(folderOverride,3)==13 && Objects.toString(ref(overrideCode.get(7))).equals(pending.toString()) && Objects.toString(ref(overrideCode.get(13))).equals(folders.get("INBOX").toString()),"main folder branches changed");
        require(overrideCode.get(25).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)overrideCode.get(25)).getRegisterA()==5 && overrideCode.get(28).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)overrideCode.get(28)).getRegisterA()==4,"folder/filter config connection changed");
        for(var m:main.getMethods()) {
            require(m.equals(folderOverride) || !hasString(m,"folderName"),"other main config folder override");
            require(calls(m).stream().noneMatch(c->c.getDefiningClass().equals(loaderCtor.getDefiningClass()) && c.getParameterTypes().contains(folderType)),"main renderer selects another folder");
        }
        var ctorCalls=calls(render).stream().filter(m->m.getName().equals("<init>") && m.getParameterTypes().contains(LIST)).toList();
        Method ctor=definition(single(ctorCalls,"dedicated immutable-list closure ctor"));
        var closure=classes.get(ctor.getDefiningClass());
        require(ctor.getParameterTypes().size()==14 && ctor.getParameterTypes().get(11).toString().equals(LIST) && ctor.getReturnType().equals("V"),"captured list argument changed");
        var ctorCode=instructions(ctor);
        require(ctor.getImplementation().getRegisterCount()==16 && ctorCode.size()==17 && ctor.getImplementation().getTryBlocks().isEmpty(),"closure ctor shape changed");
        require(ctorCode.get(0).getOpcode()==Opcode.IPUT_OBJECT && ctorCode.get(0) instanceof TwoRegisterInstruction && ref(ctorCode.get(0)) instanceof FieldReference,"captured presentation store absent");
        var store=(TwoRegisterInstruction)ctorCode.get(0); var captured=(FieldReference)ref(ctorCode.get(0));
        require(store.getRegisterA()==13 && store.getRegisterB()==1 && captured.getName().equals("$inboxUnitItems") && captured.getType().equals(LIST),"captured parameter disconnected");
        // 581 moves the session capture from slot 8 to slot 2, so the captures in slots 2 to 7 move one slot later.
        int scopeAt=sessionFirst(ctorCode)?5:4;
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
        var prefix=(FieldReference)ref(ctorCode.get(scopeAt+3));
        require(prefix.getName().equals("$prefixOffsetCallback") && ctorCode.get(scopeAt+3).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)ctorCode.get(scopeAt+3)).getRegisterA()==8,"Main callback capture disconnected");
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
        int getterReceiver=args(renderCode.get(scopeResult-1)).get(0), mainLoaderRead=-1;
        for(int at=scopeResult-2;at>=0;at--) if(writes(renderCode.get(at),getterReceiver)) { mainLoaderRead=at; break; }
        require(mainLoaderRead>=0 && renderCode.get(mainLoaderRead).getOpcode()==Opcode.IGET_OBJECT,"Main loader source absent");
        var mainLoader=(FieldReference)ref(renderCode.get(mainLoaderRead)); var getterCode=instructions(scopeGetter);
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
        require(listReads.size()==2 && listReads.get(0)==5 && Set.of(55,56,66).contains(listReads.get(1)),"presentation read shape changed: "+listReads);
        int secondRead=listReads.get(1), aliasAt=secondRead+10, sinkAt=secondRead+11;
        require(code.size()==secondRead+19 && invoke.getImplementation().getRegisterCount()==20 && invoke.getImplementation().getTryBlocks().isEmpty(),"presentation body shape changed");
        require(code.get(6).getOpcode()==Opcode.INVOKE_VIRTUAL && Objects.toString(ref(code.get(6))).equals("Ljava/util/AbstractCollection;->isEmpty()Z") && args(code.get(6)).equals(List.of(0)),"original empty/header gate changed");
        require(hasString(invoke,"searchBarSection") && code.get(secondRead) instanceof TwoRegisterInstruction && ((TwoRegisterInstruction)code.get(secondRead)).getRegisterA()==0,"header or local presentation read changed");
        require(code.get(aliasAt).getOpcode()==Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction)code.get(aliasAt)).getRegisterA()==17 && ((TwoRegisterInstruction)code.get(aliasAt)).getRegisterB()==0,"second list alias changed");
        require(code.get(sinkAt).getOpcode()==Opcode.INVOKE_STATIC_RANGE && ref(code.get(sinkAt)) instanceof MethodReference,"list section sink changed");
        var sink=(MethodReference)ref(code.get(sinkAt));
        require(sink.getParameterTypes().size()==12 && sink.getParameterTypes().get(11).toString().equals("Ljava/util/List;") && args(code.get(sinkAt)).get(11)==17,"renderer list argument disconnected");
        for(int at=secondRead+1;at<aliasAt;at++) require(!writes(code.get(at),0),"list overwritten before render");
        require(targets(invoke).stream().noneMatch(t->t>secondRead && t<=sinkAt),"branch bypasses second-read hook");
        require(code.subList(secondRead+1,code.size()).stream().noneMatch(i->operandReads(i,1) || operandReads(i,3)),"scope scratch register still live");
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
        var keyChannel=definition(single(calls(keyAny).stream().filter(m->m.getDefiningClass().equals(KEY) && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Z")).toList(),"community channel predicate"));
        require(instructions(keyPredicate).size()==8 && calls(keyPredicate).stream().anyMatch(m->id(m).equals(id(keyAny))),"null-safe community wrapper changed");
        require(instructions(keyAny).size()==10 && calls(keyAny).stream().anyMatch(m->id(m).equals(id(keyChannel))) && instructions(keyChannel).size()==7,"community OR predicate changed");
        var n=instructions(keyPredicate); var a=instructions(keyAny); var h=instructions(keyChannel);
        require(n.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IF_EQZ,Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            keyPredicate.getImplementation().getRegisterCount()==1 && branch(keyPredicate,0)==6 && branch(keyPredicate,3)==6 && args(n.get(1)).equals(List.of(0)) && literal(n.get(4),0,1) && literal(n.get(6),0,0),"null/unknown key behavior changed");
        require(a.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_NEZ,Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_EQ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            branch(keyAny,2)==8 && branch(keyAny,5)==8 && args(a.get(0)).equals(List.of(2)) && literal(a.get(6),0,0) && literal(a.get(8),0,1),"community OR value flow changed");
        require(h.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_NE,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            branch(keyChannel,2)==5 && literal(h.get(3),0,1) && literal(h.get(5),0,0) && Objects.toString(ref(h.get(0))).equals(Objects.toString(ref(a.get(3)))),"ordinary key behavior changed");
        var keyType=single(fieldsOf(KEY, ((FieldReference)ref(instructions(keyChannel).get(0))).getType()),"typed key enum"); var enums=enumMembers(keyType.getType());
        require(Objects.toString(ref(instructions(keyChannel).get(1))).equals(enums.get("COMMUNITY_CHANNEL").toString()) && Objects.toString(ref(instructions(keyAny).get(4))).equals(enums.get("COMMUNITY_ANNOUNCEMENT_CHANNEL").toString()),"joined predicate accepts other types");
        String rowType=single(renderCode.stream().filter(i->i.getOpcode()==Opcode.INSTANCE_OF).map(i->((TypeReference)ref(i)).getType()).distinct().filter(t->fieldsOf(t,SUMMARY).size()==1).toList(),"native row type");
        var rowSummary=single(fieldsOf(rowType,SUMMARY),"native row summary");
        require(AccessFlags.PUBLIC.isSet(classes.get(rowType).getAccessFlags()) && AccessFlags.PUBLIC.isSet(rowSummary.getAccessFlags()) && AccessFlags.FINAL.isSet(rowSummary.getAccessFlags()) &&
            AccessFlags.PUBLIC.isSet(classes.get(predicate.getDefiningClass()).getAccessFlags()) && AccessFlags.PUBLIC.isSet(predicate.getAccessFlags()) && AccessFlags.STATIC.isSet(predicate.getAccessFlags()),"typed native contract inaccessible");
        var identityParts=new ArrayList<>(List.of(id(render),id(ctor),id(scopeGetter),id(folderOverride),rowSummary.toString(),id(predicate),id(keyPredicate),id(keyAny),id(keyChannel),requests.toString(),prefix.toString()));
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
     * creates its observer just before the observer's (Object, int) constructor, and the observer's one list callback sets
     * one declared int to 5 or 1, which the items read checks.
     */
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
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || !inboxParams(m).equals(List.of(INBOX_SUPPLIER)) ||
                instructions(m).stream().noneMatch(i -> INBOX_SUBSCRIBE_WARNING.equals(inboxString(i)))) continue;
            if (subscribe != null) return null;
            subscribe = m;
        }
        if (subscribe == null) return null;
        var body = instructions(subscribe);
        int at = -1;
        for (int i = 0; i < body.size(); i++) {
            if (body.get(i).getOpcode() == Opcode.INVOKE_DIRECT && body.get(i) instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof MethodReference mr && "<init>".equals(mr.getName()) && "V".equals(mr.getReturnType()) &&
                inboxParams(mr).equals(List.of("Ljava/lang/Object;", "I"))) {
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
        String listed = null, name = null;
        for (int k = 3; k < list.size(); k++) {
            if (list.get(k).getOpcode() != Opcode.IPUT || !(((ReferenceInstruction) list.get(k)).getReference() instanceof FieldReference f) ||
                !INBOX_SUPPLIER.equals(f.getDefiningClass()) || !"I".equals(f.getType())) continue;
            int value = ((TwoRegisterInstruction) list.get(k)).getRegisterA();
            if (!inboxLiteral(list.get(k - 3), value, 5) || list.get(k - 2).getOpcode() != Opcode.IF_LT || !jumpsTo(list, k - 2, k) ||
                !inboxLiteral(list.get(k - 1), value, 1)) continue;
            if (listed != null) return null;
            name = f.getName();
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

    /**
     * Every method that loads the emoji drawer flag, but only when the one renderer that throws the anchor loads it
     * too, itself (581) or through a static no-argument boolean that does (580). Mirrors EmojiDrawer.kt.
     */
    static List<Method> emojiDrawerReaders(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        var anchors = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            boolean reads = false, anchor = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.CONST_WIDE && EMOJI_DRAWER_FLAGS.contains(((WideLiteralInstruction) i).getWideLiteral())) reads = true;
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                    EMOJI_DRAWER_ANCHOR.equals(sr.getString())) anchor = true;
            }
            if (reads) readers.add(method);
            if (anchor) anchors.add(method);
        }
        if (anchors.size() != 1) return List.of();
        var anchor = anchors.get(0);
        var ids = new HashSet<String>();
        var helpers = new HashSet<String>();
        for (var reader : readers) {
            ids.add(hookId(reader));
            if (AccessFlags.STATIC.isSet(reader.getAccessFlags()) && reader.getParameterTypes().isEmpty() &&
                "Z".equals(reader.getReturnType())) helpers.add(hookId(reader));
        }
        boolean connected = ids.contains(hookId(anchor));
        for (var i : anchor.getImplementation().getInstructions()) {
            if (i.getOpcode() == Opcode.INVOKE_STATIC && helpers.contains(((ReferenceInstruction) i).getReference().toString())) connected = true;
        }
        return connected ? readers : List.of();
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

    /** The non-Parcel NewMessageNotification constructor, whose message and thread parameters the hook reads. */
    static List<Method> messageLogHooks(List<ClassDef> classes) {
        for (var cls : classes) {
            if (!NEW_MESSAGE_NOTIFICATION.equals(cls.getType())) continue;
            var ctors = new ArrayList<Method>();
            for (var m : cls.getMethods()) {
                var params = m.getParameterTypes();
                if ("<init>".equals(m.getName()) && "V".equals(m.getReturnType()) && params.size() >= 3 &&
                    MESSENGER_ACCOUNT_TYPE.contentEquals(params.get(0)) && MESSAGE_TYPE.contentEquals(params.get(1)) &&
                    THREAD_SUMMARY_TYPE.contentEquals(params.get(2)) && m.getImplementation() != null) ctors.add(m);
            }
            return ctors.size() == 1 ? ctors : List.of();
        }
        return List.of();
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

    /**
     * system_camera: the chat composer's camera listener, which builds MontageComposerActivity's intent and starts it
     * with request code 7377. Counted only while exactly one chat fragment also reads a photo picked in another app
     * (request code 1112), the path the switch hands the phone camera's photo to.
     */
    static List<Method> systemCameraLaunches(List<ClassDef> classes) {
        var launches = new ArrayList<Method>();
        int readers = 0;
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
                strings.contains("ComposeFragment:montageMessageActivityResultNullData")) readers++;
            if ("V".equals(m.getReturnType()) && params.equals(List.of(MONTAGE_PARAMS, NAVIGATION_TRIGGER)) &&
                !AccessFlags.STATIC.isSet(m.getAccessFlags()) && buildsIntent && hasLiteral(m, 7377)) launches.add(m);
        }
        return readers == 1 ? launches : List.of();
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

    static Map<String, List<Method>> findControls(List<ClassDef> classes) {
        var found = new LinkedHashMap<String, List<Method>>();
        for (var key : CONTROL_KEYS) found.put(key, new ArrayList<>());
        var inboxTypes = new HashMap<String, ClassDef>();
        classes.forEach(c -> inboxTypes.put(c.getType(), c));
        found.get("ai_sticker_cell").addAll(findAiStickerCells(classes));
        var community = communityInbox(classes);
        if (community != null) found.get("community_inbox").add(community.render());
        found.get("emoji_drawer").addAll(emojiDrawerReaders(classes));
        found.get("analytics_uploads").addAll(analyticsUploads(classes));
        found.get("message_log").addAll(messageLogHooks(classes));
        found.get("system_camera").addAll(systemCameraLaunches(classes));
        for (var cls : classes) for (var method : cls.getMethods())
            if (!screenshotViewerSites(method).isEmpty()) found.get("screenshot_viewers").add(method);
        var jewelCandidates = new ArrayList<Map.Entry<Method, Set<String>>>();

        boolean hasAdItem = false, hasImmutableCopy = false;
        for (var cls : classes) {
            if (cls.getType().equals(AD_ITEM)) hasAdItem = true;
            if (cls.getType().equals(IMMUTABLE_LIST)) {
                for (var m : cls.getMethods()) {
                    if ("copyOf".equals(m.getName()) &&
                        m.getParameterTypes().equals(List.of("Ljava/util/Collection;")) &&
                        m.getReturnType().equals(IMMUTABLE_LIST) &&
                        AccessFlags.PUBLIC.isSet(m.getAccessFlags()) &&
                        AccessFlags.STATIC.isSet(m.getAccessFlags())) {
                        hasImmutableCopy = true;
                    }
                }
            }
        }
        boolean adContract = hasAdItem && hasImmutableCopy;

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
                    for (var entry : PLUGIN_GATE_ANCHORS.entrySet()) {
                        for (var s : strings) {
                            if (entry.getValue().contains(s)) {
                                found.get(entry.getKey()).add(method);
                                break;
                            }
                        }
                    }
                }

                // ads
                if (adContract && IMMUTABLE_LIST.equals(method.getReturnType()) &&
                    paramTypes.size() == 3 &&
                    strings.contains("messaging.inbox.itemlistprocessor.ItemListProcessorInterfaceSpec") &&
                    strings.contains("processItems") &&
                    strings.contains("new_friend_bump_threads")) {
                    found.get("ads").add(method);
                }

                // stories
                if (gate && strings.contains("com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch")) {
                    found.get("stories").add(method);
                }

                // app_icons: the icon manager's subscription benefit checks
                if (appIconManagers.contains(cls.getType()) && isStatic && "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of(BUBBLE_SESSION)) && strings.contains("CUSTOM_APP_ICON")) {
                    found.get("app_icons").add(method);
                }

                // facebook
                if (gate) {
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.NEW_INSTANCE && i instanceof ReferenceInstruction ri) {
                            if (ri.getReference() instanceof TypeReference tr) {
                                if (FACEBOOK_PLUGINS.contains(tr.getType())) {
                                    found.get("facebook").add(method);
                                    break;
                                }
                            }
                        }
                    }
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
                        case "ReadThreadManager$1" -> found.get("hide_read_receipts").add(method);
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
                        BUBBLE_ROLLOUTS.contains(flag.getWideLiteral()))) found.get("bubble_mode").add(method);

                // browser
                if ("Z".equals(method.getReturnType()) &&
                    strings.contains("iab_skipped_reason") && strings.contains("user_prefers_external")) {
                    found.get("browser").add(method);
                }

                // people_jewel, kept once discovery knows the preference getter
                if ("Z".equals(method.getReturnType()) && isStatic &&
                    paramTypes.equals(List.of(cls.getType()))) {
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

                // keep_unsent
                if ("V".equals(method.getReturnType()) && paramTypes.size() == 3 &&
                    "Landroid/content/Intent;".equals(paramTypes.get(0)) &&
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

                // original_photo: the encrypted-chat photo transcoder's two entry points, named the same in every build
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) &&
                    !isStatic && ORIGINAL_PHOTO_HOOKS.contains(hookId(method))) {
                    found.get("original_photo").add(method);
                }

                // original_video: the video transcoder's private worker, which holds the passthrough size check
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) && !isStatic &&
                    ORIGINAL_VIDEO_HOOK.equals(hookId(method)) && strings.contains("mci_video_passthrough")) {
                    found.get("original_video").add(method);
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

                // read_mailbox: the msys call that marks a thread read (and sends the receipt) in encrypted chats
                if ("V".equals(method.getReturnType()) && strings.contains("markAsReadThreadWithThreadIdentifier")) {
                    found.get("read_mailbox").add(method);
                }

                // anonymous_stories: the story mark-read handler that reports a viewed card
                if ("V".equals(method.getReturnType()) && paramTypes.equals(List.of(MONTAGE_CARD, "Z")) &&
                    !isStatic && strings.contains("MontageMsysMarkReadHandler")) {
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
                    strings.contains("MsgrPeopleYouMayKnowQuery")) {
                    found.get("people_story").add(method);
                }

                // people_inbox_refresh: the chat list supplier's items read, counted only when the whole refresh route proves out
                if (INBOX_SUPPLIER.equals(cls.getType()) && !isStatic && IMMUTABLE_LIST.equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && strings.contains(INBOX_ITEMS_TRACE) && inboxRefreshRoute(inboxTypes, method) != null) {
                    found.get("people_inbox_refresh").add(method);
                }

                // avatar_tabs: the Litho sticker keyboard's tab list builder
                if (IMMUTABLE_LIST.equals(method.getReturnType()) && paramTypes.isEmpty() &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(
                        "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;->"))) {
                    found.get("avatar_tabs").add(method);
                }
                // Some builds fill that list inline in a void method of the composer factory instead.
                if ("V".equals(method.getReturnType()) &&
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
        return found;
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
        Arrays.sort(versions, Comparator.reverseOrder());
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
            if (tool.endsWith(".bat")) {
                pb = new ProcessBuilder("cmd", "/c", tool, "verify", "--print-certs", apk.getAbsolutePath());
            } else {
                pb = new ProcessBuilder(tool, "verify", "--print-certs", apk.getAbsolutePath());
            }
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            int exit = proc.waitFor();
            var m = Pattern.compile("certificate sha-256 digest:\\s+([0-9a-f]+)").matcher(output.toLowerCase());
            if (m.find()) return m.group(1);
            return null;
        } catch (Exception e) {
            System.out.println("DEBUG apksigner exception: " + e);
            return null;
        }
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

    /**
     * What MaterialYouPatch.kt finds by shape when it patches: one DarkColorScheme token resolver, one dark mode
     * check called by FDSColors' (Context, ?, ?)I resolvers, FDSColors' int returns, and the constants and calls
     * routes 3 and 4 rewrite. The patch quietly skips its FDS half when it can't find it, so this is where a build
     * that resolves only part of it fails. Found targets go in targets.
     */
    static List<String> materialYouProblems(List<ClassDef> classes, List<String> targets) {
        var problems = new ArrayList<String>();
        ClassDef scheme = null, fds = null;
        int surfaces = 0, colorCalls = 0;
        var editableClasses = new TreeSet<String>();
        for (ClassDef cls : classes) {
            if (cls.getType().equals(DARK_SCHEME)) scheme = cls;
            if (cls.getType().equals(FDS_COLORS)) fds = cls;
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
        if (fds == null) {
            problems.add("no " + FDS_COLORS);
        } else {
            var resolvers = new ArrayList<Method>();
            int intReturns = 0;
            for (Method m : fds.getMethods()) {
                if (!"I".equals(m.getReturnType()) || m.getImplementation() == null) continue;
                intReturns += (int) instructions(m).stream().filter(i -> i.getOpcode() == Opcode.RETURN).count();
                if (m.getParameterTypes().size() == 3 && "Landroid/content/Context;".equals(m.getParameterTypes().get(0).toString()))
                    resolvers.add(m);
            }
            // The 21 builds have two, A00 and A01, calling the same check; the patch reads the check from the first
            var calls = new TreeMap<String, MethodReference>();
            boolean firstCalls = false;
            for (Method resolver : resolvers) {
                for (Instruction i : instructions(resolver)) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
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
        if (signer != null && !FACEBOOK_SIGNER.equals(signer) && !META_SIGNER.equals(signer)) {
            System.out.println("[WARN] Signer: " + signer + " is not the stock Facebook or Meta certificate");
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
            if (signerMethod != null) {
                System.out.println("[PASS] Restore screens on re-signed builds (" + hookId(signerMethod) + ")");
            } else {
                System.out.println("[FAIL] Restore screens on re-signed builds");
                System.out.println("       No method found matching the signer lookup pattern");
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
            if (!builds.isEmpty()) System.out.println("Use an unmodified arm64 Messenger " + supported(builds) + ".");
            System.exit(1);
        } else {
            System.out.println("RESULT: PASS - all " + (PATCHES.size() + 3) + " patches are compatible.");
            System.exit(0);
        }
    }
}
