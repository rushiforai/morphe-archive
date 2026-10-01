import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.UnaryOperator;

class VerifySettingsDexTest {
    static final String P = VerifySettingsDex.PREFIX, B = VerifySettingsDex.BRIDGE;
    static Map<String, ClassDef> original;
    static int cases;

    static void activity(UnaryOperator<Method> mutation, String superclass) {
        var cls = VerifySettingsDex.classes.get(P + "SpicetifySettingsActivity;");
        var methods = new ArrayList<Method>();
        for (var m : cls.getMethods()) {
            var changed = mutation.apply(m);
            if (changed != null) methods.add(changed);
        }
        VerifySettingsDex.classes.put(cls.getType(), new ImmutableClassDef(
                cls.getType(), cls.getAccessFlags(), superclass, cls.getInterfaces(),
                cls.getSourceFile(), cls.getAnnotations(), cls.getFields(), methods));
    }

    static void mutate(String owner, String methodName, Consumer<List<Instruction>> mutation) {
        var cls = VerifySettingsDex.classes.get(owner);
        var methods = new ArrayList<Method>();
        boolean changed = false;
        for (var m : cls.getMethods()) {
            if (m.getName().equals(methodName)
                    && (!methodName.equals("<init>")
                            || m.getParameterTypes().equals(List.of("I", "Lp/ct71;", "I")))) {
                var code = VerifySettingsDex.code(m);
                mutation.accept(code);
                var impl = m.getImplementation();
                methods.add(
                        new ImmutableMethod(
                                m.getDefiningClass(),
                                m.getName(),
                                m.getParameters(),
                                m.getReturnType(),
                                m.getAccessFlags(),
                                m.getAnnotations(),
                                m.getHiddenApiRestrictions(),
                                new ImmutableMethodImplementation(
                                        impl.getRegisterCount(),
                                        code,
                                        impl.getTryBlocks(),
                                        impl.getDebugItems())));
                changed = true;
            } else {
                methods.add(m);
            }
        }
        if (!changed) {
            throw new AssertionError("No fixture method mutated");
        }
        VerifySettingsDex.classes.put(
                owner,
                new ImmutableClassDef(
                        cls.getType(),
                        cls.getAccessFlags(),
                        cls.getSuperclass(),
                        cls.getInterfaces(),
                        cls.getSourceFile(),
                        cls.getAnnotations(),
                        cls.getFields(),
                        methods));
    }

    static int append(List<Instruction> c) {
        for (int n = 0; n < c.size(); n++) {
            if (VerifySettingsDex.call(c.get(n), B + "SettingsBridge;", "append")) {
                return n;
            }
        }
        throw new AssertionError();
    }

    static int label(List<Instruction> c) {
        for (int n = 0; n < c.size(); n++) {
            if (VerifySettingsDex.ref(c.get(n)).equals("spicetify_settings")) {
                return n;
            }
        }
        throw new AssertionError();
    }

    static void reject(String name, Runnable mutation) {
        VerifySettingsDex.classes = new HashMap<>(original);
        mutation.run();
        try {
            VerifySettingsDex.verify(true, true);
        } catch (AssertionError expected) {
            cases++;
            System.out.println("Rejected " + name + ": " + expected.getMessage());
            return;
        }
        throw new AssertionError("Accepted invalid fixture: " + name);
    }

