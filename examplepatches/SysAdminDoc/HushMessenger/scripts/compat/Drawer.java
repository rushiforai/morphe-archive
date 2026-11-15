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

import static compat.CompatReport.*;
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

/** Open settings from menu: the legacy drawer checks. */
final class Drawer {

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

        /** 587's one-argument wrapper: const/4 v0, N, the (Object, I) null check on its parameter and v0, return-void. */
        void nullCheckWrapper(MethodReference call) {
            String id = call.toString();
            var wrappers = methods(type(call.getDefiningClass())).stream().filter(m -> hookId(m).equals(id)).toList();
            if (wrappers.size() != 1) throw changed("model null check is missing");
            var wrapper = wrappers.get(0);
            var body = code(wrapper);
            var inner = body.size() == 3 && reference(body.get(1)) instanceof MethodReference m ? m : null;
            if (!is(AccessFlags.PUBLIC, wrapper.getAccessFlags()) || !is(AccessFlags.STATIC, wrapper.getAccessFlags()) ||
                !wrapper.getImplementation().getTryBlocks().isEmpty() || wrapper.getImplementation().getRegisterCount() != 2 ||
                inner == null || body.get(0).getOpcode() != Opcode.CONST_4 || register(body.get(0)) != 0 ||
                body.get(1).getOpcode() != Opcode.INVOKE_STATIC || !callArgs(body.get(1)).equals(List.of(1, 0)) ||
                !"V".equals(inner.getReturnType()) || !params(inner).equals(List.of("Ljava/lang/Object;", "I")) ||
                body.get(2).getOpcode() != Opcode.RETURN_VOID)
                throw changed("model null check changed");
            nullCheck(inner);
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
                    boolean wrapped = params(call).equals(List.of("Ljava/lang/Object;"));
                    if (!"V".equals(call.getReturnType()) || (!wrapped && !params(call).equals(List.of("Ljava/lang/Object;", "I"))) ||
                        arguments.size() != (wrapped ? 1 : 2) || !checked.contains(arguments.get(0) - receiver - 1))
                        throw changed("model constructor " + owner + " checks unsupported parameters");
                    if (wrapped) nullCheckWrapper(call); else nullCheck(call);
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
}
