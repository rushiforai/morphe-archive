import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22b;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction32x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Small compiled outputs with safe registers but incorrect family installation or mutation contracts. */
public final class FeatureDexFixture {
    private static final String BASE = "Lapp/hushpinterest/extension/pinterest/";
    private static final String STATUS = BASE + "settings/SettingsStatus;";
    private static final String ENTRY = BASE + "settings/SettingsEntry;";
    private static final String UTILS = "Lapp/hushpinterest/extension/shared/Utils;";
    private static final String APP = "Lcom/pinterest/ReleaseHiltApplication;";
    private static final String ACTIVITY = "Lcom/pinterest/activity/PinterestActivity;";
    private static final String OBSERVER = "Lfixture/ScreenshotObserver;";
    private static final String FEED = "Lfixture/FeedPage;";
    private static final String SENDER = "Lfixture/OutgoingText;";
    private static final String VOID = "V";
    private static final String OBJECT = "Ljava/lang/Object;";
    private static final String LIST = "Ljava/util/List;";
    private static final String CONTEXT = "Landroid/content/Context;";
    private static final String SCREENSHOT = BASE + "ui/UiHooks;";
    private static final String FILTER = BASE + "ads/FeedFilter;";
    private static final String TRACKING = BASE + "privacy/LinkTracking;";
    private static final String INTENT = "Landroid/content/Intent;";
    private static final String CLIPBOARD = "Landroid/content/ClipData;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String TEXT = "Ljava/lang/CharSequence;";
    private static final String MANAGER = "Landroid/content/pm/ShortcutManager;";
    private static final String PUBLISHER = "Lfixture/ShortcutPublisher;";
    private static final List<String> SHORTCUTS = List.of("pushDynamicShortcut", "addDynamicShortcuts", "setDynamicShortcuts", "updateShortcuts", "removeAllDynamicShortcuts");
    private static final List<String> COPIED_FALLBACKS = List.of("copied-fallback", "copied-from16-fallback", "copied-16-fallback",
            "copied-two-register-fallback", "copied-prezero-fallback", "copied-overwrite-alias", "copied-overwrite-source",
            "copied-branch-fallback", "copied-loop-fallback");
    private static final List<String> INTEGER_FALLBACKS = integerFallbacks();
    private static final Map<String, String[]> FAMILIES = new LinkedHashMap<>();
    private static final Map<String, Boolean> FLAGS = new LinkedHashMap<>();

    private static ImmutableMethodReference ref(String type, String name, String result, String... parameters) {
        return new ImmutableMethodReference(type, name, Arrays.asList(parameters), result);
    }

    private static Instruction invoke(Opcode opcode, ImmutableMethodReference ref, int... registers) {
        int[] words = new int[5];
        System.arraycopy(registers, 0, words, 0, registers.length);
        return new ImmutableInstruction35c(opcode, registers.length, words[0], words[1], words[2], words[3], words[4], ref);
    }

    private static List<String> integerFallbacks() {
        List<String> shapes = new ArrayList<>();
        for (String operation : List.of("and", "or", "xor", "xor-not"))
            for (String form : List.of("register", "twoaddr", "lit8", "lit16")) shapes.add("integer-" + operation + "-" + form);
        for (String shape : List.of("or-set", "and-unknown", "chain", "overwrite", "branch", "loop", "neg", "not",
                "narrow", "add", "rsub", "shift", "div", "zero-divisor")) shapes.add("integer-" + shape);
        return shapes;
    }

    private static Method method(String owner, String name, String result, boolean isStatic, int registers, List<Instruction> body, String... parameters) {
        List<ImmutableMethodParameter> types = new ArrayList<>();
        for (String parameter : parameters) types.add(new ImmutableMethodParameter(parameter, Set.of(), null));
        return new ImmutableMethod(owner, name, types, result,
                AccessFlags.PUBLIC.getValue() | (isStatic ? AccessFlags.STATIC.getValue() : 0), Set.of(), Set.of(),
                new ImmutableMethodImplementation(registers, body, List.of(), List.of()));
    }

