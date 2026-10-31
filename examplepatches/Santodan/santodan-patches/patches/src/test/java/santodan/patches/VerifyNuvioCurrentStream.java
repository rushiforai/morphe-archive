package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioCurrentStream {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid card accepted");
    }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var c : DexBackedDexFile.fromInputStream(null, input).getClasses()) check(classes.put(c.getType(), c) == null);
                }
        }
        MutableClass owner = new MutableClass(classes.get("Lbb/mn;"));
        var nativeMethod = new MutableMethod(NuvioRemainingEpisodesPatch.unique(owner, "h", 13));
        NuvioCurrentStreamPatch.validate(owner);
        MutableClass missing = new MutableClass(owner);
        missing.getMethods().removeIf(m -> m.getName().equals("h"));
        rejected(() -> NuvioCurrentStreamPatch.hook(missing));
        MutableClass changed = new MutableClass(owner);
        NuvioRemainingEpisodesPatch.unique(changed, "h", 13).getImplementation().replaceInstruction(141,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioCurrentStreamPatch.hook(changed));
        MutableClass ambiguous = new MutableClass(owner);
        var parameters = new ArrayList<com.android.tools.smali.dexlib2.iface.MethodParameter>(nativeMethod.getParameters());
        parameters.set(0, new ImmutableMethodParameter("Ljava/lang/Object;", Set.of(), null));
        ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(owner.getType(), "h", parameters,
            "V", nativeMethod.getAccessFlags(), Set.of(), Set.of(), nativeMethod.getImplementation())));
        rejected(() -> NuvioCurrentStreamPatch.hook(ambiguous));
        NuvioCurrentStreamPatch.hook(owner);
        rejected(() -> NuvioCurrentStreamPatch.hook(owner));
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.toString(), new ImmutableDexFile(Opcodes.getDefault(), List.of(owner)));
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            var reloaded = new MutableClass(DexBackedDexFile.fromInputStream(null, input).getClasses().iterator().next());
            var body = NuvioAiringSeriesPatch.instructions(NuvioRemainingEpisodesPatch.unique(reloaded, "h", 13));
            check(body.size() == NuvioAiringSeriesPatch.instructions(nativeMethod).size() + 2);
            check(body.get(142).getOpcode() == Opcode.INVOKE_STATIC);
            var call = (com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction)body.get(142);
            check(call.getRegisterCount() == 2 && call.getRegisterC() == 7 && call.getRegisterD() == 8);
            check(NuvioPlaybackButtonsPatch.reference(body.get(142)).equals(NuvioCurrentStreamPatch.LABEL_METHOD));
            check(body.get(143).getOpcode() == Opcode.MOVE_RESULT_OBJECT);
            // Remove the inserted block: every original opcode, register, reference,
            // branch target and Compose group must survive the write/reload unchanged.
            var restored = NuvioRemainingEpisodesPatch.unique(reloaded, "h", 13);
            for (int i = 0; i < 2; i++) restored.getImplementation().removeInstruction(142);
            check(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(NuvioPlaybackButtonsPatch.fingerprint(nativeMethod)));
        }
        System.out.println("PASS: original APK, rejection checks, conditional label, mutation scope and DEX roundtrip");
    }
}
