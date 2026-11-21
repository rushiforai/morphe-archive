package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioMetadataAddon {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void reject(Runnable action) { try { action.run(); } catch (IllegalStateException expected) { return; } throw new AssertionError("Invalid metadata input accepted"); }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> originals = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var c : DexBackedDexFile.fromInputStream(null, input).getClasses()) check(originals.put(c.getType(), c) == null);
                }
        }
        Map<String, MutableClass> classes = new HashMap<>();
        java.util.function.Function<String, MutableClass> lookup = type -> classes.computeIfAbsent(type, t -> {
            if (!originals.containsKey(t)) throw new IllegalStateException("Missing class " + t);
            return new MutableClass(originals.get(t));
        });
        NuvioMetadataAddonPatch.validate(lookup);
        for (String ref : NuvioMetadataAddonPatch.HASHES.keySet()) {
            var method = NuvioMetadataAddonPatch.method(lookup, ref);
            String original = NuvioPlaybackButtonsPatch.fingerprint(method);
            method.getImplementation().removeInstruction(0);
            reject(() -> NuvioMetadataAddonPatch.validate(lookup));
            classes.put(NuvioMetadataAddonPatch.owner(ref), new MutableClass(originals.get(NuvioMetadataAddonPatch.owner(ref))));
            check(NuvioPlaybackButtonsPatch.fingerprint(NuvioMetadataAddonPatch.method(lookup, ref)).equals(original));
        }
        reject(() -> NuvioMetadataAddonPatch.validate(type -> { if (type.equals("Lba/x2;")) throw new IllegalStateException("Missing"); return lookup.apply(type); }));
        NuvioMetadataAddonPatch.install(lookup);
        for (String ref : List.of(NuvioMetadataAddonPatch.SAVED_PROGRESS, NuvioMetadataAddonPatch.SAVED_NEXT)) {
            var constructor = new MutableMethod(NuvioMetadataAddonPatch.method(lookup, ref));
            var code = NuvioRemainingEpisodesPatch.instructions(constructor);
            int artworkHooks = 0;
            for (int index = code.size() - 1; index >= 0; index--) {
                String targetRef = NuvioPlaybackButtonsPatch.reference(code.get(index));
                if (!targetRef.startsWith(NuvioMetadataAddonPatch.EXT)) continue;
                var call = (com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction) code.get(index);
                check(call.getRegisterCount() == 3 && call.getRegisterC() == 3 && call.getRegisterD() == 4);
                int imageRegister = targetRef.contains("retainedPoster") ? 6 : targetRef.contains("retainedBackground") ? 7 : 8;
                check(call.getRegisterE() == imageRegister);
                check(code.get(index + 1).getOpcode() == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT);
                check(((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) code.get(index + 1)).getRegisterA() == imageRegister);
                constructor.getImplementation().removeInstruction(index + 1);
                constructor.getImplementation().removeInstruction(index);
                artworkHooks++;
            }
            check(artworkHooks == 3);
            check(NuvioPlaybackButtonsPatch.fingerprint(constructor).equals(NuvioMetadataAddonPatch.HASHES.get(ref)));
        }
        reject(() -> NuvioMetadataAddonPatch.validate(lookup));
        NuvioMetadataAddonPatch.register(lookup.apply("Lq8/e;"));
        reject(() -> NuvioMetadataAddonPatch.register(lookup.apply("Lq8/e;")));
        Set<String> changed = new HashSet<>();
        List<ClassDef> output = new ArrayList<>();
        for (var entry : classes.entrySet()) {
            MutableClass c = entry.getValue(); output.add(c);
            for (var m : c.getMethods()) if (m.getImplementation() != null) {
                var old = new MutableClass(originals.get(c.getType())).getMethods().stream().filter(x -> x.toString().equals(m.toString())).findFirst().orElseThrow();
                if (!NuvioPlaybackButtonsPatch.fingerprint(m).equals(NuvioPlaybackButtonsPatch.fingerprint(old))) changed.add(m.toString());
            }
        }
        check(changed.size() == 11 && changed.containsAll(NuvioMetadataAddonPatch.HASHES.keySet()));
        File target = new File(args[1]); target.getParentFile().mkdirs();
        DexPool.writeTo(target.toString(), new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), output));
        int hooks = 0;
        try (var input = new BufferedInputStream(new FileInputStream(target))) {
            for (var c : DexBackedDexFile.fromInputStream(null, input).getClasses())
                for (var m : c.getMethods()) if (m.getImplementation() != null)
                    for (var ins : m.getImplementation().getInstructions()) if (NuvioPlaybackButtonsPatch.reference(ins).startsWith(NuvioMetadataAddonPatch.EXT)) hooks++;
        }
        check(hooks == 18);
        System.out.println("PASS: original 1.1.0 contracts, changed/missing/duplicate rejection, eleven-method mutation scope and eighteen routing/artwork hooks survive DEX write/reload");
    }
}
