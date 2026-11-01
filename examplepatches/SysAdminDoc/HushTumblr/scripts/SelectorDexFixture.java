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
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Generated host code for the legacy UI selectors, including safe but semantically wrong mutations. */
public final class SelectorDexFixture {
    private static final String BASE = "Lapp/hushtumblr/extension/tumblr/";
    private static final String UI = BASE + "ui/";
    private static final String FIXTURE = "Lcom/tumblr/fixture/";
    private static final String OBJECT = "Ljava/lang/Object;", STRING = "Ljava/lang/String;", LIST = "Ljava/util/List;";
    private static final String VIEW = "Landroid/view/View;", GROUP = "Landroid/view/ViewGroup;", TEXT = "Landroid/widget/TextView;";
    private static final String CONTEXT = "Landroid/content/Context;", RESOURCES = "Landroid/content/res/Resources;";
    private static final String THEME = "Landroid/content/res/Resources$Theme;", WRAPPER = "Landroid/view/ContextThemeWrapper;";
    private static final String IDS = "Lcom/tumblr/R$id;", PLURALS = "Lcom/tumblr/R$plurals;";
    private static final String HUB = "Lcom/tumblr/settingshub/impl/hub/";
    private static final String ROW = HUB + "Row;", ROW_KIND = HUB + "Kind;", ROW_ICON = HUB + "Icon;";
    private static final String ICONS = "Lcom/tumblr/compose/ds/icons/outline/FixtureIcons;";
    private static final String ICON_RECEIVER = "Lcom/tumblr/compose/ds/icons/outline/FixtureReceiver;";
    private static final String ROW_HOOKS = BASE + "settings/SettingsHubRow;";
    private static final String TAGS = "Lcom/tumblr/ui/widget/PostCardWrappedTags;";
    private static final String TV = "Lcom/tumblr/videohub/view/VideoHubPostCardText;";
    private static final String TAG_MODEL = "Lcom/tumblr/rumblr/model/blog/TagV2;";
    private static final String REACTIONS = "Lcom/tumblr/ui/widget/postcontrol/CommunitiesReactionControl;";
    private static final String BAR = FIXTURE + "BottomController;", TABS = FIXTURE + "Tab;";
    private static final String ACTIVITY = FIXTURE + "ThemeActivity;", PALETTE = FIXTURE + "Palette;", COLORS = FIXTURE + "Colors;";
    private static final String DS_THEME = FIXTURE + "DsTheme;", DS_COLORS = FIXTURE + "DsColors;", COLOR_LIST = FIXTURE + "ColorList;";
    private static final String DARK_COLORS = FIXTURE + "DarkColors;", BLUE_COLORS = FIXTURE + "BlueColors;", NIGHT = FIXTURE + "Night;";
    private static final String CONFIGURATION = "Landroid/content/res/Configuration;";
    private static final String STORE_FLAGS = FIXTURE + "StoreFlags;";
    private static final List<String> CASES = new ArrayList<>();

    private static ImmutableMethodReference ref(String owner, String name, String result, String... parameters) {
        return new ImmutableMethodReference(owner, name, Arrays.asList(parameters), result);
    }

    private static Instruction invoke(Opcode opcode, ImmutableMethodReference reference, int... registers) {
        int[] words = new int[5];
        System.arraycopy(registers, 0, words, 0, registers.length);
        return new ImmutableInstruction35c(opcode, registers.length, words[0], words[1], words[2], words[3], words[4], reference);
    }

    private static Instruction staticCall(String owner, String name, String result, String[] parameters, int... registers) {
        return invoke(Opcode.INVOKE_STATIC, ref(owner, name, result, parameters), registers);
    }

    private static Instruction moved(int register, boolean object) {
        return new ImmutableInstruction11x(object ? Opcode.MOVE_RESULT_OBJECT : Opcode.MOVE_RESULT, register);
    }

    private static Instruction returned(int register, boolean object) {
        return new ImmutableInstruction11x(object ? Opcode.RETURN_OBJECT : Opcode.RETURN, register);
    }

