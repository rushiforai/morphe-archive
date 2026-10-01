import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.VariableRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.zip.ZipFile;

class VerifySettingsDex {
    static Map<String, ClassDef> classes = new HashMap<>();
    static Map<String, byte[]> expectedBridge = new HashMap<>();
    static final String PREFIX = "Lapp/spicetify/extension/spotify/settings/";
    static final String BRIDGE = PREFIX + "nativebridge/";

    static byte[] canonical(ClassDef definition) {
        var pool = new DexPool(Opcodes.forApi(35));
        pool.internClass(definition);
        var output = new MemoryDataStore();
        try {
            try {
                pool.writeTo(output);
                return output.getData();
            } finally {
                output.close();
            }
        } catch (IOException error) {
            throw new UncheckedIOException(error);
        }
    }

    static void loadBridge(byte[] dex) {
        expectedBridge = new HashMap<>();
        var file = new DexBackedDexFile(Opcodes.forApi(24), ByteBuffer.wrap(dex));
        for (var definition : file.getClasses()) {
            require(definition.getType().startsWith(BRIDGE), "Unexpected canonical bridge type");
            expectedBridge.put(definition.getType(), canonical(definition));
        }
    }

    static String signature(MethodReference m) {
        return m.getName() + m.getParameterTypes() + m.getReturnType();
    }

    static void require(boolean value, String message) {
        if (!value) {
            throw new AssertionError(message);
        }
    }

