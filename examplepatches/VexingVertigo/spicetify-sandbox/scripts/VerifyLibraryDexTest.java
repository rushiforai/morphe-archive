import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class VerifyLibraryDexTest {
    enum Change { NONE, MISSING_HOOK, WRONG_CALLER, DROPPED_RESULT, NO_EARLY_RETURN, UNWRAPPED_RETURN }

    @Test void acceptsTheExpectedHooks() throws Exception { check(Change.NONE, "1"); }
    @Test void rejectsHooksWhenThePatchIsOff() { assertThrows(AssertionError.class, () -> check(Change.NONE, "0")); }
    @Test void rejectsAMissingHook() { assertThrows(AssertionError.class, () -> check(Change.MISSING_HOOK, "1")); }
    @Test void rejectsAHookInAnotherMethod() { assertThrows(AssertionError.class, () -> check(Change.WRONG_CALLER, "1")); }
    @Test void rejectsADroppedResult() { assertThrows(AssertionError.class, () -> check(Change.DROPPED_RESULT, "1")); }
    @Test void rejectsALabelThatNeverReturns() { assertThrows(AssertionError.class, () -> check(Change.NO_EARLY_RETURN, "1")); }
    @Test void rejectsAPageThatIsNotReturned() { assertThrows(AssertionError.class, () -> check(Change.UNWRAPPED_RETURN, "1")); }

    void check(Change change, String enabled) throws Exception {
        var bodies = new java.util.LinkedHashMap<List<Object>, List<Instruction>>();
        for (var hook : VerifyLibraryDex.HOOKS) {
            if (change == Change.MISSING_HOOK && hook.name().equals("remembered")) continue;
            String caller = change == Change.WRONG_CALLER && hook.name().equals("chipRow") ? "Lp/other;" : hook.caller();
            bodies.computeIfAbsent(List.of(caller, hook.method(), hook.parameters()), ignored -> new ArrayList<>()).addAll(code(hook, change));
        }
        var methods = new java.util.LinkedHashMap<String, List<ImmutableMethod>>();
        bodies.forEach((key, body) -> {
            @SuppressWarnings("unchecked") List<String> parameters = (List<String>) key.get(2);
            methods.computeIfAbsent((String) key.get(0), ignored -> new ArrayList<>())
                .add(method((String) key.get(0), (String) key.get(1), parameters, body));
        });
        var merged = new ArrayList<ImmutableClassDef>();
        methods.forEach((owner, list) -> merged.add(new ImmutableClassDef(owner, 1, "Ljava/lang/Object;",
            List.of(), null, Set.of(), List.of(), list)));
        var dex = Files.createTempFile("library-verifier-", ".dex");
        try {
            DexPool.writeTo(dex.toString(), new ImmutableDexFile(Opcodes.getDefault(), merged));
            VerifyLibraryDex.main(new String[]{dex.toString(), enabled});
        } finally {
            Files.deleteIfExists(dex);
        }
    }

    /** The instructions the patch inserts for one hook, in registers v0..v2. */
    List<Instruction> code(VerifyLibraryDex.Hook hook, Change change) {
        var reference = new ImmutableMethodReference(hook.owner(), hook.name(), hook.hookParameters(), hook.hookResult());
        int arguments = hook.hookParameters().size();
        var code = new ArrayList<Instruction>();
        code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, arguments, reference));
        int result = Math.max(0, hook.argument());
        boolean drop = change == Change.DROPPED_RESULT && hook.name().equals("remembered");
        switch (hook.after()) {
            case EARLY_RETURN_OBJECT -> {
                code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
                if (change == Change.NO_EARLY_RETURN && hook.name().equals("label")) {
                    code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
                } else {
                    code.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3));
                    code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
                    code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
                }
            }
            case RETURN_SAME -> {
                code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, change == Change.UNWRAPPED_RETURN ? 2 : result));
            }
            case REPLACE_ARGUMENT -> {
                if (!drop) code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            }
            case EARLY_RETURN_VOID -> {
                code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                code.add(new ImmutableInstruction21t(Opcode.IF_NEZ, result, 3));
                code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
                code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            }
            case GATE -> {
                code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
                code.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3));
                code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
                code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            }
            case NOTHING -> code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        }
        return code;
    }

    ImmutableMethod method(String owner, String name, List<String> parameters, List<? extends Instruction> code) {
        return new ImmutableMethod(owner, name, parameters.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(),
            "V", 1, Set.of(), Set.of(), new ImmutableMethodImplementation(12, code, List.of(), List.of()));
    }

}
