import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22b;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Small compiled outputs with safe registers but incorrect family installation or mutation contracts. */
public final class FeatureDexFixture {
    private static final String BASE = "Lapp/hushtumblr/extension/tumblr/";
    private static final String STATUS = BASE + "settings/SettingsStatus;";
    private static final String ENTRY = BASE + "settings/SettingsEntry;";
    private static final String UTILS = "Lapp/hushtumblr/extension/shared/Utils;";
    // Tumblr's application inherits onCreate from com.tumblr.CoreApp, and its launcher inherits
    // onNewIntent from an AndroidX activity, so the settings hooks land in a superclass of each.
    // Each ends at the framework class the real one does, since a hook's argument is held to the
    // type it takes, and a stand-in ending at Object would be a Context that isn't one.
    private static final String APP = "Lcom/tumblr/App;";
    private static final String CORE_APP = "Lcom/tumblr/CoreApp;";
    private static final String ACTIVITY = "Lcom/tumblr/ui/activity/JumpoffActivity;";
    private static final String COMPONENT_ACTIVITY = "Lfixture/ComponentActivity;";
    // A blog's posts page is a subclass of the page every blog, likes and search page starts from.
    private static final String TIMELINE_RESPONSE = "Lcom/tumblr/rumblr/response/timeline/TimelineResponse;";
    private static final String POSTS_RESPONSE = "Lcom/tumblr/rumblr/response/timeline/PostsResponse;";
    private static final Map<String, String> SUPERCLASSES = Map.of(APP, CORE_APP, ACTIVITY, COMPONENT_ACTIVITY,
            CORE_APP, "Landroid/app/Application;", COMPONENT_ACTIVITY, "Landroid/app/Activity;", POSTS_RESPONSE, TIMELINE_RESPONSE,
            "Lfixture/PostSpacing;", "Landroidx/recyclerview/widget/RecyclerView$o;");
    private static final String VOID = "V";
    private static final String OBJECT = "Ljava/lang/Object;";
    private static final String LIST = "Ljava/util/List;";
    private static final String CONTEXT = "Landroid/content/Context;";
    private static final String INTENT = "Landroid/content/Intent;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String MANAGER = "Landroid/content/pm/ShortcutManager;";
    private static final String PUBLISHER = "Lfixture/ShortcutPublisher;";
    private static final String INFO = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;";
    private static final String ADVERTISING = BASE + "privacy/AdvertisingId;";
    private static final String HEADERS = "Lfixture/FirebaseHeaders;";
    private static final String PUSH = BASE + "notifications/PushNotifications;";
    private static final String URL = "Ljava/net/URL;";
    private static final String HTTP = "Ljava/net/HttpURLConnection;";
    private static final String CONNECTION = "Ljava/net/URLConnection;";
    private static final String POST = "Lcom/tumblr/rumblr/model/post/Post;";
    private static final String HEADER = "Lcom/tumblr/rumblr/model/post/PostHeaderContext;";
    private static final String PAID_POST = BASE + "timeline/HushPaidPost;";
    private static final String TIMELINE_FILTER = BASE + "timeline/TimelineFilter;";
    private static final String TIMELINE_PAGING = BASE + "timeline/TimelinePaging;";
    private static final String TIMELINE_FRAGMENT = "Lcom/tumblr/ui/fragment/TimelineFragment;";
    private static final String PAGINATION_FRAGMENT = "Lcom/tumblr/ui/fragment/PaginationFragment;";
    private static final String PAGE_LINKS = "Lcom/tumblr/timeline/model/link/TimelinePaginationLink;";
    private static final String PAGE_LINK = "Lcom/tumblr/timeline/model/link/Link;";
    private static final String LOAD_TYPE = "Lxrl;";
    private static final String FEATURE = "Lfixture/Feature;";
    private static final String FEATURE_CHECK = "Lfixture/FeatureCheck;";
    private static final String FEATURE_SWITCHES = BASE + "flags/FeatureSwitches;";
    private static final String REBLOG_TRAIL = "Lcom/tumblr/rumblr/model/post/ReblogTrail;";
    private static final String TEXT_BLOCK = "Lcom/tumblr/rumblr/model/post/blocks/TextBlock;";
    private static final String ACTIVITY_NOTIFICATION = "Lcom/tumblr/rumblr/model/activity/ActivityNotification;";
    private static final String ACTIVITY_TYPE = "Lcom/tumblr/rumblr/model/activity/ActivityNotificationType;";
    private static final String HUSH_ACTIVITY = BASE + "notifications/HushActivityNotification;";
    private static final String ACTIVITY_FILTER = BASE + "notifications/ActivityNotifications;";
    private static final String ACTIVITY_RESPONSE = "Lcom/tumblr/rumblr/response/ActivityNotificationsResponse;";
    private static final String PUSH_RESPONSE = "Lcom/tumblr/rumblr/response/NotificationsResponse;";
    private static final String CAROUSEL = "Lcom/tumblr/rumblr/model/carousel/Carousel;";
    private static final String POST_HEADER = "Lcom/tumblr/ui/widget/PostCardHeader;";
    private static final String POST_PARTS = BASE + "ui/PostParts;";
    private static final String FOOTER = BASE + "ui/PostFooter;";
    private static final String COMMUNITY_FOOTER = "Lcom/tumblr/ui/widget/CommunityPostCardFooter;";
    private static final String BAR = "Lfixture/BottomBar;";
    private static final String TIMESTAMPS = BASE + "ui/PostTimestamps;";
    private static final String USER_INFO = "Lcom/tumblr/UserInfo;";
    private static final String IMAGE_BLOCK = "Lcom/tumblr/rumblr/model/post/blocks/ImageBlock;";
    private static final String PHOTO_CONTAINER = "Lcom/tumblr/ui/widget/graywater/viewholder/PhotoContainer;";
    private static final String PHOTO_HOLDER = "Lcom/tumblr/ui/widget/graywater/viewholder/PhotoViewHolder;";
    private static final String PHOTO_ROW_ITEM = "Lcom/tumblr/ui/widget/graywater/viewholder/PhotosetRowItem;";
    private static final String PHOTO_BINDER = "Lzka$a;";
    private static final String GALLERY_BINDER = "Lx1f;";
    private static final String GALLERY_ROW = "Lu1f;";
    private static final String ALT_TEXT = BASE + "ui/AltTextCaptions;";
    private static final String IMAGE_DESCRIPTION = BASE + "ui/HushImageDescription;";
    private static final String IMAGE_CONTAINER = BASE + "ui/HushImageContainer;";
    private static final String IMAGE_ROW = BASE + "ui/HushImageRow;";
    private static final List<String> SHORTCUTS = List.of("pushDynamicShortcut", "addDynamicShortcuts", "setDynamicShortcuts", "updateShortcuts", "removeAllDynamicShortcuts");
    private static final Map<String, String[]> FAMILIES = new LinkedHashMap<>();
    private static final Map<String, Boolean> FLAGS = new LinkedHashMap<>();
    private static final List<String> SMALL_CASES = new ArrayList<>();

    private static ImmutableMethodReference ref(String type, String name, String result, String... parameters) {
        return new ImmutableMethodReference(type, name, Arrays.asList(parameters), result);
    }

    private static Instruction invoke(Opcode opcode, ImmutableMethodReference ref, int... registers) {
        int[] words = new int[5];
        System.arraycopy(registers, 0, words, 0, registers.length);
        return new ImmutableInstruction35c(opcode, registers.length, words[0], words[1], words[2], words[3], words[4], ref);
    }

    private static Method method(String owner, String name, String result, boolean isStatic, int registers, List<Instruction> body, String... parameters) {
        List<ImmutableMethodParameter> types = new ArrayList<>();
        for (String parameter : parameters) types.add(new ImmutableMethodParameter(parameter, Set.of(), null));
        return new ImmutableMethod(owner, name, types, result,
                AccessFlags.PUBLIC.getValue() | (isStatic ? AccessFlags.STATIC.getValue() : 0), Set.of(), Set.of(),
                new ImmutableMethodImplementation(registers, body, List.of(), List.of()));
    }

