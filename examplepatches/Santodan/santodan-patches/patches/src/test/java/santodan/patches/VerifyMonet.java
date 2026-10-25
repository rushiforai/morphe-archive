package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
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
        int[] regs = new int[4];
        int[] address = new int[ins.size()];
        for (int n = 1; n < ins.size(); n++) address[n] = address[n-1] + ins.get(n-1).getCodeUnits();
        for (int pc = 0, steps = 0; steps < 30; steps++) {
            Instruction i = ins.get(pc);
            switch (i.getOpcode()) {
                case IGET_BOOLEAN: regs[((OneRegisterInstruction)i).getRegisterA()] = fields.get(
                    ((FieldReference)((ReferenceInstruction)i).getReference()).getName()); break;
                case CONST_4: regs[((OneRegisterInstruction)i).getRegisterA()] = ((NarrowLiteralInstruction)i).getNarrowLiteral(); break;
                case RETURN: return regs[((OneRegisterInstruction)i).getRegisterA()] != 0;
                case IF_EQZ: case IF_NEZ: case GOTO: {
                    boolean jump = i.getOpcode() == Opcode.GOTO || (regs[((OneRegisterInstruction)i).getRegisterA()] == 0)
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
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = read(args[0]);
        Method match = MonetPremiumPatch.findUnique(classes);
        System.out.println("Unique original hook: " + match);
        reject(Collections.emptyList());
        ClassDef owner = classes.stream().filter(c -> c.getType().equals(match.getDefiningClass())).findFirst().orElseThrow();
        var duplicate = new ArrayList<>(classes); duplicate.add(owner); reject(duplicate);
        var mutable = new MutableClass(owner);
        var target = mutable.getMethods().stream().filter(m -> m.equals(match)).findFirst().orElseThrow();
        // A changed literal must reject before mutation.
        target.getImplementation().replaceInstruction(9, new BuilderInstruction11n(Opcode.CONST_4, 3, 0));
        var changed = new ArrayList<>(classes); changed.set(classes.indexOf(owner), mutable); reject(changed);
        target.getImplementation().replaceInstruction(9, new BuilderInstruction11n(Opcode.CONST_4, 3, 1));
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
        System.out.println("PASS: all DEX searched; missing/ambiguous/changed/already-patched rejection; only one literal changed; all 16 entitlement states; DEX write/reload");
    }
}
