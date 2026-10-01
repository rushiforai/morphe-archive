import java.nio.file.Files;
import java.util.List;
import java.util.Set;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

class VerifySharingDexTest {
    private static final String HELPER = "Lapp/spicetify/extension/spotify/privacy/SharingLinks;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String SETTINGS = "Lapp/spicetify/extension/spotify/settings/PatchSettings;";
    private static final String RESPONSE = "Lcom/spotify/share/linkgeneration/api/proto/GenerateUrlResponse;";
    private static final String RESULT = "Ltest/Result;";

    private enum ResultFixture {
        VALID, MISSING_HOOKS, WRONG_URL_ARGUMENT, CHANGED_ID_STORE, DECOY_HOOKS,
        CHANGED_RESPONSE_FIELD, SWAPPED_RESPONSE_ARGUMENTS, DUPLICATE_CONSTRUCTION,
        MISSING_WRAPPER, WRONG_PREFERENCE, INVERTED_BRANCH, WRONG_BRANCH_TARGET,
        WRONG_SANITIZER_ARGUMENT, WRONG_WRAPPER_RETURN, LEGACY_NATIVE_HOOK,
        WRONG_WRAPPER_FLAGS, WRONG_WRAPPER_DESCRIPTOR
    }

    public static void main(String[] args) throws Exception {
        check(STRING, STRING, 9, true);
        check("Ljava/lang/Object;", STRING, 9, false);
        check(STRING, "Ljava/lang/Object;", 9, false);
        check(STRING, STRING, 10, false);
        check(STRING, STRING, 1, false);
        for (var fixture : ResultFixture.values()) {
            if (fixture != ResultFixture.VALID) check(STRING, STRING, 9, false, fixture);
        }
        checkProfile(false, true, true, true);
        checkProfile(false, false, false, true);
        checkProfile(true, false, false, false);
        checkProfile(false, false, true, false);
        checkProfile(false, true, false, false);
        System.out.println("Verifier regression cases passed: " + (4 + ResultFixture.values().length + 5));
    }

    private static void check(String parameter, String result, int flags, boolean valid) throws Exception {
        check(parameter, result, flags, valid, ResultFixture.VALID);
    }

