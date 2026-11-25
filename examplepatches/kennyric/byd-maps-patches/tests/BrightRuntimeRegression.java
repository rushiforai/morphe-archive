import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.net.URLClassLoader;
import java.util.*;

import app.morphe.patcher.*;
import app.morphe.patcher.dex.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.PatchClasses;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.reandroid.apk.ApkModule;

/** Exercise emitted production code against the original publisher DEX, without running the app. */
class BrightRuntimeRegression {
    static final String PLUGIN = "LI5/a0;";
    static final String POLICY = "Lpatches/bright/BrightPolicy;->";
    static final List<String> CONTROLS = List.of("articles", "ads", "tracking", "consent");
    static java.lang.reflect.Method select;
    static int checks, sequences;
    static PackageMetadata metadata;
    static final Map<String, String> originalMetadata = new TreeMap<>();

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks++;
    }

    static List<Instruction> instructions(com.android.tools.smali.dexlib2.iface.Method method) {
        List<Instruction> result = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }

    // Read operand getters from instruction interfaces, excluding implementation-specific DEX buffers.
    // This compares actual emitted register, literal, reference and branch operands across the
    // SDK's DexBacked and Builder instruction representations.
    static void getters(Class<?> type, Set<java.lang.reflect.Method> result) {
        if (type.isInterface() && type.getPackageName().startsWith("com.android.tools.smali.dexlib2.iface.instruction")) {
            for (var method : type.getMethods()) {
                if (method.getParameterCount() == 0 && method.getName().startsWith("get")) result.add(method);
            }
        }
        for (Class<?> parent : type.getInterfaces()) getters(parent, result);
        if (type.getSuperclass() != null) getters(type.getSuperclass(), result);
    }

    static String operands(Instruction instruction) throws Exception {
        Set<java.lang.reflect.Method> methods = new HashSet<>();
        getters(instruction.getClass(), methods);
        Map<String, String> values = new TreeMap<>();
        for (var method : methods) values.put(method.getName(), String.valueOf(method.invoke(instruction)));
        return values.toString();
    }

    static List<String> body(com.android.tools.smali.dexlib2.iface.Method method) throws Exception {
        List<String> result = new ArrayList<>();
        for (Instruction instruction : instructions(method)) result.add(operands(instruction));
        return result;
    }

    static String signature(com.android.tools.smali.dexlib2.iface.Method method) {
        return method.getName() + "(" + String.join("", method.getParameterTypes()) + ")" + method.getReturnType();
    }

    static com.android.tools.smali.dexlib2.iface.Method engine(ClassDef plugin) {
        for (var method : plugin.getMethods()) {
            if (signature(method).equals("b(Li2/n;)V")) return method;
        }
        throw new AssertionError("Original engine attach b(Li2/n;)V is absent");
    }

    static Map<String, List<String>> bodies(ClassDef plugin) throws Exception {
        Map<String, List<String>> result = new TreeMap<>();
        for (var method : plugin.getMethods()) result.put(signature(method), body(method));
        return result;
    }

    static PatcherConfig config(File original, File scratch, String name) {
        File workspace = new File(scratch, name);
        check(workspace.mkdirs(), "Create isolated SDK fixture workspace " + name);
        DexVerifier verifier = (DexVerifier) java.lang.reflect.Proxy.newProxyInstance(
                BrightRuntimeRegression.class.getClassLoader(), new Class[]{DexVerifier.class},
                (proxy, method, args) -> { throw new AssertionError("Unexpected app execution or DEX validation"); });
        return new PatcherConfig(original, workspace, Set.of(), BytecodeMode.NONE, verifier, workspace, null, false);
    }

    static BytecodePatchContext context(File original, File scratch, String name, ClassDef fixture) {
        var context = new BytecodePatchContext(config(original, scratch, name),
                metadata);
        context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(fixture)));
        context.setOpcodes$morphe_patcher(Opcodes.getDefault());
        return context;
    }

    static void select(BytecodePatchContext context, String field) throws Exception {
        select.invoke(null, context, field);
    }

    static void verifySelection(ClassDef plugin, Map<String, List<String>> original, List<String> order) throws Exception {
        var attach = engine(plugin);
        List<Instruction> emitted = instructions(attach);
        check(emitted.size() == original.get("b(Li2/n;)V").size() + 2 * order.size(),
                "Selected controls must prefix engine attach, order=" + order);
        check(attach.getAccessFlags() == 17 && attach.getImplementation().getRegisterCount() == 24,
                "Engine attach metadata preserved, order=" + order);
        for (int pair = 0; pair < order.size(); pair++) {
            Instruction load = emitted.get(2 * pair), store = emitted.get(2 * pair + 1);
            String field = order.get(order.size() - pair - 1);
            check(load.getOpcode() == Opcode.CONST_4 && ((OneRegisterInstruction) load).getRegisterA() == 0
                            && ((NarrowLiteralInstruction) load).getNarrowLiteral() == 1,
                    "Selection prefix loads true into v0: " + field);
            check(store.getOpcode() == Opcode.SPUT_BOOLEAN && ((OneRegisterInstruction) store).getRegisterA() == 0
                            && ((ReferenceInstruction) store).getReference().toString().equals(POLICY + field + ":Z"),
                    "Selection prefix stores intended policy field: " + field);
        }
        check(body(attach).subList(2 * order.size(), emitted.size()).equals(original.get("b(Li2/n;)V")),
                "Original engine body preserved exactly, order=" + order);
        for (var method : plugin.getMethods()) {
            if (!signature(method).equals("b(Li2/n;)V")) {
                check((method.getAccessFlags() + ":" + method.getImplementation().getRegisterCount())
                                .equals(originalMetadata.get(signature(method))),
                        "Non-engine metadata untouched: " + signature(method) + ", order=" + order);
                check(body(method).equals(original.get(signature(method))),
                        "Non-engine callback untouched: " + signature(method) + ", order=" + order);
            }
        }
    }

    static void combinations(File original, File scratch, ClassDef plugin, Map<String, List<String>> expected,
                             List<String> order) throws Exception {
        try (var context = context(original, scratch, "selection-" + sequences++, plugin)) {
            verifySelection(context.classDefBy(PLUGIN), expected, List.of());
            List<String> applied = new ArrayList<>();
            for (String control : order) {
                select(context, control);
                applied.add(control);
                verifySelection(context.classDefBy(PLUGIN), expected, applied);
            }
            // Encode the SDK mutation as a real DEX and read it back, so builder
            // objects alone cannot conceal an incorrect emitted method body.
            File emitted = new File(context.getFileWorkspace(), "selected.dex");
            DexFileFactory.writeDexFile(emitted.getPath(),
                    new ImmutableDexFile(Opcodes.getDefault(), Set.of(context.classDefBy(PLUGIN))));
            ClassDef decoded = DexFileFactory.loadDexFile(emitted, Opcodes.getDefault()).getClasses().iterator().next();
            verifySelection(decoded, expected, applied);
        }
        for (String next : CONTROLS) {
            if (!order.contains(next)) {
                List<String> longer = new ArrayList<>(order);
                longer.add(next);
                combinations(original, scratch, plugin, expected, longer);
            }
        }
    }

    static ClassDef replace(ClassDef plugin, java.util.function.Function<com.android.tools.smali.dexlib2.iface.Method,
                            com.android.tools.smali.dexlib2.iface.Method> transform) {
        List<com.android.tools.smali.dexlib2.iface.Method> methods = new ArrayList<>();
        for (var method : plugin.getMethods()) methods.add(signature(method).equals("b(Li2/n;)V") ? transform.apply(method) : method);
        return new ImmutableClassDef(plugin.getType(), plugin.getAccessFlags(), plugin.getSuperclass(),
                plugin.getInterfaces(), plugin.getSourceFile(), plugin.getAnnotations(), plugin.getFields(), methods);
    }

    static ImmutableMethod edited(com.android.tools.smali.dexlib2.iface.Method method, String name,
                                  List<? extends MethodParameter> parameters, int flags, int registers,
                                  List<? extends Instruction> code) {
        var implementation = new ImmutableMethodImplementation(registers, code,
                method.getImplementation().getTryBlocks(), method.getImplementation().getDebugItems());
        return new ImmutableMethod(method.getDefiningClass(), name, parameters, method.getReturnType(),
                flags, method.getAnnotations(), method.getHiddenApiRestrictions(), implementation);
    }

    static ClassDef prefix(ClassDef plugin, List<String> fields, int register, int value) {
        return replace(plugin, method -> {
            List<Instruction> code = new ArrayList<>();
            for (String field : fields) {
                code.add(new ImmutableInstruction11n(Opcode.CONST_4, register, value));
                code.add(new ImmutableInstruction21c(Opcode.SPUT_BOOLEAN, register,
                        new ImmutableFieldReference("Lpatches/bright/BrightPolicy;", field, "Z")));
            }
            code.addAll(instructions(method));
            return edited(method, "b", method.getParameters(), 17, 24, code);
        });
    }

    static void reject(File original, File scratch, String label, ClassDef fixture) throws Exception {
        try (var context = context(original, scratch, label, fixture)) {
            Map<String, List<String>> before = bodies(context.classDefBy(PLUGIN));
            boolean refused = false;
            try {
                select(context, "consent");
            } catch (InvocationTargetException error) {
                if (!(error.getCause() instanceof IllegalStateException)
                        && !(error.getCause() instanceof app.morphe.patcher.patch.PatchException)) throw error;
                refused = true;
            }
            check(refused, "Changed engine attach rejected: " + label);
            check(bodies(context.classDefBy(PLUGIN)).equals(before), "Rejected input remains untouched: " + label);
        }
    }

    public static void main(String[] args) throws Exception {
        File bundle = new File(args[0]), original = new File(args[1]), scratch = new File(args[2]);
        try (var loader = new URLClassLoader(new java.net.URL[]{bundle.toURI().toURL()},
                BrightRuntimeRegression.class.getClassLoader())) {
            select = loader.loadClass("patches.bright.RuntimePatchKt")
                    .getDeclaredMethod("selectControl", BytecodePatchContext.class, String.class);
            try (ApkModule apk = ApkModule.loadApkFile(original)) {
                var manifest = apk.getAndroidManifest();
                metadata = new PackageMetadata(manifest.getPackageName(), manifest.getVersionName(),
                        String.valueOf(manifest.getVersionCode()), apk.getApkSignatureBlock());
            }
            var dex = DexFileFactory.loadDexContainer(original, Opcodes.getDefault());
            ClassDef plugin = null;
            for (String entry : dex.getDexEntryNames()) {
                for (var candidate : dex.getEntry(entry).getDexFile().getClasses()) {
                    if (candidate.getType().equals(PLUGIN)) {
                        check(plugin == null, "Original contains one exact plugin class");
                        plugin = ImmutableClassDef.of(candidate);
                    }
                }
            }
            check(plugin != null, "Original plugin class found");
            var attach = engine(plugin);
            check(instructions(attach).size() == 298, "Original engine preimage has 298 instructions");
            check(attach.getAccessFlags() == 17 && attach.getImplementation().getRegisterCount() == 24,
                    "Original engine flags and register count match audited APK");
            for (var method : plugin.getMethods()) originalMetadata.put(signature(method),
                    method.getAccessFlags() + ":" + method.getImplementation().getRegisterCount());
            combinations(original, scratch, plugin, bodies(plugin), List.of());
            check(sequences == 65, "Every ordering of all 16 selection subsets tested");
            System.out.println("PASS all 65 ordered selection subsets preserve original engine and Activity callbacks");
            reject(original, scratch, "moved-method", replace(plugin, method -> edited(method, "movedEngineAttach",
                    method.getParameters(), 17, 24, instructions(method))));
            reject(original, scratch, "moved-parameter", replace(plugin, method -> edited(method, "b",
                    List.of(new ImmutableMethodParameter("Ln/m0;", Set.of(), null)), 17, 24, instructions(method))));
            reject(original, scratch, "changed-flags", replace(plugin, method -> edited(method, "b", method.getParameters(),
                    1, 24, instructions(method))));
            reject(original, scratch, "changed-registers", replace(plugin, method -> edited(method, "b", method.getParameters(),
                    17, 25, instructions(method))));
            reject(original, scratch, "changed-count", replace(plugin, method -> {
                var code = instructions(method);
                code.add(new ImmutableInstruction10x(Opcode.NOP));
                return edited(method, "b", method.getParameters(), 17, 24, code);
            }));
            reject(original, scratch, "changed-first-instruction", replace(plugin, method -> {
                var code = instructions(method);
                code.set(0, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 21));
                return edited(method, "b", method.getParameters(), 17, 24, code);
            }));
            reject(original, scratch, "changed-middle-literal", replace(plugin, method -> {
                var code = instructions(method);
                code.set(153, new ImmutableInstruction21s(Opcode.CONST_16, 3, 9));
                return edited(method, "b", method.getParameters(), 17, 24, code);
            }));
            reject(original, scratch, "changed-final-instruction", replace(plugin, method -> {
                var code = instructions(method);
                code.set(code.size() - 1, new ImmutableInstruction10x(Opcode.NOP));
                return edited(method, "b", method.getParameters(), 17, 24, code);
            }));
            reject(original, scratch, "unknown-prefix-field", prefix(plugin, List.of("unknown"), 0, 1));
            reject(original, scratch, "duplicate-prefix-field", prefix(plugin, List.of("ads", "ads"), 0, 1));
            reject(original, scratch, "wrong-prefix-register", prefix(plugin, List.of("ads"), 1, 1));
            reject(original, scratch, "false-prefix-value", prefix(plugin, List.of("ads"), 0, 0));
            System.out.println("SUCCESS Bright emitted-runtime regression assertions=" + checks);
        }
    }
}
