package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import java.io.InputStream;
import java.util.*;
import kotlin.Unit;

/** Independent local backup transport with restore before any Pillo stores initialize. */
public final class PilloLocalBackupPatch {
    public static final String NAME = "Pillo - Local backup and restore";
    static final String ACTIVITY = "Lxyz/rtrvr/pillo/ui/backupandrestore/BackupAndRestoreActivity;";
    static final String APP = "Lxyz/rtrvr/pillo/PilloApp;";
    static final String EXTENSION = "Lsoftware/santodan/extension/pillobackup/PilloLocalBackup;";
    static final String SETTINGS = "Lxyz/rtrvr/pillo/ui/settings/components/SettingsOtherEntriesKt$SettingsOtherEntries$1$2;";
    static final String SETTINGS_ACTION = "invoke$lambda$7$lambda$6";
    static final String ONBOARDING = "Lxyz/rtrvr/pillo/ui/onboarding/OnboardingActivity;";
    static final String RESTORE_MENU = "Lxyz/rtrvr/pillo/ui/onboarding/components/ChooseRestoreDataOptionContentKt;";
    static final String CONTROLLER = "Lxyz/rtrvr/pillo/extensions/BottomSheetController;";
    static final String CALLBACKS = RESTORE_MENU.substring(0, RESTORE_MENU.length() - 1) + "$rememberChooseRestoreDataOption$1;";
    private PilloLocalBackupPatch() {}

