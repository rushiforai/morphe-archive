import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.UnaryOperator;

/** Independent native roots, callbacks and local list replacements for the post mute selector. */
public final class RootMuteDexFixture {
    private static final String BASE = AccountDexFixture.BASE, OBJECT = AccountDexFixture.OBJECT, STRING = AccountDexFixture.STRING;
    private static final String LIST = "Ljava/util/List;", CONTEXT = "Landroid/content/Context;", TIMELINEABLE = "Lcom/tumblr/rumblr/model/Timelineable;";
    private static final String POST = "Lcom/tumblr/rumblr/model/post/Post;", ADAPTER = POST.substring(0, POST.length() - 1) + "JsonAdapter;";
    private static final String ROOT = BASE + "rootmute/RootPostMutes;", MENU = BASE + "rootmute/RootPostMenu;";
    private static final String ACTION = BASE + "rootmute/RootPostMuteAction;", ROOT_BRIDGE = BASE + "timeline/HushRootPost;";
    private static final String LOCAL_BRIDGE = BASE + "rootmute/HushLocalTimeline;", LOCAL = "Lcom/tumblr/ui/fragment/TimelineFragment;";
    private static final String MENU_HOST = BASE + "rootmute/HushRootMenuHost;", MENU_OWNER = "Lcom/tumblr/ui/fragment/TimelineFragment$a;";
    private static final String HEADER = "Lcom/tumblr/ui/widget/PostCardHeader;";
    private static final String ITEM = "Lcom/tumblr/rumblr/model/TimelineObject;", MODE = "Lxrl;", CALLBACK = "Lag9;", UNIT = "Lfnm;";
    private static final String BUILDER = "Lcom/tumblr/components/bottomsheet/b$b;", CONCRETE = "Lcom/tumblr/components/bottomsheet/b$a;";
    private static final String SHEET = "Lcom/tumblr/components/bottomsheet/b;", UTILS = "Lapp/hushtumblr/extension/shared/Utils;";
    private static final int PUBLIC = AccessFlags.PUBLIC.getValue(), STATIC = AccessFlags.STATIC.getValue();
    private static final List<String> CASES = new ArrayList<>();