    static void load(String path) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(path), Opcodes.forApi(24));
        for (var name : container.getDexEntryNames()) {
            for (var c : container.getEntry(name).getDexFile().getClasses()) {
                require(classes.put(c.getType(), c) == null, "Duplicate " + c.getType());
            }
        }
    }

    static boolean implemented(ClassDef c, MethodReference required) {
        for (var m : c.getMethods()) {
            if (signature(m).equals(signature(required))
                    && (m.getAccessFlags() & AccessFlags.ABSTRACT.getValue()) == 0) {
                return true;
            }
        }
        return classes.containsKey(c.getSuperclass())
                && implemented(classes.get(c.getSuperclass()), required);
    }

    static Method method(MethodReference ref) {
        var c = classes.get(ref.getDefiningClass());
        require(c != null, "Missing owner " + ref);
        for (var m : c.getMethods()) {
            if (signature(m).equals(signature(ref))) {
                return m;
            }
        }
        throw new AssertionError("Missing method " + ref);
    }

    static Field field(FieldReference ref) {
        var c = classes.get(ref.getDefiningClass());
        require(c != null, "Missing owner " + ref);
        for (var f : c.getFields()) {
            if (f.getName().equals(ref.getName()) && f.getType().equals(ref.getType())) {
                return f;
            }
        }
        throw new AssertionError("Missing field " + ref);
    }

    public static void main(String[] args) throws Exception {
        require(
                args.length == 4 || args.length == 6,
                "Usage: VerifySettingsDex.java APK SHARING_ENABLED THEME_ENABLED BUNDLE [HOME_ENABLED SERVER_ENABLED]");
        require(
                Set.of("0", "1").contains(args[1]) && Set.of("0", "1").contains(args[2]),
                "Expected boolean flags 0 or 1");
        classes = new HashMap<>();
        load(args[0]);
        try (var bundle = new ZipFile(args[3])) {
            var entry = bundle.getEntry("extensions/settings.dex");
            require(entry != null, "Bundle lacks the canonical settings bridge");
            try (var input = bundle.getInputStream(entry)) {
                loadBridge(input.readAllBytes());
            }
        }
        verify(args[1].equals("1"), args[2].equals("1"));
        if (args.length == 6) {
            require(Set.of("0", "1").contains(args[4]) && Set.of("0", "1").contains(args[5]),
                    "Expected optional capability flags 0 or 1");
            verifyCapability("homePins", args[4].equals("1"));
            verifyCapability("serverFiles", args[5].equals("1"));
        }
        System.out.println(
                "Settings DEX verified: one startup hook, one native settings row hook,"
                        + " capabilities, analytics and four bridge classes");
    }

    static void verify(boolean sharing, boolean theme) {
        verifyHooks();
        verifyCapability("cleanSharing", sharing);
        verifyCapability("themeColors", theme);
        verifyAnalytics();
        verifyActivity();
        verifyBridge();
    }

    static void verifyActivity() {
        String owner = PREFIX + "SpicetifySettingsActivity;";
        var activity = classes.get(owner);
        require(activity != null, "Missing settings Activity");
        require(AccessFlags.PUBLIC.isSet(activity.getAccessFlags())
                        && !AccessFlags.ABSTRACT.isSet(activity.getAccessFlags())
                        && "Landroid/app/Activity;".equals(activity.getSuperclass()),
                "Settings class must be a public concrete Activity");
        var constructor = named(owner, "<init>", List.of(), "V");
        var open = named(owner, "open", List.of("Landroid/app/Activity;"), "V");
        var onCreate = named(owner, "onCreate", List.of("Landroid/os/Bundle;"), "V");
        for (var target : List.of(constructor, open, onCreate)) {
            require(target.getImplementation() != null,
                    "Missing Activity method body " + target);
            require(AccessFlags.STATIC.isSet(target.getAccessFlags()) == (target == open),
                    "Invalid Activity method dispatch " + target);
            require(AccessFlags.PUBLIC.isSet(target.getAccessFlags())
                            || (target == onCreate
                                    && AccessFlags.PROTECTED.isSet(target.getAccessFlags())),
                    "Inaccessible Activity method " + target);
        }
    }

    static List<Instruction> code(Method m) {
        require(m.getImplementation() != null, "Missing body " + m);
        var out = new ArrayList<Instruction>();
        m.getImplementation().getInstructions().forEach(out::add);
        return out;
    }

    static Method named(String owner, String name, List<String> params, String result) {
        return method(new ImmutableMethodReference(owner, name, params, result));
    }

    static String ref(Instruction i) {
        return i instanceof ReferenceInstruction r ? r.getReference().toString() : "";
    }

    static boolean call(Instruction i, String owner, String name) {
        return i instanceof ReferenceInstruction r
                && r.getReference() instanceof MethodReference m
                && m.getDefiningClass().equals(owner)
                && m.getName().equals(name);
    }

    static void verifyHooks() {
        int startup = 0, append = 0;
        for (var c : classes.values()) {
            for (var m : c.getMethods()) {
                if (m.getImplementation() == null) {
                    continue;
                }
                var code = code(m);
                for (int n = 0; n < code.size(); n++) {
                    var i = code.get(n);
                    if (call(i, PREFIX + "PatchSettings;", "initialize")) {
                        if (c.getType().startsWith(PREFIX)) {
                            continue;
                        }
                        startup++;
                        require(
                                c.getType().equals("Lcom/spotify/music/SpotifyApplication;")
                                        && m.getName().equals("onCreate")
                                        && m.getParameterTypes().isEmpty()
                                        && m.getReturnType().equals("V")
                                        && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                                        && n == 0,
                                "Settings startup hook must begin Application.onCreate");
                        require(
                                i.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                                        && i instanceof RegisterRangeInstruction r
                                        && r.getRegisterCount() == 1
                                        && r.getStartRegister()
                                                == m.getImplementation().getRegisterCount() - 1,
                                "Settings startup hook must pass p0");
                        require(
                                ref(i).equals(
                                                PREFIX
                                                        + "PatchSettings;->initialize(Landroid/content/Context;)V"),
                                "Startup hook descriptor changed");
                    }
                    if (call(i, BRIDGE + "SettingsBridge;", "append")) {
                        append++;
                        require(
                                c.getType().equals("Lp/xlt;")
                                        && m.getName().equals("create")
                                        && m.getParameterTypes().isEmpty()
                                        && m.getReturnType().equals("Lp/biy0;")
                                        && i.getOpcode() == Opcode.INVOKE_STATIC
                                        && i instanceof FiveRegisterInstruction r
                                        && r.getRegisterCount() == 2
                                        && r.getRegisterC() == 6
                                        && r.getRegisterD() == 2,
                                "Settings row hook must pass root list v6 and factory v2");
                        require(
                                ref(i).equals(
                                                BRIDGE
                                                        + "SettingsBridge;->append(Ljava/util/List;Lp/ion;)V"),
                                "Append descriptor changed");
                        require(
                                n + 2 < code.size()
                                        && code.get(n + 1).getOpcode() == Opcode.IGET_OBJECT
                                        && ref(code.get(n + 1))
                                                .equals("Lp/ion;->c:Ljava/lang/Object;")
                                        && code.get(n + 1) instanceof TwoRegisterInstruction read
                                        && read.getRegisterB() == 2
                                        && code.get(n + 2).getOpcode() == Opcode.CHECK_CAST
                                        && ref(code.get(n + 2)).equals("Lp/dpb;")
                                        && ((OneRegisterInstruction) code.get(n + 2)).getRegisterA()
                                                == read.getRegisterA(),
                                "Append must precede the original ion.c / dpb access");
                    }
                }
            }
        }
        require(
                startup == 1 && append == 1,
                "Expected exactly one startup and append hook; found " + startup + "/" + append);
        for (var required :
                List.of(
                        named(
                                PREFIX + "PatchSettings;",
                                "initialize",
                                List.of("Landroid/content/Context;"),
                                "V"),
                        named(
                                BRIDGE + "SettingsBridge;",
                                "append",
                                List.of("Ljava/util/List;", "Lp/ion;"),
                                "V"))) {
            require(
                    AccessFlags.PUBLIC.isSet(required.getAccessFlags())
                            && AccessFlags.STATIC.isSet(required.getAccessFlags())
                            && required.getImplementation() != null,
                    "Invalid hook target " + required);
        }
    }

    static void verifyCapability(String name, boolean enabled) {
        var m = named(PREFIX + "InstalledPatches;", name, List.of(), "Z");
        var c = code(m);
        require(
                AccessFlags.PUBLIC.isSet(m.getAccessFlags())
                        && AccessFlags.STATIC.isSet(m.getAccessFlags())
                        && c.size() == 2
                        && c.get(0).getOpcode() == Opcode.CONST_4
                        && ((OneRegisterInstruction) c.get(0)).getRegisterA() == 0
                        && ((NarrowLiteralInstruction) c.get(0)).getNarrowLiteral()
                                == (enabled ? 1 : 0)
                        && c.get(1).getOpcode() == Opcode.RETURN
                        && ((OneRegisterInstruction) c.get(1)).getRegisterA() == 0,
                "Installed capability mismatch: " + name);
    }

    static int targetIndex(List<Instruction> c, int index) {
        int address = 0;
        for (int n = 0; n < index; n++) {
            address += c.get(n).getCodeUnits();
        }
        int target = address + ((OffsetInstruction) c.get(index)).getCodeOffset();
        address = 0;
        for (int n = 0; n < c.size(); n++) {
            if (address == target) {
                return n;
            }
            address += c.get(n).getCodeUnits();
        }
        throw new AssertionError("Branch target is not an instruction boundary");
    }

    static void verifyAnalytics() {
        var m = named("Lp/c3g0;", "<init>", List.of("I", "Lp/ct71;", "I"), "V");
        var c = code(m);
        var matches = new ArrayList<Integer>();
        for (int n = 0; n < c.size(); n++) {
            if (ref(c.get(n)).equals("spicetify_settings")) {
                matches.add(n);
            }
        }
        require(matches.size() == 1, "Expected one settings analytics label");
        int n = matches.getFirst();
        require(
                n >= 2
                        && n + 2 < c.size()
                        && c.get(n - 2).getOpcode() == Opcode.CONST_4
                        && ((OneRegisterInstruction) c.get(n - 2)).getRegisterA() == 7
                        && ((NarrowLiteralInstruction) c.get(n - 2)).getNarrowLiteral() == -1,
                "Analytics must compare reserved value -1 in v7");
        require(
                c.get(n - 1).getOpcode() == Opcode.IF_NE
                        && ((TwoRegisterInstruction) c.get(n - 1)).getRegisterA() == 5
                        && ((TwoRegisterInstruction) c.get(n - 1)).getRegisterB() == 7
                        && targetIndex(c, n - 1) == n + 2,
                "Native analytics values must branch to original switch");
        require(
                c.get(n).getOpcode() == Opcode.CONST_STRING
                        && ((OneRegisterInstruction) c.get(n)).getRegisterA() == 0
                        && c.get(n + 1).getOpcode() == Opcode.GOTO_16
                        && c.get(n + 2).getOpcode() == Opcode.PACKED_SWITCH
                        && ((OneRegisterInstruction) c.get(n + 2)).getRegisterA() == 5,
                "Settings analytics label flow changed");
        int payload = targetIndex(c, n + 2);
        require(
                c.get(payload) instanceof SwitchPayload labels
                        && !labels.getSwitchElements().isEmpty()
                        && labels.getSwitchElements().stream().noneMatch(e -> e.getKey() == -1),
                "Native switch must preserve reserved -1 outside its cases");
        int sink = targetIndex(c, n + 1);
        int firstSink = -1;
        for (int index = n + 3; index < c.size(); index++) {
            if (ref(c.get(index)).equals("Lp/it71;->b:Ljava/lang/String;")) {
                firstSink = index;
                break;
            }
        }
        require(sink == firstSink, "Settings label must reach the navigation analytics sink");
        require(
                sink > n + 2
                        && c.get(sink).getOpcode() == Opcode.IPUT_OBJECT
                        && ref(c.get(sink)).equals("Lp/it71;->b:Ljava/lang/String;")
                        && ((TwoRegisterInstruction) c.get(sink)).getRegisterA() == 0
                        && ((TwoRegisterInstruction) c.get(sink)).getRegisterB() == 6,
                "Settings label must reach original analytics label store");
        require(
                c.subList(0, n - 2).stream()
                        .anyMatch(
                                i -> ref(i).equals("mobile-settings-element-standard-navigation")),
                "Missing native navigation analytics marker");
    }

    static void verifyBridge() {
        var owned =
                classes.values().stream()
                        .filter(
                                c ->
                                        c.getType()
                                                .startsWith(
                                                        "Lapp/spicetify/extension/spotify/settings/nativebridge/"))
                        .toList();
        require(
                owned.stream()
                        .map(ClassDef::getType)
                        .collect(Collectors.toSet())
                        .equals(
                                Set.of(
                                        BRIDGE + "SettingsBridge;",
                                        BRIDGE + "ModelFactory;",
                                        BRIDGE + "RendererProvider;",
                                        BRIDGE + "Navigator;")),
                "Expected the exact four bridge types");
        int checked = 0;
        for (var c : owned) {
            for (var iface : c.getInterfaces()) {
                require(classes.containsKey(iface), "Missing interface " + iface);
                for (var m : classes.get(iface).getMethods()) {
                    if ((m.getAccessFlags() & AccessFlags.ABSTRACT.getValue()) != 0) {
                        require(implemented(c, m), "Unimplemented " + m);
                    }
                }
            }
            for (var m : c.getMethods()) {
                var impl = m.getImplementation();
                require(impl != null, "Missing bridge body " + m);
                for (var i : impl.getInstructions()) {
                    if (i instanceof OneRegisterInstruction r) {
                        require(
                                r.getRegisterA() < impl.getRegisterCount(),
                                "Register A out of bounds " + m);
                    }
                    if (i instanceof TwoRegisterInstruction r) {
                        require(
                                r.getRegisterB() < impl.getRegisterCount(),
                                "Register B out of bounds " + m);
                    }
                    if (i instanceof RegisterRangeInstruction r) {
                        require(
                                r.getStartRegister() + r.getRegisterCount()
                                        <= impl.getRegisterCount(),
                                "Range out of bounds " + m);
                    }
                    if (i instanceof FiveRegisterInstruction r) {
                        int[] regs = {
                            r.getRegisterC(),
                            r.getRegisterD(),
                            r.getRegisterE(),
                            r.getRegisterF(),
                            r.getRegisterG()
                        };
                        for (int n = 0; n < r.getRegisterCount(); n++) {
                            require(
                                    regs[n] < impl.getRegisterCount(),
                                    "Invoke register out of bounds " + m);
                        }
                    }
                    if (!(i instanceof ReferenceInstruction ri)) {
                        continue;
                    }
                    var ref = ri.getReference();
                    if (ref instanceof MethodReference mr) {
                        int words =
                                mr.getParameterTypes().stream()
                                                .mapToInt(
                                                        p -> p.equals("J") || p.equals("D") ? 2 : 1)
                                                .sum()
                                        + (i.getOpcode().name().startsWith("INVOKE_STATIC")
                                                ? 0
                                                : 1);
                        if (i instanceof VariableRegisterInstruction r) {
                            require(r.getRegisterCount() == words, "Invocation arity " + mr);
                        }
                        if (!mr.getDefiningClass().startsWith("Lp/")
                                && !mr.getDefiningClass().startsWith("Lkotlin/")
                                && !mr.getDefiningClass().startsWith(PREFIX)) {
                            continue;
                        }
                        var target = method(mr);
                        require(
                                (target.getAccessFlags() & AccessFlags.PUBLIC.getValue()) != 0
                                        || mr.getDefiningClass().equals(c.getType()),
                                "Nonpublic method " + mr);
                        boolean isStatic =
                                (target.getAccessFlags() & AccessFlags.STATIC.getValue()) != 0;
                        require(
                                isStatic == i.getOpcode().name().startsWith("INVOKE_STATIC"),
                                "Static invoke mismatch " + mr);
                        checked++;
                    } else if (ref instanceof FieldReference fr) {
                        if (!fr.getDefiningClass().startsWith("Lp/")
                                && !fr.getDefiningClass().startsWith(PREFIX)) {
                            continue;
                        }
                        var target = field(fr);
                        require(
                                (target.getAccessFlags() & AccessFlags.PUBLIC.getValue()) != 0
                                        || fr.getDefiningClass().equals(c.getType()),
                                "Nonpublic field " + fr);
                        boolean isStatic =
                                (target.getAccessFlags() & AccessFlags.STATIC.getValue()) != 0;
                        require(
                                isStatic
                                        == (i.getOpcode().name().startsWith("SGET")
                                                || i.getOpcode().name().startsWith("SPUT")),
                                "Static field mismatch " + fr);
                        checked++;
                    } else if (ref instanceof TypeReference tr
                            && (tr.getType().startsWith("Lp/")
                                    || tr.getType().startsWith(PREFIX))) {
                        require(classes.containsKey(tr.getType()), "Missing type " + tr);
                    }
                }
            }
        }
        var navigator =
                owned.stream()
                        .filter(c -> c.getType().endsWith("/Navigator;"))
                        .findFirst()
                        .orElseThrow();
        var actual = new TreeSet<String>();
        for (var m : navigator.getVirtualMethods()) {
            actual.add(signature(m));
        }
        var expected = new TreeSet<String>();
        for (var m : classes.get("Lp/tyh0;").getMethods()) {
            expected.add(signature(m));
        }
        require(actual.equals(expected), "Navigator methods differ from native interface");
        require(checked > 0, "No bridge references checked");
        require(expectedBridge.keySet().equals(
                        owned.stream().map(ClassDef::getType).collect(Collectors.toSet())),
                "Canonical bundle must contain the same four bridge classes");
        for (var definition : owned) {
            require(Arrays.equals(expectedBridge.get(definition.getType()), canonical(definition)),
                    "Bridge implementation differs from bundle: " + definition.getType());
        }
    }
}
