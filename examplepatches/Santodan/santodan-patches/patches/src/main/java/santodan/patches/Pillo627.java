package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;
import kotlin.Unit;

/** Exact 0.6.27 contracts. Historical patches and their runtime remain separate. */
final class Pillo627 {
    static final String ROOT = "Lxyz/rtrvr/pillo/";
    static final String BACKUP = "Lsoftware/santodan/extension/pillobackup/PilloLocalBackup627;";
    static final String IMPORT = "Lsoftware/santodan/extension/pilloweight/PilloWeightImport627;";
    static final String SUMMARY = "Lsoftware/santodan/extension/pillosummary/PilloWeightSummary627;";
    static final String PROGRESS = "Lsoftware/santodan/extension/pillosummary/PilloProgressWeight627;";
    static final String SETTINGS = ROOT + "ui/settings/components/SettingsOtherEntriesKt;";
    static final String SETTINGS_ACTION = "SettingsOtherEntries$lambda$0$2$2$0";
    static final String MENU = ROOT + "ui/onboarding/components/ChooseRestoreDataOptionContentKt;";
    static final String CONTROLLER = ROOT + "ui/compose/BottomSheetController;";
    static final String CARD = ROOT + "ui/tracker/common/components/weight/WeightLineChartKt;";
    static final String CARD_RENDER = "WeightLineChart_TN_CM5M$lambda$12$0";
    static final String PROGRESS_SCREEN = ROOT + "ui/report/ProgressScreenKt;";
    static final String PROGRESS_CONTENT = "ProgressScreen$lambda$5";

