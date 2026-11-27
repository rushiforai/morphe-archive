import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import app.morphe.patcher.patch.PatchException;
import local.wazemaps.DriverIconsPatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Exercise production mood discovery against real DEX and deliberately invalid bindings. */
public class ValidateMoodBinding {
    static final List<ClassDef> classes = new ArrayList<>();
    static void read(byte[] bytes) throws Exception {
        try (var zip = new ZipInputStream(new ByteArrayInputStream(bytes))) {
            ZipEntry entry;
            while ((entry = zip.getNextEntry()) != null) {
                if (entry.getName().equals("base.apk")) read(zip.readAllBytes());
                else if (entry.getName().matches("classes[0-9]*\\.dex"))
                    classes.addAll(DexBackedDexFile.fromInputStream(Opcodes.getDefault(),
                        new BufferedInputStream(new ByteArrayInputStream(zip.readAllBytes()))).getClasses());
            }
        }
    }
    static List<Instruction> code(Method method) {
        var result = new ArrayList<Instruction>();
        if (method.getImplementation() != null) method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static Method copy(Method method, String name, List<Instruction> code) {
        var implementation = method.getImplementation();
        return new ImmutableMethod(method.getDefiningClass(), name, method.getParameters(), method.getReturnType(),
            method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(),
            new ImmutableMethodImplementation(implementation.getRegisterCount(), code, implementation.getTryBlocks(), implementation.getDebugItems()));
    }
    static void rejected(Method eligibility, List<Method> methods, String label) {
        try { DriverIconsPatchKt.babyMoodGate(eligibility, methods); }
        catch (Exception expected) {
            if (!(expected instanceof PatchException)) throw new AssertionError("Unexpected failure for " + label, expected);
            System.out.println("PASS rejected " + label); return;
        }
        throw new AssertionError("Accepted " + label);
    }
    static void returned(Method method, int value) {
        var code = code(method);
        if (code.size() < 2 || !(code.get(0) instanceof NarrowLiteralInstruction literal) || literal.getNarrowLiteral() != value ||
            !(code.get(0) instanceof OneRegisterInstruction register) || register.getRegisterA() != 0 ||
            code.get(1).getOpcode() != Opcode.RETURN || ((OneRegisterInstruction) code.get(1)).getRegisterA() != 0)
            throw new AssertionError("Expected patched return " + value + " in " + method);
    }
    static void catalogueRejected(Runnable action, String label) {
        try { action.run(); }
        catch (Exception expected) {
            if (!(expected instanceof PatchException)) throw new AssertionError("Unexpected failure for " + label, expected);
            System.out.println("PASS rejected catalogue " + label); return;
        }
        throw new AssertionError("Accepted catalogue " + label);
    }
    static ClassDef withMethods(ClassDef type, List<Method> methods) {
        return new ImmutableClassDef(type.getType(), type.getAccessFlags(), type.getSuperclass(), type.getInterfaces(),
            type.getSourceFile(), type.getAnnotations(), type.getFields(), methods);
    }
    static List<Integer> arguments(Instruction instruction) {
        if (instruction instanceof FiveRegisterInstruction call)
            return List.of(call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG())
                .subList(0, call.getRegisterCount());
        if (instruction instanceof RegisterRangeInstruction call)
            return java.util.stream.IntStream.range(call.getStartRegister(), call.getStartRegister() + call.getRegisterCount()).boxed().toList();
        return List.of();
    }
    static void bridgeBehavior(Method bridge, Method nativeMethod) {
        // Execute the tiny bridge with both sort values. First-argument writes must
        // not affect sorting, even if the caller passed the same register twice.
        for (int include : List.of(0, 1)) for (int sort : List.of(0, 1)) {
            Object receiver = new Object(), nativeResult = new Object(), result = null;
            Object[] registers = {receiver, include, sort};
            int calls = 0;
            for (var instruction : code(bridge)) {
                switch (instruction.getOpcode()) {
                    case CONST_4 -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                    case INVOKE_DIRECT, INVOKE_VIRTUAL -> {
                        var args = arguments(instruction);
                        if (!((ReferenceInstruction) instruction).getReference().equals(nativeMethod) ||
                            registers[args.get(0)] != receiver || !registers[args.get(1)].equals(1) || !registers[args.get(2)].equals(sort))
                            throw new AssertionError("Bridge changed native target, receiver or sorting");
                        calls++; result = nativeResult;
                    }
                    case MOVE_RESULT_OBJECT -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = result;
                    case RETURN_OBJECT -> {
                        if (registers[((OneRegisterInstruction) instruction).getRegisterA()] != nativeResult || calls != 1)
                            throw new AssertionError("Bridge changed result");
                    }
                    default -> throw new AssertionError("Unexpected bridge instruction " + instruction.getOpcode());
                }
            }
        }
    }
    static void catalogue(ClassDef manager, boolean patched) {
        var loader = DriverIconsPatchKt.moodCatalogueLoader(manager, classes);
        var calls = DriverIconsPatchKt.moodCatalogueCalls(manager, loader);
        if (patched) {
            for (var call : calls) {
                var instruction = code(loader).get(call.getFirst());
                if (instruction.getOpcode() != Opcode.INVOKE_STATIC && instruction.getOpcode() != Opcode.INVOKE_STATIC_RANGE)
                    throw new AssertionError("Catalogue call was not patched");
                Method bridge = null;
                for (var method : manager.getMethods()) if (method.equals(((ReferenceInstruction) instruction).getReference())) bridge = method;
                if (bridge == null) throw new AssertionError("Missing catalogue bridge");
                bridgeBehavior(bridge, call.getSecond());
            }
            System.out.println("PASS patched catalogue, native results and unchanged sorting: " + loader);
            return;
        }
        System.out.println("PASS real catalogue loader " + loader);
        var mutableManager = new MutableClass(manager);
        var refresh = new MutableMethod(loader);
        DriverIconsPatchKt.patchMoodCatalogue(mutableManager, refresh);
        var original = code(loader);
        var modified = code(refresh);
        if (original.size() != modified.size() || loader.getImplementation().getRegisterCount() != refresh.getImplementation().getRegisterCount())
            throw new AssertionError("Catalogue patch changed caller layout");
        var indices = new HashSet<Integer>();
        for (var call : calls) {
            int index = call.getFirst(); indices.add(index);
            if (!arguments(original.get(index)).equals(arguments(modified.get(index))))
                throw new AssertionError("Catalogue patch changed caller arguments");
            var ref = ((ReferenceInstruction) modified.get(index)).getReference();
            var bridge = mutableManager.getMethods().stream().filter(m -> m.equals(ref)).findFirst().orElseThrow();
            bridgeBehavior(bridge, call.getSecond());
        }
        // Serialize both bodies because dexlib instructions use identity equality.
        var restored = new ArrayList<Instruction>(modified);
        for (int index : indices) restored.set(index, original.get(index));
        if (!Arrays.equals(dexBytes(copy(loader, loader.getName(), original)), dexBytes(copy(loader, loader.getName(), restored))))
            throw new AssertionError("Catalogue patch changed non-call instructions");
        int count = mutableManager.getMethods().size();
        DriverIconsPatchKt.patchMoodCatalogue(mutableManager, refresh);
        if (count != mutableManager.getMethods().size()) throw new AssertionError("Repeated patch added bridges");
        DriverIconsPatchKt.moodCatalogueCalls(mutableManager, refresh);
        var missing = new ArrayList<Instruction>(original);
        missing.set(calls.get(0).getFirst(), new ImmutableInstruction10x(Opcode.NOP));
        catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueCalls(manager, copy(loader, loader.getName(), missing)), "missing native call");
        var duplicate = new ArrayList<Instruction>(original);
        duplicate.set(calls.get(1).getFirst(), original.get(calls.get(0).getFirst()));
        catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueCalls(manager, copy(loader, loader.getName(), duplicate)), "duplicate catalogue kind");
        var noResult = new ArrayList<Instruction>(original);
        noResult.set(calls.get(0).getFirst() + 1, new ImmutableInstruction10x(Opcode.NOP));
        catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueCalls(manager, copy(loader, loader.getName(), noResult)), "missing object result");
        var owner = classes.stream().filter(c -> c.getType().equals(loader.getDefiningClass())).findFirst().orElseThrow();
        var ownerMethods = new ArrayList<Method>(); owner.getMethods().forEach(ownerMethods::add);
        ownerMethods.add(copy(loader, "ambiguousCatalogue", original));
        var ambiguousOwner = withMethods(owner, ownerMethods);
        var ambiguousClasses = new ArrayList<>(classes); ambiguousClasses.remove(owner); ambiguousClasses.add(ambiguousOwner);
        catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueLoader(manager.getType().equals(owner.getType()) ? ambiguousOwner : manager, ambiguousClasses), "ambiguous loader");
        var foreignManager = new ImmutableClassDef(manager.getType(), manager.getAccessFlags(), "Ljava/lang/Object;", List.of(), null, Set.of(), manager.getFields(), List.of());
        catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueLoader(foreignManager, classes), "loader outside manager hierarchy");
        for (var call : calls) {
            var nativeMethod = call.getSecond();
            for (int flags : List.of(nativeMethod.getAccessFlags() | AccessFlags.STATIC.getValue(), nativeMethod.getAccessFlags() & ~AccessFlags.NATIVE.getValue())) {
                var methods = new ArrayList<Method>(); manager.getMethods().forEach(methods::add); methods.remove(nativeMethod);
                methods.add(new ImmutableMethod(nativeMethod.getDefiningClass(), nativeMethod.getName(), nativeMethod.getParameters(), nativeMethod.getReturnType(), flags,
                    nativeMethod.getAnnotations(), nativeMethod.getHiddenApiRestrictions(), null));
                catalogueRejected(() -> DriverIconsPatchKt.moodCatalogueCalls(withMethods(manager, methods), loader), "static/non-native declaration");
            }
        }
        var collisionManager = new MutableClass(manager);
        var bridge = DriverIconsPatchKt.moodCatalogueBridge(calls.get(0).getSecond());
        var badBridge = new ArrayList<Instruction>(code(bridge)); badBridge.set(0, new ImmutableInstruction11n(Opcode.CONST_4, 2, 1));
        collisionManager.getMethods().add(new MutableMethod(copy(bridge, bridge.getName(), badBridge)));
        catalogueRejected(() -> DriverIconsPatchKt.patchMoodCatalogue(collisionManager, new MutableMethod(loader)), "conflicting bridge");
        // Range encoding uses the same bridge and preserves all three registers.
        var ranged = new ArrayList<Instruction>(original);
        for (var call : calls) ranged.set(call.getFirst(), new ImmutableInstruction3rc(
            AccessFlags.PRIVATE.isSet(call.getSecond().getAccessFlags()) ? Opcode.INVOKE_DIRECT_RANGE : Opcode.INVOKE_VIRTUAL_RANGE,
            0, 3, call.getSecond()));
        var rangeLoader = new MutableMethod(copy(loader, loader.getName(), ranged));
        DriverIconsPatchKt.patchMoodCatalogue(new MutableClass(manager), rangeLoader);
        for (var call : calls) if (code(rangeLoader).get(call.getFirst()).getOpcode() != Opcode.INVOKE_STATIC_RANGE ||
            !arguments(code(rangeLoader).get(call.getFirst())).equals(List.of(0, 1, 2))) throw new AssertionError("Range arguments changed");
        System.out.println("PASS catalogue bridges, aliased sorting, range calls and repeat application");
    }
    static byte[] dexBytes(Method method) {
        var type = new ImmutableClassDef(method.getDefiningClass(), AccessFlags.PUBLIC.getValue(), "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
        var dex = new ImmutableDexFile(Opcodes.getDefault(), List.of(type));
        var store = new com.android.tools.smali.dexlib2.writer.io.MemoryDataStore();
        try { com.android.tools.smali.dexlib2.writer.pool.DexPool.writeTo(store, dex); }
        catch (IOException e) { throw new UncheckedIOException(e); }
        return store.getData();
    }
    public static void main(String[] args) throws Exception {
        read(java.nio.file.Files.readAllBytes(java.nio.file.Path.of(args[0])));
        var candidates = new ArrayList<Method>();
        for (var type : classes) for (var method : type.getMethods()) {
            var strings = new HashSet<String>();
            for (var instruction : code(method)) if (instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof StringReference string)
                strings.add(string.getString());
            if (method.getReturnType().equals("Z") && method.getParameterTypes().toString().equals("[Landroid/content/Context;, Ljava/lang/String;]") &&
                strings.containsAll(List.of("wazer_dino", "wazer_8bit", "wazer_robot"))) candidates.add(method);
        }
        if (candidates.size() != 1) throw new AssertionError("Eligibility candidates: " + candidates.size());
        var eligibility = candidates.get(0);
        var manager = classes.stream().filter(type -> type.getType().equals(eligibility.getDefiningClass())).findFirst().orElseThrow();
        catalogue(manager, args.length > 1 && args[1].equals("--patched"));
        var methods = new ArrayList<Method>();
        for (var type : classes) if (type.getType().equals(eligibility.getDefiningClass())) type.getMethods().forEach(methods::add);
        var gate = DriverIconsPatchKt.babyMoodGate(eligibility, methods);
        var getter = methods.stream().filter(method -> method.equals(gate)).findFirst().orElseThrow();
        System.out.println("PASS real eligibility " + eligibility + " binds " + gate);
        if (args.length > 1 && args[1].equals("--patched")) {
            returned(eligibility, 1);
            returned(getter, 0);
            System.out.println("PASS patched mood eligibility and baby gate");
            return;
        }
        var code = code(eligibility);
        if (code.get(0).getOpcode() == Opcode.IGET_BOOLEAN) {
            var ambiguous = new ArrayList<>(methods);
            ambiguous.add(copy(getter, "ambiguousBabyGetter", code(getter)));
            rejected(eligibility, ambiguous, "duplicate field accessor");
            var missing = new ArrayList<>(methods);
            missing.remove(getter);
            rejected(eligibility, missing, "missing field accessor");
            var invalid = new ArrayList<>(code);
            var branch = (OffsetInstruction) code.get(1);
            invalid.set(1, new ImmutableInstruction21t(Opcode.IF_NEZ, ((OneRegisterInstruction) code.get(1)).getRegisterA(), branch.getCodeOffset()));
            rejected(copy(eligibility, eligibility.getName(), invalid), methods, "inverted eligibility branch");
            invalid = new ArrayList<>(code);
            var load = (TwoRegisterInstruction) code.get(0);
            invalid.set(0, new ImmutableInstruction22c(Opcode.IGET_BOOLEAN, load.getRegisterA(), load.getRegisterB(),
                new ImmutableFieldReference(eligibility.getDefiningClass(), "unrelatedFlag", "Z")));
            rejected(copy(eligibility, eligibility.getName(), invalid), methods, "unrelated eligibility field");
            invalid = new ArrayList<>(code);
            var call = (FiveRegisterInstruction) code.get(7);
            invalid.set(7, new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, call.getRegisterCount(), call.getRegisterC(), call.getRegisterD(),
                call.getRegisterE(), call.getRegisterF(), call.getRegisterG(), new ImmutableMethodReference("Ljava/lang/String;", "startsWith", List.of("Ljava/lang/String;"), "Z")));
            rejected(copy(eligibility, eligibility.getName(), invalid), methods, "different eligibility predicate");
            invalid = new ArrayList<>(code);
            invalid.set(7, new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, call.getRegisterCount(), call.getRegisterD(), call.getRegisterC(),
                call.getRegisterE(), call.getRegisterF(), call.getRegisterG(), ((ReferenceInstruction) code.get(7)).getReference()));
            rejected(copy(eligibility, eligibility.getName(), invalid), methods, "different predicate arguments");
            invalid = new ArrayList<>(code);
            int returnIndex = invalid.size() - 1;
            if (invalid.get(returnIndex).getOpcode() != Opcode.RETURN) throw new AssertionError("Expected final return fixture");
            int differentRegister = ((OneRegisterInstruction) invalid.get(returnIndex)).getRegisterA() == 0 ? 1 : 0;
            invalid.set(returnIndex, new ImmutableInstruction11x(Opcode.RETURN, differentRegister));
            rejected(copy(eligibility, eligibility.getName(), invalid), methods, "different returned predicate register");
            // Discovery remains stable after both early-return patches are present.
            var patched = new ArrayList<Instruction>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            patched.addAll(code);
            var patchedGetter = new ArrayList<Instruction>(List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            patchedGetter.addAll(code(getter));
            methods.remove(getter);
            methods.add(copy(getter, getter.getName(), patchedGetter));
            if (!DriverIconsPatchKt.babyMoodGate(copy(eligibility, eligibility.getName(), patched), methods).equals(gate))
                throw new AssertionError("Repeat application changed binding");
            System.out.println("PASS repeat inlined binding");
        } else {
            // Repeating the same getter call is not an ambiguous method identity.
            var calls = code.stream().filter(i -> i instanceof ReferenceInstruction ref && ref.getReference().equals(gate)).toList();
            if (calls.isEmpty()) throw new AssertionError("Direct baby call missing");
            var repeated = new ArrayList<>(code);
            repeated.add(calls.get(0));
            if (!DriverIconsPatchKt.babyMoodGate(copy(eligibility, eligibility.getName(), repeated), methods).equals(gate))
                throw new AssertionError("Repeated call changed binding");
            var ambiguous = new ArrayList<>(code);
            ambiguous.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(eligibility.getDefiningClass(), "ambiguousGate", List.of(), "Z")));
            rejected(copy(eligibility, eligibility.getName(), ambiguous), methods, "distinct direct gates");
            System.out.println("PASS repeated direct binding");
        }
    }
}