    private static Instruction call(Opcode opcode, String owner, String name, String result, int[] registers, String... parameters) {
        return AccountDexFixture.call(opcode, owner, name, result, registers, parameters);
    }
    private static Instruction field(Opcode opcode, int value, int receiver, String owner, String name, String type) {
        return AccountDexFixture.field(opcode, value, receiver, owner, name, type);
    }
    private static Instruction staticField(int value, String owner, String name, String type) {
        return new ImmutableInstruction21c(Opcode.SGET_OBJECT, value, new ImmutableFieldReference(owner, name, type));
    }
    private static Instruction string(int register, String text) {
        return new ImmutableInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference(text));
    }
    private static Instruction type(Opcode opcode, int register, String type) { return AccountDexFixture.type(opcode, register, type); }
    private static Instruction result(int register) { return AccountDexFixture.result(register, true); }
    private static Instruction returns(int register) { return AccountDexFixture.returns(register, true); }
    private static Instruction end() { return AccountDexFixture.end(); }
    private static Instruction integer(int register, int value) { return AccountDexFixture.integer(register, value); }
    private static Instruction move(int destination, int source) { return new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, destination, source); }
    private static List<Instruction> code(Instruction... instructions) { return new ArrayList<>(List.of(instructions)); }
    private static Method method(String owner, String name, String result, int flags, int registers, List<Instruction> body, String... parameters) {
        return AccountDexFixture.method(owner, name, result, flags, registers, body, parameters);
    }
    private static ImmutableField member(String owner, String name, String type, int flags) {
        return new ImmutableField(owner, name, type, flags, null, Set.of(), Set.of());
    }
    private static ClassDef clazz(String owner, String parent, List<String> interfaces, List<? extends Field> fields, List<Method> methods) {
        return new ImmutableClassDef(owner, PUBLIC, parent, interfaces, null, Set.of(), fields, methods);
    }
    private static ClassDef clazz(String owner, List<String> interfaces, List<? extends Field> fields, List<Method> methods) {
        return clazz(owner, OBJECT, interfaces, fields, methods);
    }
    private static ClassDef contract(String owner, String[] names, String[] results, String[][] parameters) {
        return AccountDexFixture.contract(owner, names, results, parameters);
    }
    private static void edit(Map<String, ClassDef> classes, String owner, String name, UnaryOperator<List<Instruction>> change) {
        ClassDef original = classes.get(owner);
        List<Method> methods = new ArrayList<>();
        for (Method value : original.getMethods()) {
            if (!value.getName().equals(name)) { methods.add(value); continue; }
            List<Instruction> body = new ArrayList<>(); value.getImplementation().getInstructions().forEach(body::add);
            methods.add(new ImmutableMethod(value.getDefiningClass(), value.getName(), value.getParameters(), value.getReturnType(),
                    value.getAccessFlags(), value.getAnnotations(), value.getHiddenApiRestrictions(),
                    new ImmutableMethodImplementation(value.getImplementation().getRegisterCount(), change.apply(body),
                            value.getImplementation().getTryBlocks(), value.getImplementation().getDebugItems())));
        }
        classes.put(owner, new ImmutableClassDef(owner, original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                original.getSourceFile(), original.getAnnotations(), original.getFields(), methods));
    }
    private static int offset(List<Instruction> body, int from, int to) {
        int result = 0;
        for (int i = from; i < to; i++) result += body.get(i).getCodeUnits();
        return result;
    }

    private static void models(Map<String, ClassDef> classes, boolean patched, String fault) {
        List<Field> fields = new ArrayList<>(); List<Method> methods = new ArrayList<>();
        String[] names = {"K0", "G0", "z0", "B0"}, members = {"X", "parent", "a", "W1"};
        for (int i = 0; i < names.length; i++) {
            String result = i == 3 ? LIST : STRING;
            fields.add(member(POST, members[i], result, AccessFlags.PRIVATE.getValue() | AccessFlags.FINAL.getValue()));
            methods.add(method(POST, names[i], result, PUBLIC | AccessFlags.FINAL.getValue(), 1,
                    code(field(Opcode.IGET_OBJECT, 0, 0, POST, members[i], result), returns(0))));
        }
        if (patched) {
            List<Instruction> root = new ArrayList<>();
            for (int i = 0; i < names.length; i++) {
                root.add(call(Opcode.INVOKE_VIRTUAL, POST, fault.equals("wrong-current-getter") && i == 2 ? "G0" : names[i],
                        i == 3 ? LIST : STRING, new int[]{5})); root.add(result(i));
            }
            root.add(field(Opcode.IGET_BOOLEAN, 4, 5, POST, "hushRootTrailPresent", "Z"));
            root.add(call(Opcode.INVOKE_STATIC, ROOT, "canonicalRoot", STRING,
                    fault.equals("swapped-root-parent") ? new int[]{1, 0, 2, 3, 4} : new int[]{0, 1, 2, 3, 4}, STRING, STRING, STRING, LIST, "Z"));
            root.add(result(0)); root.add(returns(0));
            methods.add(method(POST, "hushRootId", STRING, PUBLIC, 6, root));
        }
        classes.put(POST, clazz(POST, patched ? List.of(TIMELINEABLE, ROOT_BRIDGE) : List.of(TIMELINEABLE), fields, methods));
        List<Instruction> writer = new ArrayList<>();
        String[] keys = {"reblogged_root_id", "reblogged_from_id", "id", "trail"};
        for (int i = 0; i < keys.length; i++) writer.addAll(code(string(0, keys[i]),
                call(Opcode.INVOKE_VIRTUAL, POST, names[i], i == 3 ? LIST : STRING, new int[]{3})));
        writer.add(end());
        classes.put(ADAPTER, clazz(ADAPTER, List.of(), List.of(), List.of(
                method(ADAPTER, "toJson", "V", PUBLIC, 4, writer, "Ldab;", OBJECT))));
        List<Instruction> constructor = code(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{7}), end());
        List<Method> wrapped = new ArrayList<>();
        if (patched) {
            constructor.addAll(1, code(new ImmutableInstruction3rc(fault.equals("wrapper-current-id") ? Opcode.INVOKE_VIRTUAL_RANGE : Opcode.INVOKE_INTERFACE_RANGE,
                            8, 1, AccountDexFixture.ref(fault.equals("wrapper-current-id") ? POST : ROOT_BRIDGE,
                            fault.equals("wrapper-current-id") ? "z0" : "hushRootId", STRING)), result(0),
                    field(Opcode.IPUT_OBJECT, 0, fault.equals("wrapper-wrong-receiver") ? 8 : 7, "Led1;", "hushCanonicalRoot", STRING)));
            wrapped.add(method("Led1;", "hushRootId", STRING, PUBLIC, 2,
                    code(field(Opcode.IGET_OBJECT, 0, 1, "Led1;", "hushCanonicalRoot", STRING), returns(0))));
        }
        wrapped.add(method("Led1;", "<init>", "V", PUBLIC | AccessFlags.CONSTRUCTOR.getValue(), 9, constructor, POST));
        classes.put("Led1;", clazz("Led1;", patched ? List.of(TIMELINEABLE, ROOT_BRIDGE) : List.of(TIMELINEABLE), patched
                ? List.of(member("Led1;", "hushCanonicalRoot", STRING, AccessFlags.PRIVATE.getValue() | AccessFlags.FINAL.getValue())) : List.of(), wrapped));
        classes.put(ITEM, clazz(ITEM, List.of(), List.of(), List.of(method(ITEM, "getData", TIMELINEABLE, PUBLIC, 2,
                code(integer(0, 0), returns(0))), method(ITEM, "getName", STRING, PUBLIC, 2, code(integer(0, 0), returns(0))))));
        classes.put("Liwj;", clazz("Liwj;", List.of(), List.of(), List.of(method("Liwj;", "l", TIMELINEABLE, PUBLIC, 2,
                code(integer(0, 0), returns(0))))));
        classes.put("Lyzf;", clazz("Lyzf;", "Liwj;", List.of(), List.of(), List.of()));
    }

    private static void local(Map<String, ClassDef> classes, boolean patched, String fault) {
        List<Instruction> body = AccountDexFixture.nops(60);
        body.set(51, call(Opcode.INVOKE_VIRTUAL, MODE, "g", "Z", new int[]{4})); body.set(52, AccountDexFixture.result(0, false));
        body.set(53, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 7));
        body.set(54, field(Opcode.IGET_OBJECT, 0, 3, LOCAL, "z", LIST));
        body.set(55, call(Opcode.INVOKE_INTERFACE, LIST, "clear", "V", new int[]{0}));
        body.set(56, field(Opcode.IGET_OBJECT, 0, 3, LOCAL, "z", LIST));
        body.set(57, call(Opcode.INVOKE_INTERFACE, LIST, "addAll", "Z", new int[]{0, 5}, "Ljava/util/Collection;"));
        body.set(58, call(Opcode.INVOKE_DIRECT, LOCAL, "a7", "V", new int[]{3, 4, 5}, MODE, LIST)); body.set(59, end());
        List<Instruction> render = AccountDexFixture.nops(46);
        render.set(0, call(Opcode.INVOKE_VIRTUAL, LOCAL, "h6", "V", new int[]{9}));
        render.set(1, move(5, 9)); render.set(2, move(6, 11)); render.set(3, move(7, 10)); render.set(4, move(8, 11));
        render.set(5, move(9, 11)); render.set(6, integer(10, 0)); render.set(7, integer(11, 0));
        render.set(8, new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 5, 7,
                AccountDexFixture.ref(LOCAL, "b7", "V", LIST, MODE, LIST, LIST, "I", "I"))); render.set(45, end());
        List<Method> methods = new ArrayList<>(List.of(method(LOCAL, "l6", "V", AccessFlags.PROTECTED.getValue(), 6, body, MODE, LIST),
                method(LOCAL, "a7", "V", AccessFlags.PRIVATE.getValue(), 12, render, MODE, LIST),
                method(LOCAL, "h6", "V", AccessFlags.PROTECTED.getValue(), 1, code(end())),
                method(LOCAL, "b7", "V", AccessFlags.PROTECTED.getValue(), 7, code(end()), LIST, MODE, LIST, LIST, "I", "I")));
        // Muting a root can empty a page, so this fragment carries the page delivery and its paging question too.
        methods.addAll(FeatureDexFixture.pagingMethods(patched ? "good" : "clean"));
        if (patched) {
            methods.add(method(LOCAL, "hushTimelineItems", LIST, PUBLIC, 3,
                    code(type(Opcode.NEW_INSTANCE, 0, "Ljava/util/ArrayList;"), field(Opcode.IGET_OBJECT, 1, 2, LOCAL,
                                    fault.equals("wrong-local-list") ? "other" : "z", LIST),
                            call(Opcode.INVOKE_DIRECT, "Ljava/util/ArrayList;", "<init>", "V", new int[]{0, 1}, "Ljava/util/Collection;"), returns(0))));
            methods.add(method(LOCAL, "hushApplyTimelineItems", "V", PUBLIC, 3,
                    code(staticField(0, MODE, fault.equals("append-local-rebind") ? "PAGINATION" : "FROM_CACHE", MODE),
                            call(Opcode.INVOKE_VIRTUAL, LOCAL, "l6", "V", new int[]{1, 0, 2}, MODE, LIST), end()), LIST));
        }
        classes.put(LOCAL, clazz(LOCAL, patched ? List.of(LOCAL_BRIDGE) : List.of(),
                List.of(member(LOCAL, "z", LIST, AccessFlags.PROTECTED.getValue()), member(LOCAL, "other", LIST, AccessFlags.PROTECTED.getValue())), methods));
        List<Instruction> init = new ArrayList<>();
        for (String value : List.of("FROM_CACHE", "PAGINATION")) init.addAll(code(type(Opcode.NEW_INSTANCE, 0, MODE), string(1, value),
                integer(2, value.equals("FROM_CACHE") ? 4 : 5), call(Opcode.INVOKE_DIRECT, MODE, "<init>", "V", new int[]{0, 1, 2}, STRING, "I"),
                new ImmutableInstruction21c(Opcode.SPUT_OBJECT, 0, new ImmutableFieldReference(MODE, value, MODE))));
        init.add(end());
        classes.put(MODE, clazz(MODE, List.of(), List.of(member(MODE, "FROM_CACHE", MODE, PUBLIC | STATIC | AccessFlags.FINAL.getValue()),
                member(MODE, "PAGINATION", MODE, PUBLIC | STATIC | AccessFlags.FINAL.getValue())), List.of(
                method(MODE, "<clinit>", "V", STATIC | AccessFlags.CONSTRUCTOR.getValue(), 3, init),
                method(MODE, "<init>", "V", AccessFlags.PRIVATE.getValue() | AccessFlags.CONSTRUCTOR.getValue(), 3,
                        code(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), end()), STRING, "I"),
                method(MODE, "g", "Z", PUBLIC, 2, code(staticField(0, MODE, "PAGINATION", MODE),
                        new ImmutableInstruction22t(Opcode.IF_NE, 1, 0, 4), integer(1, 1), AccountDexFixture.returns(1, false),
                        integer(1, 0), AccountDexFixture.returns(1, false))))));
    }

    private static void menus(Map<String, ClassDef> classes, boolean patched, String fault) {
        additionalMenus(classes, patched, fault);
        List<Instruction> menu = AccountDexFixture.nops(228);
        menu.set(0, move(0, 17)); menu.set(12, call(Opcode.INVOKE_VIRTUAL, "Landroidx/fragment/app/Fragment;", "requireContext", CONTEXT, new int[]{0}));
        menu.set(13, result(10)); menu.set(14, type(Opcode.NEW_INSTANCE, 11, CONCRETE));
        menu.set(15, call(Opcode.INVOKE_DIRECT, CONCRETE, "<init>", "V", new int[]{11, 10}, CONTEXT));
        menu.set(225, call(Opcode.INVOKE_VIRTUAL, BUILDER, "h", SHEET, new int[]{11})); menu.set(226, result(2)); menu.set(227, end());
        if (patched) menu.addAll(fault.equals("late-menu-hook") ? 227 : 225,
                code(move(0, fault.equals("wrong-menu-card") ? 25 : 24), move(1, 17),
                        call(Opcode.INVOKE_STATIC, MENU, "add", "V", new int[]{fault.equals("wrong-menu-builder") ? 10 : 11, 0, 10, 1}, OBJECT, OBJECT, CONTEXT, OBJECT)));
        classes.put("Lcgh;", clazz("Lcgh;", List.of(), List.of(), List.of(method("Lcgh;", "y", "V", PUBLIC | STATIC, 28, menu,
                "Lcom/tumblr/ui/fragment/c;", "Lcom/tumblr/rumblr/TumblrPostNotesService;", "Lcgh$a;", "Lggh;", STRING, STRING, STRING,
                "Lyzf;", "Lcwb;", "Lcom/tumblr/analytics/ScreenType;", "Lm02;"))));
        classes.put(BUILDER, clazz(BUILDER, List.of(), List.of(), List.of(
                method(BUILDER, "c", BUILDER, PUBLIC, 3, code(returns(0)), STRING, CALLBACK),
                method(BUILDER, "h", SHEET, PUBLIC, 2, code(integer(0, 0), returns(0))))));
        classes.put(CONCRETE, clazz(CONCRETE, BUILDER, List.of(), List.of(), List.of(method(CONCRETE, "<init>", "V",
                PUBLIC | AccessFlags.CONSTRUCTOR.getValue(), 2, code(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), end()), CONTEXT))));
        if (!patched) return;
        List<Instruction> card = code(new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 2, new ImmutableTypeReference("Lyzf;")),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1), type(Opcode.CHECK_CAST, 2, "Lyzf;"),
                call(Opcode.INVOKE_VIRTUAL, "Liwj;", "l", TIMELINEABLE, new int[]{2}), result(0), new ImmutableInstruction10t(Opcode.GOTO, 1),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 2, new ImmutableTypeReference(ITEM)),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1), type(Opcode.CHECK_CAST, 2, ITEM),
                call(Opcode.INVOKE_VIRTUAL, ITEM, fault.equals("wrong-card-payload") ? "getName" : "getData",
                        fault.equals("wrong-card-payload") ? STRING : TIMELINEABLE, new int[]{2}), result(0),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 1, 0, new ImmutableTypeReference(ROOT_BRIDGE)),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 1, 1), type(Opcode.CHECK_CAST, 0, ROOT_BRIDGE),
                call(Opcode.INVOKE_INTERFACE, ROOT_BRIDGE, "hushRootId", STRING, new int[]{0}), result(0), returns(0), integer(0, 0), returns(0));
        card.set(1, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, offset(card, 1, 6)));
        card.set(5, new ImmutableInstruction10t(Opcode.GOTO, offset(card, 5, 11)));
        card.set(7, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, offset(card, 7, 17)));
        card.set(12, new ImmutableInstruction21t(Opcode.IF_EQZ, 1, offset(card, 12, 17)));
        classes.put(MENU, clazz(MENU, List.of(), List.of(), List.of(
                method(MENU, "add", "V", PUBLIC | STATIC, 4, code(call(Opcode.INVOKE_STATIC, UTILS, "settingsReady", "Z", new int[]{}), end()), OBJECT, OBJECT, CONTEXT, OBJECT),
                method(MENU, "cardRoot", STRING, PUBLIC | STATIC, 3, card, OBJECT),
                method(MENU, "addNative", "V", PUBLIC | STATIC, 3,
                        code(type(Opcode.CHECK_CAST, 0, BUILDER), call(Opcode.INVOKE_VIRTUAL, BUILDER, "c", BUILDER,
                                new int[]{0, 1, 2}, STRING, CALLBACK), end()), OBJECT, STRING, ACTION),
                method(MENU, "unit", OBJECT, PUBLIC | STATIC, 1,
                        code(staticField(0, UNIT, fault.equals("wrong-callback-unit") ? "other" : "a", UNIT), returns(0))))));
        classes.put(ACTION, clazz(ACTION, fault.equals("missing-callback-interface") ? List.of("Ljava/lang/Runnable;") : List.of("Ljava/lang/Runnable;", CALLBACK),
                List.of(), List.of(method(ACTION, "run", "V", PUBLIC, 1,
                                code(call(Opcode.INVOKE_STATIC, UTILS, "settingsReady", "Z", new int[]{}), end())),
                        method(ACTION, "invoke", OBJECT, PUBLIC, 2, code(call(Opcode.INVOKE_VIRTUAL, ACTION, "run", "V", new int[]{1}),
                                call(Opcode.INVOKE_STATIC, MENU, "unit", OBJECT, new int[]{}), result(0), returns(0))))));
    }

    private static void additionalMenus(Map<String, ClassDef> classes, boolean patched, String fault) {
        List<Instruction> header = AccountDexFixture.nops(210);
        header.set(0, move(1, 20)); header.set(1, move(3, 22));
        header.set(5, call(Opcode.INVOKE_VIRTUAL, "Landroid/view/View;", "getContext", CONTEXT, new int[]{1}));
        header.set(6, result(5)); header.set(24, type(Opcode.NEW_INSTANCE, 11, CONCRETE));
        header.set(25, call(Opcode.INVOKE_DIRECT, CONCRETE, "<init>", "V", new int[]{11, 5}, CONTEXT));
        header.set(158, integer(8, 0)); header.set(159, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 2, 5));
        header.set(160, new ImmutableInstruction21t(Opcode.IF_EQZ, 8, 1)); header.set(161, move(5, 21));
        header.set(164, call(Opcode.INVOKE_VIRTUAL, BUILDER, "h", SHEET, new int[]{11}));
        header.set(165, result(14)); header.set(209, end());
        boolean headerHook = patched && !fault.equals("missing-redesigned-hook");
        if (headerHook) header.addAll(fault.equals("late-redesigned-hook") ? 166 : 164, code(
                move(0, fault.equals("wrong-redesigned-callback") ? 23 : 24),
                call(Opcode.INVOKE_STATIC, MENU, "add", "V", new int[]{11, fault.equals("wrong-redesigned-card") ? 1 : 3,
                        fault.equals("wrong-redesigned-context") ? 5 : 2, 0}, OBJECT, OBJECT, CONTEXT, OBJECT)));
        header.set(160, new ImmutableInstruction21t(Opcode.IF_EQZ, 8,
                offset(header, 160, headerHook && fault.equals("bypassed-redesigned-hook") ? 166 : 164)));
        classes.put(HEADER, clazz(HEADER, "Landroid/view/View;", List.of(), List.of(), List.of(method(HEADER, "H2", "V",
                AccessFlags.PRIVATE.getValue(), 29, header, "Llsm;", "Lyzf;", "Ldnl;", "Lxie;", "Llu2;", "Lfsl;", "Lcwb;", "Lm02;"))));

        List<Instruction> owned = AccountDexFixture.nops(321);
        owned.set(0, move(0, 20)); owned.set(1, move(2, 21));
        owned.set(68, type(Opcode.NEW_INSTANCE, 10, CONCRETE)); owned.set(69, field(Opcode.IGET_OBJECT, 12, 0, MENU_OWNER, "a", LOCAL));
        owned.set(70, call(Opcode.INVOKE_VIRTUAL, "Landroidx/fragment/app/Fragment;", "requireContext", CONTEXT, new int[]{12}));
        owned.set(71, result(12)); owned.set(72, call(Opcode.INVOKE_DIRECT, CONCRETE, "<init>", "V", new int[]{10, 12}, CONTEXT));
        owned.set(73, integer(8, 0)); owned.set(74, integer(3, 0)); owned.set(75, integer(1, 0));
        owned.set(153, integer(6, 0)); owned.set(154, new ImmutableInstruction21t(Opcode.IF_EQZ, 6, 1));
        owned.set(232, new ImmutableInstruction20t(Opcode.GOTO_16, 1)); owned.set(233, string(1, "timelineBottomSheet"));
        owned.set(234, new ImmutableInstruction21t(Opcode.IF_EQZ, 8, 1));
        owned.set(235, call(Opcode.INVOKE_VIRTUAL, BUILDER, "h", SHEET, new int[]{10})); owned.set(236, result(13)); owned.set(268, end());
        owned.set(269, call(Opcode.INVOKE_VIRTUAL, BUILDER, "h", SHEET, new int[]{10})); owned.set(270, result(2)); owned.set(275, end()); owned.set(320, end());
        boolean ownedHook = patched && !fault.equals("missing-owned-hook");
        if (ownedHook) owned.addAll(fault.equals("late-owned-hook") ? 235 : 233, code(
                field(Opcode.IGET_OBJECT, 1, 0, MENU_OWNER, fault.equals("wrong-owned-owner") ? "other" : "a", LOCAL),
                call(Opcode.INVOKE_VIRTUAL, "Landroidx/fragment/app/Fragment;", "requireContext", CONTEXT, new int[]{1}), result(1),
                call(Opcode.INVOKE_STATIC, MENU, "add", "V", new int[]{10, fault.equals("wrong-owned-card") ? 3 : 2,
                        fault.equals("wrong-owned-context") ? 12 : 1, fault.equals("wrong-owned-callback") ? 3 : 0}, OBJECT, OBJECT, CONTEXT, OBJECT)));
        int shifted = ownedHook ? 4 : 0, branch = fault.equals("late-owned-hook") ? 234 : 234 + shifted;
        owned.set(branch, new ImmutableInstruction21t(Opcode.IF_EQZ, 8, offset(owned, branch, 269 + shifted)));
        owned.set(154, new ImmutableInstruction21t(Opcode.IF_EQZ, 6, offset(owned, 154, 276 + shifted)));
        int commonTarget = ownedHook && fault.equals("bypassed-owned-hook") ? 233 + shifted : 233;
        if (patched && fault.equals("first-owned-finalizer-bypass")) commonTarget = 235 + shifted;
        if (patched && fault.equals("second-owned-finalizer-bypass")) commonTarget = 269 + shifted;
        owned.set(232, new ImmutableInstruction20t(Opcode.GOTO_16, offset(owned, 232, commonTarget)));
        List<Method> methods = new ArrayList<>(List.of(method(MENU_OWNER, "<init>", "V", AccessFlags.CONSTRUCTOR.getValue(), 2,
                code(field(Opcode.IPUT_OBJECT, patched && fault.equals("wrong-menu-owner-constructor") ? 0 : 1, 0, MENU_OWNER, "a", LOCAL),
                        call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), end()), LOCAL),
                method(MENU_OWNER, "a", "V", PUBLIC, 26, owned, "Lyzf;", "Z", "Z", "Z", STRING)));
        if (patched && !fault.equals("missing-menu-owner-getter")) methods.add(method(MENU_OWNER, "hushTimelineOwner", LOCAL_BRIDGE, PUBLIC, 2,
                code(field(Opcode.IGET_OBJECT, 0, 1, MENU_OWNER, fault.equals("wrong-menu-owner-field") ? "other" : "a", LOCAL), returns(0))));
        classes.put(MENU_OWNER, clazz(MENU_OWNER, patched && !fault.equals("missing-menu-owner-interface") ? List.of("Lxie;", MENU_HOST) : List.of("Lxie;"),
                List.of(member(MENU_OWNER, "a", LOCAL, patched && fault.equals("mutable-menu-owner") ? 0 : AccessFlags.FINAL.getValue()),
                        member(MENU_OWNER, "other", LOCAL, AccessFlags.FINAL.getValue())), methods));
        if (patched) classes.put(MENU_HOST, contract(MENU_HOST, new String[]{"hushTimelineOwner"}, new String[]{LOCAL_BRIDGE}, new String[][]{new String[0]}));
    }

    private static Map<String, ClassDef> classes(boolean patched, String fault) {
        Map<String, ClassDef> classes = new LinkedHashMap<>(FeatureDexFixture.baseClasses(patched));
        AccountDexFixture.add(classes, patched); FeatureDexFixture.addTimeline(classes, patched);
        models(classes, patched, fault); FeatureDexFixture.addPostJsonPresence(classes, patched, fault);
        local(classes, patched, fault); menus(classes, patched, fault);
        ClassDef callback = contract(CALLBACK, new String[]{"invoke"}, new String[]{OBJECT}, new String[][]{new String[0]});
        classes.put(CALLBACK, new ImmutableClassDef(CALLBACK, callback.getAccessFlags(), OBJECT, List.of("Lcg9;"), null, Set.of(), List.of(), callback.getMethods()));
        classes.put(UNIT, clazz(UNIT, List.of(), List.of(member(UNIT, "a", UNIT, PUBLIC | STATIC | AccessFlags.FINAL.getValue()),
                member(UNIT, "other", UNIT, PUBLIC | STATIC | AccessFlags.FINAL.getValue())), List.of()));
        if (!patched) return classes;
        classes.put(ROOT_BRIDGE, contract(ROOT_BRIDGE, new String[]{"hushRootId"}, new String[]{STRING}, new String[][]{new String[0]}));
        classes.put(LOCAL_BRIDGE, contract(LOCAL_BRIDGE, new String[]{"hushTimelineItems", "hushApplyTimelineItems"}, new String[]{LIST, "V"},
                new String[][]{new String[0], new String[]{LIST}}));
        ClassDef root = classes.get(ROOT); List<Method> hooks = new ArrayList<>(); root.getMethods().forEach(hooks::add);
        hooks.add(method(ROOT, "canonicalRoot", STRING, PUBLIC | STATIC, 6, code(integer(0, 0), returns(0)), STRING, STRING, STRING, LIST, "Z"));
        classes.put(ROOT, clazz(ROOT, List.of(), List.of(), hooks));
        if (fault.equals("wrong-account-uuid")) edit(classes, AccountDexFixture.USER, "hushAccountId", body -> {
            body.set(0, field(Opcode.IGET_OBJECT, 0, 1, AccountDexFixture.USER, "E", STRING)); return body;
        });
        if (fault.equals("missing-account-cleanup")) edit(classes, "Lvu5;", "accept", body -> {
            body.set(7, AccountDexFixture.hook("commitAccount")); return body;
        });
        return classes;
    }

    private static void write(Path root, String name, Map<String, ClassDef> classes) throws Exception {
        DexPool.writeTo(root.resolve(name + ".dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), classes.values()));
    }
    private static void fixture(Path root, String fault, String reason) throws Exception {
        FeatureDexFixture.reset(); FeatureDexFixture.enable("muteRootPosts");
        String name = "feature-root-mute-" + fault;
        write(root, name, classes(true, fault));
        Files.write(root.resolve(name + ".selected"), FeatureDexFixture.selected("muteRootPosts"), StandardCharsets.UTF_8);
        CASES.add(name + "|" + reason.isEmpty() + "|" + reason);
    }
    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[0]); Files.createDirectories(root);
        FeatureDexFixture.initialize(Path.of(args[1]));
        write(root, "root-mute-clean", classes(false, ""));
        fixture(root, "good", "");
        fixture(root, "wrong-account-uuid", "fresh account UUID bridge changed");
        fixture(root, "missing-account-cleanup", "account lifecycle cleanup changed");
        fixture(root, "wrong-current-getter", "root canonical bridge changed");
        fixture(root, "swapped-root-parent", "root canonical bridge changed");
        fixture(root, "wrong-trail-bit", "Post JSON presence proof changed");
        fixture(root, "wrong-trail-mask", "Post JSON presence proof changed");
        fixture(root, "wrong-first-mask", "Post JSON presence proof changed");
        fixture(root, "swapped-presence-masks", "Post JSON presence proof changed");
        fixture(root, "missing-error-return", "Post JSON presence proof changed");
        fixture(root, "wrapper-current-id", "root wrapper capture changed");
        fixture(root, "wrapper-wrong-receiver", "root wrapper capture changed");
        fixture(root, "wrong-menu-card", "root menu hook changed");
        fixture(root, "wrong-menu-builder", "root menu hook changed");
        fixture(root, "late-menu-hook", "root menu hook changed");
        fixture(root, "wrong-local-list", "root local timeline bridge changed");
        fixture(root, "append-local-rebind", "root local timeline bridge changed");
        fixture(root, "missing-callback-interface", "root callback bridge changed");
        fixture(root, "wrong-callback-unit", "root callback bridge changed");
        fixture(root, "wrong-card-payload", "root callback bridge changed");
        for (String fault : List.of("missing-menu-owner-interface", "missing-menu-owner-getter", "wrong-menu-owner-field", "mutable-menu-owner", "wrong-menu-owner-constructor"))
            fixture(root, fault, "root menu owner bridge changed");
        for (String fault : List.of("missing-redesigned-hook", "wrong-redesigned-card", "wrong-redesigned-context", "wrong-redesigned-callback", "late-redesigned-hook", "bypassed-redesigned-hook"))
            fixture(root, fault, "root redesigned menu hook changed");
        for (String fault : List.of("missing-owned-hook", "wrong-owned-card", "wrong-owned-context", "wrong-owned-callback", "wrong-owned-owner", "late-owned-hook", "bypassed-owned-hook",
                "first-owned-finalizer-bypass", "second-owned-finalizer-bypass"))
            fixture(root, fault, "root owned menu hook changed");
        Files.write(root.resolve("root-mute-cases.txt"), CASES, StandardCharsets.UTF_8);
    }
}
