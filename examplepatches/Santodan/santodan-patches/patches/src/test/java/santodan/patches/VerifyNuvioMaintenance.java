package santodan.patches;

import software.santodan.nuvio.NuvioNative;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

/** Real-input anchors must survive instruction movement and fail on ambiguity. */
public final class VerifyNuvioMaintenance {
    static void check(boolean result) { if (!result) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Missing/ambiguous/incompatible contract accepted");
    }
    static MutableMethod method(Map<String, ClassDef> classes, String owner, String name, int parameters) {
        return NuvioRemainingEpisodesPatch.unique(new MutableClass(classes.get(owner)), name, parameters);
    }
    public static void main(String[] args) throws Exception {
        check(ReportNuvioUpdate.sha256(java.nio.file.Path.of(args[0])).equals(NuvioNative.ORIGINAL_SHA256));
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile apk = new ZipFile(args[0])) {
            for (var entry : Collections.list(apk.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(apk.getInputStream(entry))) {
                    for (ClassDef owner : DexBackedDexFile.fromInputStream(null, input).getClasses())
                        check(classes.put(owner.getType(), owner) == null);
                }
        }
        Set<String> definitions = new HashSet<>();
        for (ClassDef owner : classes.values()) {
            for (Method method : owner.getMethods()) definitions.add(method.toString());
            for (Field field : owner.getFields()) definitions.add(field.toString());
        }
        for (var symbol : NuvioNative.class.getFields()) {
            String value = (String) symbol.get(null);
            if (value.equals(NuvioNative.REF_LOCAL_HOME_RESUME)) {
                // This member is generated from the reviewed native observer, rather than present in the original APK.
                var home = new MutableClass(classes.get(NuvioNative.HOME_MODEL_TYPE));
                NuvioMergedProgressPatch.hookHomePipeline(home);
                if (home.getMethods().stream().noneMatch(m -> m.toString().equals(value)))
                    throw new AssertionError("Missing generated Home resume contract: " + value);
                continue;
            }
            if (symbol.getName().endsWith("_TYPE") && !symbol.getName().startsWith("REF_") && !classes.containsKey(value)) throw new AssertionError("Missing contract class: " + symbol.getName());
            if (value.matches("L[^;]+;->(?:[^()]+:[^:]+|[^()]+\\([^)]*\\).+)"))
                if (!definitions.contains(value)) throw new AssertionError("Missing native contract: " + symbol.getName() + " = " + value);
        }
        System.out.println("PASS: original APK provenance and every centralized class/full method/field reference");
        MutableMethod card = method(classes, NuvioNative.CURRENT_STREAM_CARD_TYPE, NuvioNative.CURRENT_STREAM_METHOD, 13);
        int[] original = NuvioCurrentStreamPatch.labelAnchor(card);
        card.getImplementation().addInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        int[] shifted = NuvioCurrentStreamPatch.labelAnchor(card);
        check(shifted[0] == original[0] + 1 && shifted[1] == original[1] && shifted[2] == original[2]);
        card.getImplementation().replaceInstruction(shifted[0] - 1,
            new BuilderInstruction21c(Opcode.CHECK_CAST, 11, new ImmutableTypeReference("Ljava/lang/String;")));
        check(NuvioCurrentStreamPatch.labelAnchor(card)[1] == 11);
        card.getImplementation().addInstruction(shifted[0],
            new BuilderInstruction21c(Opcode.CHECK_CAST, 11, new ImmutableTypeReference("Ljava/lang/String;")));
        rejected(() -> NuvioCurrentStreamPatch.labelAnchor(card));

        MutableMethod apply = method(classes, NuvioNative.STREAM_LOADER_TYPE, "a", 10);
        int[] selection = NuvioPreferredAddonPatch.selectionAnchor(apply);
        apply.getImplementation().addInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        int[] moved = NuvioPreferredAddonPatch.selectionAnchor(apply);
        check(moved[0] == selection[0] + 1 && Arrays.equals(Arrays.copyOfRange(selection, 1, 5), Arrays.copyOfRange(moved, 1, 5)));
        var body = NuvioRemainingEpisodesPatch.instructions(apply);
        var invoke = (RegisterRangeInstruction) body.get(moved[0] - 2);
        var reference = (com.android.tools.smali.dexlib2.iface.reference.MethodReference) ((ReferenceInstruction) body.get(moved[0] - 2)).getReference();
        apply.getImplementation().addInstruction(new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, invoke.getStartRegister(), invoke.getRegisterCount(), reference));
        rejected(() -> NuvioPreferredAddonPatch.selectionAnchor(apply));
        MutableMethod reuse = method(classes, NuvioNative.STREAM_LOADER_TYPE, "invokeSuspend", 1);
        int[] flag = NuvioPreferredAddonPatch.reuseAnchor(reuse);
        reuse.getImplementation().addInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        check(NuvioPreferredAddonPatch.reuseAnchor(reuse)[0] == flag[0] + 1);
        reuse.getImplementation().replaceInstruction(flag[0], new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioPreferredAddonPatch.reuseAnchor(reuse));
        System.out.println("PASS: real DEX anchors survive shifted instructions and title-register changes; missing/ambiguous anchors rejected");

