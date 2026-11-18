import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;

/** DEX pool growth may widen strings without changing code or exception flow. */
public class VerifyPizzaDexParity extends VerifyPizzaRewardDex {
    static ImmutableMethod fixture(boolean jumbo, String value, boolean changedBranch) {
        var first = jumbo ? new ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, new ImmutableStringReference("first"))
                          : new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("first"));
        var second = jumbo ? new ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, new ImmutableStringReference(value))
                           : new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(value));
        int target = jumbo ? 6 : 5;
        var code = List.of(first, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, target - (changedBranch ? 1 : 0)),
            second, new ImmutableInstruction10x(Opcode.RETURN_VOID), new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var handler = new ImmutableExceptionHandler("Ljava/lang/RuntimeException;", jumbo ? 9 : 7);
        return new ImmutableMethod("LParity;", "run", List.of(), "V", 9, Set.of(), Set.of(),
            new ImmutableMethodImplementation(1, code, List.of(new ImmutableTryBlock(0, jumbo ? 8 : 6, List.of(handler))), List.of()));
    }
    public static void main(String[] args) {
        String compact = canonical(fixture(false, "second", false));
        check(compact.equals(canonical(fixture(true, "second", false))), "String-width-only encoding changed behavior comparison");
        check(!compact.equals(canonical(fixture(true, "tampered", false))), "Changed string was accepted");
        check(!compact.equals(canonical(fixture(true, "second", true))), "Changed branch target was accepted");
        System.out.println("PASS: compact/jumbo strings preserve parity with branches/handlers; changed values and targets are rejected");
    }
}
