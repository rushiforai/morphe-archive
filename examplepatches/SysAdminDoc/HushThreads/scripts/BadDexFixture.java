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
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l;
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
    private static final String LOGO_HEADER = "Lfixture/LogoHeader;";
    private static final String LOGO = "Lapp/morphe/extension/hushthreads/settings/ThreadsLogo;";
    private static final String LOGO_NOTE = "com.instagram.barcelona.feed.ui.MainFeedScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (MainFeedScreen.kt:2820)";
    private static final ImmutableMethodReference LOGO_CLICKABLE = method("LX/2hQ;", "A01", "LX/9hm;",
            "LX/01C;", "LX/0tZ;", "LX/9hm;", "LX/1gN;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;", "Z");
    private static final ImmutableMethodReference LOGO_STAND_IN = method(LOGO, "clickable", OBJECT,
            OBJECT, OBJECT, OBJECT, OBJECT, "Ljava/lang/String;", OBJECT, "Z");
    private static final String SO_LOADER = "Lfixture/SoLoader;";
    private static final ImmutableMethodReference SO_LOADER_FLAGS = method("Lapp/morphe/extension/hushthreads/misc/NativeLibraries;",
            "soLoaderFlags", "I", "Landroid/content/Context;", "I");
    private static final ImmutableMethodReference SO_LOADER_NOTE = method("Lfixture/SoLoaderLog;", "note", "V");

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
        return Arrays.asList(host, filter(), shortcuts(Collections.<String>emptySet()), settingsEntry(),
                logoHeader(true, ""), logoStandIn(), soLoader(true, ""));
    }

    /** The clean build, the app's classes as they ship: [host] and every shortcut call made as the app makes it. */
    private static List<ClassDef> clean(ClassDef host) {
        return Arrays.asList(host, shortcuts(allShortcutCalls()), logoHeader(false, ""), soLoader(false, ""));
    }

    /**
     * SoLoader's init, and an instance method beside it holding the same two messages, which the
     * rule's static shape has to tell apart. Hooked, the flags reach the extension before anything else runs.
     */
    private static ClassDef soLoader(boolean hooked, String fault) {
        boolean late = fault.equals("soloader-late");
        boolean useHook = hooked && !fault.equals("soloader-missing");
        List<Instruction> hook = List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 2),
                new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, 5), invoke(SO_LOADER_FLAGS, 0, 1),
                op(Opcode.MOVE_RESULT, 1), new ImmutableInstruction22x(Opcode.MOVE_FROM16, 5, 1));
        List<Instruction> init = new ArrayList<>();
        if (useHook && !late) init.addAll(hook);
        init.add(string(0, "SoLoader already initialized"));
        init.add(string(0, "Initializing SoLoader: "));
        init.add(invoke(SO_LOADER_NOTE));
        if (useHook && late) init.addAll(hook);
        init.add(op(Opcode.RETURN_VOID));
        List<Instruction> bystander = new ArrayList<>();
        if (fault.equals("soloader-elsewhere")) {
            bystander.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
            bystander.add(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0));
            bystander.add(invoke(SO_LOADER_FLAGS, 0, 1));
        }
        bystander.add(string(0, "SoLoader already initialized"));
        bystander.add(string(0, "Initializing SoLoader: "));
        bystander.add(op(Opcode.RETURN_VOID));
        return new ImmutableClassDef(SO_LOADER, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                List.of(define(SO_LOADER, "init", "V", true, body(6, init.toArray(new Instruction[0])),
                                "Landroid/content/Context;", OBJECT, OBJECT, "I"),
                        define(SO_LOADER, "bystander", "V", false, body(3, bystander.toArray(new Instruction[0])))));
    }

    private static List<ClassDef> soLoaderFault(String fault) {
        List<ClassDef> classes = new ArrayList<>(good());
        classes.removeIf(c -> c.getType().equals(SO_LOADER));
        classes.add(soLoader(true, fault));
        return classes;
    }

    /** Both argument banks are valid, so the wrong-bank fault fails the contract alone. */
    private static ClassDef logoHeader(boolean hooked, String fault) {
        List<Instruction> code = new ArrayList<>();
        code.add(string(14, LOGO_NOTE));
        for (int first : new int[]{0, 7}) {
            for (int register = first; register < first + 6; register++) {
                code.add(new ImmutableInstruction11n(Opcode.CONST_4, register, 0));
            }
            code.add(new ImmutableInstruction11n(Opcode.CONST_4, first + 6, 1));
        }
        boolean useHook = hooked && !fault.equals("logo-missing");
        int first = fault.equals("logo-register") ? 7 : 0;
        code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, first, 7, useHook ? LOGO_STAND_IN : LOGO_CLICKABLE));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 14));
        if (useHook) code.add(type(Opcode.CHECK_CAST, 14, "LX/09hc;"));
        if (fault.equals("logo-duplicate") || fault.equals("logo-stock-left")) {
            code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 7,
                    fault.equals("logo-stock-left") ? LOGO_CLICKABLE : LOGO_STAND_IN));
            code.add(op(Opcode.MOVE_RESULT_OBJECT, 14));
        }
        code.add(op(Opcode.RETURN_OBJECT, 14));
        return new ImmutableClassDef(LOGO_HEADER, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                List.of(define(LOGO_HEADER, "invoke", OBJECT, false, body(18, code.toArray(new Instruction[0])), OBJECT, OBJECT)));
    }

    private static ClassDef logoStandIn() {
        return new ImmutableClassDef(LOGO, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                List.of(define(LOGO, "clickable", OBJECT, true, body(7, op(Opcode.RETURN_OBJECT, 2)),
                        OBJECT, OBJECT, OBJECT, OBJECT, "Ljava/lang/String;", OBJECT, "Z")));
    }

    private static List<ClassDef> logoFault(String fault) {
        List<ClassDef> classes = new ArrayList<>(good());
        classes.removeIf(c -> c.getType().equals(LOGO_HEADER));
        classes.add(logoHeader(true, fault));
        return classes;
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
    private static final String FEATURE_PERMALINK = "Lcom/instagram/barcelona/sponsored/permalink/ThreadsPermalinkAdFetcher;";
    private static final String FEATURE_PERMALINK_RESULT = "Lfixture/PermalinkAds;";
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
    private static final ImmutableMethodReference PERMALINK_FILTER = method(FEATURE_ADS, "permalinkAds", SHORTCUT_LIST, SHORTCUT_LIST);
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
    private static final String FEATURE_RETURN = "Lapp/morphe/extension/hushthreads/feed/ReturnRefresh;";
    private static final String FEATURE_ACTIVITY = "Lcom/instagram/barcelona/mainactivity/BarcelonaActivity;";
    private static final String FEATURE_WARM = "Lfixture/WarmStart;";
    private static final String FEATURE_WARM_DECISION = "Lfixture/WarmDecision;";
    private static final String FEATURE_HOT_START = "Lfixture/HotStart;";
    private static final String FEATURE_HOT_HELPER = "Lfixture/HotStartHelper;";
    private static final String FEATURE_DECIDER = "Lfixture/HotStartDecider;";
    private static final ImmutableMethodReference HOT_START_DECISION = method(FEATURE_DECIDER, "decide", FEATURE_HOT_START,
            FEATURE_HOT_HELPER, "Ljava/lang/String;", "J", "J");
    private static final ImmutableMethodReference HOLD_HOT_START = method(FEATURE_RETURN, "holdHotStart", "Z");
    private static final ImmutableMethodReference RESET_TO_FEED = method(FEATURE_RETURN, "resetToFeed", "Z", "Z");
    private static final ImmutableMethodReference WARM_START = method(FEATURE_RETURN, "warmStart", "Z", "Z");
    private static final ImmutableMethodReference CACHED_POSTS = method(FEATURE_RETURN, "cachedPosts", "Z", "Z");
    private static final String FEATURE_AUTOPLAY = "Lapp/morphe/extension/hushthreads/feed/VideoAutoplay;";
    private static final String FEATURE_VIDEO = "Lfixture/Video;";
    private static final String FEATURE_POSTS = "Lfixture/FeedPost;";
    private static final ImmutableMethodReference PLAYBACK_EFFECT = method(FEATURE_VIDEO, "effect", "V", OBJECT, "I", "Z", "Z");
    /** PostVideo plays by its fourth boolean, as on 450, after its changed and default masks. */
    private static final ImmutableMethodReference POST_VIDEO = method(FEATURE_VIDEO, "post", "V", OBJECT, "I", "I", "Z", "Z", "Z", "Z", "Z");
    /** The bit of PostVideo's default mask that has it play by its default, a 1, instead of the flag it's handed. */
    private static final int PLAY_DEFAULT = 0x4000;
    private static final ImmutableMethodReference HOLD_VIDEO = method(FEATURE_AUTOPLAY, "play", "Z", "Z");
    private static final String FEATURE_PURE_BLACK = "Lapp/morphe/extension/hushthreads/theme/PureBlack;";
    private static final String FEATURE_THEME = "Lfixture/BdsTheme;";
    private static final String FEATURE_THEME_COLORS = "Lfixture/ThemeColors;";
    private static final String FEATURE_SCHEMES = "Lfixture/ColorSchemes;";
    private static final String FEATURE_SCHEME = "Lfixture/ColorScheme;";
    /** A color scheme takes 20 colors, the fewest Pure black dark mode reads as one. Threads' takes 39. */
    private static final int SCHEME_COLORS = 20;
    private static final ImmutableMethodReference SCHEME_INIT = method(FEATURE_SCHEME, "<init>", "V",
            Collections.nCopies(SCHEME_COLORS, "J").toArray(new String[0]));
    private static final ImmutableMethodReference THEME_HELPER = method(FEATURE_THEME_COLORS, "dark", FEATURE_THEME_COLORS, OBJECT);
    private static final ImmutableMethodReference THEME_COLORS_INIT = method(FEATURE_THEME_COLORS, "<init>", "V", "J");
    private static final ImmutableMethodReference PURE_ARGB = method(FEATURE_PURE_BLACK, "argb", "J", "J");
    private static final ImmutableMethodReference PURE_COLOR = method(FEATURE_PURE_BLACK, "color", "J", "J");
    private static final String FEATURE_SETTINGS_ROW = "Lapp/morphe/extension/hushthreads/settings/ThreadsSettingsRow;";
    private static final String FEATURE_ROW_CLICK = "Lapp/morphe/extension/hushthreads/settings/ThreadsSettingsRow$Click;";
    private static final String FEATURE_SETTINGS_SCREEN = "Lfixture/SettingsScreenKt;";
    private static final String FEATURE_SETTINGS_LIST = "Lfixture/SettingsScreenKt$list$1;";
    private static final String FEATURE_ENTRY_KIND = "Lfixture/SettingsEntryKind;";
    private static final String FEATURE_COMPOSER = "Lfixture/Composer;";
    private static final String FEATURE_MODIFIER = "Lfixture/Modifier;";
    private static final String FUNCTION0 = "Lkotlin/jvm/functions/Function0;";
    private static final ImmutableMethodReference SETTINGS_ROW = method(FEATURE_SETTINGS_SCREEN, "SettingsRow", "V",
            FEATURE_COMPOSER, FEATURE_MODIFIER, "Ljava/lang/Integer;", FUNCTION0, "I", "I", "I", "I", "Z");
    private static final ImmutableMethodReference ACCOUNTS_ROW = method(FEATURE_SETTINGS_SCREEN, "AccountsCenterRow", "V",
            FEATURE_COMPOSER, FEATURE_MODIFIER, "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0, "I", "I", "I", "Z");
    private static final ImmutableMethodReference START_GROUP = method(FEATURE_COMPOSER, "startGroup", "V", "I");
    private static final ImmutableMethodReference ADD_ROW = method(FEATURE_SETTINGS_ROW, "add", "V", OBJECT);

    /** A Pando getter: it asks for the field by its name's hash and, here, answers null. */
    private static Method pandoGetter(String owner, String name, String returns, String field) {
        return define(owner, name, returns, false, body(2, new ImmutableInstruction31i(Opcode.CONST, 0, field.hashCode()),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)));
    }

    /**
     * The share-link hook after a read of the link into [link], with the post in [post] and the
     * post's code going in [code] and its author's name in v1. Faults: the link register swapped for
     * the code's, the code getter swapped for another field's, and the post check jumping past the call.
     */
    private static List<Instruction> postLinkHook(int link, int post, int code, String fault) {
        return List.of(new ImmutableInstruction11n(Opcode.CONST_4, code, 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                ifEqz(post, fault.equals("post-link-bypass") ? 20 : 16),
                virtual(fault.equals("post-link-getter") ? POST_TITLE : POST_CODE, post), op(Opcode.MOVE_RESULT_OBJECT, code),
                virtual(POST_AUTHOR, post), op(Opcode.MOVE_RESULT_OBJECT, 1),
                ifEqz(1, 6),
                virtual(USERNAME, 1), op(Opcode.MOVE_RESULT_OBJECT, 1),
                invoke(POST_LINKER, fault.equals("post-link-register") ? code : link, 1, code), op(Opcode.MOVE_RESULT_OBJECT, link));
    }

    /**
     * A resumed share's hook after a read into [link]: the post kept against [key] back into v7,
     * cast to a post, then the share-link hook. Faults named [prefix] plus recall-key, recall-cast,
     * recall-live (the post back into v3, which the method still reads) or post-link-bypass break
     * only this copy.
     */
    private static List<Instruction> recallHook(int key, int link, String fault, String prefix) {
        int post = fault.equals(prefix + "recall-live") ? 3 : 7;
        List<Instruction> hook = new ArrayList<>(List.of(invoke(POST_RECALL, fault.equals(prefix + "recall-key") ? link : key),
                op(Opcode.MOVE_RESULT_OBJECT, post), type(Opcode.CHECK_CAST, post, fault.equals(prefix + "recall-cast") ? FEATURE_USER : FEATURE_MEDIA)));
        hook.addAll(postLinkHook(link, post, 0, fault.equals(prefix + "post-link-bypass") ? "post-link-bypass" : ""));
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

    private static int codeUnits(List<Instruction> instructions) {
        int units = 0;
        for (Instruction i : instructions) units += i.getCodeUnits();
        return units;
    }

    /** The code-unit address of instruction [index] in [code]. */
    private static int units(List<Instruction> code, int index) {
        return codeUnits(code.subList(0, index));
    }

    /**
     * Threads' four return checks, each hooked where Block background-return feed refresh hooks it
     * on 450 when [hooked]. The warm-start check sets its answer true past the threshold, logs a
     * short time away and jumps back, then stores the answer. For you's swap joins a true and a false
     * over an if-gez and guards the swap on the result. The reset to main feed returns its own answer,
     * and the hot-start decision answers null for a return with no stop time. Faults: each hook
     * missing, the hot-start branch inverted, the reset's hook on the parameter the answer was copied
     * from, the warm-start hook past the store, and the swap's if-gez landing past its hook.
     */
    private static List<ClassDef> returnRefreshClasses(boolean hooked, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        // check(Object, boolean): v0..v5 locals, then the arguments; the answer in v1.
        List<Instruction> warmHook = hooked && !fault.equals("warm-start-missing")
                ? List.of(invoke(WARM_START, 1), op(Opcode.MOVE_RESULT, 1)) : List.of();
        List<Instruction> answered = new ArrayList<>(List.of(type(Opcode.NEW_INSTANCE, 0, FEATURE_WARM_DECISION),
                direct(method(FEATURE_WARM_DECISION, "<init>", "V"), 0)));
        if (!fault.equals("warm-start-moved")) answered.addAll(warmHook);
        answered.add(objectField(Opcode.IPUT_BOOLEAN, 1, 0, FEATURE_WARM_DECISION, "refresh", "Z"));
        if (fault.equals("warm-start-moved")) answered.addAll(warmHook);
        answered.add(op(Opcode.RETURN_OBJECT, 0));
        List<Instruction> check = new ArrayList<>(List.of(string(0, "hot_start_wall_clock_bg_elapsed_ms"),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 2, 0),
                new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 4, 0), new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 2, 4),
                // Past the true and the store to the short log, which jumps back to just past the true.
                new ImmutableInstruction21t(Opcode.IF_LTZ, 0, 3 + codeUnits(answered)), new ImmutableInstruction11n(Opcode.CONST_4, 1, 1)));
        check.addAll(answered);
        check.add(string(0, "background_time_too_short_for_hot_start_feed_refresh"));
        check.add(new ImmutableInstruction10t(Opcode.GOTO, -2 - codeUnits(answered)));
        // swap(): v0..v5 locals, this in v6; the answer in v5, joined where the hook goes.
        List<Instruction> swapHook = hooked && !fault.equals("cached-posts-missing")
                ? List.of(invoke(CACHED_POSTS, 5), op(Opcode.MOVE_RESULT, 5)) : List.of();
        List<Instruction> swap = new ArrayList<>(List.of(new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 0, 0),
                new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 2, 0), new ImmutableInstruction23x(Opcode.CMP_LONG, 4, 0, 2),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, 1),
                new ImmutableInstruction21t(Opcode.IF_GEZ, 4, fault.equals("cached-posts-bypass") ? 3 + codeUnits(swapHook) : 3),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, 0)));
        swap.addAll(swapHook);
        swap.addAll(List.of(objectField(Opcode.IGET_OBJECT, 0, 6, FEATURE_WARM, "posts", OBJECT), ifEqz(5, 4),
                objectField(Opcode.IPUT_OBJECT, 0, 6, FEATURE_WARM, "shown", OBJECT), op(Opcode.RETURN_VOID)));
        classes.add(featureClass(FEATURE_WARM, OBJECT, List.of(featureField(FEATURE_WARM, "posts", OBJECT), featureField(FEATURE_WARM, "shown", OBJECT)),
                define(FEATURE_WARM, "check", FEATURE_WARM_DECISION, true, body(8, check.toArray(new Instruction[0])), OBJECT, "Z"),
                define(FEATURE_WARM, "swap", "V", false, body(7, swap.toArray(new Instruction[0])))));
        classes.add(featureClass(FEATURE_WARM_DECISION, OBJECT, List.of(featureField(FEATURE_WARM_DECISION, "refresh", "Z")),
                define(FEATURE_WARM_DECISION, "<init>", "V", false, body(1, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)))));

        // reset(boolean): v0 and v1 locals, this in v2, the answer copied from v3 into v1.
        List<Instruction> reset = new ArrayList<>(List.of(string(0, "RESET_TO_MAIN_FEED"), string(0, "reset_to_home_feed"),
                new ImmutableInstruction12x(Opcode.MOVE, 1, 3)));
        if (hooked && !fault.equals("reset-missing")) {
            int answer = fault.equals("reset-register") ? 3 : 1;
            reset.add(invoke(RESET_TO_FEED, answer));
            reset.add(op(Opcode.MOVE_RESULT, answer));
        }
        reset.add(op(Opcode.RETURN, 1));
        // onStart: v0..v5 locals, this in v6. The decision takes the helper, the last surface and two times.
        classes.add(featureClass(FEATURE_ACTIVITY, OBJECT, List.of(featureField(FEATURE_ACTIVITY, "helper", FEATURE_HOT_HELPER)),
                define(FEATURE_ACTIVITY, "onStart", "V", false, body(7, objectField(Opcode.IGET_OBJECT, 0, 6, FEATURE_ACTIVITY, "helper", FEATURE_HOT_HELPER),
                        string(1, "feed"), new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 2, 0), new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 4, 0),
                        new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 6, HOT_START_DECISION), op(Opcode.MOVE_RESULT_OBJECT, 0),
                        virtual(method(FEATURE_ACTIVITY, "handle", "V", FEATURE_HOT_START), 6, 0), op(Opcode.RETURN_VOID))),
                define(FEATURE_ACTIVITY, "handle", "V", false, body(3, string(0, "badge_decision"), op(Opcode.RETURN_VOID)), FEATURE_HOT_START),
                define(FEATURE_ACTIVITY, "reset", "Z", false, body(4, reset.toArray(new Instruction[0])), "Z")));

        // decide(helper, surface, stopped, now): v0..v2 locals, then the arguments; null with no stop time.
        List<Instruction> decide = new ArrayList<>();
        if (hooked && !fault.equals("hot-start-missing")) {
            // Past its own two units and the null return's two, onto the decision's first instruction.
            decide.addAll(List.of(invoke(HOLD_HOT_START), op(Opcode.MOVE_RESULT, 0),
                    new ImmutableInstruction21t(fault.equals("hot-start-inverted") ? Opcode.IF_NEZ : Opcode.IF_EQZ, 0, 4),
                    new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)));
        }
        decide.addAll(List.of(new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 0, 0), new ImmutableInstruction23x(Opcode.CMP_LONG, 2, 5, 0),
                new ImmutableInstruction21t(Opcode.IF_GTZ, 2, 4), new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), op(Opcode.RETURN_OBJECT, 2),
                type(Opcode.NEW_INSTANCE, 2, FEATURE_HOT_START), direct(method(FEATURE_HOT_START, "<init>", "V"), 2), op(Opcode.RETURN_OBJECT, 2)));
        classes.add(featureClass(FEATURE_DECIDER, OBJECT, List.of(), define(FEATURE_DECIDER, "decide", FEATURE_HOT_START, true,
                body(9, decide.toArray(new Instruction[0])), FEATURE_HOT_HELPER, "Ljava/lang/String;", "J", "J")));
        classes.add(featureClass(FEATURE_HOT_START, OBJECT, List.of(), define(FEATURE_HOT_START, "<init>", "V", false,
                body(1, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)))));
        return classes;
    }

    /**
     * Disable video autoplay's shapes: PostVideo, which sets its playback effect's first boolean
     * from its own fourth, or from the 1 it defaults to when its default mask's 0x4000 bit is set,
     * and its callers. A single post, a carousel and an Instagram post hand it their own boolean in
     * v7 as the flag. A trend preview and an ad card set the bit and pass a 0, and so does the
     * viewer. When [hooked], each caller but the viewer asks the extension about v7 just before the
     * call, the carousel's branch to its call landing on the question, and the trend preview and ad
     * card first clear the bit in v3 and load the default's 1 into v7. Faults: the carousel's hook
     * missing, the single post's hook on the boolean before the flag, the hook moved into PostVideo
     * itself, the carousel's branch landing past its hook, the Instagram post's hook missing, the
     * trend preview and ad card hooked like posts with their bits left set, the ad card asking
     * about a 0, the viewer's bit cleared, and an ad card that reads its mask again after PostVideo.
     */
    private static List<ClassDef> videoAutoplayClasses(boolean hooked, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        // post(composer, changed, defaults, five booleans): v0..v2 locals, then the arguments; the mask in v5, the flag in v9.
        List<Instruction> post = new ArrayList<>();
        if (hooked && fault.equals("autoplay-inside")) {
            post.addAll(List.of(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 9, 1, HOLD_VIDEO), op(Opcode.MOVE_RESULT, 9)));
        }
        // The default's 1 replaces the flag when the mask's bit is set. False lands on the 0; true
        // sets the 1 and jumps past the 0 to the effect.
        post.addAll(List.of(string(0, "com.instagram.barcelona.feed.post.video.PostVideo (PostVideo.kt:84)"),
                new ImmutableInstruction12x(Opcode.MOVE, 1, 9), new ImmutableInstruction22s(Opcode.AND_INT_LIT16, 2, 5, PLAY_DEFAULT), ifEqz(2, 3),
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1), ifEqz(1, 4), new ImmutableInstruction11n(Opcode.CONST_4, 2, 1),
                new ImmutableInstruction10t(Opcode.GOTO, 2), new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                invoke(PLAYBACK_EFFECT, 3, 4, 2, 10), op(Opcode.RETURN_VOID)));
        classes.add(featureClass(FEATURE_VIDEO, OBJECT, List.of(),
                define(FEATURE_VIDEO, "effect", "V", true, body(5, string(0, "com.instagram.video.player.compose.VideoPlaybackEffect (VideoPlaybackEffect.kt:41)"),
                        op(Opcode.RETURN_VOID)), OBJECT, "I", "Z", "Z"),
                define(FEATURE_VIDEO, "post", "V", true, body(11, post.toArray(new Instruction[0])), OBJECT, "I", "I", "Z", "Z", "Z", "Z", "Z")));
        boolean callers = hooked && !fault.equals("autoplay-inside");
        classes.add(featureClass(FEATURE_POSTS, OBJECT, List.of(),
                videoCaller("single", "com.instagram.barcelona.feed.post.ui.PostSingleMedia.<anonymous> (PostSingleMedia.kt:212)", 0,
                        callers ? asked(fault.equals("autoplay-register") ? 6 : 7) : List.of(), false, false, false),
                videoCaller("carousel", "com.instagram.barcelona.feed.post.ui.PostCarousel.<anonymous> (PostCarousel.kt:131)", 0,
                        callers && !fault.equals("autoplay-missing") ? asked(7) : List.of(), true, fault.equals("autoplay-bypass"), false),
                videoCaller("inline", "com.instagram.barcelona.igmedia.InlineIgVideo (InlineIgVideo.kt:38)", 0x20,
                        callers && !fault.equals("autoplay-inline-missing") ? asked(7) : List.of(), false, false, false),
                videoCaller("trend", "com.instagram.barcelona.common.ui.mediahighlights.AutoplayingMediaHighlightVideo (TrendMediaHighlightsPreview.kt:235)",
                        PLAY_DEFAULT | 0x20, !callers ? List.of() : fault.equals("autoplay-default-ignored") ? asked(7) : defaultAsked(0x20, 1), false, false, false),
                videoCaller("ad", "com.instagram.barcelona.sponsored.ui.AdCard (AdCard.kt:143)", PLAY_DEFAULT | 0x40,
                        !callers ? List.of() : fault.equals("autoplay-default-ignored") ? asked(7) : defaultAsked(0x40, fault.equals("autoplay-ad-literal") ? 0 : 1),
                        false, false, fault.equals("autoplay-ad-live")),
                // The viewer's bit cleared without a question: it would play by the 0 it passes, never at all.
                videoCaller("viewer", "com.instagram.barcelona.feed.mediaviewer.ui.MediaViewerVideo (MediaViewerVideo.kt:90)", PLAY_DEFAULT | 0x80,
                        callers && fault.equals("autoplay-viewer") ? List.of(new ImmutableInstruction31i(Opcode.CONST, 3, 0x80)) : List.of(), false, false, false)));
        return classes;
    }

    private static final String FEATURE_PREFETCH = "Lfixture/Prefetch;";
    private static final ImmutableMethodReference PREFETCH_CHECK = method(FEATURE_PREFETCH, "check", "Z", OBJECT);
    private static final ImmutableMethodReference PREFETCH_SKIP = method(FEATURE_PREFETCH, "skip", "Z", OBJECT);
    private static final ImmutableMethodReference SKIP_PREFETCH = method(FEATURE_AUTOPLAY, "skipPrefetch", "Z", "Z");

    /**
     * The video prefetcher's side of Disable video autoplay: Instagram's autoplay-off check, which
     * holds both flag names and answers false; a sibling holding only the Olympus name; the legacy
     * checker, which calls the check and returns its answer; the skip test, which calls the check
     * and skips the prefetch on a true answer, and the dispatcher that holds the queue's name and
     * calls the skip test. The skip test keeps a 0 in v1 and the check's answer in v0, and its
     * no-skip path holds an if-nez on v1, never taken, back to the if-nez on the answer; its hook,
     * when [hooked], asks the extension about v0 between the answer and that if-nez, and the branch
     * back lands on the hook. Faults: no call, the 0 in v1 passed instead of the answer, the answer
     * dropped or moved into v1, the call after the if-nez, a second call, the call in the legacy
     * checker as well, the branch back landing on the if-nez past the call, and, with the feature
     * left out, the call written anyway. The changed-body faults rewrite one method, with the
     * feature selected or left out: the skip test's answer for a skip, the check's or the sibling's
     * answer, the legacy checker's answer overwritten before it returns, or the dispatcher's call
     * to the skip test dropped.
     */
    private static List<ClassDef> prefetchClasses(boolean hooked, String fault) {
        boolean written = hooked || fault.equals("prefetch-omitted-call");
        String changed = fault.matches("prefetch-(changed|omitted)-(skip|check|sibling|legacy|dispatch)") ? fault.substring(fault.lastIndexOf('-') + 1) : "";
        List<Instruction> hook = new ArrayList<>();
        if (written && !fault.equals("prefetch-missing")) {
            int in = fault.equals("prefetch-register") ? 1 : 0;
            hook.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, in, 1, SKIP_PREFETCH));
            if (!fault.equals("prefetch-dropped")) hook.add(op(Opcode.MOVE_RESULT, fault.equals("prefetch-answer-moved") ? 1 : 0));
            if (fault.equals("prefetch-twice")) hook.addAll(List.copyOf(hook));
        }
        boolean after = fault.equals("prefetch-after-test");
        List<Instruction> skip = new ArrayList<>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), invoke(PREFETCH_CHECK, 2), op(Opcode.MOVE_RESULT, 0)));
        if (!after) skip.addAll(hook);
        int test = skip.size();
        skip.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 0));
        if (after) skip.addAll(hook);
        int back = skip.size();
        skip.addAll(List.of(new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 0), new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)));
        int yes = skip.size();
        skip.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, changed.equals("skip") ? 0 : 1), op(Opcode.RETURN, 0)));
        // The branch back reaches the hook in front of the if-nez, or the if-nez itself with nothing in front of it.
        int land = after || fault.equals("prefetch-branch-past") ? test : test - hook.size();
        skip.set(test, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, units(skip, yes) - units(skip, test)));
        skip.set(back, new ImmutableInstruction21t(Opcode.IF_NEZ, 1, units(skip, land) - units(skip, back)));
        List<Instruction> legacy = new ArrayList<>(List.of(invoke(PREFETCH_CHECK, 1), op(Opcode.MOVE_RESULT, 0)));
        if (hooked && fault.equals("prefetch-legacy")) {
            legacy.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 1, SKIP_PREFETCH));
            legacy.add(op(Opcode.MOVE_RESULT, 0));
        }
        if (changed.equals("legacy")) legacy.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1));
        legacy.add(op(Opcode.RETURN, 0));
        List<Instruction> dispatch = new ArrayList<>(List.of(string(0, "VideoPrefetchDispatcher.queue")));
        if (!changed.equals("dispatch")) dispatch.addAll(List.of(invoke(PREFETCH_SKIP, 2), op(Opcode.MOVE_RESULT, 1)));
        dispatch.add(op(Opcode.RETURN_VOID));
        return List.of(featureClass(FEATURE_PREFETCH, OBJECT, List.of(),
                define(FEATURE_PREFETCH, "check", "Z", true, body(3, string(0, "ig_disable_video_autoplay"), string(1, "ig_olympus_disable_video_autoplay"),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, changed.equals("check") ? 1 : 0), op(Opcode.RETURN, 0)), OBJECT),
                define(FEATURE_PREFETCH, "sibling", "Z", true, body(4, string(0, "ig_olympus_disable_video_autoplay"),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, changed.equals("sibling") ? 1 : 0), op(Opcode.RETURN, 0)), OBJECT, OBJECT),
                define(FEATURE_PREFETCH, "legacy", "Z", true, body(2, legacy.toArray(new Instruction[0])), OBJECT),
                define(FEATURE_PREFETCH, "skip", "Z", true, body(3, skip.toArray(new Instruction[0])), OBJECT),
                define(FEATURE_PREFETCH, "dispatch", "V", true, body(3, dispatch.toArray(new Instruction[0])), OBJECT)));
    }

    /** A separate shortened overload shape. Its play and mask positions differ from PostVideo. */
    private static final ImmutableMethodReference FORWARD_VIDEO = method(FEATURE_VIDEO, "forward", "V", OBJECT, "I", "Z", "Z", "I", "Z");

    private static List<ClassDef> videoAutoplayForwardBuild(boolean patched, Set<String> selected, String fault) {
        List<ClassDef> classes = new ArrayList<>(featureBuild(patched, selected, 0, ""));
        classes.removeIf(c -> c.getType().equals(FEATURE_VIDEO) || c.getType().equals(FEATURE_POSTS));
        boolean hooked = patched && selected.contains("disableVideoAutoplay");
        List<ClassDef> direct = videoAutoplayClasses(hooked, "");
        List<Method> video = new ArrayList<>();
        direct.get(0).getMethods().forEach(video::add);
        List<Instruction> forward = new ArrayList<>(List.of(
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 8), new ImmutableInstruction12x(Opcode.MOVE, 1, 9),
                new ImmutableInstruction12x(Opcode.MOVE, 2, 12), new ImmutableInstruction12x(Opcode.MOVE, 3, 10),
                new ImmutableInstruction11n(Opcode.CONST_4, 4, 0), new ImmutableInstruction11n(Opcode.CONST_4, 5, 0),
                new ImmutableInstruction12x(Opcode.MOVE, 6, 11), new ImmutableInstruction12x(Opcode.MOVE, 7, 13)));
        if (fault.equals("forward-flag-clobber")) forward.set(6, new ImmutableInstruction11n(Opcode.CONST_4, 6, 1));
        if (fault.equals("forward-mask-clobber")) forward.set(2, new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
        if (fault.equals("forward-side-effect")) forward.add(invoke(PLAYBACK_EFFECT, 0, 1, 4, 7));
        if (fault.equals("forward-repeat")) forward.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 8, POST_VIDEO));
        if (patched && fault.equals("forward-body")) forward.set(7, new ImmutableInstruction11n(Opcode.CONST_4, 7, 1));
        forward.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 8, POST_VIDEO));
        forward.add(op(Opcode.RETURN_VOID));
        video.add(define(FEATURE_VIDEO, "forward", "V", true, body(14, forward.toArray(new Instruction[0])), OBJECT, "I", "Z", "Z", "I", "Z"));
        classes.add(featureClass(FEATURE_VIDEO, OBJECT, List.of(), video.toArray(new Method[0])));
        List<Method> callers = new ArrayList<>();
        direct.get(1).getMethods().forEach(m -> { if (m.getName().equals("single") || m.getName().equals("carousel")) callers.add(m); });
        callers.add(forwardVideoCaller("inline", "com.instagram.barcelona.igmedia.InlineIgVideo (InlineIgVideo.kt:41)", 0x20,
                hooked && !fault.equals("forward-missing") ? asked(fault.equals("forward-register") ? 3 : 4) : List.of()));
        callers.add(forwardVideoCaller("trend", "com.instagram.barcelona.common.ui.mediahighlights.AutoplayingMediaHighlightVideo (TrendMediaHighlightsPreview.kt:235)", PLAY_DEFAULT | 0x20,
                hooked ? forwardedDefaultAsked(0x20) : List.of()));
        callers.add(forwardVideoCaller("ad", "com.instagram.barcelona.sponsored.ui.AdCard (AdCard.kt:145)", PLAY_DEFAULT | 0x40,
                !hooked ? List.of() : fault.equals("forward-default") ? asked(4) : forwardedDefaultAsked(0x40)));
        callers.add(forwardVideoCaller("viewer", "com.instagram.barcelona.feed.mediaviewer.ui.MediaViewerVideo (MediaViewerVideo.kt:90)", PLAY_DEFAULT | 0x80,
                hooked && fault.equals("forward-viewer") ? asked(4) : List.of()));
        classes.add(featureClass(FEATURE_POSTS, OBJECT, List.of(), callers.toArray(new Method[0])));
        return classes;
    }

    /** Shortened call arguments occupy v1..v6, with play in v4 and the mask in v5. */
    private static Method forwardVideoCaller(String name, String note, int defaults, List<Instruction> question) {
        List<Instruction> body = new ArrayList<>(List.of(string(0, note), new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 1, 7),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), new ImmutableInstruction11n(Opcode.CONST_4, 3, 1),
                (defaults & PLAY_DEFAULT) == 0 ? new ImmutableInstruction12x(Opcode.MOVE, 4, 8) : new ImmutableInstruction11n(Opcode.CONST_4, 4, 0),
                new ImmutableInstruction21s(Opcode.CONST_16, 5, defaults), new ImmutableInstruction11n(Opcode.CONST_4, 6, 0)));
        body.addAll(question);
        body.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 6, FORWARD_VIDEO));
        body.add(op(Opcode.RETURN_VOID));
        return define(FEATURE_POSTS, name, "V", true, body(9, body.toArray(new Instruction[0])), OBJECT, "Z");
    }

    private static List<Instruction> forwardedDefaultAsked(int mask) {
        List<Instruction> block = new ArrayList<>(List.of(new ImmutableInstruction31i(Opcode.CONST, 5, mask), new ImmutableInstruction21s(Opcode.CONST_16, 4, 1)));
        block.addAll(asked(4));
        return block;
    }

    /** The extension asked about v[register], its answer back in it. */
    private static List<Instruction> asked(int register) {
        return List.of(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1, HOLD_VIDEO), op(Opcode.MOVE_RESULT, register));
    }

    /** The default mask without its play bit, [mask], in v3, [value] in the flag's v7, and the extension asked about v7. */
    private static List<Instruction> defaultAsked(int mask, int value) {
        List<Instruction> block = new ArrayList<>(List.of(new ImmutableInstruction31i(Opcode.CONST, 3, mask), new ImmutableInstruction21s(Opcode.CONST_16, 7, value)));
        block.addAll(asked(7));
        return block;
    }

    /**
     * A composable holding [note] that calls PostVideo with [defaults] as its default mask, in v3,
     * and the flag in v7: its own boolean, or a 0 when the mask leaves the flag to PostVideo's
     * default. [question] goes just before the call. [branch] puts an if-nez on that boolean in
     * front, aimed at the call, and [bypass] lands it past the question. [readsMask] reads v3 again
     * after the call.
     */
    private static Method videoCaller(String name, String note, int defaults, List<Instruction> question, boolean branch, boolean bypass, boolean readsMask) {
        // PostVideo's composer, changed, defaults and five booleans in v1..v8; the arguments in v9 and v10.
        List<Instruction> body = new ArrayList<>(List.of(string(0, note), new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 1, 9),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), new ImmutableInstruction21s(Opcode.CONST_16, 3, defaults),
                new ImmutableInstruction11n(Opcode.CONST_4, 4, 0), new ImmutableInstruction11n(Opcode.CONST_4, 5, 1),
                new ImmutableInstruction11n(Opcode.CONST_4, 6, 0),
                (defaults & PLAY_DEFAULT) == 0 ? new ImmutableInstruction12x(Opcode.MOVE, 7, 10) : new ImmutableInstruction11n(Opcode.CONST_4, 7, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 8, 1)));
        if (branch) {
            // Past its own two units and the 0's one, onto the question when there is one.
            body.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 10, 3 + (bypass ? codeUnits(question) : 0)));
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 8, 0));
        }
        body.addAll(question);
        body.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 8, POST_VIDEO));
        if (readsMask) body.add(new ImmutableInstruction12x(Opcode.MOVE, 0, 3));
        body.add(op(Opcode.RETURN_VOID));
        return define(FEATURE_POSTS, name, "V", true, body(11, body.toArray(new Instruction[0])), OBJECT, "Z");
    }

    /**
     * Pure black dark mode's shapes: Threads' theme, which loads #101010 itself as 449 did and calls
     * a helper that loads it as 450 does, each load shifted into a Compose color, and the class
     * holding the two color schemes the theme reads. Its static initializer builds the light one and
     * then the dark one, as 450 does, from shared colors: the dark one passes #101010 as its first
     * two colors where the light one passes white, and the light one passes #101010 as its third, a
     * dark color on light backgrounds. When [hooked], each load asks argb right after and the dark
     * backgrounds, in v10 and v12, ask color right before the dark constructor. Faults: the helper's
     * hook missing, the theme's hook on the gray loaded before its #101010, the second background's
     * hook missing, that hook on the third color instead, and the background hooks put before the
     * light constructor.
     */
    private static List<ClassDef> pureBlackClasses(boolean hooked, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        // invoke(Object, Object): v0..v5 locals, this in v6 and the arguments in v7 and v8; #101010 in v3.
        List<Instruction> theme = new ArrayList<>(List.of(string(0, "com.instagram.barcelona.bds.theme.BdsTheme.<anonymous> (BdsTheme.kt:73)"),
                staticField(Opcode.SGET_OBJECT, 0, FEATURE_SCHEMES, "light", FEATURE_SCHEME),
                staticField(Opcode.SGET_OBJECT, 0, FEATURE_SCHEMES, "dark", FEATURE_SCHEME),
                new ImmutableInstruction21s(Opcode.CONST_16, 5, 32), constWide(1, 0xff1c1c1cL), constWide(3, 0xff101010L)));
        if (hooked) theme.addAll(pureBlackHook(PURE_ARGB, fault.equals("pure-black-load-register") ? 1 : 3));
        theme.addAll(List.of(new ImmutableInstruction23x(Opcode.SHL_LONG, 3, 3, 5), invoke(THEME_HELPER, 7), op(Opcode.MOVE_RESULT_OBJECT, 0),
                type(Opcode.NEW_INSTANCE, 0, FEATURE_THEME_COLORS), direct(THEME_COLORS_INIT, 0, 3, 4), op(Opcode.RETURN_OBJECT, 0)));
        classes.add(featureClass(FEATURE_THEME, OBJECT, List.of(),
                define(FEATURE_THEME, "invoke", OBJECT, false, body(9, theme.toArray(new Instruction[0])), OBJECT, OBJECT)));
        // dark(Object): v0..v5 locals and the argument in v6; #101010 in v2.
        List<Instruction> helper = new ArrayList<>(List.of(new ImmutableInstruction21s(Opcode.CONST_16, 5, 32), constWide(0, 0xff0a0a0aL),
                new ImmutableInstruction23x(Opcode.SHL_LONG, 0, 0, 5), constWide(2, 0xff101010L)));
        if (hooked && !fault.equals("pure-black-load-missing")) helper.addAll(pureBlackHook(PURE_ARGB, 2));
        helper.addAll(List.of(new ImmutableInstruction23x(Opcode.SHL_LONG, 2, 2, 5), type(Opcode.NEW_INSTANCE, 4, FEATURE_THEME_COLORS),
                direct(THEME_COLORS_INIT, 4, 2, 3), op(Opcode.RETURN_OBJECT, 4)));
        classes.add(featureClass(FEATURE_THEME_COLORS, OBJECT, List.of(),
                define(FEATURE_THEME_COLORS, "dark", FEATURE_THEME_COLORS, true, body(7, helper.toArray(new Instruction[0])), OBJECT),
                define(FEATURE_THEME_COLORS, "<init>", "V", false, body(3, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), "J")));

        // The shift in v0 and the shared colors, each shifted into a Compose color: #101010 in v1,
        // white in v3, the dark scheme's gray in v5 and the light scheme's in v7.
        List<Instruction> init = new ArrayList<>(List.of(new ImmutableInstruction21s(Opcode.CONST_16, 0, 32)));
        long[] shared = {0xff101010L, 0xffffffffL, 0xff1c1c1cL, 0xfff5f5f5L};
        for (int n = 0; n < shared.length; n++) {
            init.add(constWide(1 + 2 * n, shared[n]));
            init.add(new ImmutableInstruction23x(Opcode.SHL_LONG, 1 + 2 * n, 1 + 2 * n, 0));
        }
        List<Integer> backgrounds = !hooked ? List.of() : fault.equals("pure-black-background-missing") ? List.of(10)
                : fault.equals("pure-black-background-register") ? List.of(10, 14) : List.of(10, 12);
        boolean onLight = fault.equals("pure-black-light");
        init.addAll(schemeBuild("light", 3, 1, 7, onLight ? backgrounds : List.of()));
        init.addAll(schemeBuild("dark", 1, 3, 5, onLight ? List.of() : backgrounds));
        init.add(op(Opcode.RETURN_VOID));
        int fieldFlags = AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue();
        classes.add(featureClass(FEATURE_SCHEMES, OBJECT, List.of(flaggedField(FEATURE_SCHEMES, "light", FEATURE_SCHEME, fieldFlags),
                flaggedField(FEATURE_SCHEMES, "dark", FEATURE_SCHEME, fieldFlags)),
                define(FEATURE_SCHEMES, "<clinit>", "V", true, body(10 + 2 * SCHEME_COLORS, init.toArray(new Instruction[0])))));
        classes.add(featureClass(FEATURE_SCHEME, OBJECT, List.of(), define(FEATURE_SCHEME, "<init>", "V", false,
                body(1 + 2 * SCHEME_COLORS, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)),
                Collections.nCopies(SCHEME_COLORS, "J").toArray(new String[0]))));
        return classes;
    }

    /** 451's literal-free theme copies a background field into an inherited color palette. */
    private static List<ClassDef> pureBlackFieldClasses(boolean hooked, String fault) {
        String schemeFault = fault.endsWith("background-missing") ? "pure-black-background-missing"
                : fault.endsWith("light") ? "pure-black-light" : "";
        List<ClassDef> classes = pureBlackClasses(hooked, schemeFault);
        classes.removeIf(c -> Set.of(FEATURE_THEME, FEATURE_THEME_COLORS, FEATURE_SCHEME).contains(c.getType()));
        List<Instruction> stores = List.of(direct(method(OBJECT, "<init>", "V"), 0),
                objectField(Opcode.IPUT_WIDE, 1, 0, FEATURE_SCHEME, "background", "J"),
                objectField(Opcode.IPUT_WIDE, 3, 0, FEATURE_SCHEME,
                        fault.endsWith("store-duplicate") ? "background" : "canvas", "J"), op(Opcode.RETURN_VOID));
        classes.add(featureClass(FEATURE_SCHEME, OBJECT,
                List.of(featureField(FEATURE_SCHEME, "background", "J"), featureField(FEATURE_SCHEME, "canvas", "J")),
                define(FEATURE_SCHEME, "<init>", "V", false, body(1 + 2 * SCHEME_COLORS, stores.toArray(new Instruction[0])),
                        Collections.nCopies(SCHEME_COLORS, "J").toArray(new String[0]))));

        // 453's inherited palette takes an object ahead of its colors.
        List<String> paletteParameters = new ArrayList<>(List.of(OBJECT));
        paletteParameters.addAll(Collections.nCopies(SCHEME_COLORS, "J"));
        ImmutableMethodReference paletteInit = method(FEATURE_THEME_COLORS, "<init>", "V", paletteParameters.toArray(new String[0]));
        classes.add(featureClass(FEATURE_THEME_COLORS, OBJECT, List.of(featureField(FEATURE_THEME_COLORS, "background", "J")),
                define(FEATURE_THEME_COLORS, "dark", FEATURE_THEME_COLORS, true, body(2,
                        string(0, fault.endsWith("getter-note") ? "unrelated palette" :
                                "com.instagram.compose.core.theme.IgTheme.<get-colors> (IgTheme.kt:22)"),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)), OBJECT),
                define(FEATURE_THEME_COLORS, "<init>", "V", false, body(2 + 2 * SCHEME_COLORS,
                        direct(method(OBJECT, "<init>", "V"), 0),
                        objectField(Opcode.IPUT_WIDE, 2, 0, FEATURE_THEME_COLORS, "background", "J"), op(Opcode.RETURN_VOID)),
                        paletteInit.getParameterTypes().toArray(new String[0]))));

        List<Instruction> theme = new ArrayList<>(List.of(
                string(0, "com.instagram.barcelona.bds.theme.BdsTheme.<anonymous> (BdsTheme.kt:38)"),
                staticField(Opcode.SGET_OBJECT, 1, FEATURE_SCHEMES, "light", FEATURE_SCHEME),
                staticField(Opcode.SGET_OBJECT, 1, FEATURE_SCHEMES, "dark", FEATURE_SCHEME),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), invoke(THEME_HELPER, 2), op(Opcode.MOVE_RESULT_OBJECT, 2),
                type(Opcode.NEW_INSTANCE, 10, FEATURE_THEME_COLORS), constWide(8, 0)));
        if (fault.endsWith("branch-bypass")) {
            theme.add(constWide(6, 0));
            theme.add(ifEqz(2, 4)); // The false path keeps a valid wide value but never reads the background.
        }
        theme.add(fault.endsWith("copy-missing") ? constWide(6, 0) :
                objectField(Opcode.IGET_WIDE, 6, 1, FEATURE_SCHEME, "background", "J"));
        theme.add(objectField(Opcode.IGET_WIDE, 4, 1, FEATURE_SCHEME, "canvas", "J"));
        theme.add(new ImmutableInstruction11n(Opcode.CONST_4, 11, 0));
        for (int p = 0; p < SCHEME_COLORS; p++) {
            theme.add(new ImmutableInstruction22x(Opcode.MOVE_WIDE_FROM16, 12 + 2 * p, p == 0 ? 6 : p == 1 ? 4 : 8));
        }
        theme.add(new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 10, 2 + 2 * SCHEME_COLORS, paletteInit));
        theme.add(op(Opcode.RETURN_OBJECT, 10));
        classes.add(featureClass(FEATURE_THEME, OBJECT, List.of(),
                define(FEATURE_THEME, "invoke", OBJECT, false, body(55, theme.toArray(new Instruction[0])), OBJECT, OBJECT)));
        return classes;
    }

    /**
     * A color scheme built in v9 and stored in [field]: its first two colors copied from v[background],
     * its third from v[text] and the rest from v[rest], asking color about each register in [hooks]
     * just before the constructor.
     */
    private static List<Instruction> schemeBuild(String field, int background, int text, int rest, List<Integer> hooks) {
        List<Instruction> build = new ArrayList<>(List.of(type(Opcode.NEW_INSTANCE, 9, FEATURE_SCHEME)));
        for (int p = 0; p < SCHEME_COLORS; p++) {
            build.add(new ImmutableInstruction22x(Opcode.MOVE_WIDE_FROM16, 10 + 2 * p, p < 2 ? background : p == 2 ? text : rest));
        }
        for (int hook : hooks) build.addAll(pureBlackHook(PURE_COLOR, hook));
        build.add(new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 9, 1 + 2 * SCHEME_COLORS, SCHEME_INIT));
        build.add(staticField(Opcode.SPUT_OBJECT, 9, FEATURE_SCHEMES, field, FEATURE_SCHEME));
        return build;
    }

    /** const-wide v[register], [value]: a 64-bit load, as Threads loads an ARGB color. */
    private static Instruction constWide(int register, long value) {
        return new ImmutableInstruction51l(Opcode.CONST_WIDE, register, value);
    }

    /** A Pure black hook on the pair at v[register]: the range call with its move-result-wide back into it. */
    private static List<Instruction> pureBlackHook(ImmutableMethodReference hook, int register) {
        return List.of(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 2, hook), op(Opcode.MOVE_RESULT_WIDE, register));
    }

    /**
     * The HushThreads settings row's host shapes: Threads' settings row and Accounts Center row, each
     * holding its note, an entry enum whose static initializer makes PRIVACY 0 and MORE 1, and the
     * list lambda that switches on an entry's ordinal. Each case starts its group on the composer in
     * v12, sets a click, label and icon and goes to a run they share, which copies the composer in
     * and reads the modifier from a static field for the settings row call. When [hooked], the MORE
     * case asks ThreadsSettingsRow.add about v12 right before its goto. Faults: the hook missing, the
     * hook in the PRIVACY case instead, and the hook on the entry in v14 instead of the composer.
     */
    private static List<ClassDef> settingsRowClasses(boolean hooked, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(FEATURE_SETTINGS_SCREEN, OBJECT, List.of(),
                define(FEATURE_SETTINGS_SCREEN, "SettingsRow", "V", true, body(10,
                        string(0, "com.instagram.barcelona.settings.SettingsRow (SettingsScreen.kt:301)"), op(Opcode.RETURN_VOID)),
                        SETTINGS_ROW.getParameterTypes().toArray(new String[0])),
                define(FEATURE_SETTINGS_SCREEN, "AccountsCenterRow", "V", true, body(10,
                        string(0, "com.instagram.barcelona.settings.AccountsCenterRow (SettingsScreen.kt:342)"), op(Opcode.RETURN_VOID)),
                        ACCOUNTS_ROW.getParameterTypes().toArray(new String[0]))));

        int enumFlags = AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue() | AccessFlags.STATIC.getValue() | AccessFlags.ENUM.getValue();
        ImmutableMethodReference entryInit = method(FEATURE_ENTRY_KIND, "<init>", "V", "Ljava/lang/String;", "I");
        List<Instruction> entries = new ArrayList<>();
        List<ImmutableField> constants = new ArrayList<>();
        String[] names = {"PRIVACY", "MORE"};
        for (int n = 0; n < names.length; n++) {
            entries.addAll(List.of(type(Opcode.NEW_INSTANCE, 0, FEATURE_ENTRY_KIND), string(1, names[n]),
                    new ImmutableInstruction11n(Opcode.CONST_4, 2, n), direct(entryInit, 0, 1, 2),
                    staticField(Opcode.SPUT_OBJECT, 0, FEATURE_ENTRY_KIND, names[n], FEATURE_ENTRY_KIND)));
            constants.add(flaggedField(FEATURE_ENTRY_KIND, names[n], FEATURE_ENTRY_KIND, enumFlags));
        }
        entries.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass(FEATURE_ENTRY_KIND, "Ljava/lang/Enum;", constants,
                define(FEATURE_ENTRY_KIND, "<clinit>", "V", true, body(3, entries.toArray(new Instruction[0]))),
                define(FEATURE_ENTRY_KIND, "<init>", "V", false, body(3, direct(method("Ljava/lang/Enum;", "<init>", "V", "Ljava/lang/String;", "I"), 0, 1, 2),
                        op(Opcode.RETURN_VOID)), "Ljava/lang/String;", "I")));

        // invoke(entry, composer): v0..v12 locals, this in v13, the entry in v14 and the composer in v15.
        List<Instruction> list = new ArrayList<>(List.of(string(0, "com.instagram.barcelona.settings.SettingsScreen.<anonymous> (SettingsScreen.kt:131)"),
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 12, 15), type(Opcode.CHECK_CAST, 12, FEATURE_COMPOSER),
                type(Opcode.CHECK_CAST, 14, FEATURE_ENTRY_KIND), virtual(method(FEATURE_ENTRY_KIND, "ordinal", "I"), 14), op(Opcode.MOVE_RESULT, 1),
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 0), op(Opcode.RETURN_VOID)));
        int switchAt = 6;
        int[] cases = new int[names.length], gotos = new int[names.length];
        for (int n = 0; n < names.length; n++) {
            cases[n] = list.size();
            list.addAll(List.of(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 12, 1, 0, 0, 0, START_GROUP),
                    new ImmutableInstruction11n(Opcode.CONST_4, 5, 0), new ImmutableInstruction21s(Opcode.CONST_16, 6, 100 + n),
                    new ImmutableInstruction21s(Opcode.CONST_16, 7, 200 + n)));
            boolean more = names[n].equals("MORE");
            if (hooked && (more ? !fault.equals("settings-row-missing") && !fault.equals("settings-row-outside") : fault.equals("settings-row-outside"))) {
                list.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, more && fault.equals("settings-row-register") ? 14 : 12, 1, ADD_ROW));
            }
            gotos[n] = list.size();
            list.add(new ImmutableInstruction10t(Opcode.GOTO, 0));
        }
        int tail = list.size();
        list.addAll(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 2, 12), staticField(Opcode.SGET_OBJECT, 3, FEATURE_MODIFIER, "Companion", FEATURE_MODIFIER),
                new ImmutableInstruction11n(Opcode.CONST_4, 4, 0), new ImmutableInstruction11n(Opcode.CONST_4, 8, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 9, 0), new ImmutableInstruction11n(Opcode.CONST_4, 10, 0),
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 2, 9, SETTINGS_ROW), op(Opcode.RETURN_VOID)));
        for (int g : gotos) featureBranch(list, g, tail, Opcode.GOTO, 0, 0);
        int[] address = new int[list.size() + 1];
        for (int k = 0; k < list.size(); k++) address[k + 1] = address[k] + list.get(k).getCodeUnits();
        int payload = address[list.size()];
        // The payload sits on an even address, so the hook, three units, adds or drops the nop before it.
        if (payload % 2 != 0) {
            list.add(op(Opcode.NOP));
            payload++;
        }
        list.set(switchAt, new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, payload - address[switchAt]));
        List<ImmutableSwitchElement> targets = new ArrayList<>();
        for (int n = 0; n < names.length; n++) targets.add(new ImmutableSwitchElement(n, address[cases[n]] - address[switchAt]));
        list.add(new ImmutablePackedSwitchPayload(targets));
        classes.add(featureClass(FEATURE_SETTINGS_LIST, OBJECT, List.of(),
                define(FEATURE_SETTINGS_LIST, "invoke", "V", false, body(16, list.toArray(new Instruction[0])), OBJECT, OBJECT)));
        return classes;
    }

    /**
     * The extension's ThreadsSettingsRow and its click, as a bundle carries them: showRow written to
     * call the Accounts Center row and the click a kotlin Function0 when [hooked], and otherwise the
     * empty stub and a plain class. Faults: the stub left empty and the click without Function0.
     */
    private static List<ClassDef> settingsRowExtension(boolean hooked, String fault) {
        // showRow(composer, click, title, subtitle, icon): v0..v8 locals, the arguments in v9 to v13.
        boolean written = hooked && !fault.equals("settings-row-stub");
        List<Instruction> stub = !written ? List.of(op(Opcode.RETURN_VOID)) : List.of(
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 9), type(Opcode.CHECK_CAST, 0, FEATURE_COMPOSER),
                staticField(Opcode.SGET_OBJECT, 1, FEATURE_MODIFIER, "Companion", FEATURE_MODIFIER),
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 11), new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 3, 12),
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, 10), type(Opcode.CHECK_CAST, 4, FUNCTION0),
                new ImmutableInstruction22x(Opcode.MOVE_FROM16, 5, 13), new ImmutableInstruction11n(Opcode.CONST_4, 6, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 7, 0), new ImmutableInstruction11n(Opcode.CONST_4, 8, 0),
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 9, ACCOUNTS_ROW), op(Opcode.RETURN_VOID));
        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(FEATURE_SETTINGS_ROW, OBJECT, List.of(),
                define(FEATURE_SETTINGS_ROW, "add", "V", true, body(1, op(Opcode.RETURN_VOID)), OBJECT),
                define(FEATURE_SETTINGS_ROW, "showRow", "V", true, body(written ? 14 : 5, stub.toArray(new Instruction[0])),
                        OBJECT, OBJECT, "Ljava/lang/String;", "Ljava/lang/String;", "I")));
        List<String> interfaces = hooked && !fault.equals("settings-row-click") ? List.of(FUNCTION0) : List.of();
        classes.add(new ImmutableClassDef(FEATURE_ROW_CLICK, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT, interfaces,
                null, null, List.of(), List.of(define(FEATURE_ROW_CLICK, "invoke", OBJECT, false,
                        body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0))))));
        // Copy text comes with the settings patch, so its extension class rides along.
        classes.add(featureClass(FEATURE_COPY_TEXT, OBJECT, List.of(),
                define(FEATURE_COPY_TEXT, "longPress", OBJECT, true, body(2, op(Opcode.RETURN_OBJECT, 0)), OBJECT, OBJECT),
                define(FEATURE_COPY_TEXT, "selection", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z")));
        return classes;
    }

    private static final String FEATURE_COPY_TEXT = "Lapp/morphe/extension/hushthreads/feed/CopyText;";
    private static final ImmutableMethodReference COPY_LONG_PRESS = method(FEATURE_COPY_TEXT, "longPress", OBJECT, OBJECT, OBJECT);
    private static final ImmutableMethodReference COPY_SELECTION = method(FEATURE_COPY_TEXT, "selection", "Z", "Z");
    private static final String PRESS_OVERRIDE = "Lfixture/PressOverride;";
    private static final String POST_ROW = "Lfixture/PostRow;";
    private static final String POST_ROW_TEXT = "Lfixture/PostRowText;";
    private static final String POST_TEXT = "Lfixture/PostText;";
    private static final ImmutableMethodReference POST_ROW_PLAIN = method(POST_ROW, "plain", "V", "Ljava/lang/String;");
    private static final ImmutableMethodReference POST_ROW_PRESS = method(POST_ROW, "press", "V", "Ljava/lang/String;", FUNCTION0);

    /**
     * Copy text's host shapes. Two post row lambdas, text and link preview, each read their long
     * press override into v1 and check it for null: a null one takes the row's plain press, and any
     * other is read for its Function0 action, which the row presses when it's set. The text lambda
     * is 451's, checking the override straight after reading it and jumping to its action. The link
     * lambda is 452's, writing v2 between the read and the check, then falling into the action and
     * testing the override's enabled boolean before the action.
     * v0 holds the row's note and is read on both sides, v2 to v4 are locals, v4 one nothing reads,
     * this is v5 and the lambda's argument v6. PostText(state, selectable, modifier, flags) copies
     * its boolean into v1 after its selection note and tests that. PostRow's plain press and
     * PostText's Preview are methods a stray call can go into.
     *
     * When [hooked], each override check gets the patch's five instructions in front of it, taking
     * v4, and when [asks], PostText asks selection() about its boolean first thing. The faults break
     * one part each: the hook missing from the link lambda, after the check instead of in front of
     * it, sending a null override past the check, testing another register for null, reading another
     * action or reading it from another register, taking v0, the argument or the override's own
     * register, swapping longPress's arguments, dropping its answer, casting it to Function0, put in
     * twice, a stray call, an added instruction in Threads' own code, and the same for the selection
     * hook. shared, none, actions, selection-written, selection-constant, selection-default,
     * selection-unchecked and selection-twice are stock faults, on both sides: a second way into the
     * text lambda's check, a nop between each action read and its test so neither lambda checks an override, the link lambda pressing another
     * action, a selection check that tests a negated copy of the boolean, one that tests a constant
     * instead of it, one whose left-out default is a call's answer rather than Compose's 0 or 1, no
     * if-eqz after the selection note, and PostRow's plain press holding a selection note too.
     */
    private static List<ClassDef> copyTextClasses(boolean patched, boolean hooked, boolean asks, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(PRESS_OVERRIDE, OBJECT, List.of(featureField(PRESS_OVERRIDE, "action", FUNCTION0), featureField(PRESS_OVERRIDE, "other", FUNCTION0),
                featureField(PRESS_OVERRIDE, "enabled", "Z"))));
        boolean stray = patched && (fault.equals("copy-text-stray"));
        List<Instruction> plain = new ArrayList<>();
        if (stray) plain.addAll(List.of(invoke(COPY_LONG_PRESS, 0, 0), op(Opcode.MOVE_RESULT_OBJECT, 0)));
        // selection-twice gives the plain press a selection note too.
        if (fault.equals("copy-text-selection-twice")) plain.add(string(0, "com.instagram.barcelona.feed.post.ui.rememberPostTextSelectionState (PostTextSelectionMode.kt:52)"));
        plain.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass(POST_ROW, OBJECT, List.of(),
                define(POST_ROW, "plain", "V", true, body(1, plain.toArray(new Instruction[0])), "Ljava/lang/String;"),
                define(POST_ROW, "press", "V", true, body(2, op(Opcode.RETURN_VOID)), "Ljava/lang/String;", FUNCTION0)));
        for (String owner : List.of(POST_ROW_TEXT, "Lfixture/PostRowLink;")) {
            boolean text = owner.equals(POST_ROW_TEXT);
            // actions has the link lambda press another action, and its hook read that one.
            String own = text ? fault : fault.equals("copy-text-actions") ? "copy-text-actions-link" : "";
            String action = own.equals("copy-text-actions-link") ? "other" : "action";
            BrowserCode code = new BrowserCode();
            code.add(string(0, "com.instagram.barcelona.feed.post.ui.FeedPostRow.<anonymous>.<anonymous> (FeedPostRow.kt:" + (text ? 812 : 845) + ")"));
            code.add(objectField(Opcode.IGET_OBJECT, 1, 5, owner, "override", PRESS_OVERRIDE));
            // As on 452, the link lambda reads its override earlier than the instruction before its check.
            if (!text) code.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
            boolean front = hooked && !own.equals("copy-text-moved") && !(fault.equals("copy-text-missing") && !text);
            List<Integer> skips = new ArrayList<>();
            int entry = code.size();
            for (int n = front ? own.equals("copy-text-double") ? 2 : 1 : 0; n > 0; n--) skips.add(copyTextHook(code, own));
            // none puts a nop between each lambda's action read and its test, so neither check is an override check.
            boolean none = fault.equals("copy-text-none");
            if (text) {
                // 451: a set override jumps to its action, tested straight after it's read.
                int guard = code.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 1));
                code.add(invoke(POST_ROW_PLAIN, 0));
                if (patched && (own.equals("copy-text-body") || own.equals("copy-text-omitted-body"))) code.add(op(Opcode.NOP));
                code.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
                code.add(op(Opcode.RETURN_OBJECT, 2));
                int has = code.size();
                if (hooked && own.equals("copy-text-moved")) skips.add(copyTextHook(code, own));
                code.add(objectField(Opcode.IGET_OBJECT, 3, 1, PRESS_OVERRIDE, action, FUNCTION0));
                if (none) code.add(op(Opcode.NOP));
                int set = code.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 3, 1));
                code.add(op(Opcode.RETURN_OBJECT, 1));
                int act = code.size();
                code.add(invoke(POST_ROW_PRESS, 0, 3));
                code.add(op(Opcode.RETURN_OBJECT, 1));
                // shared reaches the check from a goto past the end too, which lands on its hook.
                if (fault.equals("copy-text-shared")) code.to(code.branch(new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t(Opcode.GOTO_16, 1)), entry);
                code.to(guard, has);
                code.to(set, act);
                // Each hook's null side goes to what follows it, or for target past the check to the plain press.
                for (int skip : skips) code.to(skip, own.equals("copy-text-target") ? guard + 1 : skip + 5);
            } else {
                // 452: a set override falls into its action, read after a boolean of the override's and
                // tested after it.
                int guard = code.branch(ifEqz(1, 1));
                code.add(objectField(Opcode.IGET_BOOLEAN, 2, 1, PRESS_OVERRIDE, "enabled", "Z"));
                code.add(objectField(Opcode.IGET_OBJECT, 3, 1, PRESS_OVERRIDE, action, FUNCTION0));
                if (none) code.add(op(Opcode.NOP));
                int enabled = code.branch(ifEqz(2, 1));
                int set = code.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 3, 1));
                int idle = code.size();
                code.add(op(Opcode.RETURN_OBJECT, 1));
                int act = code.size();
                code.add(invoke(POST_ROW_PRESS, 0, 3));
                code.add(op(Opcode.RETURN_OBJECT, 1));
                int unset = code.size();
                code.add(invoke(POST_ROW_PLAIN, 0));
                code.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
                code.add(op(Opcode.RETURN_OBJECT, 2));
                code.to(guard, unset);
                code.to(enabled, idle);
                code.to(set, act);
                for (int skip : skips) code.to(skip, skip + 5);
            }
            classes.add(featureClass(owner, OBJECT, List.of(featureField(owner, "override", PRESS_OVERRIDE)),
                    define(owner, "invoke", OBJECT, false, body(7, code.finish()), OBJECT)));
        }

        // PostText(state, selectable, modifier, flags): v0..v2 locals, the arguments in v3 to v6. As in
        // 451, a caller that leaves the boolean out gets Compose's 0 from code at the end, which jumps
        // back to the check.
        BrowserCode post = new BrowserCode();
        if (asks && !fault.equals("copy-text-selection-missing")) {
            int flag = fault.equals("copy-text-selection-register") ? 6 : 4;
            post.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, flag, 1, COPY_SELECTION));
            post.add(op(Opcode.MOVE_RESULT, fault.equals("copy-text-selection-result") ? 2 : flag));
        }
        post.add(string(0, "com.instagram.barcelona.feed.post.ui.rememberPostTextSelectionState (PostTextSelectionMode.kt:44)"));
        post.add(new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 2, 6, 1));
        int defaults = post.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 2, 0));
        post.add(fault.equals("copy-text-selection-written") ? new ImmutableInstruction22b(Opcode.XOR_INT_LIT8, 1, 4, 1)
                : fault.equals("copy-text-selection-constant") ? new ImmutableInstruction11n(Opcode.CONST_4, 1, 1)
                : new ImmutableInstruction12x(Opcode.MOVE, 1, 4));
        int check = post.branch(fault.equals("copy-text-selection-unchecked") ? new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 0) : ifEqz(1, 0));
        post.add(invoke(method(POST_TEXT, "select", "V", OBJECT), 3));
        int end = post.size();
        if (patched && (fault.equals("copy-text-selection-body") || fault.equals("copy-text-omitted-selection-body"))) post.add(op(Opcode.NOP));
        post.add(op(Opcode.RETURN_VOID));
        int fallback = post.size();
        if (fault.equals("copy-text-selection-default")) {
            post.add(invoke(method(POST_TEXT, "selectable", "Z")));
            post.add(op(Opcode.MOVE_RESULT, 1));
        } else {
            post.add(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0));
        }
        int back = post.branch(new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t(Opcode.GOTO_16, 0));
        post.to(defaults, fallback);
        post.to(check, end);
        post.to(back, check);
        List<Instruction> preview = new ArrayList<>();
        if (patched && fault.equals("copy-text-selection-stray")) preview.addAll(List.of(invoke(COPY_SELECTION, 0), op(Opcode.MOVE_RESULT, 0)));
        preview.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass(POST_TEXT, OBJECT, List.of(),
                define(POST_TEXT, "PostText", "V", true, body(7, post.finish()), OBJECT, "Z", OBJECT, "I"),
                define(POST_TEXT, "Preview", "V", true, body(1, preview.toArray(new Instruction[0])), "Z"),
                define(POST_TEXT, "select", "V", true, body(1, op(Opcode.RETURN_VOID)), OBJECT),
                define(POST_TEXT, "selectable", "Z", true, body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)))));
        return classes;
    }

    /**
     * The patch's hook in front of an override check on v1, as [fault] bends it: if-eqz v1, the
     * override's action into v4, longPress(v1, v4), its answer back into v1, cast to the override's
     * type. Answers where the if-eqz is, for the caller to aim.
     */
    private static int copyTextHook(BrowserCode code, String fault) {
        int free = fault.equals("copy-text-live") ? 0 : fault.equals("copy-text-parameter") ? 6 : fault.equals("copy-text-free-held") ? 1 : 4;
        int skip = code.branch(ifEqz(fault.equals("copy-text-null-register") ? 2 : 1, 1));
        code.add(objectField(Opcode.IGET_OBJECT, free, fault.equals("copy-text-action-register") ? 6 : 1, PRESS_OVERRIDE,
                fault.equals("copy-text-action") || fault.equals("copy-text-actions-link") ? "other" : "action", FUNCTION0));
        code.add(fault.equals("copy-text-swapped") ? invoke(COPY_LONG_PRESS, free, 1) : invoke(COPY_LONG_PRESS, 1, free));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, fault.equals("copy-text-result") ? free : 1));
        code.add(type(Opcode.CHECK_CAST, 1, fault.equals("copy-text-cast") ? FUNCTION0 : PRESS_OVERRIDE));
        return skip;
    }

    private static final String BROWSER_TEXT = "Ljava/lang/String;", BROWSER_INTENT = "Landroid/content/Intent;", BROWSER_STATE = "Landroidx/compose/runtime/MutableState;";
    private static final String BROWSER_LAUNCHER = "Lfixture/BrowserLauncher;", BROWSER_CTA = "Lfixture/BrowserCTA;", BROWSER_DESTINATION = "Lfixture/BrowserDestination;";
    private static final String[] BROWSER_FACTORY_PARAMETERS = {CONTEXT, OBJECT, FEATURE_MEDIA, "Lcom/instagram/common/session/UserSession;", OBJECT,
            BROWSER_TEXT, BROWSER_TEXT, BROWSER_TEXT, BROWSER_TEXT, BROWSER_TEXT};
    private static final ImmutableMethodReference BROWSER_FACTORY = method("Lfixture/BrowserIntent;", "make", BROWSER_INTENT, BROWSER_FACTORY_PARAMETERS);
    private static final ImmutableMethodReference BROWSER_SHOW = method("Lfixture/BrowserView;", "show", "V", BROWSER_INTENT);

    /**
     * Threads 453's browser: the launcher asks first, the factory makes the Intent, and five places
     * call the factory. The launcher's own helper and the immersive screen, already routed, stay as
     * shipped, while the lead form, the ad and the media viewer each take a hook of their own.
     */
    private static void directBrowserClasses(List<ClassDef> classes, boolean enabled, String fault) {
        for (int n = 0; n < classes.size(); n++) if (classes.get(n).getType().equals(FEATURE_MEDIA)) {
            ClassDef original = classes.get(n);
            List<ImmutableField> fields = new ArrayList<>(); original.getFields().forEach(f -> fields.add(ImmutableField.of(f)));
            fields.add(featureField(FEATURE_MEDIA, "ctas", "Ljava/util/List;"));
            classes.set(n, new ImmutableClassDef(original.getType(), original.getAccessFlags(), original.getSuperclass(), original.getInterfaces(),
                    original.getSourceFile(), original.getAnnotations(), fields, original.getMethods()));
        }
        String uri = "Landroid/net/Uri;", requestOwner = "Lfixture/BrowserAdRequest;";
        List<Instruction> factory = new ArrayList<>(List.of(string(0, "TrackingInfo.ARG_MODULE_NAME"), string(1, "BrowserLiteIntent.OPEN_WITH_URL"),
                invoke(method(uri, "parse", uri, BROWSER_TEXT), 12), op(Opcode.MOVE_RESULT_OBJECT, 0), type(Opcode.NEW_INSTANCE, 1, BROWSER_INTENT),
                direct(method(BROWSER_INTENT, "<init>", "V"), 1), virtual(method(BROWSER_INTENT, "setData", BROWSER_INTENT, uri), 1, 0), op(Opcode.RETURN_OBJECT, 1)));
        if (enabled && fault.equals("browser-direct-factory-hook")) factory.add(0, invoke(LINK_OPENER, 7, 12));
        classes.add(featureClass(BROWSER_FACTORY.getDefiningClass(), OBJECT, List.of(), define(BROWSER_FACTORY.getDefiningClass(), "make", BROWSER_INTENT, true,
                body(17, factory.toArray(new Instruction[0])), BROWSER_FACTORY_PARAMETERS)));
        classes.add(featureClass(BROWSER_CTA, OBJECT, List.of(featureField(BROWSER_CTA, "webUrl", BROWSER_TEXT)), define(BROWSER_CTA, "kind", BROWSER_DESTINATION, false,
                body(2, staticField(Opcode.SGET_OBJECT, 0, BROWSER_DESTINATION, "web", BROWSER_DESTINATION), op(Opcode.RETURN_OBJECT, 0)))));
        classes.add(featureClass(BROWSER_DESTINATION, OBJECT, List.of(new ImmutableField(BROWSER_DESTINATION, "web", BROWSER_DESTINATION,
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, null))));
        // The ad request builds the launcher from the web link of its call to action, the link being
        // the third of the constructor's arguments.
        classes.add(featureClass(requestOwner, OBJECT, List.of(featureField(requestOwner, "cta", BROWSER_CTA)), define(requestOwner, "request", "V", false,
                body(14, string(10, "AdClickHandler.openWebLink missing webUri for AD_DESTINATION_WEB"),
                        objectField(Opcode.IGET_OBJECT, 1, 11, requestOwner, "cta", BROWSER_CTA), objectField(Opcode.IGET_OBJECT, 5, 1, BROWSER_CTA, "webUrl", BROWSER_TEXT),
                        type(Opcode.NEW_INSTANCE, 2, BROWSER_LAUNCHER), new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),
                        new ImmutableInstruction11n(Opcode.CONST_4, 4, 0), new ImmutableInstruction11n(Opcode.CONST_4, 6, 0),
                        new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 2, 5, method(BROWSER_LAUNCHER, "<init>", "V", CONTEXT, OBJECT, BROWSER_TEXT, BROWSER_TEXT)),
                        virtual(method(BROWSER_LAUNCHER, "launch", "V"), 2), op(Opcode.RETURN_VOID)), FEATURE_MEDIA, OBJECT)));
        classes.add(browserLauncher(enabled, fault));
        classes.add(browserLead(enabled, fault));
        classes.add(browserAd(enabled, fault));
        classes.add(browserMedia(enabled, fault));
        classes.add(browserImmersive(enabled, fault));
    }

    private static Instruction browserFactoryCall(int first) {
        return new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, first, 10, BROWSER_FACTORY);
    }

    /** Null into every register of the factory's range from [first] but those the site fills itself. */
    private static void browserNulls(List<Instruction> code, int first, int... filled) {
        for (int r = first; r < first + 10; r++) {
            int register = r;
            if (Arrays.stream(filled).noneMatch(f -> f == register)) code.add(new ImmutableInstruction11n(Opcode.CONST_4, r, 0));
        }
    }

    /** The launcher, its constructor, and the helper making its Intent, which the patch leaves alone. */
    private static ClassDef browserLauncher(boolean enabled, String fault) {
        String owner = BROWSER_LAUNCHER;
        List<Instruction> launch = new ArrayList<>();
        if (enabled && !fault.equals("browser-missing")) {
            launch.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 5));
            launch.add(objectField(Opcode.IGET_OBJECT, 0, 2, owner, "context", CONTEXT));
            launch.add(objectField(Opcode.IGET_OBJECT, 1, 2, owner, fault.equals("browser-register") ? "other" : "link", BROWSER_TEXT));
            launch.add(invoke(LINK_OPENER, 0, 1));
            int result = fault.equals("browser-clobber") ? 5 : 0;
            launch.add(op(Opcode.MOVE_RESULT, result));
            // Past the hook's return-void to the stock's first instruction, or straight to its return.
            launch.add(ifEqz(result, fault.equals("browser-bypass") ? 16 : 3));
            launch.add(op(Opcode.RETURN_VOID));
        }
        // The clobbering hook takes this's own register for its answer. Stock code reading the hook's copy
        // instead leaves the build valid, so that write is the contract's to see.
        launch.addAll(List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, fault.equals("browser-clobber") ? 2 : 5), objectField(Opcode.IGET_OBJECT, 3, 4, owner, "link", BROWSER_TEXT),
                type(Opcode.NEW_INSTANCE, 1, "Ljava/net/URI;"), direct(method("Ljava/net/URI;", "<init>", "V", BROWSER_TEXT), 1, 3), string(0, LAUNCHER_MESSAGE),
                objectField(Opcode.IGET_OBJECT, 0, 4, owner, "context", CONTEXT), op(Opcode.RETURN_VOID)));
        List<Instruction> helper = new ArrayList<>(List.of(objectField(Opcode.IGET_OBJECT, 0, 10, owner, "context", CONTEXT), objectField(Opcode.IGET_OBJECT, 5, 10, owner, "link", BROWSER_TEXT)));
        browserNulls(helper, 0, 0, 5);
        helper.addAll(List.of(browserFactoryCall(0), op(Opcode.MOVE_RESULT_OBJECT, 0), op(Opcode.RETURN_OBJECT, 0)));
        return featureClass(owner, OBJECT, List.of(featureField(owner, "context", CONTEXT), featureField(owner, "link", BROWSER_TEXT), featureField(owner, "other", BROWSER_TEXT)),
                define(owner, "launch", "V", false, body(6, launch.toArray(new Instruction[0]))),
                define(owner, "<init>", "V", false, body(6, direct(method(OBJECT, "<init>", "V"), 1), objectField(Opcode.IPUT_OBJECT, 2, 1, owner, "context", CONTEXT),
                        objectField(Opcode.IPUT_OBJECT, 4, 1, owner, "link", BROWSER_TEXT), objectField(Opcode.IPUT_OBJECT, 5, 1, owner, "other", BROWSER_TEXT), op(Opcode.RETURN_VOID)),
                        CONTEXT, OBJECT, BROWSER_TEXT, BROWSER_TEXT),
                define(owner, "helper", BROWSER_INTENT, true, body(11, helper.toArray(new Instruction[0])), owner));
    }

    /** The lead form and privacy policy helper, an empty link standing in for a null one, leaving past its goto. */
    private static ClassDef browserLead(boolean enabled, String fault) {
        String owner = "Lfixture/BrowserLead;";
        BrowserCode code = new BrowserCode();
        code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 12, 13));
        code.add(objectField(Opcode.IGET_OBJECT, 2, 12, owner, "context", CONTEXT));
        code.add(objectField(Opcode.IGET_OBJECT, 7, 12, owner, "link", BROWSER_TEXT));
        int present = code.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 7, 1));
        code.add(string(7, ""));
        code.to(present, code.size());
        code.add(string(1, "android.intent.action.VIEW"));
        browserNulls(code.code, 2, 2, 7);
        // lead-parameter takes v13, this, which nothing reads past the start, so only the locals bound
        // sees it. lead-live takes v3, an argument of the factory's range and nothing else, so only the
        // hook-site check does.
        int[] hook = !enabled || fault.equals("browser-direct-lead-missing") ? null : code.hook(2, fault.equals("browser-direct-lead-url") ? 8 : 7, 0,
                fault.equals("browser-direct-lead-parameter") ? 13 : fault.equals("browser-direct-lead-live") ? 3 : 1);
        code.add(browserFactoryCall(2));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        code.add(virtual(method(CONTEXT, "startActivity", "V", BROWSER_INTENT), 2, 0));
        int opened = code.jump();
        int done = code.size();
        code.to(opened, done);
        code.add(staticField(Opcode.SGET_OBJECT, 0, "Lfixture/Unit;", "INSTANCE", "Lfixture/Unit;"));
        code.add(op(Opcode.RETURN_OBJECT, 0));
        if (hook != null) {
            code.to(hook[1], hook[0] + 6);
            code.to(hook[2], fault.equals("browser-direct-lead-double-open") ? hook[0] + 6 : done);
        }
        return featureClass(owner, OBJECT, List.of(featureField(owner, "context", CONTEXT), featureField(owner, "link", BROWSER_TEXT)),
                define(owner, "invoke", OBJECT, false, body(14, code.finish())));
    }

    /** The ad: a builder making the Intent from the ad's own link, and the opener whose first act the hook is. */
    private static ClassDef browserAd(boolean enabled, String fault) {
        String owner = "Lfixture/BrowserAd;";
        ImmutableMethodReference build = method(owner, "build", BROWSER_INTENT, ACTIVITY);
        List<Instruction> builder = new ArrayList<>(List.of(objectField(Opcode.IGET_OBJECT, 5, 10, owner, "link", BROWSER_TEXT), new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 11)));
        browserNulls(builder, 0, 0, 5);
        builder.addAll(List.of(browserFactoryCall(0), op(Opcode.MOVE_RESULT_OBJECT, 0), op(Opcode.RETURN_OBJECT, 0)));
        BrowserCode code = new BrowserCode();
        int declined = -1, success = -1;
        if (enabled && !fault.equals("browser-direct-ad-missing")) {
            code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, 4));
            code.add(objectField(Opcode.IGET_OBJECT, 1, 1, owner, fault.equals("browser-direct-ad-url") ? "other" : "link", BROWSER_TEXT));
            code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, fault.equals("browser-direct-ad-context") ? 6 : 5));
            code.add(invoke(LINK_OPENER, 0, 1));
            code.add(op(Opcode.MOVE_RESULT, 0));
            declined = code.branch(ifEqz(0, 1));
            code.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, fault.equals("browser-direct-ad-return") ? 0 : 1));
            if (fault.equals("browser-direct-ad-double-open")) success = code.jump();
            else code.add(op(Opcode.RETURN, 0));
        }
        int stock = code.size();
        code.add(virtual(build, 4, 5));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 0));
        code.add(invoke(BROWSER_SHOW, 0));
        int answer = code.size();
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 1, 1));
        if (fault.equals("browser-direct-omitted-body")) code.add(op(Opcode.NOP));
        code.add(op(Opcode.RETURN, 1));
        if (declined >= 0) code.to(declined, fault.equals("browser-direct-ad-bypass") ? answer : stock);
        if (success >= 0) code.to(success, stock);
        return featureClass(owner, OBJECT, List.of(featureField(owner, "link", BROWSER_TEXT), featureField(owner, "other", BROWSER_TEXT)),
                define(owner, "build", BROWSER_INTENT, false, body(12, builder.toArray(new Instruction[0])), ACTIVITY),
                define(owner, "open", "Z", false, body(8, code.finish()), ACTIVITY, CONTEXT, OBJECT));
    }

    /**
     * The media viewer's swipe up: its ending, setting its state from the path's flag, comes ahead of
     * the call as it does on 453, and an ad with no web link clears the flag and goes there too.
     */
    private static ClassDef browserMedia(boolean enabled, String fault) {
        String owner = "Lfixture/BrowserMedia;";
        boolean completionLive = fault.equals("browser-direct-media-completion-live");
        BrowserCode code = new BrowserCode();
        code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 22));
        code.add(objectField(Opcode.IGET_OBJECT, 13, 0, owner, "context", CONTEXT));
        code.add(objectField(Opcode.IGET_OBJECT, 14, 0, owner, "opened", BROWSER_STATE));
        code.add(objectField(Opcode.IGET_OBJECT, 1, 0, owner, "post", FEATURE_MEDIA));
        code.add(string(10, "AD_DESTINATION_WEB"));
        code.add(invoke(method("Lfixture/BrowserView;", "same", "Z", OBJECT, OBJECT), 1, 1));
        code.add(op(Opcode.MOVE_RESULT, 15));
        int enter = code.jump();
        int done = code.size();
        code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, 14));
        code.add(invoke(method("Lfixture/State;", "set", "V", BROWSER_STATE, "Z"), 1, 15));
        // completion-live's stock ending answers what v2 holds there, the factory's answer on the way
        // from the call: v2 is written past the hook site and live where the hook's success goes.
        code.add(staticField(Opcode.SGET_OBJECT, completionLive ? 0 : 2, "Lfixture/Unit;", "INSTANCE", "Lfixture/Unit;"));
        code.add(op(Opcode.RETURN_OBJECT, 2));
        code.to(enter, code.size());
        code.add(objectField(Opcode.IGET_OBJECT, 2, 1, FEATURE_MEDIA, "ctas", "Ljava/util/List;"));
        code.add(invoke(method("Lfixture/Lists;", "first", OBJECT, "Ljava/util/List;"), 2));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 2));
        code.add(type(Opcode.CHECK_CAST, 2, BROWSER_CTA));
        code.add(virtual(method(BROWSER_CTA, "kind", BROWSER_DESTINATION), 2));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 3));
        code.add(staticField(Opcode.SGET_OBJECT, 0, BROWSER_DESTINATION, "web", BROWSER_DESTINATION));
        int guard = code.branch(new ImmutableInstruction22t(Opcode.IF_NE, 3, 0, 1));
        code.add(objectField(Opcode.IGET_OBJECT, 3, 2, BROWSER_CTA, "webUrl", BROWSER_TEXT));
        int noUrl = code.branch(ifEqz(3, 1));
        for (int r = 4; r <= 13; r++) {
            int source = r == 4 ? 13 : r == 6 ? 1 : r == 9 ? 3 : -1;
            code.add(source >= 0 ? new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, r, source) : new ImmutableInstruction11n(Opcode.CONST_4, r, 0));
        }
        // media-live takes v14, which the ending reads on every way there, so the hook site sees it
        // first. completion-live takes v2, which only that build's ending reads.
        int[] hook = !enabled || fault.equals("browser-direct-media-missing") ? null : code.hook(fault.equals("browser-direct-media-context") ? 5 : 4,
                fault.equals("browser-direct-media-url") ? 10 : 9, 0, fault.equals("browser-direct-media-live") ? 14 : completionLive ? 2 : 3);
        int factoryAt = code.size();
        code.add(browserFactoryCall(4));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 2));
        code.add(invoke(BROWSER_SHOW, 2));
        code.to(code.jump(), done);
        int failed = code.size();
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 15, 0));
        code.to(code.jump(), done);
        code.to(guard, failed);
        code.to(noUrl, failed);
        if (hook != null) {
            code.to(hook[1], fault.equals("browser-direct-media-bypass") ? done : hook[0] + 6);
            code.to(hook[2], fault.equals("browser-direct-media-double-open") ? factoryAt : fault.equals("browser-direct-media-false") ? failed
                    : fault.equals("browser-direct-media-uninitialized") ? factoryAt + 2 : done);
        }
        return featureClass(owner, OBJECT, List.of(featureField(owner, "context", CONTEXT), featureField(owner, "opened", BROWSER_STATE), featureField(owner, "post", FEATURE_MEDIA)),
                define(owner, "invokeSuspend", OBJECT, false, body(24, code.finish()), OBJECT));
    }

    private static ClassDef browserImmersive(boolean enabled, String fault) {
        String owner = "Lfixture/BrowserImmersive;";
        BrowserCode code = new BrowserCode();
        code.add(string(10, "com.instagram.barcelona.inappbrowser.compose.ImmersiveBrowserScreen (ImmersiveBrowserScreen.kt:97)"));
        for (int r = 0; r < 10; r++) code.add(r == 0 || r == 5 ? new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, r, r == 0 ? 12 : 16)
                : new ImmutableInstruction11n(Opcode.CONST_4, r, 0));
        if (enabled && fault.equals("browser-direct-immersive-hook")) code.add(invoke(LINK_OPENER, 0, 5));
        code.add(browserFactoryCall(0));
        code.add(op(Opcode.MOVE_RESULT_OBJECT, 2));
        code.add(invoke(BROWSER_SHOW, 2));
        code.add(op(Opcode.RETURN_VOID));
        return featureClass(owner, OBJECT, List.of(), define(owner, "open", "V", true, body(24, code.finish()),
                CONTEXT, OBJECT, OBJECT, OBJECT, BROWSER_TEXT, BROWSER_TEXT, BROWSER_TEXT, "Lkotlin/jvm/functions/Function0;", "I", "I", "I", "Z"));
    }

    /** Branch addresses are calculated after hooks have been placed, independently of the verifier. */
    private static final class BrowserCode {
        final List<Instruction> code = new ArrayList<>();
        final Map<Integer, Integer> jumps = new LinkedHashMap<>();
        int size() { return code.size(); }
        void add(Instruction instruction) { code.add(instruction); }
        int branch(Instruction instruction) { int at = size(); add(instruction); return at; }
        void to(int from, int target) { jumps.put(from, target); }
        int jump() { return branch(new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t(Opcode.GOTO_16, 1)); }
        /** Six instructions, the link copied first: the if-eqz a declined link takes, then the goto an opened one does. */
        int[] hook(int context, int url, int answer, int link) {
            int start = size();
            add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, link, url));
            add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, answer, context));
            add(invoke(LINK_OPENER, answer, link));
            add(op(Opcode.MOVE_RESULT, answer));
            int declined = branch(ifEqz(answer, 1));
            return new int[]{start, declined, jump()};
        }
        Instruction[] finish() {
            int[] address = new int[size()];
            for (int n = 1; n < size(); n++) address[n] = address[n - 1] + code.get(n - 1).getCodeUnits();
            for (var jump : jumps.entrySet()) {
                int n = jump.getKey(), delta = address[jump.getValue()] - address[n]; Instruction old = code.get(n);
                code.set(n, old instanceof com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction two
                        ? new ImmutableInstruction22t(old.getOpcode(), two.getRegisterA(), two.getRegisterB(), delta)
                        : old instanceof com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction one ? new ImmutableInstruction21t(old.getOpcode(), one.getRegisterA(), delta)
                        : new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t(Opcode.GOTO_16, delta));
            }
            return code.toArray(new Instruction[0]);
        }
    }

    private static final String SEARCH_LIST = "Lfixture/SearchList;";
    private static final String SEARCH_ITEMS = "Lfixture/SearchItems;";
    private static final String FEATURE_SEARCH = "Lapp/morphe/extension/hushthreads/search/SearchSuggestions;";
    private static final ImmutableMethodReference SHOW_SEARCH_CAROUSEL = method(FEATURE_SEARCH, "showCarousel", "Z");

    /**
     * Search's list builder in 451's shape, as much of it as the carousel contract reads: the
     * suggestions list read out of a field, its isEmpty() answer, an if-nez that sends an empty list
     * to the rest of the list and falls into the carousel's path, the carousel added under its key,
     * and then the rest. v0..v5 are locals, this is v6, the list's items v7 and an unused parameter
     * v8. v3 is an int only the carousel's path reads, and v4 one only the rest reads, since the
     * carousel's path writes it before it gets there: a hook taking either is live on one edge alone.
     * [hooked] puts the hook in with v5, which nothing reads. refresh() is a second method of the
     * class, where a stray call goes, and scrolled() 452's scroll depth log, which holds the key
     * only to compare it.
     */
    private static List<ClassDef> searchCarouselClasses(boolean hooked, String fault) {
        BrowserCode code = new BrowserCode();
        code.add(objectField(Opcode.IGET_OBJECT, 0, 6, SEARCH_LIST, "suggested", SHORTCUT_LIST));
        code.add(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 0, 0, 0, 0, 0, method(SHORTCUT_LIST, "isEmpty", "Z")));
        code.add(op(Opcode.MOVE_RESULT, 1));
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 3, fault.equals("search-carousel-body") ? 2 : 1));
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 4, 1));
        int guard = code.branch(new ImmutableInstruction21t(Opcode.IF_NEZ, 1, 1));
        List<Integer> leaves = new ArrayList<>();
        int copies = !hooked || fault.equals("search-carousel-missing") ? 0 : fault.equals("search-carousel-double") ? 2 : 1;
        int scratch = fault.equals("search-carousel-live-start") ? 3 : fault.equals("search-carousel-live-away") ? 4
                : fault.equals("search-carousel-parameter") ? 8 : 5;
        for (int n = 0; n < copies; n++) {
            code.add(invoke(SHOW_SEARCH_CAROUSEL));
            // ignored drops the answer and tests a constant, so the carousel always shows.
            code.add(fault.equals("search-carousel-ignored") ? new ImmutableInstruction11n(Opcode.CONST_4, scratch, 1) : op(Opcode.MOVE_RESULT, scratch));
            leaves.add(code.branch(new ImmutableInstruction21t(fault.equals("search-carousel-inverted") ? Opcode.IF_NEZ : Opcode.IF_EQZ, scratch, 1)));
        }
        code.add(string(2, "standalone_suggested_users"));
        code.add(virtual(method(SEARCH_ITEMS, "item", "V", OBJECT, OBJECT, "I"), 7, 2, 0, 3));
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 4, 0));
        int away = code.size();
        code.add(virtual(method(SEARCH_ITEMS, "done", "V", "I"), 7, 4));
        if (fault.equals("search-carousel-omitted-body")) code.add(op(Opcode.NOP));
        int end = code.size();
        code.add(op(Opcode.RETURN_VOID));
        code.to(guard, away);
        // target leaves for the return, past the rest of the list.
        for (int leave : leaves) code.to(leave, fault.equals("search-carousel-target") ? end : away);
        List<Instruction> refresh = new ArrayList<>();
        if (fault.equals("search-carousel-stray") || fault.equals("search-carousel-omitted-call")) {
            refresh.add(invoke(SHOW_SEARCH_CAROUSEL));
            refresh.add(op(Opcode.MOVE_RESULT, 0));
        }
        refresh.add(op(Opcode.RETURN_VOID));
        // As in 452, the scroll depth log compares an item's key with the carousel's, adding nothing.
        Instruction[] scrolled = {string(0, "standalone_suggested_users"), virtual(method("Ljava/lang/String;", "equals", "Z", OBJECT), 0, 2),
                op(Opcode.MOVE_RESULT, 0), op(Opcode.RETURN, 0)};
        return List.of(featureClass(SEARCH_LIST, OBJECT, List.of(featureField(SEARCH_LIST, "suggested", SHORTCUT_LIST)),
                define(SEARCH_LIST, "build", "V", false, body(9, code.finish()), SEARCH_ITEMS, OBJECT),
                define(SEARCH_LIST, "refresh", "V", false, body(2, refresh.toArray(new Instruction[0]))),
                define(SEARCH_LIST, "scrolled", "Z", false, body(3, scrolled), OBJECT)));
    }

    private static final String SUGGESTED_ROW = "Lfixture/SuggestedUsersRow;";
    private static final String PROFILE_CAROUSEL_ROW = "Lfixture/ProfileCarouselRow;";
    private static final String PROFILE_INFO_ROW = "Lfixture/ProfileInfoRow;";
    private static final String SUGGESTIONS_ROW = "Lfixture/SuggestionsRow;";
    private static final String PROFILE_SCREEN = "Lfixture/ProfileScreen;";
    private static final String PROFILE_VIEW_MODEL = "Lcom/instagram/barcelona/profile/viewmodel/ProfileViewModel;";
    private static final String FEATURE_PROFILE = "Lapp/morphe/extension/hushthreads/profile/ProfileSuggestions;";
    private static final ImmutableMethodReference PROFILE_CAROUSEL = method(FEATURE_PROFILE, "carousel", OBJECT, OBJECT);
    private static final ImmutableMethodReference SHOW_PROFILE_ROW = method(FEATURE_PROFILE, "showRow", "Z");
    private static final ImmutableMethodReference ROW_DEFAULT = method(SUGGESTED_ROW, "Row$default", "V", SHORTCUT_LIST, OBJECT, "I");

    /**
     * The profile's suggested accounts in 451's shape, as much of it as the contract reads. Threads'
     * static row composable holds the row's note, and Row$default is the overload callers use. The
     * screen's lambda hands the row the list its constructor stored, under a ProfileScreen.kt note;
     * the info rows' lambda hands it ((SuggestionsRow) this.row).users, under a ProfileInfoRows.kt
     * note. The screen reads the list out of the state into v1 and builds the lambda only past an
     * if-nez on it. The view model's rows() makes the SuggestionsRow only past an if-eq of the list's
     * size against 0: v0..v4 are locals, this is v5, then the rows, the users and an unused int v8.
     * v0 is an int only the row's path reads and v4 one only the other side reads, since the row's
     * path writes it first, so a hook taking either is live on one edge alone; v2 and v3 are free.
     *
     * [carousel] hooks the screen with the list's own register and [row] the view model with v2. The
     * faults break one part each, and the omitted ones keep a hook, a call or a changed instruction
     * with the patch left out. shared and compared are stock faults, on both sides: a second way onto
     * the carousel, and a view model that reads what its check compared past the check's other side.
     * gap, polarity, other-register and joined are stock faults of the carousel's null check, and
     * flipped is a good layout on both sides whose row check jumps onto the row's path.
     */
    private static List<ClassDef> profileClasses(boolean carousel, boolean row, String fault) {
        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(SUGGESTED_ROW, OBJECT, List.of(),
                define(SUGGESTED_ROW, "Row", "V", true, body(3, string(0, "com.instagram.barcelona.suggestedusers.ui.SuggestedUsersRow (SuggestedUsersRow.kt:120)"),
                        op(Opcode.RETURN_VOID)), SHORTCUT_LIST, OBJECT),
                define(SUGGESTED_ROW, "Row$default", "V", true, body(3, invoke(method(SUGGESTED_ROW, "Row", "V", SHORTCUT_LIST, OBJECT), 0, 1),
                        op(Opcode.RETURN_VOID)), SHORTCUT_LIST, OBJECT, "I")));
        // The screen's lambda: v0..v2 locals, this v3, the argument v4.
        classes.add(featureClass(PROFILE_CAROUSEL_ROW, OBJECT, List.of(featureField(PROFILE_CAROUSEL_ROW, "list", SHORTCUT_LIST)),
                define(PROFILE_CAROUSEL_ROW, "<init>", "V", false, body(2, direct(method(OBJECT, "<init>", "V"), 0),
                        objectField(Opcode.IPUT_OBJECT, 1, 0, PROFILE_CAROUSEL_ROW, "list", SHORTCUT_LIST), op(Opcode.RETURN_VOID)), SHORTCUT_LIST),
                define(PROFILE_CAROUSEL_ROW, "invoke", OBJECT, false, body(5,
                        string(0, "com.instagram.barcelona.profile.ui.ProfileScreenKt$Content$1 (ProfileScreen.kt:310)"),
                        objectField(Opcode.IGET_OBJECT, 1, 3, PROFILE_CAROUSEL_ROW, "list", SHORTCUT_LIST),
                        new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                        invoke(ROW_DEFAULT, 1, 4, 2),
                        op(Opcode.RETURN_OBJECT, 4)), OBJECT)));
        // The info rows' lambda, laid out the same way.
        classes.add(featureClass(PROFILE_INFO_ROW, OBJECT, List.of(featureField(PROFILE_INFO_ROW, "row", OBJECT)),
                define(PROFILE_INFO_ROW, "invoke", OBJECT, false, body(5,
                        string(0, "com.instagram.barcelona.profile.ui.ProfileInfoRowsKt$Rows$2 (ProfileInfoRows.kt:210)"),
                        objectField(Opcode.IGET_OBJECT, 1, 3, PROFILE_INFO_ROW, "row", OBJECT),
                        type(Opcode.CHECK_CAST, 1, SUGGESTIONS_ROW),
                        objectField(Opcode.IGET_OBJECT, 2, 1, SUGGESTIONS_ROW, "users", SHORTCUT_LIST),
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                        invoke(ROW_DEFAULT, 2, 4, 0),
                        op(Opcode.RETURN_OBJECT, 4)), OBJECT)));
        classes.add(featureClass(SUGGESTIONS_ROW, OBJECT, List.of(featureField(SUGGESTIONS_ROW, "users", SHORTCUT_LIST)),
                define(SUGGESTIONS_ROW, "<init>", "V", false, body(2, direct(method(OBJECT, "<init>", "V"), 0),
                        objectField(Opcode.IPUT_OBJECT, 1, 0, SUGGESTIONS_ROW, "users", SHORTCUT_LIST), op(Opcode.RETURN_VOID)), SHORTCUT_LIST)));

        // The screen, static Content(state, modifier): v0..v2 locals, the arguments v3 and v4.
        BrowserCode screen = new BrowserCode();
        screen.add(string(0, "com.instagram.barcelona.profile.ui.ProfileScreenKt$Content (ProfileScreen.kt:300)"));
        screen.add(objectField(Opcode.IGET_OBJECT, 1, 3, "Lfixture/ProfileState;", "suggested", SHORTCUT_LIST));
        int copies = !carousel || fault.equals("profile-carousel-missing") || fault.equals("profile-carousel-moved") ? 0
                : fault.equals("profile-carousel-double") ? 2 : 1;
        // result-dropped leaves carousel()'s answer behind, cast-register casts another register and
        // leaves the list's as it was read, and uncast puts a const-class where the cast goes.
        List<Instruction> carouselHook = List.of(
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, fault.equals("profile-carousel-register") ? 0 : 1, 1, PROFILE_CAROUSEL),
                fault.equals("profile-carousel-result-dropped") ? new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 1, 1)
                        : op(Opcode.MOVE_RESULT_OBJECT, fault.equals("profile-carousel-result") ? 0 : 1),
                fault.equals("profile-carousel-uncast") ? type(Opcode.CONST_CLASS, 1, SHORTCUT_LIST)
                        : type(Opcode.CHECK_CAST, fault.equals("profile-carousel-cast-register") ? 0 : 1, fault.equals("profile-carousel-cast") ? "Ljava/util/Collection;" : SHORTCUT_LIST));
        for (int n = 0; n < copies; n++) carouselHook.forEach(screen::add);
        // gap puts an instruction between the read and its check, polarity builds the carousel on a
        // null list, other-register checks the modifier instead, and joined jumps back onto the
        // check from the carousel's path.
        if (fault.equals("profile-carousel-gap")) screen.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
        int check = screen.branch(new ImmutableInstruction21t(fault.equals("profile-carousel-polarity") ? Opcode.IF_EQZ : Opcode.IF_NEZ,
                fault.equals("profile-carousel-other-register") ? 4 : 1, 0));
        int second = fault.equals("profile-carousel-shared") ? screen.branch(ifEqz(4, 0)) : -1;
        screen.add(op(Opcode.RETURN_VOID));
        int built = screen.size();
        // moved puts the hook past the check, on the carousel's own path.
        if (carousel && fault.equals("profile-carousel-moved")) carouselHook.forEach(screen::add);
        screen.add(type(Opcode.NEW_INSTANCE, 2, PROFILE_CAROUSEL_ROW));
        screen.add(direct(method(PROFILE_CAROUSEL_ROW, "<init>", "V", SHORTCUT_LIST), 2, 1));
        screen.add(invoke(method(PROFILE_SCREEN, "show", "V", OBJECT), 2));
        int rejoin = fault.equals("profile-carousel-joined") ? screen.branch(ifEqz(4, 0)) : -1;
        if (fault.equals("profile-carousel-body") || fault.equals("profile-carousel-omitted-body")) screen.add(op(Opcode.NOP));
        screen.add(op(Opcode.RETURN_VOID));
        screen.to(check, built);
        if (second >= 0) screen.to(second, built);
        if (rejoin >= 0) screen.to(rejoin, check);
        List<Instruction> refresh = new ArrayList<>();
        if (fault.equals("profile-carousel-stray")) refresh.addAll(List.of(invoke(PROFILE_CAROUSEL, 0), op(Opcode.MOVE_RESULT_OBJECT, 0)));
        refresh.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass(PROFILE_SCREEN, OBJECT, List.of(),
                define(PROFILE_SCREEN, "Content", "V", true, body(5, screen.finish()), OBJECT, OBJECT),
                define(PROFILE_SCREEN, "show", "V", true, body(1, op(Opcode.RETURN_VOID)), OBJECT),
                define(PROFILE_SCREEN, "refresh", "V", true, body(1, refresh.toArray(new Instruction[0])), OBJECT)));

        // The view model's rows(rows, users, unused).
        BrowserCode rows = new BrowserCode();
        rows.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 2));
        rows.add(new ImmutableInstruction11n(Opcode.CONST_4, 4, 1));
        rows.add(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 7, 0, 0, 0, 0, method(SHORTCUT_LIST, "size", "I")));
        rows.add(op(Opcode.MOVE_RESULT, 1));
        rows.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
        // flipped is a good build whose check jumps onto the row's path and falls into a goto to the
        // other side, so that side sits above the hook and keeps its place.
        boolean flipped = fault.equals("profile-row-flipped");
        int guard = rows.branch(new ImmutableInstruction22t(flipped ? Opcode.IF_NE : Opcode.IF_EQ, 1, 2, 0));
        int skip = flipped ? rows.branch(new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t(Opcode.GOTO_16, 0)) : -1;
        int path = rows.size();
        List<Integer> leaves = new ArrayList<>();
        int rowCopies = !row || fault.equals("profile-row-missing") ? 0 : fault.equals("profile-row-double") ? 2 : 1;
        int scratch = fault.equals("profile-row-live-start") ? 0 : fault.equals("profile-row-live-away") ? 4
                : fault.equals("profile-row-parameter") ? 8 : 2;
        for (int n = 0; n < rowCopies; n++) {
            rows.add(invoke(SHOW_PROFILE_ROW));
            // ignored drops the answer and tests a constant, so the row always shows.
            rows.add(fault.equals("profile-row-ignored") ? new ImmutableInstruction11n(Opcode.CONST_4, scratch, 1) : op(Opcode.MOVE_RESULT, scratch));
            // tested branches on the list's size instead of the answer, so the row always shows.
            leaves.add(rows.branch(new ImmutableInstruction21t(fault.equals("profile-row-inverted") ? Opcode.IF_NEZ : Opcode.IF_EQZ,
                    fault.equals("profile-row-tested") ? 1 : scratch, 0)));
        }
        rows.add(type(Opcode.NEW_INSTANCE, 3, SUGGESTIONS_ROW));
        rows.add(direct(method(SUGGESTIONS_ROW, "<init>", "V", SHORTCUT_LIST), 3, 7));
        rows.add(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 6, 3, 0, 0, 0, method(SHORTCUT_LIST, "add", "Z", OBJECT)));
        rows.add(virtual(method(PROFILE_VIEW_MODEL, "count", "V", "I"), 5, 0));
        rows.add(new ImmutableInstruction11n(Opcode.CONST_4, 4, 0));
        int away = rows.size();
        // compared reads the size the check compared again, on its other side.
        rows.add(virtual(method(PROFILE_VIEW_MODEL, "count", "V", "I"), 5, fault.equals("profile-row-compared") ? 1 : 4));
        if (fault.equals("profile-row-body") || fault.equals("profile-row-omitted-body")) rows.add(op(Opcode.NOP));
        int end = rows.size();
        rows.add(op(Opcode.RETURN_VOID));
        if (flipped) {
            rows.to(guard, path);
            rows.to(skip, away);
        } else rows.to(guard, away);
        // target leaves for the return, past the other side's own work.
        for (int leave : leaves) rows.to(leave, fault.equals("profile-row-target") ? end : flipped ? skip : away);
        List<Instruction> load = new ArrayList<>();
        if (fault.equals("profile-row-stray") || fault.equals("profile-row-omitted-call")) load.addAll(List.of(invoke(SHOW_PROFILE_ROW), op(Opcode.MOVE_RESULT, 0)));
        load.add(op(Opcode.RETURN_VOID));
        classes.add(featureClass(PROFILE_VIEW_MODEL, OBJECT, List.of(),
                define(PROFILE_VIEW_MODEL, "rows", "V", false, body(9, rows.finish()), SHORTCUT_LIST, SHORTCUT_LIST, "I"),
                define(PROFILE_VIEW_MODEL, "count", "V", false, body(2, op(Opcode.RETURN_VOID)), "I"),
                define(PROFILE_VIEW_MODEL, "load", "V", false, body(2, load.toArray(new Instruction[0])))));
        return classes;
    }

    // Save photos and videos: Threads' post menu, shaped like 451's, and the extension pieces the patch writes.
    private static final String SAVE_ROW = "Lapp/morphe/extension/hushthreads/download/SaveMediaRow;";
    private static final String SAVE_CLICK = "Lapp/morphe/extension/hushthreads/download/SaveMediaRow$Click;";
    private static final String INSTAGRAM_MEDIA = "Lapp/morphe/extension/hushthreads/download/InstagramMedia;";
    private static final ImmutableMethodReference ADD_SAVE_ROW = method(SAVE_ROW, "add", "V", OBJECT, OBJECT);
    private static final String MENU_NOTE = "com.instagram.barcelona.feed.post.actionmenu.PostActionMenuSheet.<anonymous> (PostActionMenuSheet.kt:";
    private static final String POST_MENU = "Lfixture/PostMenu;";
    private static final String POST_MENU_HEADER = "Lfixture/PostMenuHeader;";
    private static final String MENU_COPY_LINK = "Lfixture/MenuCopyLink;";
    private static final String MENU_SHARE = "Lfixture/MenuShare;";
    private static final String MENU_CONTROLLER = "Lfixture/MenuController;";
    private static final String SHARE_CONTROLLER = "Lfixture/ShareController;";
    private static final String MENU_COMPOSER = "Lfixture/MenuComposer;";
    private static final String MENU_MODIFIER = "Lfixture/MenuModifier;";
    private static final String MENU_ROLE = "Lfixture/MenuRole;";
    private static final String MENU_STYLE = "Lfixture/MenuStyle;";
    private static final String MENU_ICON = "Lfixture/MenuIcon;";
    private static final String MENU_THEME = "Lfixture/MenuTheme;";
    private static final String MENU_ROWS = "Lfixture/MenuRows;";
    private static final String MENU_CLICK = "Lfixture/MenuClick;";
    private static final String ACTIVITY = "Landroid/app/Activity;";
    private static final String VIDEO_VERSION = "Lcom/instagram/api/schemas/VideoVersionIntf;";
    private static final String PANDO_VIDEO_VERSION = "Lcom/instagram/api/schemas/ImmutablePandoVideoVersion;";
    private static final String IMAGE_INFO = "Lcom/instagram/model/mediasize/ImageInfo;";
    private static final String PANDO_IMAGE_INFO = "Lcom/instagram/model/mediasize/ImmutablePandoImageInfo;";
    private static final String TEXT_POST_INFO = "Lfixture/TextPostInfo;";
    private static final String TEXT_POST_DATA = "Lfixture/TextPostData;";
    private static final String SHARE_INFO = "Lfixture/ShareInfo;";
    private static final String SHARE_DATA = "Lfixture/ShareData;";
    private static final String POST_WRITER = "Lfixture/PostWriter;";
    private static final String IMAGE_URL = "Lcom/instagram/common/typedurl/ImageUrl;";
    private static final String INTEGER = "Ljava/lang/Integer;";
    private static final ImmutableMethodReference MENU_ROW = method(MENU_ROWS, "row", "V", MENU_COMPOSER, MENU_MODIFIER, MENU_STYLE, MENU_ICON, "Ljava/lang/String;");
    private static final ImmutableMethodReference MENU_HEADER = method(MENU_ROWS, "header", "V", MENU_COMPOSER, MENU_MODIFIER, MENU_STYLE, MENU_ICON, "Ljava/lang/String;");
    private static final ImmutableMethodReference MENU_ICON_OF = method(MENU_ROWS, "icon", MENU_ICON, MENU_COMPOSER, "I", "I", "Z");
    private static final ImmutableMethodReference MENU_STYLE_OF = method(MENU_THEME, "style", MENU_STYLE, MENU_COMPOSER);
    private static final ImmutableMethodReference MENU_ROLE_OF = method(MENU_THEME, "role", MENU_ROLE, "I");
    private static final ImmutableMethodReference MENU_CLICKABLE = method(MENU_MODIFIER, "click", MENU_MODIFIER, MENU_MODIFIER, MENU_ROLE, OBJECT, "Z");
    private static final ImmutableMethodReference MENU_SEMANTICS = method(MENU_MODIFIER, "semantics", MENU_MODIFIER, MENU_MODIFIER, OBJECT);
    private static final ImmutableMethodReference MENU_REMEMBERED = method(MENU_COMPOSER, "rememberedValue", OBJECT);
    private static final ImmutableMethodReference MENU_REMEMBER = method(MENU_COMPOSER, "updateRememberedValue", "V", OBJECT);
    private static final ImmutableMethodReference MENU_CLICK_INIT = method(MENU_CLICK, "<init>", "V", "Ljava/lang/String;", "Ljava/lang/String;", "I", OBJECT);
    private static final ImmutableMethodReference MENU_DISMISS = method(MENU_CONTROLLER, "dismiss", "V");
    private static final ImmutableMethodReference MENU_TRACK = method(MENU_CONTROLLER, "track", "V");
    private static final ImmutableMethodReference SHARE_CLOSE = method(SHARE_CONTROLLER, "close", "V");

    /** One InstagramMedia bridge: its name and answer, and the model it casts to and the getter it calls on it, by [call]. */
    private record SaveBridgeShape(String name, String returns, String receiver, Opcode call, ImmutableMethodReference getter) {}

    private static final List<SaveBridgeShape> SAVE_BRIDGES = List.of(
            new SaveBridgeShape("videoVersions", SHORTCUT_LIST, FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "videos", SHORTCUT_LIST)),
            new SaveBridgeShape("dashManifest", "Ljava/lang/String;", FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "manifest", "Ljava/lang/String;")),
            new SaveBridgeShape("mediaId", "Ljava/lang/String;", FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "getId", "Ljava/lang/String;")),
            new SaveBridgeShape("owner", OBJECT, FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "author", FEATURE_USER)),
            new SaveBridgeShape("takenAt", "Ljava/lang/Long;", FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "takenAt", "Ljava/lang/Long;")),
            new SaveBridgeShape("carouselMedia", SHORTCUT_LIST, FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "items", SHORTCUT_LIST)),
            new SaveBridgeShape("username", "Ljava/lang/String;", FEATURE_USER, Opcode.INVOKE_VIRTUAL, method(FEATURE_USER, "username", "Ljava/lang/String;")),
            new SaveBridgeShape("versionUrl", "Ljava/lang/String;", VIDEO_VERSION, Opcode.INVOKE_INTERFACE, method(VIDEO_VERSION, "A00", "Ljava/lang/String;")),
            new SaveBridgeShape("versionWidth", INTEGER, VIDEO_VERSION, Opcode.INVOKE_INTERFACE, method(VIDEO_VERSION, "A01", INTEGER)),
            new SaveBridgeShape("versionHeight", INTEGER, VIDEO_VERSION, Opcode.INVOKE_INTERFACE, method(VIDEO_VERSION, "A02", INTEGER)),
            new SaveBridgeShape("imageVersions", OBJECT, FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "images", IMAGE_INFO)),
            new SaveBridgeShape("imageCandidates", SHORTCUT_LIST, IMAGE_INFO, Opcode.INVOKE_INTERFACE, method(IMAGE_INFO, "A03", SHORTCUT_LIST)),
            new SaveBridgeShape("candidateUrl", "Ljava/lang/String;", IMAGE_URL, Opcode.INVOKE_INTERFACE, method(IMAGE_URL, "getUrl", "Ljava/lang/String;")),
            new SaveBridgeShape("candidateWidth", "I", IMAGE_URL, Opcode.INVOKE_INTERFACE, method(IMAGE_URL, "getWidth", "I")),
            new SaveBridgeShape("candidateHeight", "I", IMAGE_URL, Opcode.INVOKE_INTERFACE, method(IMAGE_URL, "getHeight", "I")),
            new SaveBridgeShape("textPostInfo", OBJECT, FEATURE_MEDIA, Opcode.INVOKE_VIRTUAL, method(FEATURE_MEDIA, "textInfo", TEXT_POST_INFO)),
            new SaveBridgeShape("linkedInlineMedia", OBJECT, TEXT_POST_INFO, Opcode.INVOKE_INTERFACE, method(TEXT_POST_INFO, "linked", FEATURE_MEDIA)),
            new SaveBridgeShape("shareInfo", OBJECT, TEXT_POST_INFO, Opcode.INVOKE_INTERFACE, method(TEXT_POST_INFO, "share", SHARE_INFO)),
            new SaveBridgeShape("quotedAttachmentPost", OBJECT, SHARE_INFO, Opcode.INVOKE_INTERFACE, method(SHARE_INFO, "attached", FEATURE_MEDIA)),
            new SaveBridgeShape("repostedPost", OBJECT, SHARE_INFO, Opcode.INVOKE_INTERFACE, method(SHARE_INFO, "reposted", FEATURE_MEDIA)),
            new SaveBridgeShape("quotedPost", OBJECT, SHARE_INFO, Opcode.INVOKE_INTERFACE, method(SHARE_INFO, "quoted", FEATURE_MEDIA)));

    private static final String TILE_HOST = "Lfixture/ShareTileLaunch;";
    private static final ImmutableMethodReference TILE_LAUNCH = method("LX/Launcher;", "A04", "Z", "Landroid/content/Context;", "Landroid/content/Intent;");
    private static final ImmutableMethodReference OPEN_REFUSED_TILE = method("Lapp/morphe/extension/hushthreads/coexist/ShareTiles;", "openRefused", "V",
            "Z", "Landroid/content/Context;", "Landroid/content/Intent;");

    /**
     * Threads' share tiles, shaped like 453's: one lambda that launches the intent it built. Hooked,
     * the launch's answer goes to the extension with the context and intent. Faults: no hook, the
     * arguments swapped, another register passed as the answer, and an answer in a register read after.
     */
    private static ClassDef shareTileClass(boolean hooked, String fault) {
        List<Instruction> code = new ArrayList<>(List.of(string(0, "com.facebook.orca"), string(0, "DirectPrivateStoryRecipientFragment.DIRECT_SHOULD_SHOW_MESSAGE_COMPOSER"),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),
                virtual(TILE_LAUNCH, 0, 1, 2)));
        if (hooked && !fault.equals("tile-missing")) {
            int answer = fault.equals("tile-live") ? 3 : 0;
            code.add(op(Opcode.MOVE_RESULT, answer));
            code.add(fault.equals("tile-swapped") ? invoke(OPEN_REFUSED_TILE, answer, 2, 1)
                    : fault.equals("tile-answer") ? invoke(OPEN_REFUSED_TILE, 1, 1, 2)
                    : invoke(OPEN_REFUSED_TILE, answer, 1, 2));
        }
        // The stock code reads v3 after the launch and rewrites v0 first, so only v3 stays live. The
        // read is a plain move, which an int in v3 still passes, so that fault fails the contract alone.
        code.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction12x(Opcode.MOVE, 2, 3), op(Opcode.RETURN_OBJECT, 0)));
        return featureClass(TILE_HOST, OBJECT, List.of(), define(TILE_HOST, "invokeSuspend", OBJECT, false, body(6, code.toArray(new Instruction[0])), OBJECT));
    }

    /** A data class's plain getter for its own field. */
    private static Method plainGetter(String owner, String name, String field, String returns) {
        return define(owner, name, returns, false, body(2, objectField(Opcode.IGET_OBJECT, 0, 1, owner, field, returns), op(Opcode.RETURN_OBJECT, 0)));
    }

    /** Threads' text post model and the serializer that names its linked posts' keys, under names that aren't the bridges'. */
    private static List<ClassDef> linkedPostClasses(int publicInterface, int publicFinal) {
        List<Instruction> writer = new ArrayList<>();
        for (String[] key : List.of(new String[]{"linked_inline_media", TEXT_POST_DATA, "a", FEATURE_MEDIA}, new String[]{"share_info", TEXT_POST_DATA, "b", SHARE_INFO},
                new String[]{"quoted_attachment_post", SHARE_DATA, "c", FEATURE_MEDIA}, new String[]{"reposted_post", SHARE_DATA, "d", FEATURE_MEDIA},
                new String[]{"quoted_post", SHARE_DATA, "e", FEATURE_MEDIA})) {
            writer.add(objectField(Opcode.IGET_OBJECT, 0, 1, key[1], key[2], key[3]));
            writer.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 4));
            writer.add(string(0, key[0]));
            writer.add(new ImmutableInstruction10x(Opcode.NOP));
        }
        writer.add(op(Opcode.RETURN_VOID));
        return List.of(
                new ImmutableClassDef(TEXT_POST_INFO, publicInterface, OBJECT, List.of(), null, null, List.of(),
                        List.of(abstractGetter(TEXT_POST_INFO, "linked", FEATURE_MEDIA), abstractGetter(TEXT_POST_INFO, "share", SHARE_INFO))),
                new ImmutableClassDef(SHARE_INFO, publicInterface, OBJECT, List.of(), null, null, List.of(),
                        List.of(abstractGetter(SHARE_INFO, "attached", FEATURE_MEDIA), abstractGetter(SHARE_INFO, "reposted", FEATURE_MEDIA), abstractGetter(SHARE_INFO, "quoted", FEATURE_MEDIA))),
                new ImmutableClassDef(TEXT_POST_DATA, publicFinal, OBJECT, List.of(TEXT_POST_INFO), null, null,
                        List.of(new ImmutableField(TEXT_POST_DATA, "a", FEATURE_MEDIA, AccessFlags.PUBLIC.getValue(), null, null, null),
                                new ImmutableField(TEXT_POST_DATA, "b", SHARE_INFO, AccessFlags.PUBLIC.getValue(), null, null, null)),
                        List.of(plainGetter(TEXT_POST_DATA, "linked", "a", FEATURE_MEDIA), plainGetter(TEXT_POST_DATA, "share", "b", SHARE_INFO))),
                new ImmutableClassDef(SHARE_DATA, publicFinal, OBJECT, List.of(SHARE_INFO), null, null,
                        List.of(new ImmutableField(SHARE_DATA, "c", FEATURE_MEDIA, AccessFlags.PUBLIC.getValue(), null, null, null),
                                new ImmutableField(SHARE_DATA, "d", FEATURE_MEDIA, AccessFlags.PUBLIC.getValue(), null, null, null),
                                new ImmutableField(SHARE_DATA, "e", FEATURE_MEDIA, AccessFlags.PUBLIC.getValue(), null, null, null)),
                        List.of(plainGetter(SHARE_DATA, "attached", "c", FEATURE_MEDIA), plainGetter(SHARE_DATA, "reposted", "d", FEATURE_MEDIA), plainGetter(SHARE_DATA, "quoted", "e", FEATURE_MEDIA))),
                featureClass(POST_WRITER, OBJECT, List.of(), define(POST_WRITER, "write", "V", true, body(2, writer.toArray(new Instruction[0])), OBJECT)));
    }

    /** An interface's getter, with no body. */
    private static Method abstractGetter(String owner, String name, String returns) {
        return new ImmutableMethod(owner, name, List.of(), returns, AccessFlags.PUBLIC.getValue() | AccessFlags.ABSTRACT.getValue(), null, null, null);
    }

    /**
     * Threads' post menu, shaped like 451's: one lambda holding the menu's note checks for the Share
     * item and then the Copy link item, and each case draws one row, Share's by a goto to Copy link's
     * row call. Copy link's modifier is a click call on the base modifier with a role, a remembered
     * click and literals, under one more modifier, and its click is a merged lambda over the
     * controller whose case for Copy link closes the menu. When [hooked], Copy link's own path gets
     * the Save patch's copy of the row call, add with the lambda and its composer, and a goto past the
     * original. A second lambda holds the note without checking for Copy link, and the models the
     * bridges read come along. Faults: no hook, a copy of another call, the wrong registers passed,
     * a goto past the wrong place, a second add on the shared row call, a second host caller, Share's
     * goto sent to the copy, a branch, a packed switch's case or an exception handler in Copy link's
     * case straight to its row call (stock as well as hooked, so each takes a clean build of its
     * own), and, left out, the copy and goto alone or an add in the second lambda.
     */
    private static List<ClassDef> saveMediaClasses(boolean patched, boolean hooked, String fault) {
        Instruction none = new ImmutableInstruction11n(Opcode.CONST_4, 0, 0);
        // invoke(composer, flags): v0..v12 locals, the menu in v13, the composer in v14.
        List<Instruction> menu = new ArrayList<>(List.of(string(0, MENU_NOTE + "120)"),
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 12, 14), type(Opcode.CHECK_CAST, 12, MENU_COMPOSER),
                objectField(Opcode.IGET_OBJECT, 1, 13, POST_MENU, "item", OBJECT),
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 2, 1, new ImmutableTypeReference(MENU_SHARE)), ifEqz(2, 0),
                staticField(Opcode.SGET_OBJECT, 3, MENU_MODIFIER, "Companion", MENU_MODIFIER), invoke(MENU_STYLE_OF, 12),
                op(Opcode.MOVE_RESULT_OBJECT, 4), new ImmutableInstruction31i(Opcode.CONST, 6, 0x7f080124),
                new ImmutableInstruction11n(Opcode.CONST_4, 7, 2), new ImmutableInstruction11n(Opcode.CONST_4, 8, 0),
                invoke(MENU_ICON_OF, 12, 6, 7, 8), op(Opcode.MOVE_RESULT_OBJECT, 5), string(7, "Share"),
                new ImmutableInstruction10t(Opcode.GOTO, 0)));
        int skipShare = 5, shareGoto = menu.size() - 1, copyLink = menu.size();
        menu.addAll(List.of(new ImmutableInstruction22c(Opcode.INSTANCE_OF, 2, 1, new ImmutableTypeReference(MENU_COPY_LINK)), ifEqz(2, 0),
                staticField(Opcode.SGET_OBJECT, 3, MENU_MODIFIER, "Companion", MENU_MODIFIER), new ImmutableInstruction11n(Opcode.CONST_4, 4, 0),
                invoke(MENU_ROLE_OF, 4), op(Opcode.MOVE_RESULT_OBJECT, 4), virtual(MENU_REMEMBERED, 12), op(Opcode.MOVE_RESULT_OBJECT, 5),
                staticField(Opcode.SGET_OBJECT, 6, MENU_COMPOSER, "Empty", OBJECT), new ImmutableInstruction22t(Opcode.IF_NE, 5, 6, 0),
                string(6, "copy_link"), string(7, "post_menu"), new ImmutableInstruction11n(Opcode.CONST_4, 8, 1),
                objectField(Opcode.IGET_OBJECT, 9, 13, POST_MENU, "controller", MENU_CONTROLLER), type(Opcode.NEW_INSTANCE, 5, MENU_CLICK),
                direct(MENU_CLICK_INIT, 5, 6, 7, 8, 9), virtual(MENU_REMEMBER, 12, 5)));
        int skipCopyLink = copyLink + 1, remembered = copyLink + 9, clicked = menu.size();
        menu.addAll(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 6, 1), invoke(MENU_CLICKABLE, 3, 4, 5, 6), op(Opcode.MOVE_RESULT_OBJECT, 3),
                invoke(MENU_SEMANTICS, 3, 12), op(Opcode.MOVE_RESULT_OBJECT, 3), invoke(MENU_STYLE_OF, 12), op(Opcode.MOVE_RESULT_OBJECT, 4),
                new ImmutableInstruction31i(Opcode.CONST, 6, 0x7f080123), new ImmutableInstruction11n(Opcode.CONST_4, 7, 2),
                new ImmutableInstruction11n(Opcode.CONST_4, 8, 0), invoke(MENU_ICON_OF, 12, 6, 7, 8), op(Opcode.MOVE_RESULT_OBJECT, 5)));
        menu.add(string(7, "Copy link"));
        // bypass branches from the label, the last instruction before the row call, so v7 holds the
        // label on both of the row call's ways in, and only the branch skips the Save row.
        int bypass = fault.equals("save-bypass") ? menu.size() : -1;
        if (bypass >= 0) menu.add(ifEqz(2, 0));
        // switch-case sends one case of a packed switch there instead, its payload after the method's
        // last return; handler-edge loads the label a second time under a try block whose handler is the row call,
        // so v7 holds it on the handler's way in too.
        int switchAt = fault.equals("save-switch-case") ? menu.size() : -1;
        if (switchAt >= 0) menu.add(new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 2, 0));
        if (fault.equals("save-handler-edge")) menu.add(string(7, "Copy link"));
        int handlerCover = fault.equals("save-handler-edge") ? menu.size() - 1 : -1;
        Instruction row = invoke(MENU_ROW, 12, 3, 4, 5, 7);
        int copyAt = menu.size();
        boolean copied = hooked && !fault.equals("save-missing") || patched && fault.equals("save-omitted-menu");
        if (copied) {
            menu.add(fault.equals("save-copy") ? invoke(MENU_HEADER, 12, 3, 4, 5, 7) : row);
            if (hooked) menu.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, fault.equals("save-capture") ? 12 : 13, 2, ADD_SAVE_ROW));
            menu.add(new ImmutableInstruction10t(Opcode.GOTO, 0));
        }
        int rowAt = menu.size();
        menu.add(row);
        if (hooked && fault.equals("save-twice")) menu.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 13, 2, ADD_SAVE_ROW));
        int rowGoto = menu.size();
        menu.add(new ImmutableInstruction10t(Opcode.GOTO, 0));
        int after = menu.size();
        menu.addAll(List.of(none, op(Opcode.RETURN_OBJECT, 0)));
        featureBranch(menu, skipShare, copyLink, Opcode.IF_EQZ, 2, 0);
        featureBranch(menu, shareGoto, hooked && fault.equals("save-other-item") ? copyAt : rowAt, Opcode.GOTO, 0, 0);
        featureBranch(menu, skipCopyLink, after, Opcode.IF_EQZ, 2, 0);
        featureBranch(menu, remembered, clicked, Opcode.IF_NE, 5, 6);
        if (copied) featureBranch(menu, rowAt - 1, hooked && fault.equals("save-goto") ? after : rowAt + 1, Opcode.GOTO, 0, 0);
        featureBranch(menu, rowGoto, after, Opcode.GOTO, 0, 0);
        if (bypass >= 0) featureBranch(menu, bypass, rowAt, Opcode.IF_EQZ, 2, 0);
        List<ImmutableTryBlock> menuTries = null;
        if (switchAt >= 0) {
            if (units(menu, menu.size()) % 2 != 0) menu.add(op(Opcode.NOP));
            int payloadAt = menu.size();
            menu.add(new ImmutablePackedSwitchPayload(List.of(new ImmutableSwitchElement(0, units(menu, rowAt) - units(menu, switchAt)))));
            menu.set(switchAt, new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 2, units(menu, payloadAt) - units(menu, switchAt)));
        }
        if (handlerCover >= 0) menuTries = List.of(tryBlock(units(menu, handlerCover), menu.get(handlerCover).getCodeUnits(), units(menu, rowAt)));

        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(POST_MENU, OBJECT, List.of(featureField(POST_MENU, "post", FEATURE_MEDIA), featureField(POST_MENU, "activity", ACTIVITY),
                featureField(POST_MENU, "controller", MENU_CONTROLLER), featureField(POST_MENU, "item", OBJECT)),
                define(POST_MENU, "invoke", OBJECT, false, menuTries == null ? body(16, menu.toArray(new Instruction[0]))
                        : body(16, menuTries, menu.toArray(new Instruction[0])), OBJECT, OBJECT)));
        List<Instruction> header = new ArrayList<>(List.of(string(0, MENU_NOTE + "88)")));
        if (hooked && fault.equals("save-duplicate") || patched && fault.equals("save-omitted-add"))
            header.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 2, ADD_SAVE_ROW));
        header.addAll(List.of(none, op(Opcode.RETURN_OBJECT, 0)));
        classes.add(featureClass(POST_MENU_HEADER, OBJECT, List.of(), define(POST_MENU_HEADER, "invoke", OBJECT, false,
                body(4, header.toArray(new Instruction[0])), OBJECT, OBJECT)));
        classes.add(featureClass(MENU_COPY_LINK, OBJECT, List.of(), define(MENU_COPY_LINK, "toString", "Ljava/lang/String;", false,
                body(1, string(0, "CopyLinkAction"), op(Opcode.RETURN_OBJECT, 0)))));
        classes.add(featureClass(MENU_SHARE, OBJECT, List.of(), define(MENU_SHARE, "toString", "Ljava/lang/String;", false,
                body(1, string(0, "ShareAction"), op(Opcode.RETURN_OBJECT, 0)))));
        classes.add(featureClass(MENU_CONTROLLER, OBJECT, List.of(), define(MENU_CONTROLLER, "dismiss", "V", false, body(1, op(Opcode.RETURN_VOID))),
                define(MENU_CONTROLLER, "track", "V", false, body(1, op(Opcode.RETURN_VOID)))));
        classes.add(featureClass(SHARE_CONTROLLER, OBJECT, List.of(), define(SHARE_CONTROLLER, "close", "V", false, body(1, op(Opcode.RETURN_VOID)))));
        int publicStatic = AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue();
        classes.add(featureClass(MENU_COMPOSER, OBJECT, List.of(flaggedField(MENU_COMPOSER, "Empty", OBJECT, publicStatic)),
                define(MENU_COMPOSER, "rememberedValue", OBJECT, false, body(2, none, op(Opcode.RETURN_OBJECT, 0))),
                define(MENU_COMPOSER, "updateRememberedValue", "V", false, body(2, op(Opcode.RETURN_VOID)), OBJECT)));
        classes.add(featureClass(MENU_MODIFIER, OBJECT, List.of(flaggedField(MENU_MODIFIER, "Companion", MENU_MODIFIER, publicStatic)),
                define(MENU_MODIFIER, "click", MENU_MODIFIER, true, body(5, none, op(Opcode.RETURN_OBJECT, 0)), MENU_MODIFIER, MENU_ROLE, OBJECT, "Z"),
                define(MENU_MODIFIER, "semantics", MENU_MODIFIER, true, body(3, none, op(Opcode.RETURN_OBJECT, 0)), MENU_MODIFIER, OBJECT)));
        classes.add(featureClass(MENU_THEME, OBJECT, List.of(),
                define(MENU_THEME, "role", MENU_ROLE, true, body(2, none, op(Opcode.RETURN_OBJECT, 0)), "I"),
                define(MENU_THEME, "style", MENU_STYLE, true, body(2, none, op(Opcode.RETURN_OBJECT, 0)), MENU_COMPOSER)));
        classes.add(featureClass(MENU_ROWS, OBJECT, List.of(),
                define(MENU_ROWS, "icon", MENU_ICON, true, body(5, none, op(Opcode.RETURN_OBJECT, 0)), MENU_COMPOSER, "I", "I", "Z"),
                define(MENU_ROWS, "row", "V", true, body(5, op(Opcode.RETURN_VOID)), MENU_COMPOSER, MENU_MODIFIER, MENU_STYLE, MENU_ICON, "Ljava/lang/String;"),
                define(MENU_ROWS, "header", "V", true, body(5, op(Opcode.RETURN_VOID)), MENU_COMPOSER, MENU_MODIFIER, MENU_STYLE, MENU_ICON, "Ljava/lang/String;")));

        // invoke(): v0..v2 locals, this in v3. Case 0 closes the share sheet; case 1, Copy link's, logs and closes the menu.
        List<Instruction> click = new ArrayList<>(List.of(objectField(Opcode.IGET, 1, 3, MENU_CLICK, "$t", "I"), ifEqz(1, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction22t(Opcode.IF_EQ, 1, 0, 0), new ImmutableInstruction10t(Opcode.GOTO, 0),
                objectField(Opcode.IGET_OBJECT, 0, 3, MENU_CLICK, "A00", OBJECT), type(Opcode.CHECK_CAST, 0, SHARE_CONTROLLER), virtual(SHARE_CLOSE, 0),
                new ImmutableInstruction10t(Opcode.GOTO, 0),
                objectField(Opcode.IGET_OBJECT, 0, 3, MENU_CLICK, "A00", OBJECT), type(Opcode.CHECK_CAST, 0, MENU_CONTROLLER), virtual(MENU_TRACK, 0),
                virtual(MENU_DISMISS, 0), new ImmutableInstruction10t(Opcode.GOTO, 0), none, op(Opcode.RETURN_OBJECT, 0)));
        featureBranch(click, 1, 5, Opcode.IF_EQZ, 1, 0);
        featureBranch(click, 3, 9, Opcode.IF_EQ, 1, 0);
        for (int g : new int[]{4, 8, 13}) featureBranch(click, g, 14, Opcode.GOTO, 0, 0);
        classes.add(new ImmutableClassDef(MENU_CLICK, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT, List.of(FUNCTION0), null, null,
                List.of(featureField(MENU_CLICK, "$t", "I"), featureField(MENU_CLICK, "A00", OBJECT),
                        featureField(MENU_CLICK, "A01", "Ljava/lang/String;"), featureField(MENU_CLICK, "A02", "Ljava/lang/String;")),
                List.of(define(MENU_CLICK, "<init>", "V", false, body(5, objectField(Opcode.IPUT, 3, 0, MENU_CLICK, "$t", "I"),
                        objectField(Opcode.IPUT_OBJECT, 4, 0, MENU_CLICK, "A00", OBJECT),
                        objectField(Opcode.IPUT_OBJECT, 1, 0, MENU_CLICK, "A01", "Ljava/lang/String;"),
                        objectField(Opcode.IPUT_OBJECT, 2, 0, MENU_CLICK, "A02", "Ljava/lang/String;"),
                        direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), "Ljava/lang/String;", "Ljava/lang/String;", "I", OBJECT),
                        define(MENU_CLICK, "invoke", OBJECT, false, body(4, click.toArray(new Instruction[0]))))));

        // The models past Media and User keep their names; the tree-backed classes answer by Pando hash.
        int publicInterface = AccessFlags.PUBLIC.getValue() | AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue();
        int publicFinal = AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue();
        classes.add(new ImmutableClassDef(VIDEO_VERSION, publicInterface, OBJECT, List.of(), null, null, List.of(),
                List.of(abstractGetter(VIDEO_VERSION, "A00", "Ljava/lang/String;"), abstractGetter(VIDEO_VERSION, "A01", INTEGER),
                        abstractGetter(VIDEO_VERSION, "A02", INTEGER))));
        classes.add(new ImmutableClassDef(PANDO_VIDEO_VERSION, publicFinal, OBJECT, List.of(VIDEO_VERSION), null, null, List.of(),
                List.of(pandoGetter(PANDO_VIDEO_VERSION, "A00", "Ljava/lang/String;", "url"), pandoGetter(PANDO_VIDEO_VERSION, "A01", INTEGER, "width"),
                        pandoGetter(PANDO_VIDEO_VERSION, "A02", INTEGER, "height"))));
        classes.add(new ImmutableClassDef(IMAGE_INFO, publicInterface, OBJECT, List.of(), null, null, List.of(),
                List.of(abstractGetter(IMAGE_INFO, "A03", SHORTCUT_LIST))));
        classes.add(new ImmutableClassDef(PANDO_IMAGE_INFO, publicFinal, OBJECT, List.of(IMAGE_INFO), null, null, List.of(),
                List.of(pandoGetter(PANDO_IMAGE_INFO, "A03", SHORTCUT_LIST, "candidates"))));
        classes.addAll(linkedPostClasses(publicInterface, publicFinal));
        classes.add(new ImmutableClassDef(IMAGE_URL, publicInterface, OBJECT, List.of(), null, null, List.of(),
                List.of(abstractGetter(IMAGE_URL, "getUrl", "Ljava/lang/String;"), abstractGetter(IMAGE_URL, "getWidth", "I"),
                        abstractGetter(IMAGE_URL, "getHeight", "I"))));
        return classes;
    }

    /**
     * The extension's SaveMediaRow, its click and the InstagramMedia bridges, as a bundle carries
     * them: written the way the Save patch writes them when [hooked], and otherwise the empty stubs
     * they ship as. Faults name the one piece written wrong, a bridge left its stub, a bridge the
     * patch doesn't know or, left out, the one stub written anyway.
     */
    private static List<ClassDef> saveMediaExtension(boolean hooked, String fault) {
        Instruction none = new ImmutableInstruction11n(Opcode.CONST_4, 0, 0);
        ImmutableMethodImplementation nothing = body(1, none, op(Opcode.RETURN_OBJECT, 0));
        boolean show = hooked && !fault.equals("save-show-stub") || fault.equals("save-omitted-show");
        boolean media = hooked || fault.equals("save-omitted-media");
        boolean activity = hooked || fault.equals("save-omitted-activity");
        boolean dismiss = hooked || fault.equals("save-omitted-dismiss");
        String mediaField = fault.equals("save-media-field") ? "activity" : "post";
        String activityField = fault.equals("save-activity-field") ? "post" : "activity";
        String dismissField = fault.equals("save-dismiss-field") ? "post" : "controller";
        List<Method> row = List.of(define(SAVE_ROW, "add", "V", true, body(2, op(Opcode.RETURN_VOID)), OBJECT, OBJECT),
                define(SAVE_ROW, "showRow", "V", true, show ? body(11, saveShowRow(fault).toArray(new Instruction[0])) : body(4, op(Opcode.RETURN_VOID)),
                        OBJECT, OBJECT, "Ljava/lang/String;", "I"),
                define(SAVE_ROW, "media", OBJECT, true, !media ? nothing : body(1,
                        type(Opcode.CHECK_CAST, 0, fault.equals("save-media-cast") ? MENU_CONTROLLER : POST_MENU),
                        objectField(Opcode.IGET_OBJECT, 0, 0, POST_MENU, mediaField, mediaField.equals("post") ? FEATURE_MEDIA : ACTIVITY),
                        op(Opcode.RETURN_OBJECT, 0)), OBJECT),
                define(SAVE_ROW, "activity", ACTIVITY, true, !activity ? nothing : body(1,
                        type(Opcode.CHECK_CAST, 0, fault.equals("save-activity-cast") ? MENU_CONTROLLER : POST_MENU),
                        objectField(Opcode.IGET_OBJECT, 0, 0, POST_MENU, activityField, activityField.equals("post") ? FEATURE_MEDIA : ACTIVITY),
                        op(Opcode.RETURN_OBJECT, 0)), OBJECT),
                define(SAVE_ROW, "dismiss", "V", true, !dismiss ? body(1, op(Opcode.RETURN_VOID)) : body(1,
                        type(Opcode.CHECK_CAST, 0, fault.equals("save-dismiss-cast") ? MENU_CONTROLLER : POST_MENU),
                        objectField(Opcode.IGET_OBJECT, 0, 0, POST_MENU, dismissField, dismissField.equals("post") ? FEATURE_MEDIA : MENU_CONTROLLER),
                        virtual(fault.equals("save-dismiss-call") ? MENU_TRACK : MENU_DISMISS, 0), op(Opcode.RETURN_VOID)), OBJECT));
        List<ClassDef> classes = new ArrayList<>();
        classes.add(featureClass(SAVE_ROW, OBJECT, List.of(), row.toArray(new Method[0])));
        List<String> interfaces = hooked && !fault.equals("save-click") ? List.of(FUNCTION0) : List.of();
        classes.add(new ImmutableClassDef(SAVE_CLICK, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT, interfaces,
                null, null, List.of(), List.of(define(SAVE_CLICK, "invoke", OBJECT, fault.equals("save-click-static"),
                        body(2, none, op(Opcode.RETURN_OBJECT, 0))))));
        // Each bridge, written, casts its argument, calls the getter and returns its answer in front of
        // the stub's own zero return. bridge-extra adds one more stub, never written, standing for a
        // bridge the patch doesn't know.
        List<Method> bridges = new ArrayList<>();
        for (SaveBridgeShape bridge : SAVE_BRIDGES) {
            boolean primitive = bridge.returns().equals("I");
            Instruction zero = op(primitive ? Opcode.RETURN : Opcode.RETURN_OBJECT, 0);
            List<Instruction> code = new ArrayList<>();
            if (hooked && !(fault.equals("save-bridge-stub") && bridge.name().equals("carouselMedia"))
                    || fault.equals("save-omitted-bridge") && bridge.name().equals("videoVersions")
                    || fault.equals("save-omitted-bridge-int") && bridge.name().equals("candidateHeight")) {
                String receiver = fault.equals("save-bridge-cast") && bridge.name().equals("username") ? FEATURE_MEDIA : bridge.receiver();
                Opcode call = fault.equals("save-bridge-call") && bridge.name().equals("versionUrl") ? Opcode.INVOKE_VIRTUAL : bridge.call();
                ImmutableMethodReference getter = fault.equals("save-bridge-getter") && bridge.name().equals("videoVersions")
                        ? method(FEATURE_MEDIA, "items", SHORTCUT_LIST)
                        : fault.equals("save-bridge-shared-getter") && bridge.name().equals("repostedPost")
                        ? method(SHARE_INFO, "quoted", FEATURE_MEDIA) : bridge.getter();
                code.add(type(Opcode.CHECK_CAST, 0, receiver));
                code.add(new ImmutableInstruction35c(call, 1, 0, 0, 0, 0, 0, getter));
                code.add(fault.equals("save-bridge-result") && bridge.name().equals("takenAt") ? none
                        : op(primitive ? Opcode.MOVE_RESULT : Opcode.MOVE_RESULT_OBJECT, 0));
                code.add(zero);
            }
            code.addAll(List.of(none, zero));
            bridges.add(define(INSTAGRAM_MEDIA, bridge.name(), bridge.returns(), true, body(1, code.toArray(new Instruction[0])), OBJECT));
        }
        if (fault.equals("save-bridge-extra")) bridges.add(define(INSTAGRAM_MEDIA, "likeCount", INTEGER, true, nothing, OBJECT));
        classes.add(featureClass(INSTAGRAM_MEDIA, OBJECT, List.of(), bridges.toArray(new Method[0])));
        return classes;
    }

    /**
     * showRow as the Save patch writes it: Copy link's role, click and literals around the extension's
     * click, the style and icon from the cast composer, and Threads' row with the extension's label.
     * Faults: the row's composer a copy cast to another type, another role, the style from the
     * uncast composer, another icon literal, the click passed as the label, and another row call.
     */
    private static List<Instruction> saveShowRow(String fault) {
        // showRow(composer, click, label, icon): v0..v6 locals, the arguments in v7 to v10.
        List<Instruction> code = new ArrayList<>(List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 7),
                type(Opcode.CHECK_CAST, 0, MENU_COMPOSER),
                staticField(Opcode.SGET_OBJECT, 1, MENU_MODIFIER, "Companion", MENU_MODIFIER),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, fault.equals("save-show-role") ? 1 : 0), invoke(MENU_ROLE_OF, 2),
                op(Opcode.MOVE_RESULT_OBJECT, 2), new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 3, 8),
                new ImmutableInstruction11n(Opcode.CONST_4, 4, 1), invoke(MENU_CLICKABLE, 1, 2, 3, 4), op(Opcode.MOVE_RESULT_OBJECT, 1)));
        int styled = 0;
        if (fault.equals("save-show-style")) {
            code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 6, 7));
            styled = 6;
        }
        code.addAll(List.of(invoke(MENU_STYLE_OF, styled), op(Opcode.MOVE_RESULT_OBJECT, 2),
                new ImmutableInstruction22x(Opcode.MOVE_FROM16, 3, 10), new ImmutableInstruction11n(Opcode.CONST_4, 4, 2),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, fault.equals("save-show-icon") ? 1 : 0), invoke(MENU_ICON_OF, 0, 3, 4, 5),
                op(Opcode.MOVE_RESULT_OBJECT, 3), new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, fault.equals("save-show-label") ? 8 : 9)));
        // The style and icon keep the right composer, so only the row's own composer argument is wrong.
        int composer = 0;
        if (fault.equals("save-show-composer")) {
            code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 6, 7));
            code.add(type(Opcode.CHECK_CAST, 6, FEATURE_COMPOSER));
            composer = 6;
        }
        code.addAll(List.of(invoke(fault.equals("save-show-row") ? MENU_HEADER : MENU_ROW, composer, 1, 2, 3, 4), op(Opcode.RETURN_VOID)));
        return code;
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
        // An opened post's ads: the fetcher builds its one result from the list the hook hands back.
        List<Instruction> permalinkFetch = new ArrayList<>(List.of(string(0, "text_feed/threads_permalink_ads/"), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0)));
        if ((ads || fault.equals("omitted-permalink-hook")) && !fault.equals("permalink-missing") && !fault.startsWith("historical")) {
            int list = fault.equals("permalink-register") ? 0 : 3;
            permalinkFetch.add(invoke(PERMALINK_FILTER, list));
            permalinkFetch.add(op(Opcode.MOVE_RESULT_OBJECT, list));
        }
        permalinkFetch.add(type(Opcode.NEW_INSTANCE, 2, FEATURE_PERMALINK_RESULT));
        permalinkFetch.add(direct(method(FEATURE_PERMALINK_RESULT, "<init>", "V", SHORTCUT_LIST, "I"), 2, 3, 1));
        permalinkFetch.add(op(Opcode.RETURN_OBJECT, 2));
        classes.add(featureClass(FEATURE_PERMALINK, OBJECT, List.of(), define(FEATURE_PERMALINK, "fetch", OBJECT, true,
                body(4, permalinkFetch.toArray(new Instruction[0])), SHORTCUT_LIST)));
        classes.add(featureClass(FEATURE_PERMALINK_RESULT, OBJECT, List.of(), define(FEATURE_PERMALINK_RESULT, "<init>", "V", false,
                body(3, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), SHORTCUT_LIST, "I")));
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
                pandoGetter(FEATURE_MEDIA, "author", FEATURE_USER, "user"),
                // What Save photos and videos reads, under names that aren't the bridges'.
                pandoGetter(FEATURE_MEDIA, "videos", SHORTCUT_LIST, "video_versions"),
                pandoGetter(FEATURE_MEDIA, "manifest", "Ljava/lang/String;", "video_dash_manifest"),
                pandoGetter(FEATURE_MEDIA, "takenAt", "Ljava/lang/Long;", "taken_at"),
                pandoGetter(FEATURE_MEDIA, "items", SHORTCUT_LIST, "carousel_media"),
                pandoGetter(FEATURE_MEDIA, "images", IMAGE_INFO, "image_versions2"),
                pandoGetter(FEATURE_MEDIA, "textInfo", TEXT_POST_INFO, "text_post_app_info"),
                define(FEATURE_MEDIA, "getId", "Ljava/lang/String;", false, body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)))));

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
        if (links && !fault.equals("post-link-missing")) fetch.addAll(postLinkHook(2, 7, 0, fault));
        fetch.addAll(List.of(virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 4)));
        // post-link-live: the second hook takes the post's code into v2, the first link, which the fetch still stores.
        if (links && !fault.equals("post-link-missing")) fetch.addAll(postLinkHook(4, 7, fault.equals("post-link-live") ? 2 : 0, fault));
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
        // v0..v7 locals, this in v8 and the response in v9; the hook takes the post into v7. The
        // response in v3 is cast again after the read, so a hook there may not take v3.
        List<Instruction> copied = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 9),
                type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE), virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 2)));
        if (links && !fault.equals("holder-link-missing")) {
            int media = fault.equals("holder-link-live") ? 3 : 7;
            copied.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, media, fault.equals("holder-link-receiver") ? 9 : 8));
            copied.add(objectField(Opcode.IGET_OBJECT, media, media, fault.equals("holder-link-field") ? FEATURE_SHARE : FEATURE_HOLDER, "post", FEATURE_MEDIA));
            // The holder-post-link faults break only this copy of the hook, so the fetch's passes first.
            copied.addAll(postLinkHook(2, media, 0, fault.startsWith("holder-post-link-") ? fault.substring("holder-".length()) : fault));
        }
        copied.add(type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE));
        copied.add(op(Opcode.RETURN_OBJECT, 2));
        classes.add(featureClass(FEATURE_HOLDER, OBJECT, List.of(featureField(FEATURE_HOLDER, "post", FEATURE_MEDIA)),
                define(FEATURE_HOLDER, "copied", OBJECT, false, body(10, copied.toArray(new Instruction[0])), OBJECT)));
        // Send: a static use case hands the plain fetch its post and its continuation, then reads the
        // link after resuming without the post. v0..v7 locals, the use case in v8, the post in v9 and
        // the continuation in v10, copied into v5. Its return sits in a try whose handler answers the
        // response in v3: the return can't throw, but a hook in front of it can, so the hook may
        // not take v3 either.
        List<Instruction> send = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 5, 10),
                type(Opcode.NEW_INSTANCE, 2, FEATURE_REPOSITORY)));
        if (links && !fault.equals("resume-remember-missing")) send.add(invoke(POST_KEEPER, fault.equals("resume-remember-key") ? 8 : 5, 9));
        send.addAll(List.of(virtual(PLAIN_FETCH, 2, 8, 9, 8, 5), op(Opcode.MOVE_RESULT_OBJECT, 3),
                type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE), virtual(LINK_GETTER, 3), op(Opcode.MOVE_RESULT_OBJECT, 4)));
        int guarded = codeUnits(send);
        if (links && !fault.equals("resume-recall-missing")) send.addAll(recallHook(5, 4, fault, "resume-"));
        send.add(op(Opcode.RETURN_OBJECT, 4));
        int handler = codeUnits(send);
        send.add(op(Opcode.RETURN_OBJECT, 3));
        classes.add(featureClass(FEATURE_SEND, OBJECT, List.of(), define(FEATURE_SEND, "send", OBJECT, true,
                body(11, List.of(tryBlock(guarded, handler - guarded, handler)), send.toArray(new Instruction[0])),
                FEATURE_SEND, FEATURE_MEDIA, OBJECT)));
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

        directBrowserClasses(classes, browser, fault);
        classes.addAll(searchCarouselClasses(suggestions || fault.equals("search-carousel-omitted-hook"), fault));
        classes.addAll(profileClasses(suggestions || fault.equals("profile-carousel-omitted-hook"), suggestions || fault.equals("profile-row-omitted-hook"), fault));

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

        // trust-locals gives the method three registers, so `this` is v2 and the prefix writes it. Stock and patched agree on that.
        int signerSelf = fault.equals("trust-locals") ? 2 : 5;
        List<Instruction> signers = new ArrayList<>();
        if (trust && !fault.equals("trust-missing")) {
            signers.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, signerSelf));
            signers.add(objectField(Opcode.IGET_OBJECT, 0, 0, SIGNER_HOST, "info", PACKAGE_INFO));
            signers.add(invoke(fault.equals("trust-replaced") ? method("Ljava/util/Collections;", "singletonList", SHORTCUT_LIST, OBJECT) : ORIGINAL_SIGNERS, 0));
            signers.add(op(Opcode.MOVE_RESULT_OBJECT, 1));
            signers.add(ifEqz(1, fault.equals("trust-fallback") ? 27 : 9));
            signers.add(type(Opcode.NEW_INSTANCE, 0, SIGNER_RESULT));
            signers.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, 0));
            signers.add(direct(method(SIGNER_RESULT, "<init>", "V", SHORTCUT_LIST, "Z", "Z"), 0, 1, 2, 2));
            signers.add(op(Opcode.RETURN_OBJECT, 0));
        }
        signers.addAll(List.of(objectField(Opcode.IGET_OBJECT, 0, signerSelf, SIGNER_HOST, "info", PACKAGE_INFO),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signingInfo", "Landroid/content/pm/SigningInfo;"),
                virtual(method("Landroid/content/pm/SigningInfo;", "getApkContentsSigners", "[Landroid/content/pm/Signature;"), 1),
                op(Opcode.MOVE_RESULT_OBJECT, 1),
                objectField(Opcode.IGET_OBJECT, 0, signerSelf, SIGNER_HOST, "info", PACKAGE_INFO),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signingInfo", "Landroid/content/pm/SigningInfo;"),
                virtual(method("Landroid/content/pm/SigningInfo;", "getSigningCertificateHistory", "[Landroid/content/pm/Signature;"), 1),
                op(Opcode.MOVE_RESULT_OBJECT, 1),
                objectField(Opcode.IGET_OBJECT, 1, 0, PACKAGE_INFO, "signatures", "[Landroid/content/pm/Signature;"),
                type(Opcode.NEW_INSTANCE, 0, SIGNER_RESULT), new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                direct(method(SIGNER_RESULT, "<init>", "V", SHORTCUT_LIST, "Z", "Z"), 0, 1, 2, 2), op(Opcode.RETURN_OBJECT, 0)));
        classes.add(featureClass(SIGNER_HOST, OBJECT, List.of(featureField(SIGNER_HOST, "info", PACKAGE_INFO)),
                define(SIGNER_HOST, "read", SIGNER_RESULT, false, body(signerSelf + 1, signers.toArray(new Instruction[0])))));
        classes.add(featureClass(SIGNER_RESULT, OBJECT, List.of(), define(SIGNER_RESULT, "<init>", "V", false,
                body(4, direct(method(OBJECT, "<init>", "V"), 0), op(Opcode.RETURN_VOID)), SHORTCUT_LIST, "Z", "Z")));
        classes.add(shareTileClass(trust, fault));
        classes.addAll(returnRefreshClasses(patched && selected.contains("returnRefresh"), fault));
        classes.addAll(videoAutoplayClasses(patched && selected.contains("disableVideoAutoplay"), fault));
        classes.addAll(prefetchClasses(patched && selected.contains("disableVideoAutoplay"), patched ? fault : ""));
        classes.addAll(fault.startsWith("pure-black-fields") ? pureBlackFieldClasses(patched && selected.contains("pureBlack"), fault)
                : pureBlackClasses(patched && selected.contains("pureBlack"), fault));
        classes.addAll(saveMediaClasses(patched, patched && selected.contains("saveMedia"), fault));
        classes.addAll(settingsRowClasses(patched && selected.contains("settingsRow"), fault));
        classes.addAll(copyTextClasses(patched, patched && (selected.contains("settingsRow") || fault.equals("copy-text-omitted-hook")),
                patched && (selected.contains("settingsRow") || fault.equals("copy-text-omitted-selection")), fault));
        if (fault.startsWith("ambiguous-suggestion-") || fault.startsWith("proven-suggestion-")) corruptSuggestionStock(classes, fault);
        if (!patched) return classes;

        List<Method> flags = new ArrayList<>();
        for (String flag : List.of("hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust",
                "returnRefresh", "disableVideoAutoplay", "pureBlack", "saveMedia")) {
            if ((fault.equals("status-missing") || fault.equals("historical-missing-ad-status")) && flag.equals("hideAds")) continue;
            // The published bundles came before Open links in browser, Block background-return feed refresh, Disable video
            // autoplay, Pure black dark mode and Save photos and videos.
            if (fault.startsWith("historical") && (flag.equals("openLinksExternally") || flag.equals("returnRefresh")
                    || flag.equals("disableVideoAutoplay") || flag.equals("pureBlack") || flag.equals("saveMedia"))) continue;
            if ((fault.equals("suggestion-status-missing") || fault.startsWith("historical")) && flag.equals("hideSuggestedUsers")) continue;
            boolean enabled = selected.contains(flag) && !(fault.equals("status-false") && flag.equals("hideAds"));
            if (fault.equals("suggestion-status-false") && flag.equals("hideSuggestedUsers")) enabled = false;
            if (flag.equals("saveMedia") && (fault.equals("save-status-false") || fault.equals("save-omitted-status"))) enabled = !enabled;
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
        List<Method> adMethods = new ArrayList<>(List.of(
                define(FEATURE_ADS, "filter", SHORTCUT_LIST, true, body(1, op(Opcode.RETURN_OBJECT, 0)), SHORTCUT_LIST),
                define(FEATURE_ADS, "itemMedia", OBJECT, true, getter, OBJECT), define(FEATURE_ADS, "isAd", "Z", true, adCheck, OBJECT),
                define(FEATURE_ADS, "isSuggestedUserItem", "Z", true,
                        fault.equals("omitted-suggestion-predicate") ? body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), op(Opcode.RETURN, 0))
                                : suggestions ? suggestionPredicate(fault) : body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), OBJECT)));
        // The historical builds' extension came before the opened post's ad hook.
        if (!fault.startsWith("historical")) adMethods.add(define(FEATURE_ADS, "permalinkAds", SHORTCUT_LIST, true, body(1, op(Opcode.RETURN_OBJECT, 0)), SHORTCUT_LIST));
        classes.add(featureClass(FEATURE_ADS, OBJECT, List.of(), adMethods.toArray(new Method[0])));
        classes.add(featureClass(FEATURE_ANALYTICS, OBJECT, List.of(), define(FEATURE_ANALYTICS, "endpoint", "Ljava/lang/String;", true,
                body(1, op(Opcode.RETURN_OBJECT, 0)), "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_LINKS, OBJECT, List.of(), define(FEATURE_LINKS, "sanitizeShared", "Ljava/lang/String;", true,
                body(1, op(Opcode.RETURN_OBJECT, 0)), "Ljava/lang/String;"),
                define(FEATURE_LINKS, "postLink", "Ljava/lang/String;", true, body(3, op(Opcode.RETURN_OBJECT, 0)),
                        "Ljava/lang/String;", OBJECT, "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_BROWSER, OBJECT, List.of(), define(FEATURE_BROWSER, "open", "Z", true,
                body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), CONTEXT, "Ljava/lang/String;")));
        classes.add(featureClass(FEATURE_SEARCH, OBJECT, List.of(), define(FEATURE_SEARCH, "showCarousel", "Z", true,
                body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), op(Opcode.RETURN, 0)))));
        classes.add(featureClass(FEATURE_PROFILE, OBJECT, List.of(),
                define(FEATURE_PROFILE, "carousel", OBJECT, true, body(1, op(Opcode.RETURN_OBJECT, 0)), OBJECT),
                define(FEATURE_PROFILE, "showRow", "Z", true, body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), op(Opcode.RETURN, 0)))));
        classes.add(featureClass(FEATURE_TRUST, OBJECT, List.of(), define(FEATURE_TRUST, "originalSigners", SHORTCUT_LIST, true,
                body(2, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)), PACKAGE_INFO)));
        classes.add(featureClass(FEATURE_RETURN, OBJECT, List.of(),
                define(FEATURE_RETURN, "holdHotStart", "Z", true, body(1, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0))),
                define(FEATURE_RETURN, "resetToFeed", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z"),
                define(FEATURE_RETURN, "warmStart", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z"),
                define(FEATURE_RETURN, "cachedPosts", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z")));
        classes.add(featureClass(FEATURE_AUTOPLAY, OBJECT, List.of(), define(FEATURE_AUTOPLAY, "play", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z"),
                define(FEATURE_AUTOPLAY, "skipPrefetch", "Z", true, body(1, op(Opcode.RETURN, 0)), "Z")));
        classes.add(featureClass(FEATURE_PURE_BLACK, OBJECT, List.of(),
                define(FEATURE_PURE_BLACK, "argb", "J", true, body(2, op(Opcode.RETURN_WIDE, 0)), "J"),
                define(FEATURE_PURE_BLACK, "color", "J", true, body(2, op(Opcode.RETURN_WIDE, 0)), "J")));
        // The published bundles came before the settings row too, and their extension has no ThreadsSettingsRow.
        if (!fault.startsWith("historical")) classes.addAll(settingsRowExtension(selected.contains("settingsRow"), fault));
        // And before Save photos and videos, whose extension classes they don't carry either.
        if (!fault.startsWith("historical")) classes.addAll(saveMediaExtension(selected.contains("saveMedia"), fault));
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

    /** 451's duplicate fetch label and 452's high-register coroutine receiver, with matched stock mutations. */
    private static List<ClassDef> featureSharingAliasBuild(boolean patched, String fault) {
        List<ClassDef> classes = featureBuild(patched, patched ? Set.of("sanitizeSharingLinks") : Set.of(), 0, "");
        String resumed = "call to 'resume' before 'invoke' with coroutine";
        for (int c = 0; c < classes.size(); c++) {
            ClassDef original = classes.get(c);
            if (!original.getType().equals(FEATURE_REPOSITORY)) continue;
            List<Method> methods = new ArrayList<>();
            for (Method m : original.getMethods()) {
                List<Instruction> code = new ArrayList<>();
                m.getImplementation().getInstructions().forEach(code::add);
                if (m.getName().equals("fetch") && !fault.equals("fetch-no-resume")) code.add(0, string(0, resumed));
                if (m.getName().equals("plain")) {
                    code.add(0, string(0, "itas-android"));
                    if (fault.equals("fetch-two-resumes")) code.add(0, string(0, resumed));
                }
                methods.add(new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                        m.getAnnotations(), m.getHiddenApiRestrictions(), body(m.getImplementation().getRegisterCount(), code.toArray(new Instruction[0]))));
            }
            classes.set(c, featureClass(FEATURE_REPOSITORY, OBJECT, List.of(), methods.toArray(new Method[0])));
        }
        int self = 13, post = 6;
        List<Instruction> quick = new ArrayList<>();
        quick.add(new ImmutableInstruction11n(Opcode.CONST_4, post, 0));
        if (fault.equals("foreign-alias")) quick.add(new ImmutableInstruction11n(Opcode.CONST_4, self, 0));
        int mixed = quick.size();
        // Keep the eventual branch's two-code-unit width before featureBranch computes its offset.
        quick.add(fault.equals("mixed-alias") ? ifEqz(3, 1) : op(Opcode.NOP));
        if (fault.equals("mixed-alias")) quick.add(new ImmutableInstruction11n(Opcode.CONST_4, self, 0));
        int bypass = quick.size();
        quick.add(fault.equals("load-bypass") || fault.equals("cast-bypass") ? ifEqz(3, 1) : op(Opcode.NOP));
        int load = quick.size();
        quick.add(objectField(Opcode.IGET_OBJECT, post, self, FEATURE_QUICK, "post", OBJECT));
        int cast = quick.size();
        quick.add(type(Opcode.CHECK_CAST, post, FEATURE_MEDIA));
        if (fault.equals("cast-duplicate")) {
            quick.add(objectField(Opcode.IGET_OBJECT, post, self, FEATURE_QUICK, "post", OBJECT));
            quick.add(type(Opcode.CHECK_CAST, post, FEATURE_MEDIA));
        }
        if (patched) quick.add(invoke(POST_KEEPER, fault.equals("remember-key") ? 3 : self, post));
        quick.add(new ImmutableInstruction11n(Opcode.CONST_4, 5, 0));
        quick.add(objectField(Opcode.IPUT_OBJECT, 5, self, FEATURE_QUICK, "post", OBJECT));
        // As in 452, the alias is reused for an instance-of between the cast and the read, so the
        // recall goes through this itself. The clobbers write this, or the upper half of a wide pair.
        quick.add(new ImmutableInstruction22c(Opcode.INSTANCE_OF, self, 3, new ImmutableTypeReference(FEATURE_RESPONSE)));
        if (fault.equals("recall-clobber")) quick.add(new ImmutableInstruction21s(Opcode.CONST_16, 26, 0));
        if (fault.equals("wide-recall-clobber")) quick.add(new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 25, 0));
        int read = quick.size();
        quick.add(virtual(LINK_GETTER, 3));
        quick.add(op(Opcode.MOVE_RESULT_OBJECT, 2));
        if (patched) {
            List<Instruction> recall = new ArrayList<>(recallHook(self, 2, "", "quick-"));
            recall.set(0, fault.equals("recall-key") ? invoke(POST_RECALL, 3) : new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 26, 1, POST_RECALL));
            quick.addAll(recall);
        }
        quick.add(op(Opcode.RETURN_OBJECT, 2));
        if (fault.equals("mixed-alias")) featureBranch(quick, mixed, load, Opcode.IF_EQZ, 3, 0);
        if (fault.equals("load-bypass")) featureBranch(quick, bypass, cast, Opcode.IF_EQZ, 3, 0);
        if (fault.equals("cast-bypass")) featureBranch(quick, bypass, read, Opcode.IF_EQZ, 3, 0);
        List<Instruction> code = new ArrayList<>(List.of(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, self, 26),
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 3, 27), type(Opcode.CHECK_CAST, 3, FEATURE_RESPONSE)));
        code.addAll(Arrays.asList(switched(quick)));
        for (int c = 0; c < classes.size(); c++) if (classes.get(c).getType().equals(FEATURE_QUICK)) {
            classes.set(c, featureClass(FEATURE_QUICK, OBJECT, List.of(featureField(FEATURE_QUICK, "post", OBJECT)),
                    define(FEATURE_QUICK, "invokeSuspend", OBJECT, false, body(28, code.toArray(new Instruction[0])), OBJECT)));
        }
        return classes;
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
        Set<String> allFeatures = Set.of("hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust",
                "returnRefresh", "disableVideoAutoplay", "pureBlack", "saveMedia", "settingsRow");
        dexes.put("features-clean", featureBuild(false, Set.of(), 0, ""));
        dexes.put("features-good", featureBuild(true, allFeatures, 7, ""));
        dexes.put("features-omitted", featureBuild(true, Set.of(), 0, ""));
        for (String feature : allFeatures) dexes.put("features-only-" + feature, featureBuild(true, Set.of(feature), 7, ""));
        for (int mask = 1; mask <= 7; mask++) dexes.put("features-mask-" + mask, featureBuild(true, Set.of("disableAnalytics"), mask, ""));
        for (String fault : List.of("feed-missing", "feed-replaced", "feed-register", "feed-duplicate", "item-stub", "ad-target", "ad-discarded", "ad-body", "ad-helper-body", "getter-body", "ad-helper-native", "getter-static",
                "permalink-missing", "permalink-register",
                "link-missing", "link-replaced", "link-register", "post-link-missing", "post-link-register", "post-link-getter", "post-link-bypass",
                "holder-link-missing", "holder-link-receiver", "holder-link-field", "holder-post-link-register", "holder-post-link-bypass",
                "resume-remember-missing", "resume-remember-key", "resume-recall-missing", "resume-recall-key", "resume-recall-cast",
                "resume-post-link-bypass", "quick-remember-missing", "quick-remember-post", "quick-recall-key", "quick-post-link-bypass",
                "browser-missing", "browser-register", "browser-bypass", "browser-clobber",
                "pigeon-missing", "pigeon-replaced", "pigeon-bypass",
                "default-missing", "mqtt-missing", "trust-missing", "trust-replaced", "trust-fallback",
                "tile-missing", "tile-swapped", "tile-answer", "tile-live", "status-missing", "status-false")) {
            dexes.put("features-bad-" + fault, featureBuild(true, allFeatures, 7, fault));
        }
        for (String fault : List.of("lead-missing", "lead-url", "lead-double-open", "lead-parameter", "lead-live", "ad-missing", "ad-url", "ad-context", "ad-double-open", "ad-return", "ad-bypass",
                "media-missing", "media-url", "media-context", "media-double-open", "media-false", "media-uninitialized", "media-live", "media-bypass", "factory-hook", "immersive-hook")) {
            dexes.put("features-bad-browser-direct-" + fault, featureBuild(true, Set.of("openLinksExternally"), 0, "browser-direct-" + fault));
        }
        dexes.put("features-bad-browser-direct-omitted-body", featureBuild(true, Set.of(), 0, "browser-direct-omitted-body"));
        // The media caller whose completion reads what the hook site doesn't is Threads' own shape, so it has a clean build of its own.
        dexes.put("features-browser-completion-live-clean", featureBuild(false, Set.of(), 0, "browser-direct-media-completion-live"));
        dexes.put("features-bad-browser-direct-media-completion-live", featureBuild(true, Set.of("openLinksExternally"), 0, "browser-direct-media-completion-live"));
        // Search's Follow suggestions carousel, Hide suggested users alone, and then left out.
        for (String fault : List.of("missing", "inverted", "ignored", "target", "double", "stray", "live-start", "live-away", "parameter", "body")) {
            dexes.put("features-bad-search-carousel-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, "search-carousel-" + fault));
        }
        for (String fault : List.of("omitted-hook", "omitted-call", "omitted-body")) {
            dexes.put("features-bad-search-carousel-" + fault, featureBuild(true, Set.of(), 0, "search-carousel-" + fault));
        }
        // The profile's carousel and header row the same way, then the two stock faults, which need a
        // clean build of their own.
        for (String fault : List.of("carousel-missing", "carousel-register", "carousel-result", "carousel-result-dropped", "carousel-cast",
                "carousel-cast-register", "carousel-uncast", "carousel-moved", "carousel-double", "carousel-stray", "carousel-body", "row-missing",
                "row-inverted", "row-tested", "row-ignored", "row-target", "row-double", "row-stray", "row-live-start", "row-live-away", "row-parameter",
                "row-body")) {
            dexes.put("features-bad-profile-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, "profile-" + fault));
        }
        for (String fault : List.of("carousel-omitted-hook", "carousel-omitted-body", "row-omitted-hook", "row-omitted-call", "row-omitted-body")) {
            dexes.put("features-bad-profile-" + fault, featureBuild(true, Set.of(), 0, "profile-" + fault));
        }
        for (String fault : List.of("carousel-shared", "carousel-gap", "carousel-polarity", "carousel-other-register", "carousel-joined", "row-compared")) {
            dexes.put("features-profile-" + fault + "-clean", featureBuild(false, Set.of(), 0, "profile-" + fault));
            dexes.put("features-bad-profile-" + fault, featureBuild(true, Set.of("hideSuggestedUsers"), 0, "profile-" + fault));
        }
        dexes.put("features-profile-row-flipped-clean", featureBuild(false, Set.of(), 0, "profile-row-flipped"));
        dexes.put("features-profile-row-flipped", featureBuild(true, Set.of("hideSuggestedUsers"), 0, "profile-row-flipped"));
        // Background-return refresh alone, so a failure can only be its own.
        for (String fault : List.of("hot-start-missing", "hot-start-inverted", "reset-missing", "reset-register",
                "warm-start-missing", "warm-start-moved", "cached-posts-missing", "cached-posts-bypass")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("returnRefresh"), 0, fault));
        }
        // Disable video autoplay alone too. The ad card that reads its mask after PostVideo does so in its own stock build.
        for (String fault : List.of("autoplay-missing", "autoplay-register", "autoplay-inside", "autoplay-bypass",
                "autoplay-inline-missing", "autoplay-default-ignored", "autoplay-ad-literal", "autoplay-viewer", "autoplay-ad-live")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("disableVideoAutoplay"), 0, fault));
        }
        // And the prefetch skip test's hook: one bad build for each thing its contract checks, then, with the
        // feature left out, the call written anyway or one of the bodies the hook leaves alone changed.
        for (String fault : List.of("prefetch-missing", "prefetch-register", "prefetch-dropped", "prefetch-answer-moved",
                "prefetch-after-test", "prefetch-legacy", "prefetch-twice", "prefetch-branch-past", "prefetch-changed-skip",
                "prefetch-changed-check", "prefetch-changed-sibling", "prefetch-changed-legacy", "prefetch-changed-dispatch")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("disableVideoAutoplay"), 0, fault));
        }
        for (String fault : List.of("prefetch-omitted-call", "prefetch-omitted-skip", "prefetch-omitted-check", "prefetch-omitted-sibling",
                "prefetch-omitted-legacy", "prefetch-omitted-dispatch")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of(), 0, fault));
        }
        dexes.put("features-autoplay-forward-clean", videoAutoplayForwardBuild(false, Set.of(), ""));
        dexes.put("features-autoplay-forward-good", videoAutoplayForwardBuild(true, Set.of("disableVideoAutoplay"), ""));
        dexes.put("features-autoplay-forward-omitted", videoAutoplayForwardBuild(true, Set.of(), ""));
        for (String fault : List.of("forward-missing", "forward-register", "forward-default", "forward-viewer", "forward-body")) {
            dexes.put("features-bad-" + fault, videoAutoplayForwardBuild(true, Set.of("disableVideoAutoplay"), fault));
        }
        dexes.put("features-bad-forward-omitted-body", videoAutoplayForwardBuild(true, Set.of(), "forward-body"));
        for (String fault : List.of("forward-flag-clobber", "forward-mask-clobber", "forward-side-effect", "forward-repeat")) {
            dexes.put("features-autoplay-" + fault + "-clean", videoAutoplayForwardBuild(false, Set.of(), fault));
            dexes.put("features-bad-" + fault, videoAutoplayForwardBuild(true, Set.of("disableVideoAutoplay"), fault));
        }
        dexes.put("features-autoplay-live-clean", featureBuild(false, Set.of(), 0, "autoplay-ad-live"));
        // And Pure black dark mode.
        for (String fault : List.of("pure-black-load-missing", "pure-black-load-register", "pure-black-background-missing",
                "pure-black-background-register", "pure-black-light")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("pureBlack"), 0, fault));
        }
        dexes.put("features-pure-black-fields-clean", featureBuild(false, Set.of(), 0, "pure-black-fields"));
        dexes.put("features-pure-black-fields-good", featureBuild(true, Set.of("pureBlack"), 0, "pure-black-fields"));
        dexes.put("features-pure-black-fields-omitted", featureBuild(true, Set.of(), 0, "pure-black-fields"));
        for (String fault : List.of("copy-missing", "branch-bypass", "store-duplicate", "getter-note", "background-missing", "light")) {
            String name = "pure-black-fields-" + fault;
            dexes.put("features-" + name + "-clean", featureBuild(false, Set.of(), 0, name));
            dexes.put("features-bad-" + name, featureBuild(true, Set.of("pureBlack"), 0, name));
        }
        // And the HushThreads settings row.
        for (String fault : List.of("settings-row-missing", "settings-row-outside", "settings-row-register", "settings-row-stub", "settings-row-click")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("settingsRow"), 0, fault));
        }
        // And Save photos and videos: one bad build for each thing its contract checks, alone, then left
        // out. The branch straight to Copy link's row call is Threads' own, so it has a clean build too.
        for (String fault : List.of("missing", "copy", "capture", "goto", "twice", "duplicate", "other-item", "show-stub", "show-row",
                "show-composer", "show-role", "show-style", "show-icon", "show-label", "media-field", "media-cast", "activity-field",
                "activity-cast", "dismiss-cast", "dismiss-field", "dismiss-call", "click", "click-static", "bridge-getter", "bridge-shared-getter", "bridge-call",
                "bridge-cast", "bridge-result", "bridge-stub", "bridge-extra", "status-false", "bypass")) {
            dexes.put("features-bad-save-" + fault, featureBuild(true, Set.of("saveMedia"), 0, "save-" + fault));
        }
        dexes.put("features-save-bypass-clean", featureBuild(false, Set.of(), 0, "save-bypass"));
        // A case of a switch and an exception handler aimed at the row call are Threads' own too.
        for (String fault : List.of("switch-case", "handler-edge")) {
            dexes.put("features-bad-save-" + fault, featureBuild(true, Set.of("saveMedia"), 0, "save-" + fault));
            dexes.put("features-save-" + fault + "-clean", featureBuild(false, Set.of(), 0, "save-" + fault));
        }
        for (String fault : List.of("omitted-menu", "omitted-add", "omitted-show", "omitted-media", "omitted-activity", "omitted-dismiss",
                "omitted-bridge", "omitted-bridge-int", "omitted-status")) {
            dexes.put("features-bad-save-" + fault, featureBuild(true, Set.of(), 0, "save-" + fault));
        }
        // And Copy text, which comes with the settings row: hook faults with it selected, then left out,
        // then the stock faults, which need a clean build of their own.
        for (String fault : List.of("moved", "target", "null-register", "action", "action-register", "live", "parameter", "free-held", "swapped",
                "result", "cast", "body", "missing", "double", "stray",
                "selection-register", "selection-result", "selection-body", "selection-missing", "selection-stray")) {
            dexes.put("features-bad-copy-text-" + fault, featureBuild(true, Set.of("settingsRow"), 0, "copy-text-" + fault));
        }
        for (String fault : List.of("omitted-hook", "omitted-selection", "omitted-body", "omitted-selection-body")) {
            dexes.put("features-bad-copy-text-" + fault, featureBuild(true, Set.of(), 0, "copy-text-" + fault));
        }
        for (String fault : List.of("shared", "none", "actions", "selection-written", "selection-constant", "selection-default",
                "selection-unchecked", "selection-twice")) {
            dexes.put("features-copy-text-" + fault + "-clean", featureBuild(false, Set.of(), 0, "copy-text-" + fault));
            dexes.put("features-bad-copy-text-" + fault, featureBuild(true, Set.of("settingsRow"), 0, "copy-text-" + fault));
        }
        // Keep the old direct-this sharing fixtures and add 451's low alias of high-register this.
        dexes.put("features-sharing-alias-clean", featureSharingAliasBuild(false, ""));
        dexes.put("features-sharing-alias-good", featureSharingAliasBuild(true, ""));
        for (String fault : List.of("fetch-no-resume", "fetch-two-resumes", "foreign-alias", "mixed-alias",
                "recall-clobber", "wide-recall-clobber", "load-bypass", "cast-bypass", "cast-duplicate", "remember-key", "recall-key")) {
            dexes.put("features-sharing-alias-" + fault + "-clean", featureSharingAliasBuild(false, fault));
            dexes.put("features-sharing-alias-bad-" + fault, featureSharingAliasBuild(true, fault));
        }
        // And share-link hooks that write a register the method still reads after them, sanitize sharing links alone.
        for (String fault : List.of("post-link-live", "holder-link-live", "resume-recall-live")) {
            dexes.put("features-bad-" + fault, featureBuild(true, Set.of("sanitizeSharingLinks"), 0, fault));
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
        // The settings row has no status to clear: a selection without it is what leaves it out.
        for (String feature : List.of("hideAds", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust", "returnRefresh",
                "disableVideoAutoplay", "pureBlack", "saveMedia", "settingsRow")) {
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
        for (String fault : List.of("omitted-feed-hook", "omitted-item-getter", "omitted-permalink-hook")) dexes.put("features-bad-" + fault, featureBuild(true, Set.of(), 0, fault));
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
        dexes.put("features-trust-locals-clean", featureBuild(false, Set.of(), 0, "trust-locals"));
        dexes.put("features-bad-trust-locals", featureBuild(true, Set.of("restoreTrust"), 0, "trust-locals"));
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
        for (String fault : List.of("logo-missing", "logo-register", "logo-duplicate", "logo-stock-left")) {
            dexes.put("bad-" + fault, logoFault(fault));
        }
        for (String fault : List.of("soloader-missing", "soloader-late", "soloader-elsewhere")) {
            dexes.put("bad-" + fault, soLoaderFault(fault));
        }
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