    private static void check(String parameter, String result, int flags, boolean valid,
                              ResultFixture fixture) throws Exception {
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
                        new ImmutableMethodReference(HELPER, fixture == ResultFixture.LEGACY_NATIVE_HOOK ? "sanitizeUrl" : "onShareUrl", List.of(parameter), result)),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), List.of(), List.of()));
        var classes = new java.util.ArrayList<ImmutableClassDef>(List.of(
                new ImmutableClassDef(HELPER, 1, "Ljava/lang/Object;", List.of(), null,
                        Set.of(), List.of(), fixture == ResultFixture.MISSING_WRAPPER ? List.of(helper) : List.of(helper, wrapper(fixture))),
                new ImmutableClassDef("Ltest/Caller;", 1, "Ljava/lang/Object;", List.of(), null,
                        Set.of(), List.of(), List.of(caller))));
        classes.add(resultClass(RESULT, fixture != ResultFixture.MISSING_HOOKS && fixture != ResultFixture.DECOY_HOOKS,
                fixture == ResultFixture.WRONG_URL_ARGUMENT ? 2 : 4,
                fixture == ResultFixture.CHANGED_ID_STORE ? 1 : 2));
        if (fixture == ResultFixture.DECOY_HOOKS) classes.add(resultClass("Ltest/Decoy;", true, 4, 2));
        var getters = new java.util.ArrayList<ImmutableMethod>();
        var fields = List.of("shareableUrl_", "shareId_", "spotifyUri_",
                fixture == ResultFixture.CHANGED_RESPONSE_FIELD ? "unknown_" : "fullUrl_");
        for (int index = 0; index < fields.size(); index++) {
            getters.add(new ImmutableMethod(RESPONSE, "get" + index, List.of(), STRING, 1, Set.of(), Set.of(),
                    new ImmutableMethodImplementation(2, List.of(
                            new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1,
                                    new ImmutableFieldReference(RESPONSE, fields.get(index), STRING)),
                            new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), List.of(), List.of())));
        }
        classes.add(new ImmutableClassDef(RESPONSE, 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), getters));
        var generator = new java.util.ArrayList<Instruction>();
        generator.add(new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 4, new ImmutableTypeReference(RESULT)));
        for (int index = 0; index < getters.size(); index++) {
            generator.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 5, 0, 0, 0, 0, getters.get(index)));
            // The last result may replace the response register, as it does in Spotify.
            generator.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, index == 3 ? 5 : index));
        }
        generator.add(new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 5, 4,
                fixture == ResultFixture.SWAPPED_RESPONSE_ARGUMENTS ? 1 : 0,
                fixture == ResultFixture.SWAPPED_RESPONSE_ARGUMENTS ? 0 : 1, 2, 5,
                new ImmutableMethodReference(RESULT, "<init>", List.of(STRING, STRING, STRING, STRING), "V")));
        generator.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4));
        var methods = new java.util.ArrayList<ImmutableMethod>();
        for (int index = 0; index < (fixture == ResultFixture.DUPLICATE_CONSTRUCTION ? 2 : 1); index++) {
            methods.add(new ImmutableMethod("Ltest/Generator;", "generate" + index,
                    List.of(new ImmutableMethodParameter(RESPONSE, Set.of(), null)), RESULT, 9, Set.of(), Set.of(),
                    new ImmutableMethodImplementation(6, generator, List.of(), List.of())));
        }
        classes.add(new ImmutableClassDef("Ltest/Generator;", 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), methods));
        var dex = new ImmutableDexFile(Opcodes.getDefault(), classes);
        var file = Files.createTempFile("sharing-verifier-", ".dex");
        try {
            DexPool.writeTo(file.toString(), dex);
            boolean accepted = true;
            try {
                VerifySharingDex.main(new String[]{file.toString(), "1", "1"});
            } catch (AssertionError rejected) {
                accepted = false;
            }
            if (accepted != valid) throw new AssertionError(
                    "Unexpected acceptance=" + accepted + ": " + parameter + " -> " + result
                            + ", flags=" + flags + ", fixture=" + fixture);
        } finally {
            Files.deleteIfExists(file);
        }
    }

    private static ImmutableMethod wrapper(ResultFixture fixture) {
        var code = List.<Instruction>of(
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference(SETTINGS,
                                fixture == ResultFixture.WRONG_PREFERENCE ? "otherSetting" : "cleanSharingEnabled", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                new ImmutableInstruction21t(fixture == ResultFixture.INVERTED_BRANCH ? Opcode.IF_NEZ : Opcode.IF_EQZ,
                        0, fixture == ResultFixture.WRONG_BRANCH_TARGET ? 2 : 6),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1,
                        fixture == ResultFixture.WRONG_SANITIZER_ARGUMENT ? 0 : 1, 0, 0, 0, 0,
                        new ImmutableMethodReference(HELPER, "sanitizeUrl", List.of(STRING), STRING)),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT,
                        fixture == ResultFixture.WRONG_WRAPPER_RETURN ? 0 : 1));
        return new ImmutableMethod(HELPER, "onShareUrl",
                List.of(new ImmutableMethodParameter(
                        fixture == ResultFixture.WRONG_WRAPPER_DESCRIPTOR ? "Ljava/lang/Object;" : STRING, Set.of(), null)),
                STRING, fixture == ResultFixture.WRONG_WRAPPER_FLAGS ? 1 : 9,
                Set.of(), Set.of(), new ImmutableMethodImplementation(2, code, List.of(), List.of()));
    }

    private static void checkProfile(boolean nativeHooks, boolean helpers, boolean settings, boolean valid) throws Exception {
        // A theme-only extension contains the helpers but must not hook Spotify sharing.
        var sanitizer = new ImmutableMethod(HELPER, "sanitizeUrl",
                List.of(new ImmutableMethodParameter(STRING, Set.of(), null)), STRING, 9, Set.of(), Set.of(),
                new ImmutableMethodImplementation(1, List.of(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), List.of(), List.of()));
        var classes = helpers ? List.of(new ImmutableClassDef(HELPER, 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of(sanitizer, wrapper(ResultFixture.VALID)))) : List.<ImmutableClassDef>of();
        var file = Files.createTempFile("sharing-profile-", ".dex");
        try {
            DexPool.writeTo(file.toString(), new ImmutableDexFile(Opcodes.getDefault(), classes));
            boolean accepted = true;
            try {
                VerifySharingDex.main(new String[]{file.toString(), nativeHooks ? "1" : "0", settings ? "1" : "0"});
            } catch (AssertionError | IllegalArgumentException rejected) {
                accepted = false;
            }
            if (accepted != valid) throw new AssertionError("Unexpected profile acceptance=" + accepted);
        } finally {
            Files.deleteIfExists(file);
        }
    }

    private static ImmutableClassDef resultClass(String owner, boolean includeHooks, int fullUrlArgument, int shareIdStore) {
        var code = new java.util.ArrayList<Instruction>();
        code.add(new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference("Ljava/lang/Object;", "<init>", List.of(), "V")));
        if (includeHooks) for (int argument : new int[]{1, fullUrlArgument}) {
            code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, argument, 1,
                    new ImmutableMethodReference(HELPER, "onShareUrl", List.of(STRING), STRING)));
            code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, argument));
        }
        for (int argument = 1; argument <= 4; argument++) {
            code.add(new ImmutableInstruction22c(Opcode.IPUT_OBJECT,
                    argument == 2 ? shareIdStore : argument, 0,
                    new ImmutableFieldReference(owner, "field" + argument, STRING)));
        }
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var constructor = new ImmutableMethod(owner, "<init>",
                java.util.Collections.nCopies(4, new ImmutableMethodParameter(STRING, Set.of(), null)),
                "V", 65537, Set.of(), Set.of(), new ImmutableMethodImplementation(5, code, List.of(), List.of()));
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of(constructor));
    }
}