    private static Instruction movedWide(int register) { return new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, register); }
    private static Instruction returnedWide(int register) { return new ImmutableInstruction11x(Opcode.RETURN_WIDE, register); }
    private static Instruction wide(int register, long value) { return new ImmutableInstruction51l(Opcode.CONST_WIDE, register, value); }
    private static Instruction range(Opcode opcode, ImmutableMethodReference reference, int first, int count) {
        return new ImmutableInstruction3rc(opcode, first, count, reference);
    }

    private static Instruction end() { return new ImmutableInstruction10x(Opcode.RETURN_VOID); }
    private static Instruction constant(int register, int value) { return new ImmutableInstruction11n(Opcode.CONST_4, register, value); }
    private static Instruction literal(int register, String text) {
        return new ImmutableInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference(text));
    }
    private static Instruction typed(Opcode opcode, int register, String type) {
        return new ImmutableInstruction21c(opcode, register, new ImmutableTypeReference(type));
    }
    private static Instruction field(Opcode opcode, int register, String owner, String name, String type) {
        return new ImmutableInstruction21c(opcode, register, new ImmutableFieldReference(owner, name, type));
    }
    private static Instruction instanceField(Opcode opcode, int value, int receiver, String owner, String name, String type) {
        return new ImmutableInstruction22c(opcode, value, receiver, new ImmutableFieldReference(owner, name, type));
    }

    private static Method method(String owner, String name, String result, boolean isStatic, int registers,
                                 List<Instruction> body, String... parameters) {
        List<ImmutableMethodParameter> types = Arrays.stream(parameters)
                .map(t -> new ImmutableMethodParameter(t, Set.of(), null)).toList();
        return new ImmutableMethod(owner, name, types, result,
                AccessFlags.PUBLIC.getValue() | (isStatic ? AccessFlags.STATIC.getValue() : 0), Set.of(), Set.of(),
                new ImmutableMethodImplementation(registers, body, List.of(), List.of()));
    }

    private static Field member(String owner, String name, String type) {
        return new ImmutableField(owner, name, type, AccessFlags.PUBLIC.getValue(), null, Set.of(), Set.of());
    }

    private static Field staticMember(String owner, String name, String type) {
        return new ImmutableField(owner, name, type, AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, Set.of(), Set.of());
    }

    private static void put(Map<String, ClassDef> classes, String owner, List<Method> methods, Field... fields) {
        put(classes, owner, OBJECT, methods, fields);
    }

    private static void put(Map<String, ClassDef> classes, String owner, String parent, List<Method> methods, Field... fields) {
        classes.put(owner, new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue(), parent,
                List.of(), null, Set.of(), Arrays.asList(fields), methods));
    }

    private static List<Instruction> body(Instruction... instructions) { return new ArrayList<>(List.of(instructions)); }

    private static Method hook(String owner, String name, String result, int answer, String... parameters) {
        List<Instruction> code = body(staticCall("Lapp/hushtumblr/extension/shared/Utils;", "settingsReady", "Z", new String[0]));
        int registers = Math.max(1, parameters.length);
        if (result.equals("V")) code.add(end());
        else {
            if (answer < 0) { code.add(constant(0, result.equals("Z") ? 1 : 0)); answer = 0; }
            code.add(returned(answer, result.startsWith("L")));
        }
        return method(owner, name, result, true, registers, code, parameters);
    }

    /** The branch skips exactly the injected tail, leaving the original body to run on false. */
    private static List<Instruction> guard(String owner, String name, String[] types, int scratch, List<Instruction> tail, int... registers) {
        int offset = 2 + tail.stream().mapToInt(Instruction::getCodeUnits).sum();
        List<Instruction> code = body(staticCall(owner, name, "Z", types, registers), moved(scratch, false),
                new ImmutableInstruction21t(Opcode.IF_EQZ, scratch, offset));
        code.addAll(tail);
        return code;
    }

    private static void settingsRow(Map<String, ClassDef> classes, boolean patched, String fault) {
        String builder = HUB + "Rows;", keys = HUB + "Keys;", clicker = HUB + "Click;";
        ImmutableMethodReference constructor = ref(ROW, "<init>", "V", ROW_KIND, "I", ROW_ICON, "Ljava/lang/Integer;");
        ImmutableMethodReference icon = ref(ICONS, "preferences", ROW_ICON, ICON_RECEIVER);
        List<Instruction> build = body(field(Opcode.SGET, 0, "Lcom/tumblr/core/ui/R$string;", "settings_hub_row_preferences", "I"),
                typed(Opcode.NEW_INSTANCE, 6, ROW), field(Opcode.SGET_OBJECT, 1, ROW_KIND, "Preferences", ROW_KIND),
                field(Opcode.SGET_OBJECT, 2, ICONS, "INSTANCE", ICON_RECEIVER), invoke(Opcode.INVOKE_STATIC, icon, 2), moved(2, true),
                constant(3, 0), invoke(Opcode.INVOKE_DIRECT, constructor, 6, 1, 0, 2, 3), typed(Opcode.NEW_INSTANCE, 5, "Ljava/util/ArrayList;"),
                invoke(Opcode.INVOKE_DIRECT, ref("Ljava/util/ArrayList;", "<init>", "V"), 5),
                invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "add", "Z", OBJECT), 5, 6));
        if (patched) {
            List<Instruction> added = body(staticCall(ROW_HOOKS, "titleRes", "I", new String[0]), moved(0, false),
                    new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1), field(Opcode.SGET_OBJECT, 1, ROW_KIND, "Preferences", ROW_KIND),
                    field(Opcode.SGET_OBJECT, 2, ICONS, "INSTANCE", ICON_RECEIVER), invoke(Opcode.INVOKE_STATIC, icon, 2), moved(2, true),
                    constant(3, 0), typed(Opcode.NEW_INSTANCE, 4, ROW), invoke(Opcode.INVOKE_DIRECT, constructor, 4, 1, 0, 2, 3),
                    invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "add", "Z", OBJECT), 5, 4));
            added.set(2, new ImmutableInstruction21t(fault.equals("row-inverted-title") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0,
                    added.subList(2, added.size()).stream().mapToInt(Instruction::getCodeUnits).sum()));
            build.addAll(added);
        }
        build.addAll(body(staticCall(FIXTURE + "Lists;", "copy", LIST, new String[]{LIST}, 5), moved(5, true), returned(5, true)));
        put(classes, builder, List.of(method(builder, "rows", LIST, false, 8, build)));
        put(classes, ROW, List.of(method(ROW, "<init>", "V", false, 5,
                        body(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", "V"), 0), end()), ROW_KIND, "I", ROW_ICON, "Ljava/lang/Integer;"),
                method(ROW, "title", "I", false, 2, body(constant(0, 1), returned(0, false))),
                method(ROW, "hashCode", "I", false, 2, body(constant(0, 7), returned(0, false))),
                method(ROW, "kind", ROW_KIND, false, 2, body(field(Opcode.SGET_OBJECT, 0, ROW_KIND, "Preferences", ROW_KIND), returned(0, true)))));
        List<Instruction> key = body(constant(1, 0), staticCall(keys, "key", OBJECT, new String[]{ROW}, 2), moved(0, true));
        if (patched) key.addAll(body(staticCall(ROW_HOOKS, "rowKey", OBJECT, new String[]{OBJECT, OBJECT},
                fault.equals("row-wrong-key") ? 1 : 2, 0), moved(0, true)));
        key.add(returned(0, true));
        put(classes, keys, List.of(method(keys, "key", OBJECT, true, 2, body(invoke(Opcode.INVOKE_VIRTUAL, ref(ROW, "kind", ROW_KIND), 1),
                        moved(0, true), returned(0, true)), ROW), method(keys, "forRow", OBJECT, true, 3, key, ROW)));
        List<Instruction> click = body(instanceField(Opcode.IGET_OBJECT, 0, 2, clicker, "row", ROW),
                invoke(Opcode.INVOKE_VIRTUAL, ref(ROW, "kind", ROW_KIND), 0), moved(1, true), end());
        if (patched) {
            List<Instruction> prefix = body(instanceField(Opcode.IGET_OBJECT, 0, 2, clicker,
                    fault.equals("row-wrong-click") ? "other" : "row", fault.equals("row-wrong-click") ? OBJECT : ROW));
            prefix.addAll(guard(ROW_HOOKS, "onClick", new String[]{OBJECT}, 1, body(end()), 0));
            click.addAll(0, prefix);
        }
        put(classes, clicker, List.of(method(clicker, "click", "V", false, 3, click)), member(clicker, "row", ROW), member(clicker, "other", OBJECT));
        if (patched) put(classes, ROW_HOOKS, List.of(
                hook(ROW_HOOKS, "titleRes", "I", -1), hook(ROW_HOOKS, "rowKey", OBJECT, 1, OBJECT, OBJECT),
                hook(ROW_HOOKS, "onClick", "Z", -1, OBJECT),
                method(ROW_HOOKS, "titleOf", "I", true, 2, body(typed(Opcode.CHECK_CAST, 1, ROW),
                        invoke(Opcode.INVOKE_VIRTUAL, ref(ROW, fault.equals("row-wrong-title") ? "hashCode" : "title", "I"), 1),
                        moved(0, false), returned(0, false)), OBJECT)));
    }

    private static void postTags(Map<String, ClassDef> classes, boolean patched, String fault) {
        String owner = UI + "PostParts;";
        List<Instruction> draw = body(constant(0, 0), invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "get", OBJECT, "I"), 3, 0),
                moved(0, true), typed(Opcode.CHECK_CAST, 0, TAG_MODEL), invoke(Opcode.INVOKE_VIRTUAL, ref(TAG_MODEL, "getTag", STRING), 0), moved(0, true), end());
        if (patched) draw.addAll(0, guard(owner, "hideTags", new String[0], 0,
                body(literal(2, fault.equals("tags-not-empty") ? "visible" : ""),
                        field(Opcode.SGET_OBJECT, 3, "Ljava/util/Collections;", "EMPTY_LIST", LIST))));
        put(classes, TAGS, List.of(method(TAGS, "draw", "V", false, 4, draw, STRING, LIST)));
        List<Instruction> tv = body(literal(1, ", "), constant(2, 0),
                staticCall(FIXTURE + "Strings;", "split", LIST, new String[]{STRING, STRING, "Z"}, 4, 1, 2), moved(0, true), end());
        if (patched) tv.addAll(fault.equals("tags-late-tv") ? 4 : 2, body(staticCall(owner, "tvTags", STRING, new String[]{STRING},
                fault.equals("tags-wrong-tv") ? 1 : 4), moved(4, true)));
        put(classes, TV, List.of(method(TV, "bind", "V", false, 5, tv, STRING)));
        if (patched) put(classes, owner, List.of(hook(owner, "hideTags", "Z", -1), hook(owner, "tvTags", STRING, 0, STRING)));
    }

    private static void noteCounts(Map<String, ClassDef> classes, boolean patched, String fault) {
        String hooks = UI + "PostFooter;", buttons = FIXTURE + "FooterButtons;", builder = FIXTURE + "FooterStates;";
        List<Method> controls = new ArrayList<>(), states = new ArrayList<>();
        for (String control : List.of("Comment", "Like", "Reblog")) {
            String state = FIXTURE + control + "State;";
            controls.add(method(buttons, control.toLowerCase(), "V", true, 2,
                    body(literal(0, "com.tumblr.ui.widget.splitnotescount.composable." + control + "Engagement (Fixture.kt:1)"), end()), state));
            states.add(method(builder, "make" + control, state, true, 1, body(constant(0, 0), returned(0, true))));
        }
        put(classes, buttons, controls);
        List<Instruction> formatter = body(literal(0, ""), new ImmutableInstruction21t(Opcode.IF_EQZ, 1, 6),
                staticCall(STRING, "valueOf", STRING, new String[]{"I"}, 1), moved(0, true), returned(0, true));
        if (patched) formatter.addAll(0, body(staticCall(hooks, "noteCount", "I", new String[]{"I"}, 1),
                moved(fault.equals("notes-wrong-formatter") ? 0 : 1, false)));
        states.add(method(builder, "format", STRING, true, 2, formatter, "I"));
        put(classes, builder, states);
        String comments = FIXTURE + "Comments;";
        List<Instruction> comment = body(literal(0, "com.tumblr.ui.widget.postcontrol.rememberFormattedComments (Fixture.kt:2)"),
                field(Opcode.SGET, 0, PLURALS, "community_post_comments", "I"),
                new ImmutableInstruction35c(Opcode.FILLED_NEW_ARRAY, 1, 4, 0, 0, 0, 0, new ImmutableTypeReference("[Ljava/lang/Object;")));
        comment.addAll(body(moved(1, true), invoke(Opcode.INVOKE_VIRTUAL, ref(RESOURCES, "getQuantityString", STRING, "I", "I", "[Ljava/lang/Object;"), 5, 0, 6, 1),
                moved(2, true), invoke(Opcode.INVOKE_VIRTUAL, ref(STRING, "length", "I"), 4), moved(3, false), returned(2, true)));
        if (patched) comment.addAll(6, body(staticCall(hooks, "communityCommentsText", STRING, new String[]{STRING}, 2), moved(2, true),
                staticCall(hooks, "textCount", STRING, new String[]{STRING}, fault.equals("notes-wrong-comment-count") ? 2 : 4), moved(4, true)));
        put(classes, comments, List.of(method(comments, "format", STRING, true, 7, comment, STRING, RESOURCES, "I")));
        String screen = FIXTURE + "NotesScreen;";
        List<Instruction> title = body(field(Opcode.SGET, 0, PLURALS, "note_count_show", "I"),
                invoke(Opcode.INVOKE_VIRTUAL, ref(RESOURCES, "getQuantityString", STRING, "I", "I"), 4, 0, 5), moved(1, true),
                invoke(Opcode.INVOKE_VIRTUAL, ref("Landroid/app/Activity;", "setTitle", "V", "Ljava/lang/CharSequence;"), 3, 1), end());
        if (patched) title.addAll(fault.equals("notes-late-title") ? 4 : 3,
                body(staticCall(hooks, "notesTitle", STRING, new String[]{STRING}, 1), moved(1, true)));
        put(classes, screen, "Landroid/app/Activity;", List.of(method(screen, "title", "V", false, 6, title, RESOURCES, "I")));
        String sb = "Ljava/lang/StringBuilder;";
        List<Instruction> reactions = body(constant(4, 7), constant(1, 3), typed(Opcode.NEW_INSTANCE, 0, sb),
                invoke(Opcode.INVOKE_DIRECT, ref(sb, "<init>", "V"), 0), invoke(Opcode.INVOKE_VIRTUAL, ref(sb, "append", sb, "I"), 0, 1), moved(0, true),
                invoke(Opcode.INVOKE_VIRTUAL, ref(sb, "toString", STRING), 0), moved(2, true), instanceField(Opcode.IGET_OBJECT, 3, 5, REACTIONS, "text", TEXT),
                invoke(Opcode.INVOKE_VIRTUAL, ref(TEXT, "setText", "V", "Ljava/lang/CharSequence;"), 3, 2), end());
        if (patched) reactions.addAll(9, body(staticCall(hooks, "communityReactionsText", STRING, new String[]{STRING, "I"}, 2,
                fault.equals("notes-wrong-reactions") ? 4 : 1), moved(2, true)));
        put(classes, REACTIONS, List.of(method(REACTIONS, "bind", "V", false, 7, reactions, LIST)), member(REACTIONS, "text", TEXT));
        String tabs = FIXTURE + "NotesTabs;", fragment = "Landroidx/fragment/app/Fragment;";
        List<Instruction> make = new ArrayList<>();
        for (String made : List.of("replies/PostNotesRepliesFragment;", "reblogs/PostNotesReblogsFragment;", "likes/PostNotesLikesFragment;")) {
            String type = "Lcom/tumblr/notes/view/" + made;
            make.addAll(body(typed(Opcode.NEW_INSTANCE, 0, type), invoke(Opcode.INVOKE_DIRECT, ref(type, "<init>", "V"), 0)));
        }
        make.add(returned(0, true));
        List<Instruction> count = body(staticCall("Ljava/text/NumberFormat;", "getIntegerInstance", "Ljava/text/NumberFormat;", new String[0]),
                moved(0, true), literal(0, ""), returned(0, true));
        if (patched) count.addAll(0, guard(hooks, "hideNotesTabCounts", new String[0], 0,
                body(literal(0, fault.equals("notes-tab-not-blank") ? "12" : ""), returned(0, true))));
        put(classes, tabs, List.of(method(tabs, "make", fragment, false, 3, make, "I"),
                method(tabs, "count", "Ljava/lang/CharSequence;", false, 3, count, "I")));
        if (patched) put(classes, hooks, List.of(hook(hooks, "noteCount", "I", 0, "I"),
                hook(hooks, "communityCommentsText", STRING, 0, STRING), hook(hooks, "textCount", STRING, 0, STRING),
                hook(hooks, "notesTitle", STRING, 0, STRING), hook(hooks, "communityReactionsText", STRING, 0, STRING, "I"),
                hook(hooks, "hideNotesTabCounts", "Z", -1)));
    }

    private static void bottomBarTabs(Map<String, ClassDef> classes, boolean patched, String fault) {
        String hooks = UI + "BottomBarTabs;", builder = FIXTURE + "Tabs;", maker = FIXTURE + "BottomMaker;";
        List<Instruction> tabs = body(typed(Opcode.NEW_INSTANCE, 0, "Ljava/util/ArrayList;"),
                invoke(Opcode.INVOKE_DIRECT, ref("Ljava/util/ArrayList;", "<init>", "V"), 0),
                field(Opcode.SGET_OBJECT, 1, TABS, "Dashboard", TABS), invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "add", "Z", OBJECT), 0, 1),
                field(Opcode.SGET_OBJECT, 1, TABS, "Account", TABS), invoke(Opcode.INVOKE_INTERFACE, ref(LIST, "add", "Z", OBJECT), 0, 1),
                staticCall("Ljava/util/List;", "copyOf", LIST, new String[]{"Ljava/util/Collection;"}, 0), moved(0, true), returned(0, true));
        if (patched) tabs.add(fault.equals("tabs-late-freeze") ? 8 : 6, staticCall(hooks, "arrangeTabs", "V", new String[]{LIST}, 0));
        put(classes, builder, List.of(method(builder, "build", LIST, true, 2, tabs)));
        put(classes, BAR, List.of(method(BAR, "<init>", "V", false, 3,
                body(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", "V"), 1), field(Opcode.SGET, 0, IDS, "dashboard_badge", "I"),
                        invoke(Opcode.INVOKE_VIRTUAL, ref(GROUP, "findViewById", VIEW, "I"), 2, 0), moved(0, true), end()), GROUP)));
        List<Instruction> make = body(typed(Opcode.NEW_INSTANCE, 0, BAR), invoke(Opcode.INVOKE_DIRECT, ref(BAR, "<init>", "V", GROUP), 0, 2), end());
        if (patched) make.add(2, staticCall(hooks, "arrangeBar", "V", new String[]{GROUP}, fault.equals("tabs-wrong-view") ? 0 : 2));
        put(classes, maker, List.of(method(maker, "make", "V", true, 3, make, GROUP)));
        if (patched) put(classes, hooks, List.of(hook(hooks, "arrangeTabs", "V", -1, LIST), hook(hooks, "arrangeBar", "V", -1, GROUP)));
    }

    private static void darkBackground(Map<String, ClassDef> classes, boolean patched, String fault) {
        String hooks = UI + "DarkBackground;";
        put(classes, ACTIVITY, "Landroid/app/Activity;", List.of());
        List<Instruction> palette = body(invoke(Opcode.INVOKE_VIRTUAL, ref(ACTIVITY, "setTheme", "V", "I"), 2, 3),
                field(Opcode.SGET_OBJECT, 0, PALETTE, "INSTANCE", PALETTE), end());
        if (patched) palette.add(1, staticCall(hooks, "onActivityTheme", "V", new String[]{"Landroid/app/Activity;"},
                fault.equals("theme-wrong-activity") ? 1 : 2));
        put(classes, PALETTE, List.of(method(PALETTE, "apply", "V", false, 4, palette, ACTIVITY, "I")));
        List<Instruction> colors = body(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", "V"), 3), typed(Opcode.NEW_INSTANCE, 0, WRAPPER),
                invoke(Opcode.INVOKE_DIRECT, ref(WRAPPER, "<init>", "V", CONTEXT, "I"), 0, 4, 5),
                invoke(Opcode.INVOKE_VIRTUAL, ref(WRAPPER, "getTheme", THEME), 0), moved(1, true),
                field(Opcode.SGET, 2, "Lcom/tumblr/themes/R$attr;", "themeMainContentBackgroundColor", "I"), end());
        if (patched) colors.add(5, staticCall(hooks, "onComposeTheme", "V", new String[]{THEME}, fault.equals("theme-wrong-compose") ? 0 : 1));
        put(classes, COLORS, List.of(method(COLORS, "<init>", "V", false, 6, colors, CONTEXT, "I")));
        designColors(classes, hooks, patched, fault);
        pageColors(classes, hooks, patched, fault);
        if (patched) put(classes, hooks, List.of(hook(hooks, "onActivityTheme", "V", -1, "Landroid/app/Activity;"), hook(hooks, "onComposeTheme", "V", -1, THEME),
                wideHook(hooks, "designPage"), wideHook(hooks, "designPanel"), wideHook(hooks, "designFooter"),
                hook(hooks, "pageColor", "I", 0, "I"), hook(hooks, "pageTextColor", "I", 0, "I"), hook(hooks, "hubColor", STRING, 0, STRING)));
    }

    /**
     * A blog's theme, the class that compares two of them and answers a page's, a title's and a link's
     * color from one, and a tag page reading its header's color, with the header's JSON adapter reading
     * it too. Patched, each color's function hands its answer over right before it returns it and the
     * page hands over what it read. The adapter stays as Tumblr wrote it.
     */
    private static void pageColors(Map<String, ClassDef> classes, String hooks, boolean patched, String fault) {
        String theme = "Lcom/tumblr/bloginfo/BlogTheme;", blogColors = FIXTURE + "BlogColors;", parse = FIXTURE + "ParseColor;";
        String header = "Lcom/tumblr/rumblr/response/CommunityHubHeaderResponse$CommunityHubHeader;";
        String page = FIXTURE + "TagPage;", adapter = FIXTURE + "HeaderJsonAdapter;";
        put(classes, theme, List.of(method(theme, "a", STRING, false, 2, body(literal(0, "#00B8FF"), returned(0, true))),
                method(theme, "d", STRING, false, 2, body(literal(0, "#F5EBD7"), returned(0, true))),
                method(theme, "u", STRING, false, 2, body(literal(0, "#0B1A3D"), returned(0, true)))));
        put(classes, parse, List.of(method(parse, "parse", "I", true, 2, body(constant(0, 0), returned(0, false)), STRING)));
        List<Instruction> compare = body(literal(1, "link_color"), invoke(Opcode.INVOKE_VIRTUAL, ref(theme, "a", STRING), 3), moved(1, true),
                literal(1, "background_color"), invoke(Opcode.INVOKE_VIRTUAL, ref(theme, "d", STRING), 3), moved(1, true),
                literal(1, "title_color"), invoke(Opcode.INVOKE_VIRTUAL, ref(theme, "u", STRING), 3), moved(1, true), end());
        put(classes, blogColors, List.of(method(blogColors, "compare", "V", true, 4, compare, theme, theme),
                blogColor(blogColors, theme, parse, "color", "d", hooks, "pageColor", "theme-page", patched, fault),
                blogColor(blogColors, theme, parse, "title", "u", hooks, "pageTextColor", "theme-title", patched, fault),
                blogColor(blogColors, theme, parse, "link", "a", hooks, "pageTextColor", "theme-link", patched, fault)));
        put(classes, header, List.of(method(header, "getBackgroundColor", STRING, false, 2, body(literal(0, "#2DBFA0"), returned(0, true)))));
        List<Instruction> paint = body(invoke(Opcode.INVOKE_VIRTUAL, ref(header, "getBackgroundColor", STRING), 2), moved(0, true), end());
        if (patched && !fault.equals("theme-tag-missing")) paint.addAll(2, body(
                staticCall(hooks, "hubColor", STRING, new String[]{STRING}, 0), moved(fault.equals("theme-tag-wrong-register") ? 1 : 0, true)));
        put(classes, page, List.of(method(page, "paint", "V", true, 3, paint, header)));
        List<Instruction> write = body(invoke(Opcode.INVOKE_VIRTUAL, ref(header, "getBackgroundColor", STRING), 1), moved(0, true), end());
        if (patched && fault.equals("theme-tag-adapter")) write.addAll(2, body(staticCall(hooks, "hubColor", STRING, new String[]{STRING}, 0), moved(0, true)));
        put(classes, adapter, List.of(method(adapter, "toJson", "V", true, 2, write, header)));
    }

    /** One of a blog's colors: read with [getter], parsed and returned, handing [hook] the answer when patched. */
    private static Method blogColor(String owner, String theme, String parse, String name, String getter, String hooks, String hook, String faults, boolean patched, String fault) {
        List<Instruction> read = body(invoke(Opcode.INVOKE_VIRTUAL, ref(theme, getter, STRING), 1), moved(0, true),
                staticCall(parse, "parse", "I", new String[]{STRING}, 0), moved(0, false), returned(0, false));
        if (patched && !fault.equals(faults + "-missing")) read.addAll(4, body(
                staticCall(hooks, hook, "I", new String[]{"I"}, 0), moved(fault.equals(faults + "-wrong-register") ? 1 : 0, false)));
        return method(owner, name, "I", true, 2, read, theme);
    }

    /** A hook that takes a long and hands one back, asking whether the settings are ready as every hook does. */
    private static Method wideHook(String owner, String name) {
        return method(owner, name, "J", true, 2,
                body(staticCall("Lapp/hushtumblr/extension/shared/Utils;", "settingsReady", "Z", new String[0]), returnedWide(0)), "J");
    }

    /**
     * The design system as the patch reads it: a theme function that takes the Dark palette's colors
     * in night mode and another palette's otherwise, a color list whose getters each hand out one
     * fixed color, and a holder per palette whose initializer reads the list and keeps what it built.
     * Both holders read the page gray once, the panel gray twice and a border in between. Patched,
     * only the Dark one hands its page and panel grays to the hooks, each answer going back where
     * the gray was.
     */
    private static void designColors(Map<String, ClassDef> classes, String hooks, boolean patched, String fault) {
        String pack = FIXTURE + "ColorPack;";
        String[] longs = {"J", "J", "J", "J"};
        put(classes, DS_COLORS, List.of(method(DS_COLORS, "<init>", "V", false, 9,
                body(invoke(Opcode.INVOKE_DIRECT, ref(OBJECT, "<init>", "V"), 0), end()), longs)));
        put(classes, NIGHT, List.of(method(NIGHT, "isNight", "Z", true, 2, body(constant(0, 1), returned(0, false)), CONFIGURATION)));
        put(classes, pack, List.of(method(pack, "pack", "J", true, 2, body(returnedWide(0)), "J")));
        String[] colors = {"page", "panel", "border"};
        long[] values = {0xFF0D0D0DL, 0xFF1A1A1AL, 0xFF333333L};
        List<Instruction> fill = new ArrayList<>();
        List<Method> list = new ArrayList<>();
        for (int n = 0; n < colors.length; n++) {
            fill.addAll(body(wide(0, values[n]), staticCall(pack, "pack", "J", new String[]{"J"}, 0, 1), movedWide(0),
                    field(Opcode.SPUT_WIDE, 0, COLOR_LIST, colors[n], "J")));
            list.add(method(COLOR_LIST, colors[n], "J", false, 3, body(field(Opcode.SGET_WIDE, 0, COLOR_LIST, colors[n], "J"), returnedWide(0))));
        }
        fill.add(end());
        list.add(method(COLOR_LIST, "<clinit>", "V", true, 2, fill));
        put(classes, COLOR_LIST, list, staticMember(COLOR_LIST, "page", "J"), staticMember(COLOR_LIST, "panel", "J"),
                staticMember(COLOR_LIST, "border", "J"), staticMember(COLOR_LIST, "LIST", COLOR_LIST));

        // The colors go into v1 to v8 as four longs, in the order the constructor takes them.
        String[] reads = {"page", "panel", "border", "panel"};
        for (String holder : List.of(DARK_COLORS, BLUE_COLORS)) {
            boolean dark = holder.equals(DARK_COLORS);
            List<Instruction> build = body(typed(Opcode.NEW_INSTANCE, 0, DS_COLORS), field(Opcode.SGET_OBJECT, 9, COLOR_LIST, "LIST", COLOR_LIST));
            List<Instruction> late = new ArrayList<>();
            for (int n = 0; n < reads.length; n++) {
                int kept = 1 + 2 * n;
                build.addAll(body(invoke(Opcode.INVOKE_VIRTUAL, ref(COLOR_LIST, reads[n], "J"), 9), movedWide(kept)));
                build.addAll(late);
                late.clear();
                if (!patched || reads[n].equals("border")) continue;
                if (!dark && !(fault.equals("theme-design-other-palette") && n == 0)) continue;
                if (dark && fault.equals("theme-design-missing-read") && n == 3) continue;
                String name = reads[n].equals("page") ? "designPage" : "designPanel";
                int taken = dark && fault.equals("theme-design-wrong-register") && n == 3 ? 3 : kept;
                List<Instruction> handed = body(range(Opcode.INVOKE_STATIC_RANGE, ref(hooks, name, "J", "J"), taken, 2), movedWide(kept));
                if (dark && fault.equals("theme-design-late") && n == 0) late.addAll(handed);
                else build.addAll(handed);
            }
            build.addAll(body(range(Opcode.INVOKE_DIRECT_RANGE, ref(DS_COLORS, "<init>", "V", longs), 0, 9),
                    field(Opcode.SPUT_OBJECT, 0, holder, "COLORS", DS_COLORS), end()));
            put(classes, holder, List.of(method(holder, "<clinit>", "V", true, 10, build),
                    method(holder, "get", DS_COLORS, true, 1, body(field(Opcode.SGET_OBJECT, 0, holder, "COLORS", DS_COLORS), returned(0, true)))),
                    staticMember(holder, "COLORS", DS_COLORS));
        }

        // if-eqz skips its own two units, the Dark palette's call, its answer and the return.
        List<Instruction> theme = body(literal(0, "com.tumblr.compose.ds.DsTheme (DsTheme.kt:35)"),
                staticCall(NIGHT, "isNight", "Z", new String[]{CONFIGURATION}, 2), moved(0, false),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 7),
                staticCall(DARK_COLORS, "get", DS_COLORS, new String[0]), moved(1, true), end(),
                staticCall(BLUE_COLORS, "get", DS_COLORS, new String[0]), moved(1, true), end());
        put(classes, DS_THEME, List.of(method(DS_THEME, "theme", "V", true, 4, theme, CONFIGURATION, DS_COLORS)));

        // The footer under a post reads its group's panel color and hands it straight to the background modifier.
        String footer = FIXTURE + "PostFooter;", group = FIXTURE + "ContentGroup;", paint = FIXTURE + "Background;";
        String modifier = FIXTURE + "Modifier;", shape = FIXTURE + "Shape;";
        put(classes, group, List.of(method(group, "panel", "J", false, 3, body(wide(0, 0xFF1A1A1AL), returnedWide(0)))));
        put(classes, paint, List.of(method(paint, "background", modifier, true, 4, body(returned(0, true)), modifier, "J", shape)));
        List<Instruction> draw = body(literal(0, "com.tumblr.ui.widget.splitnotescount.composable.PostFooterSplitNotesCountContent (PostFooterSplitNotesCountContent.kt:33)"),
                invoke(Opcode.INVOKE_VIRTUAL, ref(group, "panel", "J"), 4), movedWide(1),
                staticCall(paint, "background", modifier, new String[]{modifier, "J", shape}, 5, 1, 2, 6), moved(0, true), end());
        if (patched && !fault.equals("theme-footer-missing")) draw.addAll(3, body(range(Opcode.INVOKE_STATIC_RANGE, ref(hooks, "designFooter", "J", "J"), 1, 2),
                movedWide(fault.equals("theme-footer-wrong-register") ? 3 : 1)));
        put(classes, footer, List.of(method(footer, "draw", "V", true, 7, draw, group, modifier, shape)));
    }

    private static void storeButtons(Map<String, ClassDef> classes, boolean patched, String fault) {
        String hooks = UI + "StoreButtons;", diamond = FIXTURE + "PremiumDiamond;", mart = FIXTURE + "Mart;", header = FIXTURE + "ExploreHeader;";
        String drawee = "Lcom/facebook/drawee/view/SimpleDraweeView;", image = "Landroid/widget/ImageView;";
        List<Instruction> draw = body(literal(0, "arg_has_clicked_on_premium_diamond"), constant(1, 0),
                invoke(Opcode.INVOKE_VIRTUAL, ref(VIEW, "setVisibility", "V", "I"), 3, 1),
                invoke(Opcode.INVOKE_VIRTUAL, ref(VIEW, "setVisibility", "V", "I"), 4, 1), end());
        if (patched) draw.addAll(0, guard(hooks, "hideDiamond", new String[]{VIEW, VIEW}, 0, body(end()),
                fault.equals("store-swapped-diamond") ? 4 : 3, fault.equals("store-swapped-diamond") ? 3 : 4));
        put(classes, diamond, List.of(method(diamond, "draw", "V", false, 5, draw, drawee, image)));
        List<Instruction> buttons = new ArrayList<>();
        int n = 0;
        for (String id : List.of("tumblrmart_button_top_bar", "tumblr_mart_icon")) {
            buttons.addAll(body(field(Opcode.SGET, 0, IDS, id, "I"), invoke(Opcode.INVOKE_VIRTUAL, ref(GROUP, "findViewById", VIEW, "I"), 5, 0),
                    moved(1, true), constant(2, 0), invoke(Opcode.INVOKE_VIRTUAL, ref(VIEW, "setVisibility", "V", "I"), 1, 2)));
            if (patched && !(fault.equals("store-missing-second-button") && n == 1)) buttons.add(staticCall(hooks, "hideTumblrMart", "V", new String[]{VIEW},
                    fault.equals("store-wrong-button") ? 5 : 1));
            n++;
        }
        buttons.add(end());
        put(classes, mart, List.of(method(mart, "bind", "V", false, 6, buttons, GROUP)));
        List<Instruction> room = body(field(Opcode.SGET, 2, IDS, "search_bar", "I"), constant(3, 0));
        for (String flag : List.of("APP_TOP_NAVIGATION_UPDATE", "ENABLE_TUMBLR_PREMIUM")) {
            String name = flag.equals("APP_TOP_NAVIGATION_UPDATE") ? "tumblrMartRoom" : "diamondRoom";
            room.addAll(body(field(Opcode.SGET_OBJECT, 0, STORE_FLAGS, flag, STORE_FLAGS),
                    field(Opcode.SGET, 2, "Lcom/tumblr/R$dimen;", "top_navigation_icon_size", "I"), constant(1, 4),
                    instanceField(Opcode.IPUT, 1, 5, header, name, "I")));
            if (patched && !fault.equals("store-late-room")) room.addAll(body(staticCall(hooks, name, "I", new String[]{"I"},
                    fault.equals("store-wrong-room") ? 3 : 1), moved(1, false)));
            room.add(new ImmutableInstruction12x(Opcode.ADD_INT_2ADDR, 3, 1));
            if (patched && fault.equals("store-late-room")) room.addAll(body(staticCall(hooks, name, "I", new String[]{"I"}, 1), moved(1, false)));
        }
        room.add(end());
        put(classes, header, List.of(method(header, "bind", "V", false, 6, room)), member(header, "tumblrMartRoom", "I"), member(header, "diamondRoom", "I"));
        if (patched) put(classes, hooks, List.of(hook(hooks, "hideDiamond", "Z", -1, VIEW, VIEW), hook(hooks, "hideTumblrMart", "V", -1, VIEW),
                hook(hooks, "tumblrMartRoom", "I", 0, "I"), hook(hooks, "diamondRoom", "I", 0, "I")));
    }

    private static Map<String, ClassDef> classes(boolean patched, String fault, String... families) {
        Map<String, ClassDef> classes = new LinkedHashMap<>(FeatureDexFixture.baseClasses(patched));
        List<String> enabled = Arrays.asList(families);
        settingsRow(classes, patched, fault);
        postTags(classes, patched && enabled.contains("hideHashtags"), fault);
        noteCounts(classes, patched && enabled.contains("hideNoteCounts"), fault);
        bottomBarTabs(classes, patched && enabled.contains("reorderTabs"), fault);
        darkBackground(classes, patched && enabled.contains("darkBackground"), fault);
        storeButtons(classes, patched && enabled.contains("hideTumblrMart"), fault);
        return classes;
    }

    private static void write(Path root, String name, Map<String, ClassDef> classes) throws Exception {
        DexPool.writeTo(root.resolve(name + ".dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), classes.values()));
    }

    private static void fixture(Path root, String fault, String reason, String... families) throws Exception {
        FeatureDexFixture.reset();
        for (String family : families) FeatureDexFixture.enable(family);
        String name = "feature-selector-" + fault;
        write(root, name, classes(true, fault, families));
        Files.write(root.resolve(name + ".selected"), FeatureDexFixture.selected(families), StandardCharsets.UTF_8);
        CASES.add(name + "|" + reason.isEmpty() + "|" + reason);
    }

    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[0]);
        Files.createDirectories(root);
        FeatureDexFixture.initialize(Path.of(args[1]));
        write(root, "selector-clean", classes(false, ""));
        fixture(root, "row-good", "");
        fixture(root, "row-inverted-title", "row isn't added to Tumblr's Settings rows");
        fixture(root, "row-wrong-key", "rowKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; doesn't take what its rule hands it");
        fixture(root, "row-wrong-click", "onClick(Ljava/lang/Object;)Z isn't asked first thing");
        fixture(root, "row-wrong-title", "titleOf doesn't read a row's title through");
        fixture(root, "tags-good", "", "hideHashtags");
        fixture(root, "tags-not-empty", "hideTags()Z isn't asked first thing", "hideHashtags");
        fixture(root, "tags-late-tv", "tvTags(Ljava/lang/String;)Ljava/lang/String; is not where its rule puts it", "hideHashtags");
        fixture(root, "tags-wrong-tv", "tvTags(Ljava/lang/String;)Ljava/lang/String; doesn't take what its rule hands it", "hideHashtags");
        fixture(root, "notes-good", "", "hideNoteCounts");
        fixture(root, "notes-wrong-formatter", "noteCount(I)I doesn't take what its rule hands it", "hideNoteCounts");
        fixture(root, "notes-wrong-comment-count", "communityCommentsText(Ljava/lang/String;)Ljava/lang/String; doesn't take the community comment text, then its count", "hideNoteCounts");
        fixture(root, "notes-late-title", "notesTitle(Ljava/lang/String;)Ljava/lang/String; is not where its rule puts it", "hideNoteCounts");
        fixture(root, "notes-wrong-reactions", "communityReactionsText(Ljava/lang/String;I)Ljava/lang/String; doesn't take what its rule hands it", "hideNoteCounts");
        fixture(root, "notes-tab-not-blank", "hideNotesTabCounts()Z isn't asked first thing", "hideNoteCounts");
        String[] tabs = {"hideExploreTab", "hideNotificationsTab", "reorderTabs"};
        fixture(root, "tabs-good", "", tabs);
        fixture(root, "tabs-late-freeze", "arrangeTabs(Ljava/util/List;)V is not where its rule puts it", tabs);
        fixture(root, "tabs-wrong-view", "arrangeBar(Landroid/view/ViewGroup;)V doesn't take what its rule hands it", tabs);
        fixture(root, "theme-good", "", "darkBackground");
        fixture(root, "theme-wrong-activity", "onActivityTheme(Landroid/app/Activity;)V doesn't take what its rule hands it", "darkBackground");
        fixture(root, "theme-wrong-compose", "onComposeTheme(Landroid/content/res/Resources$Theme;)V doesn't take what its rule hands it", "darkBackground");
        fixture(root, "theme-design-wrong-register", "designPanel(J)J doesn't take a design gray and put its answer back where the gray was", "darkBackground");
        fixture(root, "theme-design-missing-read", "designPanel(J)J has 1 calls", "darkBackground");
        fixture(root, "theme-design-late", "designPage(J)J is not where its rule puts it", "darkBackground");
        fixture(root, "theme-design-other-palette", "misrouted call Lapp/hushtumblr/extension/tumblr/ui/DarkBackground;->designPage(J)J", "darkBackground");
        fixture(root, "theme-footer-wrong-register", "designFooter(J)J doesn't take the post footer's color and put its answer back where it was", "darkBackground");
        fixture(root, "theme-footer-missing", "designFooter(J)J has 0 calls", "darkBackground");
        fixture(root, "theme-page-wrong-register", "pageColor(I)I doesn't take the blog's color and put its answer back where it was", "darkBackground");
        fixture(root, "theme-page-missing", "pageColor(I)I has 0 calls", "darkBackground");
        fixture(root, "theme-title-wrong-register", "pageTextColor(I)I doesn't take the blog's color and put its answer back where it was", "darkBackground");
        fixture(root, "theme-title-missing", "pageTextColor(I)I has 0 calls", "darkBackground");
        fixture(root, "theme-link-wrong-register", "pageTextColor(I)I doesn't take the blog's color and put its answer back where it was", "darkBackground");
        fixture(root, "theme-link-missing", "pageTextColor(I)I has 0 calls", "darkBackground");
        fixture(root, "theme-tag-wrong-register", "hubColor(Ljava/lang/String;)Ljava/lang/String; doesn't take the tag page's color and put its answer back where it was", "darkBackground");
        fixture(root, "theme-tag-missing", "hubColor(Ljava/lang/String;)Ljava/lang/String; has 0 calls", "darkBackground");
        fixture(root, "theme-tag-adapter", "misrouted call Lapp/hushtumblr/extension/tumblr/ui/DarkBackground;->hubColor(Ljava/lang/String;)Ljava/lang/String;", "darkBackground");
        fixture(root, "store-good", "", "hideTumblrMart");
        fixture(root, "store-swapped-diamond", "hideDiamond(Landroid/view/View;Landroid/view/View;)Z isn't asked first thing", "hideTumblrMart");
        fixture(root, "store-missing-second-button", "hideTumblrMart(Landroid/view/View;)V has 1 calls", "hideTumblrMart");
        fixture(root, "store-wrong-button", "hideTumblrMart(Landroid/view/View;)V isn't handed the TumblrMart button", "hideTumblrMart");
        fixture(root, "store-late-room", "tumblrMartRoom(I)I is not where its rule puts it", "hideTumblrMart");
        fixture(root, "store-wrong-room", "tumblrMartRoom(I)I doesn't take what its rule hands it", "hideTumblrMart");
        Files.write(root.resolve("selector-cases.txt"), CASES, StandardCharsets.UTF_8);
    }
}
