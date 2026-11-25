package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

public final class VerifyMonet {
    public static List<ClassDef> read(String apk) throws Exception {
        List<ClassDef> classes = new ArrayList<>();
        try (ZipFile zip = new ZipFile(apk)) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes[0-9]*\\.dex"))
                classes.addAll(DexBackedDexFile.fromInputStream(null,
                    new BufferedInputStream(zip.getInputStream(entry))).getClasses());
        }
        return classes;
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    private static void reject(List<ClassDef> classes) {
        try { MonetPremiumPatch.findUnique(classes); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid layout accepted");
    }
    private static boolean evaluate(Method method, Map<String, Integer> fields) {
        var ins = MonetPremiumPatch.instructions(method);
        int[] regs = new int[method.getImplementation().getRegisterCount()];
        int[] address = new int[ins.size()];
        for (int n = 1; n < ins.size(); n++) address[n] = address[n-1] + ins.get(n-1).getCodeUnits();
        for (int pc = 0, steps = 0; steps < 30; steps++) {
            Instruction i = ins.get(pc);
            switch (i.getOpcode()) {
                case IGET_BOOLEAN: regs[((OneRegisterInstruction)i).getRegisterA()] = fields.get(
                    ((FieldReference)((ReferenceInstruction)i).getReference()).getName()); break;
                case CONST_4: regs[((OneRegisterInstruction)i).getRegisterA()] = ((NarrowLiteralInstruction)i).getNarrowLiteral(); break;
                case RETURN: return regs[((OneRegisterInstruction)i).getRegisterA()] != 0;
                case NOP: break;
                case IF_EQZ: case IF_NEZ: case GOTO: case GOTO_16: case GOTO_32: {
                    boolean jump = i instanceof OffsetInstruction && !(i instanceof OneRegisterInstruction) || (regs[((OneRegisterInstruction)i).getRegisterA()] == 0)
                        == (i.getOpcode() == Opcode.IF_EQZ);
                    if (jump) {
                        int target = address[pc] + ((OffsetInstruction)i).getCodeOffset();
                        pc = Arrays.binarySearch(address, target);
                        require(pc >= 0, "Invalid branch target");
                        continue;
                    }
                    break;
                }
                default: throw new AssertionError("Unexpected instruction");
            }
            pc++;
        }
        throw new AssertionError("Evaluator did not return");
    }
    /** Field names in first-load order; every reviewed native evaluator loads them as L, A, X, Y. */
    static List<String> fieldOrder(Method method) {
        List<String> names = new ArrayList<>();
        for (Instruction i : MonetPremiumPatch.instructions(method)) if (i.getOpcode() == Opcode.IGET_BOOLEAN) {
            String name = ((FieldReference)((ReferenceInstruction)i).getReference()).getName();
            if (!names.contains(name)) names.add(name);
        }
        require(names.size() == 4, "Expected four evaluator fields");
        return names;
    }
    public static void verifyBehavior(Method original, Method patched) {
        verifyBehavior(original, patched, fieldOrder(original));
    }
    /** roles = field names for L || (A && (X || !Y)). */
    public static void verifyBehavior(Method original, Method patched, List<String> roles) {
        var before = MonetPremiumPatch.instructions(original);
        var after = MonetPremiumPatch.instructions(patched);
        require(before.size() == after.size(), "Instruction count changed");
        require(original.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(), "Registers changed");
        for (int n = 0; n < before.size(); n++) {
            require(before.get(n).getOpcode() == after.get(n).getOpcode(), "Opcode changed");
            require(before.get(n).getCodeUnits() == after.get(n).getCodeUnits(), "Width changed");
        }
        for (int mask = 0; mask < 16; mask++) {
            Map<String,Integer> values = new HashMap<>();
            for (int n = 0; n < 4; n++) values.put(roles.get(n), mask >> n & 1);
            boolean expected = (mask & 1) != 0 || (mask & 2) != 0 && ((mask & 4) != 0 || (mask & 8) == 0);
            require(evaluate(original, values) == expected, "Original billing semantics differ");
            require(evaluate(patched, values), "Patched evaluator revoked premium for state " + mask);
        }
    }
    private static List<ClassDef> replace(List<ClassDef> classes, ClassDef owner, Method original, Method replacement) {
        var copy = new MutableClass(owner);
        copy.getMethods().removeIf(m -> m.equals(original));
        copy.getMethods().add(new MutableMethod(replacement));
        var result = new ArrayList<>(classes);
        result.set(classes.indexOf(owner), copy);
        return result;
    }
    private static Method variant(Method m, int flags, boolean relocate) {
        var body = new ArrayList<Instruction>();
        int[] remap = {1, 0, 2, 3};
        var original = MonetPremiumPatch.instructions(m);
        for (int n = 0; n < original.size(); n++) {
            Instruction i = original.get(n);
            if (!relocate) { body.add(i); continue; }
            if (n == 4) body.add(new ImmutableInstruction10x(Opcode.NOP));
            int reg = i instanceof OneRegisterInstruction ? remap[((OneRegisterInstruction) i).getRegisterA()] : -1;
            if (n < 4) body.add(new ImmutableInstruction22c(Opcode.IGET_BOOLEAN, reg, 4,
                ((ReferenceInstruction) i).getReference()));
            else if (i.getOpcode() == Opcode.CONST_4) body.add(new ImmutableInstruction11n(Opcode.CONST_4, reg,
                ((NarrowLiteralInstruction) i).getNarrowLiteral()));
            else if (i.getOpcode() == Opcode.RETURN) body.add(new ImmutableInstruction11x(Opcode.RETURN, reg));
            else if (n == 5) body.add(new ImmutableInstruction20t(Opcode.GOTO_16,
                ((OffsetInstruction) i).getCodeOffset() + 1));
            else if (i instanceof OneRegisterInstruction) body.add(new ImmutableInstruction21t(i.getOpcode(), reg,
                ((OffsetInstruction) i).getCodeOffset() + (n == 4 ? 1 : 0)));
            else body.add(i);
        }
        return new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
            flags, m.getAnnotations(), m.getHiddenApiRestrictions(),
            new ImmutableMethodImplementation(relocate ? 5 : 4, body, List.of(), List.of()));
    }
    private static Method withBody(Method m, int flags, int registers, List<Instruction> body) {
        return new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
            flags, m.getAnnotations(), m.getHiddenApiRestrictions(),
            new ImmutableMethodImplementation(registers, body, List.of(), List.of()));
    }
    /** Lazy loads (each field read just before its branch); shared = one return block fed by both constants. */
    private static Method lazy(Method m, boolean shared) {
        var loads = MonetPremiumPatch.instructions(m).subList(0, 4);
        var body = new ArrayList<Instruction>();
        java.util.function.IntFunction<Instruction> load = n -> new ImmutableInstruction22c(Opcode.IGET_BOOLEAN, n, 3,
            ((ReferenceInstruction) loads.get(n)).getReference());
        // L(@0) || (A(@4) && (X(@8) || !Y(@12))); true block @16, false block @18.
        body.add(load.apply(0)); body.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 14));
        body.add(load.apply(1)); body.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 1, 12));
        body.add(load.apply(2)); body.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 2, 6));
        body.add(load.apply(3)); body.add(new ImmutableInstruction21t(Opcode.IF_NEZ, 3, 4));
        if (shared) {
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1)); body.add(new ImmutableInstruction10t(Opcode.GOTO, 2));
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0)); body.add(new ImmutableInstruction11x(Opcode.RETURN, 0));
        } else {
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 3, 1)); body.add(new ImmutableInstruction11x(Opcode.RETURN, 3));
            body.add(new ImmutableInstruction11n(Opcode.CONST_4, 3, 0)); body.add(new ImmutableInstruction11x(Opcode.RETURN, 3));
        }
        return withBody(m, 1, 4, body);
    }
    private static void accept(List<ClassDef> classes, ClassDef owner, Method match, Method candidate, List<String> roles) {
        Method found = MonetPremiumPatch.findUnique(replace(classes, owner, match, candidate));
        var patched = new MutableMethod(found);
        MonetPremiumPatch.apply(patched);
        verifyBehavior(found, patched, roles);
    }
    private static Method refresh(ClassDef owner, Method hook) {
        for (Method m : owner.getMethods()) if (m.getReturnType().equals("V") && m.getParameterTypes().size() == 1
            && "Z".contentEquals(m.getParameterTypes().get(0)) && MonetPremiumPatch.calls(m, hook)) return m;
        throw new AssertionError("License refresh missing");
    }
    /** args: apk, output dex, reviewed hook, billing owner type, reviewed license field name. */
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = read(args[0]);
        Method match = MonetPremiumPatch.findUnique(classes);
        require(match.toString().equals(args[2]), "Unexpected hook " + match);
        require(match.getAccessFlags() == 1, "Reviewed public/non-final contract changed");
        var semantics = MonetPremiumPatch.semantics(match);
        require(semantics.license.equals(match.getDefiningClass() + "->" + args[4] + ":Z"), "License field differs: " + semantics.license);
        System.out.println("Unique original hook: " + match + "; license field " + semantics.license + "; false literals " + semantics.falseLiterals);
        reject(Collections.emptyList());
        ClassDef owner = classes.stream().filter(c -> c.getType().equals(match.getDefiningClass())).findFirst().orElseThrow();
        List<String> roles = fieldOrder(match);
        // Historical drift (final flag, relocated registers, wider goto, NOP) plus visibility drift.
        for (int flags : new int[]{1, 17, 2, 18}) for (boolean relocate : new boolean[]{false, true})
            accept(classes, owner, match, variant(match, flags, relocate), roles);
        // Reordered field loads: same semantics, different first-load order.
        var reordered = new ArrayList<>(MonetPremiumPatch.instructions(match));
        Collections.swap(reordered, 0, 1);
        accept(classes, owner, match, withBody(match, 1, 4, reordered), roles);
        accept(classes, owner, match, lazy(match, false), roles);
        accept(classes, owner, match, lazy(match, true), roles);
        reject(replace(classes, owner, match, variant(match, 9, false))); // Static is not harmless drift.
        var wrongBranch = new ArrayList<>(MonetPremiumPatch.instructions(match));
        wrongBranch.set(4, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3));
        reject(replace(classes, owner, match, withBody(match, 1, 4, wrongBranch)));
        // A returned field (not a constant) cannot be rewritten in place.
        var fieldReturn = new ArrayList<>(MonetPremiumPatch.instructions(match));
        int falseIndex = semantics.falseLiterals.get(0);
        fieldReturn.set(falseIndex + 1, new ImmutableInstruction11x(Opcode.RETURN, 1));
        reject(replace(classes, owner, match, withBody(match, 1, 4, fieldReturn)));
        var unanchored = new ArrayList<>(classes);
        unanchored.removeIf(c -> c.getType().equals(args[3]));
        reject(unanchored);
        var duplicate = new ArrayList<>(classes); duplicate.add(owner); reject(duplicate);
        var missingLifecycle = new MutableClass(owner);
        missingLifecycle.getMethods().removeIf(m -> m.getReturnType().equals("V") && m.getParameterTypes().size() == 1
            && "Z".contentEquals(m.getParameterTypes().get(0)));
        var noRefresh = new ArrayList<>(classes); noRefresh.set(classes.indexOf(owner), missingLifecycle); reject(noRefresh);
        // The license refresh must store the field that alone grants premium.
        var conflicting = new MutableClass(owner);
        Method refresh = refresh(owner, match);
        var mutableRefresh = conflicting.getMethods().stream().filter(m -> m.equals(refresh)).findFirst().orElseThrow();
        var refreshBody = MonetPremiumPatch.instructions(mutableRefresh);
        String other = match.getDefiningClass() + "->" + roles.get(1) + ":Z";
        boolean redirected = false;
        for (int n = 0; n < refreshBody.size() && !redirected; n++) {
            if (refreshBody.get(n).getOpcode() != Opcode.IPUT_BOOLEAN
                || !((ReferenceInstruction) refreshBody.get(n)).getReference().toString().equals(semantics.license)) continue;
            var put = (TwoRegisterInstruction) refreshBody.get(n);
            var field = ((ReferenceInstruction) MonetPremiumPatch.instructions(match).stream().filter(i -> i.getOpcode() == Opcode.IGET_BOOLEAN
                && ((ReferenceInstruction) i).getReference().toString().equals(other)).findFirst().orElseThrow()).getReference();
            mutableRefresh.getImplementation().replaceInstruction(n, new BuilderInstruction22c(Opcode.IPUT_BOOLEAN,
                put.getRegisterA(), put.getRegisterB(), field));
            redirected = true;
        }
        require(redirected, "License refresh store not found");
        var wrongRefresh = new ArrayList<>(classes); wrongRefresh.set(classes.indexOf(owner), conflicting); reject(wrongRefresh);
        var mutable = new MutableClass(owner);
        var target = mutable.getMethods().stream().filter(m -> m.equals(match)).findFirst().orElseThrow();
        // A changed true literal must reject before mutation.
        int trueIndex = -1;
        var original = MonetPremiumPatch.instructions(match);
        for (int n = 0; n < original.size(); n++) if (original.get(n).getOpcode() == Opcode.CONST_4
            && ((NarrowLiteralInstruction) original.get(n)).getNarrowLiteral() == 1) trueIndex = n;
        int trueRegister = ((OneRegisterInstruction) original.get(trueIndex)).getRegisterA();
        target.getImplementation().replaceInstruction(trueIndex, new BuilderInstruction11n(Opcode.CONST_4, trueRegister, 0));
        var changed = new ArrayList<>(classes); changed.set(classes.indexOf(owner), mutable); reject(changed);
        target.getImplementation().replaceInstruction(trueIndex, new BuilderInstruction11n(Opcode.CONST_4, trueRegister, 1));
        var before = MonetPremiumPatch.instructions(target);
        MonetPremiumPatch.apply(target);
        var after = MonetPremiumPatch.instructions(target);
        for (int n = 0; n < before.size(); n++) if (!semantics.falseLiterals.contains(n))
            require(before.get(n) == after.get(n), "Unrelated instruction changed");
        verifyBehavior(match, target);
        changed.set(classes.indexOf(owner), mutable); reject(changed);
        Path output = Path.of(args[1]); Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(), new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), List.of(mutable)));
        try (var in = new BufferedInputStream(Files.newInputStream(output))) {
            var reloaded = DexBackedDexFile.fromInputStream(null, in).getClasses().iterator().next();
            boolean found = false;
            for (Method m : reloaded.getMethods()) if (m.equals(match)) { verifyBehavior(match, m); found = true; }
            require(found, "Serialized hook missing");
        }
        System.out.println("PASS: " + args[0].replaceAll(".*[\\\\/]", "") + " all DEX searched; final/non-final/private, relocated registers, wider goto, NOP, reordered and lazy field loads and a shared return block accepted; static/wrong-semantics/field-return/unanchored/missing-refresh/conflicting-refresh/missing/ambiguous/changed/already-patched rejection; only false literals changed; all 16 entitlement states; DEX write/reload");
    }
}
