import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31i;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.immutable.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Stubs native <clinit>()V AND patches Application clinit key reads.
 * Usage: PatchAppKeys <in.dex> <out.dex> [key3_hex] [key4_hex]
 */
public class PatchAppKeys {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;"; // l/ᩴܿ֡
    static final String KEY1_CLS = "Ll/\u06e4\u06da;";  // l/ۤۚ
    static final String KEY2_CLS = "Ll/\u06da\u06d6;";  // l/ۚۖ
    static final String KEY1_NAME = "\u06df\u073f\u0733"; // ۟ܿܳ
    static final String KEY2_NAME = "\u06ec\u073d\u06d7"; // ۬ܽۗ

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        int key3 = args.length > 2 ? (int) (long) Long.decode(args[2]) : 0x1581;
        int key4 = args.length > 3 ? (int) (long) Long.decode(args[3]) : 0;

        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int stubCount = 0, keyPatchCount = 0;

        for (ClassDef cls : dex.getClasses()) {
            boolean classChanged = false;
            List<Method> newMethods = new ArrayList<>();

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                boolean methodChanged = false;

                // Stub native <clinit>
                if ("<clinit>".equals(m.getName()) && "V".equals(m.getReturnType())
                        && (m.getAccessFlags() & 0x100) != 0) {
                    int flags = m.getAccessFlags() & ~0x100;
                    MutableMethodImplementation impl = new MutableMethodImplementation(1);
                    impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), flags,
                            m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                    stubCount++; methodChanged = true;
                }

                // Patch key reads in ALL methods (not just Application clinit)
                if (m.getImplementation() != null) {
                    MutableMethodImplementation mmi =
                            new MutableMethodImplementation(m.getImplementation());
                    List<BuilderInstruction> insns = mmi.getInstructions();
                    for (int i = 0; i < insns.size(); i++) {
                        Instruction insn = insns.get(i);
                        if (insn.getOpcode() == Opcode.SGET) {
                            Instruction21c c = (Instruction21c) insn;
                            FieldReference fr = (FieldReference) c.getReference();
                            int reg = c.getRegisterA();
                            int val = -1;
                            if (fr.getDefiningClass().equals(KEY1_CLS)
                                    && fr.getName().equals(KEY1_NAME)) val = key3;
                            else if (fr.getDefiningClass().equals(KEY2_CLS)
                                    && fr.getName().equals(KEY2_NAME)) val = key4;
                            if (val != -1) {
                                mmi.replaceInstruction(i,
                                        new BuilderInstruction31i(Opcode.CONST, reg, val));
                                keyPatchCount++; methodChanged = true;
                            }
                        }
                    }
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                }
                newMethods.add(toAdd);
                classChanged |= methodChanged;
            }

            updated.add(classChanged
                    ? new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                            cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                            cls.getAnnotations(), cls.getFields(), newMethods)
                    : cls);
        }

        DexFile patched = new ImmutableDexFile(Opcodes.forApi(21), updated);
        DexFileFactory.writeDexFile(out, patched);
        System.out.println("stubbed=" + stubCount + " keyPatches=" + keyPatchCount);
    }
}