    private static ClassDef type(String owner, List<Method> methods) {
        boolean bridge = owner.startsWith(BASE + "timeline/Hush") || owner.startsWith(BASE + "ui/Hush") || owner.equals(HUSH_ACTIVITY)
                || owner.equals(ACTIVITY_NOTIFICATION) || owner.equals(PHOTO_CONTAINER) || owner.equals(GALLERY_ROW);
        List<String> interfaces = new ArrayList<>();
        if (owner.equals(POST) && methods.stream().anyMatch(m -> m.getName().equals("hushFollowed"))) interfaces.add(PAID_POST);
        if (methods.stream().anyMatch(m -> m.getName().equals("hushContent") || m.getName().equals("hushText")))
            interfaces.add(BASE + "timeline/" + (owner.equals(POST) ? "HushPost;" : owner.endsWith("ReblogTrail;") ? "HushTrail;" : "HushText;"));
        if (owner.equals(ACTIVITY_NOTIFICATION) && methods.stream().anyMatch(m -> m.getName().equals("hushNotificationType"))) interfaces.add(HUSH_ACTIVITY);
        if (owner.equals(IMAGE_BLOCK) && methods.stream().anyMatch(m -> m.getName().equals("hushAltText"))) interfaces.add(IMAGE_DESCRIPTION);
        if (owner.equals(PHOTO_CONTAINER) && methods.stream().anyMatch(m -> m.getName().equals("hushImageFrame"))) interfaces.add(IMAGE_CONTAINER);
        if (owner.equals(GALLERY_ROW) && methods.stream().anyMatch(m -> m.getName().equals("hushImageItems"))) interfaces.add(IMAGE_ROW);
        if (owner.equals(PHOTO_HOLDER) || owner.equals(PHOTO_ROW_ITEM)) interfaces.add(PHOTO_CONTAINER);
        List<ImmutableField> fields = new ArrayList<>();
        if (owner.equals(POST) && methods.stream().anyMatch(m -> m.getName().equals("hushSetJsonPresence")))
            for (String name : List.of("hushRootTrailPresent", "hushPaidContextKnown")) fields.add(new ImmutableField(owner, name, "Z",
                    AccessFlags.PRIVATE.getValue(), null, Set.of(), Set.of()));
        if (owner.equals(PHOTO_BINDER)) for (String name : List.of("c", "d")) fields.add(new ImmutableField(owner, name, IMAGE_BLOCK,
                AccessFlags.PRIVATE.getValue() | AccessFlags.FINAL.getValue(), null, Set.of(), Set.of()));
        if (owner.equals(ALT_TEXT) && methods.stream().anyMatch(m -> m.getName().equals("clearGallery")))
            fields.add(new ImmutableField(owner, "CAPTIONS", "Ljava/util/Map;",
                    AccessFlags.PRIVATE.getValue() | AccessFlags.STATIC.getValue() | AccessFlags.FINAL.getValue(), null, Set.of(), Set.of()));
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue() | (bridge ? AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue() : 0),
                owner.equals(FEATURE) || owner.equals(ACTIVITY_TYPE) ? "Ljava/lang/Enum;" : owner.equals(COMMUNITY_FOOTER)
                        ? "Landroid/view/ViewGroup;" : SUPERCLASSES.getOrDefault(owner, OBJECT), interfaces, null,
                Set.of(), fields, methods);
    }

    private static Method abstractMethod(String owner, String name, String result) {
        return new ImmutableMethod(owner, name, List.of(), result, AccessFlags.PUBLIC.getValue() | AccessFlags.ABSTRACT.getValue(),
                Set.of(), Set.of(), null);
    }

    private static Instruction end() { return new ImmutableInstruction10x(Opcode.RETURN_VOID); }
    private static Instruction literal(String text, int register) {
        return new ImmutableInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference(text));
    }

    private static Map<String, List<Method>> hosts(boolean patched) {
        Map<String, List<Method>> classes = new LinkedHashMap<>();
        List<Instruction> app = new ArrayList<>();
        if (patched) {
            app.add(invoke(Opcode.INVOKE_STATIC, ref(UTILS, "setContext", VOID, CONTEXT), 0));
            app.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onApplicationCreate", VOID)));
        }
        app.add(end());
        classes.put(APP, new ArrayList<>());
        classes.put(CORE_APP, new ArrayList<>(List.of(method(CORE_APP, "onCreate", VOID, false, 1, app))));
        List<Instruction> create = new ArrayList<>();
        if (patched) create.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onActivityCreate", VOID, "Landroid/app/Activity;"), 0));
        create.add(end());
        List<Instruction> intent = new ArrayList<>();
        if (patched) intent.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onNewIntent", VOID, "Landroid/app/Activity;", INTENT), 0, 1));
        intent.add(end());
        classes.put(ACTIVITY, new ArrayList<>(List.of(method(ACTIVITY, "onCreate", VOID, false, 2, create, "Landroid/os/Bundle;"))));
        classes.put(COMPONENT_ACTIVITY, new ArrayList<>(List.of(method(COMPONENT_ACTIVITY, "onNewIntent", VOID, false, 2, intent, INTENT))));
        shortcuts(classes, patched, "good");
        return classes;
    }

    private static void extensions(Map<String, List<Method>> classes) {
        List<Method> flags = new ArrayList<>();
        FLAGS.forEach((name, value) -> flags.add(method(STATUS, name, "Z", true, 1,
                List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, value ? 1 : 0), new ImmutableInstruction11x(Opcode.RETURN, 0)))));
        classes.put(STATUS, flags);
        classes.put(UTILS, List.of(method(UTILS, "setContext", VOID, true, 1, List.of(end()), CONTEXT),
                method(UTILS, "settingsReady", "Z", true, 1,
                        List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction11x(Opcode.RETURN, 0)))));
        List<Method> entry = new ArrayList<>(List.of(
                method(ENTRY, "onApplicationCreate", VOID, true, 1, List.of(end())),
                method(ENTRY, "onActivityCreate", VOID, true, 1, List.of(end()), "Landroid/app/Activity;"),
                method(ENTRY, "onNewIntent", VOID, true, 2, List.of(end()), "Landroid/app/Activity;", INTENT)));
        for (Method m : classes.getOrDefault(ENTRY, List.of())) if (SHORTCUTS.contains(m.getName())) entry.add(m);
        classes.put(ENTRY, entry);
    }

    private static Instruction readiness() { return invoke(Opcode.INVOKE_STATIC, ref(UTILS, "settingsReady", "Z")); }

    private static void shortcuts(Map<String, List<Method>> classes, boolean patched, String variant) {
        List<Instruction> publisher = new ArrayList<>();
        List<Method> wrappers = new ArrayList<>();
        for (String name : SHORTCUTS) {
            String[] parameters = name.equals("removeAllDynamicShortcuts") ? new String[]{}
                    : new String[]{name.equals("pushDynamicShortcut") ? "Landroid/content/pm/ShortcutInfo;" : LIST};
            String result = name.equals("pushDynamicShortcut") || parameters.length == 0 ? VOID : "Z";
            int[] hostArgs = parameters.length == 0 ? new int[]{1} : new int[]{1, name.equals("pushDynamicShortcut") ? 2 : 3};
            List<String> wrapperParameters = new ArrayList<>(List.of(MANAGER)); wrapperParameters.addAll(Arrays.asList(parameters));
            publisher.add(invoke(patched ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL,
                    patched ? ref(ENTRY, name, result, wrapperParameters.toArray(String[]::new)) : ref(MANAGER, name, result, parameters), hostArgs));
            if (!result.equals(VOID)) publisher.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            if (!patched) continue;
            List<Instruction> body = new ArrayList<>();
            if (variant.equals(name)) {
                if (result.equals(VOID)) body.add(end());
                else { body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); body.add(new ImmutableInstruction11x(Opcode.RETURN, 0)); }
            }
            if (variant.equals("branch-good") && name.equals("pushDynamicShortcut")) {
                body.add(new ImmutableInstruction10t(Opcode.GOTO, 2)); body.add(end());
            }
            body.add(invoke(Opcode.INVOKE_VIRTUAL, ref(MANAGER, name, result, parameters), parameters.length == 0 ? new int[]{1} : new int[]{1, 2}));
            if (!result.equals(VOID)) body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            body.add(result.equals(VOID) ? end() : new ImmutableInstruction11x(Opcode.RETURN, 0));
            wrappers.add(method(ENTRY, name, result, true, wrapperParameters.size() + 1, body, wrapperParameters.toArray(String[]::new)));
        }
        publisher.add(end());
        classes.put(PUBLISHER, List.of(method(PUBLISHER, "publish", VOID, true, 4, publisher, MANAGER, "Landroid/content/pm/ShortcutInfo;", LIST)));
        if (patched) classes.put(ENTRY, wrappers);
    }

    static void initialize(Path contracts) throws Exception {
        FAMILIES.clear();
        FLAGS.clear();
        for (String line : Files.readAllLines(contracts, StandardCharsets.UTF_8)) if (line.startsWith("family|")) {
            String[] values = line.trim().split("\\|", -1);
            FAMILIES.put(values[1], new String[]{values[2], values[3]});
            FLAGS.put(values[1], false);
            for (String cap : capabilities(values[1])) FLAGS.put(cap, false);
        }
    }

    static Map<String, ClassDef> baseClasses(boolean patched) {
        Map<String, List<Method>> classes = hosts(patched);
        if (patched) extensions(classes);
        Map<String, ClassDef> defs = new LinkedHashMap<>();
        classes.forEach((owner, methods) -> defs.put(owner, type(owner, methods)));
        return defs;
    }

    static void addTimeline(Map<String, ClassDef> defs, boolean patched) {
        Map<String, List<Method>> classes = new LinkedHashMap<>();
        timeline(classes, patched);
        classes.forEach((owner, methods) -> defs.put(owner, type(owner, methods)));
    }

    static List<String> selected(String... families) {
        List<String> names = new ArrayList<>(List.of("HushTumblr settings"));
        for (String family : families) names.add(FAMILIES.get(family)[0]);
        return names;
    }

    static void enable(String name) {
        FLAGS.put(name, true);
        for (String cap : capabilities(name)) FLAGS.put(cap, true);
    }

    /** A family's capability flags; none for a manifest-only family, whose contract column is empty. */
    private static List<String> capabilities(String family) {
        String column = FAMILIES.get(family)[1];
        return column.isEmpty() ? List.of() : List.of(column.split(","));
    }

    static void reset() { FLAGS.replaceAll((key, value) -> false); }

    private static void write(File root, String name, Map<String, List<Method>> classes, boolean patched, String... selected) throws Exception {
        if (patched) extensions(classes);
        if (name.equals("feature-no-status")) classes.remove(STATUS);
        if (name.equals("feature-nonboolean-status")) {
            List<Method> status = new ArrayList<>(classes.get(STATUS));
            status.set(0, method(STATUS, status.get(0).getName(), "Z", true, 1,
                    List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 2), new ImmutableInstruction11x(Opcode.RETURN, 0))));
            classes.put(STATUS, status);
        }
        List<ClassDef> defs = new ArrayList<>();
        classes.forEach((owner, methods) -> defs.add(type(owner, methods)));
        DexPool.writeTo(new File(root, name + ".dex").getPath(), new ImmutableDexFile(Opcodes.getDefault(), defs));
        if (patched) {
            Files.write(new File(root, name + ".selected").toPath(), selected(selected), StandardCharsets.UTF_8);
        }
    }

    /**
     * Google's advertising ID getters, with Hide advertising ID's answer hooks unless clean. Each
     * getter is v0 then this, and its hook takes the answer in v0 and hands back the one returned.
     */
    private static void advertisingId(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        ImmutableMethodReference idHook = ref(ADVERTISING, "id", STRING, STRING);
        List<Instruction> id = new ArrayList<>(List.of(literal(variant.equals("changed-original") ? "fixture-other-id" : "fixture-ad-id", 0)));
        List<Instruction> limit = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)));
        if (hooked && !variant.equals("missing")) {
            for (int n = 0; n < (variant.equals("duplicate") ? 2 : 1); n++) {
                // The wrong register is this: still an object, so only the contract can see it.
                id.add(invoke(Opcode.INVOKE_STATIC, idHook, variant.equals("wrong-register") ? 1 : 0));
                id.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
            }
        }
        if (hooked) {
            limit.add(invoke(Opcode.INVOKE_STATIC, ref(ADVERTISING, "limitTracking", "Z", "Z"), 0));
            limit.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        }
        id.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        limit.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        List<Method> info = new ArrayList<>(List.of(method(INFO, "getId", STRING, false, 2, id),
                method(INFO, "isLimitAdTrackingEnabled", "Z", false, 2, limit)));
        if (variant.equals("misrouted")) info.add(method(INFO, "unrelated", VOID, true, 1,
                List.of(literal("fixture-ad-id", 0), invoke(Opcode.INVOKE_STATIC, idHook, 0), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), end())));
        classes.put(INFO, info);
        if (!hooked || variant.equals("missing-callee")) return;
        // Each hook is v0 then its parameter, and answers the parameter once settings are ready.
        List<Instruction> answer = new ArrayList<>();
        if (variant.equals("unreachable-control")) answer.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
        answer.addAll(List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)));
        List<Instruction> flag = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 1));
        classes.put(ADVERTISING, List.of(method(ADVERTISING, "id", STRING, true, 2, answer, STRING),
                method(ADVERTISING, "limitTracking", "Z", true, 2, flag, "Z")));
    }

    /**
     * Firebase's request header builder the way Tumblr's build has it: the certificate header's name,
     * a call to the builder's own fingerprint method, that call's answer and the write, with Fix push
     * notifications' hook between the answer and the write unless clean. The builder is v0 the
     * connection, v1 a header name and v2 its value, then this, the URL and the API key.
     */
    private static void firebase(Map<String, List<Method>> classes, String variant) {
        ImmutableMethodReference write = ref(HTTP, "addRequestProperty", VOID, STRING, STRING);
        ImmutableMethodReference hook = ref(PUSH, "certificateHeader", STRING, CONNECTION, STRING);
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        List<Instruction> body = new ArrayList<>(List.of(
                invoke(Opcode.INVOKE_VIRTUAL, ref(URL, "openConnection", CONNECTION), 4),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(HTTP)),
                literal("X-Android-Package", 1), literal("com.tumblr", 2), invoke(Opcode.INVOKE_VIRTUAL, write, 0, 1, 2),
                literal("X-Android-Cert", 1)));
        // Early is where the hook went in a build that wrote the fingerprint straight after the name.
        if (hooked && variant.equals("early")) {
            body.add(invoke(Opcode.INVOKE_STATIC, hook, 0, 2));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
        }
        body.add(invoke(Opcode.INVOKE_VIRTUAL, ref(HEADERS, "fingerprint", STRING), 3));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
        if (hooked && !variant.equals("early")) {
            // The wrong value is the header's name: still a String, so only the contract can see it.
            body.add(invoke(Opcode.INVOKE_STATIC, hook, 0, variant.equals("wrong-value") ? 1 : 2));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
        }
        body.add(invoke(Opcode.INVOKE_VIRTUAL, write, 0, 1, 2));
        body.add(literal("x-goog-api-key", 1));
        body.add(invoke(Opcode.INVOKE_VIRTUAL, write, 0, 1, 5));
        body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.put(HEADERS, List.of(
                method(HEADERS, "fingerprint", STRING, false, 2, List.of(literal("Could not get fingerprint hash for package: ", 0),
                        new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))),
                method(HEADERS, "headers", HTTP, false, 6, body, URL, STRING)));
        if (!hooked) return;
        classes.put(PUSH, List.of(method(PUSH, "certificateHeader", STRING, true, 3,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2)),
                CONNECTION, STRING)));
    }

    /** The shared hooks Hide ads needs before its dedicated paid-post bridge can be exercised. */
    private static void timeline(Map<String, List<Method>> classes, boolean hooked) {
        timeline(classes, hooked ? "good" : "clean");
    }

    private static void timeline(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        String pagination = "Lcom/tumblr/rumblr/model/PaginationLink;";
        for (String owner : List.of("Lcom/tumblr/rumblr/model/Timeline;", TIMELINE_RESPONSE)) {
            String[] parameters = owner.endsWith("Timeline;") ? new String[]{LIST, pagination} : new String[]{LIST, pagination, "Ljava/util/Map;"};
            List<Instruction> body = new ArrayList<>();
            boolean filter = hooked && !(variant.equals("missing") && owner.endsWith("TimelineResponse;"));
            if (filter && !variant.equals("late")) {
                body.add(invoke(Opcode.INVOKE_STATIC, ref(TIMELINE_FILTER, "filter", LIST, LIST), variant.equals("wrong-list") ? 2 : 1));
                body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1));
            }
            body.add(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0));
            if (filter && variant.equals("late")) body.addAll(List.of(invoke(Opcode.INVOKE_STATIC, ref(TIMELINE_FILTER, "filter", LIST, LIST), 1),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)));
            body.add(end());
            classes.put(owner, List.of(method(owner, "<init>", VOID, false, parameters.length + 1, body, parameters)));
        }
        // The subclass keeps its own copy of the items it hands the base constructor, and reads that back.
        List<Instruction> copy = new ArrayList<>();
        if (hooked && !variant.equals("copy-missing")) copy.addAll(List.of(invoke(Opcode.INVOKE_STATIC, ref(TIMELINE_FILTER, "filterKept", LIST, LIST), 1),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)));
        copy.addAll(List.of(invoke(Opcode.INVOKE_DIRECT, ref(TIMELINE_RESPONSE, "<init>", VOID, LIST, pagination, "Ljava/util/Map;"), 0, 1, 2, 3),
                member(Opcode.IPUT_OBJECT, 1, 0, POSTS_RESPONSE, "f", LIST), end()));
        classes.put(POSTS_RESPONSE, List.of(method(POSTS_RESPONSE, "<init>", VOID, false, 4, copy, LIST, pagination, "Ljava/util/Map;"),
                method(POSTS_RESPONSE, "getTimelineObjects", LIST, false, 2, List.of(member(Opcode.IGET_OBJECT, 0, 1, POSTS_RESPONSE, "f", LIST),
                        new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))));
        if (hooked) classes.put(TIMELINE_FILTER, List.of(method(TIMELINE_FILTER, "filter", LIST, true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), LIST),
                method(TIMELINE_FILTER, "filterKept", LIST, true, 2,
                        List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), LIST)));
        directPost(classes, variant);
        // The filter can empty a page, so the fragment's question about an empty page comes with it.
        paging(classes, hooked ? "good" : "clean");
    }

    /** The query that opens one post by itself, telling the extension the id right before it asks. */
    private static void directPost(Map<String, List<Method>> classes, String variant) {
        String service = "Lcom/tumblr/rumblr/TumblrService;";
        String directPosts = BASE + "timeline/DirectPosts;";
        Instruction told = invoke(Opcode.INVOKE_STATIC, ref(directPosts, "opening", VOID, STRING), variant.equals("direct-wrong-id") ? 0 : 1);
        boolean before = !variant.equals("clean") && !variant.equals("direct-missing") && !variant.equals("direct-late");
        List<Instruction> body = new ArrayList<>(List.of(literal("blog", 0), literal("55", 1)));
        if (before) body.add(told);
        body.addAll(List.of(invoke(Opcode.INVOKE_INTERFACE, ref(service, "postPermalink", "Lretrofit2/Call;", STRING, STRING), 2, 0, 1),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0)));
        if (variant.equals("direct-late")) body.add(told);
        body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        String query = "Lfixture/PostQuery;";
        classes.put(query, List.of(method(query, "b", "Lretrofit2/Call;", false, 3, body, service)));
        if (!variant.equals("clean")) classes.put(directPosts, List.of(method(directPosts, "opening", VOID, true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()), STRING)));
    }

    private static Instruction member(Opcode opcode, int value, int receiver, String owner, String name, String type) {
        return new ImmutableInstruction22c(opcode, value, receiver, new ImmutableFieldReference(owner, name, type));
    }

    private static Instruction loadType(int register) {
        return new ImmutableInstruction21c(Opcode.SGET_OBJECT, register, new ImmutableFieldReference(LOAD_TYPE, "PAGINATION", LOAD_TYPE));
    }

    /**
     * A timeline fragment as Tumblr's page delivery leaves it: this in v3, the load type in v4, the
     * items in v5, the page links in v6, the extras in v7 and the cache flag in v8. An empty page
     * returns for a next page and shows the empty view for a first one; any other drops the request,
     * settles the load and keeps the links. Unless clean, the paging question sits right after the
     * kept isEmpty() answer.
     */
    static List<Method> pagingMethods(String variant) {
        ImmutableMethodReference load = ref(TIMELINE_FRAGMENT, "v6", VOID, LOAD_TYPE, "Z");
        ImmutableMethodReference emptyView = ref(TIMELINE_FRAGMENT, "N4", VOID), settle = ref(TIMELINE_FRAGMENT, "Q5", VOID, LOAD_TYPE);
        List<Instruction> body = new ArrayList<>(List.of(
                invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "isEmpty", "Z"), 5), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 7),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1), new ImmutableInstruction21t(Opcode.IF_EQZ, 7, 0),
                loadType(5), new ImmutableInstruction22t(Opcode.IF_NE, 4, 5, 0),
                invoke(Opcode.INVOKE_VIRTUAL, ref(TIMELINE_FRAGMENT, "P5", VOID), 3), end(),
                member(Opcode.IPUT_BOOLEAN, 1, 3, PAGINATION_FRAGMENT, "l", "Z"), invoke(Opcode.INVOKE_VIRTUAL, emptyView, 3), end(),
                new ImmutableInstruction11n(Opcode.CONST_4, 7, 0), member(Opcode.IPUT_OBJECT, 7, 3, TIMELINE_FRAGMENT, "W", "Lretrofit2/Call;"),
                invoke(Opcode.INVOKE_VIRTUAL, settle, 3, 4),
                member(Opcode.IPUT_OBJECT, 6, 3, PAGINATION_FRAGMENT, "k", "Landroid/os/Parcelable;"),
                member(Opcode.IPUT_BOOLEAN, 7, 3, PAGINATION_FRAGMENT, "l", "Z"),
                invoke(Opcode.INVOKE_VIRTUAL, ref(PAGE_LINKS, "d", PAGE_LINK), 6), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6), end()));
        captionBranch(body, 3, 11); captionBranch(body, 5, 8);
        if (!variant.equals("clean") && !variant.equals("missing")) {
            int at = variant.equals("late") ? 3 : 2;
            List<Instruction> hook = new ArrayList<>(List.of(
                    new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 6, 0),
                    invoke(Opcode.INVOKE_VIRTUAL, ref(PAGE_LINKS, variant.equals("wrong-next") ? "f" : "d", PAGE_LINK), 6),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                    invoke(Opcode.INVOKE_STATIC, ref(TIMELINE_PAGING, "onPage", "I", OBJECT, OBJECT, OBJECT, "Z"), 3, 4, 1, 7),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT, 1), new ImmutableInstruction21t(Opcode.IF_EQZ, 1, 0),
                    new ImmutableInstruction11n(Opcode.CONST_4, 7, 1), new ImmutableInstruction22t(Opcode.IF_EQ, 1, 7, 0),
                    member(Opcode.IPUT_BOOLEAN, 7, 3, PAGINATION_FRAGMENT, variant.equals("wrong-flag") ? "m" : "l", "Z"),
                    invoke(Opcode.INVOKE_VIRTUAL, emptyView, 3), end(),
                    member(Opcode.IPUT_OBJECT, 6, 3, PAGINATION_FRAGMENT, "k", "Landroid/os/Parcelable;"), loadType(1),
                    new ImmutableInstruction22t(Opcode.IF_EQ, 4, 1, 0), invoke(Opcode.INVOKE_VIRTUAL, settle, 3, 4),
                    invoke(Opcode.INVOKE_VIRTUAL, variant.equals("wrong-load") ? ref(TIMELINE_FRAGMENT, "w6", VOID, LOAD_TYPE, "Z") : load, 3, 1, 7), end()));
            body.addAll(at, hook);
            // Tumblr's own two branches moved with their targets, and the block's four land inside it or right after.
            captionBranch(body, at + 1, at + 4); captionBranch(body, at + 6, at + 18); captionBranch(body, at + 8, at + 12);
            captionBranch(body, at + 14, at + 16); captionBranch(body, 21, 29); captionBranch(body, 23, 26);
        }
        return List.of(method(TIMELINE_FRAGMENT, "n4", VOID, false, 9, body, LOAD_TYPE, LIST, PAGE_LINKS, "Ljava/util/Map;", "Z"),
                method(TIMELINE_FRAGMENT, "v6", VOID, false, 3, List.of(end()), LOAD_TYPE, "Z"),
                // The fragment's own next-page call, made when a scroll nears the end.
                method(TIMELINE_FRAGMENT, "Z5", VOID, false, 3,
                        List.of(loadType(0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 1), invoke(Opcode.INVOKE_VIRTUAL, load, 2, 0, 1), end())),
                method(TIMELINE_FRAGMENT, "N4", VOID, false, 1, List.of(end())), method(TIMELINE_FRAGMENT, "P5", VOID, false, 1, List.of(end())),
                method(TIMELINE_FRAGMENT, "Q5", VOID, false, 2, List.of(end()), LOAD_TYPE));
    }

    /** The timeline fragment, with the hook that asks what to do with an emptied page unless clean. */
    private static void paging(Map<String, List<Method>> classes, String variant) {
        classes.put(TIMELINE_FRAGMENT, pagingMethods(variant));
        if (variant.equals("clean")) return;
        List<Instruction> answer = new ArrayList<>();
        if (!variant.equals("uncontrolled")) answer.addAll(List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        answer.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
        classes.put(TIMELINE_PAGING, List.of(method(TIMELINE_PAGING, "onPage", "I", true, 5, answer, OBJECT, OBJECT, OBJECT, "Z")));
    }

    private static void carousel(Map<String, List<Method>> classes, String variant) {
        model(classes, CAROUSEL, new LinkedHashMap<>(Map.of("elements", ref(CAROUSEL, "items", LIST), "other", ref(CAROUSEL, "otherItems", LIST))));
        if (variant.equals("clean")) return;
        List<Method> hooks = new ArrayList<>(classes.getOrDefault(TIMELINE_FILTER, List.of()));
        if (!variant.equals("missing")) hooks.add(method(TIMELINE_FILTER, "carouselItems", LIST, true, 1,
                variant.equals("null") ? List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))
                        : List.of(new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(CAROUSEL)),
                        invoke(Opcode.INVOKE_VIRTUAL, ref(CAROUSEL, variant.equals("wrong-getter") ? "otherItems" : "items", LIST), 0),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), OBJECT));
        classes.put(TIMELINE_FILTER, hooks);
    }

    private static List<Instruction> guard(String owner, String name, boolean yes, String variant) {
        if (variant.equals("clean") || variant.equals("missing")) return new ArrayList<>();
        List<Instruction> body = new ArrayList<>(List.of(invoke(Opcode.INVOKE_STATIC, ref(owner, name, "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, yes ? 4 : 3)));
        if (yes) body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, variant.equals("wrong-answer") ? 0 : 1));
        body.add(yes ? new ImmutableInstruction11x(Opcode.RETURN, 0) : end());
        return body;
    }

    private static Method booleanHook(String owner, String name) {
        return method(owner, name, "Z", true, 1,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
    }

    private static void followButton(Map<String, List<Method>> classes, String variant) {
        List<Method> header = new ArrayList<>(classes.getOrDefault(POST_HEADER, List.of()));
        header.removeIf(m -> m.getName().startsWith("fixtureFollow"));
        String action = "Lcom/tumblr/rumblr/model/post/PostHeaderAction$ActionType;";
        header.add(method(POST_HEADER, "fixtureFollowTest", "Z", false, 3, List.of(
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, new ImmutableFieldReference(action, "FOLLOW", action)),
                invoke(Opcode.INVOKE_DIRECT, ref(POST_HEADER, "fixtureFollowCheck", "Z", OBJECT, OBJECT), 2, 0, 0),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0))));
        List<Instruction> body = guard(POST_PARTS, "hideFollowButton", true, variant);
        body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        body.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        Method check = method(POST_HEADER, "fixtureFollowCheck", "Z", false, 4, body, OBJECT, OBJECT);
        header.add(new ImmutableMethod(POST_HEADER, check.getName(), check.getParameters(), "Z", AccessFlags.PRIVATE.getValue(),
                Set.of(), Set.of(), check.getImplementation()));
        classes.put(POST_HEADER, header);
        if (!variant.equals("clean")) classes.put(POST_PARTS, List.of(booleanHook(POST_PARTS, "hideFollowButton")));
    }

    private static void footerButtons(Map<String, List<Method>> classes, String family, String variant) {
        String[] controls = {"Like", "Reblog", "Comment", "Share", "Save"};
        List<Method> hooks = new ArrayList<>();
        for (String control : controls) {
            String flag = "hide" + control + "Button", name = flag;
            boolean selected = flag.equals(family), hooked = selected && !variant.equals("clean");
            String owner = "Lfixture/" + control + "Engagement;";
            List<Instruction> body = guard(FOOTER, name, false, hooked ? variant : "clean");
            body.add(literal("com.tumblr.ui.widget.splitnotescount.composable." + control + "Engagement (Fixture.kt:1)", 0));
            body.add(end());
            classes.put(owner, List.of(method(owner, "draw", VOID, true, 1, body)));
            if (hooked) hooks.add(booleanHook(FOOTER, name));
        }
        List<Instruction> bind = new ArrayList<>(List.of(literal("footer_", 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                invoke(Opcode.INVOKE_VIRTUAL, ref("Landroid/view/View;", "setTag", VOID, OBJECT), 1, 0)));
        String community = switch (family) {
            case "hideLikeButton" -> "hideCommunityReactions";
            case "hideCommentButton" -> "hideCommunityComments";
            case "hideShareButton" -> "hideCommunityShare";
            default -> null;
        };
        if (community != null && !variant.equals("clean")) {
            if (!variant.equals("missing-community")) bind.add(invoke(Opcode.INVOKE_STATIC, ref(FOOTER, community, VOID, "Landroid/view/ViewGroup;"),
                    variant.equals("wrong-community") ? 0 : 1));
            hooks.add(method(FOOTER, community, VOID, true, 2,
                    List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()), "Landroid/view/ViewGroup;"));
        }
        bind.add(end());
        classes.put(COMMUNITY_FOOTER, List.of(method(COMMUNITY_FOOTER, "bind", VOID, false, 2, bind)));
        if (!hooks.isEmpty()) classes.put(FOOTER, hooks);
    }

    private static void unreadDots(Map<String, List<Method>> classes, String variant) {
        String textView = "Landroid/widget/TextView;", animation = "Landroid/view/animation/Animation;", hookOwner = BASE + "ui/BottomBar;";
        List<Instruction> body = new ArrayList<>();
        if (!variant.equals("clean") && !variant.equals("missing")) body.addAll(List.of(
                invoke(Opcode.INVOKE_STATIC, ref(hookOwner, "unreadBadge", textView, textView), variant.equals("wrong-badge") ? 1 : 2),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2)));
        body.addAll(List.of(new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 11),
                invoke(Opcode.INVOKE_VIRTUAL, ref(textView, "getVisibility", "I"), 2), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 5), invoke(Opcode.INVOKE_VIRTUAL, ref(textView, "startAnimation", VOID, animation), 2, 3), end()));
        classes.put(BAR, List.of(method(BAR, "badgeId", "I", false, 2, List.of(
                new ImmutableInstruction21c(Opcode.SGET, 0, new ImmutableFieldReference("Lcom/tumblr/R$id;", "dashboard_badge", "I")),
                new ImmutableInstruction11x(Opcode.RETURN, 0))), method(BAR, "pop", VOID, false, 4, body, textView, animation)));
        if (!variant.equals("clean")) classes.put(hookOwner, List.of(method(hookOwner, "unreadBadge", textView, true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), textView)));
    }

    private static void timestamps(Map<String, List<Method>> classes, String variant) {
        List<Instruction> body = new ArrayList<>(List.of(literal("pref_is_timestamps", 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                invoke(Opcode.INVOKE_STATIC, ref("Lcom/tumblr/Remember;", "c", "Z", STRING, "Z"), 0, 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        if (!variant.equals("clean") && !variant.equals("missing")) body.addAll(List.of(
                invoke(Opcode.INVOKE_STATIC, ref(TIMESTAMPS, "show", "Z", "Z"), variant.equals("wrong-answer") ? 1 : 0),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        body.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        List<Instruction> setter = new ArrayList<>();
        if (variant.equals("changed-setter")) setter.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1));
        setter.add(end());
        classes.put(USER_INFO, List.of(method(USER_INFO, "L", "Z", true, 2, body), method(USER_INFO, "x0", VOID, true, 1, setter, "Z")));
        classes.put("Lcom/tumblr/Remember;", List.of(method("Lcom/tumblr/Remember;", "c", "Z", true, 2,
                List.of(new ImmutableInstruction11x(Opcode.RETURN, 1)), STRING, "Z")));
        List<Method> header = new ArrayList<>(classes.getOrDefault(POST_HEADER, List.of()));
        header.removeIf(m -> m.getName().equals("D2"));
        header.add(method(POST_HEADER, "D2", "Z", false, 2, List.of(invoke(Opcode.INVOKE_STATIC, ref(USER_INFO, "L", "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0))));
        classes.put(POST_HEADER, header);
        if (!variant.equals("clean")) classes.put(TIMESTAMPS, List.of(method(TIMESTAMPS, "show", "Z", true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 1)), "Z")));
    }

    private static int captionAddress(List<Instruction> body, int at) {
        int address = 0;
        for (int k = 0; k < at; k++) address += body.get(k).getCodeUnits();
        return address;
    }

    private static void captionBranch(List<Instruction> body, int at, int target) {
        Instruction old = body.get(at);
        int offset = captionAddress(body, target) - captionAddress(body, at);
        if (old.getOpcode() == Opcode.GOTO) body.set(at, new ImmutableInstruction10t(Opcode.GOTO, offset));
        else if (old instanceof com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction two)
            body.set(at, new ImmutableInstruction22t(old.getOpcode(), two.getRegisterA(), two.getRegisterB(), offset));
        else body.set(at, new ImmutableInstruction21t(old.getOpcode(), ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) old).getRegisterA(), offset));
    }

    private static Method captionMethod(String name, int registers, List<Instruction> body, List<ImmutableTryBlock> tries, String... parameters) {
        Method shape = method(ALT_TEXT, name, VOID, true, registers, body, parameters);
        int flags = AccessFlags.STATIC.getValue() | (name.equals("clearGallery") ? AccessFlags.PUBLIC.getValue()
                : name.equals("<clinit>") ? AccessFlags.CONSTRUCTOR.getValue() : AccessFlags.PRIVATE.getValue());
        return new ImmutableMethod(ALT_TEXT, name, shape.getParameters(), VOID, flags, Set.of(), Set.of(),
                new ImmutableMethodImplementation(registers, body, tries, List.of()));
    }

    private static List<Method> captionCleanup(String variant) {
        String view = "Landroid/view/View;", group = "Landroid/view/ViewGroup;", text = "Landroid/widget/TextView;",
                map = "Ljava/util/Map;", weak = "Ljava/lang/ref/WeakReference;";
        ImmutableFieldReference captions = new ImmutableFieldReference(ALT_TEXT, "CAPTIONS", map);
        List<Instruction> clear = new ArrayList<>(List.of(
                new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 1), new ImmutableInstruction10t(Opcode.GOTO, 1),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, captions), new ImmutableInstruction11x(Opcode.MONITOR_ENTER, 0),
                invoke(Opcode.INVOKE_INTERFACE, ref(map, "remove", OBJECT, OBJECT), 0, variant.equals("cleanup-wrong-key") ? 0 : 1),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1), new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(weak)),
                new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 0), new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 1),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), new ImmutableInstruction10t(Opcode.GOTO, 1),
                invoke(Opcode.INVOKE_VIRTUAL, ref("Ljava/lang/ref/Reference;", "get", OBJECT), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(text)), new ImmutableInstruction21t(Opcode.IF_EQZ, 1, 1),
                invoke(Opcode.INVOKE_VIRTUAL, ref(view, "getParent", "Landroid/view/ViewParent;"), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 0, new ImmutableTypeReference(group)), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                invoke(Opcode.INVOKE_VIRTUAL, ref(view, "getParent", "Landroid/view/ViewParent;"), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(group)),
                variant.equals("cleanup-removes-all") ? invoke(Opcode.INVOKE_VIRTUAL, ref(group, "removeAllViews", VOID), 0)
                        : invoke(Opcode.INVOKE_VIRTUAL, ref(group, "removeView", VOID, view), 0, 1),
                end(), new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 1), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 0), new ImmutableInstruction11x(Opcode.THROW, 1)));
        captionBranch(clear, 0, 2); captionBranch(clear, 1, 23); captionBranch(clear, 8, 11); captionBranch(clear, 10, 14);
        captionBranch(clear, 14, 23); captionBranch(clear, 18, 23);
        int clearHandler = 24;
        if (variant.equals("cleanup-handler-redirect")) {
            clearHandler = clear.size();
            clear.addAll(List.of(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
                    new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(view)),
                    invoke(Opcode.INVOKE_VIRTUAL, ref(view, "getParent", "Landroid/view/ViewParent;"), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                    new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(group)),
                    invoke(Opcode.INVOKE_VIRTUAL, ref(group, "removeView", VOID, view), 0, 1), end()));
        }
        List<Method> methods = new ArrayList<>();
        int clearStart = variant.equals("cleanup-try-range") ? 5 : 4;
        methods.add(captionMethod("clear", 2, clear, List.of(
                new ImmutableTryBlock(captionAddress(clear, clearStart), captionAddress(clear, 8) - captionAddress(clear, clearStart),
                        List.of(new ImmutableExceptionHandler(null, captionAddress(clear, clearHandler)))),
                new ImmutableTryBlock(captionAddress(clear, 25), captionAddress(clear, 26) - captionAddress(clear, 25),
                        List.of(new ImmutableExceptionHandler(null, captionAddress(clear, 24))))), view));
        List<Instruction> gallery = new ArrayList<>(List.of(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 4, new ImmutableTypeReference(IMAGE_ROW)), new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 1),
                new ImmutableInstruction10t(Opcode.GOTO, 1), new ImmutableInstruction21c(Opcode.CHECK_CAST, 4, new ImmutableTypeReference(IMAGE_ROW)),
                invoke(Opcode.INVOKE_INTERFACE, ref(IMAGE_ROW, "hushImageItems", "[" + OBJECT), 4), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4),
                new ImmutableInstruction21t(Opcode.IF_NEZ, 4, 1), new ImmutableInstruction10t(Opcode.GOTO, 1), new ImmutableInstruction12x(Opcode.ARRAY_LENGTH, 0, 4),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), new ImmutableInstruction22t(Opcode.IF_GE, 1, 0, 1), new ImmutableInstruction23x(Opcode.AGET_OBJECT, 2, 4, 1),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 3, 2, new ImmutableTypeReference(IMAGE_CONTAINER)), new ImmutableInstruction21t(Opcode.IF_EQZ, 3, 1),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 2, new ImmutableTypeReference(IMAGE_CONTAINER)),
                invoke(Opcode.INVOKE_INTERFACE, ref(IMAGE_CONTAINER, "hushImageFrame", view), 2), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2),
                invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, variant.equals("cleanup-wrong-target") ? "clearUnowned" : "clear", VOID, view), 2),
                new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 1, 1, 1), new ImmutableInstruction10t(Opcode.GOTO, 1), end(),
                new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 4), literal("Visible image descriptions", 0), literal("gallery caption cleanup", 1),
                invoke(Opcode.INVOKE_STATIC, ref("Lapp/hushtumblr/extension/shared/diagnostics/HookStatus;", "threw", VOID, STRING, STRING, "Ljava/lang/Throwable;"), 0, 1, 4), end()));
        captionBranch(gallery, 1, 3); captionBranch(gallery, 2, 20); captionBranch(gallery, 6, 8); captionBranch(gallery, 7, 20);
        captionBranch(gallery, 10, 20); captionBranch(gallery, 13, 18); captionBranch(gallery, 19, 10);
        int shift = 0;
        if (variant.equals("cleanup-gated")) {
            gallery.addAll(0, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1)));
            captionBranch(gallery, 2, 23); shift = 3;
        }
        List<ImmutableTryBlock> galleryTries = List.of(new ImmutableTryBlock(captionAddress(gallery, shift), captionAddress(gallery, 18 + shift) - captionAddress(gallery, shift),
                List.of(new ImmutableExceptionHandler(variant.equals("cleanup-gallery-handler-type") ? "Ljava/lang/RuntimeException;" : null, captionAddress(gallery, 21 + shift)))));
        if (variant.equals("cleanup-empty")) { gallery = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()); galleryTries = List.of(); }
        methods.add(captionMethod("clearGallery", 5, gallery, galleryTries, OBJECT));
        String mapType = variant.equals("cleanup-strong-map") ? "Ljava/util/HashMap;" : "Ljava/util/WeakHashMap;";
        methods.add(captionMethod("<clinit>", 1, List.of(new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference(mapType)),
                invoke(Opcode.INVOKE_DIRECT, ref(mapType, "<init>", VOID), 0), new ImmutableInstruction21c(Opcode.SPUT_OBJECT, 0, captions), end()), List.of()));
        List<Instruction> bind = new ArrayList<>(List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, new ImmutableTypeReference(text)), invoke(Opcode.INVOKE_VIRTUAL, ref(view, "getContext", CONTEXT), 4),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), invoke(Opcode.INVOKE_DIRECT, ref(text, "<init>", VOID, CONTEXT), 1, 0),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 3, captions), new ImmutableInstruction11x(Opcode.MONITOR_ENTER, 3),
                new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, new ImmutableTypeReference(weak)),
                invoke(Opcode.INVOKE_DIRECT, ref(weak, "<init>", VOID, OBJECT), 2, variant.equals("cleanup-unowned-value") ? 4 : 1),
                invoke(Opcode.INVOKE_INTERFACE, ref(map, "put", OBJECT, OBJECT, OBJECT), 3, 4, 2), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 3), end(),
                new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 3), new ImmutableInstruction11x(Opcode.THROW, 0)));
        if (variant.equals("cleanup-map-escape-after-put")) bind.add(13, invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "writeMap", VOID, map), 3));
        if (variant.equals("cleanup-map-alias-escape")) bind.addAll(13, List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 3),
                new ImmutableInstruction11n(Opcode.CONST_4, 3, 0), invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "writeMap", VOID, map), 0)));
        if (variant.equals("cleanup-map-mutation-after-put")) bind.add(13, invoke(Opcode.INVOKE_INTERFACE, ref(map, "clear", VOID), 3));
        if (variant.equals("cleanup-killed-register")) bind.addAll(13, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),
                new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 3, 3, 1)));
        captionBranch(bind, 2, bind.size() - 4);
        List<ImmutableTryBlock> bindTries = new ArrayList<>(List.of(new ImmutableTryBlock(captionAddress(bind, 9), captionAddress(bind, 13) - captionAddress(bind, 9),
                List.of(new ImmutableExceptionHandler(null, captionAddress(bind, bind.size() - 3))))));
        if (variant.equals("cleanup-bypass-constructor")) {
            int handler = bind.size();
            bind.addAll(List.of(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), new ImmutableInstruction10t(Opcode.GOTO, 1)));
            captionBranch(bind, handler + 2, 7);
            bindTries.add(0, new ImmutableTryBlock(captionAddress(bind, 0), captionAddress(bind, 2), List.of(new ImmutableExceptionHandler(null, captionAddress(bind, handler)))));
        }
        methods.add(captionMethod("bind", 7, bind, bindTries, OBJECT, OBJECT, "Z"));
        if (variant.equals("cleanup-map-escape-after-put") || variant.equals("cleanup-map-alias-escape"))
            methods.add(captionMethod("writeMap", 1, List.of(invoke(Opcode.INVOKE_INTERFACE, ref(map, "clear", VOID), 0), end()), List.of(), map));
        if (variant.equals("cleanup-wrong-target")) methods.add(captionMethod("clearUnowned", 1, List.of(end()), List.of(), view));
        if (variant.equals("cleanup-map-escape")) methods.add(method(ALT_TEXT, "escape", map, true, 1,
                List.of(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, captions), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
        return methods;
    }

    private static void imageDescriptions(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        model(classes, IMAGE_BLOCK, new LinkedHashMap<>(Map.of("alt_text", ref(IMAGE_BLOCK, "j", STRING), "other", ref(IMAGE_BLOCK, "otherAlt", STRING))));
        String frame = "Landroid/widget/FrameLayout;", view = "Landroid/view/View;", images = "[" + PHOTO_ROW_ITEM;
        List<Method> container = new ArrayList<>(List.of(abstractMethod(PHOTO_CONTAINER, "j0", frame)));
        List<Method> row = new ArrayList<>(List.of(abstractMethod(GALLERY_ROW, "Z", images)));
        if (hooked) {
            classes.put(IMAGE_DESCRIPTION, List.of(abstractMethod(IMAGE_DESCRIPTION, "hushAltText", STRING)));
            classes.put(IMAGE_CONTAINER, List.of(abstractMethod(IMAGE_CONTAINER, "hushImageFrame", view)));
            classes.put(IMAGE_ROW, List.of(abstractMethod(IMAGE_ROW, "hushImageItems", "[" + OBJECT)));
            List<Method> image = new ArrayList<>(classes.get(IMAGE_BLOCK));
            if (!variant.equals("missing-alt-bridge")) image.add(method(IMAGE_BLOCK, "hushAltText", STRING, false, 2,
                    List.of(invoke(Opcode.INVOKE_VIRTUAL, ref(IMAGE_BLOCK, variant.equals("wrong-alt-getter") ? "otherAlt" : "j", STRING), 1),
                            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
            classes.put(IMAGE_BLOCK, image);
            if (!variant.equals("missing-container-bridge")) container.add(method(PHOTO_CONTAINER, "hushImageFrame", view, false, 2,
                    List.of(invoke(variant.equals("wrong-container-invoke") ? Opcode.INVOKE_VIRTUAL : Opcode.INVOKE_INTERFACE,
                                    ref(PHOTO_CONTAINER, "j0", frame), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                            new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
            if (!variant.equals("missing-row-bridge")) row.add(method(GALLERY_ROW, "hushImageItems", "[" + OBJECT, false, 2,
                    List.of(invoke(Opcode.INVOKE_INTERFACE, ref(GALLERY_ROW, "Z", images), 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                            new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
            List<Method> hooks = captionCleanup(variant);
            for (String name : List.of("photo", "gallery")) hooks.add(method(ALT_TEXT, name, VOID, true, 3,
                    variant.equals("uncontrolled-" + name) ? List.of(end()) : List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, name.equals("gallery") ? 1 : 0),
                            invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "bind", VOID, OBJECT, OBJECT, "Z"), 1, 2, 0), end()), OBJECT, OBJECT));
            classes.put(ALT_TEXT, hooks);
        }
        classes.put(PHOTO_CONTAINER, container); classes.put(GALLERY_ROW, row);
        classes.put(PHOTO_HOLDER, List.of()); classes.put(PHOTO_ROW_ITEM, List.of());
        List<Instruction> photo = new ArrayList<>();
        if (hooked && !variant.equals("missing-photo")) photo.addAll(List.of(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1,
                        new ImmutableFieldReference(PHOTO_BINDER, variant.equals("wrong-photo-field") ? "d" : "c", IMAGE_BLOCK)),
                invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "photo", VOID, OBJECT, OBJECT), variant.equals("wrong-photo-holder") ? 3 : 2, 0)));
        photo.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); photo.add(end());
        classes.put(PHOTO_BINDER, List.of(method(PHOTO_BINDER, "i", VOID, false, 5, photo, PHOTO_HOLDER, "Liwj;", STRING)));
        List<Instruction> gallery = new ArrayList<>(), full = new ArrayList<>();
        if (hooked && !variant.equals("missing-gallery")) gallery.add(invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "gallery", VOID, OBJECT, OBJECT),
                2, variant.equals("wrong-gallery-image") ? 1 : 3));
        if (hooked && !variant.equals("missing-clear")) full.add(invoke(Opcode.INVOKE_STATIC, ref(ALT_TEXT, "clearGallery", VOID, OBJECT),
                variant.equals("wrong-clear-row") ? 5 : 6));
        gallery.add(end()); full.add(end());
        classes.put(GALLERY_BINDER, List.of(method(GALLERY_BINDER, "r", VOID, false, 4, gallery, CONTEXT, PHOTO_ROW_ITEM, IMAGE_BLOCK),
                method(GALLERY_BINDER, "n", VOID, false, 9, full, CONTEXT, "Lcom/tumblr/analytics/ScreenType;", "Lmrn;", "Lgw7;", "Lhae;", GALLERY_ROW, "Liwj;", "Lxh2;")));
    }

    private static void smallCase(File root, String name, Map<String, List<Method>> classes, String family, String reason) throws Exception {
        write(root, name, classes, true, family);
        SMALL_CASES.add(name + "|" + reason.isEmpty() + "|" + reason);
    }

    private static void smallSelectors(File root, Map<String, List<Method>> settings) throws Exception {
        SMALL_CASES.clear();
        for (String variant : List.of("good", "missing", "copy-missing", "wrong-list", "late", "direct-missing", "direct-wrong-id", "direct-late")) {
            reset(); enable("hideReblogs");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, variant); postBridge(classes, "good");
            smallCase(root, "feature-small-timeline-" + variant, classes, "hideReblogs", variant.equals("good") ? ""
                    : variant.contains("missing") ? "has 0 calls" : variant.endsWith("late") ? "is not where its rule puts it" : "doesn't take what its rule hands it");
        }
        for (String variant : List.of("good", "missing", "wrong-next", "wrong-flag", "wrong-load", "late", "uncontrolled")) {
            reset(); enable("hideReblogs");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, "good"); postBridge(classes, "good"); paging(classes, variant);
            smallCase(root, "feature-small-paging-" + variant, classes, "hideReblogs", variant.equals("good") ? ""
                    : variant.equals("missing") ? "has 0 calls" : variant.equals("late") ? "is not where its rule puts it"
                    : variant.equals("uncontrolled") ? "no compiled family control" : "doesn't go on from an emptied page the way its rule says");
        }
        for (String variant : List.of("good", "missing", "wrong-getter", "null")) {
            reset(); enable("hideSuggestedBlogs");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, true); carousel(classes, variant);
            smallCase(root, "feature-small-carousel-" + variant, classes, "hideSuggestedBlogs", variant.equals("good") ? ""
                    : variant.equals("missing") ? "missing or duplicated compiled method" : "doesn't answer a carousel's items through");
        }
        for (String variant : List.of("good", "missing", "wrong-answer")) {
            reset(); enable("hideFollowButton");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            followButton(classes, variant);
            smallCase(root, "feature-small-follow-" + variant, classes, "hideFollowButton", variant.equals("good") ? ""
                    : variant.equals("missing") ? "has 0 calls" : "isn't asked first thing");
        }
        for (String family : List.of("hideLikeButton", "hideReblogButton", "hideCommentButton", "hideShareButton", "hideSaveButton")) {
            boolean community = !family.equals("hideReblogButton") && !family.equals("hideSaveButton");
            for (String variant : community ? List.of("good", "missing", "missing-community", "wrong-community") : List.of("good", "missing")) {
                reset(); enable(family);
                Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
                footerButtons(classes, family, variant);
                smallCase(root, "feature-small-footer-" + family + "-" + variant, classes, family, variant.equals("good") ? ""
                        : variant.equals("wrong-community") ? "doesn't take what its rule hands it" : "has 0 calls");
            }
        }
        for (String variant : List.of("good", "missing", "wrong-badge")) {
            reset(); enable("hideUnreadDots");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            unreadDots(classes, variant);
            smallCase(root, "feature-small-unread-" + variant, classes, "hideUnreadDots", variant.equals("good") ? ""
                    : variant.equals("missing") ? "has 0 calls" : "doesn't take what its rule hands it");
        }
        if (FAMILIES.containsKey("showPostTimestamps")) for (String variant : List.of("good", "missing", "wrong-answer", "changed-setter")) {
            reset(); enable("showPostTimestamps");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timestamps(classes, variant);
            smallCase(root, "feature-small-timestamps-" + variant, classes, "showPostTimestamps", variant.equals("good") ? ""
                    : variant.equals("missing") ? "has 0 calls" : variant.equals("changed-setter") ? "native timestamp setter changed" : "doesn't take what its rule hands it");
        }
        if (FAMILIES.containsKey("visibleAltText")) for (String variant : List.of("good", "missing-photo", "wrong-photo-field", "wrong-photo-holder",
                "missing-gallery", "wrong-gallery-image", "missing-clear", "wrong-clear-row", "missing-alt-bridge", "wrong-alt-getter",
                "missing-container-bridge", "wrong-container-invoke", "missing-row-bridge", "cleanup-wrong-key", "cleanup-removes-all",
                "cleanup-wrong-target", "cleanup-gated", "cleanup-empty", "cleanup-strong-map", "cleanup-unowned-value", "cleanup-map-escape",
                "uncontrolled-photo", "uncontrolled-gallery", "cleanup-map-escape-after-put", "cleanup-map-alias-escape", "cleanup-map-mutation-after-put",
                "cleanup-killed-register", "cleanup-bypass-constructor", "cleanup-handler-redirect", "cleanup-try-range", "cleanup-gallery-handler-type")) {
            reset(); enable("visibleAltText");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            imageDescriptions(classes, variant);
            String reason = switch (variant) {
                case "good", "cleanup-killed-register" -> "";
                case "missing-photo", "missing-gallery", "missing-clear" -> "has 0 calls";
                case "wrong-photo-field", "wrong-photo-holder" -> "doesn't take the current image from its native binder field";
                case "wrong-gallery-image", "wrong-clear-row" -> "doesn't take what its rule hands it";
                case "missing-alt-bridge" -> "doesn't implement";
                case "wrong-alt-getter" -> "doesn't hand back";
                case "missing-container-bridge", "missing-row-bridge" -> "doesn't extend its image-description bridge";
                case "cleanup-wrong-key", "cleanup-removes-all", "cleanup-wrong-target", "cleanup-gated", "cleanup-empty", "cleanup-strong-map",
                        "cleanup-unowned-value", "cleanup-map-escape", "cleanup-map-escape-after-put", "cleanup-map-alias-escape", "cleanup-map-mutation-after-put",
                        "cleanup-bypass-constructor", "cleanup-handler-redirect", "cleanup-try-range", "cleanup-gallery-handler-type" -> "gallery caption cleanup ownership changed";
                case "uncontrolled-photo", "uncontrolled-gallery" -> "no compiled family control";
                default -> "doesn't hand back its native image container getter";
            };
            smallCase(root, "feature-small-captions-" + variant, classes, "visibleAltText", reason);
        }
        for (String variant : List.of("good", "wrong-first-mask", "wrong-trail-mask", "swapped-presence-masks", "wrong-paid-bits", "wrong-trail-bit",
                "missing-presence-hook", "missing-error-return", "wrong-known-getter")) {
            reset(); enable("hideAds");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, true); featureSwitch(classes, true); paidPostBridge(classes, variant);
            smallCase(root, "feature-small-paid-presence-" + variant, classes, "hideAds", variant.equals("good") ? ""
                    : variant.equals("wrong-known-getter") ? "paid-post ownership presence bridge changed" : "Post JSON presence proof changed");
        }
        Files.write(new File(root, "small-selector-cases.txt").toPath(), SMALL_CASES, StandardCharsets.UTF_8);
    }

    private static void featureSwitch(Map<String, List<Method>> classes, boolean hooked) {
        featureSwitch(classes, hooked ? "good" : "clean");
    }

    private static void featureSwitch(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        classes.put(FEATURE, List.of(method(FEATURE, "<clinit>", VOID, true, 1,
                List.of(literal("Whether or not we should show the Tumblr Blaze landing page banner", 0), end()))));
        List<Instruction> body = new ArrayList<>(List.of(literal("a flag", 0), literal("a bucket", 1),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                invoke(Opcode.INVOKE_STATIC, ref("Lfixture/FeatureCompare;", "same", "Z", STRING, STRING, "Z"), 0, 1, 2),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        if (hooked) {
            body.add(invoke(Opcode.INVOKE_STATIC, ref(FEATURE_SWITCHES, "isEnabled", "Z", "Ljava/lang/Enum;", "Z"), 4,
                    variant.equals("wrong-value") ? 2 : 0));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        }
        body.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        classes.put(FEATURE_CHECK, List.of(method(FEATURE_CHECK, "check", "Z", false, 6, body, FEATURE, STRING),
                method(FEATURE_CHECK, "note", VOID, true, 1,
                        List.of(literal("You're checking for Feature.isEnabled() with a non-boolean bucket!", 0), end()))));
        classes.put("Lfixture/FeatureCompare;", List.of(method("Lfixture/FeatureCompare;", "same", "Z", true, 3,
                List.of(new ImmutableInstruction11x(Opcode.RETURN, 2)), STRING, STRING, "Z")));
        if (hooked) classes.put(FEATURE_SWITCHES, List.of(method(FEATURE_SWITCHES, "isEnabled", "Z", true, 3,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 2)),
                "Ljava/lang/Enum;", "Z")));
    }

    /** A model adapter with two arguments, writing keys before their own zero-argument getters. */
    private static void model(Map<String, List<Method>> classes, String owner, Map<String, ImmutableMethodReference> getters) {
        List<Method> methods = new ArrayList<>();
        List<Instruction> writer = new ArrayList<>();
        getters.forEach((key, getter) -> {
            methods.add(method(owner, getter.getName(), getter.getReturnType(), false, 2,
                    List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                            new ImmutableInstruction11x(getter.getReturnType().equals("Z") ? Opcode.RETURN : Opcode.RETURN_OBJECT, 0))));
            writer.add(literal(key, 0));
            writer.add(invoke(Opcode.INVOKE_VIRTUAL, getter, 3));
            writer.add(new ImmutableInstruction11x(getter.getReturnType().equals("Z") ? Opcode.MOVE_RESULT : Opcode.MOVE_RESULT_OBJECT, 0));
        });
        classes.put(owner, methods);
        writer.add(end());
        String adapter = owner.substring(0, owner.length() - 1) + "JsonAdapter;";
        classes.put(adapter, List.of(method(adapter, "toJson", VOID, false, 4, writer, OBJECT, owner)));
    }

    private static void paidPostBridge(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        Map<String, ImmutableMethodReference> getters = new LinkedHashMap<>();
        getters.put("header_context", ref(POST, "header", HEADER));
        getters.put("followed", ref(POST, "followed", "Z"));
        getters.put("can_edit", ref(POST, "editable", "Z"));
        getters.put("other_header", ref(POST, "otherHeader", HEADER));
        for (String name : List.of("hushContent", "hushTrail", "hushTags", "hushSummary", "hushRebloggedFrom"))
            getters.put(postKey(name), ref(POST, "original_" + name, name.equals("hushSummary") || name.equals("hushRebloggedFrom") ? STRING : LIST));
        model(classes, POST, getters);
        model(classes, HEADER, Map.of("icon", ref(HEADER, "icon", STRING), "other_icon", ref(HEADER, "otherIcon", STRING)));
        postJsonPresence(classes, hooked, variant);
        if (!hooked) return;
        classes.put(PAID_POST, List.of(abstractMethod(PAID_POST, "hushHeaderIcon", STRING),
                abstractMethod(PAID_POST, "hushFollowed", "Z"), abstractMethod(PAID_POST, "hushCanEdit", "Z"), abstractMethod(PAID_POST, "hushPaidContextKnown", "Z")));
        List<Method> post = new ArrayList<>(classes.get(POST));
        post.add(method(POST, "hushPaidContextKnown", "Z", false, 2, List.of(
                new ImmutableInstruction22c(Opcode.IGET_BOOLEAN, 0, 1, new ImmutableFieldReference(POST,
                        variant.equals("wrong-known-getter") ? "hushRootTrailPresent" : "hushPaidContextKnown", "Z")), new ImmutableInstruction11x(Opcode.RETURN, 0))));
        for (String name : List.of("hushFollowed", "hushCanEdit")) post.add(method(POST, name, "Z", false, 2,
                List.of(invoke(Opcode.INVOKE_VIRTUAL, ref(POST, name.equals("hushFollowed") ? "followed" : "editable", "Z"), 1),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0))));
        if (!variant.equals("missing")) {
            List<Instruction> icon = new ArrayList<>(List.of(
                    invoke(Opcode.INVOKE_VIRTUAL, ref(POST, variant.equals("wrong-header") ? "otherHeader" : "header", HEADER), 1),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                    new ImmutableInstruction21t(Opcode.IF_EQZ, 0, variant.equals("wrong-null-target") ? 8 : 7),
                    invoke(Opcode.INVOKE_VIRTUAL, ref(HEADER, variant.equals("wrong-icon") ? "otherIcon" : "icon", STRING), 0),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                    variant.equals("wrong-null-value") ? literal("absent", 0) : new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                    new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
            post.add(method(POST, "hushHeaderIcon", STRING, false, 2, icon));
        }
        classes.put(POST, post);
    }

    /** Shared with the independent root fixture. Existing model fields, getters and writer stay intact. */
    static void addPostJsonPresence(Map<String, ClassDef> classes, boolean patched, String fault) {
        String adapter = POST.substring(0, POST.length() - 1) + "JsonAdapter;";
        Map<String, List<Method>> methods = new LinkedHashMap<>();
        for (String owner : List.of(POST, adapter)) {
            List<Method> values = new ArrayList<>(); classes.get(owner).getMethods().forEach(values::add); methods.put(owner, values);
        }
        postJsonPresence(methods, patched, fault);
        for (String owner : methods.keySet()) {
            ClassDef original = classes.get(owner); List<Field> fields = new ArrayList<>(); original.getFields().forEach(fields::add);
            if (patched && owner.equals(POST)) for (String name : List.of("hushRootTrailPresent", "hushPaidContextKnown"))
                fields.add(new ImmutableField(owner, name, "Z", AccessFlags.PRIVATE.getValue(), null, Set.of(), Set.of()));
            classes.put(owner, new ImmutableClassDef(owner, original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                    original.getSourceFile(), original.getAnnotations(), fields, methods.get(owner)));
        }
    }

    private static int codeOffset(List<Instruction> body, int from, int to) {
        int result = 0; for (int k = from; k < to; k++) result += body.get(k).getCodeUnits(); return result;
    }

    private static void postJsonPresence(Map<String, List<Method>> classes, boolean patched, String fault) {
        String adapter = POST.substring(0, POST.length() - 1) + "JsonAdapter;";
        String[] parameters = new String[155]; Arrays.fill(parameters, "I"); parameters[154] = "Lh27;";
        List<Method> model = new ArrayList<>(classes.get(POST));
        model.removeIf(m -> m.getName().equals("<init>") && m.getParameterTypes().size() == 155);
        model.add(new ImmutableMethod(POST, "<init>", Arrays.stream(parameters).map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(),
                VOID, AccessFlags.PUBLIC.getValue() | AccessFlags.CONSTRUCTOR.getValue(), Set.of(), Set.of(), new ImmutableMethodImplementation(156,
                List.of(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0), end()), List.of(), List.of())));
        if (patched) {
            List<Instruction> setter = List.of(new ImmutableInstruction31i(Opcode.CONST, 0, fault.equals("wrong-paid-bits") ? 0x80000 : 0x4080000),
                    new ImmutableInstruction12x(Opcode.AND_INT_2ADDR, 2, 0), new ImmutableInstruction21t(Opcode.IF_NEZ, 2, 4),
                    new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction10t(Opcode.GOTO, 2), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                    new ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 1, new ImmutableFieldReference(POST, "hushPaidContextKnown", "Z")),
                    new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 0, 3, fault.equals("wrong-trail-bit") ? 2 : 1),
                    new ImmutableInstruction22b(Opcode.XOR_INT_LIT8, 0, 0, 1),
                    new ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 1, new ImmutableFieldReference(POST, "hushRootTrailPresent", "Z")), end());
            model.add(new ImmutableMethod(POST, "hushSetJsonPresence", List.of(new ImmutableMethodParameter("I", Set.of(), null), new ImmutableMethodParameter("I", Set.of(), null)),
                    VOID, AccessFlags.PUBLIC.getValue() | AccessFlags.SYNTHETIC.getValue(), Set.of(), Set.of(), new ImmutableMethodImplementation(4, setter, List.of(), List.of())));
        }
        classes.put(POST, model);
        List<Instruction> reader = new ArrayList<>(); for (int k = 0; k < 2183; k++) reader.add(new ImmutableInstruction10x(Opcode.NOP));
        reader.set(0, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        reader.set(10, new ImmutableInstruction11n(Opcode.CONST_4, 10, -1));
        reader.set(66, new ImmutableInstruction12x(Opcode.MOVE, 4, 10));
        for (int k = 67; k <= 69; k++) reader.set(k, new ImmutableInstruction12x(Opcode.MOVE, k - 62, k - 63));
        reader.set(168, new ImmutableInstruction31i(Opcode.CONST, 161, ~0x80000));
        reader.set(175, new ImmutableInstruction31i(Opcode.CONST, 168, ~0x4000000));
        reader.set(211, new ImmutableInstruction12x(Opcode.MOVE, 7, 3));
        reader.set(394, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 3, 7, -2));
        reader.set(1713, new ImmutableInstruction12x(Opcode.MOVE, 10, 3));
        reader.set(1732, new ImmutableInstruction23x(Opcode.AND_INT, 3, 10, 168));
        reader.set(1865, new ImmutableInstruction23x(Opcode.AND_INT, 3, 10, 161));
        reader.set(2065, new ImmutableInstruction21s(Opcode.CONST_16, 157, 0));
        reader.set(2069, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 1));
        reader.set(2098, new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 4, new ImmutableTypeReference(POST)));
        reader.set(2126, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 154, 10));
        reader.set(2070, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 158, 7));
        reader.set(2166, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 4, 156, ref(POST, "<init>", VOID, parameters)));
        reader.set(2167, new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4));
        reader.set(2180, invoke(Opcode.INVOKE_STATIC, ref("Lf7b;", "a", VOID, STRING), 0));
        reader.set(2181, new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 157));
        int error = 2168;
        if (patched && !fault.equals("missing-presence-hook")) {
            reader.addAll(2167, List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 4),
                    new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, fault.equals("wrong-first-mask") ? 153 : fault.equals("swapped-presence-masks") ? 158 : 154),
                    new ImmutableInstruction22x(Opcode.MOVE_FROM16, 2, fault.equals("wrong-trail-mask") ? 157 : fault.equals("swapped-presence-masks") ? 154 : 158),
                    invoke(Opcode.INVOKE_VIRTUAL, ref(POST, "hushSetJsonPresence", VOID, "I", "I"), 0, 1, 2)));
            error += 4;
        }
        reader.set(2069, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, codeOffset(reader, 2069, error)));
        if (patched && fault.equals("missing-error-return")) reader.set(error + 13, new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        List<Method> adapterMethods = new ArrayList<>(classes.get(adapter)); adapterMethods.removeIf(m -> m.getName().equals("fromJson"));
        adapterMethods.add(method(adapter, "fromJson", OBJECT, false, 178, reader, "Le9b;")); classes.put(adapter, adapterMethods);
    }

    private static String postKey(String name) {
        return switch (name) {
            case "hushContent" -> "content";
            case "hushTrail" -> "trail";
            case "hushTags" -> "tags";
            case "hushSummary" -> "summary";
            case "hushRebloggedFrom" -> "reblogged_from_id";
            case "hushText" -> "text";
            default -> throw new IllegalArgumentException(name);
        };
    }

    private static void postBridge(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        if (!hooked) {
            model(classes, REBLOG_TRAIL, Map.of("content", ref(REBLOG_TRAIL, "original_hushContent", LIST)));
            model(classes, TEXT_BLOCK, Map.of("text", ref(TEXT_BLOCK, "original_hushText", STRING)));
            return;
        }
        for (String owner : List.of(POST, REBLOG_TRAIL, TEXT_BLOCK)) {
            String face = BASE + "timeline/" + (owner.equals(POST) ? "HushPost;" : owner.equals(REBLOG_TRAIL) ? "HushTrail;" : "HushText;");
            List<String> names = owner.equals(POST) ? List.of("hushContent", "hushTrail", "hushTags", "hushSummary", "hushRebloggedFrom")
                    : owner.equals(REBLOG_TRAIL) ? List.of("hushContent") : List.of("hushText");
            List<Method> model = new ArrayList<>(classes.get(owner)), bridge = new ArrayList<>();
            for (String name : names) {
                String result = name.equals("hushSummary") || name.equals("hushRebloggedFrom") || name.equals("hushText") ? STRING : LIST;
                bridge.add(abstractMethod(face, name, result));
                if (variant.equals("missing") && name.equals("hushTags") || variant.equals("missing-trail") && owner.equals(REBLOG_TRAIL)) continue;
                String target = variant.equals("wrong-getter") && name.equals("hushTags") ? "original_hushTrail" : "original_" + name;
                model.add(method(owner, name, result, false, 2, List.of(invoke(Opcode.INVOKE_VIRTUAL, ref(owner, target, result), 1),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
            }
            classes.put(owner, model);
            classes.put(face, bridge);
        }
    }

    private static void reviewPrompt(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        String owner = "Lfixture/ReviewLauncher;", prompt = "Lcom/tumblr/rating/RatingPromptActivity;";
        List<Instruction> body = new ArrayList<>();
        if (hooked) body.addAll(List.of(invoke(Opcode.INVOKE_STATIC, ref(BASE + "ui/ReviewPrompts;", "skip", "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3), end()));
        body.add(literal("app_review_prompt_rules_last_shown", 0));
        body.add(new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference(prompt)));
        // A clean branch to its own return must never be redirected into the injected return.
        body.add(new ImmutableInstruction10t(Opcode.GOTO, variant.equals("jump-to-injected-return") ? -5 : 1));
        body.add(end());
        classes.put(owner, List.of(method(owner, "launch", VOID, false, 3, body, CONTEXT)));
        if (hooked) classes.put(BASE + "ui/ReviewPrompts;", List.of(method(BASE + "ui/ReviewPrompts;", "skip", "Z", true, 1,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)))));
    }

    private static void optionalNudges(Map<String, List<Method>> classes, String kind, String variant) {
        String helper = BASE + "ui/OptionalNudges;", owner = "Lfixture/BlogReminder;", popup = "Lfixture/GiftPopup;";
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        if (kind.equals("reminder")) {
            List<Instruction> body = new ArrayList<>();
            if (hooked) body.addAll(List.of(invoke(Opcode.INVOKE_STATIC, ref(helper, "hideBlogNotificationReminder", "Z")),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 4),
                    new ImmutableInstruction11n(Opcode.CONST_4, 0, variant.equals("wrong-return") ? 1 : 0),
                    new ImmutableInstruction11x(Opcode.RETURN, 0)));
            body.addAll(List.of(literal("blog_notify_enabled", 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),
                    invoke(Opcode.INVOKE_STATIC, ref("Lcom/tumblr/Remember;", "c", "Z", STRING, "Z"), 0, 1),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            classes.put(owner, List.of(method(owner, "enabled", "Z", true, 2, body)));
        } else {
            List<Instruction> body = new ArrayList<>();
            if (hooked) body.addAll(List.of(new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 4, 1,
                            ref(popup, variant.equals("wrong-key") ? "otherKey" : "key", STRING)),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                    invoke(Opcode.INVOKE_STATIC, ref(helper, "hideGiftMessage", "Z", STRING), variant.equals("wrong-argument") ? 1 : 0),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                    new ImmutableInstruction21t(Opcode.IF_EQZ, 0, variant.equals("wrong-branch") ? 2 : 3), end()));
            body.addAll(List.of(new ImmutableInstruction21c(Opcode.SGET, 0,
                            new ImmutableFieldReference("Lcom/tumblr/R$layout;", "popup_gift_message", "I")),
                    new ImmutableInstruction21c(Opcode.SGET, 0,
                            new ImmutableFieldReference("Lcom/tumblr/R$layout;", "popup_gift_message_right", "I")),
                    new ImmutableInstruction21c(Opcode.SGET, 0,
                            new ImmutableFieldReference("Lcom/tumblr/R$id;", "popup_text_message", "I")),
                    literal("textMessage", 0), invoke(Opcode.INVOKE_VIRTUAL, ref(popup, "key", STRING), 4),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), end()));
            classes.put(popup, List.of(method(popup, "render", VOID, false, 9, body,
                            "Landroid/app/Activity;", "Landroid/view/View;", "F", "Landroid/view/View$OnClickListener;"),
                    method(popup, "keys", STRING, true, 2, List.of(literal("key_has_seen_summon_crabs_popup", 0),
                            literal("key_has_seen_ad_free_browsing_gift_popup", 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), popup),
                    method(popup, "key", STRING, false, 2, List.of(invoke(Opcode.INVOKE_STATIC, ref(popup, "keys", STRING, popup), 1),
                            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))),
                    method(popup, "otherKey", STRING, false, 2, List.of(literal("other", 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))));
        }
        if (!variant.equals("clean")) classes.put(helper, List.of(
                method(helper, "hideBlogNotificationReminder", "Z", true, 1, List.of(readiness(),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0))),
                method(helper, "hideGiftMessage", "Z", true, 2, List.of(readiness(),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)), STRING)));
    }

    private static void postLine(Map<String, List<Method>> classes, String variant) {
        String helper = BASE + "ui/PostLines;", owner = "Lfixture/PostSpacing;", canvas = "Landroid/graphics/Canvas;",
                paint = "Landroid/graphics/Paint;", list = "Landroidx/recyclerview/widget/RecyclerView;";
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        List<Instruction> draw = new ArrayList<>(List.of(invoke(Opcode.INVOKE_DIRECT, ref(owner, "debug", "Z"), 9),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        if (hooked) draw.addAll(List.of(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, variant.equals("wrong-register") ? 1 : 0, 1,
                        ref(helper, "paintsGaps", "I", "I")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)));
        draw.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 5));
        draw.add(hooked && !variant.equals("wrong-paint")
                ? new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 3, 6, ref(helper, "paintGap", VOID, canvas, "F", "F", "F", "F", paint))
                : new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 3, 6, ref(canvas, "drawRect", VOID, "F", "F", "F", "F", paint)));
        draw.add(end());
        classes.put(owner, List.of(
                method(owner, "debug", "Z", false, 2, List.of(literal("debug_timeline_object_spacing", 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                        new ImmutableInstruction11x(Opcode.RETURN, 0))),
                method(owner, "draw", VOID, false, 13, draw, canvas, list, "Landroidx/recyclerview/widget/RecyclerView$a0;")));
        if (!variant.equals("clean")) classes.put(helper, List.of(
                method(helper, "paintsGaps", "I", true, 2, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                        new ImmutableInstruction11x(Opcode.RETURN, 0)), "I"),
                method(helper, "paintGap", VOID, true, 7, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()),
                        canvas, "F", "F", "F", "F", paint)));
    }

    private static void fontChoice(Map<String, List<Method>> classes, String variant) {
        String helper = BASE + "ui/AppFont;", owner = "Lfixture/FontResources;", callback = "Lfixture/FontResources$Callback;",
                picker = "Lfixture/FontPicker;", face = "Landroid/graphics/Typeface;", context = "Landroid/content/Context;",
                handler = "Landroid/os/Handler;";
        boolean hooked = !variant.equals("clean") && !variant.equals("missing");
        List<Instruction> load = new ArrayList<>();
        if (hooked) load.addAll(List.of(
                variant.equals("wrong-register") ? invoke(Opcode.INVOKE_STATIC, ref(helper, "replacement", face, context, "I"), 9, 12)
                        : invoke(Opcode.INVOKE_STATIC, ref(helper, "replacement", face, context, "I"), 9, 10),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 8),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 13, 5),
                invoke(Opcode.INVOKE_VIRTUAL, ref(callback, "d", VOID, face, handler), 13, 0, 14),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
        load.addAll(List.of(literal("Font resource ID #0x", 1), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
        classes.put(owner, List.of(method(owner, "load", face, true, 17, load,
                context, "I", "Landroid/util/TypedValue;", "I", callback, handler, "Z", "Z")));
        Instruction provide = new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 3, 1, ref(helper, "provided", face, face));
        List<Instruction> pick = new ArrayList<>(List.of(new ImmutableInstruction21t(Opcode.IF_EQZ, 4, hooked ? 14 : 10),
                literal("sans-serif-medium", 3), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                invoke(Opcode.INVOKE_STATIC, ref(face, "create", face, STRING, "I"), 3, 0),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3)));
        if (hooked) pick.addAll(List.of(provide, new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, variant.equals("wrong-return") ? 0 : 3)));
        pick.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 3));
        pick.add(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 3, new ImmutableFieldReference(face, "SANS_SERIF", face)));
        if (hooked) pick.addAll(List.of(provide, new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3)));
        pick.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 3));
        classes.put(picker, List.of(method(picker, "pick", face, true, 5, pick, context, "Lcom/tumblr/font/a;")));
        String provider = "Lfixture/RowProvider;", view = "Landroid/view/View;", group = "Landroid/view/ViewGroup;";
        ImmutableMethodReference child = ref(group, "getChildAt", view, "I");
        List<Instruction> handover = new ArrayList<>(List.of(literal("Returning pre-inflated View for resId: ", 0),
                invoke(Opcode.INVOKE_VIRTUAL, child, 4, 3), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                invoke(Opcode.INVOKE_VIRTUAL, child, 4, 3), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)));
        if (hooked && !variant.equals("missing-row")) handover.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                variant.equals("wrong-row") ? 1 : 0, 1, ref(helper, "preinflated", VOID, view)));
        handover.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.put(provider, List.of(method(provider, "handOver", view, false, 5, handover, "I", group)));
        if (!variant.equals("clean")) classes.put(helper, List.of(
                method(helper, "replacement", face, true, 3, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), context, "I"),
                method(helper, "provided", face, true, 2, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                        new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), face),
                method(helper, "preinflated", VOID, true, 2, List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()), view)));
    }

    private static void activityNotifications(Map<String, List<Method>> classes, String variant) {
        boolean hooked = !variant.equals("clean");
        String pagination = "Lcom/tumblr/rumblr/model/PaginationLink;";
        for (String owner : List.of(ACTIVITY_RESPONSE, PUSH_RESPONSE)) {
            List<Instruction> body = new ArrayList<>();
            boolean filtered = hooked && owner.equals(ACTIVITY_RESPONSE) && !variant.equals("missing-hook")
                    || hooked && owner.equals(PUSH_RESPONSE) && variant.equals("push-hook");
            if (filtered) body.addAll(List.of(invoke(Opcode.INVOKE_STATIC, ref(ACTIVITY_FILTER, "filter", LIST, LIST),
                    variant.equals("wrong-list") ? 2 : 1), new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)));
            body.add(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0)); body.add(end());
            classes.put(owner, List.of(method(owner, "<init>", VOID, false, 3, body, LIST, pagination)));
        }
        List<Method> notification = new ArrayList<>(List.of(abstractMethod(ACTIVITY_NOTIFICATION, "getType", ACTIVITY_TYPE),
                abstractMethod(ACTIVITY_NOTIFICATION, "otherType", ACTIVITY_TYPE)));
        classes.put(ACTIVITY_TYPE, List.of());
        if (hooked) {
            classes.put(HUSH_ACTIVITY, List.of(abstractMethod(HUSH_ACTIVITY, "hushNotificationType", STRING)));
            if (!variant.equals("missing-bridge")) notification.add(method(ACTIVITY_NOTIFICATION, "hushNotificationType", STRING, false, 2,
                    List.of(invoke(Opcode.INVOKE_INTERFACE, ref(ACTIVITY_NOTIFICATION, variant.equals("wrong-getter") ? "otherType" : "getType", ACTIVITY_TYPE), 1),
                            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0,
                                    variant.equals("wrong-null-target") ? 8 : 7),
                            invoke(Opcode.INVOKE_VIRTUAL, ref("Ljava/lang/Enum;", "name", STRING), 0),
                            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                            new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))));
            classes.put(ACTIVITY_FILTER, List.of(method(ACTIVITY_FILTER, "filter", LIST, true, 2,
                    List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), LIST)));
        }
        classes.put(ACTIVITY_NOTIFICATION, notification);
    }

    public static void main(String[] args) throws Exception {
        File root = new File(args[0]);
        Files.createDirectories(root.toPath());
        initialize(new File(args[1]).toPath());
        Map<String, List<Method>> clean = hosts(false);
        advertisingId(clean, "clean");
        firebase(clean, "clean");
        timeline(clean, false);
        featureSwitch(clean, false);
        paidPostBridge(clean, "clean");
        postBridge(clean, "clean");
        reviewPrompt(clean, "clean");
        optionalNudges(clean, "reminder", "clean");
        optionalNudges(clean, "gift", "clean");
        postLine(clean, "clean");
        fontChoice(clean, "clean");
        activityNotifications(clean, "clean");
        carousel(clean, "clean");
        followButton(clean, "clean");
        footerButtons(clean, "", "clean");
        unreadDots(clean, "clean");
        timestamps(clean, "clean");
        imageDescriptions(clean, "clean");
        write(root, "feature-clean", clean, false);
        reset();
        Map<String, List<Method>> settings = new LinkedHashMap<>(clean); settings.putAll(hosts(true));
        write(root, "feature-unselected", settings, true);
        write(root, "feature-internal-dependencies", new LinkedHashMap<>(settings), true);
        Files.write(new File(root, "feature-internal-dependencies.selected").toPath(),
                List.of("HushTumblr settings", "BytecodePatch", "ResourcePatch"), StandardCharsets.UTF_8);
        write(root, "feature-unknown-public", new LinkedHashMap<>(settings), true);
        Files.write(new File(root, "feature-unknown-public.selected").toPath(),
                List.of("HushTumblr settings", "Hide imaginary posts"), StandardCharsets.UTF_8);
        write(root, "feature-no-status", new LinkedHashMap<>(settings), true);
        write(root, "feature-nonboolean-status", new LinkedHashMap<>(settings), true);
        reset();
        write(root, "feature-status-copy", new LinkedHashMap<>(Map.of(STATUS, settings.get(STATUS))), false);
        for (String family : FAMILIES.keySet()) {
            reset(); enable(family);
            // With no bytecode of its own, a manifest-only family installed and selected is complete,
            // and the same flag installed without the patch selected is the failure to catch.
            boolean manifestOnly = capabilities(family).isEmpty();
            write(root, (manifestOnly ? "feature-installed-only-" : "feature-installed-missing-") + family,
                    new LinkedHashMap<>(settings), true, family);
            if (manifestOnly) write(root, "feature-installed-unselected-" + family, new LinkedHashMap<>(settings), true);
            reset();
            write(root, "feature-selected-missing-" + family, new LinkedHashMap<>(settings), true, family);
        }
        for (String variant : List.of("good", "missing", "duplicate", "misrouted", "wrong-register", "changed-original",
                "false-capability", "unselected-call", "missing-callee", "unreachable-control")) {
            reset();
            boolean unselected = variant.equals("unselected-call");
            if (!unselected) enable("hideAdvertisingId");
            if (variant.equals("false-capability")) FLAGS.put("advertisingId", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            advertisingId(classes, variant);
            write(root, "feature-answers-" + variant, classes, true, unselected ? new String[]{} : new String[]{"hideAdvertisingId"});
        }
        for (String variant : List.of("good", "missing", "early", "wrong-value", "false-capability")) {
            reset(); enable("fixPushNotifications");
            if (variant.equals("false-capability")) FLAGS.put("firebaseCertificate", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            firebase(classes, variant);
            write(root, "feature-firebase-" + variant, classes, true, "fixPushNotifications");
        }
        for (String variant : SHORTCUTS) {
            reset();
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            shortcuts(classes, true, variant);
            write(root, "feature-shortcuts-unreachable-" + variant, classes, true);
        }
        reset();
        Map<String, List<Method>> branchingShortcut = new LinkedHashMap<>(settings);
        shortcuts(branchingShortcut, true, "branch-good");
        write(root, "feature-shortcuts-branch-good", branchingShortcut, true);
        for (String variant : List.of("good", "missing", "wrong-header", "wrong-icon", "wrong-null-target", "wrong-null-value", "false-capability")) {
            reset(); enable("hideAds");
            if (variant.equals("false-capability")) FLAGS.put("paidPostHeader", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, true);
            featureSwitch(classes, true);
            // Remove the clean model before writing its patched declarations, never duplicate getters.
            classes.remove(POST);
            paidPostBridge(classes, variant);
            write(root, "feature-paid-post-" + variant, classes, true, "hideAds");
        }
        for (String variant : List.of("good", "missing", "wrong-getter", "missing-trail")) {
            reset(); enable("hideReblogs");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            timeline(classes, true); postBridge(classes, variant);
            write(root, "feature-post-bridge-" + variant, classes, true, "hideReblogs");
        }
        for (String variant : List.of("good", "missing", "wrong-value")) {
            reset(); enable("disableAnalytics");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            featureSwitch(classes, variant);
            write(root, "feature-switch-" + variant, classes, true, "disableAnalytics");
        }
        for (String variant : List.of("good", "missing", "jump-to-injected-return")) {
            reset(); enable("skipReviewPrompts");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            reviewPrompt(classes, variant);
            write(root, "feature-review-" + variant, classes, true, "skipReviewPrompts");
        }
        for (String variant : List.of("good", "missing", "wrong-return")) {
            reset(); enable("hideBlogNotificationReminders");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            optionalNudges(classes, "reminder", variant);
            write(root, "feature-blog-reminder-" + variant, classes, true, "hideBlogNotificationReminders");
        }
        for (String variant : List.of("good", "missing", "wrong-key", "wrong-argument", "wrong-branch")) {
            reset(); enable("hideGiftMessagePopups");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            optionalNudges(classes, "gift", variant);
            write(root, "feature-gift-popup-" + variant, classes, true, "hideGiftMessagePopups");
        }
        for (String variant : List.of("good", "missing", "wrong-register", "wrong-paint")) {
            reset(); enable("lineBetweenPosts");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            postLine(classes, variant);
            write(root, "feature-post-line-" + variant, classes, true, "lineBetweenPosts");
        }
        for (String variant : List.of("good", "missing", "wrong-register", "wrong-return", "missing-row", "wrong-row")) {
            reset(); enable("appFont");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            fontChoice(classes, variant);
            write(root, "feature-font-choice-" + variant, classes, true, "appFont");
        }
        if (FAMILIES.containsKey("filterActivityNotifications")) for (String variant : List.of("good", "missing-hook", "wrong-list", "push-hook",
                "missing-bridge", "wrong-getter", "wrong-null-target")) {
            reset(); enable("filterActivityNotifications");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            activityNotifications(classes, variant);
            write(root, "feature-activity-" + variant, classes, true, "filterActivityNotifications");
        }
        smallSelectors(root, settings);
    }
}
