import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.nio.file.*;
import java.util.*;
import tw.maps.*;

public class VerifyPatchCore {
    static final Map<String,String> INPUTS = Map.of(
        "classes2", "72019e33fd4c3202350865a0cf6cd797157632c65024b4efff3412c6d187d1c7",
        "classes4", "edd634e52968c5207666e0c6565e82264af7551440e9372e435abe80dd0cb080");

    static ImmutableMethod withCode(Method m, MethodImplementation code) {
        return new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
            m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), code);
    }
    static Map<String,Method> methods(DexFile dex) {
        Map<String,Method> result = new HashMap<>();
        for (var c : dex.getClasses()) for (var m : c.getMethods()) result.put(m.toString(), m);
        return result;
    }

    public static void main(String[] args) throws Exception {
        Path out = Path.of("analysis/experiment");
        Files.createDirectories(out);
        int changed = 0, compared = 0;
        List<String> report = new ArrayList<>();
        Map<String,Method> support = new HashMap<>();
        for (String name : List.of("classes", "classes3", "classes4")) {
            var dex = new DexBackedDexFile(null, Files.readAllBytes(Path.of("analysis/dex/" + name + ".dex")));
            for (var c : dex.getClasses()) for (var m : c.getMethods())
                if (TwoWheelerCore.SUPPORT.containsKey(m.toString())) support.put(m.toString(), m);
        }
        TwoWheelerCore.validateSupport(support);
        for (String key : TwoWheelerCore.SUPPORT.keySet()) {
            var missing = new HashMap<>(support);
            missing.remove(key);
            boolean rejected = false;
            try { TwoWheelerCore.validateSupport(missing); } catch (IllegalStateException ok) { rejected = true; }
            if (!rejected) throw new AssertionError("Missing supporting fingerprint accepted");
        }
        report.add("SUPPORT: five full method fingerprints matched; each missing dependency rejected.");
        for (String name : List.of("classes2", "classes4")) {
            byte[] bytes = Files.readAllBytes(Path.of("analysis/dex/" + name + ".dex"));
            if (!MethodFingerprint.sha256(bytes).equals(INPUTS.get(name))) throw new AssertionError("Input DEX mismatch: " + name);
            var dex = new DexBackedDexFile(null, bytes);
            var pool = new DexPool(dex.getOpcodes());
            Map<String,String> expected = new HashMap<>();
            for (var c : dex.getClasses()) {
                List<Method> rewritten = new ArrayList<>();
                boolean touched = false;
                for (var m : c.getMethods()) {
                    Method next = m;
                    if (TwoWheelerCore.isTarget(m)) {
                        var altered = new com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(m.getImplementation());
                        altered.addInstruction(0, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP));
                        boolean modifiedRejected = false;
                        try { TwoWheelerCore.transform(withCode(m, altered)); } catch (IllegalStateException ok) { modifiedRejected = true; }
                        if (!modifiedRejected) throw new AssertionError("Changed bytecode accepted");
                        next = withCode(m, TwoWheelerCore.transform(m));
                        // A second application must fail, including with the same version label.
                        boolean rejected = false;
                        try { TwoWheelerCore.transform(next); } catch (IllegalStateException ok) { rejected = true; }
                        if (!rejected) throw new AssertionError("Double application accepted");
                        touched = true; changed++;
                        report.add("TRANSFORM " + m + " " + MethodFingerprint.sha256(m) + " -> " + MethodFingerprint.sha256(next));
                    }
                    rewritten.add(next);
                    expected.put(next.toString(), MethodFingerprint.sha256(next));
                }
                pool.internClass(touched ? new ImmutableClassDef(c.getType(), c.getAccessFlags(), c.getSuperclass(),
                    c.getInterfaces(), c.getSourceFile(), c.getAnnotations(), c.getFields(), rewritten) : c);
            }
            Path target = out.resolve(name + ".dex");
            pool.writeTo(new com.android.tools.smali.dexlib2.writer.io.FileDataStore(target.toFile()));
            var roundtrip = new DexBackedDexFile(null, Files.readAllBytes(target));
            var actual = methods(roundtrip);
            if (actual.size() != expected.size()) throw new AssertionError("Method count changed");
            for (var entry : expected.entrySet()) {
                var m = actual.get(entry.getKey());
                if (m == null || !entry.getValue().equals(MethodFingerprint.sha256(m)))
                    throw new AssertionError("Unexpected round-trip method change: " + entry.getKey());
                compared++;
            }
            for (var m : actual.values()) if (TwoWheelerCore.isTarget(m)) GuardInterpreter.verify(m);
            report.add("ROUNDTRIP " + name + " methods=" + expected.size() + " sha256=" + MethodFingerprint.sha256(Files.readAllBytes(target)));
        }
        if (changed != 2) throw new AssertionError("Expected exactly 2 targets, got " + changed);
        report.add("PASS: two targets; " + compared + " method bodies verified after serialization; repeat application rejected; guard matrix passed.");
        report.add("NOT TESTED: ART verifier, Morphe runtime, installation, actual route response, native reroute.");
        Files.write(out.resolve("verification.txt"), report);
        report.forEach(System.out::println);
    }
}
