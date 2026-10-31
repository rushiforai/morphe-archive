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
                    List<MutableMethod> mutable = new ArrayList<>();
                    for (Method method : matched) {
                        var candidates = context.mutableClassDefBy(OWNER).getMethods().stream()
                            .filter(m -> m.equals(method)).collect(java.util.stream.Collectors.toList());
                        if (candidates.size() != 1) throw unsupported("Cannot resolve mutable setter " + method);
                        validateSetter(candidates.get(0));
                        mutable.add(candidates.get(0));
                    }
                    // Both native setters are proved before either one changes.
                    for (MutableMethod method : mutable) apply(method);
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
