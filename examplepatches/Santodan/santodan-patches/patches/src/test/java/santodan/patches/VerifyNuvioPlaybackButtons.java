package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;
import software.santodan.extension.nuviobuttons.ButtonLayout;

public final class VerifyNuvioPlaybackButtons {
    private static void check(boolean value) { if (!value) throw new AssertionError(); }
    private static void rejected(MutableClass main, MutableClass more) {
        try { NuvioPlaybackButtonsPatch.hook(main, more); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Changed, missing, ambiguous or already-patched input accepted");
    }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (ClassDef c : DexBackedDexFile.fromInputStream(null, input).getClasses())
                        check(classes.put(c.getType(), c) == null);
                }
        }
        ClassDef originalMain = classes.get("Lbb/ai;"), originalMore = classes.get("Lbb/fi;");
        MutableClass main = new MutableClass(originalMain), more = new MutableClass(originalMore);
        NuvioPlaybackButtonsPatch.validateRuntime(new MutableClass(classes.get("Lbb/hk;")),
            new MutableClass(classes.get("Lv/b0;")), new MutableClass(classes.get("Lv/c0;")));
        NuvioPlaybackButtonsPatch.validate(main, more);
        for (String signature : NuvioPlaybackButtonsPatch.UI_CONTRACTS)
            NuvioPlaybackButtonsPatch.validateUiMethod(new MutableClass(classes.get(signature.substring(0, signature.indexOf("->")))), signature);
        System.out.println("MAIN fingerprint=" + NuvioPlaybackButtonsPatch.fingerprint(NuvioPlaybackButtonsPatch.invoke(main, 2)));
        System.out.println("MORE fingerprint=" + NuvioPlaybackButtonsPatch.fingerprint(NuvioPlaybackButtonsPatch.invoke(more, 3)));
        MutableClass missing = new MutableClass(originalMore);
        missing.getMethods().removeIf(m -> m.getName().equals("invoke"));
        rejected(new MutableClass(originalMain), missing);
        MutableClass ambiguous = new MutableClass(originalMain);
        Method nativeInvoke = NuvioPlaybackButtonsPatch.invoke(ambiguous, 2);
        ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(ambiguous.getType(), "invoke",
            List.of(new ImmutableMethodParameter("Ljava/lang/String;", Set.of(), null), nativeInvoke.getParameters().get(1)),
            nativeInvoke.getReturnType(), nativeInvoke.getAccessFlags(), nativeInvoke.getAnnotations(), nativeInvoke.getHiddenApiRestrictions(), nativeInvoke.getImplementation())));
        rejected(ambiguous, new MutableClass(originalMore));
        MutableClass changed = new MutableClass(originalMore);
        MutableMethod invoke = NuvioPlaybackButtonsPatch.invoke(changed, 3);
        for (int i = 0; i < invoke.getImplementation().getInstructions().size(); i++)
            if (NuvioPlaybackButtonsPatch.reference(invoke.getImplementation().getInstructions().get(i)).equals(NuvioPlaybackButtonsPatch.BUTTON)) {
                invoke.getImplementation().replaceInstruction(i, new BuilderInstruction10x(Opcode.NOP)); break;
            }
        rejected(new MutableClass(originalMain), changed);
        MutableClass sameCalls = new MutableClass(originalMain);
        NuvioPlaybackButtonsPatch.invoke(sameCalls, 2).getImplementation().replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(sameCalls, new MutableClass(originalMore));
        NuvioPlaybackButtonsPatch.hook(main, more);
        rejected(main, more);
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.getPath(), new ImmutableDexFile(Opcodes.getDefault(), List.of(main, more)));
        int calls = 0;
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            for (ClassDef c : DexBackedDexFile.fromInputStream(null, input).getClasses()) for (Method m : c.getMethods())
                if (m.getImplementation() != null) for (var i : m.getImplementation().getInstructions())
                    if (NuvioPlaybackButtonsPatch.reference(i).startsWith(NuvioPlaybackButtonsPatch.EXTENSION)) calls++;
        }
        check(calls == 17); // 13 controls, More toggle, animation bridge, and native content registration.
        ButtonLayout defaults = ButtonLayout.defaults();
        check(!defaults.enabled && defaults.more.size() == 6 && defaults.hidden.isEmpty());
        ButtonLayout value = defaults.change("speed", "group").change("speed", "left").change("audio", "visibility").enabled(true);
        check(!value.more.contains("speed") && value.order.indexOf("speed") < value.order.indexOf("chapters") && value.hidden.contains("audio"));
        value = value.change("speed", "right").change("audio", "visibility");
        check(!value.hidden.contains("audio"));
        ButtonLayout persisted = new ButtonLayout(value.enabled, String.join(",", value.order), String.join(",", value.hidden), String.join(",", value.more));
        check(value.order.equals(persisted.order) && value.more.equals(persisted.more));
        ButtonLayout corrupt = new ButtonLayout(true, "bogus,speed,speed", String.join(",", ButtonLayout.IDS), String.join(",", ButtonLayout.IDS));
        check(corrupt.order.size() == 15 && !corrupt.hidden.contains("play") && !corrupt.more.contains("play"));
        check(corrupt.visible(List.of("play"), false).equals(List.of("play")));
        check(value.visible(List.of("play", "speed"), false).contains("speed"));
        check(!value.visible(List.of("play"), false).contains("next"));
        System.out.println("PASS: original beta.7 contracts, missing/ambiguous/changed/duplicate rejection, DEX reload, layout persistence, regrouping, ordering, hidden controls, and focus fallback");
    }
}
