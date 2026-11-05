package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
import kotlin.Unit;

/** 0.6.27 replacement for the external premium patch's obsolete fingerprints. */
public final class PilloPremiumPatch {
    public static final String NAME = "Pillo - Premium and ad-free";
    static final String OWNER = "Lxyz/rtrvr/pillo/data/subscription/SubscriptionStateProvider;";
    static final List<String> SETTERS = List.of("setIsPremiumState", "setIsAdfreeState");
    static final String PROFILE_CALLBACK = "_init_$lambda$0";
    private PilloPremiumPatch() {}

    public static BytecodePatch getPilloPremiumPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Enables premium and ad-free state through Pillo's native subscription setters. For 0.6.27; select instead of an external Unlock Premium patch.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("xyz.rtrvr.pillo", "Pillo", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget("0.6.27", null, false, null, null)), FormFactor.MOBILE, false));
                builder.execute(context -> {
                    if (!"xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        || !"0.6.27".equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected original xyz.rtrvr.pillo 0.6.27");
                    List<Method> matched = validate(Pillo627.classes(context));
                    Method callback = validateProfileCallback(Pillo627.classes(context));
                    List<MutableMethod> mutable = new ArrayList<>();
                    for (Method method : matched) {
                        var candidates = context.mutableClassDefBy(OWNER).getMethods().stream()
                            .filter(m -> m.equals(method)).collect(java.util.stream.Collectors.toList());
                        if (candidates.size() != 1) throw unsupported("Cannot resolve mutable setter " + method);
                        validateSetter(candidates.get(0));
                        mutable.add(candidates.get(0));
                    }
                    MutableMethod mutableCallback = context.mutableClassDefBy(OWNER).getMethods().stream()
                        .filter(m -> m.equals(callback)).findFirst().orElseThrow();
                    validateProfileCallbackMethod(mutableCallback);
                    // Prove every hook before mutation. The listener receives the raw billing
                    // result independently of the setters and otherwise resets user settings.
                    for (MutableMethod method : mutable) apply(method);
                    applyProfileCallback(mutableCallback);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Pillo 0.6.27 premium bytecode: " + reason);
    }
    static List<Method> validate(List<? extends ClassDef> classes) {
        List<ClassDef> owners = new ArrayList<>();
        for (ClassDef c : classes) if (c.getType().equals(OWNER)) owners.add(c);
        if (owners.size() != 1) throw unsupported("Missing or ambiguous subscription provider");
        List<Method> result = new ArrayList<>();
        for (String name : SETTERS) {
            List<Method> matches = new ArrayList<>();
            for (Method m : owners.get(0).getMethods()) if (m.getName().equals(name)) matches.add(m);
            if (matches.size() != 1) throw unsupported("Missing or ambiguous setter " + name);
            Method setter = matches.get(0);
            validateSetter(setter);
            String coroutine = OWNER.substring(0, OWNER.length()-1) + "$" + name + "$1;";
            Pillo627.require(classes, coroutine + "-><init>(" + OWNER + "ZLkotlin/coroutines/Continuation;)V");
            String field = name.equals("setIsPremiumState") ? "$isPremiumState" : "$isAdfreeState";
            Pillo627.requireField(classes, coroutine + "->" + field + ":Z", false);
            ClassDef lambda = classes.stream().filter(c -> c.getType().equals(coroutine)).findFirst().orElseThrow();
            Method constructor = null, body = null;
            for (Method m : lambda.getMethods()) {
                if (m.getName().equals("<init>")) constructor = m;
                if (m.getName().equals("invokeSuspend")) body = m;
            }
            if (constructor == null || body == null) throw unsupported("Missing coroutine implementation");
            int captures = 0, reads = 0, stores = 0, emissions = 0;
            for (var i : PilloHybridNotificationPatch.instructions(constructor)) {
                if (i.getOpcode() == Opcode.IPUT_BOOLEAN && reference(i, coroutine + "->" + field + ":Z")
                    && i instanceof TwoRegisterInstruction
                    && ((TwoRegisterInstruction)i).getRegisterA() == constructor.getImplementation().getRegisterCount()-2
                    && ((TwoRegisterInstruction)i).getRegisterB() == constructor.getImplementation().getRegisterCount()-4) captures++;
            }
            for (var i : PilloHybridNotificationPatch.instructions(body)) {
                if (i.getOpcode() == Opcode.IGET_BOOLEAN && reference(i, coroutine + "->" + field + ":Z")) reads++;
                if (PilloHybridNotificationPatch.calls(i, "Lmw/q2;", "k", "V", "Ljava/lang/Object;")) emissions++;
                if (PilloHybridNotificationPatch.calls(i, "Lxyz/rtrvr/pillo/data/persistence/preferences/Preferences;",
                    name.equals("setIsPremiumState") ? "setLastIsPremiumSubscriptionState" : "setLastIsAdfreeSubscriptionState", "V", "Z")) stores++;
            }
            if (captures != 1 || reads != 2 || stores != 1 || emissions != 1)
                throw unsupported("Coroutine capture/emission/persistence changed: " + name);
            result.add(setter);
        }
        return result;
    }
    static boolean reference(Instruction i, String expected) {
        return i instanceof ReferenceInstruction && ((ReferenceInstruction)i).getReference().toString().equals(expected);
    }
    static Method validateProfileCallback(List<? extends ClassDef> classes) {
        List<Method> matches = new ArrayList<>();
        for (ClassDef c : classes) if (OWNER.equals(c.getType()))
            for (Method m : c.getMethods()) if (PROFILE_CALLBACK.equals(m.getName())) matches.add(m);
        if (matches.size() != 1) throw unsupported("Missing or ambiguous profile callback");
        Method method = matches.get(0);
        validateProfileCallbackMethod(method);
        return method;
    }
    static void validateProfileCallbackMethod(Method method) {
        if (!OWNER.equals(method.getDefiningClass()) || !PROFILE_CALLBACK.equals(method.getName())
            || !PilloHybridNotificationPatch.signature(method, "Lkotlin/Unit;", OWNER, "Z", "Z")
            || method.getAccessFlags() != 26 || method.getImplementation() == null
            || method.getImplementation().getRegisterCount() != 3
            || !method.getImplementation().getTryBlocks().isEmpty())
            throw unsupported("Profile callback signature changed");
        var ins = PilloHybridNotificationPatch.instructions(method);
        String prefs = "Lxyz/rtrvr/pillo/data/persistence/preferences/Preferences;";
        if (ins.size() != 9 || !branchTo(ins, 0, Opcode.IF_EQZ, 1, 2)
            || !instanceCall(ins.get(1), "enableMultiDependents", "Ljw/q1;", 0)
            || !branchTo(ins, 2, Opcode.IF_NEZ, 1, 7)
            || !instanceCall(ins.get(3), "resetDailyInterruptSetting", "Ljw/q1;", 0)
            || ins.get(4).getOpcode() != Opcode.IGET_OBJECT
            || !reference(ins.get(4), OWNER + "->preferences:" + prefs)
            || !(ins.get(4) instanceof TwoRegisterInstruction)
            || ((TwoRegisterInstruction)ins.get(4)).getRegisterA() != 0
            || ((TwoRegisterInstruction)ins.get(4)).getRegisterB() != 0
            || ins.get(5).getOpcode() != Opcode.CONST_4
            || ((OneRegisterInstruction)ins.get(5)).getRegisterA() != 1
            || ((NarrowLiteralInstruction)ins.get(5)).getNarrowLiteral() != 0
            || !PilloHybridNotificationPatch.calls(ins.get(6), prefs, "setWatchNotificationEnabled", "V", "Z")
            || ins.get(6).getOpcode() != Opcode.INVOKE_VIRTUAL
            || !(ins.get(6) instanceof FiveRegisterInstruction)
            || ((FiveRegisterInstruction)ins.get(6)).getRegisterCount() != 2
            || ((FiveRegisterInstruction)ins.get(6)).getRegisterC() != 0
            || ((FiveRegisterInstruction)ins.get(6)).getRegisterD() != 1
            || ins.get(7).getOpcode() != Opcode.SGET_OBJECT
            || !reference(ins.get(7), "Lkotlin/Unit;->a:Lkotlin/Unit;")
            || ((OneRegisterInstruction)ins.get(7)).getRegisterA() != 0
            || ins.get(8).getOpcode() != Opcode.RETURN_OBJECT
            || ((OneRegisterInstruction)ins.get(8)).getRegisterA() != 0)
            throw unsupported("Profile callback reset layout changed or already patched");
    }
    private static boolean instanceCall(Instruction i, String name, String result, int receiver) {
        return i.getOpcode() == Opcode.INVOKE_DIRECT
            && PilloHybridNotificationPatch.calls(i, OWNER, name, result)
            && i instanceof FiveRegisterInstruction && ((FiveRegisterInstruction)i).getRegisterCount() == 1
            && ((FiveRegisterInstruction)i).getRegisterC() == receiver;
    }
    private static boolean branchTo(List<Instruction> ins, int index, Opcode opcode, int register, int target) {
        Instruction i = ins.get(index);
        if (i.getOpcode() != opcode || !(i instanceof OneRegisterInstruction)
            || ((OneRegisterInstruction)i).getRegisterA() != register || !(i instanceof OffsetInstruction)) return false;
        int distance = 0;
        for (int n = index; n < target; n++) distance += ins.get(n).getCodeUnits();
        return ((OffsetInstruction)i).getCodeOffset() == distance;
    }
    static void applyProfileCallback(MutableMethod method) {
        validateProfileCallbackMethod(method);
        method.getImplementation().addInstruction(0, new BuilderInstruction11n(Opcode.CONST_4, 1, 1));
    }
    static void validateSetter(Method method) {
        if (!OWNER.equals(method.getDefiningClass()) || !SETTERS.contains(method.getName())
            || !PilloHybridNotificationPatch.signature(method, "Ljw/q1;", "Z")
            || method.getAccessFlags() != 18 || method.getImplementation() == null)
            throw unsupported("Setter signature or instance/private/final contract changed");
        var ins = PilloHybridNotificationPatch.instructions(method);
        String coroutine = OWNER.substring(0, OWNER.length()-1) + "$" + method.getName() + "$1;";
        if (method.getImplementation().getRegisterCount() != 5 || ins.size() != 8
            || ins.get(0).getOpcode() != Opcode.IGET_OBJECT || !reference(ins.get(0), OWNER + "->mainScope:Ljw/f0;")
            || ins.get(1).getOpcode() != Opcode.NEW_INSTANCE || !reference(ins.get(1), coroutine)
            || ins.get(2).getOpcode() != Opcode.CONST_4 || !(ins.get(2) instanceof NarrowLiteralInstruction)
            || ((NarrowLiteralInstruction)ins.get(2)).getNarrowLiteral() != 0
            || !PilloHybridNotificationPatch.calls(ins.get(3), coroutine, "<init>", "V", OWNER, "Z", "Lkotlin/coroutines/Continuation;")
            || !(ins.get(3) instanceof FiveRegisterInstruction)
            || ins.get(3).getOpcode() != Opcode.INVOKE_DIRECT
            || ins.get(5).getOpcode() != Opcode.INVOKE_STATIC
            || !PilloHybridNotificationPatch.calls(ins.get(5), "Ljw/j0;", "v", "Ljw/j2;",
                "Ljw/f0;", "Lkotlin/coroutines/CoroutineContext;", "Ljw/h0;", "Lkotlin/jvm/functions/Function2;", "I")
            || ins.get(6).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ins.get(7).getOpcode() != Opcode.RETURN_OBJECT)
            throw unsupported("Setter layout changed or already patched: " + method.getName());
        var call = (FiveRegisterInstruction)ins.get(3);
        if (call.getRegisterCount() != 4 || call.getRegisterC() != 1 || call.getRegisterD() != 3
            || call.getRegisterE() != 4 || call.getRegisterF() != 2)
            throw unsupported("Coroutine argument registers changed");
    }
    static void apply(MutableMethod method) {
        validateSetter(method);
        method.getImplementation().addInstruction(0, new BuilderInstruction11n(Opcode.CONST_4, 4, 1));
    }
}
