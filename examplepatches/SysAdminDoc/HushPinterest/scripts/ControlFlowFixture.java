import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.Set;

/** Direct synthetic bodies exercise the same disabled-path engine used by compiled family contracts. */
public final class ControlFlowFixture {
    private static int cases;

    private static Instruction constant(int register, long bits) {
        return new ImmutableInstruction51l(Opcode.CONST_WIDE, register, bits);
    }

    private static Instruction move(Opcode opcode, int to, int from) {
        return opcode.name.endsWith("/from16") ? new ImmutableInstruction22x(opcode, to, from)
                : opcode.name.endsWith("/16") ? new ImmutableInstruction32x(opcode, to, from)
                : new ImmutableInstruction12x(opcode, to, from);
    }

    private static void check(String name, int registers, List<String> parameters, List<Instruction> operations,
                              Opcode branch, int first, int second, Boolean taken) throws Exception {
        // Both directions must agree. Unknown inputs must retain both possible fallback paths.
        for (boolean inverse : List.of(false, true)) {
            Opcode condition = inverse ? switch (branch) {
                case IF_EQ -> Opcode.IF_NE;
                case IF_EQZ -> Opcode.IF_NEZ;
                case IF_LTZ -> Opcode.IF_GEZ;
                default -> throw new IllegalArgumentException(branch.name);
            } : branch;
            List<Instruction> body = new ArrayList<>();
            body.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                    new ImmutableMethodReference("Lfixture/Control;", "active", List.of(), "Z")));
            body.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
            body.addAll(operations);
            body.add(second < 0 ? new ImmutableInstruction21t(condition, first, 3) : new ImmutableInstruction22t(condition, first, second, 3));
            body.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            int fallback = body.size();
            body.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            Method method = new ImmutableMethod("Lfixture/Control;", name,
                    parameters.stream().map(type -> new ImmutableMethodParameter(type, Set.of(), null)).toList(), "V",
                    AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), Set.of(), Set.of(),
                    new ImmutableMethodImplementation(registers, body, List.of(), List.of()));
            Class<?> flow = Class.forName("DexDiff$FeatureFlow");
            var constructor = flow.getDeclaredConstructor(Method.class);
            constructor.setAccessible(true);
            var afterControl = flow.getDeclaredMethod("afterControl", int.class);
            afterControl.setAccessible(true);
            BitSet reachable = (BitSet) afterControl.invoke(constructor.newInstance(method), 0);
            boolean expected = taken == null || taken != inverse;
            if (reachable.get(fallback) != expected) throw new AssertionError(name + " inverse=" + inverse + " expected fallback=" + expected);
            cases++;
        }
    }

    private static void scalar(String name, List<Instruction> body, Opcode branch, Boolean taken) throws Exception {
        check(name, 8, List.of(), body, branch, 0, -1, taken);
    }

    public static void main(String[] args) throws Exception {
        for (Opcode opcode : List.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
            check("null-" + opcode.name, 4, List.of(), List.of(move(opcode, 1, 0)), Opcode.IF_EQZ, 1, -1, true);
            check("alias-" + opcode.name, 4, List.of("Ljava/lang/Object;"), List.of(move(opcode, 1, 3)), Opcode.IF_EQ, 1, 3, true);
            check("uninitialized-object-" + opcode.name, 4, List.of(), List.of(move(opcode, 1, 2)), Opcode.IF_EQ, 1, 2, null);
            check("nonzero-object-source-" + opcode.name, 4, List.of(), List.of(
                    new ImmutableInstruction11n(Opcode.CONST_4, 2, 1), move(opcode, 1, 2)), Opcode.IF_EQ, 1, 2, null);
        }
        check("distinct-unknown-references", 4, List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), List.of(), Opcode.IF_EQ, 2, 3, null);
        check("overwritten-alias", 4, List.of("Ljava/lang/Object;", "Ljava/lang/Object;"),
                List.of(move(Opcode.MOVE_OBJECT, 1, 2), move(Opcode.MOVE_OBJECT, 2, 3)), Opcode.IF_EQ, 1, 2, null);
        check("non-null-string", 4, List.of(), List.of(new ImmutableInstruction21c(Opcode.CONST_STRING, 1,
                new ImmutableStringReference("value")), move(Opcode.MOVE_OBJECT, 2, 1)), Opcode.IF_EQZ, 2, -1, false);
        for (Opcode opcode : List.of(Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16, Opcode.MOVE_WIDE_16)) {
            scalar("uninitialized-wide-" + opcode.name, List.of(move(opcode, 1, 6), move(opcode, 3, 1),
                    new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3)), Opcode.IF_EQZ, null);
            scalar("copy-clobbered-wide-" + opcode.name, List.of(constant(1, 100),
                    new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), move(opcode, 3, 1), move(opcode, 5, 3),
                    new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 3, 5)), Opcode.IF_EQZ, null);
            scalar("copy-high-half-" + opcode.name, List.of(constant(1, 100), move(opcode, 3, 2), move(opcode, 5, 3),
                    new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 3, 5)), Opcode.IF_EQZ, null);
            for (long value : List.of(0x123456789abcdef0L, Long.MIN_VALUE, -1L)) {
                scalar("wide-" + opcode.name + value, List.of(constant(1, value), move(opcode, 3, 1),
                        new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3)), Opcode.IF_EQZ, true);
            }
        }
        scalar("full-width-comparison", List.of(constant(1, 0x100000000L), constant(3, 0),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3)), Opcode.IF_EQZ, false);
        scalar("negative-comparison", List.of(constant(1, Long.MIN_VALUE), constant(3, Long.MAX_VALUE),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3)), Opcode.IF_LTZ, true);
        for (int shift : List.of(-1, 1)) {
            scalar("overlap-" + shift, List.of(constant(2, 0x123456789abcdef0L), move(Opcode.MOVE_WIDE, 2 + shift, 2),
                    constant(5, 0x123456789abcdef0L), new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 2 + shift, 5)), Opcode.IF_EQZ, true);
        }
        scalar("last-valid-pair", List.of(constant(1, -123), move(Opcode.MOVE_WIDE, 6, 1),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 6)), Opcode.IF_EQZ, true);
        for (int half : List.of(1, 2)) {
            scalar("clobbered-half-" + half, List.of(constant(1, 100), constant(3, 100),
                    new ImmutableInstruction11n(Opcode.CONST_4, half, 0), new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3)), Opcode.IF_EQZ, null);
        }
        scalar("malformed-high-half", List.of(constant(7, 100), constant(1, 100),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 7, 1)), Opcode.IF_EQZ, null);
        for (Opcode conversion : List.of(Opcode.INT_TO_LONG, Opcode.INT_TO_DOUBLE)) {
            scalar("convert-disabled-" + conversion.name, List.of(move(conversion, 1, 0), move(Opcode.MOVE_WIDE, 3, 1),
                    new ImmutableInstruction23x(conversion == Opcode.INT_TO_LONG ? Opcode.CMP_LONG : Opcode.CMPL_DOUBLE, 0, 1, 3)), Opcode.IF_EQZ, true);
        }
        check("unknown-long-copy", 6, List.of("J"), List.of(move(Opcode.MOVE_WIDE, 1, 4),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 4)), Opcode.IF_EQZ, 0, -1, true);
        check("unknown-double-copy-may-be-nan", 6, List.of("D"), List.of(move(Opcode.MOVE_WIDE, 1, 4),
                new ImmutableInstruction23x(Opcode.CMPG_DOUBLE, 0, 1, 4)), Opcode.IF_EQZ, 0, -1, null);
        scalar("signed-double-zero", List.of(constant(1, Double.doubleToRawLongBits(-0.0)), constant(3, 0),
                new ImmutableInstruction23x(Opcode.CMPL_DOUBLE, 0, 1, 3)), Opcode.IF_EQZ, true);
        for (Opcode comparison : List.of(Opcode.CMPL_DOUBLE, Opcode.CMPG_DOUBLE)) {
            scalar("nan-" + comparison.name, List.of(constant(1, Double.doubleToRawLongBits(Double.NaN)), move(Opcode.MOVE_WIDE, 3, 1),
                    new ImmutableInstruction23x(comparison, 0, 1, 3)), Opcode.IF_LTZ, comparison == Opcode.CMPL_DOUBLE);
        }
        scalar("double-less", List.of(constant(1, Double.doubleToRawLongBits(-1.5)), constant(3, Double.doubleToRawLongBits(1.5)),
                new ImmutableInstruction23x(Opcode.CMPG_DOUBLE, 0, 1, 3)), Opcode.IF_LTZ, true);
        // A changing counter must widen while the copied wide constant and object alias stay valid.
        List<Instruction> loop = List.of(constant(1, 999), move(Opcode.MOVE_WIDE, 3, 1),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, 1),
                new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 5, 5, 1), new ImmutableInstruction21t(Opcode.IF_GTZ, 5, -2),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3));
        scalar("wide-stable-loop", loop, Opcode.IF_EQZ, true);
        // Reloading a reference at one instruction may return different objects on later iterations.
        check("changing-object-loop", 7, List.of("Ljava/lang/Object;"), List.of(move(Opcode.MOVE_OBJECT, 1, 6),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, 1),
                move(Opcode.MOVE_OBJECT, 2, 1),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lfixture/Objects;", "next", List.of(), "Ljava/lang/Object;")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                new ImmutableInstruction22b(Opcode.ADD_INT_LIT8, 5, 5, 1), new ImmutableInstruction21t(Opcode.IF_GTZ, 5, -7)),
                Opcode.IF_EQ, 1, 2, null);
        List<Instruction> changing = List.of(move(Opcode.MOVE_OBJECT, 1, 7),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lfixture/Loop;", "more", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 7),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lfixture/Objects;", "next", List.of(), "Ljava/lang/Object;")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                new ImmutableInstruction10t(Opcode.GOTO, -10), move(Opcode.MOVE_OBJECT, 2, 1));
        check("copy-widened-object", 8, List.of("Ljava/lang/Object;"), changing, Opcode.IF_EQ, 1, 2, true);
        List<Instruction> changingWide = List.of(move(Opcode.MOVE_WIDE, 1, 6),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lfixture/Loop;", "more", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 7),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lfixture/Values;", "next", List.of(), "J")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 1),
                new ImmutableInstruction10t(Opcode.GOTO, -10), move(Opcode.MOVE_WIDE, 3, 1),
                new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3));
        check("copy-widened-wide", 8, List.of("J"), changingWide, Opcode.IF_EQZ, 0, -1, true);
        // Independent widened values must not share identity just because their markers match.
        for (boolean objects : List.of(true, false)) {
            Opcode copy = objects ? Opcode.MOVE_OBJECT : Opcode.MOVE_WIDE;
            Opcode result = objects ? Opcode.MOVE_RESULT_OBJECT : Opcode.MOVE_RESULT_WIDE;
            String type = objects ? "Ljava/lang/Object;" : "J";
            List<Instruction> independent = new ArrayList<>(List.of(move(copy, 1, objects ? 9 : 8), move(copy, 3, objects ? 9 : 8),
                    new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference("Lfixture/Loop;", "more", List.of(), "Z")),
                    new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                    new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 11),
                    new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference("Lfixture/Values;", "next", List.of(), type)),
                    new ImmutableInstruction11x(result, 1),
                    new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference("Lfixture/Values;", "next", List.of(), type)),
                    new ImmutableInstruction11x(result, 3), new ImmutableInstruction10t(Opcode.GOTO, -14)));
            if (!objects) independent.add(new ImmutableInstruction23x(Opcode.CMP_LONG, 0, 1, 3));
            check("independent-widened-" + type, 10, List.of(type), independent,
                    objects ? Opcode.IF_EQ : Opcode.IF_EQZ, objects ? 1 : 0, objects ? 3 : -1, null);
        }
        System.out.println("[scripts] " + cases + " disabled-path object/wide cases passed");
    }
}
