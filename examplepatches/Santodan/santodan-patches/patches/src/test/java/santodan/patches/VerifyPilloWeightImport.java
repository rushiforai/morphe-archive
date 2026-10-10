package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

public final class VerifyPilloWeightImport {
    private static void check(boolean condition, String text) { if (!condition) throw new AssertionError(text); }
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = new ArrayList<>();
        DexBackedDexFile source = null;
        for (File file : Objects.requireNonNull(new File(args[0]).listFiles((dir, name) -> name.matches("classes\\d*\\.dex")))) {
            try (InputStream input = new BufferedInputStream(new FileInputStream(file))) {
                DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, input);
                classes.addAll(dex.getClasses());
                if (dex.getClasses().stream().anyMatch(c -> c.getType().equals(PilloWeightImportPatch.ACTIVITY))) source = dex;
            }
        }
        PilloWeightImportPatch.validate(classes);
        System.out.println("PASS: all native runtime contracts match original Pillo 0.6.20");
        ClassDef originalFooter = classes.stream().filter(c -> c.getType().equals(PilloWeightImportPatch.FOOTER)).findFirst().orElseThrow();
        MutableClass footerClass = new MutableClass(originalFooter);
        var footer = footerClass.getMethods().stream().filter(m -> m.getName().equals("invoke")
            && PilloHybridNotificationPatch.signature(m, "V", "Landroidx/compose/runtime/Composer;", "I")).findFirst().orElseThrow();
        var footerBefore = PilloHybridNotificationPatch.instructions(footer);
        int footerRegisters = footer.getImplementation().getRegisterCount();
        PilloWeightImportPatch.applyFooter(footer);
        var footerAfter = PilloHybridNotificationPatch.instructions(footer);
        check(footerBefore.size() == footerAfter.size() && footerRegisters == footer.getImplementation().getRegisterCount(), "Footer registers or control flow changed");
        int replacements = 0;
        for (int i = 0; i < footerBefore.size(); i++) if (footerBefore.get(i) != footerAfter.get(i)) {
            replacements++;
            var beforeCall = (com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) footerBefore.get(i);
            var afterCall = (com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) footerAfter.get(i);
            check(beforeCall.getStartRegister() == afterCall.getStartRegister() && afterCall.getRegisterCount() == 9,
                "Native Skip/Next arguments were lost");
        }
        check(replacements == 1, "Expected one native footer replacement");
        try { PilloWeightImportPatch.applyFooter(footer); throw new AssertionError("Accepted duplicate footer hook"); }
        catch (IllegalStateException expected) { }
        List<ClassDef> missing = new ArrayList<>(classes);
        missing.removeIf(c -> c.getType().equals(PilloWeightImportPatch.EVENT));
        try { PilloWeightImportPatch.validate(missing); throw new AssertionError("Accepted missing model"); }
        catch (IllegalStateException expected) { }
        ClassDef original = classes.stream().filter(c -> c.getType().equals(PilloWeightImportPatch.ACTIVITY)).findFirst().orElseThrow();
        MutableClass modified = new MutableClass(original);
        var target = modified.getMethods().stream().filter(m -> m.getName().equals("onCreate")).findFirst().orElseThrow();
        var before = PilloHybridNotificationPatch.instructions(target);
        int registers = target.getImplementation().getRegisterCount();
        PilloWeightImportPatch.apply(target);
        var after = PilloHybridNotificationPatch.instructions(target);
        check(after.size() == before.size() + 1, "Unexpected mutation size");
        check(registers == target.getImplementation().getRegisterCount(), "Registers changed");
        for (int i = 0; i < before.size() - 1; i++) check(before.get(i) == after.get(i), "Native instruction changed");
        check(PilloHybridNotificationPatch.calls(after.get(after.size() - 2), PilloWeightImportPatch.EXTENSION,
            "attach", "V", "Landroid/app/Activity;"), "Hook missing");
        check(((FiveRegisterInstruction) after.get(after.size() - 2)).getRegisterC() == registers - 2, "Wrong Activity register");
        try { PilloWeightImportPatch.apply(target); throw new AssertionError("Accepted double patch"); }
        catch (IllegalStateException expected) { }
        List<ClassDef> output = new ArrayList<>(Objects.requireNonNull(source).getClasses());
        output.set(output.indexOf(original), modified);
        output.removeIf(c -> c.getType().equals(PilloWeightImportPatch.FOOTER));
        output.add(footerClass);
        new File(args[1]).getParentFile().mkdirs();
        DexPool.writeTo(args[1], new ImmutableDexFile(source.getOpcodes(), output));
        try (InputStream input = new BufferedInputStream(new FileInputStream(args[1]))) {
            var reloaded = DexBackedDexFile.fromInputStream(null, input);
            var activity = reloaded.getClasses().stream().filter(c -> c.getType().equals(PilloWeightImportPatch.ACTIVITY)).findFirst().orElseThrow();
            var method = new ArrayList<com.android.tools.smali.dexlib2.iface.Method>(); activity.getMethods().forEach(method::add);
            check(PilloHybridNotificationPatch.instructions(method.stream().filter(m -> m.getName().equals("onCreate")).findFirst().orElseThrow())
                .stream().anyMatch(i -> PilloHybridNotificationPatch.calls(i, PilloWeightImportPatch.EXTENSION, "attach", "V", "Landroid/app/Activity;")), "Hook lost after write");
        }
        System.out.println("PASS: one Activity hook, native instructions preserved, missing models and double patch rejected, DEX writes/reloads");
        System.out.println("PASS: native weight footer captures original Skip/Next controls and Compose arguments without changing registers or branches");
    }
}
