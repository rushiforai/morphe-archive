package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.nio.file.*;
import java.util.*;

public final class VerifyFylo {
    static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static void reject(List<? extends ClassDef> classes) {
        try { FyloProPatch.findUnique(classes); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid layout accepted");
    }
    public static void verifyMethod(Method original, Method patched, int changed) {
        var before = FyloProPatch.instructions(original);
        var after = FyloProPatch.instructions(patched);
        require(before.size() == after.size(), "Instruction count changed");
        require(original.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(), "Registers changed");
        for (int n = 0; n < before.size(); n++) {
            var a = before.get(n); var b = after.get(n);
            if (n == changed) {
                require(b.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction)b).getNarrowLiteral() == 1
                    && FyloProPatch.reg(a) == FyloProPatch.reg(b) && a.getCodeUnits() == b.getCodeUnits(), "Wrong mutation");
            } else require(key(a).equals(key(b)), "Unrelated instruction changed at " + n);
        }
        // Execute the actual native boolean diamond from IF_EQ to Boolean.valueOf for both enum states.
        for (boolean none : new boolean[]{false, true}) {
            require(diamond(original, changed, none) == !none, "Original Pro semantics differ");
            require(diamond(patched, changed, none), "Pro revoked when NONE=" + none);
        }
    }
    static String key(Instruction i) {
        String result = i.getOpcode().name() + ":" + i.getCodeUnits() + ":" + FyloProPatch.ref(i);
        if (i instanceof OneRegisterInstruction) result += ":" + FyloProPatch.reg(i);
        if (i instanceof TwoRegisterInstruction) result += ":" + ((TwoRegisterInstruction)i).getRegisterB();
        if (i instanceof ThreeRegisterInstruction) result += ":" + ((ThreeRegisterInstruction)i).getRegisterC();
        if (i instanceof WideLiteralInstruction) result += ":" + ((WideLiteralInstruction)i).getWideLiteral();
        if (i instanceof OffsetInstruction) result += ":" + ((OffsetInstruction)i).getCodeOffset();
        if (i instanceof FiveRegisterInstruction) {
            var x = (FiveRegisterInstruction)i;
            result += ":" + x.getRegisterCount()+":"+x.getRegisterC()+":"+x.getRegisterD()+":"+x.getRegisterE()+":"+x.getRegisterF()+":"+x.getRegisterG();
        }
        if (i instanceof RegisterRangeInstruction) result += ":"+((RegisterRangeInstruction)i).getStartRegister()+":"+((RegisterRangeInstruction)i).getRegisterCount();
        return result;
    }
    static boolean diamond(Method method, int changed, boolean none) {
        var body = FyloProPatch.instructions(method);
        int branch = changed - (method.getName().equals("<init>") ? 2 : 3);
        int[] regs = new int[method.getImplementation().getRegisterCount()];
        // Native startup already seeded the boolean output register with true.
        regs[FyloProPatch.reg(body.get(changed))] = 1;
        int pc = none ? FyloProPatch.target(body, branch) : branch + 1;
        for (int steps = 0; steps < 8; steps++) {
            var i = body.get(pc);
            if (i.getOpcode() == Opcode.CONST_4) regs[FyloProPatch.reg(i)] = ((NarrowLiteralInstruction)i).getNarrowLiteral();
            else if (i.getOpcode() == Opcode.MOVE) regs[FyloProPatch.reg(i)] = regs[((TwoRegisterInstruction)i).getRegisterB()];
            else if (i.getOpcode() == Opcode.GOTO) { pc = FyloProPatch.target(body, pc); continue; }
            else if (i.getOpcode() == Opcode.INVOKE_STATIC) return regs[((FiveRegisterInstruction)i).getRegisterC()] == 1;
            else throw new AssertionError("Unexpected diamond opcode " + i.getOpcode());
            pc++;
        }
        throw new AssertionError("Diamond did not terminate");
    }
    public static void main(String[] args) throws Exception {
        if (args[0].equals("--apk")) { auditApk(args[1], args[2]); return; }
        var classes = VerifyMonet.read(args[0]);
        var plan = FyloProPatch.findUnique(classes);
        require(plan.seedIndex == 37 && plan.refreshIndex == 7 && plan.license != null, "Reviewed 2.6 locations differ");
        reject(List.of());
        var duplicated = new ArrayList<ClassDef>(classes);
        duplicated.add(classes.stream().filter(c -> c.getType().equals(plan.seed.getDefiningClass())).findFirst().orElseThrow());
        reject(duplicated);
        var owner = new MutableClass(classes.stream().filter(c -> c.getType().equals(plan.seed.getDefiningClass())).findFirst().orElseThrow());
        var seed = FyloProPatch.mutable(owner.getMethods(), plan.seed);
        var refresh = FyloProPatch.mutable(owner.getMethods(), plan.refresh);
        FyloProPatch.forceTrue(seed, plan.seedIndex);
        FyloProPatch.forceTrue(refresh, plan.refreshIndex);
        verifyMethod(plan.seed, seed, plan.seedIndex);
        verifyMethod(plan.refresh, refresh, plan.refreshIndex);
        var modified = new ArrayList<ClassDef>(classes);
        modified.removeIf(c -> c.getType().equals(owner.getType())); modified.add(owner);
        reject(modified);
        // Change only the refresh branch in a fresh original class, independently of already-patched rejection.
        var changedOwner = new MutableClass(classes.stream().filter(c -> c.getType().equals(plan.seed.getDefiningClass())).findFirst().orElseThrow());
        var changedRefresh = FyloProPatch.mutable(changedOwner.getMethods(), plan.refresh);
        changedRefresh.getImplementation().replaceInstruction(plan.refreshIndex,
            new BuilderInstruction11n(Opcode.CONST_4, FyloProPatch.reg(FyloProPatch.instructions(plan.refresh).get(plan.refreshIndex)), 2));
        var changedClasses = new ArrayList<ClassDef>(classes);
        changedClasses.removeIf(c -> c.getType().equals(changedOwner.getType())); changedClasses.add(changedOwner);
        reject(changedClasses);
        Path output = Path.of(args[1]); Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(), new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), List.of(owner)));
        try (var in = Files.newInputStream(output); var buffered = new java.io.BufferedInputStream(in)) {
            var reloaded = DexBackedDexFile.fromInputStream(null, buffered).getClasses().iterator().next();
            for (Method m : reloaded.getMethods()) {
                if (m.equals(plan.seed)) verifyMethod(plan.seed, m, plan.seedIndex);
                if (m.equals(plan.refresh)) verifyMethod(plan.refresh, m, plan.refreshIndex);
            }
        }
        System.out.println("PASS: unique Fylo 2.6 Pro flow; startup/refresh NONE and owned states; missing, ambiguous, changed and patched rejection; DEX write/reload");
    }

    static void auditApk(String originalPath, String patchedPath) throws Exception {
        var original = VerifyMonet.read(originalPath);
        var plan = FyloProPatch.findUnique(original);
        var patched = VerifyMonet.read(patchedPath);
        Map<String, ClassDef> byType = new HashMap<>();
        for (ClassDef c : patched) require(byType.put(c.getType(), c) == null, "Duplicate delivered class");
        require(patched.size() == original.size(), "Class count changed");
        int hooks = 0;
        for (ClassDef c : original) {
            ClassDef delivered = byType.get(c.getType());
            require(delivered != null, "Missing delivered class");
            Map<String, Method> methods = new HashMap<>();
            delivered.getMethods().forEach(m -> methods.put(m.toString(), m));
            int count = 0;
            for (Method m : c.getMethods()) {
                count++;
                Method out = methods.get(m.toString());
                require(out != null && m.getAccessFlags() == out.getAccessFlags(), "Method contract changed");
                if (m.equals(plan.seed)) { verifyMethod(m, out, plan.seedIndex); hooks++; }
                else if (m.equals(plan.refresh)) { verifyMethod(m, out, plan.refreshIndex); hooks++; }
                else {
                    var before = FyloProPatch.instructions(m);
                    var after = FyloProPatch.instructions(out);
                    if (m.equals(plan.license)) {
                        require(after.get(0).getOpcode() == Opcode.RETURN_VOID, "License entry still executes");
                        after = after.subList(1, after.size()); hooks++;
                    }
                    require(before.size() == after.size(), "Unrelated method size changed: " + m);
                    for (int n = 0; n < before.size(); n++) require(key(before.get(n)).equals(key(after.get(n))), "Unrelated code changed: " + m);
                }
            }
            require(methods.size() == count, "Unexpected added method");
        }
        require(hooks == 3, "Delivered hooks missing");
        System.out.println("PASS: delivered APK retains all " + patched.size() + " classes, changes only the three reviewed hooks, preserves Pro startup/refresh behavior, and contains no duplicate classes");
    }
}