        MutableClass bridge = null;
        try (var input = new BufferedInputStream(new FileInputStream(args[1]))) {
            for (ClassDef owner : DexBackedDexFile.fromInputStream(null, input).getClasses())
                if (owner.getType().equals(NuvioAccessPatch.TYPE)) bridge = new MutableClass(owner);
        }
        if (bridge == null) throw new AssertionError("Bridge missing from the packaged settings extension");
        MutableClass invalid = new MutableClass(bridge);
        var badState = new MutableClass(classes.get(NuvioNative.PLAYER_STATE_TYPE));
        badState.getFields().removeIf(f -> f.getName().equals(NuvioNative.STATE_VIDEO_FIELD));
        Map<String, String> before = new HashMap<>();
        for (MutableMethod method : invalid.getMethods()) if (NuvioAccessPatch.FIELDS.containsKey(method.getName()))
            before.put(method.getName(), NuvioPlaybackButtonsPatch.fingerprint(method));
        rejected(() -> NuvioAccessPatch.install(invalid, type -> type.equals(badState.getType()) ? badState : new MutableClass(classes.get(type))));
        for (MutableMethod method : invalid.getMethods()) if (before.containsKey(method.getName()))
            check(before.get(method.getName()).equals(NuvioPlaybackButtonsPatch.fingerprint(method)));
        NuvioAccessPatch.install(bridge, type -> new MutableClass(classes.get(type)));
        MutableClass installed = bridge;
        rejected(() -> NuvioAccessPatch.install(installed, type -> new MutableClass(classes.get(type))));
        File output = new File(args[2]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.toString(), new ImmutableDexFile(Opcodes.getDefault(), List.of(bridge)));
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            for (ClassDef owner : DexBackedDexFile.fromInputStream(null, input).getClasses())
                for (Method method : owner.getMethods()) if (NuvioAccessPatch.FIELDS.containsKey(method.getName())) {
                    var instructions = new ArrayList<Instruction>(); method.getImplementation().getInstructions().forEach(instructions::add);
                    check(instructions.size() == 6 && instructions.get(0).getOpcode() == Opcode.IF_NEZ &&
                        NuvioAnchors.branchTarget(instructions, 0) == 3 && instructions.get(1).getOpcode() == Opcode.CONST_4 &&
                        instructions.get(2).getOpcode() == Opcode.RETURN_OBJECT && instructions.get(3).getOpcode() == Opcode.CHECK_CAST &&
                        instructions.get(4).getOpcode() == Opcode.IGET_OBJECT && instructions.get(5).getOpcode() == Opcode.RETURN_OBJECT);
                    check(NuvioPlaybackButtonsPatch.reference(instructions.get(4)).equals(NuvioAccessPatch.FIELDS.get(method.getName())));
                }
        }
        System.out.println("PASS: all eight direct native bridges validate atomically, reject duplicates and survive DEX write/reload");
    }
}
