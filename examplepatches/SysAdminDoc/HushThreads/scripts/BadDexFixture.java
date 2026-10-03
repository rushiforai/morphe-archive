import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.AnnotationVisibility;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.HiddenApiRestriction;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedMethodImplementation;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Annotation;
import com.android.tools.smali.dexlib2.iface.MethodParameter;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation;
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableArrayEncodedValue;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableArrayPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22b;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSparseSwitchPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.Adler32;

/**
 * Writes the dex files scripts/test-injected-registers.ps1 holds DexDiff.java to: a clean host,
 * a patched build of it that passes every check, and one build per check that breaks exactly that
 * check and nothing else. javac and d8 can only write valid code, so these are built instruction
 * by instruction.
 *
 * <p>The host is a neutral stand-in for the app's own classes. {@code addItem} is a method a patch
 * guards with a call to the bundle's {@code Filter.hide}, and the host's other methods are the
 * shapes the structural checks read: a static method taking an object and a long, a packed switch
 * and a try block. Beside it sits a shortcut publisher making each of the five ShortcutManager
 * calls the settings patch sends to {@code SettingsEntry}, under the names the contract file's
 * no-call rules hold the real APK to, and in the patched builds the extension's
 * {@code SettingsEntry}, whose stand-ins make the real calls.
 *
 *   java -cp &lt;cli jar&gt; BadDexFixture.java &lt;outDir&gt;
 */
public class BadDexFixture {

    private static final String HOST = "Lfixture/Host;";
    private static final String FILTER = "Lapp/morphe/extension/hushthreads/fixture/Filter;";
    private static final String OBJECT = "Ljava/lang/Object;";

    private static final ImmutableMethodReference HIDE =
            method(FILTER, "hide", "Z", OBJECT, OBJECT);
    private static final ImmutableMethodReference INSPECT =
            method(FILTER, "inspect", "V", OBJECT, OBJECT);
    private static final ImmutableMethodReference WIDE = method(FILTER, "wide", "V", "J");
    private static final ImmutableMethodReference RISKY = method(HOST, "risky", "I");

    /** An extension class of the bundle's own, for an added method that writes past its registers. */
    private static final String PACK = "Lapp/morphe/extension/hushthreads/fixture/Pack;";

    private static final String SHORTCUT_MANAGER = "Landroid/content/pm/ShortcutManager;";
    private static final String SHORTCUT_INFO = "Landroid/content/pm/ShortcutInfo;";
    private static final String SHORTCUT_LIST = "Ljava/util/List;";
    private static final String SHORTCUTS = "Lfixture/Shortcuts;";
    private static final String SETTINGS_ENTRY = "Lapp/morphe/extension/hushthreads/settings/SettingsEntry;";

    /**
     * One of the ShortcutManager calls the settings patch sends to SettingsEntry: its name, what it
     * takes after the manager and what it answers, the publisher method that makes it and whether
     * that method makes it as a range call. Its bad build is "bad-shortcut-[caseName]-left".
     */
    private static final class ShortcutCall {
        final String name;
        final String takes;
        final String answers;
        final String caller;
        final String caseName;
        final boolean range;

        ShortcutCall(String name, String takes, String answers, String caller, String caseName, boolean range) {
            this.name = name;
            this.takes = takes;
            this.answers = answers;
            this.caller = caller;
            this.caseName = caseName;
            this.range = range;
        }

        /** The manager, then what the call takes. */
        String[] parameters() {
            return takes == null ? new String[]{SHORTCUT_MANAGER} : new String[]{SHORTCUT_MANAGER, takes};
        }

        ImmutableMethodReference framework() {
            return takes == null ? method(SHORTCUT_MANAGER, name, answers) : method(SHORTCUT_MANAGER, name, answers, takes);
        }

        /** The stand-in: static, of the same name, the manager first, the same answer. */
        ImmutableMethodReference standIn() {
            return method(SETTINGS_ENTRY, name, answers, parameters());
        }
    }

    /** All five, as the contract file names them. The update goes as a range call. */
    private static final List<ShortcutCall> SHORTCUT_CALLS = Arrays.asList(
            new ShortcutCall("pushDynamicShortcut", SHORTCUT_INFO, "V", "push", "push", false),
            new ShortcutCall("addDynamicShortcuts", SHORTCUT_LIST, "Z", "add", "add", false),
            new ShortcutCall("setDynamicShortcuts", SHORTCUT_LIST, "Z", "set", "set", false),
            new ShortcutCall("updateShortcuts", SHORTCUT_LIST, "Z", "update", "update", true),
            new ShortcutCall("removeAllDynamicShortcuts", null, "V", "removeAll", "remove-all", false));

    private static final ImmutableTypeReference STRING_TYPE = new ImmutableTypeReference("Ljava/lang/String;");
    private static final ImmutableTypeReference INT_ARRAY = new ImmutableTypeReference("[I");
    private static final ImmutableTypeReference OBJECT_ARRAY = new ImmutableTypeReference("[Ljava/lang/Object;");

    private static ImmutableMethodReference method(String owner, String name, String returns, String... parameters) {
        return new ImmutableMethodReference(owner, name, Arrays.asList(parameters), returns);
    }

    private static Instruction op(Opcode opcode) {
        return new ImmutableInstruction10x(opcode);
    }

    private static Instruction op(Opcode opcode, int register) {
        return new ImmutableInstruction11x(opcode, register);
    }

