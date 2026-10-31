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
    public static void verifyBehavior(Method original, Method patched) {
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
            for (int n = 0; n < 4; n++) values.put(((FieldReference)((ReferenceInstruction)before.get(n)).getReference()).getName(), mask >> n & 1);
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
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = read(args[0]);
        Method match = MonetPremiumPatch.findUnique(classes);
        require(match.toString().equals("La/dl5;->a()Z"), "Unexpected 1.1.0 hook");
        require(match.getAccessFlags() == 1, "1.1.0 public/non-final contract changed");
        System.out.println("Unique original hook: " + match);
        reject(Collections.emptyList());
        ClassDef owner = classes.stream().filter(c -> c.getType().equals(match.getDefiningClass())).findFirst().orElseThrow();
        for (int flags : new int[]{1, 17}) for (boolean relocate : new boolean[]{false, true}) {
            Method candidate = variant(match, flags, relocate);
            var fixture = replace(classes, owner, match, candidate);
            Method found = MonetPremiumPatch.findUnique(fixture);
            var patched = new MutableMethod(found);
            MonetPremiumPatch.apply(patched);
            verifyBehavior(found, patched);
        }
        reject(replace(classes, owner, match, variant(match, 9, false))); // Static is not harmless drift.
        var wrongBranch = new ArrayList<>(MonetPremiumPatch.instructions(match));
        wrongBranch.set(4, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3));
        Method wrongSemantics = new ImmutableMethod(match.getDefiningClass(), match.getName(), match.getParameters(),
            "Z", 1, Set.of(), Set.of(), new ImmutableMethodImplementation(4, wrongBranch, List.of(), List.of()));
        reject(replace(classes, owner, match, wrongSemantics));
        var unanchored = new ArrayList<>(classes);
        unanchored.removeIf(c -> c.getType().equals("La/f50;"));
        reject(unanchored);
        var duplicate = new ArrayList<>(classes); duplicate.add(owner); reject(duplicate);
        var mutable = new MutableClass(owner);
        var target = mutable.getMethods().stream().filter(m -> m.equals(match)).findFirst().orElseThrow();
        // A changed literal must reject before mutation.
        target.getImplementation().replaceInstruction(9, new BuilderInstruction11n(Opcode.CONST_4, 3, 0));
        var changed = new ArrayList<>(classes); changed.set(classes.indexOf(owner), mutable); reject(changed);
        target.getImplementation().replaceInstruction(9, new BuilderInstruction11n(Opcode.CONST_4, 3, 1));
        var missingLifecycle = new MutableClass(owner);
        missingLifecycle.getMethods().removeIf(m -> m.getName().equals("c") && m.getParameterTypes().equals(List.of("Z")));
        var noRefresh = new ArrayList<>(classes); noRefresh.set(classes.indexOf(owner), missingLifecycle); reject(noRefresh);
        var before = MonetPremiumPatch.instructions(target);
        MonetPremiumPatch.apply(target);
        var after = MonetPremiumPatch.instructions(target);
        for (int n = 0; n < before.size(); n++) if (n != 11) require(before.get(n) == after.get(n), "Unrelated instruction changed");
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
        System.out.println("PASS: 1.1.0 all DEX searched; final/non-final, relocated registers, wider goto and NOP layout accepted; static/wrong-semantics/unanchored/missing-refresh/missing/ambiguous/changed/already-patched rejection; only one literal changed; all 16 entitlement states; DEX write/reload");
    }
}
