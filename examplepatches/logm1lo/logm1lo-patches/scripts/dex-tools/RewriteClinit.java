import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31t;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.File;
import java.util.*;

/**
 * RewriteClinit: rebuild the Application clinit from scratch as:
 *   const/16 v0, SIZE
 *   new-array v0, v0, [S
 *   fill-array-data v0, :payload
 *   sput-object v0, Ll/ᩴܿ֡;->ۤ᩻ۜ:[S
 *   return-void
 * :payload = ARRAY_PAYLOAD (short array copied from original)
 * The payload label is created fresh so the fill-array-data links correctly.
 *
 * Usage: RewriteClinit <in.dex> <out.dex>
 */
public class RewriteClinit {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;";
    static final String POOL_FIELD = "\u06e4\u1a7b\u06dc"; // ۤ᩻ۜ

    public static void main(String[] args) throws Exception {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(APP_CLASS)) { updated.add(cls); continue; }

            // Extract the pool data from the original clinit
            List<Number> poolElements = null;
            int poolSize = 0;
            for (Method m : cls.getMethods()) {
                if (!"<clinit>".equals(m.getName()) || m.getImplementation()==null) continue;
                for (Instruction ins : m.getImplementation().getInstructions()) {
                    if (ins.getOpcode() == Opcode.ARRAY_PAYLOAD) {
                        ArrayPayload ap = (ArrayPayload) ins;
                        poolElements = new ArrayList<>(ap.getArrayElements());
                        poolSize = poolElements.size();
                        System.out.println("pool size: " + poolSize);
                        break;
                    }
                }
                break;
            }
            if (poolElements == null) { updated.add(cls); continue; }

            // Build the new clinit
            MutableMethodImplementation mmi = new MutableMethodImplementation(8);
            // const/16 v0, poolSize
            mmi.addInstruction(new BuilderInstruction21s(Opcode.CONST_16, 0, poolSize));
            // new-array v0, v0, [S
            mmi.addInstruction(new BuilderInstruction22c(Opcode.NEW_ARRAY, 0, 0,
                    "com.android.tools.smali.dexlib2.immutable.ImmutableType".equals("x") ? null : "[S"));
            // fill-array-data v0, :payload
            Label payloadLabel = new Label();
            BuilderInstruction31t fill = new BuilderInstruction31t(Opcode.FILL_ARRAY_DATA, 0, payloadLabel);
            mmi.addInstruction(fill);
            // sput-object v0, field
            mmi.addInstruction(new BuilderInstruction21c(Opcode.SPUT_OBJECT, 0,
                    new ImmutableFieldReference(APP_CLASS, POOL_FIELD, "[S")));
            // payload
            mmi.addInstruction(new BuilderArrayPayload(poolSize, poolElements));
            // return-void
            mmi.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));

            Method newClinit = new ImmutableMethod(APP_CLASS, "<clinit>",
                    ImmutableMethodParameterList.of(), "V", 8 | 0x10000, null, null, mmi);

            List<Method> newMethods = new ArrayList<>();
            boolean replaced = false;
            for (Method m : cls.getMethods()) {
                if ("<clinit>".equals(m.getName())) { newMethods.add(newClinit); replaced = true; }
                else newMethods.add(m);
            }
            if (!replaced) newMethods.add(newClinit);

            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }

        DexFileFactory.writeDexFile(out, new ImmutableDexFile(Opcodes.forApi(21), updated));
        System.out.println("rewritten");
    }
}