    public static void main(String[] args) throws Exception {
        VerifySettingsDex.classes = new HashMap<>();
        VerifySettingsDex.load(args[0]);
        try (var input = VerifySettingsDexTest.class.getResourceAsStream("/extensions/settings.dex")) {
            if (input == null) throw new AssertionError("Build the canonical bridge first");
            VerifySettingsDex.loadBridge(input.readAllBytes());
        }
        original = Map.copyOf(VerifySettingsDex.classes);
        VerifySettingsDex.verify(true, true);
        reject("empty menu insertion", () -> mutate(B + "SettingsBridge;", "append", c -> {
            c.clear();
            c.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        }));
        reject("empty settings navigation", () -> mutate(B + "Navigator;", "b", c -> {
            c.clear();
            c.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        }));
        reject("missing settings Activity",
                () -> VerifySettingsDex.classes.remove(P + "SpicetifySettingsActivity;"));
        reject("settings class is not an Activity",
                () -> activity(m -> m, "Ljava/lang/Object;"));
        for (var name : List.of("<init>", "open", "onCreate")) {
            reject("missing Activity " + name,
                    () -> activity(m -> m.getName().equals(name) ? null : m,
                            "Landroid/app/Activity;"));
        }
        String app = "Lcom/spotify/music/SpotifyApplication;";
        reject("missing startup", () -> mutate(app, "onCreate", c -> c.removeFirst()));
        reject("duplicate startup", () -> mutate(app, "onCreate", c -> c.addFirst(c.getFirst())));
        reject(
                "wrong startup receiver",
                () ->
                        mutate(
                                app,
                                "onCreate",
                                c ->
                                        c.set(
                                                0,
                                                new ImmutableInstruction3rc(
                                                        Opcode.INVOKE_STATIC_RANGE,
                                                        0,
                                                        1,
                                                        (MethodReference)
                                                                ((ReferenceInstruction)
                                                                                c.getFirst())
                                                                        .getReference()))));
        reject("missing append", () -> mutate("Lp/xlt;", "create", c -> c.remove(append(c))));
        reject(
                "duplicate append",
                () ->
                        mutate(
                                "Lp/xlt;",
                                "create",
                                c -> {
                                    int n = append(c);
                                    c.add(n, c.get(n));
                                }));
        reject(
                "wrong append receiver",
                () ->
                        mutate(
                                "Lp/xlt;",
                                "create",
                                c -> {
                                    int n = append(c);
                                    c.set(
                                            n,
                                            new ImmutableInstruction35c(
                                                    Opcode.INVOKE_STATIC,
                                                    2,
                                                    6,
                                                    3,
                                                    0,
                                                    0,
                                                    0,
                                                    (MethodReference)
                                                            ((ReferenceInstruction) c.get(n))
                                                                    .getReference()));
                                }));
        reject(
                "misplaced append",
                () ->
                        mutate(
                                "Lp/xlt;",
                                "create",
                                c -> {
                                    int n = append(c);
                                    c.add(n + 1, new ImmutableInstruction10x(Opcode.NOP));
                                }));
        reject(
                "capability mismatch",
                () ->
                        mutate(
                                P + "InstalledPatches;",
                                "themeColors",
                                c -> c.set(0, new ImmutableInstruction11n(Opcode.CONST_4, 0, 0))));
        reject(
                "wrong reserved analytics value",
                () ->
                        mutate(
                                "Lp/c3g0;",
                                "<init>",
                                c ->
                                        c.set(
                                                label(c) - 2,
                                                new ImmutableInstruction11n(
                                                        Opcode.CONST_4, 7, 0))));
        reject(
                "inverted analytics branch",
                () ->
                        mutate(
                                "Lp/c3g0;",
                                "<init>",
                                c -> {
                                    int n = label(c) - 1;
                                    c.set(
                                            n,
                                            new ImmutableInstruction22t(
                                                    Opcode.IF_EQ,
                                                    5,
                                                    7,
                                                    ((OffsetInstruction) c.get(n))
                                                            .getCodeOffset()));
                                }));
        reject(
                "wrong analytics sink",
                () ->
                        mutate(
                                "Lp/c3g0;",
                                "<init>",
                                c -> {
                                    int n = label(c) + 1;
                                    c.set(n, new ImmutableInstruction20t(Opcode.GOTO_16, 2));
                                }));
        reject(
                "missing bridge class",
                () -> VerifySettingsDex.classes.remove(B + "RendererProvider;"));
        reject("missing native target", () -> VerifySettingsDex.classes.remove("Lp/xh0;"));
        reject(
                "missing navigator method",
                () -> {
                    var cls = VerifySettingsDex.classes.get(B + "Navigator;");
                    var methods = new ArrayList<Method>();
                    for (var m : cls.getMethods()) {
                        if (!m.getName().equals("b")) {
                            methods.add(m);
                        }
                    }
                    VerifySettingsDex.classes.put(
                            cls.getType(),
                            new ImmutableClassDef(
                                    cls.getType(),
                                    cls.getAccessFlags(),
                                    cls.getSuperclass(),
                                    cls.getInterfaces(),
                                    cls.getSourceFile(),
                                    cls.getAnnotations(),
                                    cls.getFields(),
                                    methods));
                });
        reject(
                "wrong bridge invoke arity",
                () ->
                        mutate(
                                B + "SettingsBridge;",
                                "append",
                                c -> {
                                    for (int n = 0; n < c.size(); n++) {
                                        if (c.get(n) instanceof FiveRegisterInstruction r
                                                && c.get(n) instanceof ReferenceInstruction ref
                                                && ref.getReference() instanceof MethodReference mr
                                                && c.get(n).getOpcode().name().startsWith("INVOKE")
                                                && r.getRegisterCount() > 0) {
                                            c.set(
                                                    n,
                                                    new ImmutableInstruction35c(
                                                            c.get(n).getOpcode(),
                                                            r.getRegisterCount() - 1,
                                                            r.getRegisterC(),
                                                            r.getRegisterD(),
                                                            r.getRegisterE(),
                                                            r.getRegisterF(),
                                                            r.getRegisterG(),
                                                            mr));
                                            return;
                                        }
                                    }
                                    throw new AssertionError("No invoke fixture");
                                }));
        System.out.println("Settings verifier negative cases passed: " + cases);
    }
}
