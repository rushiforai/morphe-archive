import java.nio.file.Files;
import java.util.List;
import java.util.Set;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

class VerifySharingDexTest {
    private static final String HELPER = "Lapp/spicetify/extension/spotify/privacy/SharingLinks;";
    private static final String STRING = "Ljava/lang/String;";

    public static void main(String[] args) throws Exception {
        check(STRING, STRING, 9, true);
        check("Ljava/lang/Object;", STRING, 9, false);
        check(STRING, "Ljava/lang/Object;", 9, false);
        check(STRING, STRING, 10, false);
        check(STRING, STRING, 1, false);
        System.out.println("Verifier regression cases passed: 5");
    }

    private static void check(String parameter, String result, int flags, boolean valid) throws Exception {
        var helper = new ImmutableMethod(HELPER, "sanitizeUrl",
                List.of(new ImmutableMethodParameter(STRING, Set.of(), null)), STRING,
                flags, Set.of(), Set.of(), new ImmutableMethodImplementation(2,
                List.of(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)), List.of(), List.of()));
        var caller = new ImmutableMethod("Ltest/Caller;", "share",
                List.of(new ImmutableMethodParameter("Landroid/net/Uri;", Set.of(), null)), STRING,
                9, Set.of(), Set.of(), new ImmutableMethodImplementation(1, List.of(
                new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 0, 1,
                        new ImmutableMethodReference("Landroid/net/Uri;", "toString", List.of(), STRING)),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 1,
                        new ImmutableMethodReference(HELPER, "sanitizeUrl", List.of(parameter), result)),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), List.of(), List.of()));
        var dex = new ImmutableDexFile(Opcodes.getDefault(), List.of(
                new ImmutableClassDef(HELPER, 1, "Ljava/lang/Object;", List.of(), null,
                        Set.of(), List.of(), List.of(helper)),
                new ImmutableClassDef("Ltest/Caller;", 1, "Ljava/lang/Object;", List.of(), null,
                        Set.of(), List.of(), List.of(caller))));
        var file = Files.createTempFile("sharing-verifier-", ".dex");
        try {
            DexPool.writeTo(file.toString(), dex);
            boolean accepted = true;
            try {
                VerifySharingDex.main(new String[]{file.toString(), "1"});
            } catch (AssertionError rejected) {
                accepted = false;
            }
            if (accepted != valid) throw new AssertionError(
                    "Unexpected acceptance=" + accepted + ": " + parameter + " -> " + result + ", flags=" + flags);
        } finally {
            Files.deleteIfExists(file);
        }
    }
}
