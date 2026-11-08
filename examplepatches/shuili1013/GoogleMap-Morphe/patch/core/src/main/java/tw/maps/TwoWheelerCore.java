package tw.maps;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Experimental, exact-version two-site transform. No APK signing or installation. */
public final class TwoWheelerCore {
    public static final String SELECTOR = "Lbtxk;->h()Lckbl;";
    public static final String BUILDER = "Lqxa;->b(Lybr;Lyef;Lqvw;Lqvv;ZZ)Lcqjz;";
    private static final Map<String,String> EXPECTED = Map.of(
        SELECTOR, "2210dc8a583846b25d10ffd5620018ced1069e4cf7a5f2442decb782226e84f4",
        BUILDER, "40ee2e41413851587682da09ba3599c7240e24416b8e0221eeb30197fa5a6824");
    public static final Map<String,String> SUPPORT = Map.of(
        "Lplq;-><clinit>()V", "09e54a8922ff3acc61d7b981fa8354b47b10ab264962bbac7839b0f519a75223",
        "Ltql;->d()Lplq;", "7f68b97b435a52d3356e7065c849a4bc7c6ae1ef6489be2a4fe50985ed5926c2",
        "Ltql;->t()V", "7bde07344972ab23cc74586771eb47c71c06c0de75faa6739d5a4ec1fe08dd94",
        "Lckbl;-><clinit>()V", "40854fc1ea31f4fba9c16fb6a7154a56500398ee7b2f61733b98ccd70141fa1e",
        "Lqvv;-><clinit>()V", "0c207e942d02f20be046d75f278339737b06e1f9c7813d8ce0ff69fc8ddec454");

    private TwoWheelerCore() {}
    public static boolean isTarget(Method method) { return EXPECTED.containsKey(method.toString()); }
    public static void validateSupport(Map<String,? extends Method> methods) {
        for (var entry : SUPPORT.entrySet()) {
            Method method = methods.get(entry.getKey());
            if (method == null || !entry.getValue().equals(MethodFingerprint.sha256(method)))
                throw new IllegalStateException("Unrecognized supporting method: " + entry.getKey());
        }
    }
    public static void validate(Method method) {
        String expected = EXPECTED.get(method.toString());
        if (expected == null || !expected.equals(MethodFingerprint.sha256(method)))
            throw new IllegalStateException("Unrecognized or already modified method: " + method);
    }

    public static MutableMethodImplementation transform(Method method) {
        validate(method);
        return method.toString().equals(SELECTOR) ? selector(method) : builder(method);
    }

    private static ImmutableFieldReference field(String owner, String name, String type) {
        return new ImmutableFieldReference(owner, name, type);
    }
    private static BuilderInstruction call(Opcode opcode, int register, String owner, String name, String result) {
        return new BuilderInstruction35c(opcode, 1, register, 0, 0, 0, 0,
            new ImmutableMethodReference(owner, name, List.of(), result));
    }
    private static void insert(MutableMethodImplementation code, int index, BuilderInstruction... instructions) {
        for (int i = 0; i < instructions.length; i++) code.addInstruction(index + i, instructions[i]);
    }

    private static MutableMethodImplementation selector(Method method) {
        var old = method.getImplementation();
        // One extra local: the original body uses v1 as this. Preserve that alias
        // at entry when the actual parameter moves to v2. Original instructions,
        // branch labels and exception regions are retained by dexlib2.
        var code = new MutableMethodImplementation(new ImmutableMethodImplementation(
            3, old.getInstructions(), old.getTryBlocks(), List.of()));
        Label fallback = code.newLabelForIndex(0);
        insert(code, 0,
            new BuilderInstruction12x(Opcode.MOVE_OBJECT, 1, 2),
            new BuilderInstruction22c(Opcode.IGET_OBJECT, 0, 1, field("Lbtxk;", "f", "Ljava/lang/Object;")),
            call(Opcode.INVOKE_INTERFACE, 0, "Lcqvj;", "a", "Ljava/lang/Object;"),
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
            new BuilderInstruction22c(Opcode.INSTANCE_OF, 2, 0, new ImmutableTypeReference("Ltql;")),
            new BuilderInstruction21t(Opcode.IF_EQZ, 2, fallback),
            new BuilderInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference("Lpkr;")),
            call(Opcode.INVOKE_INTERFACE, 0, "Lpkr;", "d", "Lplq;"),
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 2, field("Lplq;", "b", "Lplq;")),
            new BuilderInstruction22t(Opcode.IF_NE, 0, 2, fallback),
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 0, field("Lckbl;", "f", "Lckbl;")),
            new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        return code;
    }

    private static MutableMethodImplementation builder(Method method) {
        var code = new MutableMethodImplementation(method.getImplementation());
        Label fallback = code.newLabelForIndex(3); // after original parameter copies
        Label selected = code.newLabelForAddress(0x1d); // shared continuation with v3=qvv
        insert(code, 3,
            new BuilderInstruction22c(Opcode.IGET_OBJECT, 3, 0, field("Lqxa;", "c", "Lpkr;")),
            new BuilderInstruction22c(Opcode.INSTANCE_OF, 4, 3, new ImmutableTypeReference("Ltql;")),
            new BuilderInstruction21t(Opcode.IF_EQZ, 4, fallback),
            call(Opcode.INVOKE_INTERFACE, 3, "Lpkr;", "d", "Lplq;"),
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3),
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 4, field("Lplq;", "b", "Lplq;")),
            new BuilderInstruction22t(Opcode.IF_NE, 3, 4, fallback),
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 3, field("Lqvv;", "b", "Lqvv;")),
            new BuilderInstruction30t(Opcode.GOTO_32, selected));
        return code;
    }
}
