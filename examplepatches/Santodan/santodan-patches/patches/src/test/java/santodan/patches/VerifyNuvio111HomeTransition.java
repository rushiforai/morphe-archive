package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.Opcode;
import software.santodan.nuvio.NuvioNative;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvio111HomeTransition {
    static Map<String, ClassDef> load(String path) throws Exception {
        Map<String, ClassDef> result = new HashMap<>();
        try (var zip = new ZipFile(path)) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var owner : DexBackedDexFile.fromInputStream(null, input).getClasses()) result.put(owner.getType(), owner);
                }
        }
        return result;
    }
    static void reject(Runnable work) {
        try { work.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Changed/missing/duplicate transition accepted");
    }
    public static void main(String[] args) throws Exception {
        var original = load(args[0]);
        NuvioLocalHomePatch.METHODS.forEach((ref, hash) -> {
            boolean found = false;
            for (var method : original.get(ref.substring(0, ref.indexOf("->"))).getMethods())
                if (method.toString().equals(ref) && NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(method)).equals(hash)) found = true;
            if (!found) throw new AssertionError("Unverified local Home native method: " + ref);
        });
        for (String ref : NuvioHomeTransitionPatch.FIELDS) {
            boolean found = false;
            for (var field : original.get(ref.substring(0, ref.indexOf("->"))).getFields())
                if (field.toString().equals(ref) && (field.getAccessFlags() & 8) == 0) found = true;
            if (!found)
                throw new AssertionError("Missing native transition binding: " + ref);
        }
        List<ClassDef> patched = new ArrayList<>();
        var home = new MutableClass(original.get(NuvioNative.HOME_MODEL_TYPE));
        NuvioMergedProgressPatch.hookHomePipeline(home);
        patched.add(home);
        for (String type : NuvioHomeTransitionPatch.HASHES.keySet()) {
            var owner = new MutableClass(original.get(type));
            var nativeMethod = NuvioHomeTransitionPatch.validate(owner);
            var changed = new MutableClass(original.get(type));
            NuvioHomeTransitionPatch.validate(changed).getImplementation().replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
            reject(() -> NuvioHomeTransitionPatch.hook(changed));
            var missing = new MutableClass(original.get(type));
            missing.getMethods().removeIf(m -> m.getName().equals("invokeSuspend"));
            reject(() -> NuvioHomeTransitionPatch.hook(missing));
            var ambiguous = new MutableClass(original.get(type));
            ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(type, "invokeSuspend",
                List.of(new ImmutableMethodParameter("Ljava/lang/String;", Set.of(), null)), "Ljava/lang/Object;",
                nativeMethod.getAccessFlags(), Set.of(), Set.of(), nativeMethod.getImplementation())));
            reject(() -> NuvioHomeTransitionPatch.hook(ambiguous));
            NuvioHomeTransitionPatch.hook(owner);
            reject(() -> NuvioHomeTransitionPatch.hook(owner));
            patched.add(owner);
        }
        var output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.toString(), new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), patched));
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            for (var owner : DexBackedDexFile.fromInputStream(null, input).getClasses()) {
                if (owner.getType().equals(NuvioNative.HOME_MODEL_TYPE)) verifyResume(owner, original.get(owner.getType()));
                else verify(owner, original.get(owner.getType()), false);
            }
        }
        if (args.length > 2) {
            var delivered = load(args[2]);
            for (String type : NuvioHomeTransitionPatch.HASHES.keySet()) verify(delivered.get(type), original.get(type), true);
            verifyResume(delivered.get(NuvioNative.HOME_MODEL_TYPE), original.get(NuvioNative.HOME_MODEL_TYPE));
            var runtime = delivered.get(NuvioHomeTransitionPatch.EXT);
            if (runtime == null || !delivered.containsKey("Lsoftware/santodan/extension/nuviomerged/NuvioHomeTransition;"))
                throw new AssertionError("Missing delivered transition runtime");
            Set<String> strings = new HashSet<>();
            for (var method : runtime.getMethods()) if (method.getImplementation() != null)
                for (var instruction : method.getImplementation().getInstructions()) strings.add(NuvioApkUpdates.string(instruction));
            if (!strings.containsAll(NuvioHomeTransitionPatch.FIELDS)) throw new AssertionError("Stale delivered transition reflection bindings");
            if (!strings.contains(NuvioNative.REF_LOCAL_HOME_RESUME)) throw new AssertionError("Stale native Home resume binding");
            var projector = delivered.get("Lsoftware/santodan/extension/nuviomerged/NuvioLocalHomeProjection;");
            if (projector == null || !delivered.containsKey("Lsoftware/santodan/extension/nuviomerged/NuvioLocalHomeUpdates;"))
                throw new AssertionError("Missing local background Home projector");
            for (var clazz : delivered.values()) if (clazz.getType().startsWith("Lsoftware/santodan/extension/nuviomerged/NuvioLocalHomeProjection"))
                for (var method : clazz.getMethods()) if (method.getImplementation() != null)
                    for (var instruction : method.getImplementation().getInstructions()) strings.add(NuvioApkUpdates.string(instruction));
            if (!strings.containsAll(NuvioLocalHomePatch.FIELDS) || !strings.containsAll(NuvioLocalHomePatch.METHODS.keySet()))
                throw new AssertionError("Stale local Home resolver/settings/state-copy reflection bindings");
        }
        System.out.println("PASS: 1.1.1 staged Home hooks, native bindings, final publication untouched, mutation scope/rejection and DEX roundtrip" + (args.length > 2 ? ", delivered APK audited" : ""));
    }
    static void verifyResume(ClassDef owner, ClassDef original) {
        MutableMethod resume = null;
        for (var method : owner.getMethods()) if (method.toString().equals(NuvioNative.REF_LOCAL_HOME_RESUME)) resume = new MutableMethod(method);
        if (resume == null) throw new AssertionError("Missing cache-free Home observer resume");
        var code = NuvioRemainingEpisodesPatch.instructions(resume);
        for (int i = code.size() - 1; i >= 0; i--)
            if (NuvioPlaybackButtonsPatch.reference(code.get(i)).contains("->homePipelineStarted(")) resume.getImplementation().removeInstruction(i);
        var expected = new MutableMethod(NuvioRemainingEpisodesPatch.unique(new MutableClass(original), "b", 1));
        for (int i = 10; i >= 0; i--) expected.getImplementation().removeInstruction(i);
        expected.getImplementation().addInstruction(0, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n(Opcode.CONST_4,6,0));
        if (!NuvioPlaybackButtonsPatch.fingerprint(resume).equals(NuvioPlaybackButtonsPatch.fingerprint(expected)))
            throw new AssertionError("Home resume must preserve the native observer and skip only old disk-card replay");
    }
    static void verify(ClassDef owner, ClassDef original, boolean cutoffPresent) {
        if (owner == null) throw new AssertionError("Missing delivered Home stage");
        var method = new MutableMethod(NuvioRemainingEpisodesPatch.unique(new MutableClass(owner), "invokeSuspend", 1));
        var code = NuvioRemainingEpisodesPatch.instructions(method);
        int transitions = 0, cutoffs = 0, captures = 0;
        for (int i = code.size() - 1; i >= 0; i--) {
            String ref = NuvioPlaybackButtonsPatch.reference(code.get(i));
            if (!ref.startsWith(NuvioHomeTransitionPatch.EXT + "->")) continue;
            if (ref.contains("->captureHomeSnapshot(")) {
                if (i != 0 || !owner.getType().equals(NuvioHomeTransitionPatch.INITIAL) ||
                    ((RegisterRangeInstruction) code.get(i)).getStartRegister() != NuvioRemainingEpisodesPatch.parameterStart(method))
                    throw new AssertionError("Wrong local Home settings capture receiver");
                captures++; method.getImplementation().removeInstruction(i); continue;
            }
            boolean cutoff = ref.contains("adjustContinueWatchingCutoff(");
            String expected = owner.getType().equals(NuvioHomeTransitionPatch.INITIAL) ? "retainInitialContinueWatching" : "retainPartialContinueWatching";
            if (!cutoff && !ref.contains("->" + expected + "(")) throw new AssertionError("Unexpected Home hook: " + ref);
            if (cutoff) cutoffs++; else {
                transitions++;
                var call = (FiveRegisterInstruction) code.get(i);
                boolean initial = owner.getType().equals(NuvioHomeTransitionPatch.INITIAL);
                if (call.getRegisterCount() != 2 || call.getRegisterC() != (initial ? 9 : 4) || call.getRegisterD() != (initial ? 3 : 0))
                    throw new AssertionError("Wrong native Home/list register sources");
            }
            if (code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) throw new AssertionError("Missing adjacent result");
            method.getImplementation().removeInstruction(i + 1); method.getImplementation().removeInstruction(i);
        }
        if (transitions != 1 || captures != (owner.getType().equals(NuvioHomeTransitionPatch.INITIAL) ? 1 : 0) ||
            cutoffs != (cutoffPresent && owner.getType().equals(NuvioHomeTransitionPatch.INITIAL) ? 1 : 0))
            throw new AssertionError("Missing/duplicate staged Home hooks");
        var nativeMethod = NuvioRemainingEpisodesPatch.unique(new MutableClass(original), "invokeSuspend", 1);
        if (!NuvioPlaybackButtonsPatch.fingerprint(method).equals(NuvioPlaybackButtonsPatch.fingerprint(nativeMethod)) ||
            !NuvioPreferredAddonPatch.tryLayout(method).equals(NuvioPreferredAddonPatch.tryLayout(nativeMethod)))
            throw new AssertionError("Changed native final publication, branches or exception layout");
    }
}