    private static Instruction invoke(ImmutableMethodReference callee, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.INVOKE_STATIC, registers.length, r[0], r[1], r[2], r[3], r[4], callee);
    }

    private static Instruction ifEqz(int register, int offset) {
        return new ImmutableInstruction21t(Opcode.IF_EQZ, register, offset);
    }

    private static Instruction filledNewArray(ImmutableTypeReference type, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.FILLED_NEW_ARRAY, registers.length, r[0], r[1], r[2], r[3], r[4], type);
    }

    /** A fill-array-data payload of one int. */
    private static Instruction oneInt() {
        return new ImmutableArrayPayload(4, Collections.<Number>singletonList(1));
    }

    private static ImmutableMethodImplementation body(int registers, Instruction... instructions) {
        return new ImmutableMethodImplementation(registers, Arrays.asList(instructions), null, null);
    }

    private static ImmutableMethodImplementation body(int registers, List<ImmutableTryBlock> tries, Instruction... instructions) {
        return new ImmutableMethodImplementation(registers, Arrays.asList(instructions), tries, null);
    }

    private static ImmutableTryBlock tryBlock(int start, int units, int handler) {
        return new ImmutableTryBlock(start, units,
                Collections.singletonList(new ImmutableExceptionHandler("Ljava/lang/Exception;", handler)));
    }

    private static Method define(String owner, String name, String returns, boolean isStatic,
            ImmutableMethodImplementation implementation, String... parameters) {
        List<ImmutableMethodParameter> list = new ArrayList<>();
        for (String p : parameters) list.add(new ImmutableMethodParameter(p, null, null));
        int flags = AccessFlags.PUBLIC.getValue() | (isStatic ? AccessFlags.STATIC.getValue() : 0);
        return new ImmutableMethod(owner, name, list, returns, flags, null, null, implementation);
    }

    private static Method neverInline(Method method) {
        return new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(), method.getReturnType(), method.getAccessFlags(),
                Set.of(new ImmutableAnnotation(AnnotationVisibility.BUILD, "Lcom/facebook/redex/annotations/NeverInline;", List.of())),
                method.getHiddenApiRestrictions(), method.getImplementation());
    }

    // The host's methods, clean.

    /** Where the patch's guard goes. Instance method: v0 this, v1 and v2 the arguments. */
    private static Method addItem(ImmutableMethodImplementation implementation) {
        return define(HOST, "addItem", "V", false, implementation, OBJECT, OBJECT);
    }

    private static final ImmutableMethodImplementation CLEAN_ADD_ITEM = body(3, op(Opcode.RETURN_VOID));

    /** Static, an object then a long: v0 the object, v1 and v2 the long. */
    private static Method staticHost(ImmutableMethodImplementation implementation) {
        return define(HOST, "staticHost", "V", true, implementation, OBJECT, "J");
    }

    private static final ImmutableMethodImplementation CLEAN_STATIC_HOST = body(3, op(Opcode.RETURN_VOID));

    /** A packed switch over the argument, v1. Case 0 lands at 5 and case 1 at 7. */
    private static Method switchHost(int caseOneOffset) {
        return switchHost(caseOneOffset, op(Opcode.RETURN, 0));
    }

    /** The same, with [atFour] as the one-unit instruction that ends the no-case path at 4. */
    private static Method switchHost(int caseOneOffset, Instruction atFour) {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 10), // 0
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),        // 3
                atFour,                                                    // 4
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 5
                op(Opcode.RETURN, 0),                                      // 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 2),        // 7
                op(Opcode.RETURN, 0),                                      // 8
                op(Opcode.NOP),                                            // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Arrays.asList(            // 10
                        new ImmutableSwitchElement(0, 5),
                        new ImmutableSwitchElement(1, caseOneOffset)))), "I");
    }

    /** risky() inside a try whose handler is a move-exception at 5. */
    private static Method tryHost(ImmutableTryBlock block) {
        return tryHost(block, op(Opcode.RETURN_VOID));
    }

    /** The same, with [beforeHandler] as the one-unit instruction that ends the try path at 4. */
    private static Method tryHost(ImmutableTryBlock block, Instruction beforeHandler) {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(block),
                invoke(RISKY),                      // 0
                op(Opcode.MOVE_RESULT, 0),          // 3
                beforeHandler,                      // 4
                op(Opcode.MOVE_EXCEPTION, 0),       // 5
                op(Opcode.RETURN_VOID)));           // 6
    }

    private static final ImmutableTryBlock CLEAN_TRY = tryBlock(0, 3, 5);

    /** switchHost with case 1 sent to the move-result of an invoke on the no-case path. */
    private static Method switchToResult() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 10), // 0
                invoke(RISKY),                                             // 3
                op(Opcode.MOVE_RESULT, 0),                                 // 6
                op(Opcode.RETURN, 0),                                      // 7
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 8
                op(Opcode.RETURN, 0),                                      // 9
                new ImmutablePackedSwitchPayload(Arrays.asList(            // 10
                        new ImmutableSwitchElement(0, 8),
                        new ImmutableSwitchElement(1, 6)))), "I");
    }

    /** tryHost whose handler is the packed-switch payload at 10 instead of a move-exception. */
    private static Method tryHandlerAtPayload() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(0, 3, 10)),
                invoke(RISKY),                                             // 0
                op(Opcode.MOVE_RESULT, 0),                                 // 3
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 6),  // 4 -> 10
                op(Opcode.RETURN_VOID),                                    // 7
                op(Opcode.RETURN_VOID),                                    // 8, case 0
                op(Opcode.NOP),                                            // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Collections.singletonList( // 10
                        new ImmutableSwitchElement(0, 4)))));
    }

    /**
     * switchHost filling an int array, whose fill-array-data payload sits at 10, with case 0 sent
     * to that payload instead of an instruction.
     */
    private static Method switchToArrayPayload() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 16),         // 0 -> 16
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 1, INT_ARRAY),    // 3
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),         // 5 -> 10
                op(Opcode.RETURN, 1),                                              // 8
                op(Opcode.NOP),                                                    // 9, aligns the payloads
                oneInt(),                                                          // 10
                new ImmutablePackedSwitchPayload(Collections.singletonList(        // 16
                        new ImmutableSwitchElement(0, 10)))), "I");
    }

    /** switchHost as a sparse switch, its one case sent to its own payload at 4. */
    private static Method sparseSwitchToOwnPayload() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.SPARSE_SWITCH, 1, 4),           // 0 -> 4
                op(Opcode.RETURN, 1),                                              // 3
                new ImmutableSparseSwitchPayload(Collections.singletonList(        // 4
                        new ImmutableSwitchElement(7, 4)))), "I");
    }

    /**
     * switchHost with [switchOpcode] pointed at [payload], a table of the other kind whose cases
     * both land where switchHost's do.
     */
    private static Method switchWithTable(Opcode switchOpcode, Instruction payload) {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(switchOpcode, 1, 10),         // 0 -> 10
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),        // 3
                op(Opcode.RETURN, 0),                                      // 4
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 5
                op(Opcode.RETURN, 0),                                      // 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 2),        // 7
                op(Opcode.RETURN, 0),                                      // 8
                op(Opcode.NOP),                                            // 9, aligns the payload
                payload), "I");                                            // 10
    }

    private static List<ImmutableSwitchElement> twoCases() {
        return Arrays.asList(new ImmutableSwitchElement(0, 5), new ImmutableSwitchElement(1, 7));
    }

    /** tryHost filling an int array, with the handler at its fill-array-data payload at 10. */
    private static Method tryHandlerAtArrayPayload() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(0, 3, 10)),
                invoke(RISKY),                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                         // 3
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 0, INT_ARRAY),    // 4
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 4),         // 6 -> 10
                op(Opcode.RETURN_VOID),                                            // 9
                oneInt()));                                                        // 10
    }

    /** tryHost with its handler moved to the top: the move-exception is the method's first instruction. */
    private static Method moveExceptionAtEntry() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(1, 3, 0)),
                op(Opcode.MOVE_EXCEPTION, 0),                              // 0
                invoke(RISKY),                                             // 1
                op(Opcode.MOVE_RESULT, 0),                                 // 4
                op(Opcode.RETURN_VOID)));                                  // 5
    }

    private static Method risky() {
        return define(HOST, "risky", "I", true, body(1,
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)));
    }

    private static Method removable() {
        return define(HOST, "removable", "V", true, body(0, op(Opcode.RETURN_VOID)));
    }

    // The patched shapes.

    /** The guard as the bundle writes it: v0 free, v1 this, v2 and v3 the arguments. */
    private static final ImmutableMethodImplementation GUARDED_ADD_ITEM = body(4,
            invoke(HIDE, 2, 3),        // 0
            op(Opcode.MOVE_RESULT, 0), // 3
            ifEqz(0, 3),               // 4 -> 7
            op(Opcode.RETURN_VOID),    // 6
            op(Opcode.RETURN_VOID));   // 7

    /** The object twice, then the long as a pair: every register the kind the callee takes. */
    private static final ImmutableMethodImplementation GOOD_STATIC_HOST = body(3,
            invoke(INSPECT, 0, 0),
            invoke(WIDE, 1, 2),
            op(Opcode.RETURN_VOID));

    /** A static long, where Compose-style code keeps a packed colour. */
    private static List<ImmutableField> packedField(String owner) {
        return Collections.singletonList(new ImmutableField(owner, "packed", "J",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, null));
    }

    /**
     * A colour packed as Compose packs one: the int widened to a long, shifted up 32, stored.
     * On the Facebook sibling's 580 the colour came in as a const-wide/32 and its AMOLED sweep left
     * a narrow const.
     */
    private static Instruction[] packColor(Opcode constant, String owner) {
        return new Instruction[]{
                new ImmutableInstruction31i(constant, 0, BLACK),
                new ImmutableInstruction21s(Opcode.CONST_16, 2, 32),
                new ImmutableInstruction12x(Opcode.SHL_LONG_2ADDR, 0, 2),
                new ImmutableInstruction21c(Opcode.SPUT_WIDE, 0, new ImmutableFieldReference(owner, "packed", "J")),
                op(Opcode.RETURN_VOID)};
    }

    private static ClassDef host(Method addItem, Method staticHost, Method switchHost, Method tryHost, boolean keepRemovable) {
        List<Method> methods = new ArrayList<>(Arrays.asList(addItem, staticHost, switchHost, tryHost, risky()));
        if (keepRemovable) methods.add(removable());
        return new ImmutableClassDef(HOST, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, packedField(HOST), methods);
    }

    /** [classes] with [extra] added to the host's class, the way a patch adds a helper to one of the app's. */
    private static List<ClassDef> withHostMethod(List<ClassDef> classes, Method extra) {
        List<ClassDef> out = new ArrayList<>();
        for (ClassDef cd : classes) {
            if (!cd.getType().equals(HOST)) {
                out.add(cd);
                continue;
            }
            List<Method> methods = new ArrayList<>();
            for (Method m : cd.getMethods()) methods.add(m);
            methods.add(extra);
            out.add(new ImmutableClassDef(HOST, cd.getAccessFlags(), cd.getSuperclass(), null, null, null, packedField(HOST), methods));
        }
        return out;
    }

    /**
     * [call] made on a method's parameters, the manager first: the framework's virtual call, or,
     * when [sent], the stand-in's static one, as the settings patch writes it. A method that
     * answers keeps its answer in v0, so its parameters start at v1.
     */
    private static Instruction shortcutInvoke(ShortcutCall call, boolean sent) {
        int first = call.answers.equals("V") ? 0 : 1;
        int count = call.parameters().length;
        ImmutableMethodReference callee = sent ? call.standIn() : call.framework();
        if (call.range) {
            return new ImmutableInstruction3rc(sent ? Opcode.INVOKE_STATIC_RANGE : Opcode.INVOKE_VIRTUAL_RANGE,
                    first, count, callee);
        }
        int[] r = new int[5];
        for (int i = 0; i < count; i++) r[i] = first + i;
        return new ImmutableInstruction35c(sent ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL, count,
                r[0], r[1], r[2], r[3], r[4], callee);
    }

    /** A static method of [owner] taking what [call] takes, the manager first: [invoke], then its answer returned. */
    private static Method shortcutMethod(String owner, String name, ShortcutCall call, Instruction invoke) {
        boolean answers = !call.answers.equals("V");
        List<Instruction> instructions = new ArrayList<>();
        instructions.add(invoke);
        if (answers) {
            instructions.add(op(Opcode.MOVE_RESULT, 0));
            instructions.add(op(Opcode.RETURN, 0));
        } else {
            instructions.add(op(Opcode.RETURN_VOID));
        }
        int registers = call.parameters().length + (answers ? 1 : 0);
        return define(owner, name, call.answers, true,
                new ImmutableMethodImplementation(registers, instructions, null, null), call.parameters());
    }

    /**
     * The app's shortcut publisher, a static method for each call the settings patch sends to the
     * extension's stand-in. The calls named in [left] are made as the app makes them, the rest go
     * to the stand-ins.
     */
    private static ClassDef shortcuts(Set<String> left) {
        List<Method> methods = new ArrayList<>();
        for (ShortcutCall call : SHORTCUT_CALLS) {
            methods.add(shortcutMethod(SHORTCUTS, call.caller, call, shortcutInvoke(call, !left.contains(call.name))));
        }
        return new ImmutableClassDef(SHORTCUTS, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null, methods);
    }

    /** Every call of [SHORTCUT_CALLS] by name, which the clean build makes as the app does. */
    private static Set<String> allShortcutCalls() {
        Set<String> names = new LinkedHashSet<>();
        for (ShortcutCall call : SHORTCUT_CALLS) names.add(call.name);
        return names;
    }

    /** The extension's stand-ins, each making the real call. The no-call rule lets its package make them. */
    private static ClassDef settingsEntry() {
        List<Method> methods = new ArrayList<>();
        for (ShortcutCall call : SHORTCUT_CALLS) {
            methods.add(shortcutMethod(SETTINGS_ENTRY, call.name, call, shortcutInvoke(call, false)));
        }
        return new ImmutableClassDef(SETTINGS_ENTRY, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, methods);
    }

    private static ClassDef cleanHost() {
        return host(addItem(CLEAN_ADD_ITEM), staticHost(CLEAN_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY), true);
    }

    /** Opaque black as a colour int, the value the Facebook sibling's AMOLED sweep wrote. */
    private static final int BLACK = -0x1000000;

    private static final ImmutableMethodReference REUSE = method(FILTER, "reuse", "V", "I");

    /**
     * The bundle's side. reuse(I) passes its int argument's register as an object only after a
     * path through a const-string wrote an object into it, and that write sits after the use in
     * the file: a check that walked the body top to bottom instead of along its branches would
     * call a valid method wrong. nulls, longs and ints are the valid widths: a zero constant
     * passed as an object, a const-wide/32 passed as a long, a const passed as an int. joins and
     * caught are where paths meet the way ART allows: a zero that is an object on one arm and a
     * zero that is an int on the other, a conflict that is only copied, and a handler that reads
     * what its register held before the instruction that threw. reads gives each instruction the
     * conflict builds fail a value of the kind ART takes there, so a read made stricter fails too,
     * and zeros tests a zero for equality with an object and with an int, which ART allows.
     */
    private static ClassDef filter() {
        List<Method> methods = Arrays.asList(
                define(FILTER, "hide", "Z", true, body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), OBJECT, OBJECT),
                define(FILTER, "inspect", "V", true, body(2, op(Opcode.RETURN_VOID)), OBJECT, OBJECT),
                define(FILTER, "wide", "V", true, body(2, op(Opcode.RETURN_VOID)), "J"),
                define(FILTER, "reuse", "V", true, body(1,
                        new ImmutableInstruction10t(Opcode.GOTO, 5),                            // 0 -> 5
                        invoke(INSPECT, 0, 0),                                                   // 1
                        op(Opcode.RETURN_VOID),                                                  // 4
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("item")), // 5
                        new ImmutableInstruction10t(Opcode.GOTO, -6)), "I"),                    // 7 -> 1
                define(FILTER, "nulls", "V", true, body(1,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), invoke(INSPECT, 0, 0), op(Opcode.RETURN_VOID))),
                // The pair is broken after its last read, which is valid: only a read of it isn't.
                define(FILTER, "longs", "V", true, body(2,
                        new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), invoke(WIDE, 0, 1),
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), invoke(REUSE, 1),
                        op(Opcode.RETURN_VOID))),
                define(FILTER, "ints", "V", true, body(1,
                        new ImmutableInstruction31i(Opcode.CONST, 0, BLACK), invoke(REUSE, 0), op(Opcode.RETURN_VOID))),
                define(FILTER, "packs", "V", true, body(3, packColor(Opcode.CONST_WIDE_32, FILTER))),
                // v0 is null on one arm and the object on the other, v1 zero or one: each is still
                // its kind where the arms meet. v2 is an object on one arm and an int on the
                // other, which only a use of it would fail. A move-object and a plain move only
                // copy it, and v3 is written again before anything reads the copy.
                define(FILTER, "joins", "V", true, body(5,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                      // 0
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),                      // 1
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 2, new ImmutableStringReference("item")), // 2
                        ifEqz(4, 5),                                                             // 4 -> 9
                        new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 4),                  // 6
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                      // 7
                        new ImmutableInstruction11n(Opcode.CONST_4, 2, 1),                      // 8
                        invoke(INSPECT, 0, 0),                                                   // 9
                        invoke(REUSE, 1),                                                        // 12
                        new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 2),                  // 15
                        new ImmutableInstruction12x(Opcode.MOVE, 3, 2),                         // 16
                        new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),                      // 17
                        op(Opcode.RETURN_VOID)), OBJECT),                                        // 18
                // The const-string can throw, and its handler reads v0 as the int it held before
                // the const-string wrote an object there, which is all ART's handler sees.
                define(FILTER, "caught", "V", true, body(2, Collections.singletonList(tryBlock(1, 2, 7)),
                        new ImmutableInstruction12x(Opcode.MOVE, 0, 1),                         // 0
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("item")), // 1
                        invoke(INSPECT, 0, 0),                                                   // 3
                        op(Opcode.RETURN_VOID),                                                  // 6
                        op(Opcode.MOVE_EXCEPTION, 1),                                            // 7
                        invoke(REUSE, 0),                                                        // 8
                        op(Opcode.RETURN_VOID)), "I"),                                           // 11
                // v4 the object, v5 the int: objects and ints tested for equality, an int ordered,
                // tested against zero and switched on, an object locked, cast and tested, an int
                // as a new array's size, the array measured and filled, ints and an object as a
                // new array's elements, and a null thrown.
                define(FILTER, "reads", "V", true, body(6,
                        new ImmutableInstruction22t(Opcode.IF_EQ, 4, 4, 3),                      // 0 -> 3
                        op(Opcode.NOP),                                                          // 2
                        new ImmutableInstruction22t(Opcode.IF_NE, 5, 5, 3),                      // 3 -> 6
                        op(Opcode.NOP),                                                          // 5
                        new ImmutableInstruction22t(Opcode.IF_LT, 5, 5, 3),                      // 6 -> 9
                        op(Opcode.NOP),                                                          // 8
                        new ImmutableInstruction21t(Opcode.IF_NEZ, 5, 3),                        // 9 -> 12
                        op(Opcode.NOP),                                                          // 11
                        new ImmutableInstruction21t(Opcode.IF_GEZ, 5, 3),                        // 12 -> 15
                        op(Opcode.NOP),                                                          // 14
                        op(Opcode.MONITOR_ENTER, 4),                                             // 15
                        op(Opcode.MONITOR_EXIT, 4),                                              // 16
                        new ImmutableInstruction21c(Opcode.CHECK_CAST, 4, STRING_TYPE),          // 17
                        new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 4, STRING_TYPE),      // 19
                        new ImmutableInstruction22c(Opcode.NEW_ARRAY, 1, 5, INT_ARRAY),          // 21
                        new ImmutableInstruction12x(Opcode.ARRAY_LENGTH, 2, 1),                  // 23
                        new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 1, 14),              // 24 -> 38
                        filledNewArray(INT_ARRAY, 5, 0),                                         // 27
                        filledNewArray(OBJECT_ARRAY, 4),                                         // 30
                        new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 5, 11),                // 33 -> 44
                        new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),                       // 36
                        op(Opcode.THROW, 3),                                                     // 37
                        oneInt(),                                                                // 38
                        new ImmutablePackedSwitchPayload(Collections.singletonList(              // 44
                                new ImmutableSwitchElement(0, 3)))), OBJECT, "I"),
                // A zero tested for equality with the object v1 and with the int v2, each from
                // either side. A zero stands for either, so none of these pairs is the mismatch
                // an int and an object are.
                define(FILTER, "zeros", "V", true, body(3,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                       // 0
                        new ImmutableInstruction22t(Opcode.IF_EQ, 0, 1, 3),                      // 1 -> 4
                        op(Opcode.NOP),                                                          // 3
                        new ImmutableInstruction22t(Opcode.IF_NE, 1, 0, 3),                      // 4 -> 7
                        op(Opcode.NOP),                                                          // 6
                        new ImmutableInstruction22t(Opcode.IF_EQ, 0, 2, 3),                      // 7 -> 10
                        op(Opcode.NOP),                                                          // 9
                        new ImmutableInstruction22t(Opcode.IF_NE, 2, 0, 3),                      // 10 -> 13
                        op(Opcode.NOP),                                                          // 12
                        op(Opcode.RETURN_VOID)), OBJECT, "I"));                                  // 13
        return new ImmutableClassDef(FILTER, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, packedField(FILTER), methods);
    }

    private static ClassDef secondary() {
        return new ImmutableClassDef("Lfixture/Secondary;", AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Collections.singletonList(define("Lfixture/Secondary;", "kept", "V", true, body(0, op(Opcode.RETURN_VOID)))));
    }

    private static List<ClassDef> patched(Method addItem, Method staticHost, Method switchHost, Method tryHost) {
        return bundle(host(addItem, staticHost, switchHost, tryHost, true));
    }

    /** A patched build: [host] and the bundle's own classes, every shortcut call sent to its stand-in. */
    private static List<ClassDef> bundle(ClassDef host) {
        return Arrays.asList(host, filter(), shortcuts(Collections.<String>emptySet()), settingsEntry());
    }

    /** The clean build, the app's classes as they ship: [host] and every shortcut call made as the app makes it. */
    private static List<ClassDef> clean(ClassDef host) {
        return Arrays.asList(host, shortcuts(allShortcutCalls()));
    }

    private static List<ClassDef> good() {
        return patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withStaticHost(ImmutableMethodImplementation implementation) {
        return patched(addItem(GUARDED_ADD_ITEM), staticHost(implementation), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withAddItem(ImmutableMethodImplementation implementation) {
        return patched(addItem(implementation), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withTry(ImmutableTryBlock block) {
        return withTryHost(tryHost(block));
    }

    private static List<ClassDef> withTryHost(Method tryHost) {
        return patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost);
    }

    /**
     * staticHost with v0 an object on one arm of a branch and an int on the other, which ART merges
     * into a conflict where the arms meet at 5, and [then] from there. v1 and v2 are free, v3 is
     * the object argument, and the long sits in v4 and v5.
     */
    private static List<ClassDef> conflictThen(Instruction... then) {
        List<Instruction> instructions = new ArrayList<>(Arrays.asList(
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("item")), // 0
                ifEqz(3, 3),                                                                              // 2 -> 5
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1)));                                      // 4
        instructions.addAll(Arrays.asList(then));
        return withStaticHost(new ImmutableMethodImplementation(6, instructions, null, null));
    }

    private static final String FEATURE_STATUS = "Lapp/morphe/extension/hushthreads/settings/SettingsStatus;";
    private static final String FEATURE_ADS = "Lapp/morphe/extension/hushthreads/ads/FeedAds;";
    private static final String FEATURE_MEDIA = "Lcom/instagram/feed/media/Media;";
    private static final String FEATURE_ITEM = "Lfixture/FeedItem;";
    private static final String FEATURE_KIND = "Lfixture/FeedKind;";
    private static final String FEATURE_RAW = "Lfixture/SuggestedRaw;";
    private static final String FEATURE_ROOT_PARSER = "Lfixture/FeedParser;";
    private static final String FEATURE_RAW_PARSER = "Lfixture/SuggestedParser;";
    private static final String FEATURE_WRAPPER = "Lfixture/SuggestedWrapper;";
    private static final String FEATURE_JSON = "Lfixture/JsonReader;";
    private static final String SUGGESTED_WIRE = "suggested_users";
    private static final String KICKSTART_WIRE = "text_app_suggested_users_kickstart_unit";
    private static final String RECORDED_RAW = "hushthreadsSuggestedUsersRaw";
    private static final String FEATURE_CACHE = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;";
    private static final String FEATURE_LAMBDA = FEATURE_CACHE.substring(0, FEATURE_CACHE.length() - 1) + "$addAndSaveItemsFromFeedFetchSuccess$2$1;";
    private static final String FEATURE_RESPONSE = "Lfixture/Permalink;";
    private static final String FEATURE_HOLDER = "Lfixture/CopyLink;";
    private static final String FEATURE_PARENT = "Lfixture/GraphResponse;";
    private static final String FEATURE_ANALYTICS = "Lapp/morphe/extension/hushthreads/misc/Analytics;";
    private static final String FEATURE_LINKS = "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;";
    private static final String FEATURE_TRUST = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;";
    private static final String PACKAGE_INFO = "Landroid/content/pm/PackageInfo;";
    private static final String SIGNER_HOST = "Lfixture/Signers;";
    private static final String SIGNER_RESULT = "Lfixture/SignerResult;";
    private static final ImmutableMethodReference PAGE_FILTER = method(FEATURE_ADS, "filter", SHORTCUT_LIST, SHORTCUT_LIST);
    private static final ImmutableMethodReference LINK_SANITIZER = method(FEATURE_LINKS, "sanitizeShared", "Ljava/lang/String;", "Ljava/lang/String;");
    private static final String FEATURE_USER = "Lcom/instagram/user/model/User;";
    private static final String FEATURE_REPOSITORY = "Lcom/instagram/barcelona/share/permalink/data/PermalinkRepository;";
    private static final String FEATURE_SHARE = "Lfixture/ShareResult;";
    private static final ImmutableMethodReference POST_LINKER = method(FEATURE_LINKS, "postLink", "Ljava/lang/String;", "Ljava/lang/String;", OBJECT, "Ljava/lang/String;");
    private static final ImmutableMethodReference LINK_GETTER = method(FEATURE_RESPONSE, "link", "Ljava/lang/String;");
    private static final String FEATURE_SEND = "Lfixture/Send;";
    private static final String FEATURE_QUICK = "Lfixture/QuickSends;";
    private static final ImmutableMethodReference PLAIN_FETCH = method(FEATURE_REPOSITORY, "plain", OBJECT, OBJECT, FEATURE_MEDIA, OBJECT, OBJECT);
    private static final ImmutableMethodReference POST_KEEPER = method(FEATURE_LINKS, "rememberPost", "V", OBJECT, OBJECT);
    private static final ImmutableMethodReference POST_RECALL = method(FEATURE_LINKS, "rememberedPost", OBJECT, OBJECT);
    private static final String FEATURE_BROWSER = "Lapp/morphe/extension/hushthreads/misc/ExternalBrowser;";
    private static final String CONTEXT = "Landroid/content/Context;";
    private static final ImmutableMethodReference LINK_OPENER = method(FEATURE_BROWSER, "open", "Z", CONTEXT, "Ljava/lang/String;");
    private static final String LAUNCHER_MESSAGE = "ThreadsBrowserLauncher: cookie injection failed; system WebView unavailable";
    private static final ImmutableMethodReference POST_CODE = method(FEATURE_MEDIA, "code", "Ljava/lang/String;");
    private static final ImmutableMethodReference POST_TITLE = method(FEATURE_MEDIA, "title", "Ljava/lang/String;");
    private static final ImmutableMethodReference POST_AUTHOR = method(FEATURE_MEDIA, "author", FEATURE_USER);
    private static final ImmutableMethodReference USERNAME = method(FEATURE_USER, "username", "Ljava/lang/String;");
    private static final ImmutableMethodReference ANALYTICS_ENDPOINT = method(FEATURE_ANALYTICS, "endpoint", "Ljava/lang/String;", "Ljava/lang/String;");
    private static final ImmutableMethodReference ORIGINAL_SIGNERS = method(FEATURE_TRUST, "originalSigners", SHORTCUT_LIST, PACKAGE_INFO);
    private static final ImmutableMethodReference ITEM_MEDIA = method(FEATURE_ITEM, "media", FEATURE_MEDIA);
    private static final ImmutableMethodReference ITEM_KIND = method(FEATURE_ITEM, "kind", FEATURE_KIND);
    private static final ImmutableMethodReference RAW_CONSTRUCTOR = method(FEATURE_RAW, "<init>", "V", "Ljava/lang/String;", "Ljava/lang/String;");
    private static final ImmutableMethodReference STRING_EQUALS = method("Ljava/lang/String;", "equals", "Z", OBJECT);
    private static final ImmutableMethodReference MEDIA_AD = method(FEATURE_MEDIA, "sponsored", "Z");
    private static final ImmutableMethodReference INJECTED_AD = method("Lfixture/AdFlag;", "injected", "Z", OBJECT);

    /** A Pando getter: it asks for the field by its name's hash and, here, answers null. */
    private static Method pandoGetter(String owner, String name, String returns, String field) {
        return define(owner, name, returns, false, body(2, new ImmutableInstruction31i(Opcode.CONST, 0, field.hashCode()),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)));
    }

    /**
     * The share-link hook after a read of the link into [link], with the post in v7 and v0/v1 free.
     * Faults: the link register swapped for the code's, the code getter swapped for another field's,
     * and the post check jumping past the call.
     */
    private static List<Instruction> postLinkHook(int link, String fault) {
        return List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                ifEqz(7, fault.equals("post-link-bypass") ? 20 : 16),
                virtual(fault.equals("post-link-getter") ? POST_TITLE : POST_CODE, 7), op(Opcode.MOVE_RESULT_OBJECT, 0),
                virtual(POST_AUTHOR, 7), op(Opcode.MOVE_RESULT_OBJECT, 1),
                ifEqz(1, 6),
                virtual(USERNAME, 1), op(Opcode.MOVE_RESULT_OBJECT, 1),
                invoke(POST_LINKER, fault.equals("post-link-register") ? 0 : link, 1, 0), op(Opcode.MOVE_RESULT_OBJECT, link));
    }

    /**
     * A resumed share's hook after a read into [link]: the post kept against [key] back into v7,
     * cast to a post, then the share-link hook. Faults named [prefix] plus recall-key, recall-cast or
     * post-link-bypass break only this copy.
     */
    private static List<Instruction> recallHook(int key, int link, String fault, String prefix) {
        List<Instruction> hook = new ArrayList<>(List.of(invoke(POST_RECALL, fault.equals(prefix + "recall-key") ? link : key),
                op(Opcode.MOVE_RESULT_OBJECT, 7), type(Opcode.CHECK_CAST, 7, fault.equals(prefix + "recall-cast") ? FEATURE_USER : FEATURE_MEDIA)));
        hook.addAll(postLinkHook(link, fault.equals(prefix + "post-link-bypass") ? "post-link-bypass" : ""));
        return hook;
    }

    /**
     * [body] behind a one-case packed switch on v4, like the switch over a lambda's kind that Threads'
     * quick sends case sits in. The payload is aligned with a nop when [body] leaves it odd, so the
     * hooks, which add an odd number of code units, take that nop away again.
     */
    private static Instruction[] switched(List<Instruction> body) {
        List<Instruction> rest = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), op(Opcode.RETURN_OBJECT, 2)));
        rest.addAll(body);
        // const/4 at 0 and the switch at 1 take four units, the null return two, so the case starts at 6.
        int payload = 4;
        for (Instruction i : rest) payload += i.getCodeUnits();
        if (payload % 2 != 0) {
            rest.add(op(Opcode.NOP));
            payload++;
        }
        List<Instruction> all = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 4, 0),
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 4, payload - 1)));
        all.addAll(rest);
        all.add(new ImmutablePackedSwitchPayload(Collections.singletonList(new ImmutableSwitchElement(0, 6 - 1))));
        return all.toArray(new Instruction[0]);
    }

    private static Instruction virtual(ImmutableMethodReference callee, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, registers.length, r[0], r[1], r[2], r[3], r[4], callee);
    }

    private static Instruction direct(ImmutableMethodReference callee, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, registers.length, r[0], r[1], r[2], r[3], r[4], callee);
    }

    private static Instruction string(int register, String value) {
        return new ImmutableInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference(value));
    }

    private static Instruction type(Opcode opcode, int register, String owner) {
        return new ImmutableInstruction21c(opcode, register, new ImmutableTypeReference(owner));
    }

    private static Instruction objectField(Opcode opcode, int value, int receiver, String owner, String name, String fieldType) {
        return new ImmutableInstruction22c(opcode, value, receiver, new ImmutableFieldReference(owner, name, fieldType));
    }

    private static ClassDef featureClass(String owner, String parent, List<ImmutableField> fields, Method... methods) {
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue(), parent, null, null, null, fields, Arrays.asList(methods));
    }

    private static ImmutableField featureField(String owner, String name, String type) {
        return new ImmutableField(owner, name, type, AccessFlags.PUBLIC.getValue(), null, null, null);
    }

    private static Instruction staticField(Opcode opcode, int register, String owner, String name, String type) {
        return new ImmutableInstruction21c(opcode, register, new ImmutableFieldReference(owner, name, type));
    }

    private static ImmutableField flaggedField(String owner, String name, String type, int flags) {
        return new ImmutableField(owner, name, type, flags, null, null, null);
    }

    /** Compute branch offsets from instruction boundaries, including the corruption variants. */
    private static void featureBranch(List<Instruction> body, int at, int target, Opcode opcode, int a, int b) {
        int offset = 0;
        for (int n = Math.min(at, target); n < Math.max(at, target); n++) offset += body.get(n).getCodeUnits();
        if (target < at) offset = -offset;
        body.set(at, opcode == Opcode.GOTO ? new ImmutableInstruction10t(opcode, offset) : opcode == Opcode.IF_EQ || opcode == Opcode.IF_NE
                ? new ImmutableInstruction22t(opcode, a, b, offset) : new ImmutableInstruction21t(opcode, a, offset));
    }

    /** Kept strings select fields through parser copies, constructor stores and enum allocation.
     * Same-type decoys deliberately exist; a verifier that accepts any matching type fails here. */
    private static List<ClassDef> suggestionStock() {
        int publicFinal = AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue();
        int enumFlags = publicFinal | AccessFlags.STATIC.getValue() | AccessFlags.ENUM.getValue();
        List<Instruction> initializer = new ArrayList<>();
        List<ImmutableField> kinds = new ArrayList<>();
        String[][] variants = {{"suggested", "SUGGESTED_USERS", SUGGESTED_WIRE},
                {"kickstart", "KICKSTART_FEED_UNIT", KICKSTART_WIRE}, {"other", "OTHER_CARD", "unknown_netego"}};
        for (String[] variant : variants) {
            initializer.add(string(3, variant[2]));
            initializer.add(string(1, variant[1]));
            initializer.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
            initializer.add(type(Opcode.NEW_INSTANCE, 0, FEATURE_KIND));
            initializer.add(direct(method(FEATURE_KIND, "<init>", "V", "Ljava/lang/String;", "I", "Ljava/lang/String;"), 0, 1, 2, 3));
            initializer.add(staticField(Opcode.SPUT_OBJECT, 0, FEATURE_KIND, variant[0], FEATURE_KIND));
            kinds.add(flaggedField(FEATURE_KIND, variant[0], FEATURE_KIND, enumFlags));
        }
        initializer.add(op(Opcode.RETURN_VOID));
        kinds.add(flaggedField(FEATURE_KIND, "byWire", "Ljava/util/Map;", publicFinal | AccessFlags.STATIC.getValue()));
        kinds.add(featureField(FEATURE_KIND, "wire", "Ljava/lang/String;"));
        ClassDef enumClass = new ImmutableClassDef(FEATURE_KIND, publicFinal | AccessFlags.ENUM.getValue(), "Ljava/lang/Enum;",
                null, null, null, kinds, List.of(define(FEATURE_KIND, "<clinit>", "V", true, body(4, initializer.toArray(new Instruction[0]))),
                define(FEATURE_KIND, "<init>", "V", false, body(4,
                        direct(method("Ljava/lang/Enum;", "<init>", "V", "Ljava/lang/String;", "I"), 0, 1, 2),
                        objectField(Opcode.IPUT_OBJECT, 3, 0, FEATURE_KIND, "wire", "Ljava/lang/String;"), op(Opcode.RETURN_VOID)),
                        "Ljava/lang/String;", "I", "Ljava/lang/String;")));
        ClassDef model = featureClass(FEATURE_RAW, OBJECT,
                List.of(flaggedField(FEATURE_RAW, "type", "Ljava/lang/String;", publicFinal),
                        flaggedField(FEATURE_RAW, "label", "Ljava/lang/String;", publicFinal)),
                define(FEATURE_RAW, "<init>", "V", false, body(4, direct(method(OBJECT, "<init>", "V"), 1),
                        string(0, "XDTSuggestedUsers"), new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 2),
                        objectField(Opcode.IPUT_OBJECT, 0, 1, FEATURE_RAW, "type", "Ljava/lang/String;"),
                        objectField(Opcode.IPUT_OBJECT, 3, 1, FEATURE_RAW, "label", "Ljava/lang/String;"), op(Opcode.RETURN_VOID)),
                        "Ljava/lang/String;", "Ljava/lang/String;"));
        List<Instruction> raw = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),
                string(1, "netego_type"), invoke(method("Lfixture/JsonRead;", "fieldName", "Ljava/lang/String;", FEATURE_JSON), 6),
                op(Opcode.MOVE_RESULT_OBJECT, 0), virtual(STRING_EQUALS, 1, 0), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 1),
                invoke(method("Lfixture/JsonRead;", "text", "Ljava/lang/String;", FEATURE_JSON), 6), op(Opcode.MOVE_RESULT_OBJECT, 2),
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 2), type(Opcode.NEW_INSTANCE, 0, FEATURE_RAW), string(1, "another string"),
                direct(RAW_CONSTRUCTOR, 0, 3, 1), op(Opcode.RETURN_OBJECT, 0)));
        featureBranch(raw, 6, 10, Opcode.IF_EQZ, 0, 0);
        ClassDef rawParser = featureClass(FEATURE_RAW_PARSER, OBJECT,
                List.of(flaggedField(FEATURE_RAW_PARSER, "INSTANCE", FEATURE_RAW_PARSER, publicFinal | AccessFlags.STATIC.getValue())),
                define(FEATURE_RAW_PARSER, "unsafeParseFromJson", OBJECT, false, body(7, raw.toArray(new Instruction[0])), FEATURE_JSON),
                define(FEATURE_RAW_PARSER, "parseFromJsonParser", OBJECT, false,
                        body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)), FEATURE_JSON));
        Instruction mapGet = new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 1, 0, 0, 0, 0,
                method("Ljava/util/Map;", "get", OBJECT, OBJECT));
        List<Instruction> wrapperCode = new ArrayList<>(List.of(direct(method(OBJECT, "<init>", "V"), 3), ifEqz(4, 1),
                        objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_RAW, "type", "Ljava/lang/String;"),
                        staticField(Opcode.SGET_OBJECT, 1, FEATURE_KIND, "byWire", "Ljava/util/Map;"), mapGet,
                        op(Opcode.MOVE_RESULT_OBJECT, 0), type(Opcode.CHECK_CAST, 0, FEATURE_KIND),
                        objectField(Opcode.IPUT_OBJECT, 0, 3, FEATURE_WRAPPER, "kind", FEATURE_KIND), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        featureBranch(wrapperCode, 1, 9, Opcode.IF_EQZ, 4, 0);
        ClassDef wrapper = featureClass(FEATURE_WRAPPER, OBJECT, List.of(featureField(FEATURE_WRAPPER, "kind", FEATURE_KIND)),
                define(FEATURE_WRAPPER, "<init>", "V", false, body(5, wrapperCode.toArray(new Instruction[0])), FEATURE_RAW));
        List<Instruction> root = new ArrayList<>(List.of(type(Opcode.NEW_INSTANCE, 0, FEATURE_ITEM),
                direct(method(FEATURE_ITEM, "<init>", "V"), 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), invoke(method("Lfixture/JsonRead;", "fieldName", "Ljava/lang/String;", FEATURE_JSON), 11),
                op(Opcode.MOVE_RESULT_OBJECT, 4)));
        List<Integer> tests = new ArrayList<>();
        for (String key : List.of(KICKSTART_WIRE, SUGGESTED_WIRE)) {
            root.add(string(3, key));
            root.add(virtual(STRING_EQUALS, 3, 4));
            root.add(op(Opcode.MOVE_RESULT, 5));
            tests.add(root.size());
            root.add(ifEqz(5, 1));
            root.add(staticField(Opcode.SGET_OBJECT, 6, FEATURE_RAW_PARSER, "INSTANCE", FEATURE_RAW_PARSER));
            root.add(virtual(method(FEATURE_RAW_PARSER, "parseFromJsonParser", OBJECT, FEATURE_JSON), 6, 11));
            root.add(op(Opcode.MOVE_RESULT_OBJECT, 7));
            root.add(type(Opcode.CHECK_CAST, 7, FEATURE_RAW));
            root.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, key.equals(KICKSTART_WIRE) ? 1 : 2, 7));
        }
        int stores = root.size();
        root.add(objectField(Opcode.IPUT_OBJECT, 1, 0, FEATURE_ITEM, "kickstart", FEATURE_RAW));
        root.add(objectField(Opcode.IPUT_OBJECT, 2, 0, FEATURE_ITEM, "suggested", FEATURE_RAW));
        for (String slot : List.of("suggested", "kickstart")) {
            root.add(objectField(Opcode.IGET_OBJECT, 7, 0, FEATURE_ITEM, slot, FEATURE_RAW));
            root.add(type(Opcode.NEW_INSTANCE, 8, FEATURE_WRAPPER));
            root.add(direct(method(FEATURE_WRAPPER, "<init>", "V", FEATURE_RAW), 8, 7));
            root.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 9, 8));
            root.add(objectField(Opcode.IPUT_OBJECT, 9, 0, FEATURE_ITEM, "active", FEATURE_WRAPPER));
        }
        root.add(op(Opcode.RETURN_OBJECT, 0));
        featureBranch(root, tests.get(0), tests.get(0) + 6, Opcode.IF_EQZ, 5, 0);
        featureBranch(root, tests.get(1), stores, Opcode.IF_EQZ, 5, 0);
        ClassDef rootParser = featureClass(FEATURE_ROOT_PARSER, OBJECT, List.of(),
                define(FEATURE_ROOT_PARSER, "unsafeParseFromJson", OBJECT, false, body(12, root.toArray(new Instruction[0])), FEATURE_JSON));
        return List.of(enumClass, model, rawParser, wrapper, rootParser);
    }

    private static ImmutableMethodImplementation suggestionPredicate(String fault) {
        if (fault.equals("suggestion-stub")) return body(5, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0));
        List<Instruction> code = new ArrayList<>(List.of(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 4, new ImmutableTypeReference(FEATURE_ITEM)), ifEqz(0, 1),
                type(Opcode.CHECK_CAST, 4, FEATURE_ITEM), virtual(ITEM_MEDIA, 4), op(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 1), virtual(ITEM_KIND, 4), op(Opcode.MOVE_RESULT_OBJECT, 0),
                staticField(Opcode.SGET_OBJECT, 1, FEATURE_KIND, "suggested", FEATURE_KIND), new ImmutableInstruction22t(Opcode.IF_EQ, 0, 1, 1),
                staticField(Opcode.SGET_OBJECT, 1, FEATURE_KIND, "kickstart", FEATURE_KIND), new ImmutableInstruction22t(Opcode.IF_NE, 0, 1, 1),
                objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_ITEM, "kickstart", FEATURE_RAW), string(1, KICKSTART_WIRE), new ImmutableInstruction10t(Opcode.GOTO, 1),
                objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_ITEM, "suggested", FEATURE_RAW), string(1, SUGGESTED_WIRE), ifEqz(0, 1),
                objectField(Opcode.IGET_OBJECT, 2, 4, FEATURE_ITEM, "active", FEATURE_WRAPPER),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 3, 2, new ImmutableTypeReference(FEATURE_WRAPPER)), ifEqz(3, 1),
                type(Opcode.CHECK_CAST, 2, FEATURE_WRAPPER), objectField(Opcode.IGET_OBJECT, 2, 2, FEATURE_WRAPPER, RECORDED_RAW, FEATURE_RAW),
                new ImmutableInstruction22t(Opcode.IF_NE, 0, 2, 1), objectField(Opcode.IGET_OBJECT, 0, 0, FEATURE_RAW, "type", "Ljava/lang/String;"),
                virtual(STRING_EQUALS, 1, 0), op(Opcode.MOVE_RESULT, 0), op(Opcode.RETURN, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, fault.equals("suggestion-false") ? 1 : 0), op(Opcode.RETURN, 0)));
        if (fault.equals("suggestion-item-missing")) code.set(1, op(Opcode.NOP));
        if (fault.equals("suggestion-media-missing")) code.set(5, op(Opcode.NOP));
        if (fault.equals("suggestion-type-missing")) code.set(11, op(Opcode.NOP));
        if (fault.equals("suggestion-null-missing")) code.set(17, op(Opcode.NOP));
        if (fault.equals("suggestion-wrapper-missing")) code.set(20, op(Opcode.NOP));
        if (fault.equals("suggestion-identity-missing")) code.set(23, op(Opcode.NOP));
        if (!fault.equals("suggestion-item-missing")) featureBranch(code, 1, 28, Opcode.IF_EQZ, 0, 0);
        if (!fault.equals("suggestion-media-missing")) featureBranch(code, 5, 28, fault.equals("suggestion-media-guard") ? Opcode.IF_EQZ : Opcode.IF_NEZ, 0, 0);
        featureBranch(code, 9, fault.equals("suggestion-branch") ? 12 : 15, Opcode.IF_EQ, 0, 1);
        if (!fault.equals("suggestion-type-missing")) featureBranch(code, 11, 28, fault.equals("suggestion-type-guard") ? Opcode.IF_EQ : Opcode.IF_NE, 0, 1);
        featureBranch(code, 14, 17, Opcode.GOTO, 0, 0);
        if (!fault.equals("suggestion-null-missing")) featureBranch(code, 17, 28, fault.equals("suggestion-null-guard") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0, 0);
        if (!fault.equals("suggestion-wrapper-missing")) featureBranch(code, 20, 28, Opcode.IF_EQZ, 3, 0);
        if (!fault.equals("suggestion-identity-missing")) featureBranch(code, 23, 28, fault.equals("suggestion-identity-guard") ? Opcode.IF_EQ : Opcode.IF_NE, 0, 2);
        if (fault.equals("suggestion-enum")) code.set(8, staticField(Opcode.SGET_OBJECT, 1, FEATURE_KIND, "other", FEATURE_KIND));
        if (fault.equals("suggestion-slot")) code.set(15, objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_ITEM, "other", FEATURE_RAW));
        if (fault.equals("suggestion-kickstart-slot")) code.set(12, objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_ITEM, "suggested", FEATURE_RAW));
        if (fault.equals("suggestion-raw")) code.set(24, objectField(Opcode.IGET_OBJECT, 0, 0, FEATURE_RAW, "label", "Ljava/lang/String;"));
        if (fault.equals("suggestion-wire")) code.set(16, string(1, "unknown_netego"));
        if (fault.equals("suggestion-kickstart-wire")) code.set(13, string(1, "unknown_netego"));
        if (fault.equals("suggestion-register")) code.set(25, virtual(STRING_EQUALS, 0, 1));
        if (fault.equals("suggestion-active-slot")) code.set(18, objectField(Opcode.IGET_OBJECT, 2, 4, FEATURE_ITEM, "otherActive", FEATURE_WRAPPER));
        if (fault.equals("suggestion-owned-raw")) code.set(22, objectField(Opcode.IGET_OBJECT, 2, 2, FEATURE_WRAPPER, "wrongRaw", FEATURE_RAW));
        if (fault.equals("suggestion-extra-call")) {
            code.add(invoke(method(FEATURE_ADS, "isSuggestedUserItem", "Z", OBJECT), 4));
            code.add(op(Opcode.MOVE_RESULT, 0));
            code.add(op(Opcode.RETURN, 0));
        }
        return body(5, code.toArray(new Instruction[0]));
    }

    /** The owned field is the only allowed declaration change. Both stock returns record p0/p1,
     * and a stock branch to a return must land on the recorder rather than bypass it. */
    private static void captureSuggestionRaw(List<ClassDef> classes, String fault) {
        for (int c = 0; c < classes.size(); c++) {
            ClassDef original = classes.get(c);
            if (!original.getType().equals(FEATURE_WRAPPER)) continue;
            List<ImmutableField> fields = new ArrayList<>();
            original.getFields().forEach(f -> fields.add(ImmutableField.of(f)));
            int flags = AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue();
            if (fault.equals("suggestion-capture-flags")) flags = AccessFlags.PUBLIC.getValue();
            if (!fault.equals("suggestion-capture-field-missing")) fields.add(flaggedField(FEATURE_WRAPPER, RECORDED_RAW, FEATURE_RAW, flags));
            List<Method> methods = new ArrayList<>();
            for (Method m : original.getMethods()) {
                if (!m.getName().equals("<init>") || !m.getParameterTypes().equals(List.of(FEATURE_RAW))) { methods.add(m); continue; }
                List<Instruction> old = new ArrayList<>();
                m.getImplementation().getInstructions().forEach(old::add);
                List<Instruction> code = new ArrayList<>();
                Map<Integer, Integer> relocated = new LinkedHashMap<>();
                int[] operations = new int[old.size()];
                int oldAddress = 0, newAddress = 0;
                for (int n = 0; n < old.size(); n++) {
                    Instruction i = old.get(n);
                    relocated.put(oldAddress, newAddress);
                    if (i.getOpcode() == Opcode.RETURN_VOID && !fault.equals("suggestion-capture-missing")) {
                        List<Instruction> capture = List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 3),
                                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, fault.equals("suggestion-capture-register") ? 3 : 4),
                                objectField(Opcode.IPUT_OBJECT, 1, 0, FEATURE_WRAPPER,
                                        fault.equals("suggestion-capture-field") ? "wrongRaw" : RECORDED_RAW, FEATURE_RAW));
                        code.addAll(capture);
                        newAddress += capture.stream().mapToInt(Instruction::getCodeUnits).sum();
                        if (fault.equals("suggestion-capture-duplicate")) {
                            code.addAll(capture);
                            newAddress += capture.stream().mapToInt(Instruction::getCodeUnits).sum();
                        }
                    }
                    operations[n] = code.size();
                    code.add(i);
                    oldAddress += i.getCodeUnits();
                    newAddress += i.getCodeUnits();
                }
                oldAddress = 0;
                for (int n = 0; n < old.size(); n++) {
                    Instruction i = old.get(n);
                    if (i instanceof com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) {
                        int target = oldAddress + ((com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) i).getCodeOffset();
                        int destination = relocated.get(target);
                        if (fault.equals("suggestion-capture-bypass")) destination += 6;
                        int at = operations[n], address = code.subList(0, at).stream().mapToInt(Instruction::getCodeUnits).sum();
                        code.set(at, i.getOpcode() == Opcode.GOTO ? new ImmutableInstruction10t(i.getOpcode(), destination - address)
                                : new ImmutableInstruction21t(i.getOpcode(), ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) i).getRegisterA(), destination - address));
                    }
                    oldAddress += i.getCodeUnits();
                }
                methods.add(new ImmutableMethod(FEATURE_WRAPPER, m.getName(), m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                        m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(m.getImplementation().getRegisterCount(), code, null, null)));
            }
            classes.set(c, new ImmutableClassDef(FEATURE_WRAPPER, original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                    original.getSourceFile(), original.getAnnotations(), fields, methods));
        }
    }

    /** Insert a key window while retaining the fixture's original branch destinations. */
    private static void insertFeatureKeyWindow(List<Instruction> code, int at, List<Instruction> window) {
        List<Instruction> original = new ArrayList<>(code);
        Map<Integer, Integer> indices = new LinkedHashMap<>();
        int address = 0;
        for (int n = 0; n < original.size(); n++) {
            indices.put(address, n);
            address += original.get(n).getCodeUnits();
        }
        code.addAll(at, window);
        address = 0;
        for (int n = 0; n < original.size(); n++) {
            Instruction instruction = original.get(n);
            if (instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) {
                int oldTarget = address + ((com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) instruction).getCodeOffset();
                Integer target = indices.get(oldTarget);
                if (target == null) throw new IllegalArgumentException("Fixture branch has no instruction target");
                int sourceIndex = n + (n >= at ? window.size() : 0);
                int targetIndex = target + (target > at ? window.size() : 0);
                int register = instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
                        ? ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) instruction).getRegisterA() : 0;
                featureBranch(code, sourceIndex, targetIndex, instruction.getOpcode(), register, 0);
            }
            address += instruction.getCodeUnits();
        }
    }

    /** Preserve the original key on one branch; only a substituted arm must be refused. */
    private static void suggestionKeyWindow(List<Instruction> code, String fault) {
        boolean map = fault.contains("-map-key-");
        String separator = map ? "-map-key-" : "-key-";
        String mode = fault.substring(fault.lastIndexOf(separator) + separator.length());
        String key = fault.contains("-raw-key-") ? "netego_type" : fault.contains("-kickstart-key-") ? KICKSTART_WIRE : SUGGESTED_WIRE;
        int definition = -1;
        for (int n = 0; n < code.size(); n++) {
            Instruction instruction = code.get(n);
            if (!(instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)) continue;
            String reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) instruction).getReference().toString();
            if (map ? instruction.getOpcode() == Opcode.IGET_OBJECT && reference.equals(FEATURE_RAW + "->type:Ljava/lang/String;")
                    : reference.equals(key)) { definition = n; break; }
        }
        if (definition < 0) throw new IllegalArgumentException("No key definition for " + fault);
        int value = ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) code.get(definition)).getRegisterA();
        int saved = map ? 2 : fault.contains("-raw-key-") ? 4 : 8;
        int condition = map ? 4 : fault.contains("-raw-key-") ? 6 : 11;
        List<Instruction> window = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, saved, value)));
        if (!mode.equals("copy")) {
            window.add(ifEqz(condition, 1));
            window.add(mode.equals("constant") ? string(value, "tracking_token")
                    : mode.equals("null") ? new ImmutableInstruction11n(Opcode.CONST_4, value, 0)
                    : new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, saved));
            featureBranch(window, 1, window.size(), Opcode.IF_EQZ, condition, 0);
        }
        insertFeatureKeyWindow(code, definition + 1, window);
        if (mode.equals("copy")) for (int n = definition + window.size() + 1; n < code.size(); n++) {
            Instruction instruction = code.get(n);
            if (!(instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)) continue;
            String reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) instruction).getReference().toString();
            if (map ? reference.equals("Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;") : reference.equals(STRING_EQUALS.toString())) {
                var invoke = (com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction) instruction;
                if (map) code.set(n, new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, invoke.getRegisterC(), saved, 0, 0, 0,
                        method("Ljava/util/Map;", "get", OBJECT, OBJECT)));
                else code.set(n, virtual(STRING_EQUALS, invoke.getRegisterC() == value ? saved : invoke.getRegisterC(),
                        invoke.getRegisterD() == value ? saved : invoke.getRegisterD()));
                break;
            }
        }
    }

    private static void requireReaderFixtureReachable(List<Instruction> code, List<ImmutableTryBlock> tries, int target, String fault) {
        Map<Integer, Integer> indices = new LinkedHashMap<>();
        List<Integer> addresses = new ArrayList<>();
        int address = 0;
        for (int n = 0; n < code.size(); n++) {
            indices.put(address, n);
            addresses.add(address);
            address += code.get(n).getCodeUnits();
        }
        Set<Integer> visited = new java.util.HashSet<>();
        java.util.Deque<Integer> work = new java.util.ArrayDeque<>(List.of(0));
        while (!work.isEmpty()) {
            int at = work.removeFirst();
            if (!visited.add(at)) continue;
            Instruction instruction = code.get(at);
            if (instruction.getOpcode().canContinue() && at + 1 < code.size()) work.add(at + 1);
            if (instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) {
                Integer next = indices.get(addresses.get(at) + ((com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) instruction).getCodeOffset());
                if (next == null) throw new IllegalArgumentException("Reader fixture has an invalid branch: " + fault);
                work.add(next);
            }
            if (instruction.getOpcode().canThrow()) for (ImmutableTryBlock block : tries) {
                if (addresses.get(at) < block.getStartCodeAddress() || addresses.get(at) >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                for (var handler : block.getExceptionHandlers()) {
                    Integer next = indices.get(handler.getHandlerCodeAddress());
                    if (next == null) throw new IllegalArgumentException("Reader fixture has an invalid handler: " + fault);
                    work.add(next);
                }
            }
        }
        if (!visited.contains(target)) throw new IllegalArgumentException("Reader fixture's intended branch is unreachable: " + fault);
    }

    /** A key's reader must retain both its controlling true edge and the original JSON input. */
    private static List<ImmutableTryBlock> suggestionReaderWindow(List<Instruction> code, String fault) {
        boolean raw = fault.contains("-raw-reader-");
        String key = raw ? "netego_type" : fault.contains("-kickstart-reader-") ? KICKSTART_WIRE : SUGGESTED_WIRE;
        int literal = -1, comparison = -1, reader = -1;
        for (int n = 0; n < code.size(); n++) {
            if (!(code.get(n) instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)) continue;
            var reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) code.get(n)).getReference();
            if (literal < 0 && reference.toString().equals(key)) literal = n;
            else if (literal >= 0 && comparison < 0 && reference.toString().equals(STRING_EQUALS.toString())) comparison = n;
            else if (comparison >= 0 && n > comparison + 2 && reference instanceof com.android.tools.smali.dexlib2.iface.reference.MethodReference) {
                var call = (com.android.tools.smali.dexlib2.iface.reference.MethodReference) reference;
                if (raw ? call.getReturnType().equals("Ljava/lang/String;") : call.getName().equals("parseFromJsonParser")) { reader = n; break; }
            }
        }
        if (literal < 0 || reader < 0) throw new IllegalArgumentException("No key-controlled reader for " + fault);
        int parameter = raw ? 6 : 11, alias = raw ? 4 : 10;
        int intended;
        List<Instruction> window = new ArrayList<>();
        List<ImmutableTryBlock> tries = new ArrayList<>();
        if (fault.contains("-reader-input-")) {
            String mode = fault.substring(fault.indexOf("-reader-input-") + "-reader-input-".length());
            window.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, alias, parameter));
            if (!mode.equals("copy")) {
                window.add(ifEqz(parameter, 1));
                window.add(mode.equals("other") ? objectField(Opcode.IGET_OBJECT, alias, parameter, FEATURE_JSON, "alternate", FEATURE_JSON)
                        : mode.equals("null") ? new ImmutableInstruction11n(Opcode.CONST_4, alias, 0)
                        : new ImmutableInstruction12x(Opcode.MOVE_OBJECT, alias, parameter));
                featureBranch(window, 1, window.size(), Opcode.IF_EQZ, parameter, 0);
            }
            insertFeatureKeyWindow(code, raw ? reader : reader - 1, window);
            intended = (raw ? reader : reader - 1) + (mode.equals("copy") ? 0 : 1);
            int at = reader + window.size();
            var instruction = code.get(at);
            var call = (com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction) instruction;
            var reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) instruction).getReference();
            code.set(at, new ImmutableInstruction35c(instruction.getOpcode(), call.getRegisterCount(), raw ? alias : call.getRegisterC(),
                    raw ? call.getRegisterD() : alias, call.getRegisterE(), call.getRegisterF(), call.getRegisterG(), reference));
        } else if (fault.contains("-reader-catch-")) {
            window.addAll(List.of(invoke(method("Ljava/lang/String;", "valueOf", "Ljava/lang/String;", OBJECT), parameter),
                    new ImmutableInstruction10t(Opcode.GOTO, 1), op(Opcode.MOVE_EXCEPTION, alias), new ImmutableInstruction10t(Opcode.GOTO, 1)));
            int start = code.subList(0, literal).stream().mapToInt(Instruction::getCodeUnits).sum();
            int handler = start + window.get(0).getCodeUnits() + window.get(1).getCodeUnits();
            tries.add(tryBlock(start, window.get(0).getCodeUnits(), handler));
            insertFeatureKeyWindow(code, literal, window);
            featureBranch(code, literal + 1, literal + window.size(), Opcode.GOTO, 0, 0);
            featureBranch(code, literal + 3, fault.endsWith("-bypass") ? reader + window.size() : literal + window.size(), Opcode.GOTO, 0, 0);
            intended = literal + 3;
        } else {
            boolean bypass = fault.endsWith("-bypass");
            if (bypass && !raw) window.add(code.get(reader - 1));
            int branch = window.size();
            window.add(new ImmutableInstruction21t(Opcode.IF_NEZ, parameter, 1));
            if (!bypass) window.add(op(Opcode.NOP));
            insertFeatureKeyWindow(code, literal, window);
            featureBranch(code, literal + branch, bypass ? reader + window.size() : literal + window.size(), Opcode.IF_NEZ, parameter, 0);
            intended = literal + branch;
        }
        requireReaderFixtureReachable(code, tries, intended, fault);
        return tries;
    }

    /** At one preserved store/call, retain a good arm and vary only the other value source. */
    private static List<ImmutableTryBlock> suggestionSourceWindow(List<Instruction> code, String fault, boolean slot) {
        String separator = slot ? "-slot-source-" : "-parser-";
        String mode = fault.substring(fault.indexOf(separator) + separator.length());
        int value = slot ? 2 : 3, saved = slot ? 7 : 4, condition = slot ? 11 : 1, counter = slot ? 5 : 2;
        int receiver = slot ? 11 : 6, exception = slot ? 5 : 2;
        if (mode.equals("absent")) {
            code.addAll(1, List.of(new ImmutableInstruction11n(Opcode.CONST_4, saved, 0), new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, saved)));
            return List.of();
        }
        int at = -1;
        String target = slot ? FEATURE_ITEM + "->suggested:" + FEATURE_RAW : RAW_CONSTRUCTOR.toString();
        for (int n = 0; n < code.size(); n++) if (code.get(n) instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
                && ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) code.get(n)).getReference().toString().equals(target)) { at = n; break; }
        if (at < 0) throw new IllegalArgumentException("No source edge for " + fault);
        List<Instruction> window = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, saved, value)));
        List<ImmutableTryBlock> tries = new ArrayList<>();
        if (mode.equals("loop")) {
            window.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, counter, 2), ifEqz(counter, 1),
                    fault.startsWith("ambiguous-") ? string(value, SUGGESTED_WIRE) : new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, saved),
                    new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, counter, counter, -1), new ImmutableInstruction10t(Opcode.GOTO, 1)));
            featureBranch(window, 2, window.size(), Opcode.IF_EQZ, counter, 0);
            featureBranch(window, 5, 2, Opcode.GOTO, 0, 0);
        } else if (mode.equals("catch")) {
            window.addAll(List.of(objectField(Opcode.IGET_OBJECT, value, receiver, FEATURE_JSON, "temporary", slot ? FEATURE_RAW : "Ljava/lang/String;"),
                    new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, saved), new ImmutableInstruction10t(Opcode.GOTO, 1), op(Opcode.MOVE_EXCEPTION, exception)));
            if (fault.startsWith("ambiguous-")) window.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, 1));
            featureBranch(window, 3, window.size(), Opcode.GOTO, 0, 0);
            int start = code.subList(0, at).stream().mapToInt(Instruction::getCodeUnits).sum();
            int handler = start + window.subList(0, 4).stream().mapToInt(Instruction::getCodeUnits).sum();
            tries.add(tryBlock(start + window.get(0).getCodeUnits(), window.get(1).getCodeUnits(), handler));
        } else {
            window.add(ifEqz(condition, 1));
            switch (mode) {
                case "constant": window.add(string(value, SUGGESTED_WIRE)); break;
                case "parameter": case "other": window.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, 1)); break;
                case "new": window.add(type(Opcode.NEW_INSTANCE, value, FEATURE_RAW)); window.add(direct(RAW_CONSTRUCTOR, value, 3, 4)); break;
                case "copy": window.add(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, value, saved)); break;
                case "null": window.add(new ImmutableInstruction11n(Opcode.CONST_4, value, 0)); break;
                default: throw new IllegalArgumentException("Unknown source variant " + fault);
            }
            featureBranch(window, 1, window.size(), Opcode.IF_EQZ, condition, 0);
        }
        code.addAll(at, window);
        return tries;
    }

    private static void corruptSuggestionStock(List<ClassDef> classes, String fault) {
        String owner, name;
        switch (fault) {
            case "suggestion-parser-body": case "suggestion-parser-slot": case "ambiguous-suggestion-slot": case "ambiguous-suggestion-active":
            case "ambiguous-suggestion-slot-source-new": case "ambiguous-suggestion-slot-source-other": case "ambiguous-suggestion-slot-source-catch":
            case "proven-suggestion-slot-source-null": case "proven-suggestion-slot-source-copy": case "proven-suggestion-slot-source-loop": case "proven-suggestion-slot-source-catch":
            case "ambiguous-suggestion-users-key-constant": case "ambiguous-suggestion-users-key-null":
            case "ambiguous-suggestion-kickstart-key-constant": case "ambiguous-suggestion-kickstart-key-null":
            case "proven-suggestion-users-key-copy": case "proven-suggestion-users-key-branch":
            case "proven-suggestion-kickstart-key-copy": case "proven-suggestion-kickstart-key-branch":
            case "ambiguous-suggestion-users-reader-bypass": case "ambiguous-suggestion-kickstart-reader-bypass":
            case "ambiguous-suggestion-users-reader-input-other": case "ambiguous-suggestion-users-reader-input-null":
            case "ambiguous-suggestion-kickstart-reader-input-other": case "ambiguous-suggestion-kickstart-reader-input-null":
            case "proven-suggestion-users-reader-gated": case "proven-suggestion-kickstart-reader-gated":
            case "proven-suggestion-users-reader-input-copy": case "proven-suggestion-users-reader-input-branch":
            case "proven-suggestion-kickstart-reader-input-copy": case "proven-suggestion-kickstart-reader-input-branch":
                owner = FEATURE_ROOT_PARSER; name = "unsafeParseFromJson"; break;
            case "suggestion-raw-parser-body":
            case "ambiguous-suggestion-parser-constant": case "ambiguous-suggestion-parser-parameter": case "ambiguous-suggestion-parser-loop": case "ambiguous-suggestion-parser-catch":
            case "proven-suggestion-parser-absent": case "proven-suggestion-parser-null": case "proven-suggestion-parser-copy": case "proven-suggestion-parser-loop": case "proven-suggestion-parser-catch":
            case "ambiguous-suggestion-raw-key-constant": case "ambiguous-suggestion-raw-key-null":
            case "proven-suggestion-raw-key-copy": case "proven-suggestion-raw-key-branch":
            case "ambiguous-suggestion-raw-reader-bypass": case "ambiguous-suggestion-raw-reader-catch-bypass":
            case "ambiguous-suggestion-raw-reader-input-other": case "ambiguous-suggestion-raw-reader-input-null":
            case "proven-suggestion-raw-reader-gated": case "proven-suggestion-raw-reader-catch-gated":
            case "proven-suggestion-raw-reader-input-copy": case "proven-suggestion-raw-reader-input-branch":
                owner = FEATURE_RAW_PARSER; name = "unsafeParseFromJson"; break;
            case "suggestion-model-body": case "ambiguous-suggestion-raw": case "ambiguous-suggestion-overwrite":
            case "ambiguous-suggestion-branch-constant": case "ambiguous-suggestion-branch-parameter":
            case "proven-suggestion-branch": case "proven-suggestion-catch": case "ambiguous-suggestion-catch":
                owner = FEATURE_RAW; name = "<init>"; break;
            case "suggestion-enum-body": owner = FEATURE_KIND; name = "<clinit>"; break;
            case "suggestion-wrapper-body": case "suggestion-wrapper-field": owner = FEATURE_WRAPPER; name = "<init>"; break;
            case "ambiguous-suggestion-map-key-constant": case "ambiguous-suggestion-map-key-null":
            case "proven-suggestion-map-key-copy": case "proven-suggestion-map-key-branch":
            case "proven-suggestion-map-null-bypass":
            case "ambiguous-suggestion-null-bypass-map-key-constant": case "ambiguous-suggestion-null-bypass-map-key-null":
            case "proven-suggestion-null-bypass-map-key-copy": case "proven-suggestion-null-bypass-map-key-branch":
                owner = FEATURE_WRAPPER; name = "<init>"; break;
            case "ambiguous-suggestion-capture-param": owner = FEATURE_WRAPPER; name = "<init>"; break;
            case "suggestion-kind-body": case "suggestion-kind-flags": case "suggestion-kind-coverage":
                owner = FEATURE_ITEM; name = "kind"; break;
            case "suggestion-model-field": owner = FEATURE_RAW; name = ""; break;
            default: return;
        }
        for (int c = 0; c < classes.size(); c++) {
            ClassDef original = classes.get(c);
            if (!original.getType().equals(owner)) continue;
            List<ImmutableField> fields = new ArrayList<>();
            for (com.android.tools.smali.dexlib2.iface.Field field : original.getFields()) {
                int flags = field.getAccessFlags();
                if (fault.equals("suggestion-model-field") && field.getName().equals("type")) flags = AccessFlags.PRIVATE.getValue() | AccessFlags.FINAL.getValue();
                fields.add(new ImmutableField(owner, field.getName(), field.getType(), flags, field.getInitialValue(), field.getAnnotations(), field.getHiddenApiRestrictions()));
            }
            List<Method> methods = new ArrayList<>();
            for (Method m : original.getMethods()) {
                int flags = m.getAccessFlags();
                MethodImplementation implementation = m.getImplementation();
                if (m.getName().equals(name)) {
                    List<Instruction> code = new ArrayList<>();
                    implementation.getInstructions().forEach(code::add);
                    if (fault.endsWith("-body")) {
                        if (m.getReturnType().equals("V")) code.add(op(Opcode.NOP));
                        else code.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
                        code.add(m.getReturnType().equals("V") ? op(Opcode.RETURN_VOID) : op(Opcode.RETURN_OBJECT, 0));
                    }
                    if (fault.equals("suggestion-kind-flags")) flags |= AccessFlags.FINAL.getValue();
                    if (fault.contains("null-bypass")) {
                        code = new ArrayList<>(List.of(direct(method(OBJECT, "<init>", "V"), 3), new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                                ifEqz(4, 1), objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_RAW, "type", "Ljava/lang/String;"),
                                staticField(Opcode.SGET_OBJECT, 1, FEATURE_KIND, "byWire", "Ljava/util/Map;"),
                                new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 1, 0, 0, 0, 0, method("Ljava/util/Map;", "get", OBJECT, OBJECT)),
                                op(Opcode.MOVE_RESULT_OBJECT, 0), type(Opcode.CHECK_CAST, 0, FEATURE_KIND),
                                objectField(Opcode.IPUT_OBJECT, 0, 3, FEATURE_WRAPPER, "kind", FEATURE_KIND), op(Opcode.RETURN_VOID),
                                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 2), new ImmutableInstruction10t(Opcode.GOTO, 1)));
                        featureBranch(code, 2, 10, Opcode.IF_EQZ, 4, 0);
                        featureBranch(code, 11, 4, Opcode.GOTO, 0, 0);
                    }
                    if (fault.contains("-key-")) suggestionKeyWindow(code, fault);
                    if (fault.contains("-reader-")) {
                        List<ImmutableTryBlock> readerTries = suggestionReaderWindow(code, fault);
                        implementation = new ImmutableMethodImplementation(implementation.getRegisterCount(), code, readerTries, implementation.getDebugItems());
                    }
                    if (fault.startsWith("ambiguous-suggestion-parser-") || fault.startsWith("proven-suggestion-parser-") || fault.contains("-slot-source-")) {
                        List<ImmutableTryBlock> sourceTries = suggestionSourceWindow(code, fault, fault.contains("-slot-source-"));
                        implementation = new ImmutableMethodImplementation(implementation.getRegisterCount(), code, sourceTries, implementation.getDebugItems());
                    }
                    if (fault.equals("proven-suggestion-catch") || fault.equals("ambiguous-suggestion-catch")) {
                        code = new ArrayList<>(List.of(direct(method(OBJECT, "<init>", "V"), 1), string(0, "XDTSuggestedUsers"),
                                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 2),
                                invoke(method("Ljava/lang/String;", "valueOf", "Ljava/lang/String;", OBJECT), 3),
                                new ImmutableInstruction10t(Opcode.GOTO, 1), op(Opcode.MOVE_EXCEPTION, 0),
                                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, fault.equals("proven-suggestion-catch") ? 2 : 3),
                                objectField(Opcode.IPUT_OBJECT, 0, 1, FEATURE_RAW, "type", "Ljava/lang/String;"),
                                objectField(Opcode.IPUT_OBJECT, 3, 1, FEATURE_RAW, "label", "Ljava/lang/String;"), op(Opcode.RETURN_VOID)));
                        featureBranch(code, 4, 7, Opcode.GOTO, 0, 0);
                        implementation = new ImmutableMethodImplementation(implementation.getRegisterCount(), code,
                                List.of(tryBlock(6, 3, 10)), implementation.getDebugItems());
                    }
                    for (int n = 0; n < code.size(); n++) {
                        Instruction i = code.get(n);
                        if (!(i instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)) continue;
                        String reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) i).getReference().toString();
                        if (fault.equals("suggestion-parser-slot") && reference.equals(FEATURE_ITEM + "->suggested:" + FEATURE_RAW) && i.getOpcode() == Opcode.IPUT_OBJECT)
                            code.set(n, objectField(Opcode.IPUT_OBJECT, 2, 0, FEATURE_ITEM, "other", FEATURE_RAW));
                        if (fault.equals("ambiguous-suggestion-slot") && reference.equals(FEATURE_ITEM + "->kickstart:" + FEATURE_RAW) && i.getOpcode() == Opcode.IPUT_OBJECT) {
                            code.add(n++, objectField(Opcode.IPUT_OBJECT, 2, 0, FEATURE_ITEM, "other", FEATURE_RAW));
                        }
                        if (fault.equals("ambiguous-suggestion-raw") && reference.equals(FEATURE_RAW + "->label:Ljava/lang/String;") && i.getOpcode() == Opcode.IPUT_OBJECT)
                            code.set(n, objectField(Opcode.IPUT_OBJECT, 0, 1, FEATURE_RAW, "label", "Ljava/lang/String;"));
                        if (fault.equals("ambiguous-suggestion-overwrite") && reference.equals(FEATURE_RAW + "->type:Ljava/lang/String;") && i.getOpcode() == Opcode.IPUT_OBJECT) {
                            code.add(n + 1, string(0, SUGGESTED_WIRE));
                            code.add(n + 2, objectField(Opcode.IPUT_OBJECT, 0, 1, FEATURE_RAW, "type", "Ljava/lang/String;"));
                            n += 2;
                        }
                        if ((fault.startsWith("ambiguous-suggestion-branch-") || fault.equals("proven-suggestion-branch"))
                                && reference.equals(FEATURE_RAW + "->type:Ljava/lang/String;") && i.getOpcode() == Opcode.IPUT_OBJECT) {
                            Instruction alternate = fault.endsWith("-constant") ? string(0, SUGGESTED_WIRE)
                                    : new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, fault.equals("proven-suggestion-branch") ? 2 : 3);
                            code.add(n++, ifEqz(3, 2 + alternate.getCodeUnits()));
                            code.add(n++, alternate);
                        }
                        if (fault.equals("ambiguous-suggestion-active") && reference.equals(FEATURE_ITEM + "->active:" + FEATURE_WRAPPER) && i.getOpcode() == Opcode.IPUT_OBJECT) {
                            code.add(n + 1, objectField(Opcode.IPUT_OBJECT, 9, 0, FEATURE_ITEM, "otherActive", FEATURE_WRAPPER));
                            n++;
                        }
                        if (fault.equals("ambiguous-suggestion-capture-param") && reference.equals(FEATURE_WRAPPER + "->kind:" + FEATURE_KIND) && i.getOpcode() == Opcode.IPUT_OBJECT) {
                            code.add(n + 1, new ImmutableInstruction11n(Opcode.CONST_4, 4, 0));
                            n++;
                        }
                        if (fault.equals("suggestion-wrapper-field") && reference.equals(FEATURE_RAW + "->type:Ljava/lang/String;") && i.getOpcode() == Opcode.IGET_OBJECT)
                            code.set(n, objectField(Opcode.IGET_OBJECT, 0, 4, FEATURE_RAW, "label", "Ljava/lang/String;"));
                    }
                    implementation = new ImmutableMethodImplementation(implementation.getRegisterCount(), code,
                            fault.equals("suggestion-kind-coverage") ? null : implementation.getTryBlocks(), implementation.getDebugItems());
                }
                methods.add(new ImmutableMethod(owner, m.getName(), m.getParameters(), m.getReturnType(), flags,
                        m.getAnnotations(), m.getHiddenApiRestrictions(), implementation));
            }
            classes.set(c, new ImmutableClassDef(owner, original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                    original.getSourceFile(), original.getAnnotations(), fields, methods));
        }
    }

    /** Declaration-only corruption must survive serialization without changing executable code. */
    private static void corruptFeatureMetadata(List<ClassDef> classes, String fault) {
        if (!fault.startsWith("suggestion-meta-")) return;
        boolean classChange = fault.equals("suggestion-meta-class-annotation") || fault.equals("suggestion-meta-source-file");
        boolean fieldChange = fault.startsWith("suggestion-meta-field-") || fault.startsWith("suggestion-meta-capture-");
        boolean parameterChange = fault.startsWith("suggestion-meta-parameter-");
        String owner = classChange || parameterChange || fault.startsWith("suggestion-meta-capture-") ? FEATURE_WRAPPER
                : fieldChange ? FEATURE_RAW : FEATURE_ITEM;
        ImmutableAnnotation marker = new ImmutableAnnotation(AnnotationVisibility.RUNTIME, "Lfixture/MetadataMarker;", List.of());
        ImmutableAnnotation signature = new ImmutableAnnotation(AnnotationVisibility.SYSTEM, "Ldalvik/annotation/Signature;",
                List.of(new ImmutableAnnotationElement("value", new ImmutableArrayEncodedValue(List.of(new ImmutableStringEncodedValue("Ljava/lang/Object;"))))));
        for (int c = 0; c < classes.size(); c++) {
            ClassDef stock = classes.get(c);
            if (!stock.getType().equals(owner)) continue;
            List<ImmutableField> fields = new ArrayList<>();
            for (var field : stock.getFields()) {
                boolean target = fieldChange && field.getName().equals(fault.startsWith("suggestion-meta-capture-") ? "hushthreadsSuggestedUsersRaw" : "type");
                fields.add(new ImmutableField(owner, field.getName(), field.getType(), field.getAccessFlags(), field.getInitialValue(),
                        target && fault.endsWith("-annotation") ? Set.of(marker) : field.getAnnotations(),
                        target && fault.endsWith("-hidden") ? Set.of(HiddenApiRestriction.GREYLIST) : field.getHiddenApiRestrictions()));
            }
            List<Method> methods = new ArrayList<>();
            for (Method m : stock.getMethods()) {
                boolean target = m.getName().equals(parameterChange ? "<init>" : fault.equals("suggestion-meta-never-inline-removal") ? "media" : "kind");
                List<MethodParameter> parameters = new ArrayList<>(m.getParameters());
                if (target && parameterChange) {
                    MethodParameter original = parameters.get(0);
                    Set<? extends Annotation> annotations = fault.endsWith("-annotation") ? Set.of(marker)
                            : fault.endsWith("-signature") ? Set.of(signature) : original.getAnnotations();
                    parameters.set(0, new ImmutableMethodParameter(original.getType(), annotations, fault.endsWith("-name") ? "changed" : original.getName()));
                }
                methods.add(new ImmutableMethod(owner, m.getName(), parameters, m.getReturnType(), m.getAccessFlags(),
                        target && fault.equals("suggestion-meta-never-inline-removal") ? Set.of()
                                : target && fault.equals("suggestion-meta-method-annotation") ? Set.of(marker) : m.getAnnotations(),
                        target && fault.equals("suggestion-meta-method-hidden") ? Set.of(HiddenApiRestriction.GREYLIST) : m.getHiddenApiRestrictions(), m.getImplementation()));
            }
            classes.set(c, new ImmutableClassDef(owner, stock.getAccessFlags(), stock.getSuperclass(), stock.getInterfaces(),
                    fault.equals("suggestion-meta-source-file") ? "Changed.java" : stock.getSourceFile(),
                    fault.equals("suggestion-meta-class-annotation") ? Set.of(marker) : stock.getAnnotations(), fields, methods));
        }
    }

    /** Independent small host shapes. Every faulty build still passes all structural checks. */
    private static List<ClassDef> featureBuild(boolean patched, Set<String> selected, int mask, String fault) {
        List<ClassDef> classes = new ArrayList<>(patched ? good() : clean(cleanHost()));
        boolean ads = patched && selected.contains("hideAds");
        boolean suggestions = patched && selected.contains("hideSuggestedUsers");
        boolean feed = ads || suggestions || fault.equals("omitted-feed-hook");
        boolean links = patched && selected.contains("sanitizeSharingLinks");
        boolean browser = patched && selected.contains("openLinksExternally");
        boolean analytics = patched && selected.contains("disableAnalytics");
        boolean trust = patched && selected.contains("restoreTrust");
        List<Instruction> merge = new ArrayList<>();
        if (feed && !fault.equals("feed-missing")) {
            merge.add(invoke(fault.equals("feed-replaced") ? method("Ljava/util/Collections;", "unmodifiableList", SHORTCUT_LIST, SHORTCUT_LIST) : PAGE_FILTER,
                    fault.equals("feed-register") ? 2 : 6));
            merge.add(op(Opcode.MOVE_RESULT_OBJECT, fault.equals("feed-register") ? 2 : 6));
            if (fault.equals("feed-duplicate")) {
                merge.add(invoke(PAGE_FILTER, 6));
                merge.add(op(Opcode.MOVE_RESULT_OBJECT, 6));
            }
        }
        merge.add(type(Opcode.CHECK_CAST, 2, FEATURE_ITEM));
        merge.add(virtual(ITEM_MEDIA, 2));
        merge.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        merge.add(type(Opcode.NEW_INSTANCE, 0, FEATURE_LAMBDA));
        merge.add(direct(method(FEATURE_LAMBDA, "<init>", "V"), 0));
        merge.add(op(Opcode.RETURN_OBJECT, 0));
        classes.add(featureClass(FEATURE_CACHE, OBJECT, List.of(), define(FEATURE_CACHE, "merge", OBJECT, false,
                body(10, merge.toArray(new Instruction[0])), SHORTCUT_LIST, "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;",
                SHORTCUT_LIST, OBJECT, "Lkotlin/jvm/functions/Function3;", "Z")));
        classes.add(featureClass(FEATURE_LAMBDA, OBJECT, List.of(), define(FEATURE_LAMBDA, "<init>", "V", false,
                body(1, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)))));
        classes.add(featureClass(FEATURE_ITEM, OBJECT, List.of(featureField(FEATURE_ITEM, "kind", FEATURE_KIND),
                featureField(FEATURE_ITEM, "suggested", FEATURE_RAW), featureField(FEATURE_ITEM, "kickstart", FEATURE_RAW), featureField(FEATURE_ITEM, "other", FEATURE_RAW),
                featureField(FEATURE_ITEM, "active", FEATURE_WRAPPER), featureField(FEATURE_ITEM, "otherActive", FEATURE_WRAPPER)),
                neverInline(define(FEATURE_ITEM, "media", FEATURE_MEDIA, false, body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)))),
                define(FEATURE_ITEM, "kind", FEATURE_KIND, false, body(2, List.of(tryBlock(0, 4, 5)), string(0, "feedItemType"),
                        objectField(Opcode.IGET_OBJECT, 0, 1, FEATURE_ITEM, "kind", FEATURE_KIND), op(Opcode.RETURN_OBJECT, 0),
                        op(Opcode.MOVE_EXCEPTION, 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0))),
                define(FEATURE_ITEM, "<init>", "V", false, body(1, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)))));
        classes.addAll(suggestionStock());
        classes.add(featureClass("Lfixture/AdFlag;", OBJECT, List.of(), define("Lfixture/AdFlag;", "injected", "Z", true,
                body(2, new ImmutableInstruction31i(Opcode.CONST, 0, 0x8669a9b0),
                        new ImmutableInstruction31i(Opcode.CONST, 0, "injected".hashCode()),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), OBJECT)));
        classes.add(featureClass(FEATURE_MEDIA, OBJECT, List.of(),
                define(FEATURE_MEDIA, "sponsored", "Z", false, body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), invoke(INJECTED_AD, 0), op(Opcode.MOVE_RESULT, 0), op(Opcode.RETURN, 0))),
                define(FEATURE_MEDIA, "other", "Z", false, fault.equals("ad-discarded") ? body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), invoke(INJECTED_AD, 0), op(Opcode.MOVE_RESULT, 0),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0))
                        : body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0))),
                pandoGetter(FEATURE_MEDIA, "code", "Ljava/lang/String;", "code"),
                pandoGetter(FEATURE_MEDIA, "title", "Ljava/lang/String;", "caption"),
                pandoGetter(FEATURE_MEDIA, "author", FEATURE_USER, "user")));

        List<Instruction> parser = new ArrayList<>(List.of(string(2, "permalink"), string(0, "XDTPermalinkResponse"),
                type(Opcode.NEW_INSTANCE, 1, FEATURE_RESPONSE),
                direct(method(FEATURE_PARENT, "<init>", "V", "Ljava/lang/String;"), 1, 0)));
        if (links && !fault.equals("link-missing")) {
            parser.add(invoke(fault.equals("link-replaced") ? method("Ljava/lang/String;", "valueOf", "Ljava/lang/String;", OBJECT) : LINK_SANITIZER,
                    fault.equals("link-register") ? 0 : 2));
            parser.add(op(Opcode.MOVE_RESULT_OBJECT, fault.equals("link-register") ? 0 : 2));
        }
        parser.add(objectField(Opcode.IPUT_OBJECT, 2, 1, FEATURE_RESPONSE, "url", "Ljava/lang/String;"));
        parser.add(op(Opcode.RETURN_OBJECT, 1));
        classes.add(featureClass("Lfixture/PermalinkParser;", OBJECT, List.of(), define("Lfixture/PermalinkParser;", "unsafeParseFromJson", OBJECT, true,
                body(3, parser.toArray(new Instruction[0])))));
        classes.add(featureClass(FEATURE_RESPONSE, FEATURE_PARENT, List.of(featureField(FEATURE_RESPONSE, "url", "Ljava/lang/String;")),
                define(FEATURE_RESPONSE, "link", "Ljava/lang/String;", false, body(2,
                        objectField(Opcode.IGET_OBJECT, 0, 1, FEATURE_RESPONSE, "url", "Ljava/lang/String;"), op(Opcode.RETURN_OBJECT, 0)))));

        // The share sheet's fetch: two reads of the response's link, then the post stored with both.
        List<Instruction> fetch = new ArrayList<>(List.of(string(0, "itas-android"),
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 8), type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE),
                virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 2)));
        if (links && !fault.equals("post-link-missing")) fetch.addAll(postLinkHook(2, fault));
        fetch.addAll(List.of(virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 4)));
        if (links && !fault.equals("post-link-missing")) fetch.addAll(postLinkHook(4, fault));
        fetch.addAll(List.of(type(Opcode.NEW_INSTANCE, 1, FEATURE_SHARE), direct(method(FEATURE_SHARE, "<init>", "V"), 1),
                objectField(Opcode.IPUT_OBJECT, 4, 1, FEATURE_SHARE, "raw", "Ljava/lang/String;"),
                objectField(Opcode.IPUT_OBJECT, 2, 1, FEATURE_SHARE, "link", "Ljava/lang/String;"),
                objectField(Opcode.IPUT_OBJECT, 7, 1, FEATURE_SHARE, "post", FEATURE_MEDIA), op(Opcode.RETURN_OBJECT, 1)));
        classes.add(featureClass(FEATURE_REPOSITORY, OBJECT, List.of(), define(FEATURE_REPOSITORY, "fetch", OBJECT, false,
                body(10, fetch.toArray(new Instruction[0])), OBJECT, FEATURE_MEDIA, OBJECT, OBJECT),
                define(FEATURE_REPOSITORY, "plain", OBJECT, false, body(6, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)),
                        OBJECT, FEATURE_MEDIA, OBJECT, OBJECT)));
        classes.add(featureClass(FEATURE_SHARE, OBJECT, List.of(featureField(FEATURE_SHARE, "raw", "Ljava/lang/String;"),
                featureField(FEATURE_SHARE, "link", "Ljava/lang/String;"), featureField(FEATURE_SHARE, "post", FEATURE_MEDIA)),
                define(FEATURE_SHARE, "<init>", "V", false, body(1, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)))));
        // Copy link: an object holding its post in one post field reads the response's link itself.
        // v0..v7 locals, this in v8 and the response in v9; the hook takes the post into v7.
        List<Instruction> copied = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 9),
                type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE), virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 2)));
        if (links && !fault.equals("holder-link-missing")) {
            copied.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 7, fault.equals("holder-link-receiver") ? 9 : 8));
            copied.add(objectField(Opcode.IGET_OBJECT, 7, 7, fault.equals("holder-link-field") ? FEATURE_SHARE : FEATURE_HOLDER, "post", FEATURE_MEDIA));
            // The holder-post-link faults break only this copy of the hook, so the fetch's passes first.
            copied.addAll(postLinkHook(2, fault.startsWith("holder-post-link-") ? fault.substring("holder-".length()) : fault));
        }
        copied.add(op(Opcode.RETURN_OBJECT, 2));
        classes.add(featureClass(FEATURE_HOLDER, OBJECT, List.of(featureField(FEATURE_HOLDER, "post", FEATURE_MEDIA)),
                define(FEATURE_HOLDER, "copied", OBJECT, false, body(10, copied.toArray(new Instruction[0])), OBJECT)));
        // Send: a static use case hands the plain fetch its post and its continuation, then reads the
        // link after resuming without the post. v0..v7 locals, the use case in v8, the post in v9 and
        // the continuation in v10, copied into v5.
        List<Instruction> send = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 5, 10),
                type(Opcode.NEW_INSTANCE, 2, FEATURE_REPOSITORY)));
        if (links && !fault.equals("resume-remember-missing")) send.add(invoke(POST_KEEPER, fault.equals("resume-remember-key") ? 8 : 5, 9));
        send.addAll(List.of(virtual(PLAIN_FETCH, 2, 8, 9, 8, 5), op(Opcode.MOVE_RESULT_OBJECT, 3),
                type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE), virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 4)));
        if (links && !fault.equals("resume-recall-missing")) send.addAll(recallHook(5, 4, fault, "resume-"));
        send.add(op(Opcode.RETURN_OBJECT, 4));
        classes.add(featureClass(FEATURE_SEND, OBJECT, List.of(), define(FEATURE_SEND, "send", OBJECT, true,
                body(11, send.toArray(new Instruction[0])), FEATURE_SEND, FEATURE_MEDIA, OBJECT)));
        // Quick sends: a coroutine body takes its post out of its own Object field and empties the
        // field before it waits, in one case of a switch. v0..v7 locals, this in v8 and the resumed
        // result in v9.
        List<Instruction> quick = new ArrayList<>(List.of(objectField(Opcode.IGET_OBJECT, 6, 8, FEATURE_QUICK, "post", OBJECT),
                type(Opcode.CHECK_CAST, 6, FEATURE_MEDIA)));
        if (links && !fault.equals("quick-remember-missing")) quick.add(invoke(POST_KEEPER, 8, fault.equals("quick-remember-post") ? 9 : 6));
        quick.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 5, 0), objectField(Opcode.IPUT_OBJECT, 5, 8, FEATURE_QUICK, "post", OBJECT),
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 9), type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE),
                virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 2)));
        if (links && !fault.equals("quick-recall-missing")) quick.addAll(recallHook(8, 2, fault, "quick-"));
        quick.add(op(Opcode.RETURN_OBJECT, 2));
        classes.add(featureClass(FEATURE_QUICK, OBJECT, List.of(featureField(FEATURE_QUICK, "post", OBJECT)),
                define(FEATURE_QUICK, "invokeSuspend", OBJECT, false, body(10, switched(quick)), OBJECT)));
        classes.add(featureClass(FEATURE_USER, OBJECT, List.of(), pandoGetter(FEATURE_USER, "username", "Ljava/lang/String;", "username")));
        classes.add(featureClass(FEATURE_PARENT, OBJECT, List.of(), define(FEATURE_PARENT, "<init>", "V", false,
                body(2, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), "Ljava/lang/String;")));

        List<Instruction> launcher = new ArrayList<>();
        if (browser && !fault.equals("browser-missing")) {
            launcher.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 3));
            launcher.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, fault.equals("browser-register") ? 9 : 10));
            launcher.add(invoke(LINK_OPENER, 0, 1));
            int result = fault.equals("browser-clobber") ? 4 : 0;
            launcher.add(op(Opcode.MOVE_RESULT, result));
            // Past the hook's return-void to the stock's first instruction, or straight to its return.
            launcher.add(ifEqz(result, fault.equals("browser-bypass") ? 12 : 3));
            launcher.add(op(Opcode.RETURN_VOID));
        }
        launcher.addAll(List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 10), type(Opcode.NEW_INSTANCE, 1, "Ljava/net/URI;"),
                direct(method("Ljava/net/URI;", "<init>", "V", "Ljava/lang/String;"), 1, 2), string(0, LAUNCHER_MESSAGE), op(Opcode.RETURN_VOID)));
        classes.add(featureClass("Lfixture/BrowserLauncher;", OBJECT, List.of(), define("Lfixture/BrowserLauncher;", "launch", "V", true,
                body(12, launcher.toArray(new Instruction[0])), CONTEXT, OBJECT, OBJECT, OBJECT,
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", OBJECT)));

        List<Instruction> pigeon = new ArrayList<>(List.of(string(0, "/pigeon_nest"), string(1, "/logging_client_events"),
                ifEqz(3, fault.equals("pigeon-bypass") ? 6 : 2)));
        if (fault.equals("default-coverage-missing")) {
            pigeon.add(2, string(1, "https://graph.facebook.com/logging_client_events"));
            pigeon.add(3, op(Opcode.NOP));
        }
        if (analytics && (mask & 1) != 0 && !fault.equals("pigeon-missing")) {
            pigeon.add(invoke(fault.equals("pigeon-replaced") ? method("Ljava/lang/String;", "valueOf", "Ljava/lang/String;", OBJECT) : ANALYTICS_ENDPOINT, 0));
            pigeon.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        }
        pigeon.add(op(Opcode.RETURN_OBJECT, 0));
        classes.add(featureClass("Lfixture/Pigeon;", OBJECT, List.of(), define("Lfixture/Pigeon;", "address", "Ljava/lang/String;", true,
                body(4, pigeon.toArray(new Instruction[0])), "Ljava/lang/String;", "Z")));
        List<Instruction> defaults = new ArrayList<>(List.of(string(0, "https://graph.facebook.com/logging_client_events")));
        if (fault.equals("default-coverage-missing")) defaults.add(op(Opcode.NOP));
        if (analytics && (mask & 2) != 0 && !fault.equals("default-missing") && !fault.equals("default-coverage-missing")) {
            defaults.add(invoke(ANALYTICS_ENDPOINT, 0));
            defaults.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        }
        defaults.add(op(Opcode.RETURN_OBJECT, 0));
        classes.add(featureClass("Lfixture/DefaultAddress;", OBJECT, List.of(), define("Lfixture/DefaultAddress;", "get", "Ljava/lang/String;", true,
                body(1, defaults.toArray(new Instruction[0])))));
        List<Instruction> mqtt = new ArrayList<>(List.of(direct(method(OBJECT, "<init>", "V"), 2),
                string(0, "analytics_endpoint"), string(1, "https://graph.facebook.com/logging_client_events"),
                virtual(method("Lorg/json/JSONObject;", "optString", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"), 3, 0, 1),
                op(Opcode.MOVE_RESULT_OBJECT, 0)));
        if (analytics && (mask & 4) != 0 && !fault.equals("mqtt-missing")) {
            mqtt.add(invoke(ANALYTICS_ENDPOINT, 0));
            mqtt.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        }
        mqtt.add(objectField(Opcode.IPUT_OBJECT, 0, 2, "Lfixture/Mqtt;", "endpoint", "Ljava/lang/String;"));
        mqtt.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass("Lfixture/Mqtt;", OBJECT, List.of(featureField("Lfixture/Mqtt;", "endpoint", "Ljava/lang/String;")),
                define("Lfixture/Mqtt;", "<init>", "V", false, body(4, mqtt.toArray(new Instruction[0])), "Lorg/json/JSONObject;")));

        List<Instruction> signers = new ArrayList<>();
        if (trust && !fault.equals("trust-missing")) {
            signers.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 5));
            signers.add(objectField(Opcode.IGET_OBJECT, 0, 0, SIGNER_HOST, "info", PACKAGE_INFO));
            signers.add(invoke(fault.equals("trust-replaced") ? method("Ljava/util/Collections;", "singletonList", SHORTCUT_LIST, OBJECT) : ORIGINAL_SIGNERS, 0));
            signers.add(op(Opcode.MOVE_RESULT_OBJECT, 1));
            signers.add(ifEqz(1, fault.equals("trust-fallback") ? 27 : 9));
            signers.add(type(Opcode.NEW_INSTANCE, 0, SIGNER_RESULT));
            signers.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
            signers.add(direct(method(SIGNER_RESULT, "<init>", "V", SHORTCUT_LIST, "Z", "Z"), 0, 1, 2, 2));
            signers.add(op(Opcode.RETURN_OBJECT, 0));
        }
        signers.addAll(List.of(objectField(Opcode.IGET_OBJECT, 0, 5, SIGNER_HOST, "info", PACKAGE_INFO),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signingInfo", "Landroid/content/pm/SigningInfo;"),
                virtual(method("Landroid/content/pm/SigningInfo;", "getApkContentsSigners", "[Landroid/content/pm/Signature;"), 1),
                op(Opcode.MOVE_RESULT_OBJECT, 1),
                objectField(Opcode.IGET_OBJECT, 0, 5, SIGNER_HOST, "info", PACKAGE_INFO),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signingInfo", "Landroid/content/pm/SigningInfo;"),
                virtual(method("Landroid/content/pm/SigningInfo;", "getSigningCertificateHistory", "[Landroid/content/pm/Signature;"), 1),
                op(Opcode.MOVE_RESULT_OBJECT, 1),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signatures", "[Landroid/content/pm/Signature;"),
                type(Opcode.NEW_INSTANCE, 0, SIGNER_RESULT), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                direct(method(SIGNER_RESULT, "<init>", "V", SHORTCUT_LIST, "Z", "Z"), 0, 1, 2, 2), op(Opcode.RETURN_OBJECT, 0)));
        classes.add(featureClass(SIGNER_HOST, OBJECT, List.of(featureField(SIGNER_HOST, "info", PACKAGE_INFO)),
                define(SIGNER_HOST, "read", SIGNER_RESULT, false, body(6, signers.toArray(new Instruction[0])))));
        classes.add(featureClass(SIGNER_RESULT, OBJECT, List.of(), define(SIGNER_RESULT, "<init>", "V", false,
                body(4, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), SHORTCUT_LIST, "Z", "Z")));
        if (fault.startsWith("ambiguous-suggestion-") || fault.startsWith("proven-suggestion-")) corruptSuggestionStock(classes, fault);
        if (!patched) return classes;

        List<Method> flags = new ArrayList<>();
        for (String flag : List.of("hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust")) {
            if ((fault.equals("status-missing") || fault.equals("historical-missing-ad-status")) && flag.equals("hideAds")) continue;
            // The published bundles came before Open links in browser.
            if (fault.startsWith("historical") && flag.equals("openLinksExternally")) continue;
            if ((fault.equals("suggestion-status-missing") || fault.startsWith("historical")) && flag.equals("hideSuggestedUsers")) continue;
            boolean enabled = selected.contains(flag) && !(fault.equals("status-false") && flag.equals("hideAds"));
            if (fault.equals("suggestion-status-false") && flag.equals("hideSuggestedUsers")) enabled = false;
            List<Instruction> status = new ArrayList<>();
            if (enabled) status.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), op(Opcode.RETURN, 0)));
            status.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)));
            flags.add(define(FEATURE_STATUS, flag, "Z", true, body(1, status.toArray(new Instruction[0]))));
        }
        flags.add(define(FEATURE_STATUS, "analyticsAddressMask", "I", true, body(1,
                new ImmutableInstruction21s(Opcode.CONST_16, 0, analytics ? mask : 0), op(Opcode.RETURN, 0))));
        classes.add(featureClass(FEATURE_STATUS, OBJECT, List.of(), flags.toArray(new Method[0])));
        ImmutableMethodImplementation getter = body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0));
        if ((feed || fault.equals("omitted-item-getter")) && !fault.equals("item-stub")) getter = body(2,
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 1, new ImmutableTypeReference(FEATURE_ITEM)), ifEqz(0, 9),
                type(Opcode.CHECK_CAST, 1, FEATURE_ITEM), virtual(ITEM_MEDIA, 1), op(Opcode.MOVE_RESULT_OBJECT, 0),
                op(Opcode.RETURN_OBJECT, 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0));
        ImmutableMethodImplementation adCheck = ads ? body(2, type(Opcode.CHECK_CAST, 1, FEATURE_MEDIA),
                virtual(fault.equals("ad-target") || fault.equals("ad-discarded") ? method(FEATURE_MEDIA, "other", "Z") : MEDIA_AD, 1), op(Opcode.MOVE_RESULT, 0), op(Opcode.RETURN, 0))
                : body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0));
        classes.add(featureClass(FEATURE_ADS, OBJECT, List.of(),
                define(FEATURE_ADS, "filter", SHORTCUT_LIST, true, body(1, op(Opcode.RETURN_OBJECT, 0)), SHORTCUT_LIST),
                define(FEATURE_ADS, "itemMedia", OBJECT, true, getter, OBJECT), define(FEATURE_ADS, "isAd", "Z", true, adCheck, OBJECT),
                define(FEATURE_ADS, "isSuggestedUserItem", "Z", true,
                        fault.equals("omitted-suggestion-predicate") ? body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), op(Opcode.RETURN, 0))
                                : suggestions ? suggestionPredicate(fault) : body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), OBJECT)));
        classes.add(featureClass(FEATURE_ANALYTICS, OBJECT, List.of(), define(FEATURE_ANALYTICS, "endpoint", "Ljava/lang/String;", true,
                body(1, op(Opcode.RETURN_OBJECT, 0)), "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_LINKS, OBJECT, List.of(), define(FEATURE_LINKS, "sanitizeShared", "Ljava/lang/String;", true,
                body(1, op(Opcode.RETURN_OBJECT, 0)), "Ljava/lang/String;"),
                define(FEATURE_LINKS, "postLink", "Ljava/lang/String;", true, body(3, op(Opcode.RETURN_OBJECT, 0)),
                        "Ljava/lang/String;", OBJECT, "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_BROWSER, OBJECT, List.of(), define(FEATURE_BROWSER, "open", "Z", true,
                body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), CONTEXT, "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_TRUST, OBJECT, List.of(), define(FEATURE_TRUST, "originalSigners", SHORTCUT_LIST, true,
                body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)), PACKAGE_INFO)));
        if (patched && (fault.equals("ad-body") || fault.equals("ad-helper-body") || fault.equals("getter-body")
                || fault.equals("ad-helper-native") || fault.equals("getter-static"))) {
            String owner = fault.equals("ad-body") ? FEATURE_MEDIA : fault.startsWith("ad-helper-") ? "Lfixture/AdFlag;" : FEATURE_ITEM;
            String name = fault.equals("ad-body") ? "sponsored" : fault.startsWith("ad-helper-") ? "injected" : "media";
            for (int c = 0; c < classes.size(); c++) {
                ClassDef original = classes.get(c);
                if (!original.getType().equals(owner)) continue;
                List<Method> methods = new ArrayList<>();
                for (Method method : original.getMethods()) {
                    boolean target = method.getName().equals(name);
                    MethodImplementation implementation = target && fault.endsWith("-body")
                            ? body(method.getImplementation().getRegisterCount(), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                                    op(method.getReturnType().equals("Z") ? Opcode.RETURN : Opcode.RETURN_OBJECT, 0))
                            : method.getImplementation();
                    // The getter already returns null; an extra no-op still makes the body substitution observable.
                    if (fault.equals("getter-body") && method.getName().equals(name)) implementation = body(2,
                            op(Opcode.NOP), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0));
                    int accessFlags = method.getAccessFlags();
                    if (target && fault.equals("getter-static")) accessFlags |= AccessFlags.STATIC.getValue();
                    if (target && fault.equals("ad-helper-native")) {
                        accessFlags |= AccessFlags.NATIVE.getValue();
                        implementation = null;
                    }
                    methods.add(new ImmutableMethod(owner, method.getName(), method.getParameters(), method.getReturnType(),
                            accessFlags, method.getAnnotations(), method.getHiddenApiRestrictions(), implementation));
                }
                classes.set(c, featureClass(owner, original.getSuperclass(), List.of(), methods.toArray(new Method[0])));
            }
        }
        if (suggestions) captureSuggestionRaw(classes, fault);
        if (!fault.startsWith("ambiguous-suggestion-") && !fault.startsWith("proven-suggestion-")) corruptSuggestionStock(classes, fault);
        corruptFeatureMetadata(classes, fault);
        return classes;
    }

    private static void omitFeatureStatus(List<ClassDef> classes, String feature, boolean remove) {
        for (int c = 0; c < classes.size(); c++) {
            ClassDef original = classes.get(c);
            if (!original.getType().equals(FEATURE_STATUS)) continue;
            List<Method> methods = new ArrayList<>();
            for (Method m : original.getMethods()) {
                if (!m.getName().equals(feature)) methods.add(m);
                else if (!remove) methods.add(new ImmutableMethod(FEATURE_STATUS, m.getName(), m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                        m.getAnnotations(), m.getHiddenApiRestrictions(), body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0))));
            }
            classes.set(c, new ImmutableClassDef(original.getType(), original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                    original.getSourceFile(), original.getAnnotations(), original.getFields(), methods));
        }
    }

    /** A real return wrapper must preserve the stock protected span and ordered catch targets. */
    private static List<ClassDef> featureExceptionBuild(boolean patched, String fault) {
        boolean split = fault.startsWith("split");
        List<ClassDef> classes = featureBuild(patched, Set.of("disableAnalytics"), 1, "");
        List<Instruction> original = List.of(string(0, "/pigeon_nest"), string(1, "/logging_client_events"),
                invoke(method("Ljava/lang/String;", "valueOf", "Ljava/lang/String;", OBJECT), 2),
                op(Opcode.MOVE_RESULT_OBJECT, 0), op(Opcode.RETURN_OBJECT, 0),
                op(Opcode.MOVE_EXCEPTION, 0), string(0, "first catch"), op(Opcode.RETURN_OBJECT, 0),
                op(Opcode.MOVE_EXCEPTION, 0), string(0, "second catch"), op(Opcode.RETURN_OBJECT, 0));
        List<Instruction> code = new ArrayList<>();
        int[] addresses = new int[original.size()];
        int address = 0;
        for (int i = 0; i < original.size(); i++) {
            if (split && i == 4) for (int n = 0; n < 65530; n++) {
                code.add(op(Opcode.NOP));
                address++;
            }
            addresses[i] = address;
            if (patched && original.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
                code.add(invoke(ANALYTICS_ENDPOINT, 0));
                code.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
                address += 4;
            }
            code.add(original.get(i));
            address += original.get(i).getCodeUnits();
        }
        List<ImmutableExceptionHandler> handlers = List.of(
                new ImmutableExceptionHandler(fault.equals("type") ? "Ljava/lang/IllegalArgumentException;" : "Ljava/io/IOException;",
                        addresses[fault.equals("target") ? 8 : 5]),
                new ImmutableExceptionHandler("Ljava/lang/RuntimeException;", addresses[8]),
                new ImmutableExceptionHandler(null, addresses[fault.equals("target") ? 5 : 8]));
        if (fault.equals("order")) handlers = List.of(handlers.get(1), handlers.get(0), handlers.get(2));
        int end = fault.equals("range") ? addresses[3] : addresses[5];
        List<ImmutableTryBlock> ranges = split && patched
                ? List.of(new ImmutableTryBlock(addresses[2], 32767, handlers),
                        new ImmutableTryBlock(addresses[2] + 32768, end - addresses[2] - 32768, handlers))
                : List.of(new ImmutableTryBlock(addresses[2], end - addresses[2], handlers));
        Method addressMethod = define("Lfixture/Pigeon;", "address", "Ljava/lang/String;", true,
                new ImmutableMethodImplementation(4, code, ranges, null), "Ljava/lang/String;", "Z");
        for (int c = 0; c < classes.size(); c++) if (classes.get(c).getType().equals("Lfixture/Pigeon;")) {
            classes.set(c, featureClass("Lfixture/Pigeon;", OBJECT, List.of(), addressMethod));
        }
        return classes;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("usage: BadDexFixture <outDir>");
            System.exit(2);
        }
        File out = new File(args[0]);
        if (!out.isDirectory() && !out.mkdirs()) throw new IllegalStateException("Cannot create " + out);

        Map<String, List<ClassDef>> dexes = new LinkedHashMap<>();
        Set<String> allFeatures = Set.of("hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust");
        dexes.put("features-clean", featureBuild(false, Set.of(), 0, ""));
        dexes.put("features-good", featureBuild(true, allFeatures, 7, ""));
        dexes.put("features-omitted", featureBuild(true, Set.of(), 0, ""));
        for (String feature : allFeatures) dexes.put("features-only-" + feature, featureBuild(true, Set.of(feature), 7, ""));
        for (int mask = 1; mask <= 7; mask++) dexes.put("features-mask-" + mask, featureBuild(true, Set.of("disableAnalytics"), mask, ""));
        for (String fault : List.of("feed-missing", "feed-replaced", "feed-register", "feed-duplicate", "item-stub", "ad-target", "ad-discarded", "ad-body", "ad-helper-body", "getter-body", "ad-helper-native", "getter-static",
                "link-missing", "link-replaced", "link-register", "post-link-missing", "post-link-register", "post-link-getter", "post-link-bypass",
                "holder-link-missing", "holder-link-receiver", "holder-link-field", "holder-post-link-register", "holder-post-link-bypass",
                "resume-remember-missing", "resume-remember-key", "resume-recall-missing", "resume-recall-key", "resume-recall-cast",
                "resume-post-link-bypass", "quick-remember-missing", "quick-remember-post", "quick-recall-key", "quick-post-link-bypass",
                "browser-missing", "browser-register", "browser-bypass", "browser-clobber",
                "pigeon-missing", "pigeon-replaced", "pigeon-bypass",
                "default-missing", "mqtt-missing", "trust-missing", "trust-replaced", "trust-fallback", "status-missing", "status-false")) {
            dexes.put("features-bad-" + fault, featureBuild(true, allFeatures, 7, fault));
        }
        for (String fault : List.of("suggestion-stub", "suggestion-media-guard", "suggestion-type-guard", "suggestion-null-guard",
                "suggestion-item-missing", "suggestion-media-missing", "suggestion-type-missing", "suggestion-null-missing",
                "suggestion-enum", "suggestion-slot", "suggestion-kickstart-slot", "suggestion-raw", "suggestion-wire", "suggestion-kickstart-wire",
                "suggestion-register", "suggestion-branch", "suggestion-false", "suggestion-extra-call", "suggestion-active-slot", "suggestion-owned-raw",
                "suggestion-wrapper-missing", "suggestion-identity-missing", "suggestion-identity-guard",
                "suggestion-capture-missing", "suggestion-capture-register", "suggestion-capture-field", "suggestion-capture-duplicate",
                "suggestion-capture-bypass", "suggestion-capture-flags", "suggestion-capture-field-missing",
                "suggestion-parser-body", "suggestion-parser-slot", "suggestion-raw-parser-body", "suggestion-model-body", "suggestion-enum-body",
                "suggestion-wrapper-body", "suggestion-wrapper-field", "suggestion-kind-body", "suggestion-kind-flags", "suggestion-kind-coverage",
                "suggestion-model-field", "suggestion-status-missing", "suggestion-status-false")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, fault));
        }
        for (String fault : List.of("ambiguous-suggestion-slot", "ambiguous-suggestion-raw", "ambiguous-suggestion-overwrite", "ambiguous-suggestion-active", "ambiguous-suggestion-capture-param",
                "ambiguous-suggestion-branch-constant", "ambiguous-suggestion-branch-parameter", "ambiguous-suggestion-catch",
                "ambiguous-suggestion-parser-constant", "ambiguous-suggestion-parser-parameter", "ambiguous-suggestion-parser-loop", "ambiguous-suggestion-parser-catch",
                "ambiguous-suggestion-slot-source-new", "ambiguous-suggestion-slot-source-other", "ambiguous-suggestion-slot-source-catch",
                "ambiguous-suggestion-users-key-constant", "ambiguous-suggestion-users-key-null", "ambiguous-suggestion-kickstart-key-constant", "ambiguous-suggestion-kickstart-key-null",
                "ambiguous-suggestion-raw-key-constant", "ambiguous-suggestion-raw-key-null", "ambiguous-suggestion-map-key-constant", "ambiguous-suggestion-map-key-null",
                "ambiguous-suggestion-null-bypass-map-key-constant", "ambiguous-suggestion-null-bypass-map-key-null",
                "ambiguous-suggestion-users-reader-bypass", "ambiguous-suggestion-kickstart-reader-bypass", "ambiguous-suggestion-raw-reader-bypass",
                "ambiguous-suggestion-raw-reader-catch-bypass", "ambiguous-suggestion-users-reader-input-other", "ambiguous-suggestion-users-reader-input-null",
                "ambiguous-suggestion-kickstart-reader-input-other", "ambiguous-suggestion-kickstart-reader-input-null",
                "ambiguous-suggestion-raw-reader-input-other", "ambiguous-suggestion-raw-reader-input-null")) {
            dexes.put("features-" + fault + "-clean", featureBuild(false, Set.of(), 0, fault));
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, fault));
        }
        for (String proof : List.of("proven-suggestion-branch", "proven-suggestion-catch", "proven-suggestion-parser-absent", "proven-suggestion-parser-null",
                "proven-suggestion-parser-copy", "proven-suggestion-parser-loop", "proven-suggestion-parser-catch",
                "proven-suggestion-slot-source-null", "proven-suggestion-slot-source-copy", "proven-suggestion-slot-source-loop", "proven-suggestion-slot-source-catch",
                "proven-suggestion-users-key-copy", "proven-suggestion-users-key-branch", "proven-suggestion-kickstart-key-copy", "proven-suggestion-kickstart-key-branch",
                "proven-suggestion-raw-key-copy", "proven-suggestion-raw-key-branch", "proven-suggestion-map-key-copy", "proven-suggestion-map-key-branch",
                "proven-suggestion-map-null-bypass", "proven-suggestion-null-bypass-map-key-copy", "proven-suggestion-null-bypass-map-key-branch",
                "proven-suggestion-users-reader-gated", "proven-suggestion-kickstart-reader-gated", "proven-suggestion-raw-reader-gated", "proven-suggestion-raw-reader-catch-gated",
                "proven-suggestion-users-reader-input-copy", "proven-suggestion-users-reader-input-branch",
                "proven-suggestion-kickstart-reader-input-copy", "proven-suggestion-kickstart-reader-input-branch",
                "proven-suggestion-raw-reader-input-copy", "proven-suggestion-raw-reader-input-branch")) {
            dexes.put("features-" + proof + "-clean", featureBuild(false, Set.of(), 0, proof));
            dexes.put("features-" + proof, featureBuild(true, Set.of("hideSuggestedUsers"), 0, proof));
        }
        dexes.put("features-structure-marker", List.of(featureClass("Lapp/morphe/fixture/StructureMarker;", OBJECT, List.of(),
                define("Lapp/morphe/fixture/StructureMarker;", "present", "V", true, body(0, op(Opcode.RETURN_VOID))))));
        for (String fault : List.of("suggestion-meta-class-annotation", "suggestion-meta-source-file", "suggestion-meta-field-annotation", "suggestion-meta-field-hidden",
                "suggestion-meta-method-annotation", "suggestion-meta-method-hidden", "suggestion-meta-parameter-annotation", "suggestion-meta-parameter-name",
                "suggestion-meta-parameter-signature", "suggestion-meta-capture-annotation", "suggestion-meta-capture-hidden", "suggestion-meta-never-inline-removal")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, fault));
        }
        List<ClassDef> metadataStock = featureBuild(false, Set.of(), 0, ""), metadataPatched = featureBuild(true, Set.of("hideSuggestedUsers"), 0, "");
        for (String metadata : List.of("suggestion-meta-class-annotation", "suggestion-meta-source-file", "suggestion-meta-field-annotation", "suggestion-meta-method-annotation",
                "suggestion-meta-parameter-name", "suggestion-meta-parameter-signature")) {
            corruptFeatureMetadata(metadataStock, metadata);
            corruptFeatureMetadata(metadataPatched, metadata);
        }
        dexes.put("features-metadata-clean", metadataStock);
        dexes.put("features-metadata-good", metadataPatched);
        for (String feature : List.of("hideAds", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust")) {
            List<ClassDef> unselected = featureBuild(true, Set.of("hideSuggestedUsers", feature), 7, "");
            omitFeatureStatus(unselected, feature, false);
            dexes.put("features-bad-omitted-" + feature, unselected);
        }
        for (String fault : List.of("omitted-suggestion-predicate", "omitted-suggestion-capture", "omitted-suggestion-constructor", "omitted-suggestion-parser", "omitted-suggestion-missing-status-capture")) {
            List<ClassDef> unselected = featureBuild(true, Set.of("hideAds"), 0, fault);
            if (fault.contains("capture")) captureSuggestionRaw(unselected, "");
            if (fault.endsWith("constructor")) corruptSuggestionStock(unselected, "suggestion-wrapper-body");
            if (fault.endsWith("parser")) corruptSuggestionStock(unselected, "suggestion-raw-parser-body");
            if (fault.contains("missing-status")) omitFeatureStatus(unselected, "hideSuggestedUsers", true);
            dexes.put("features-bad-" + fault, unselected);
        }
        for (String fault : List.of("omitted-feed-hook", "omitted-item-getter")) dexes.put("features-bad-" + fault, featureBuild(true, Set.of(), 0, fault));
        Set<String> historical = Set.of("hideAds", "sanitizeSharingLinks", "disableAnalytics", "restoreTrust");
        dexes.put("features-historical", featureBuild(true, historical, 7, "historical"));
        dexes.put("features-historical-missing-ad-status", featureBuild(true, historical, 7, "historical-missing-ad-status"));
        dexes.put("features-suggestion-copy", featureBuild(true, Set.of("hideSuggestedUsers"), 0, "").stream()
                .filter(cd -> cd.getType().equals(FEATURE_ADS)).toList());
        dexes.put("features-bad-zero-mask", featureBuild(true, allFeatures, 0, ""));
        dexes.put("features-bad-unknown-mask", featureBuild(true, allFeatures, 8, ""));
        dexes.put("features-no-default-clean", featureBuild(false, Set.of(), 0, "default-coverage-missing"));
        dexes.put("features-no-default-pigeon", featureBuild(true, Set.of("disableAnalytics"), 1, "default-coverage-missing"));
        dexes.put("features-bad-default-coverage", featureBuild(true, Set.of("disableAnalytics"), 3, "default-coverage-missing"));
        dexes.put("features-ad-discarded-clean", featureBuild(false, Set.of(), 0, "ad-discarded"));
        dexes.put("features-exception-clean", featureExceptionBuild(false, ""));
        dexes.put("features-exception-good", featureExceptionBuild(true, ""));
        for (String fault : List.of("range", "type", "target", "order")) {
            dexes.put("features-exception-bad-" + fault, featureExceptionBuild(true, fault));
        }
        dexes.put("features-exception-split-clean", featureExceptionBuild(false, "split"));
        dexes.put("features-exception-split-good", featureExceptionBuild(true, "split"));
        dexes.put("features-exception-split-gap", featureExceptionBuild(true, "split-gap"));
        dexes.put("clean", clean(cleanHost()));
        // The clean build with one host method fewer, so its classes.dex isn't the clean one byte
        // for byte: what a merge that changed the base's code would hand over.
        dexes.put("clean-changed", clean(host(addItem(CLEAN_ADD_ITEM), staticHost(CLEAN_STATIC_HOST), switchHost(7),
                tryHost(CLEAN_TRY), false)));
        dexes.put("secondary", Collections.singletonList(secondary()));
        // The host class again, as it ships, for a second dex entry: the Facebook sibling's 580
        // merged bundle defined some methods in more than one entry (its browser's standalone dex).
        dexes.put("host-copy", Collections.singletonList(cleanHost()));
        dexes.put("good", good());
        List<ClassDef> goodWithSecondary = new ArrayList<>(good());
        goodWithSecondary.add(secondary());
        dexes.put("good-with-secondary", goodWithSecondary);
        dexes.put("removed-method", bundle(host(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchHost(7), tryHost(CLEAN_TRY), false)));

        // branch: the guard's if-eqz jumps back into the middle of its own invoke.
        dexes.put("bad-branch", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, -3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard's if-eqz jumps to itself.
        dexes.put("bad-branch-self", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 0),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard's if-eqz jumps back onto its own move-result.
        dexes.put("bad-branch-to-result", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, -1),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard with its last return-void nopped, so the kept path runs off the end.
        dexes.put("bad-walk-off-end", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3),
                op(Opcode.RETURN_VOID), op(Opcode.NOP))));
        // branch: the try path jumps onto the handler's move-exception.
        dexes.put("bad-goto-to-handler", withTryHost(tryHost(CLEAN_TRY, new ImmutableInstruction10t(Opcode.GOTO, 1))));
        // try: the try path falls straight into the handler's move-exception.
        dexes.put("bad-fallthrough-handler", withTryHost(tryHost(CLEAN_TRY, op(Opcode.NOP))));
        // width: a patch borrows v2 as a free local, but it is the upper half of the long argument.
        dexes.put("bad-wide-high-clobber", withStaticHost(body(3,
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), invoke(INSPECT, 0, 0), invoke(WIDE, 1, 2),
                op(Opcode.RETURN_VOID))));
        // width: the same borrow on one arm of a branch only, and the long read where the arms
        // meet. ART merges the upper half with the zero into a conflict there.
        dexes.put("bad-wide-high-clobber-branch", withStaticHost(body(3,
                ifEqz(0, 3),                                        // 0 -> 3
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),  // 2
                invoke(INSPECT, 0, 0),                              // 3
                invoke(WIDE, 1, 2),                                 // 6
                op(Opcode.RETURN_VOID))));                          // 9
        // width: the long read at a loop's head, and the borrow on the edge back to it.
        dexes.put("bad-wide-high-clobber-loop", withStaticHost(body(3,
                invoke(WIDE, 1, 2),                                 // 0
                ifEqz(0, 4),                                        // 3 -> 7
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),  // 5
                new ImmutableInstruction10t(Opcode.GOTO, -6),       // 6 -> 0
                op(Opcode.RETURN_VOID))));                          // 7
        // width: a patch borrows v1, the lower half of the long argument, and passes the upper
        // half on as an int.
        dexes.put("bad-wide-low-clobber", withStaticHost(body(3,
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), invoke(REUSE, 2), op(Opcode.RETURN_VOID))));
        // width: a const-wide lands one register below the long argument, on v1 and v2, which
        // leaves v3 the upper half of a pair that no longer has a lower half. v1 is the object
        // argument here, and the long sits in v2 and v3.
        dexes.put("bad-wide-below-pair", withStaticHost(body(4,
                new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, 0), invoke(REUSE, 3), op(Opcode.RETURN_VOID))));
        // branch: case 1 lands inside the packed-switch instruction itself.
        dexes.put("bad-switch-case", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchHost(2), tryHost(CLEAN_TRY)));
        // branch: case 1 lands on the switch's own payload, which ART reaches as data.
        dexes.put("bad-switch-to-payload", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchHost(10), tryHost(CLEAN_TRY)));
        // branch: case 1 lands on a move-result, cut off from the invoke it takes its result from.
        dexes.put("bad-switch-to-result", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchToResult(), tryHost(CLEAN_TRY)));
        // branch: the no-case path jumps into the switch's payload.
        dexes.put("bad-goto-to-payload", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchHost(7, new ImmutableInstruction10t(Opcode.GOTO, 6)), tryHost(CLEAN_TRY)));
        // branch: a goto sent to a fill-array-data payload instead of the return before it.
        dexes.put("bad-goto-to-array-payload", withStaticHost(body(5,
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                                 // 0
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 1, INT_ARRAY),                    // 1
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),                         // 3 -> 8
                new ImmutableInstruction10t(Opcode.GOTO, 2),                                       // 6 -> 8
                op(Opcode.RETURN_VOID),                                                            // 7
                oneInt())));                                                                       // 8
        // branch: a switch case sent to a fill-array-data payload.
        dexes.put("bad-switch-to-array-payload", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchToArrayPayload(), tryHost(CLEAN_TRY)));
        // branch: a sparse switch's case sent to its own payload.
        dexes.put("bad-sparse-case-to-payload", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                sparseSwitchToOwnPayload(), tryHost(CLEAN_TRY)));
        // branch: a packed-switch pointed at a sparse-switch table, and a sparse-switch at a
        // packed-switch table, with every case landing on an instruction.
        dexes.put("bad-packed-switch-sparse-table", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchWithTable(Opcode.PACKED_SWITCH, new ImmutableSparseSwitchPayload(twoCases())), tryHost(CLEAN_TRY)));
        dexes.put("bad-sparse-switch-packed-table", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchWithTable(Opcode.SPARSE_SWITCH, new ImmutablePackedSwitchPayload(twoCases())), tryHost(CLEAN_TRY)));
        // branch: case 1 sent to the nop that aligns the payload, which falls into the table.
        dexes.put("bad-fallthrough-into-payload", patched(addItem(GUARDED_ADD_ITEM), staticHost(GOOD_STATIC_HOST),
                switchHost(9), tryHost(CLEAN_TRY)));
        // branch: a method that starts at a payload, which its entry runs into.
        dexes.put("bad-payload-at-entry", withStaticHost(body(3, oneInt())));
        // invoke: one register for a callee that takes two.
        dexes.put("bad-invoke-count", withStaticHost(body(3,
                invoke(INSPECT, 0), invoke(WIDE, 1, 2), op(Opcode.RETURN_VOID))));
        // invoke: the long's halves passed as v1 and v0, not a pair.
        dexes.put("bad-wide-split", withStaticHost(body(3,
                invoke(INSPECT, 0, 0), invoke(WIDE, 1, 0), op(Opcode.RETURN_VOID))));
        // parameter: written as if the method had a this, so p1 is taken for the object; in a
        // static method it is the low half of the long.
        dexes.put("bad-static-parameter", withStaticHost(body(3,
                invoke(INSPECT, 0, 1), invoke(WIDE, 1, 2), op(Opcode.RETURN_VOID))));
        // parameter: the upper half of the long read as an object.
        dexes.put("bad-wide-parameter", withStaticHost(body(4,
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 3),
                invoke(INSPECT, 1, 0), invoke(WIDE, 2, 3), op(Opcode.RETURN_VOID))));
        // width: the shape of the Facebook sibling's AMOLED sweep on its 580, a narrow const where a
        // const-wide/32 was, then read as a long. v0 and v1 are locals here, so this is the body's
        // width, not the parameter layout.
        dexes.put("bad-narrow-for-wide", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST, 0, BLACK), invoke(WIDE, 0, 1), op(Opcode.RETURN_VOID))));
        // width: the same narrow const on one arm of a branch only. Where the arms meet, v0 is a
        // long on one path and an int on the other, which ART merges into a conflict.
        dexes.put("bad-narrow-for-wide-branch", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), // 0
                ifEqz(2, 5),                                                 // 3 -> 8
                new ImmutableInstruction31i(Opcode.CONST, 0, BLACK),         // 5
                invoke(WIDE, 0, 1),                                          // 8
                op(Opcode.RETURN_VOID))));                                   // 11
        // width: the Facebook sibling's 580 static initializer, a narrow const shifted as a long and
        // stored. v0 to v2 are locals, the arguments sit in v3 to v5.
        dexes.put("bad-narrow-shift", withStaticHost(body(6, packColor(Opcode.CONST, HOST))));
        // width: the reverse, a const-wide/32 passed where an int goes.
        dexes.put("bad-wide-for-narrow", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), invoke(REUSE, 0), op(Opcode.RETURN_VOID))));
        // width: a conflict read by each instruction that takes a value, one build each: tested
        // against zero, tested for equality, ordered, switched on, locked, thrown, cast, tested for
        // a type, measured, used as a new array's size and as its element, and filled. ART's
        // verifier fails every one of these reads of a conflict.
        dexes.put("bad-conflict-if-eqz", conflictThen(
                ifEqz(0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));                    // 5 -> 8
        dexes.put("bad-conflict-if-ne", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_NE, 0, 3, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-lt", conflictThen(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction22t(Opcode.IF_LT, 0, 1, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-switch", conflictThen(
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 5),                           // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Collections.singletonList(                        // 10
                        new ImmutableSwitchElement(0, 3)))));
        dexes.put("bad-conflict-monitor-enter", conflictThen(op(Opcode.MONITOR_ENTER, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-throw", conflictThen(op(Opcode.THROW, 0)));
        dexes.put("bad-conflict-check-cast", conflictThen(
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, STRING_TYPE), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-instance-of", conflictThen(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 1, 0, STRING_TYPE), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-array-length", conflictThen(
                new ImmutableInstruction12x(Opcode.ARRAY_LENGTH, 1, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-new-array", conflictThen(
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 1, 0, INT_ARRAY), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-filled-new-array", conflictThen(filledNewArray(INT_ARRAY, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-fill-array-data", conflictThen(
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),                         // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                oneInt()));                                                                        // 10
        // The same conflict where each of the other readers takes it: the other test against
        // zero, an equality test in either register, an ordering against zero, the second
        // register of an ordering, a sparse switch, the unlock, and a range-built array.
        dexes.put("bad-conflict-if-nez", conflictThen(
                new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-eq", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_EQ, 0, 3, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-eq-second", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_EQ, 3, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-gez", conflictThen(
                new ImmutableInstruction21t(Opcode.IF_GEZ, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-lt-second", conflictThen(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction22t(Opcode.IF_LT, 1, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-sparse-switch", conflictThen(
                new ImmutableInstruction31t(Opcode.SPARSE_SWITCH, 0, 5),                           // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                new ImmutableSparseSwitchPayload(Collections.singletonList(                        // 10
                        new ImmutableSwitchElement(0, 3)))));
        dexes.put("bad-conflict-monitor-exit", conflictThen(op(Opcode.MONITOR_EXIT, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-filled-new-array-range", conflictThen(
                new ImmutableInstruction3rc(Opcode.FILLED_NEW_ARRAY_RANGE, 0, 1, INT_ARRAY), op(Opcode.RETURN_VOID)));
        // width: the upper half of a long whose lower half was overwritten, tested against zero.
        dexes.put("bad-broken-high-if-eqz", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 3, v1 is left a lone upper half
                ifEqz(1, 3),                                                                       // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: an int, risky()'s result, tested for equality with the object argument, and the
        // same pair the other way round. Each register is something an equality test takes, but
        // ART wants two objects or two narrow values.
        dexes.put("bad-if-eq-int-object", withStaticHost(body(5,
                invoke(RISKY),                                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                                         // 3
                new ImmutableInstruction22t(Opcode.IF_EQ, 0, 2, 3),                                // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        dexes.put("bad-if-ne-object-int", withStaticHost(body(5,
                invoke(RISKY),                                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                                         // 3
                new ImmutableInstruction22t(Opcode.IF_NE, 2, 0, 3),                                // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: a long tested against zero, which takes a narrow value or an object.
        dexes.put("bad-wide-if-eqz", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(0, 3),                                                                       // 3 -> 6
                op(Opcode.RETURN_VOID),                                                            // 5
                op(Opcode.RETURN_VOID))));                                                         // 6
        // width: a long whose upper half was overwritten on one arm, and its lower half moved
        // where the arms meet. A pair broken on one path stays broken: ART still holds a low half
        // there, which a move may not copy, where a conflict would be copied without complaint.
        dexes.put("bad-broken-low-move", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE, 2, 0),                                    // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: the same with the lower half overwritten, and the upper half moved.
        dexes.put("bad-broken-high-move", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE, 2, 1),                                    // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: a conflict copied by move-object, which ART allows, and the copy passed on as an
        // object, which it doesn't. Then a plain move's copy passed on as an int.
        dexes.put("bad-conflict-object-copy", conflictThen(
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 1, 0), invoke(INSPECT, 1, 3), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-plain-copy", conflictThen(
                new ImmutableInstruction12x(Opcode.MOVE, 1, 0), invoke(REUSE, 1), op(Opcode.RETURN_VOID)));
        // width: a zero on one arm where the other has a long, read as a long. A zero joins an
        // object or a narrow value, and ART merges it with a low half into a conflict.
        dexes.put("bad-zero-for-wide-branch", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                                 // 5
                invoke(WIDE, 0, 1),                                                                // 6
                op(Opcode.RETURN_VOID))));                                                         // 9
        // width: move-wide of a conflict. A narrow or object move may copy one, and a wide move
        // may not, since ART checks the pair it copies.
        dexes.put("bad-move-wide-conflict", withStaticHost(body(7,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(4, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE_WIDE, 2, 0),                               // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // result: a nop injected between the guard's invoke and its move-result.
        dexes.put("bad-move-result", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.NOP), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // try: the range starts inside the invoke it means to cover.
        dexes.put("bad-try-range", withTry(tryBlock(1, 2, 5)));
        // try: the handler starts inside the invoke.
        dexes.put("bad-try-handler", withTry(tryBlock(0, 3, 2)));
        // try: the handler starts at the invoke's move-result.
        dexes.put("bad-try-handler-result", withTry(tryBlock(0, 3, 3)));
        // try: the handler starts at a switch payload.
        dexes.put("bad-try-handler-payload", withTryHost(tryHandlerAtPayload()));
        // try: the handler starts at a fill-array-data payload.
        dexes.put("bad-try-handler-array-payload", withTryHost(tryHandlerAtArrayPayload()));
        // try: the handler's move-exception is the method's first instruction, which the entry reaches.
        dexes.put("bad-move-exception-entry", withTryHost(moveExceptionAtEntry()));

        // contract: one of the app's shortcut calls left as it was, not sent to the extension's
        // stand-in, one build for each call. The other four go to theirs.
        for (ShortcutCall call : SHORTCUT_CALLS) {
            List<ClassDef> shortcutLeft = new ArrayList<>(good());
            shortcutLeft.removeIf(cd -> cd.getType().equals(SHORTCUTS));
            shortcutLeft.add(shortcuts(Collections.singleton(call.name)));
            dexes.put("bad-shortcut-" + call.caseName + "-left", shortcutLeft);
        }

        // register: a helper the patch adds to one of the host's own classes, naming a register its
        // one-register body doesn't have. Only the extension's added methods were held to their
        // count, and the kind checks stepped over a register out of range, so this passed.
        dexes.put("bad-register-added-helper", withHostMethod(good(), define(HOST, "helper", "V", true,
                body(1, new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), op(Opcode.RETURN_VOID)))));
        // register: a long read from a helper's last register, whose upper half is past the count.
        // Nothing named that half, so nothing noticed it.
        dexes.put("bad-register-wide-source", withHostMethod(good(), define(HOST, "copyWide", "V", true,
                body(2, new ImmutableInstruction12x(Opcode.MOVE_WIDE, 0, 1), op(Opcode.RETURN_VOID)))));
        // register: an extension method writing a long into its last register.
        List<ClassDef> ownWide = new ArrayList<>(good());
        ownWide.add(new ImmutableClassDef(PACK, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT,
                null, null, null, null, Collections.singletonList(define(PACK, "pack", "V", true,
                        body(2, new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, 0), op(Opcode.RETURN_VOID))))));
        dexes.put("bad-register-own-wide", ownWide);
        // register: the guard's answer moved into v4 of its four registers and tested there.
        dexes.put("bad-register-changed", withAddItem(body(4,
                invoke(HIDE, 2, 3), op(Opcode.MOVE_RESULT, 4), ifEqz(4, 3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));

        for (Map.Entry<String, List<ClassDef>> e : dexes.entrySet()) {
            File dex = new File(out, e.getKey() + ".dex");
            DexPool.writeTo(dex.getPath(), new ImmutableDexFile(Opcodes.forApi(30), e.getValue()));
            if (e.getKey().equals("features-exception-split-good")) {
                // The pinned writer coalesces adjacent identical ranges past DEX's unsigned-short
                // limit. Close its one-unit gap after writing; the gap corruption stays unchanged.
                var loaded = DexFileFactory.loadDexFile(dex, Opcodes.forApi(30));
                DexBackedMethodImplementation body = null;
                for (ClassDef c : loaded.getClasses()) if (c.getType().equals("Lfixture/Pigeon;")) {
                    for (Method m : c.getMethods()) if (m.getName().equals("address")) {
                        body = (DexBackedMethodImplementation) m.getImplementation();
                    }
                }
                if (body == null) throw new IllegalStateException("Split-range fixture has no PIGEON method");
                var ranges = body.getTryBlocks();
                if (ranges.size() != 2 || ranges.get(0).getStartCodeAddress() != 4
                        || ranges.get(0).getCodeUnitCount() != 32767 || ranges.get(1).getStartCodeAddress() != 32772
                        || ranges.get(1).getCodeUnitCount() != 32771
                        || !ranges.get(0).getExceptionHandlers().equals(ranges.get(1).getExceptionHandlers())) {
                    throw new IllegalStateException("Split-range fixture has unexpected serialized ranges");
                }
                var field = DexBackedMethodImplementation.class.getDeclaredField("codeOffset");
                field.setAccessible(true);
                int units = body.getInstructionsSize();
                int length = field.getInt(body) + 16 + units * 2 + (units & 1) * 2 + 4;
                byte[] bytes = Files.readAllBytes(dex.toPath());
                bytes[length] = 0;
                bytes[length + 1] = (byte) 0x80;
                var sha1 = MessageDigest.getInstance("SHA-1");
                sha1.update(bytes, 32, bytes.length - 32);
                System.arraycopy(sha1.digest(), 0, bytes, 12, 20);
                var checksum = new Adler32();
                checksum.update(bytes, 12, bytes.length - 12);
                for (int n = 0; n < 4; n++) bytes[8 + n] = (byte) (checksum.getValue() >>> (n * 8));
                Files.write(dex.toPath(), bytes);
            }
        }
        System.out.println("[fixture] wrote " + dexes.size() + " dex files to " + out.getPath());
    }
}
