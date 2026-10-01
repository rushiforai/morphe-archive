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
 *   CompatReport <apk> --save           records the build when every control resolves,
 *                                       and prints the Kotlin to paste. Otherwise it
 *                                       lists the controls that didn't resolve.
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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
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
    static final String PEOPLE_TAB_FETCH = "Lcom/facebook/messaging/peopletab/segments/friendrequests/usecase/"
        + "PeopleTabPYMKHandler$fetchPymkSuggestions$$inlined$CoroutineExceptionHandler$1;";
    static final String PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden";
    static final String STORY_CARD_DATE_KEY = "last_date_creation_card_shown";
    static final long PEOPLE_SERVER_FLAG = 72344235860374863L;

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
        PATCHES.put("Hide People You May Know", List.of("people", "people_list_end", "people_jewel", "people_tab", "people_search", "people_story"));
        PATCHES.put("Hide friend request cards", List.of("friend_requests"));
        PATCHES.put("Hide growth prompts", List.of("growth", "growth_notes", "growth_story_card"));
        PATCHES.put("Hide inbox promotions", List.of("inbox_promotions"));
        PATCHES.put("Hide stories and notes", List.of("stories"));
        PATCHES.put("Hide inbox tabs", List.of("subtabs"));
        PATCHES.put("Hide Facebook shortcuts", List.of("facebook"));
        PATCHES.put("Hide Meta AI", List.of("ai_menu", "ai_fab", "ai_toolbar", "ai_tab", "ai_search", "ai_search_chip"));
        PATCHES.put("Hide Chat Moments", List.of("moments"));
        PATCHES.put("Hide Reels badge", List.of("reels_badge"));
        PATCHES.put("Hide AI sticker tools", List.of("ai_stickers"));
        PATCHES.put("Hide avatar stickers", List.of("avatar_stickers", "avatar_tabs"));
        PATCHES.put("Hide chat promotions", List.of("chat_promotions"));
        PATCHES.put("Hide business reply suggestions", List.of("suggested_replies"));
        PATCHES.put("Hide business typing suggestions", List.of("business_suggestions"));
        PATCHES.put("Hide event prompts", List.of("event_prompts"));
        PATCHES.put("Hide typing indicator", List.of("typing", "typing_mailbox"));
        PATCHES.put("Open web links externally", List.of("browser"));
        PATCHES.put("Allow chat bubbles", List.of("bubbles"));
        PATCHES.put("Use system emoji", List.of("emoji_typeface"));
        PATCHES.put("Send photos at original quality", List.of("original_photo"));
        PATCHES.put("Allow screenshots", List.of("allow_screenshot"));
        PATCHES.put("Hide read receipts", List.of("hide_read_receipts", "read_mailbox"));
        PATCHES.put("Keep unsent messages", List.of("keep_unsent", "unsent_indicator", "delta_unsent"));
        PATCHES.put("View stories anonymously", List.of("anonymous_stories"));
        PATCHES.put("Save any story", List.of("save_stories"));
        PATCHES.put("Open settings from menu", List.of("menu_settings"));
    }

    static final Set<String> ORIGINAL_PHOTO_HOOKS = Set.of(
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->transcodeImage(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B",
        "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;->transcodeImageAsync(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Lcom/facebook/msys/mci/TranscodeImageCompletionCallback;)V");

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
        Profile shape = recorded.isEmpty() ? null : recorded.iterator().next();
        for (var key : CONTROL_KEYS) {
            int count = found.hooks.getOrDefault(key, Set.of()).size();
            int expected = shape == null ? Math.max(count, 1) : shape.hooks.getOrDefault(key, Set.of()).size();
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
                flag.getWideLiteral() == PEOPLE_SERVER_FLAG) flags.add(i);
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
        var ads = controls.get("ads");
        if (ads.size() == 1) {
            var code = instructions(ads.get(0));
            var exits = new ArrayList<String>();
            for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.RETURN_OBJECT) exits.add(String.valueOf(i));
            if (!exits.isEmpty()) {
                found.fields.put("adFilterSize", String.valueOf(code.size()));
                found.fields.put("adFilterExits", String.join(" ", exits));
            }
        }
        for (var site : findDexSites(classes)) found.dexSites.put(site.getKey(), site.getValue());
        return found;
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

    static Map<String, List<Method>> findControls(List<ClassDef> classes) {
        var found = new LinkedHashMap<String, List<Method>>();
        for (var key : CONTROL_KEYS) found.put(key, new ArrayList<>());
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

                // emoji_typeface
                if ("Landroid/graphics/Typeface;".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && !isStatic &&
                    strings.contains("FacebookEmojiTypefaceProviderImpl")) {
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

                // menu_settings: Settings folder builder, grid binder and the drawer's folder click
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
        for (ClassDef cls : classes) {
            if (cls.getType().equals(DARK_SCHEME)) scheme = cls;
            if (cls.getType().equals(FDS_COLORS)) fds = cls;
            for (Method m : cls.getMethods()) {
                for (Instruction i : instructions(m)) {
                    Opcode op = i.getOpcode();
                    if ((op == Opcode.CONST || op == Opcode.CONST_HIGH16) && i instanceof NarrowLiteralInstruction literal &&
                        DARK_SURFACES.contains(literal.getNarrowLiteral())) surfaces++;
                    if ((op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_VIRTUAL) && COLOR_CALLS.contains(ref(i))) colorCalls++;
                }
            }
        }
        if (scheme == null) {
            problems.add("no " + DARK_SCHEME);
        } else {
            var resolvers = new ArrayList<Method>();
            for (Method m : scheme.getMethods()) if (isTokenColorMethod(m)) resolvers.add(m);
            Method resolver = onlyOne(resolvers, "DarkColorScheme token resolver", problems);
            if (resolver != null) hookBeforeReturn(resolver, problems, targets);
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
                if (check != null) hookBeforeReturn(check, problems, targets);
            }
            if (intReturns == 0) problems.add("FDSColors has no int return to hook");
            else targets.add(intReturns + " FDSColors int returns");
        }
        if (surfaces == 0) problems.add("no dark surface constants for route 3");
        else targets.add(surfaces + " dark surface constants");
        if (colorCalls == 0) problems.add("no Color.parseColor or Context.getColor calls for route 4");
        else targets.add(colorCalls + " Color.parseColor and Context.getColor calls");
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
        if (args.length < 1 || args.length > 3 || (args.length > 1 && !"--save".equals(args[1]))) {
            System.err.println("Usage: CompatReport <apk> [--save [<profiles dir>]]");
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

        // The build's profile: recorded already, written now, or the controls that keep it from being written
        System.out.println();
        if (!problems.isEmpty()) {
            System.out.println("PROFILE: not written. These controls did not resolve:");
            for (var problem : problems) System.out.println("       " + problem);
            anyFail = true;
        } else if (expected != null && expected.sameControls(found) && expected.dexSites.equals(found.dexSites)) {
            System.out.println("PROFILE: matches scripts/profiles/" + found.code + ".txt" +
                (expected.sha256.equals(found.sha256) ? "" : " (from a different APK file than the recorded one)"));
        } else if (expected != null) {
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
            System.out.println("RESULT: FAIL — one or more patches are incompatible with this APK.");
            if (!builds.isEmpty()) System.out.println("Use an unmodified arm64 Messenger " + supported(builds) + ".");
            System.exit(1);
        } else {
            System.out.println("RESULT: PASS — all " + (PATCHES.size() + 3) + " patches are compatible.");
            System.exit(0);
        }
    }
}
