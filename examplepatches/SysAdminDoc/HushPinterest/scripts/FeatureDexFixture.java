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
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction32x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
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
    private static final String NATIVE_ROW = BASE + "settings/NativeSettingsItem;";
    private static final String NATIVE_MARKER = "Lfixture/NativeSettingsRow;";
    private static final String NATIVE_BASE = "Lfixture/NativeExternalRow;";
    private static final String NATIVE_EXTERNAL = "Lfixture/SafetyRow;";
    private static final String NATIVE_TEXT = "Lfixture/NativeText;";
    private static final String NATIVE_HEADER = "Lfixture/NativeHeader;";
    private static final String NATIVE_IDS = "Lfixture/SettingsStrings;";
    private static final String NATIVE_LIST = "Lfixture/SettingsList;";
    private static final String NATIVE_CLICK = "Lfixture/SettingsClick;";
    private static final String UTILS = "Lapp/hushpinterest/extension/shared/Utils;";
    private static final String APP = "Lcom/pinterest/ReleaseHiltApplication;";
    private static final String ACTIVITY = "Lcom/pinterest/activity/PinterestActivity;";
    private static final String HOME_ACTIVITY = "Lcom/pinterest/activityLibrary/activity/task/activity/MainActivity;";
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
    private static final String VIEW = "Landroid/view/View;";
    private static final String AMOLED = BASE + "ui/AmoledBlack;";
    private static final String PIN_MENU = "Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;";
    private static final String BOTTOM_BAR = "Lcom/pinterest/navigation/view/FloatingBottomNavBar;";
    private static final String ANDROID_TOAST = "Landroid/widget/Toast;";
    private static final String TOAST_CONTAINER = "Lcom/pinterest/gestalt/toast/PinterestToastContainer;";
    private static final String TOAST_VIEW = "Lcom/pinterest/gestalt/toast/BaseGestaltToast;";
    private static final String TOAST = "Lfixture/Toast;";
    private static final String SAVED_TOAST = "Lfixture/SavedToast;";
    private static final String FOLLOW_TOAST = "Lfixture/FollowToast;";
    private static final String PICKER_TOAST = "Lfixture/PickerToast;";
    private static final String MESSAGE_TOAST = "Lfixture/MessageToast;";
    private static final String TEXT_BUILDER = "Lfixture/TextBuilder;";
    private static final String SAVED_TEXT = "Lfixture/SavedText;";
    private static final String SAVE_SCREEN = "Lfixture/SaveScreen;";

    /** What a fixture class has beyond its methods: its parent, its interfaces, its public fields as name:type, and whether it's an interface. */
    private record Shape(String parent, List<String> interfaces, List<String> fields, boolean contract) {}
    private static final Map<String, Shape> SHAPES = new LinkedHashMap<>();
    static {
        for (String model : List.of(SAVED_TOAST, FOLLOW_TOAST)) SHAPES.put(model, new Shape(TOAST, List.of(), List.of(), false));
        SHAPES.put(PICKER_TOAST, new Shape(TOAST, List.of(), List.of("text:" + TEXT_BUILDER), false));
        SHAPES.put(MESSAGE_TOAST, new Shape(TOAST, List.of(), List.of("text:Ljava/lang/String;"), false));
        SHAPES.put(TEXT_BUILDER, new Shape(OBJECT, List.of(), List.of(), true));
        SHAPES.put(SAVED_TEXT, new Shape(OBJECT, List.of(TEXT_BUILDER), List.of(), false));
    }

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
        Shape shape = SHAPES.get(owner);
        if (shape != null) {
            List<ImmutableField> own = new ArrayList<>();
            for (String field : shape.fields()) own.add(new ImmutableField(owner, field.substring(0, field.indexOf(':')),
                    field.substring(field.indexOf(':') + 1), AccessFlags.PUBLIC.getValue(), null, Set.of(), Set.of()));
            return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue() | (shape.contract()
                    ? AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue() : 0), shape.parent(), shape.interfaces(), null, Set.of(), own, methods);
        }
        var fields = owner.equals("Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;")
                ? List.of(new ImmutableField(owner, "pin", "Lcom/pinterest/api/model/FixturePin;", AccessFlags.PUBLIC.getValue(), null, Set.of(), Set.of()))
                : List.<ImmutableField>of();
        if (owner.equals(NATIVE_BASE)) fields = List.of(new ImmutableField(owner, "text", NATIVE_TEXT, AccessFlags.PUBLIC.getValue(), null, Set.of(), Set.of()));
        String parent = owner.equals(NATIVE_ROW) || owner.equals(NATIVE_EXTERNAL) ? NATIVE_BASE : OBJECT;
        var interfaces = owner.equals(NATIVE_ROW) || owner.equals(NATIVE_EXTERNAL) ? List.of(NATIVE_MARKER) : List.<String>of();
        int flags = AccessFlags.PUBLIC.getValue() | (owner.equals(NATIVE_MARKER) ? AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue() : 0);
        return new ImmutableClassDef(owner, flags, parent, interfaces, null, Set.of(), fields, methods);
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
        visit.add(literal("com.pinterest.EXTRA_URL", 0)); visit.add(literal("_url", 0)); visit.add(end());
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
        classes.put(HOME_ACTIVITY, new ArrayList<>(List.of(
                method(HOME_ACTIVITY, "onNewIntent", VOID, false, 2, intent, INTENT))));
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
        for (Method m : classes.getOrDefault(ENTRY, List.of()))
            if (SHORTCUTS.contains(m.getName()) || m.getName().equals("open") || m.getName().equals("nativeTitleId")) entry.add(m);
        classes.put(ENTRY, entry);
    }

    private static Instruction readiness() { return invoke(Opcode.INVOKE_STATIC, ref(UTILS, "settingsReady", "Z")); }

    private static void nativeSettings(Map<String, List<Method>> classes, String variant) {
        boolean patched = !variant.equals("clean"), rowPresent = patched && !variant.equals("missing-row");
        boolean clickPresent = patched && !variant.equals("missing-click");
        String fragment = "Landroidx/fragment/app/Fragment;", array = "Ljava/util/ArrayList;";
        var add = ref(array, "add", "Z", OBJECT);
        var parentInit = ref(NATIVE_BASE, "<init>", VOID, "I", NATIVE_TEXT);
        var title = new ImmutableFieldReference(NATIVE_IDS, "settings_menu_teen_safety_resources", "I");
        classes.put(NATIVE_MARKER, List.of());
        classes.put(NATIVE_EXTERNAL, List.of(method(NATIVE_EXTERNAL, "<init>", VOID, false, 3, List.of(
                new ImmutableInstruction21c(Opcode.SGET, 0, title), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                invoke(Opcode.INVOKE_DIRECT, parentInit, 2, 0, 1), end()))));
        classes.put(NATIVE_BASE, List.of(method(NATIVE_BASE, "<init>", VOID, false, 3,
                List.of(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0), end()), "I", NATIVE_TEXT)));
        classes.put(NATIVE_TEXT, List.of(method(NATIVE_TEXT, "<init>", VOID, false, 4,
                List.of(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0), end()), "I", "Ljava/lang/Integer;", STRING)));
        classes.put(NATIVE_HEADER, List.of(method(NATIVE_HEADER, "<init>", VOID, false, 2,
                List.of(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", VOID), 0), end()), "I")));
        List<Instruction> builder = new ArrayList<>(List.of(
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 5),
                new ImmutableInstruction21c(Opcode.SGET, 1, new ImmutableFieldReference(NATIVE_IDS, "settings_main_header_settings", "I")),
                new ImmutableInstruction10t(Opcode.GOTO, 3),
                new ImmutableInstruction21c(Opcode.SGET, 1, new ImmutableFieldReference(NATIVE_IDS, "settings_main_header_account", "I")),
                new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, new ImmutableTypeReference(NATIVE_HEADER)),
                invoke(Opcode.INVOKE_DIRECT, ref(NATIVE_HEADER, "<init>", VOID, "I"), 2, 1),
                invoke(Opcode.INVOKE_VIRTUAL, add, 3, 2)));
        if (rowPresent) for (int n = 0; n < (variant.equals("duplicate-row") ? 2 : 1); n++) {
            builder.add(new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference(NATIVE_ROW)));
            builder.add(invoke(Opcode.INVOKE_DIRECT, ref(NATIVE_ROW, "<init>", VOID), 0));
            builder.add(invoke(Opcode.INVOKE_VIRTUAL, add, 3, 0));
        }
        builder.add(end());
        classes.put(NATIVE_LIST, List.of(method(NATIVE_LIST, "build", VOID, true, 4, builder, array)));
        List<Instruction> click = new ArrayList<>(List.of(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 3, new ImmutableTypeReference(NATIVE_BASE)),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, clickPresent ? 28 : 13)));
        var unit = new ImmutableFieldReference("Lkotlin/Unit;", "a", "Lkotlin/Unit;");
        if (clickPresent) click.addAll(List.of(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 3,
                        new ImmutableTypeReference(variant.equals("wrong-identity") ? NATIVE_BASE : NATIVE_ROW)),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 12),
                invoke(Opcode.INVOKE_VIRTUAL, ref(fragment, "requireActivity", "Landroidx/fragment/app/FragmentActivity;"), 4),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "open", "Z", "Landroid/app/Activity;"), 0),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, unit),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0), new ImmutableInstruction10x(Opcode.NOP)));
        click.addAll(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 3),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(NATIVE_BASE)),
                new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 0, new ImmutableFieldReference(NATIVE_BASE, "text", NATIVE_TEXT)),
                invoke(Opcode.INVOKE_VIRTUAL, ref(fragment, "requireContext", CONTEXT), 4),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 2, new ImmutableFieldReference("Lfixture/Events;", "TEEN_SAFETY_RESOURCES_LINK", OBJECT)),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, unit), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
        classes.put(NATIVE_CLICK, List.of(method(NATIVE_CLICK, "invoke", OBJECT, true, 5, click, OBJECT, fragment)));
        if (!patched) return;
        List<Instruction> ctor = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), literal("", 2),
                new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 3, new ImmutableTypeReference(NATIVE_TEXT)),
                invoke(Opcode.INVOKE_DIRECT, ref(NATIVE_TEXT, "<init>", VOID, "I", "Ljava/lang/Integer;", STRING), 3, 0, 1, 2),
                invoke(Opcode.INVOKE_STATIC, ref(ENTRY, "nativeTitleId", "I")), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                invoke(Opcode.INVOKE_DIRECT, parentInit, 4, variant.equals("wrong-title") ? 1 : 0, 3), end()));
        classes.put(NATIVE_ROW, List.of(method(NATIVE_ROW, "<init>", VOID, false, 5, ctor),
                method(NATIVE_ROW, "getViewType", "I", false, 2, List.of(
                        new ImmutableInstruction21s(Opcode.CONST_16, 0, variant.equals("wrong-view-type") ? 14 : 13),
                        new ImmutableInstruction11x(Opcode.RETURN, 0)))));
        List<Method> entry = new ArrayList<>(classes.get(ENTRY));
        entry.add(method(ENTRY, "open", "Z", true, 1, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                new ImmutableInstruction11x(Opcode.RETURN, 0)), "Landroid/app/Activity;"));
        entry.add(method(ENTRY, "nativeTitleId", "I", true, 1, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                new ImmutableInstruction11x(Opcode.RETURN, 0))));
        classes.put(ENTRY, entry);
    }

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
        for (String cap : capabilities(name)) FLAGS.put(cap, true);
    }

    /** A family's capability flags; none for a manifest-only family, whose contract column is empty. */
    private static List<String> capabilities(String family) {
        String column = FAMILIES.get(family)[1];
        return column.isEmpty() ? List.of() : List.of(column.split(","));
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
        classes.forEach((owner, methods) -> {
            ClassDef definition = type(owner, methods);
            if (name.equals("feature-native-settings-missing-interface") && owner.equals(NATIVE_ROW))
                definition = new ImmutableClassDef(owner, definition.getAccessFlags(), definition.getSuperclass(), List.of(),
                        null, definition.getAnnotations(), definition.getFields(), definition.getMethods());
            defs.add(definition);
        });
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

    /** A read of one of Pinterest's texts by its id, the way a method that words a message starts. */
    private static Instruction textId(String name) {
        return new ImmutableInstruction21c(Opcode.SGET, 0, new ImmutableFieldReference("Lfixture/Strings;", name, "I"));
    }

    /** False, then the true every check of a UiHooks stub jumps to. */
    private static List<Instruction> answers() {
        return List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction11x(Opcode.RETURN, 0));
    }

    /** A UiHooks stub that answers true for an instance of one of these classes, as Hide save toasts writes it. */
    private static Method instanceStub(String name, String... types) {
        List<Instruction> body = new ArrayList<>();
        for (int k = 0; k < types.length; k++) {
            body.add(new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 1, new ImmutableTypeReference(types[k])));
            body.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 4 * (types.length - k)));
        }
        body.addAll(answers());
        return method(SCREENSHOT, name, "Z", true, 2, body, OBJECT);
    }

    /**
     * Pinterest's toast container, a toast of each kind Hide save toasts tells apart and a screen
     * that words a save itself, with the patch's hooks and stubs unless clean. A no-text build has
     * no class that builds a save text for the board picker's toast, so nothing can tell that
     * toast's save from its removal: its stub stays the extension's own, and the capability has to
     * stay off. "bad-text-stub" leaves that stub alone in a build that does have the class.
     */
    private static void saveToasts(Map<String, List<Method>> classes, String variant) {
        boolean patched = !variant.endsWith("clean"), builder = !variant.startsWith("no-text");
        Instruction none = new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), answer = new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0);
        List<Instruction> show = new ArrayList<>();
        if (patched) {
            show.add(invoke(Opcode.INVOKE_STATIC, ref(SCREENSHOT, "hideSaveToast", "Z", OBJECT), 2));
            show.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            show.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3)); show.add(end());
        }
        show.add(invoke(Opcode.INVOKE_VIRTUAL, ref(TOAST, "view", TOAST_VIEW, TOAST_CONTAINER), 2, 1)); show.add(end());
        classes.put(TOAST_CONTAINER, List.of(method(TOAST_CONTAINER, "show", VOID, false, 3, show, TOAST)));
        classes.put(TOAST, List.of(method(TOAST, "view", TOAST_VIEW, false, 3, List.of(none, answer), TOAST_CONTAINER)));
        classes.put(SAVED_TOAST, List.of(method(SAVED_TOAST, "view", TOAST_VIEW, false, 3, List.of(textId("saved_to"), none, answer), TOAST_CONTAINER)));
        classes.put(FOLLOW_TOAST, List.of(method(FOLLOW_TOAST, "view", TOAST_VIEW, false, 3, List.of(
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, new ImmutableFieldReference("Lfixture/Kinds;", "FollowUpsellToast", "Lfixture/Kinds;")),
                none, answer), TOAST_CONTAINER)));
        // The board picker's toast shows whatever the builder in its field hands it.
        classes.put(PICKER_TOAST, List.of(method(PICKER_TOAST, "view", TOAST_VIEW, false, 3, List.of(
                new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, new ImmutableFieldReference(PICKER_TOAST, "text", TEXT_BUILDER)),
                invoke(Opcode.INVOKE_INTERFACE, ref(TEXT_BUILDER, "build", TEXT), 0),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), none, answer), TOAST_CONTAINER)));
        classes.put(MESSAGE_TOAST, List.of());
        classes.put(TEXT_BUILDER, List.of());
        if (builder) classes.put(SAVED_TEXT, List.of(method(SAVED_TEXT, "build", TEXT, false, 2, List.of(textId("saved_onto_board_bold"), none, answer))));
        // The screen words a section save, builds a toast that's handed its text, and shows an Android toast at once.
        ImmutableMethodReference make = ref(ANDROID_TOAST, "makeText", ANDROID_TOAST, CONTEXT, TEXT, "I");
        ImmutableMethodReference standIn = ref(SCREENSHOT, "androidToast", ANDROID_TOAST, CONTEXT, TEXT, "I");
        classes.put(SAVE_SCREEN, List.of(method(SAVE_SCREEN, "saved", VOID, true, 4, List.of(textId("saved_to_board_section"),
                new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference(MESSAGE_TOAST)),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1), invoke(Opcode.INVOKE_STATIC, patched ? standIn : make, 2, 3, 1),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), invoke(Opcode.INVOKE_VIRTUAL, ref(ANDROID_TOAST, "show", VOID), 0), end()),
                CONTEXT, TEXT)));
        if (!patched) return;
        Instruction decided = new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0);
        List<Instruction> asks = new ArrayList<>();
        if (builder && !variant.equals("bad-text-stub")) {
            asks.add(new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 2, new ImmutableTypeReference(PICKER_TOAST)));
            asks.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 10));
            asks.add(new ImmutableInstruction21c(Opcode.CHECK_CAST, 2, new ImmutableTypeReference(PICKER_TOAST)));
            asks.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 2, new ImmutableFieldReference(PICKER_TOAST, "text", TEXT_BUILDER)));
            asks.add(new ImmutableInstruction22c(Opcode.INSTANCE_OF, 1, 0, new ImmutableTypeReference(SAVED_TEXT)));
            asks.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 4));
            asks.addAll(answers());
        } else asks.addAll(answers().subList(0, 2));
        classes.put(SCREENSHOT, List.of(
                method(SCREENSHOT, "hideSaveToast", "Z", true, 2, List.of(readiness(), decided, new ImmutableInstruction11x(Opcode.RETURN, 0)), OBJECT),
                // Off or not ready, the stand-in makes Android's own toast.
                method(SCREENSHOT, "androidToast", ANDROID_TOAST, true, 4, List.of(readiness(), decided,
                        new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 4), none, answer, invoke(Opcode.INVOKE_STATIC, make, 1, 2, 3),
                        new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), answer), CONTEXT, TEXT, "I"),
                instanceStub("isSaveToast", SAVED_TOAST, FOLLOW_TOAST), instanceStub("isMessageToast", MESSAGE_TOAST),
                method(SCREENSHOT, "isSaveTextToast", "Z", true, 3, asks, OBJECT)));
    }

    /**
     * A build with a pin's menu and neither the comments screen nor the frosted glass under the
     * bottom bar, so AMOLED black reaches the menu alone. "no-glass" has the bottom bar as well,
     * still without its glass. "doubled" builds the menu in two methods: that isn't a missing
     * surface but one to look at, so the patched build has no hook and the check has to say why.
     */
    private static void blackSurfaces(Map<String, List<Method>> classes, String variant) {
        boolean doubled = variant.startsWith("doubled"), hooked = !variant.endsWith("clean") && !doubled;
        List<Instruction> build = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)));
        if (hooked) build.add(invoke(Opcode.INVOKE_STATIC, ref(AMOLED, "pinMenu", VOID, VIEW), 0));
        build.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        List<Method> menu = new ArrayList<>(List.of(method(PIN_MENU, "createModalView", VIEW, false, 2, build)));
        if (doubled) menu.add(method(PIN_MENU, "createModalView", VIEW, false, 3, build, CONTEXT));
        classes.put(PIN_MENU, menu);
        if (variant.startsWith("no-glass")) classes.put(BOTTOM_BAR, List.of());
        if (hooked) classes.put(AMOLED, List.of(method(AMOLED, "pinMenu", VOID, true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()), VIEW)));
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

    private static final String INFO = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;";
    private static final String ADVERTISING = BASE + "privacy/AdvertisingId;";
    private static final String HIDDEN_ACTIVITY = "Landroidx/credentials/playservices/HiddenActivity;";
    private static final String SIGN_IN_READINESS = BASE + "settings/GoogleSignInReadiness;";
    private static final String STORE = "Lfixture/BlockStore;";
    private static final String CONTINUATION = "Lfixture/Continuation;";

    /** A Block Store call's own body: it names Google's request or data type and answers nothing. */
    private static List<Instruction> record(String request) {
        return List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference("Lcom/google/android/gms/auth/blockstore/" + request)),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
    }

    /** androidx's failure listener for the Sign in with Google request, with GmsCore support's hook unless clean. */
    private static void signInFailure(Map<String, List<Method>> classes, String variant) {
        Instruction hook = invoke(Opcode.INVOKE_STATIC, ref(SIGN_IN_READINESS, "requestFailed", VOID, "Ljava/lang/Exception;"),
                variant.equals("wrong-argument") ? 1 : 2);
        List<Instruction> body = new ArrayList<>();
        if (variant.equals("good") || variant.equals("wrong-argument") || variant.equals("false-capability")) body.add(hook);
        body.add(literal("During get sign-in intent, failure response from one tap: ", 0));
        if (variant.equals("late")) body.add(hook);
        body.add(end());
        classes.put(HIDDEN_ACTIVITY, List.of(method(HIDDEN_ACTIVITY, "handleGetSignInIntent$lambda$6$lambda$5", VOID, true, 3, body,
                HIDDEN_ACTIVITY, "Ljava/lang/Exception;")));
        if (variant.equals("clean")) return;
        classes.put(SIGN_IN_READINESS, List.of(method(SIGN_IN_READINESS, "requestFailed", VOID, true, 2,
                List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end()), "Ljava/lang/Exception;")));
    }

    /** Google's advertising ID getters and a Block Store wrapper, with Hide advertising ID's hooks unless clean. */
    private static void browserId(Map<String, List<Method>> classes, String variant) {
        boolean patched = !variant.equals("clean");
        List<Instruction> id = new ArrayList<>(List.of(literal("fixture-ad-id", 0)));
        List<Instruction> limit = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)));
        if (patched) {
            id.add(invoke(Opcode.INVOKE_STATIC, ref(ADVERTISING, "id", STRING, STRING), 0));
            id.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
            limit.add(invoke(Opcode.INVOKE_STATIC, ref(ADVERTISING, "limitTracking", "Z", "Z"), 0));
            limit.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        }
        id.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        limit.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        classes.put(INFO, List.of(method(INFO, "getId", STRING, false, 2, id), method(INFO, "isLimitAdTrackingEnabled", "Z", false, 2, limit)));
        ImmutableMethodReference skip = ref(ADVERTISING, "skipBrowserId", "Z", STRING);
        // The read is v0, v1, then this, key and continuation.
        List<Instruction> read = new ArrayList<>();
        if (patched && !variant.equals("missing") && !variant.equals("misrouted")) {
            read.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 3, 1, skip));
            read.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            // The bad fallback tests the answer the wrong way round: still type-safe, so only the contract can see it.
            read.add(new ImmutableInstruction21t(variant.equals("bad-fallback") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0, 4));
            read.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
            read.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        }
        read.addAll(record("RetrieveBytesRequest;"));
        // The save is v0, then this, key, bytes and continuation.
        List<Instruction> save = new ArrayList<>();
        if (patched && !variant.equals("save-missing")) {
            save.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 4,
                    ref(ADVERTISING, "saveBrowserId", OBJECT, OBJECT, STRING, "[B", OBJECT)));
            save.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
            save.add(new ImmutableInstruction21t(variant.equals("save-bad-fallback") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0, 3));
            save.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        }
        // A Play services name, which GmsCore support renames inside this hooked method too.
        save.add(literal(variant.startsWith("gmscore-other") ? "app.revanced.android.gsf"
                : variant.startsWith("gmscore-") ? "app.revanced.android.gms" : "com.google.android.gms", 0));
        save.addAll(record("StoreBytesData;"));
        if (variant.equals("changed-original")) save.set(save.size() - 2, new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(OBJECT)));
        ImmutableMethodReference delete = ref(STORE, "delete", OBJECT, LIST, CONTINUATION);
        List<Method> store = new ArrayList<>(List.of(
                method(STORE, "read", "Ljava/io/Serializable;", false, 5, read, STRING, CONTINUATION),
                method(STORE, "save", OBJECT, false, 5, save, STRING, "[B", CONTINUATION),
                method(STORE, "delete", OBJECT, false, 4, record("DeleteBytesRequest;"), LIST, CONTINUATION)));
        if (variant.equals("misrouted")) store.add(method(STORE, "unrelated", VOID, true, 1,
                List.of(literal("pid", 0), invoke(Opcode.INVOKE_STATIC, skip, 0), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), end())));
        classes.put(STORE, store);
        if (!patched) return;
        List<Instruction> answer = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1));
        List<Instruction> flag = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 1));
        List<Instruction> skipped = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0));
        List<Instruction> saved = List.of(readiness(), new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        // The patch's rewrite of the extension's delete stub: the wrapper's own delete on the save's continuation.
        List<Instruction> deleted = List.of(new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(STORE)),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 3, new ImmutableTypeReference(CONTINUATION)),
                invoke(Opcode.INVOKE_VIRTUAL, variant.equals("bad-stub") ? ref(STORE, "remove", OBJECT, LIST, CONTINUATION) : delete, 1, 2, 3),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.put(ADVERTISING, List.of(method(ADVERTISING, "id", STRING, true, 2, answer, STRING),
                method(ADVERTISING, "limitTracking", "Z", true, 2, flag, "Z"),
                method(ADVERTISING, "skipBrowserId", "Z", true, 2, skipped, STRING),
                method(ADVERTISING, "saveBrowserId", OBJECT, true, 5, saved, OBJECT, STRING, "[B", OBJECT),
                method(ADVERTISING, "deleteBrowserId", OBJECT, true, 4, deleted, OBJECT, LIST, OBJECT)));
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
            // ClipData.newPlainText(text, text) passes one register twice in the host already.
            body.add(invoke(Opcode.INVOKE_STATIC, patched ? clipboardHook : nativeClipboard, variant.startsWith("doubled-") ? 3 : 2, 3));
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
            String[] values = line.trim().split("\\|", -1);
            FAMILIES.put(values[1], new String[]{values[2], values[3]});
            FLAGS.put(values[1], false);
            for (String cap : capabilities(values[1])) FLAGS.put(cap, false);
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
        Map<String, List<Method>> missingHomeIntent = new LinkedHashMap<>(settings);
        missingHomeIntent.put(HOME_ACTIVITY, clean.get(HOME_ACTIVITY));
        write(root, "feature-settings-missing-home-intent", missingHomeIntent, true);
        Map<String, List<Method>> nativeClean = new LinkedHashMap<>(clean);
        nativeSettings(nativeClean, "clean");
        write(root, "feature-native-settings-clean", nativeClean, false);
        for (String variant : List.of("good", "missing-row", "duplicate-row", "missing-click", "wrong-identity", "wrong-title", "wrong-view-type", "missing-interface")) {
            reset();
            Map<String, List<Method>> nativePatched = new LinkedHashMap<>(settings);
            nativeSettings(nativePatched, variant);
            write(root, "feature-native-settings-" + variant, nativePatched, true);
        }
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
        Map<String, List<Method>> browserClean = new LinkedHashMap<>(clean);
        browserId(browserClean, "clean");
        write(root, "feature-browser-id-clean", browserClean, false);
        for (String variant : List.of("good", "missing", "misrouted", "bad-fallback", "save-missing", "save-bad-fallback",
                "changed-original", "false-capability", "bad-stub", "gmscore-renamed", "gmscore-unselected", "gmscore-other-package")) {
            reset(); enable("hideAdvertisingId");
            if (variant.equals("false-capability")) FLAGS.put("browserId", false);
            boolean gmsCore = variant.equals("gmscore-renamed") || variant.equals("gmscore-other-package");
            // This fixture has no sign-in listener, so that capability has nothing to claim here.
            if (gmsCore) { enable("gmsCoreSupport"); FLAGS.put("signInFailure", false); }
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            browserId(classes, variant);
            write(root, "feature-browser-id-" + variant, classes, true,
                    gmsCore ? new String[]{"hideAdvertisingId", "gmsCoreSupport"} : new String[]{"hideAdvertisingId"});
        }
        Map<String, List<Method>> signInClean = new LinkedHashMap<>(clean);
        signInFailure(signInClean, "clean");
        write(root, "feature-sign-in-failure-clean", signInClean, false);
        for (String variant : List.of("good", "missing", "late", "wrong-argument", "false-capability")) {
            reset(); enable("gmsCoreSupport");
            if (variant.equals("false-capability")) FLAGS.put("signInFailure", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            signInFailure(classes, variant);
            write(root, "feature-sign-in-failure-" + variant, classes, true, "gmsCoreSupport");
        }
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
        for (String variant : List.of("ads", "ai", "shopping", "videos", "shared", "duplicate", "wrong-register", "wrong-result", "unreachable-control")) {
            reset();
            String[] selected = variant.equals("ai") ? new String[]{"hideAiPins"} : variant.equals("shopping") ? new String[]{"hideShopping"}
                    : variant.equals("ads") ? new String[]{"hideAds"} : variant.equals("videos") ? new String[]{"filterFeed"}
                    : new String[]{"hideAds", "hideAiPins", "hideShopping", "filterFeed"};
            for (String family : selected) enable(family);
            FLAGS.put("adViews", false);
            FLAGS.put("googleAds", false);
            // These synthetic targets have no Home request, so Hide pins you've already saved stays out.
            FLAGS.put("feedSavedPins", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            feed(classes, variant);
            write(root, "feature-feed-" + variant, classes, true, selected);
        }
        for (String variant : List.of("good", "left-original", "wrong-register", "missing-original-fallback", "partial", "false-capability",
                "unreachable-putStringExtra-fallback", "unreachable-putTextExtra-fallback", "unreachable-newPlainText-fallback",
                "unreachable-control", "unreachable-helper-control", "disabled-misses-fallback", "guarded-fallback-good", "branch-fallback-good",
                "doubled-host-good", "doubled-bad")) {
            boolean partial = variant.equals("partial");
            if (variant.equals("doubled-host-good")) {
                Map<String, List<Method>> doubledClean = new LinkedHashMap<>(clean);
                links(doubledClean, false, "doubled-clean", true);
                write(root, "feature-links-doubled-clean", doubledClean, false);
            }
            if (partial) {
                Map<String, List<Method>> partialClean = new LinkedHashMap<>(clean);
                links(partialClean, false, "good", false);
                write(root, "feature-links-partial-clean", partialClean, false);
            }
            reset(); enable("stripLinkTracking");
            // These synthetic targets have no invite logger, so Plain pin links stays out.
            FLAGS.put("plainPinLinks", false);
            if (partial || variant.equals("false-capability")) FLAGS.put("linkTracking", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            links(classes, true, variant, !partial);
            write(root, "feature-links-" + variant, classes, true, "stripLinkTracking");
        }
        List<String> fallbackShapes = new ArrayList<>(COPIED_FALLBACKS);
        fallbackShapes.addAll(INTEGER_FALLBACKS);
        for (String shape : fallbackShapes) for (String answer : List.of("good", "bad")) {
            reset(); enable("stripLinkTracking");
            // These synthetic targets have no invite logger, so Plain pin links stays out.
            FLAGS.put("plainPinLinks", false);
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
        // Builds that are short of one piece a patch works on: it keeps the rest, and the flag for the piece stays off.
        for (String build : List.of("", "no-text-")) {
            Map<String, List<Method>> toastClean = new LinkedHashMap<>(clean);
            saveToasts(toastClean, build + "clean");
            write(root, "feature-save-toasts-" + build + "clean", toastClean, false);
        }
        for (String variant : List.of("good", "bad-text-stub", "no-text", "no-text-claimed")) {
            reset(); enable("hideSaveToasts");
            if (variant.equals("no-text")) FLAGS.put("saveToasts", false);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            saveToasts(classes, variant);
            write(root, "feature-save-toasts-" + variant, classes, true, "hideSaveToasts");
        }
        for (String build : List.of("partial", "no-glass", "doubled")) {
            Map<String, List<Method>> surfaces = new LinkedHashMap<>(clean);
            blackSurfaces(surfaces, build + "-clean");
            write(root, "feature-amoled-" + build + "-clean", surfaces, false);
        }
        for (String variant : List.of("partial", "partial-claimed", "no-glass", "doubled")) {
            reset();
            FLAGS.put("amoledBlack", true);
            if (!variant.equals("doubled")) FLAGS.put("blackPinMenu", true);
            if (variant.equals("partial-claimed")) FLAGS.put("blackComments", true);
            Map<String, List<Method>> classes = new LinkedHashMap<>(settings);
            blackSurfaces(classes, variant);
            write(root, "feature-amoled-" + variant, classes, true, "amoledBlack");
        }
    }
}
