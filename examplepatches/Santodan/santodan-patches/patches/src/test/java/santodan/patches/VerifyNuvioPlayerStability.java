package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;
import java.nio.file.Path;
import software.santodan.nuvio.NuvioNative;

public final class VerifyNuvioPlayerStability {
    private static void rejected(MutableClass owner) {
        try { NuvioPlayerStabilityPatch.hook(owner); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsafe/already-patched player accepted");
    }
    public static void verifyPatched(Method method) {
        MutableMethod copy = new MutableMethod(method);
        var code = copy.getImplementation();
        var instructions = NuvioRemainingEpisodesPatch.instructions(copy);
        if (instructions.size() != 26 || instructions.get(3).getOpcode() != Opcode.IF_EQZ ||
            ((OneRegisterInstruction) instructions.get(3)).getRegisterA() != 0 ||
            NuvioAnchors.branchTarget(instructions, 3) != 25 || instructions.get(25).getOpcode() != Opcode.RETURN_VOID ||
            instructions.get(4).getOpcode() != Opcode.IGET_OBJECT)
            throw new AssertionError("Null period must return; non-null period must reach the original seek body");
        code.removeInstruction(3);
        if (!NuvioPlaybackButtonsPatch.fingerprint(copy).equals(NuvioPlayerStabilityPatch.HASH))
            throw new AssertionError("Active-period seek behavior changed");
    }
    public static void main(String[] args) throws Exception {
        if (!ReportNuvioUpdate.sha256(Path.of(args[0])).equals(NuvioNative.ORIGINAL_SHA256))
            throw new AssertionError("Wrong original APK");
        ClassDef original = null;
        try (var apk = new ZipFile(args[0])) {
            for (var entry : Collections.list(apk.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var in = new BufferedInputStream(apk.getInputStream(entry))) {
                    for (var owner : DexBackedDexFile.fromInputStream(null, in).getClasses())
                        if (owner.getType().equals(NuvioPlayerStabilityPatch.OWNER)) {
                            if (original != null) throw new AssertionError("Duplicate player class");
                            original = owner;
                        }
                }
        }
        if (original == null) throw new AssertionError("No native player");
        MutableClass missing = new MutableClass(original);
        missing.getMethods().removeIf(m -> m.getName().equals(NuvioPlayerStabilityPatch.METHOD));
        rejected(missing);
        MutableClass changed = new MutableClass(original);
        NuvioRemainingEpisodesPatch.unique(changed, NuvioPlayerStabilityPatch.METHOD, 1).getImplementation()
            .replaceInstruction(2, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1));
        rejected(changed);
        changed = new MutableClass(original);
        NuvioRemainingEpisodesPatch.unique(changed, NuvioPlayerStabilityPatch.METHOD, 1).getImplementation()
            .replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(changed);
        MutableClass ambiguous = new MutableClass(original);
        MutableMethod seek = NuvioRemainingEpisodesPatch.unique(ambiguous, NuvioPlayerStabilityPatch.METHOD, 1);
        ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(original.getType(), seek.getName(),
            List.of(new ImmutableMethodParameter("Ljava/lang/Object;", Set.of(), null)), "V", seek.getAccessFlags(),
            seek.getAnnotations(), seek.getHiddenApiRestrictions(), seek.getImplementation())));
        rejected(ambiguous);
        MutableClass patched = new MutableClass(original);
        NuvioPlayerStabilityPatch.hook(patched);
        verifyPatched(NuvioRemainingEpisodesPatch.unique(patched, NuvioPlayerStabilityPatch.METHOD, 1));
        rejected(patched);
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.toString(), new ImmutableDexFile(Opcodes.forApi(28), List.of(patched)));
        try (var in = new BufferedInputStream(new FileInputStream(output))) {
            ClassDef owner = DexBackedDexFile.fromInputStream(null, in).getClasses().iterator().next();
            for (Method method : owner.getMethods()) if (method.getName().equals(NuvioPlayerStabilityPatch.METHOD)) verifyPatched(method);
        }
        System.out.println("PASS: original beta.8 null-period seek guard, unchanged active path, missing/ambiguous/body/register/duplicate rejection, and DEX write/reload");
    }
}
