import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock;
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction30t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Arrays;

public final class OriginalAwareVerifierTest {
    public static void main(String[] args) throws IOException {
        var reports = OriginalAwareVerifier.parseFindings("Cross-DEX class hierarchy verification found 2 issue(s):\n"
                + "  1. [MISSING_SUPER] Class Lsynthetic/Child; (in classes.dex) declares superclass Lsynthetic/Absent;\n"
                + "  2. [MISSING_SUPER] Class Lsynthetic/Child; (in classes8.dex) declares superclass Lsynthetic/Absent;\n");
        require(reports.size() == 1, "DEX placement must not change finding identity.");
        requireRejected(() -> OriginalAwareVerifier.parseFindings("dexdump exited with code 1"));
        requireRejected(() -> OriginalAwareVerifier.parseFindings("Cross-DEX class hierarchy verification found 1 issue(s):\nunparseable"));
        requireRejected(() -> OriginalAwareVerifier.parseFindings("Cross-DEX class hierarchy verification found 2 issue(s):\n  1. [MISSING_SUPER] Class Lsynthetic/Child;"));
        require(Arrays.equals(OriginalAwareVerifier.canonicalDex(stringClass(false)),
                OriginalAwareVerifier.canonicalDex(stringClass(true))), "String pool width must not change executable identity.");
        require(Arrays.equals(OriginalAwareVerifier.canonicalDex(tryClass(false, null)),
                OriginalAwareVerifier.canonicalDex(tryClass(true, null))), "Relayout must preserve branch/exception targets.");
        require(!Arrays.equals(OriginalAwareVerifier.canonicalDex(tryClass(false, null)),
                OriginalAwareVerifier.canonicalDex(tryClass(false, "Ljava/lang/RuntimeException;"))), "Changed exception handlers must remain detectable.");
        ClassDef base = synthetic("Ljava/lang/Object;", false);
        ClassDef changed = synthetic("Ljava/lang/Object;", true);
        OriginalAwareVerifier.requireUnchanged(base.getType(), Map.of(base.getType(), base),
                Map.of(base.getType(), base), new HashSet<>());
        requireRejected(() -> OriginalAwareVerifier.requireUnchanged(base.getType(), Map.of(base.getType(), base),
                Map.of(base.getType(), changed), new HashSet<>()));
        requireRejected(() -> OriginalAwareVerifier.requireUnchanged(base.getType(), Map.of(base.getType(), base),
                Map.of(), new HashSet<>()));
        System.out.println("Verifier tests passed: complete reports, fatal tool errors, string/goto/exception relayout, changed/removed classes.");
    }

    private static ClassDef synthetic(String parent, boolean addInstruction) {
        var code = addInstruction ? List.of(new ImmutableInstruction10x(Opcode.NOP), new ImmutableInstruction10x(Opcode.RETURN_VOID))
                : List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var implementation = new ImmutableMethodImplementation(0, code, List.of(), List.of());
        var method = new ImmutableMethod("Lsynthetic/Child;", "method", List.of(), "V",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, implementation);
        return new ImmutableClassDef("Lsynthetic/Child;", AccessFlags.PUBLIC.getValue(), parent, List.of(),
                null, List.of(), List.of(), List.of(method));
    }

    private static ClassDef stringClass(boolean jumbo) {
        var text = new ImmutableStringReference("synthetic");
        var load = jumbo ? new ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, text)
                : new ImmutableInstruction21c(Opcode.CONST_STRING, 0, text);
        var implementation = new ImmutableMethodImplementation(1, List.of(load, new ImmutableInstruction10x(Opcode.RETURN_VOID)),
                List.of(), List.of());
        var method = new ImmutableMethod("Lsynthetic/Child;", "method", List.of(), "V",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, implementation);
        return new ImmutableClassDef("Lsynthetic/Child;", AccessFlags.PUBLIC.getValue(), "Ljava/lang/Object;", List.of(),
                null, List.of(), List.of(), List.of(method));
    }

    private static ClassDef tryClass(boolean wide, String exceptionType) {
        var text = new ImmutableStringReference("synthetic");
        var load = wide ? new ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, text)
                : new ImmutableInstruction21c(Opcode.CONST_STRING, 0, text);
        var jump = wide ? new ImmutableInstruction30t(Opcode.GOTO_32, 5) : new ImmutableInstruction10t(Opcode.GOTO, 3);
        var instructions = List.of(load, jump, new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
                new ImmutableInstruction10x(Opcode.RETURN_VOID), new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var handlers = List.of(new ImmutableExceptionHandler(exceptionType, wide ? 6 : 3));
        var implementation = new ImmutableMethodImplementation(1, instructions,
                List.of(new ImmutableTryBlock(0, wide ? 3 : 2, handlers)), List.of());
        var method = new ImmutableMethod("Lsynthetic/Child;", "method", List.of(), "V",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, implementation);
        return new ImmutableClassDef("Lsynthetic/Child;", AccessFlags.PUBLIC.getValue(), "Ljava/lang/Object;", List.of(),
                null, List.of(), List.of(), List.of(method));
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void requireRejected(Check check) throws IOException {
        try { check.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsafe audit input was accepted.");
    }

    private interface Check { void run() throws IOException; }
}