    static List<ClassDef> classes(BytecodePatchContext context) {
        List<ClassDef> result = new ArrayList<>();
        context.classDefForEach(c -> { result.add(c); return Unit.INSTANCE; });
        return result;
    }
    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Pillo 0.6.27 bytecode: " + reason);
    }
    static MutableMethod method(BytecodePatchContext context, String owner, String name) {
        var methods = context.mutableClassDefBy(owner).getMethods().stream()
            .filter(m -> m.getName().equals(name)).collect(java.util.stream.Collectors.toList());
        if (methods.size() != 1) throw unsupported("Missing or ambiguous " + owner + "->" + name);
        return methods.get(0);
    }
    static void require(List<? extends ClassDef> classes, String descriptor) {
        String owner = descriptor.substring(0, descriptor.indexOf("->"));
        long count = classes.stream().filter(c -> c.getType().equals(owner)).flatMap(c -> {
            List<Method> ms = new ArrayList<>(); c.getMethods().forEach(ms::add); return ms.stream();
        }).filter(m -> m.toString().equals(descriptor)).count();
        if (count != 1) throw unsupported("Missing or ambiguous contract " + descriptor);
    }
    static void requireField(List<? extends ClassDef> classes, String descriptor, boolean isStatic) {
        String owner = descriptor.substring(0, descriptor.indexOf("->"));
        long count = classes.stream().filter(c -> c.getType().equals(owner)).flatMap(c -> {
            List<Field> fields = new ArrayList<>(); c.getFields().forEach(fields::add); return fields.stream();
        }).filter(f -> f.toString().equals(descriptor) && ((f.getAccessFlags() & 8) != 0) == isStatic).count();
        if (count != 1) throw unsupported("Missing or ambiguous field " + descriptor);
    }
    static void hybridNotification(BytecodePatchContext context) {
        var classes = classes(context);
        require(classes, Pillo627Alarm.POWER_UTIL + "->isTrulyInteractive(Landroid/content/Context;)Z");
        requireField(classes, Pillo627Alarm.POWER_UTIL + "->INSTANCE:" + Pillo627Alarm.POWER_UTIL, true);
        var match = Pillo627Alarm.findUnique(classes);
        var target = context.mutableClassDefBy(Pillo627Alarm.TARGET).getMethods().stream()
            .filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        Pillo627Alarm.apply(target, match);
    }
    static void checkNotInstalled(MutableMethod method) {
        for (var i : PilloHybridNotificationPatch.instructions(method))
            if (i instanceof ReferenceInstruction && ((ReferenceInstruction)i).getReference().toString()
                .startsWith("Lsoftware/santodan/extension/pillo")) throw unsupported("Hook already installed: " + method);
    }
    static void lifecycle(MutableMethod method, String extension, String hook, String parameter, boolean early) {
        checkNotInstalled(method);
        var ins = PilloHybridNotificationPatch.instructions(method);
        int register = method.getImplementation().getRegisterCount() - method.getParameterTypes().size() - 1;
        if (hook.equals("beforeAttach")) register++;
        if (register < 0 || register > 65535) throw unsupported("Lifecycle registers changed");
        int index = early ? 0 : ins.size() - 1;
        if (!early && (ins.get(index).getOpcode() != Opcode.RETURN_VOID
            || ins.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count() != (hook.equals("afterCreate") ? 2 : 1)))
            throw unsupported("Lifecycle return layout changed");
        method.getImplementation().addInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            register, 1, new ImmutableMethodReference(extension, hook, List.of(parameter), "V")));
    }
    static void localBackup(BytecodePatchContext context) {
        var classes = classes(context);
        validateBackup(classes);
        var screen = method(context, PilloLocalBackupPatch.ACTIVITY, "onCreate");
        var early = method(context, PilloLocalBackupPatch.APP, "attachBaseContext");
        var ready = method(context, PilloLocalBackupPatch.APP, "onCreate");
        var onboarding = method(context, PilloLocalBackupPatch.ONBOARDING, "onCreate");
        var settings = method(context, SETTINGS, SETTINGS_ACTION);
        var menu = method(context, MENU, "rememberChooseRestoreDataOption");
        for (var m : List.of(screen, early, ready, onboarding, settings, menu)) checkNotInstalled(m);
        var ins = PilloHybridNotificationPatch.instructions(menu);
        if (ins.get(ins.size()-1).getOpcode() != Opcode.RETURN_OBJECT
            || ins.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count() != 1)
            throw unsupported("Onboarding menu return changed");
        int returned = ((OneRegisterInstruction)ins.get(ins.size()-1)).getRegisterA();
        // p0 is reused for the result; capture callbacks before native code runs.
        int start = menu.getImplementation().getRegisterCount() - 4;
        menu.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            start, 2, new ImmutableMethodReference(BACKUP, "rememberRestoreCallbacks",
                List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
        int end = PilloHybridNotificationPatch.instructions(menu).size() - 1;
        menu.getImplementation().addInstruction(end++, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1,
            returned, 0, 0, 0, 0, new ImmutableMethodReference(BACKUP, "onboardingChoice",
                List.of("Ljava/lang/Object;"), "Ljava/lang/Object;")));
        menu.getImplementation().addInstruction(end++, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, returned));
        menu.getImplementation().addInstruction(end, new BuilderInstruction21c(Opcode.CHECK_CAST, returned,
            new ImmutableTypeReference(CONTROLLER)));
        var body = settings.getImplementation();
        var nativeEntry = body.newLabelForIndex(0);
        int first = body.getRegisterCount() - 4;
        body.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, first, 4,
            new ImmutableMethodReference(BACKUP, "chooseTransport", List.of("Ljava/lang/Object;",
                "Landroid/content/Context;", "Landroid/app/Activity;", "Ljava/lang/Object;"), "Z")));
        body.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        body.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, nativeEntry));
        body.addInstruction(3, new BuilderInstruction21c(Opcode.SGET_OBJECT, 0,
            new ImmutableFieldReference("Lkotlin/Unit;", "a", "Lkotlin/Unit;")));
        body.addInstruction(4, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        lifecycle(screen, BACKUP, "attach", "Landroid/app/Activity;", false);
        lifecycle(early, BACKUP, "beforeAttach", "Landroid/content/Context;", true);
        lifecycle(ready, BACKUP, "afterCreate", "Landroid/content/Context;", false);
        lifecycle(onboarding, BACKUP, "attachOnboarding", "Landroid/app/Activity;", true);
    }
    static void validateBackup(List<? extends ClassDef> classes) {
        require(classes, "Landroidx/room/Room;->databaseBuilder(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/RoomDatabase$Builder;");
        require(classes, "Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;");
        require(classes, "Landroidx/room/RoomDatabase$Builder;->build()Landroidx/room/RoomDatabase;");
        require(classes, "Landroidx/room/RoomDatabase;->getOpenHelper()Llb/f;");
        require(classes, "Landroidx/room/RoomDatabase;->close()V");
        require(classes, "Llb/f;->getWritableDatabase()Llb/a;");
        require(classes, "Llb/a;->query(Ljava/lang/String;)Landroid/database/Cursor;");
        requireField(classes, ROOT + "data/persistence/database/AppDatabase;->Companion:" + ROOT + "data/persistence/database/AppDatabase$Companion;", true);
        for (String step : List.of("51_52", "52_53")) {
            String migration = ROOT + "data/persistence/database/migrations/Migration" + step.replace("_", "To") + ";";
            require(classes, ROOT + "data/persistence/database/AppDatabase$Companion;->getMIGRATION_" + step + "()" + migration);
            require(classes, migration + "->migrate(Llb/a;)V");
        }
        require(classes, MENU + "->rememberChooseRestoreDataOption(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lg3/q;I)" + CONTROLLER);
        require(classes, CONTROLLER + "->open(Ljava/lang/Object;)V");
        require(classes, CONTROLLER + "->close()V");
        require(classes, SETTINGS + "->" + SETTINGS_ACTION + "(Lkotlin/jvm/functions/Function0;Landroid/content/Context;Landroidx/activity/ComponentActivity;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;");
        require(classes, ROOT + "data/persistence/backup/PilloDatabaseBackUpHelper;->doBackup(Ljava/io/File;Ljava/lang/String;Lkotlin/jvm/functions/Function3;)V");
        require(classes, ROOT + "data/persistence/backup/PilloDatabaseBackUpHelper;-><init>()V");
        requireField(classes, "Lkotlin/Unit;->a:Lkotlin/Unit;", true);
        require(classes, ROOT + "PilloApp;->getAlarmAuditScheduler()" + ROOT + "domain/audit/AlarmAuditScheduler;");
        require(classes, ROOT + "domain/audit/AlarmAuditScheduler;->schedule()V");
        boolean schema = false, name = false, prefs = false;
        for (var c : classes) {
            if (!c.getType().startsWith(ROOT + "data/persistence/database/AppDatabase_Impl")
                && !c.getType().equals(ROOT + "data/persistence/database/AppDatabaseManager;")
                && !c.getType().equals(ROOT + "di/PersistenceModule;")) continue;
            for (var m : c.getMethods()) for (var i : PilloHybridNotificationPatch.instructions(m)) {
            if (!(i instanceof ReferenceInstruction) || !(((ReferenceInstruction)i).getReference() instanceof StringReference)) continue;
            String value = ((StringReference)((ReferenceInstruction)i).getReference()).getString();
            if (c.getType().startsWith(ROOT + "data/persistence/database/AppDatabase_Impl") && value.equals("0b0400f334f4d39ec5f093b3c677e070")) schema = true;
            if (c.getType().equals(ROOT + "data/persistence/database/AppDatabaseManager;") && value.equals("pillo.db")) name = true;
            if (c.getType().equals(ROOT + "di/PersistenceModule;") && value.equals("pillo_preferences")) prefs = true;
        }
        }
        if (!schema || !name || !prefs) throw unsupported("Database identity or stores changed");
    }
    static void weightImport(BytecodePatchContext context) {
        var classes = classes(context);
        Pillo627Import.validate(classes);
        var activity = method(context, PilloWeightImportPatch.ACTIVITY, "onCreate");
        var footer = method(context, ROOT + "ui/tracker/common/record/layout/weight/TrackerRecordLogLayoutWeightKt;", "LogWeightLayout_Uww_Ezs$lambda$1");
        redirect(footer, PilloWeightImportPatch.BOTTOM, "LoggingBottomBar", IMPORT, "footer");
        lifecycle(activity, IMPORT, "attach", "Landroid/app/Activity;", false);
    }
    static void redirect(MutableMethod method, String owner, String name, String extension, String hook) {
        var ins = PilloHybridNotificationPatch.instructions(method);
        List<Integer> matches = new ArrayList<>();
        for (int i = 0; i < ins.size(); i++) if (ins.get(i) instanceof ReferenceInstruction) {
            var ref = ((ReferenceInstruction)ins.get(i)).getReference();
            if (ref instanceof MethodReference && ((MethodReference)ref).getDefiningClass().equals(owner)
                && ((MethodReference)ref).getName().equals(name)) matches.add(i);
        }
        if (matches.size() != 1) throw unsupported("Missing/ambiguous/already patched " + owner + "->" + name);
        int index = matches.get(0);
        var instruction = ins.get(index);
        var ref = (MethodReference)((ReferenceInstruction)instruction).getReference();
        List<String> parameters = new ArrayList<>();
        ref.getParameterTypes().forEach(t -> parameters.add(t.toString().startsWith("L")
            && !t.toString().equals("Ljava/lang/String;") && !t.toString().equals("Ljava/util/List;") ? "Ljava/lang/Object;" : t.toString()));
        String result = (hook.equals("rememberFilter") || hook.equals("render")) ? "Ljava/lang/Object;" : ref.getReturnType();
        var replacement = new ImmutableMethodReference(extension, hook, parameters, result);
        if (instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE) {
            var call = (RegisterRangeInstruction)instruction;
            method.getImplementation().replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                call.getStartRegister(), call.getRegisterCount(), replacement));
        } else if (instruction.getOpcode() == Opcode.INVOKE_STATIC) {
            var call = (FiveRegisterInstruction)instruction;
            method.getImplementation().replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
                call.getRegisterCount(), call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG(), replacement));
        } else throw unsupported("Unexpected hook invocation " + instruction.getOpcode());
        if (hook.equals("rememberFilter") || hook.equals("render")) {
            int register = ((OneRegisterInstruction)ins.get(index+1)).getRegisterA();
            method.getImplementation().addInstruction(index+2, new BuilderInstruction21c(Opcode.CHECK_CAST,
                register, new ImmutableTypeReference(ref.getReturnType())));
        }
    }
    static void weightSummary(BytecodePatchContext context) {
        Pillo627Summary.apply(context);
    }
    static void progressWeight(BytecodePatchContext context) {
        Pillo627Progress.apply(context);
    }
}
