import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.ArrayList;

/** Writes the identity getter and consumers required by IdentityApkCheck without Android. */
public class WalkApkFixture {
    private static final String UTILS = "Lapp/morphe/extension/shared/Utils;";
    private static final String SETTINGS =
            "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;";
    private static final String LOGS = "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;";
    private static final String STRING = "Ljava/lang/String;";
    private static final ImmutableMethodReference GET_IDENTITY =
            new ImmutableMethodReference(UTILS, "getPatchesBuildIdentity", List.of(), STRING);

    private static ImmutableMethod method(String owner, String name, String returns, Instruction... code) {
        return new ImmutableMethod(owner, name, List.of(), returns,
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null,
                new ImmutableMethodImplementation(1, List.of(code), null, null));
    }

    private static ImmutableInstruction35c readIdentity() {
        return new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, GET_IDENTITY);
    }

    private static ImmutableMethod summary(String owner, String name) {
        return method(owner, name, STRING, readIdentity(),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
    }

    private static ImmutableClassDef type(String descriptor, ImmutableMethod... methods) {
        return new ImmutableClassDef(descriptor, AccessFlags.PUBLIC.getValue(), "Ljava/lang/Object;",
                null, null, null, null, List.of(methods));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2 && !(args.length == 3 && args[2].equals("clobber"))) {
            throw new IllegalArgumentException("usage: WalkApkFixture.java <classes.dex> <expected identity> [clobber]");
        }
        Path output = Path.of(args[0]);
        if (output.getParent() != null) Files.createDirectories(output.getParent());
        List<Instruction> getter = new ArrayList<>();
        getter.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(args[1])));
        if (args.length == 3) {
            getter.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("stale identity")));
        }
        getter.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        var classes = List.of(
                type(UTILS, method(UTILS, "getPatchesBuildIdentity", STRING, getter.toArray(Instruction[]::new))),
                type(SETTINGS,
                        method(SETTINGS, "initialize", "V", readIdentity(),
                                new ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        summary(SETTINGS, "buildIdentitySummary")),
                type(LOGS, summary(LOGS, "buildReport")));
        DexPool.writeTo(output.toString(), new ImmutableDexFile(Opcodes.forApi(30), classes));
        System.out.println("[fixture] wrote identity getter and three consumers to " + output);
    }
}
