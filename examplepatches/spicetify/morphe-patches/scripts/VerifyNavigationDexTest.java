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

class VerifyNavigationDexTest {
    enum Change { NONE, WRONG_ARGUMENT, WRONG_RESULT, WRONG_FLAG, WRONG_CALLER, MISSING_HOOK, WRONG_CAPABILITY, WRONG_HELPER_ARGUMENT, WRONG_HIDE_BRANCH, WRONG_HELPER_TARGET, WRONG_TRUE_VALUE }

    @Test void acceptsTheExpectedHook() throws Exception { check(Change.NONE); }
    @Test void rejectsWrongArgument() { assertThrows(AssertionError.class, () -> check(Change.WRONG_ARGUMENT)); }
    @Test void rejectsWrongResult() { assertThrows(AssertionError.class, () -> check(Change.WRONG_RESULT)); }
    @Test void rejectsUnrelatedFlag() { assertThrows(AssertionError.class, () -> check(Change.WRONG_FLAG)); }
    @Test void rejectsUnrelatedCaller() { assertThrows(AssertionError.class, () -> check(Change.WRONG_CALLER)); }
    @Test void rejectsMissingHook() { assertThrows(AssertionError.class, () -> check(Change.MISSING_HOOK)); }
    @Test void rejectsDisabledCapability() { assertThrows(AssertionError.class, () -> check(Change.WRONG_CAPABILITY)); }

    @Test void rejectsIgnoredStockFlag() { assertThrows(AssertionError.class, () -> check(Change.WRONG_HELPER_ARGUMENT)); }
    @Test void rejectsInvertedPreference() { assertThrows(AssertionError.class, () -> check(Change.WRONG_HIDE_BRANCH)); }
    @Test void rejectsWrongHelperBranchTarget() { assertThrows(AssertionError.class, () -> check(Change.WRONG_HELPER_TARGET)); }
    @Test void rejectsWrongHelperResult() { assertThrows(AssertionError.class, () -> check(Change.WRONG_TRUE_VALUE)); }

    void check(Change change) throws Exception {
        String caller = change == Change.WRONG_CALLER ? "Ltest/Other;" : "Lp/tkd0;";
        List<Instruction> code = new ArrayList<>(List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0,
                new ImmutableMethodReference("Lp/f4p0;", change == Change.WRONG_FLAG ? "a" : "b", List.of(), "Z")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT, 4)));
        if (change != Change.MISSING_HOOK) {
            code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                change == Change.WRONG_ARGUMENT ? 5 : 4, 1,
                new ImmutableMethodReference(VerifyNavigationDex.SETTINGS, "showPremiumTab", List.of("Z"), "Z")));
            code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, change == Change.WRONG_RESULT ? 5 : 4));
        }
        code.add(new ImmutableInstruction11n(Opcode.CONST_4, 5, 0));
        code.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 4, 2));
        code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 5));
        var classes = List.of(
            definition(caller, method(caller, "invoke", List.of(), "Ljava/lang/Object;", 1, code)),
            definition(VerifyNavigationDex.SETTINGS, method(VerifyNavigationDex.SETTINGS, "showPremiumTab", List.of("Z"), "Z", 9, List.of(
                new ImmutableInstruction21t(Opcode.IF_EQZ, change == Change.WRONG_HELPER_ARGUMENT ? 0 : 6,
                    change == Change.WRONG_HELPER_TARGET ? 8 : 10),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                    new ImmutableMethodReference(VerifyNavigationDex.SETTINGS, "hidePremiumTabEnabled", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 6),
                new ImmutableInstruction21t(change == Change.WRONG_HIDE_BRANCH ? Opcode.IF_EQZ : Opcode.IF_NEZ, 6, 4),
                new ImmutableInstruction11n(Opcode.CONST_4, 6, change == Change.WRONG_TRUE_VALUE ? 0 : 1),
                new ImmutableInstruction11x(Opcode.RETURN, 6),
                new ImmutableInstruction11n(Opcode.CONST_4, 6, 0),
                new ImmutableInstruction11x(Opcode.RETURN, 6)))),
            definition(VerifyNavigationDex.INSTALLED, method(VerifyNavigationDex.INSTALLED, "hidePremiumTab", List.of(), "Z", 9, List.of(
                new ImmutableInstruction11n(Opcode.CONST_4, 0, change == Change.WRONG_CAPABILITY ? 0 : 1),
                new ImmutableInstruction11x(Opcode.RETURN, 0)))));
        var dex = Files.createTempFile("navigation-verifier-", ".dex");
        try {
            DexPool.writeTo(dex.toString(), new ImmutableDexFile(Opcodes.getDefault(), classes));
            VerifyNavigationDex.main(new String[]{dex.toString(), "1"});
        } finally {
            Files.deleteIfExists(dex);
        }
    }

    ImmutableMethod method(String owner, String name, List<String> parameters, String result, int flags, List<? extends Instruction> code) {
        return new ImmutableMethod(owner, name, parameters.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(),
            result, flags, Set.of(), Set.of(), new ImmutableMethodImplementation(7, code, List.of(), List.of()));
    }

    ImmutableClassDef definition(String owner, ImmutableMethod method) {
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
    }
}