    public static BytecodePatch getPilloLocalBackupPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds local-file export and restore of Pillo's database, settings and app-managed files, without Google sign-in. Restore replaces current data, keeps a recovery backup and restarts Pillo.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("xyz.rtrvr.pillo", "Pillo", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget("0.6.20", false, null)), false));
                builder.extendWith(PilloLocalBackupPatch::extensionStream);
                builder.execute(context -> {
                    if (!"xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        || !"0.6.20".equals(context.getPackageMetadata().getVersionName())) throw unsupported("Expected original Pillo 0.6.20");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    validate(classes);
                    MutableMethod screen = unique(context.mutableClassDefBy(ACTIVITY).getMethods(), "onCreate", "Landroid/os/Bundle;");
                    MutableMethod early = unique(context.mutableClassDefBy(APP).getMethods(), "attachBaseContext", "Landroid/content/Context;");
                    MutableMethod ready = unique(context.mutableClassDefBy(APP).getMethods(), "onCreate");
                    MutableMethod onboarding = unique(context.mutableClassDefBy(ONBOARDING).getMethods(), "onCreate", "Landroid/os/Bundle;");
                    MutableMethod restoreMenu = context.mutableClassDefBy(RESTORE_MENU).getMethods().stream()
                        .filter(m -> m.getName().equals("rememberChooseRestoreDataOption")).findFirst().orElseThrow();
                    MutableMethod settings = context.mutableClassDefBy(SETTINGS).getMethods().stream()
                        .filter(m -> m.getName().equals(SETTINGS_ACTION) && m.getParameterTypes().size() == 4)
                        .findFirst().orElseThrow(() -> unsupported("Missing Settings backup action"));
                    // Check all three mutations before changing any method.
                    endIndex(screen); endIndex(ready); checkNotInstalled(onboarding); menuRegisters(restoreMenu);
                    checkNotInstalled(early);
                    checkNotInstalled(settings);
                    append(screen, "attach", "Landroid/app/Activity;", screen.getImplementation().getRegisterCount() - 2);
                    prepend(early);
                    append(ready, "afterCreate", "Landroid/content/Context;", ready.getImplementation().getRegisterCount() - 1);
                    settingsChoice(settings);
                    attachOnboarding(onboarding);
                    onboardingChoice(restoreMenu);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static IllegalStateException unsupported(String reason) { return new IllegalStateException("Unsupported Pillo local backup bytecode: " + reason); }
    static MutableMethod unique(Collection<MutableMethod> methods, String name, String... parameters) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : methods) if (method.getName().equals(name) && PilloHybridNotificationPatch.signature(method, "V", parameters)) matches.add(method);
        if (matches.size() != 1) throw unsupported("Missing or ambiguous " + name);
        return matches.get(0);
    }
    static void requireMethod(List<? extends ClassDef> classes, String owner, String name, String result, String... parameters) {
        long matches = classes.stream().filter(c -> owner.equals(c.getType())).flatMap(c -> {
            List<Method> methods = new ArrayList<>(); c.getMethods().forEach(methods::add); return methods.stream();
        }).filter(m -> name.equals(m.getName()) && PilloHybridNotificationPatch.signature(m, result, parameters)).count();
        if (matches != 1) throw unsupported("Missing or ambiguous " + owner + "->" + name);
    }
    static void validate(List<? extends ClassDef> classes) {
        requireMethod(classes, ONBOARDING, "onCreate", "V", "Landroid/os/Bundle;");
        requireMethod(classes, RESTORE_MENU, "rememberChooseRestoreDataOption", CONTROLLER,
            "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/Composer;", "I");
        requireMethod(classes, CONTROLLER, "open", "V", "Ljava/lang/Object;");
        requireMethod(classes, CONTROLLER, "close", "V");
        requireMethod(classes, CALLBACKS, "<init>", "V", "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;");
        for (String name : List.of("$onClickRestoreViaMedisafe", "$onClickRestoreViaPilloAccount")) {
            boolean found = classes.stream().filter(c -> CALLBACKS.equals(c.getType())).anyMatch(c -> {
                for (Field field : c.getInstanceFields()) if (field.getName().equals(name)
                    && field.getType().equals("Lkotlin/jvm/functions/Function0;")) return true;
                return false;
            });
            if (!found) throw unsupported("Missing onboarding callback " + name);
        }
        requireMethod(classes, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;");
        requireMethod(classes, APP, "attachBaseContext", "V", "Landroid/content/Context;");
        requireMethod(classes, APP, "onCreate", "V");
        requireMethod(classes, SETTINGS, SETTINGS_ACTION, "Lkotlin/Unit;",
            "Lkotlin/jvm/functions/Function0;", "Landroid/content/Context;", "Landroidx/activity/ComponentActivity;", "Lkotlin/jvm/functions/Function0;");
        requireMethod(classes, APP, "getAlarmAuditScheduler", "Lxyz/rtrvr/pillo/audit/AlarmAuditScheduler;");
        requireMethod(classes, "Lxyz/rtrvr/pillo/audit/AlarmAuditScheduler;", "schedule", "V");
        requireMethod(classes, "Lxyz/rtrvr/pillo/data/persistence/backup/PilloDatabaseBackUpHelper;", "<init>", "V");
        requireMethod(classes, "Lxyz/rtrvr/pillo/data/persistence/backup/PilloDatabaseBackUpHelper;", "doBackup", "V",
            "Ljava/io/File;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function3;");
        boolean schema = false, name = false, prefs = false;
        for (ClassDef owner : classes) {
            if (!owner.getType().startsWith("Lxyz/rtrvr/pillo/data/persistence/database/AppDatabase_Impl")
                && !owner.getType().equals("Lxyz/rtrvr/pillo/data/persistence/database/AppDatabaseManager;")
                && !owner.getType().equals("Lxyz/rtrvr/pillo/di/PersistenceModule;")) continue;
            for (Method method : owner.getMethods())
            for (Instruction instruction : PilloHybridNotificationPatch.instructions(method))
                if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof StringReference) {
                    String value = ((StringReference) ((ReferenceInstruction) instruction).getReference()).getString();
                    if (owner.getType().startsWith("Lxyz/rtrvr/pillo/data/persistence/database/AppDatabase_Impl") && value.equals("acdc24b1947a76c496bdc3ac20b3d60e")) schema = true;
                    if (owner.getType().equals("Lxyz/rtrvr/pillo/data/persistence/database/AppDatabaseManager;") && value.equals("pillo.db")) name = true;
                    if (owner.getType().equals("Lxyz/rtrvr/pillo/di/PersistenceModule;") && value.equals("pillo_preferences")) prefs = true;
                }
        }
        if (!schema || !name || !prefs) throw unsupported("Database identity, filename or preference store changed");
    }
    static void checkNotInstalled(MutableMethod method) {
        for (Instruction instruction : PilloHybridNotificationPatch.instructions(method))
            if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference().toString().startsWith(EXTENSION + "->"))
                throw unsupported("Local backup is already installed");
    }
    static int endIndex(MutableMethod method) {
        checkNotInstalled(method);
        List<Instruction> instructions = PilloHybridNotificationPatch.instructions(method);
        long returns = instructions.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count();
        if (returns != 1 || instructions.isEmpty() || instructions.get(instructions.size() - 1).getOpcode() != Opcode.RETURN_VOID)
            throw unsupported("Lifecycle return layout changed");
        return instructions.size() - 1;
    }
    static void append(MutableMethod method, String name, String parameter, int register) {
        int index = endIndex(method);
        if (register < 0 || register > 15) throw unsupported("Lifecycle registers changed");
        method.getImplementation().addInstruction(index, hook(name, parameter, register));
    }
    static void prepend(MutableMethod method) {
        checkNotInstalled(method);
        int register = method.getImplementation().getRegisterCount() - 1;
        if (register < 0 || register > 15) throw unsupported("Base context register changed");
        method.getImplementation().addInstruction(0, hook("beforeAttach", "Landroid/content/Context;", register));
    }
    static void attachOnboarding(MutableMethod method) {
        checkNotInstalled(method);
        int receiver = method.getImplementation().getRegisterCount() - 2;
        if (receiver < 0 || receiver > 15) throw unsupported("Onboarding activity registers changed");
        // Store only a weak reference here; show UI later when the user opens restore.
        // onCreate has multiple return paths, all of which must register the host.
        method.getImplementation().addInstruction(0, hook("attachOnboarding", "Landroid/app/Activity;", receiver));
    }
    static BuilderInstruction35c hook(String name, String parameter, int register) {
        return new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, register, 0, 0, 0, 0,
            new ImmutableMethodReference(EXTENSION, name, List.of(parameter), "V"));
    }
    static void settingsChoice(MutableMethod method) {
        checkNotInstalled(method);
        int start = method.getImplementation().getRegisterCount() - 4;
        if (start < 1 || (method.getAccessFlags() & 8) == 0) throw unsupported("Settings callback registers or static signature changed");
        var implementation = method.getImplementation();
        var nativeEntry = implementation.newLabelForIndex(0);
        List<com.android.tools.smali.dexlib2.builder.BuilderInstruction> added = List.of(
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, 4, new ImmutableMethodReference(EXTENSION, "chooseTransport",
                List.of("Ljava/lang/Object;", "Landroid/content/Context;", "Landroid/app/Activity;", "Ljava/lang/Object;"), "Z")),
            new BuilderInstruction11x(Opcode.MOVE_RESULT, 0),
            new BuilderInstruction21t(Opcode.IF_EQZ, 0, nativeEntry),
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 0, new ImmutableFieldReference("Lkotlin/Unit;", "INSTANCE", "Lkotlin/Unit;")),
            new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        for (int i = 0; i < added.size(); i++) implementation.addInstruction(i, added.get(i));
    }
    static int[] menuRegisters(MutableMethod method) {
        checkNotInstalled(method);
        List<Instruction> instructions = PilloHybridNotificationPatch.instructions(method);
        int holder = -1, holderIndex = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (instruction.getOpcode() == Opcode.NEW_INSTANCE && instruction instanceof ReferenceInstruction
                && ((ReferenceInstruction) instruction).getReference().toString().equals(CALLBACKS)) {
                if (holder != -1) throw unsupported("Ambiguous onboarding callbacks");
                holder = ((OneRegisterInstruction) instruction).getRegisterA(); holderIndex = i;
            }
        }
        if (holder < 0 || instructions.get(instructions.size() - 1).getOpcode() != Opcode.RETURN_OBJECT
            || instructions.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count() != 1)
            throw unsupported("Onboarding menu layout changed");
        // The callback holder must survive until the return hook.
        for (int i = holderIndex + 1; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (instruction.getOpcode().setsRegister() && instruction instanceof OneRegisterInstruction
                && ((OneRegisterInstruction) instruction).getRegisterA() == holder)
                throw unsupported("Onboarding callbacks register overwritten");
        }
        int result = ((OneRegisterInstruction) instructions.get(instructions.size() - 1)).getRegisterA();
        if (holder > 15 || result > 15 || holder == result) throw unsupported("Onboarding registers changed");
        return new int[]{result, holder};
    }
    static void onboardingChoice(MutableMethod method) {
        int[] registers = menuRegisters(method);
        int index = PilloHybridNotificationPatch.instructions(method).size() - 1;
        method.getImplementation().addInstruction(index++, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2,
            registers[0], registers[1], 0, 0, 0, new ImmutableMethodReference(EXTENSION, "onboardingChoice",
                List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(index++, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, registers[0]));
        method.getImplementation().addInstruction(index, new BuilderInstruction21c(Opcode.CHECK_CAST, registers[0], new ImmutableTypeReference(CONTROLLER)));
    }
    static InputStream extensionStream() {
        InputStream stream = PilloLocalBackupPatch.class.getClassLoader().getResourceAsStream("extensions/pillo-local-backup.mpe");
        if (stream == null) throw new IllegalStateException("Missing bundled Pillo local backup extension");
        return stream;
    }
}
