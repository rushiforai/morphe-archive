package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

public final class VerifyPilloLocalBackup {
    static void check(boolean condition, String reason) { if (!condition) throw new AssertionError(reason); }
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = new ArrayList<>();
        for (File file : Objects.requireNonNull(new File(args[0]).listFiles((dir, name) -> name.matches("classes\\d*\\.dex"))))
            try (InputStream input = new BufferedInputStream(new FileInputStream(file))) { classes.addAll(DexBackedDexFile.fromInputStream(null, input).getClasses()); }
        PilloLocalBackupPatch.validate(classes);
        List<ClassDef> changed = new ArrayList<>(classes);
        changed.removeIf(c -> c.getType().startsWith("Lxyz/rtrvr/pillo/data/persistence/database/AppDatabase_Impl"));
        try { PilloLocalBackupPatch.validate(changed); throw new AssertionError("Accepted missing schema"); }
        catch (IllegalStateException expected) { }
        MutableClass app = new MutableClass(classes.stream().filter(c -> c.getType().equals(PilloLocalBackupPatch.APP)).findFirst().orElseThrow());
        MutableClass screen = new MutableClass(classes.stream().filter(c -> c.getType().equals(PilloLocalBackupPatch.ACTIVITY)).findFirst().orElseThrow());
        MutableClass settings = new MutableClass(classes.stream().filter(c -> c.getType().equals(PilloLocalBackupPatch.SETTINGS)).findFirst().orElseThrow());
        MutableClass onboarding = new MutableClass(classes.stream().filter(c -> c.getType().equals(PilloLocalBackupPatch.ONBOARDING)).findFirst().orElseThrow());
        MutableClass menu = new MutableClass(classes.stream().filter(c -> c.getType().equals(PilloLocalBackupPatch.RESTORE_MENU)).findFirst().orElseThrow());
        var early = PilloLocalBackupPatch.unique(app.getMethods(), "attachBaseContext", "Landroid/content/Context;");
        var ready = PilloLocalBackupPatch.unique(app.getMethods(), "onCreate");
        var activity = PilloLocalBackupPatch.unique(screen.getMethods(), "onCreate", "Landroid/os/Bundle;");
        for (MutableMethod method : List.of(early, ready, activity)) {
            var before = PilloHybridNotificationPatch.instructions(method); int registers = method.getImplementation().getRegisterCount();
            boolean prepend = method == early;
            if (prepend) PilloLocalBackupPatch.prepend(method);
            else PilloLocalBackupPatch.append(method, method == ready ? "afterCreate" : "attach",
                method == ready ? "Landroid/content/Context;" : "Landroid/app/Activity;", registers - (method == ready ? 1 : 2));
            var after = PilloHybridNotificationPatch.instructions(method);
            check(after.size() == before.size() + 1 && registers == method.getImplementation().getRegisterCount(), "Mutation changed registers or scope");
            int hookIndex = prepend ? 0 : after.size() - 2;
            check(((FiveRegisterInstruction) after.get(hookIndex)).getRegisterC() == registers - (method == activity ? 2 : 1), "Wrong lifecycle receiver");
            for (int i = 0; i < before.size(); i++) check(before.get(i) == after.get(i + (prepend || i == before.size() - 1 ? 1 : 0)), "Native code changed");
            try { PilloLocalBackupPatch.checkNotInstalled(method); throw new AssertionError("Accepted repeated hook"); }
            catch (IllegalStateException expected) { }
        }
        var choice = settings.getMethods().stream().filter(m -> m.getName().equals(PilloLocalBackupPatch.SETTINGS_ACTION)).findFirst().orElseThrow();
        var original = PilloHybridNotificationPatch.instructions(choice);
        PilloLocalBackupPatch.settingsChoice(choice);
        var routed = PilloHybridNotificationPatch.instructions(choice);
        check(routed.size() == original.size() + 5, "Wrong Settings hook size");
        for (int i = 0; i < original.size(); i++) check(original.get(i) == routed.get(i + 5), "Native Google flow changed");
        var branch = (com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction) routed.get(2);
        check(branch.getTarget().getLocation().getIndex() == 5, "Google route returns to hook instead of native flow");
        check(routed.get(4).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT, "Local route does not return before auth gate");
        check(((com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) routed.get(0)).getStartRegister()
            == choice.getImplementation().getRegisterCount() - 4, "Settings callback captures wrong registers");
        var startup = PilloLocalBackupPatch.unique(onboarding.getMethods(), "onCreate", "Landroid/os/Bundle;");
        var startupOriginal = PilloHybridNotificationPatch.instructions(startup);
        PilloLocalBackupPatch.attachOnboarding(startup);
        var startupPatched = PilloHybridNotificationPatch.instructions(startup);
        check(startupPatched.size() == startupOriginal.size() + 1, "Wrong startup hook size");
        check(((FiveRegisterInstruction) startupPatched.get(0)).getRegisterC() == startup.getImplementation().getRegisterCount() - 2,
            "Wrong onboarding activity receiver");
        for (int i = 0; i < startupOriginal.size(); i++) check(startupOriginal.get(i) == startupPatched.get(i + 1), "Native startup changed");
        var restoreMenu = menu.getMethods().stream().filter(m -> m.getName().equals("rememberChooseRestoreDataOption")).findFirst().orElseThrow();
        var menuOriginal = PilloHybridNotificationPatch.instructions(restoreMenu);
        int[] menuRegisters = PilloLocalBackupPatch.menuRegisters(restoreMenu);
        check(menuRegisters[0] == 8 && menuRegisters[1] == 11, "Onboarding native controller/callback registers changed");
        PilloLocalBackupPatch.onboardingChoice(restoreMenu);
        var menuPatched = PilloHybridNotificationPatch.instructions(restoreMenu);
        check(menuPatched.size() == menuOriginal.size() + 3, "Unexpected onboarding mutation");
        for (int i = 0; i < menuOriginal.size() - 1; i++) check(menuOriginal.get(i) == menuPatched.get(i), "Native Compose initialization changed");
        var wrapper = (FiveRegisterInstruction) menuPatched.get(menuOriginal.size() - 1);
        check(wrapper.getRegisterC() == 8 && wrapper.getRegisterD() == 11, "Onboarding captures wrong callbacks");
        try { PilloLocalBackupPatch.onboardingChoice(restoreMenu); throw new AssertionError("Accepted duplicate onboarding hook"); }
        catch (IllegalStateException expected) { }
        DexPool.writeTo(args[1], new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), List.of(app, screen, settings, onboarding, menu)));
        try (InputStream input = new BufferedInputStream(new FileInputStream(args[1]))) { check(DexBackedDexFile.fromInputStream(null, input).getClasses().size() == 5, "DEX reload failed"); }
        System.out.println("PASS: onboarding captures native restore callbacks after Compose initialization; startup activity and menu hooks assemble correctly");
        System.out.println("PASS: native backup/schema contracts; restore precedes locale reads; local Settings route precedes Google auth and preserves cloud flow; native instructions and DEX round-trip verified");
    }
}
