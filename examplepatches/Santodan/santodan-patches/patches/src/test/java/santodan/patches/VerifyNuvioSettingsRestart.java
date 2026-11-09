package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;
import software.santodan.nuvio.NuvioNative;

public final class VerifyNuvioSettingsRestart {
    private static void check(boolean value) { if (!value) throw new AssertionError(); }
    private static void rejects(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Changed startup accepted");
    }
    public static void main(String[] args) throws Exception {
        ClassDef original = null;
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (ClassDef owner : DexBackedDexFile.fromInputStream(null, input).getClasses())
                        if (owner.getType().equals(NuvioNative.APPLICATION_TYPE)) { check(original == null); original = owner; }
                }
        }
        check(original != null);
        MutableClass owner = new MutableClass(original);
        NuvioSettingsRestart.validate(owner);
        MutableClass changed = new MutableClass(original);
        NuvioSettingsRestart.validate(changed).getImplementation().addInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejects(() -> NuvioSettingsRestart.install(changed));
        NuvioSettingsRestart.install(owner);
        rejects(() -> NuvioSettingsRestart.install(owner));
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.getPath(), new ImmutableDexFile(Opcodes.getDefault(), List.of(owner)));
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            MutableClass reloaded = new MutableClass(DexBackedDexFile.fromInputStream(null, input).getClasses().iterator().next());
            MutableMethod method = NuvioRemainingEpisodesPatch.unique(reloaded, "onCreate", 0);
            var body = NuvioAiringSeriesPatch.instructions(method);
            check(body.get(0).getOpcode() == Opcode.INVOKE_STATIC_RANGE);
            check(((RegisterRangeInstruction) body.get(0)).getStartRegister() == method.getImplementation().getRegisterCount() - 1);
            check(NuvioPlaybackButtonsPatch.reference(body.get(0)).endsWith("SettingsRestartActivity;->isRestartProcess(Landroid/content/Context;)Z"));
            check(body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ);
            check(NuvioAnchors.branchTarget(body, 2) == 4 && body.get(3).getOpcode() == Opcode.RETURN_VOID);
            for (int i = 0; i < 4; i++) method.getImplementation().removeInstruction(0);
            check(NuvioPlaybackButtonsPatch.fingerprint(method).equals(NuvioNative.HASH_RESTART_APPLICATION));
        }
        System.out.println("PASS: exact original application startup, changed/duplicate rejection, helper-only return, preserved main startup and DEX round trip");
    }
}
