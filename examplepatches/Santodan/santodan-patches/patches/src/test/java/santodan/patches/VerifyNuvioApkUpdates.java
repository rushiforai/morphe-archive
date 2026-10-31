package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioApkUpdates {
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid updater accepted");
    }
    static Map<String, MutableClass> copy(Map<String, MutableClass> source) {
        Map<String, MutableClass> result = new HashMap<>();
        source.forEach((type, owner) -> result.put(type, new MutableClass(owner)));
        return result;
    }
    public static void main(String[] args) throws Exception {
        Map<String, MutableClass> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var in = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var c : DexBackedDexFile.fromInputStream(null, in).getClasses())
                        if (NuvioApkUpdates.TYPES.contains(c.getType())) check(classes.put(c.getType(), new MutableClass(c)) == null);
                }
        }
        check(NuvioApkUpdates.validVersion("0.12.1") && NuvioApkUpdates.validVersion("0.13.0-beta.1"));
        check(!NuvioApkUpdates.validVersion("v0.12.1") && !NuvioApkUpdates.validVersion("1.2") && !NuvioApkUpdates.validVersion("0.12.1+ignored"));
        NuvioApkUpdates.validate(classes);
        var missing = copy(classes); missing.remove("Llb/q;");
        rejected(() -> NuvioApkUpdates.apply(missing, "Santodan", "santodan-patches", "0.12.0"));
        NuvioApkUpdates.validate(Map.of("Llb/j0;", missing.get("Llb/j0;"), "Llb/q0;", missing.get("Llb/q0;"),
            "Llb/m0;", missing.get("Llb/m0;"), "Llb/k;", missing.get("Llb/k;"), "Llb/q;", classes.get("Llb/q;"),
            NuvioApkUpdates.JOB, classes.get(NuvioApkUpdates.JOB)));
        var changed = copy(classes);
        NuvioApkUpdates.validate(changed).get(6).getImplementation().replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioApkUpdates.apply(changed, "Santodan", "santodan-patches", "0.12.0"));
        var ambiguous = copy(classes);
        var method = NuvioApkUpdates.validate(ambiguous).get(0);
        ambiguous.get("Llb/j0;").getMethods().add(new MutableMethod(new ImmutableMethod("Llb/j0;", "a", List.of(),
            "V", 1, Set.of(), Set.of(), method.getImplementation())));
        rejected(() -> NuvioApkUpdates.apply(ambiguous, "Santodan", "santodan-patches", "0.12.0"));
        var patched = copy(classes);
        NuvioApkUpdates.apply(patched, "Santodan", "santodan-patches", "0.12.0");
        rejected(() -> NuvioApkUpdates.apply(patched, "Santodan", "santodan-patches", "0.12.0"));
        if (args.length > 2) {
            var published = copy(classes);
            NuvioApkUpdates.apply(published, "Santodan", "santodan-patches", PatchBundleVersion.VERSION);
            Map<String, MutableClass> rebuilt = new HashMap<>();
            try (ZipFile zip = new ZipFile(args[2])) {
                for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                    try (var in = new BufferedInputStream(zip.getInputStream(entry))) {
                        for (var c : DexBackedDexFile.fromInputStream(null, in).getClasses())
                            if (NuvioApkUpdates.TYPES.contains(c.getType())) check(rebuilt.put(c.getType(), new MutableClass(c)) == null);
                    }
            }
            check(rebuilt.size() == patched.size());
            for (var expected : published.values()) for (var before : expected.getMethods()) {
                var actual = rebuilt.get(expected.getType()).getMethods().stream().filter(m -> m.toString().equals(before.toString())).findFirst().orElseThrow();
                if (expected.getType().equals("Llb/q;") && actual.getName().equals("b")) NuvioUpdateFlowPatch.removeDownloadHook(actual);
                check(NuvioPlaybackButtonsPatch.fingerprint(actual).equals(NuvioPlaybackButtonsPatch.fingerprint(before)));
            }
            System.out.println("PASS: final rebuilt APK contains all exact patched updater methods and preserved downloader/installer methods");
        }
        File out = new File(args[1]); out.getParentFile().mkdirs();
        DexPool.writeTo(out.toString(), new ImmutableDexFile(Opcodes.getDefault(), patched.values()));
        Map<String, MutableClass> reloaded = new HashMap<>();
        try (var in = new BufferedInputStream(new FileInputStream(out))) {
            for (var c : DexBackedDexFile.fromInputStream(null, in).getClasses()) reloaded.put(c.getType(), new MutableClass(c));
        }
        int replacements = 0;
        // Restore just changed string instructions: every method, register, branch, try region and native call must survive.
        for (var original : classes.values()) for (var before : original.getMethods()) {
            var after = reloaded.get(original.getType()).getMethods().stream().filter(m -> m.toString().equals(before.toString())).findFirst().orElseThrow();
            var oldCode = NuvioRemainingEpisodesPatch.instructions(before);
            var newCode = NuvioRemainingEpisodesPatch.instructions(after);
            check(oldCode.size() == newCode.size());
            for (int i = 0; i < oldCode.size(); i++) if (!NuvioApkUpdates.string(oldCode.get(i)).equals(NuvioApkUpdates.string(newCode.get(i)))) {
                String old = NuvioApkUpdates.string(oldCode.get(i));
                String expected = old.equals(NuvioApkUpdates.APP_VERSION) ? "0.12.0" : old.equals("NuvioMedia") ? "Santodan" : old.equals("NuvioTV") ? "santodan-patches" : null;
                check(expected != null && expected.equals(NuvioApkUpdates.string(newCode.get(i))));
                after.getImplementation().replaceInstruction(i, before.getImplementation().getInstructions().get(i));
                replacements++;
            }
            check(NuvioPlaybackButtonsPatch.fingerprint(after).equals(NuvioPlaybackButtonsPatch.fingerprint(before)));
            check(ImmutableMethodImplementation.of(after.getImplementation()).getTryBlocks().equals(ImmutableMethodImplementation.of(before.getImplementation()).getTryBlocks()));
        }
        check(replacements == 9);
        System.out.println("PASS: beta.8 original, atomic validation, missing/changed/ambiguous/duplicate rejection, UI/background versions, nine constants only, DEX roundtrip");
    }
}