    private static ClassDef type(String owner, List<Method> methods) {
        var fields = owner.equals("Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;")
                ? List.of(new ImmutableField(owner, "pin", "Lcom/pinterest/api/model/FixturePin;", AccessFlags.PUBLIC.getValue(), null, Set.of(), Set.of()))
                : List.<ImmutableField>of();
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue(), OBJECT, List.of(), null, Set.of(), fields, methods);
    }

    private static void profileWebsites(Map<String, List<Method>> classes, String variant) {
        String browser = BASE + "actions/ExternalBrowser;", user = "Lcom/pinterest/api/model/FixtureUser;";
        String pin = "Lcom/pinterest/api/model/FixturePin;", nav = "Lcom/pinterest/navigation/Navigation;";
        classes.put("Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;", List.of());
        List<Instruction> visit = new ArrayList<>();
        if (!variant.equals("clean")) {
            visit.add(invoke(Opcode.INVOKE_STATIC, ref(browser, "open", "Z", STRING, OBJECT), 1, 2));
            visit.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            visit.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3)); visit.add(end());
        }
        visit.add(literal("android_client_tracking_params_consistency", 0)); visit.add(literal("_url", 0)); visit.add(end());
        classes.put("Lfixture/Visit;", List.of(method("Lfixture/Visit;", "visit", VOID, true, 3, visit, STRING, pin)));
        for (String name : List.of("Header", "About")) {
            String owner = "Lfixture/" + name + ";";
            List<Instruction> body = new ArrayList<>();
            if (name.equals("Header")) {
                body.add(literal("website_link", 0));
                body.add(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0,
                        new ImmutableFieldReference("Lfixture/Events;", "BUSINESS_PROFILE_WEBSITE_LINK", OBJECT)));
            }
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0));
            body.add(invoke(Opcode.INVOKE_VIRTUAL, ref(user, "website", STRING), 1));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 3, 0));
            if (!variant.equals("clean") && !variant.equals("missing-" + name.toLowerCase())) {
                for (int n = 0; n < (variant.equals("duplicate") ? 2 : 1); n++) {
                    body.add(invoke(Opcode.INVOKE_STATIC, ref(browser, "openProfile", "Z", STRING), variant.equals("wrong-argument") ? 3 : 2));
                    body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
                    body.add(new ImmutableInstruction21t(variant.equals("bad-fallback") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0, 3));
                    body.add(end());
                }
            }
            body.add(invoke(Opcode.INVOKE_STATIC, ref(nav, "website", "Lcom/pinterest/navigation/NavigationImpl;",
                    "Lcom/pinterest/framework/screens/ScreenLocation;", STRING), 3, 2));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4)); body.add(end());
            classes.put(owner, List.of(method(owner, "onClick", VOID, false, 7, body, "Landroid/view/View;")));
        }
        if (!variant.equals("clean")) {
            List<Instruction> controls = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0));
            classes.put(browser, List.of(method(browser, "open", "Z", true, 3, controls, STRING, OBJECT),
                    method(browser, "openProfile", "Z", true, 2, controls, STRING)));
        }
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
            app.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onApplicationCreate", VOID, CONTEXT), 0));
        }
        app.add(end());
        classes.put(APP, new ArrayList<>(List.of(method(APP, "onCreate", VOID, false, 1, app))));
        List<Instruction> create = new ArrayList<>();
        if (patched) create.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onActivityCreate", VOID, "Landroid/app/Activity;"), 0));
        create.add(end());
        List<Instruction> intent = new ArrayList<>();
        if (patched) intent.add(invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "onNewIntent", VOID, "Landroid/app/Activity;", INTENT), 0, 1));
        intent.add(end());
        classes.put(ACTIVITY, new ArrayList<>(List.of(
                method(ACTIVITY, "onCreate", VOID, false, 2, create, "Landroid/os/Bundle;"),
                method(ACTIVITY, "onNewIntent", VOID, false, 2, intent, INTENT))));
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
                method(ENTRY, "onApplicationCreate", VOID, true, 1, List.of(end()), CONTEXT),
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

    private static void enable(String name) {
        FLAGS.put(name, true);
        for (String cap : FAMILIES.get(name)[1].split(",")) FLAGS.put(cap, true);
    }

    private static void reset() { FLAGS.replaceAll((key, value) -> false); }

    private static void write(File root, String name, Map<String, List<Method>> classes, boolean patched, String... selected) throws Exception {
        if (patched) extensions(classes);
        if (name.equals("feature-no-status")) classes.remove(STATUS);
        if (name.equals("feature-nonboolean-status")) {
            List<Method> status = new ArrayList<>(classes.get(STATUS));
            status.set(0, method(STATUS, "hideAds", "Z", true, 1,
                    List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 2), new ImmutableInstruction11x(Opcode.RETURN, 0))));
            classes.put(STATUS, status);
        }
        List<ClassDef> defs = new ArrayList<>();
        classes.forEach((owner, methods) -> defs.add(type(owner, methods)));
        DexPool.writeTo(new File(root, name + ".dex").getPath(), new ImmutableDexFile(Opcodes.getDefault(), defs));
        if (patched) {
            List<String> names = new ArrayList<>(List.of("HushPinterest settings"));
            for (String family : selected) names.add(FAMILIES.get(family)[0]);
            Files.write(new File(root, name + ".selected").toPath(), names, StandardCharsets.UTF_8);
        }
    }

    private static void screenshot(Map<String, List<Method>> classes, String variant) {
        List<Instruction> original = List.of(literal("sg_android_new_screenshot_api_14", 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3), end(), end());
        List<Instruction> body = new ArrayList<>();
        boolean calls = !variant.equals("clean") && !variant.equals("missing") && !variant.equals("misrouted");
        if (calls) {
            int count = variant.equals("duplicate") ? 2 : 1;
            for (int k = 0; k < count; k++) {
                body.add(invoke(Opcode.INVOKE_STATIC, ref(SCREENSHOT, "hideScreenshotShare", "Z")));
                body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
                body.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, variant.equals("bad-fallback") ? 2 : 3));
                body.add(end());
            }
        }
        body.addAll(original);
        if (variant.equals("changed-original")) body.set(body.size() - 4, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        List<Method> methods = new ArrayList<>(List.of(method(OBSERVER, "onScreenshot", VOID, false, 4, body,
                OBJECT, "Landroidx/fragment/app/FragmentActivity;")));
        if (variant.equals("misrouted")) methods.add(method(OBSERVER, "unrelated", VOID, true, 1,
                List.of(invoke(Opcode.INVOKE_STATIC, ref(SCREENSHOT, "hideScreenshotShare", "Z")), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end())));
        classes.put(OBSERVER, methods);
        if (!variant.equals("clean")) {
            List<Instruction> decision = new ArrayList<>();
            if (variant.equals("unreachable-control")) {
                decision.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); decision.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
            }
            decision.add(readiness()); decision.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)); decision.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
            classes.put(SCREENSHOT, List.of(method(SCREENSHOT, "hideScreenshotShare", "Z", true, 1, decision)));
        }
    }

    private static void feed(Map<String, List<Method>> classes, String variant) {
        List<Instruction> ctor = new ArrayList<>();
        if (!variant.equals("clean")) {
            int count = variant.equals("duplicate") ? 2 : 1;
            for (int i = 0; i < count; i++) {
                ctor.add(invoke(Opcode.INVOKE_STATIC, ref(FILTER, "filter", LIST, LIST), variant.equals("wrong-register") ? 0 : 1));
                ctor.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, variant.equals("wrong-result") ? 0 : 1));
            }
        }
        ctor.add(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0));
        ctor.add(end());
        classes.put(FEED, List.of(method(FEED, "<init>", VOID, false, 2, ctor, LIST), method(FEED, "toString", STRING, false, 2,
                List.of(literal(", _items count:", 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))));
        if (!variant.equals("clean")) {
            List<Instruction> decision = new ArrayList<>();
            if (variant.equals("unreachable-control")) decision.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
            decision.add(readiness()); decision.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)); decision.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
            classes.put(FILTER, List.of(method(FILTER, "filter", LIST, true, 2, decision, LIST)));
        }
    }

    private static void links(Map<String, List<Method>> classes, boolean patched, String variant, boolean clipboard) {
        ImmutableMethodReference nativeIntent = ref(INTENT, "putExtra", INTENT, STRING, STRING);
        ImmutableMethodReference intentHook = ref(TRACKING, "putStringExtra", INTENT, INTENT, STRING, STRING);
        ImmutableMethodReference nativeText = ref(INTENT, "putExtra", INTENT, STRING, TEXT);
        ImmutableMethodReference textHook = ref(TRACKING, "putTextExtra", INTENT, INTENT, STRING, TEXT);
        ImmutableMethodReference nativeClipboard = ref(CLIPBOARD, "newPlainText", CLIPBOARD, TEXT, TEXT);
        ImmutableMethodReference clipboardHook = ref(TRACKING, "newPlainText", CLIPBOARD, TEXT, TEXT);
        List<Instruction> body = new ArrayList<>();
        if (patched && !variant.equals("left-original")) body.add(invoke(Opcode.INVOKE_STATIC, intentHook, variant.equals("wrong-register") ? 2 : 1, 2, 3));
        else body.add(invoke(Opcode.INVOKE_VIRTUAL, nativeIntent, 1, 2, 3));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        body.add(invoke(patched ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL, patched ? textHook : nativeText, 1, 2, 3));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        if (clipboard) {
            body.add(invoke(Opcode.INVOKE_STATIC, patched ? clipboardHook : nativeClipboard, 2, 3));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        }
        body.add(end());
        classes.put(SENDER, List.of(method(SENDER, "send", VOID, true, 4, body, INTENT, STRING, STRING)));
        if (patched) {
            List<Instruction> active = new ArrayList<>();
            if (variant.equals("unreachable-helper-control")) {
                active.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); active.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
            }
            active.add(readiness()); active.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0)); active.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
            classes.put(TRACKING, List.of(method(TRACKING, "active", "Z", true, 1, active),
                    linkWrapper("putStringExtra", nativeIntent, INTENT, variant, INTENT, STRING, STRING),
                    linkWrapper("putTextExtra", nativeText, INTENT, variant, INTENT, STRING, TEXT),
                    linkWrapper("newPlainText", nativeClipboard, CLIPBOARD, variant, TEXT, TEXT)));
        }
    }

    private static Method linkWrapper(String name, ImmutableMethodReference nativeCall, String result, String variant, String... parameters) {
        if (name.equals("putStringExtra") && variant.startsWith("integer-")) return integerLinkWrapper(nativeCall, variant);
        List<Instruction> body = new ArrayList<>();
        if (variant.equals("unreachable-" + name + "-fallback")) {
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        }
        boolean string = name.equals("putStringExtra");
        boolean copied = string && variant.startsWith("copied-");
        int locals = copied ? 3 : 1;
        if (copied && variant.startsWith("copied-prezero")) body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
        if (copied && variant.startsWith("copied-loop")) body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 1));
        if (copied && variant.startsWith("copied-branch")) {
            body.add(invoke(Opcode.INVOKE_STATIC, ref("Ljava/lang/System;", "identityHashCode", "I", OBJECT), locals));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 2));
        }
        if (string && variant.equals("unreachable-control")) body.add(new ImmutableInstruction10t(Opcode.GOTO, 5));
        body.add(invoke(Opcode.INVOKE_STATIC, ref(TRACKING, "active", "Z")));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        if (copied) {
            if (variant.startsWith("copied-branch")) {
                body.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 4));
                body.add(new ImmutableInstruction12x(Opcode.MOVE, 1, 0));
                body.add(new ImmutableInstruction10t(Opcode.GOTO, 3));
                body.add(new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, 0));
            } else {
                body.add(variant.startsWith("copied-from16") ? new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, 0)
                        : variant.startsWith("copied-16") ? new ImmutableInstruction32x(Opcode.MOVE_16, 1, 0)
                        : new ImmutableInstruction12x(Opcode.MOVE, 1, 0));
                if (variant.startsWith("copied-loop")) {
                    body.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 4));
                    body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
                    body.add(new ImmutableInstruction10t(Opcode.GOTO, -4));
                }
            }
            if (variant.startsWith("copied-overwrite")) body.add(new ImmutableInstruction11n(Opcode.CONST_4,
                    variant.startsWith("copied-overwrite-alias") ? 1 : 0, 1));
            boolean good = variant.endsWith("-good");
            if (variant.startsWith("copied-two-register") || variant.startsWith("copied-prezero")) {
                if (!variant.startsWith("copied-prezero")) body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
                body.add(new ImmutableInstruction22t(good ? Opcode.IF_EQ : Opcode.IF_NE, 1, 2, 3));
            } else {
                boolean equal = good != variant.startsWith("copied-overwrite-alias");
                body.add(new ImmutableInstruction21t(equal ? Opcode.IF_EQZ : Opcode.IF_NEZ, 1, 3));
            }
            body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, locals));
        }
        if (string && (variant.equals("guarded-fallback-good") || variant.equals("disabled-misses-fallback"))) {
            body.add(new ImmutableInstruction21t(variant.equals("guarded-fallback-good") ? Opcode.IF_EQZ : Opcode.IF_NEZ, 0, 3));
            body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
        }
        if (string && variant.equals("branch-fallback-good")) {
            body.add(new ImmutableInstruction10t(Opcode.GOTO, 2)); body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
        }
        if (!string || !variant.equals("missing-original-fallback")) {
            body.add(invoke(name.equals("newPlainText") ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL, nativeCall,
                    name.equals("newPlainText") ? new int[]{locals, locals + 1} : new int[]{locals, locals + 1, locals + 2}));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        } else body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        return method(TRACKING, name, result, true, parameters.length + locals, body, parameters);
    }

    private static Method integerLinkWrapper(ImmutableMethodReference nativeCall, String variant) {
        String shape = variant.substring("integer-".length(), variant.lastIndexOf('-'));
        boolean good = variant.endsWith("-good");
        boolean nonzero = shape.startsWith("xor-not-") || shape.equals("or-set") || shape.equals("overwrite") || shape.equals("not");
        List<Instruction> body = new ArrayList<>();
        if (shape.equals("branch")) {
            body.add(invoke(Opcode.INVOKE_STATIC, ref("Ljava/lang/System;", "identityHashCode", "I", OBJECT), 3));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 2));
        }
        body.add(invoke(Opcode.INVOKE_STATIC, ref(TRACKING, "active", "Z")));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        body.add(new ImmutableInstruction12x(Opcode.MOVE, 1, 0));
        if (shape.endsWith("-register") || shape.endsWith("-twoaddr") || shape.endsWith("-lit8") || shape.endsWith("-lit16")) {
            String operation = shape.substring(0, shape.indexOf('-')).toUpperCase(java.util.Locale.ROOT) + "_INT";
            int operand = shape.startsWith("and-") || shape.startsWith("xor-not-") ? 1 : 0;
            if (shape.endsWith("-register") || shape.endsWith("-twoaddr")) {
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, operand));
                body.add(shape.endsWith("-register") ? new ImmutableInstruction23x(Opcode.valueOf(operation), 1, 1, 2)
                        : new ImmutableInstruction12x(Opcode.valueOf(operation + "_2ADDR"), 1, 2));
            } else body.add(shape.endsWith("-lit8") ? new ImmutableInstruction22b(Opcode.valueOf(operation + "_LIT8"), 1, 1, operand)
                    : new ImmutableInstruction22s(Opcode.valueOf(operation + "_LIT16"), 1, 1, operand));
        } else switch (shape) {
            case "or-set":
                body.add(new ImmutableInstruction22b(Opcode.OR_INT_LIT8, 1, 1, 1)); break;
            case "and-unknown":
                body.add(invoke(Opcode.INVOKE_STATIC, ref("Ljava/lang/System;", "identityHashCode", "I", OBJECT), 3));
                body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 2));
                body.add(new ImmutableInstruction23x(Opcode.AND_INT, 1, 1, 2)); break;
            case "chain":
                body.add(new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 1, 1, 1));
                body.add(new ImmutableInstruction22b(Opcode.OR_INT_LIT8, 1, 1, 2));
                body.add(new ImmutableInstruction22s(Opcode.XOR_INT_LIT16, 1, 1, 2)); break;
            case "overwrite":
                body.add(new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 1, 1, 1));
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 1, 1));
                body.add(new ImmutableInstruction22b(Opcode.XOR_INT_LIT8, 1, 1, 0)); break;
            case "branch":
                body.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 5));
                body.add(new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 1, 1, 1));
                body.add(new ImmutableInstruction10t(Opcode.GOTO, 3));
                body.add(new ImmutableInstruction22s(Opcode.OR_INT_LIT16, 1, 1, 0)); break;
            case "loop":
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 1));
                body.add(new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 1, 1, 1));
                body.add(new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 2, 2, 1));
                // The concrete counter takes billions of iterations to overflow; the stable false value must survive widening.
                body.add(new ImmutableInstruction21t(Opcode.IF_GTZ, 2, -4)); break;
            case "neg": body.add(new ImmutableInstruction12x(Opcode.NEG_INT, 1, 1)); break;
            case "not": body.add(new ImmutableInstruction12x(Opcode.NOT_INT, 1, 1)); break;
            case "narrow":
                body.add(new ImmutableInstruction22s(Opcode.ADD_INT_LIT16, 1, 1, 128));
                body.add(new ImmutableInstruction12x(Opcode.INT_TO_BYTE, 1, 1));
                body.add(new ImmutableInstruction12x(Opcode.INT_TO_SHORT, 1, 1));
                body.add(new ImmutableInstruction12x(Opcode.INT_TO_CHAR, 1, 1));
                body.add(new ImmutableInstruction22s(Opcode.ADD_INT_LIT16, 1, 1, 128));
                body.add(new ImmutableInstruction12x(Opcode.INT_TO_SHORT, 1, 1)); break;
            case "add":
                body.add(new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 1, 1, 0));
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 1));
                body.add(new ImmutableInstruction12x(Opcode.MUL_INT_2ADDR, 1, 2));
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
                body.add(new ImmutableInstruction23x(Opcode.SUB_INT, 1, 1, 2)); break;
            case "rsub":
                body.add(new ImmutableInstruction22s(Opcode.RSUB_INT, 1, 1, 0));
                body.add(new ImmutableInstruction22b(Opcode.RSUB_INT_LIT8, 1, 1, 0)); break;
            case "shift":
                body.add(new ImmutableInstruction22b(Opcode.SHL_INT_LIT8, 1, 1, 33));
                body.add(new ImmutableInstruction21s(Opcode.CONST_16, 2, 33));
                body.add(new ImmutableInstruction12x(Opcode.SHR_INT_2ADDR, 1, 2));
                body.add(new ImmutableInstruction23x(Opcode.SHL_INT, 1, 1, 2));
                body.add(new ImmutableInstruction22b(Opcode.USHR_INT_LIT8, 1, 1, 33)); break;
            case "div":
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 1));
                body.add(new ImmutableInstruction23x(Opcode.DIV_INT, 1, 1, 2));
                body.add(new ImmutableInstruction22b(Opcode.REM_INT_LIT8, 1, 1, 2)); break;
            case "zero-divisor":
                body.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, good ? 1 : 0));
                body.add(new ImmutableInstruction12x(Opcode.DIV_INT_2ADDR, 1, 2)); break;
            default: throw new IllegalArgumentException(shape);
        }
        if (!shape.equals("zero-divisor")) {
            body.add(new ImmutableInstruction21t(good != nonzero ? Opcode.IF_EQZ : Opcode.IF_NEZ, 1, 3));
            body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 3));
        }
        body.add(invoke(Opcode.INVOKE_VIRTUAL, nativeCall, 3, 4, 5));
        body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        body.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        return method(TRACKING, "putStringExtra", INTENT, true, 6, body, INTENT, STRING, STRING);
    }

    public static void main(String[] args) throws Exception {
        File root = new File(args[0]);
        Files.createDirectories(root.toPath());
        for (String line : Files.readAllLines(new File(args[1]).toPath(), StandardCharsets.UTF_8)) if (line.startsWith("family|")) {
            String[] values = line.split("\\|");
            FAMILIES.put(values[1], new String[]{values[2], values[3]});
            FLAGS.put(values[1], false);
            for (String cap : values[3].split(",")) FLAGS.put(cap, false);
        }
        Map<String, List<Method>> clean = hosts(false);
        screenshot(clean, "clean");
        feed(clean, "clean");
        links(clean, false, "good", true);
        // This makes the update family required in the selected-but-not-installed negative case.
        clean.put("Lfixture/UpdateTask;", List.of(method("Lfixture/UpdateTask;", "invokeSuspend", OBJECT, false, 3,
                List.of(literal("inAppUpdateManager", 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), OBJECT)));
        write(root, "feature-clean", clean, false);
        reset();
        Map<String, List<Method>> settings = new LinkedHashMap<>(clean); settings.putAll(hosts(true));
        write(root, "feature-unselected", settings, true);
        write(root, "feature-internal-dependencies", new LinkedHashMap<>(settings), true);
        Files.write(new File(root, "feature-internal-dependencies.selected").toPath(),
                List.of("HushPinterest settings", "BytecodePatch", "ResourcePatch"), StandardCharsets.UTF_8);
        write(root, "feature-unknown-public", new LinkedHashMap<>(settings), true);
        Files.write(new File(root, "feature-unknown-public.selected").toPath(),
                List.of("HushPinterest settings", "Hide imaginary pins"), StandardCharsets.UTF_8);
        write(root, "feature-no-status", new LinkedHashMap<>(settings), true);
        write(root, "feature-nonboolean-status", new LinkedHashMap<>(settings), true);
        Map<String, List<Method>> profileClean = new LinkedHashMap<>(clean);
        profileWebsites(profileClean, "clean");
        write(root, "feature-profile-clean", profileClean, false);
        for (String variant : List.of("good", "missing-header", "missing-about", "duplicate", "wrong-argument", "bad-fallback")) {
            reset(); enable("externalBrowser");
            Map<String, List<Method>> profile = new LinkedHashMap<>(settings);
            profileWebsites(profile, variant);
            write(root, "feature-profile-" + variant, profile, true, "externalBrowser");
        }
        reset();
        write(root, "feature-status-copy", new LinkedHashMap<>(Map.of(STATUS, settings.get(STATUS))), false);
        for (String family : FAMILIES.keySet()) {
            reset(); enable(family);
            write(root, "feature-installed-missing-" + family, new LinkedHashMap<>(settings), true, family);
            reset();
            write(root, "feature-selected-missing-" + family, new LinkedHashMap<>(settings), true, family);
        }
        for (String variant : List.of("good", "missing", "duplicate", "misrouted", "bad-fallback", "changed-original", "false-capability", "unselected-call", "unreachable-control")) {
            reset(); enable("hideScreenshotShare");
            if (variant.equals("false-capability")) FLAGS.put("screenshotShare", false);
            if (variant.equals("unselected-call")) reset();
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            screenshot(classes, variant);
            write(root, "feature-guard-" + variant, classes, true, variant.equals("unselected-call") ? new String[]{} : new String[]{"hideScreenshotShare"});
        }
        reset(); enable("hideScreenshotShare");
        Map<String, List<Method>> noHook = new LinkedHashMap<>(settings);
        screenshot(noHook, "good"); noHook.remove(SCREENSHOT);
        write(root, "feature-guard-missing-callee", noHook, true, "hideScreenshotShare");
        Map<String, List<Method>> interiorClean = new LinkedHashMap<>(clean);
        screenshot(interiorClean, "clean");
        List<Instruction> originalLoop = new ArrayList<>();
        interiorClean.get(OBSERVER).get(0).getImplementation().getInstructions().forEach(originalLoop::add);
        originalLoop.set(2, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, -3));
        interiorClean.put(OBSERVER, List.of(method(OBSERVER, "onScreenshot", VOID, false, 4, originalLoop, OBJECT, "Landroidx/fragment/app/FragmentActivity;")));
        write(root, "feature-guard-interior-clean", interiorClean, false);
        for (boolean unsafe : List.of(false, true)) {
            Map<String, List<Method>> loop = new LinkedHashMap<>(settings);
            screenshot(loop, "good");
            List<Instruction> guarded = new ArrayList<>();
            loop.get(OBSERVER).get(0).getImplementation().getInstructions().forEach(guarded::add);
            guarded.set(6, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, unsafe ? -4 : -3));
            loop.put(OBSERVER, List.of(method(OBSERVER, "onScreenshot", VOID, false, 4, guarded, OBJECT, "Landroidx/fragment/app/FragmentActivity;")));
            write(root, "feature-guard-interior-" + (unsafe ? "bad" : "good"), loop, true, "hideScreenshotShare");
        }
        for (String variant : List.of("ads", "ai", "shopping", "shared", "duplicate", "wrong-register", "wrong-result", "unreachable-control")) {
            reset();
            String[] selected = variant.equals("ai") ? new String[]{"hideAiPins"} : variant.equals("shopping") ? new String[]{"hideShopping"}
                    : variant.equals("ads") ? new String[]{"hideAds"} : new String[]{"hideAds", "hideAiPins", "hideShopping"};
            for (String family : selected) enable(family);
            FLAGS.put("adViews", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            feed(classes, variant);
            write(root, "feature-feed-" + variant, classes, true, selected);
        }
        for (String variant : List.of("good", "left-original", "wrong-register", "missing-original-fallback", "partial", "false-capability",
                "unreachable-putStringExtra-fallback", "unreachable-putTextExtra-fallback", "unreachable-newPlainText-fallback",
                "unreachable-control", "unreachable-helper-control", "disabled-misses-fallback", "guarded-fallback-good", "branch-fallback-good")) {
            boolean partial = variant.equals("partial");
            if (partial) {
                Map<String, List<Method>> partialClean = new LinkedHashMap<>(clean);
                links(partialClean, false, "good", false);
                write(root, "feature-links-partial-clean", partialClean, false);
            }
            reset(); enable("stripLinkTracking");
            if (partial || variant.equals("false-capability")) FLAGS.put("linkTracking", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            links(classes, true, variant, !partial);
            write(root, "feature-links-" + variant, classes, true, "stripLinkTracking");
        }
        List<String> fallbackShapes = new ArrayList<>(COPIED_FALLBACKS);
        fallbackShapes.addAll(INTEGER_FALLBACKS);
        for (String shape : fallbackShapes) for (String answer : List.of("good", "bad")) {
            reset(); enable("stripLinkTracking");
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            links(classes, true, shape + "-" + answer, true);
            write(root, "feature-links-" + shape + "-" + answer, classes, true, "stripLinkTracking");
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
        reset();
        Map<String, List<Method>> absentClean = new LinkedHashMap<>(clean); absentClean.remove("Lfixture/UpdateTask;");
        write(root, "feature-optional-clean", absentClean, false);
        absentClean.putAll(hosts(true));
        write(root, "feature-optional-absent", absentClean, true, "disableUpdateNag");
        Map<String, List<Method>> unrelatedClean = new LinkedHashMap<>(clean); unrelatedClean.remove("Lfixture/UpdateTask;");
        String unrelated = "Lfixture/UnrelatedUpdateText;";
        unrelatedClean.put(unrelated, List.of(method(unrelated, "description", STRING, true, 1,
                List.of(literal("inAppUpdateManager", 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))));
        write(root, "feature-optional-unrelated-clean", unrelatedClean, false);
        unrelatedClean.putAll(hosts(true));
        write(root, "feature-optional-unrelated", unrelatedClean, true, "disableUpdateNag");
    }
}
