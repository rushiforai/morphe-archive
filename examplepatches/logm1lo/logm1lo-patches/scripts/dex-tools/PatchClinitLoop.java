import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.immutable.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * PatchClinitLoop — breaks the Application clinit loop by forcing the check
 * result register to 1 at the sswitch_6d loop, so if-eqz takes the exit path.
 *
 * Pattern in l/ᩴܿ֡.<clinit>:
 *   :sswitch_6d
 *   invoke-static {}, Ll/ܽ֫;->۬ᩴ۟()I     (returns 0 -> loop)
 *   move-result v6
 *   if-eqz v6, :cond_7d                  (0 == 0 -> loop back)
 *   ... goto_2cc (exit)
 *
 * We replace "move-result v6" with "const/4 v6, 0x1" so if-eqz is false
 * and the code falls through to goto_2cc (exit path).
 *
 * Usage: PatchClinitLoop <in.dex> <out.dex>
 */
public class PatchClinitLoop {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;"; // l/ᩴܿ֡
    static final String CHECK_CLS = "Ll/\u073d\u05ab;"; // l/ܽ֫
    static final String CHECK_METHOD = "\u06ec\u1a74\u06df"; // ۬ᩴ۟

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int patches = 0;

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(APP_CLASS)) {
                updated.add(cls);
                continue;
            }
            List<Method> newMethods = new ArrayList<>();
            boolean classChanged = false;

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if (!"<clinit>".equals(m.getName()) || m.getImplementation() == null) {
                    newMethods.add(toAdd);
                    continue;
                }
                MutableMethodImplementation mmi = new MutableMethodImplementation(m.getImplementation());
                List<BuilderInstruction> insns = mmi.getInstructions();
                boolean methodChanged = false;

                for (int i = 0; i < insns.size() - 2; i++) {
                    Instruction ins = insns.get(i);
                    // Look for invoke-static to the check method
                    if (ins.getOpcode() == Opcode.INVOKE_STATIC) {
                        Instruction35c c = (Instruction35c) ins;
                        MethodReference mr = (MethodReference) c.getReference();
                        if (mr.getDefiningClass().equals(CHECK_CLS)
                                && mr.getName().equals(CHECK_METHOD)) {
                            // Next should be move-result vN
                            if (i + 1 < insns.size()
                                    && insns.get(i + 1).getOpcode() == Opcode.MOVE_RESULT) {
                                int reg = ((OneRegisterInstruction) insns.get(i + 1)).getRegisterA();
                                mmi.replaceInstruction(i + 1,
                                        new BuilderInstruction11n(Opcode.CONST_4, reg, 1));
                                patches++;
                                methodChanged = true;
                                i++; // skip past
                            }
                        }
                    }
                }

                if (methodChanged) {
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                    classChanged = true;
                }
                newMethods.add(toAdd);
            }

            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }

        DexFile patched = new ImmutableDexFile(Opcodes.forApi(21), updated);
        DexFileFactory.writeDexFile(out, patched);
        System.out.println("clinitLoopPatches=" + patches);
    }
}
