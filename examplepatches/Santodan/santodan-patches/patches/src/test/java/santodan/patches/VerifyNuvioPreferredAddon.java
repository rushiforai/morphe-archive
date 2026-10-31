package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioPreferredAddon {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid preferred add-on contract accepted");
    }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var c : DexBackedDexFile.fromInputStream(null, input).getClasses()) check(classes.put(c.getType(), c) == null);
                }
        }
        MutableClass snapshot = new MutableClass(classes.get("Lba/o4;"));
        MutableClass selector = new MutableClass(classes.get("Ld9/v1;"));
        MutableClass loader = new MutableClass(classes.get("Lhb/w0;"));
        if (args.length > 2) {
            NuvioPreferredAddonPatch.methods(snapshot, selector).forEach((key, method) ->
                System.out.println("HASH " + key + " " + NuvioPlaybackButtonsPatch.fingerprint(method)));
            NuvioPreferredAddonPatch.loaderMethods(loader, selector).forEach((key, method) ->
                System.out.println("HASH " + key + " " + NuvioPlaybackButtonsPatch.fingerprint(method)));
            for (var method : classes.get("Lgb/gd;").getMethods()) if (List.of("a", "j").contains(method.getName())) System.out.println(method);
            return;
        }
        NuvioPreferredAddonPatch.validateContracts(type -> new MutableClass(classes.get(type)));
        NuvioPreferredAddonPatch.validate(snapshot, selector);
        NuvioPreferredAddonPatch.validateLoader(loader, selector);
        Map<String, MutableMethod> baseline = new HashMap<>();
        NuvioPreferredAddonPatch.methods(snapshot, selector).forEach((key, method) -> baseline.put(key, new MutableMethod(ImmutableMethod.of(method))));
        NuvioPreferredAddonPatch.loaderMethods(loader, selector).forEach((key, method) -> baseline.put(key, new MutableMethod(ImmutableMethod.of(method))));
        for (String name : List.of("a", "d", "e")) {
            MutableClass missing = new MutableClass(selector);
            missing.getMethods().removeIf(m -> m.getName().equals(name));
            rejected(() -> NuvioPreferredAddonPatch.hook(snapshot, missing));
            MutableClass changed = new MutableClass(selector);
            changed.getMethods().stream().filter(m -> m.getName().equals(name)).findFirst().orElseThrow().getImplementation()
                .replaceInstruction(0, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP));
            rejected(() -> NuvioPreferredAddonPatch.hook(snapshot, changed));
            MutableClass ambiguous = new MutableClass(selector);
            var method = ambiguous.getMethods().stream().filter(m -> m.getName().equals(name)).findFirst().orElseThrow();
            var parameters = new ArrayList<com.android.tools.smali.dexlib2.iface.MethodParameter>(method.getParameters());
            parameters.set(0, new ImmutableMethodParameter("Ljava/lang/Object;", Set.of(), null));
            ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(selector.getType(), name, parameters, method.getReturnType(),
                method.getAccessFlags(), Set.of(), Set.of(), method.getImplementation())));
            rejected(() -> NuvioPreferredAddonPatch.hook(snapshot, ambiguous));
        }
        for (String name : List.of("a", "invokeSuspend")) {
            MutableClass missing = new MutableClass(loader);
            missing.getMethods().removeIf(m -> m.getName().equals(name));
            rejected(() -> NuvioPreferredAddonPatch.hookLoader(missing, selector));
            MutableClass changed = new MutableClass(loader);
            changed.getMethods().stream().filter(m -> m.getName().equals(name)).findFirst().orElseThrow().getImplementation()
                .replaceInstruction(0, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP));
            rejected(() -> NuvioPreferredAddonPatch.hookLoader(changed, selector));
        }
        NuvioPreferredAddonPatch.hook(snapshot, selector);
        NuvioPreferredAddonPatch.hookLoader(loader, selector);
        var selectionEntry = NuvioPreferredAddonPatch.methods(snapshot, selector).get("select");
        var guard = (RegisterRangeInstruction) selectionEntry.getImplementation().getInstructions().get(0);
        check(guard.getStartRegister() == NuvioAnchors.parameter(selectionEntry, 7) && guard.getRegisterCount() == 3);
        check(NuvioPlaybackButtonsPatch.reference((Instruction) guard).contains("autoPlaySelectionEnabled(Ljava/lang/String;ZZ)Z"));
        var applyBody = NuvioRemainingEpisodesPatch.instructions(NuvioPreferredAddonPatch.loaderMethods(loader, selector).get("apply"));
        int choose = NuvioAnchors.unique(applyBody, i -> NuvioRemainingEpisodesPatch.calls(applyBody.get(i), NuvioPreferredAddonPatch.EXTENSION, "choose"), "binge-aware chooser");
        var forwarded = (FiveRegisterInstruction) applyBody.get(choose);
        check(forwarded.getRegisterCount() == 5 && forwarded.getRegisterG() == 10);
        check(NuvioPlaybackButtonsPatch.reference(applyBody.get(choose)).contains("Ljava/lang/String;)Ljava/lang/Object;"));
        rejected(() -> NuvioPreferredAddonPatch.hookLoader(loader, selector));
        rejected(() -> NuvioPreferredAddonPatch.hook(snapshot, selector));
        MutableClass component = new MutableClass(classes.get("Lq8/e;"));
        NuvioPreferredAddonPatch.hookComponent(component);
        rejected(() -> NuvioPreferredAddonPatch.hookComponent(component));
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.toString(), new ImmutableDexFile(Opcodes.getDefault(), List.of(snapshot, selector, component, loader)));
        Map<String, MutableClass> reloaded = new HashMap<>();
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            for (var owner : DexBackedDexFile.fromInputStream(null, input).getClasses()) reloaded.put(owner.getType(), new MutableClass(owner));
        }
        var mutated = new HashMap<>(NuvioPreferredAddonPatch.methods(reloaded.get("Lba/o4;"), reloaded.get("Ld9/v1;")));
        mutated.putAll(NuvioPreferredAddonPatch.loaderMethods(reloaded.get("Lhb/w0;"), reloaded.get("Ld9/v1;")));
        for (var entry : mutated.entrySet()) {
            var method = entry.getValue();
            var code = method.getImplementation();
            var body = NuvioRemainingEpisodesPatch.instructions(method);
            int removed = 0;
            for (int i = body.size() - 1; i >= 0; i--) {
                if (NuvioPlaybackButtonsPatch.reference(body.get(i)).startsWith(NuvioPreferredAddonPatch.EXTENSION)) {
                    int count = entry.getKey().equals("select") ? (i == 0 ? 3 : 4) : 2;
                    if (entry.getKey().equals("apply")) {
                        var branch = (com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t) code.getInstructions().get(i + 3);
                        code.replaceInstruction(i, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t(Opcode.IF_EQZ, 9, branch.getTarget()));
                        for (int n = 0; n < 3; n++) code.removeInstruction(i + 1);
                    } else if (List.of("order", "gate", "regex").contains(entry.getKey())) {
                        var restore = body.get(i + 2);
                        int register = ((OneRegisterInstruction) restore).getRegisterA();
                        code.replaceInstruction(i, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x(restore.getOpcode(), register));
                        code.removeInstruction(i + 1); code.removeInstruction(i + 1);
                    } else for (int n = 0; n < count; n++) code.removeInstruction(i);
                    removed += count;
                }
            }
            check(removed > 0);
            if (!NuvioPlaybackButtonsPatch.fingerprint(method).equals(NuvioPlaybackButtonsPatch.fingerprint(baseline.get(entry.getKey()))))
                throw new AssertionError("Roundtrip scope changed: " + entry.getKey());
            check(NuvioPreferredAddonPatch.tryLayout(method).equals(NuvioPreferredAddonPatch.tryLayout(baseline.get(entry.getKey()))));
        }
        System.out.println("PASS: preferred add-on original contracts, missing/changed/ambiguous/duplicate rejection, mutation scope and DEX roundtrip");
    }
}
