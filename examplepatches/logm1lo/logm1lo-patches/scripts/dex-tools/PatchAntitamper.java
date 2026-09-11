import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.immutable.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * PatchAntitamper v2 — neutralize ALL RuntimeException throws in bin.mt.plus.Main.<init>
 * and onCreate. Finds every NEW_INSTANCE RuntimeException ... THROW sequence and
 * replaces the whole block with return-void.
 *
 * Usage: PatchAntitamper <in.dex> <out.dex>
 */
public class PatchAntitamper {
    static final String MAIN_CLS = "Lbin/mt/plus/Main;";

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int totalPatches = 0;

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(MAIN_CLS)) {
                updated.add(cls);
                continue;
            }
            List<Method> newMethods = new ArrayList<>();
            boolean classChanged = false;

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if (m.getImplementation() == null) {
                    newMethods.add(toAdd);
                    continue;
                }
                if (!"<init>".equals(m.getName()) && !"onCreate".equals(m.getName())) {
                    newMethods.add(toAdd);
                    continue;
                }

                MutableMethodImplementation mmi =
                        new MutableMethodImplementation(m.getImplementation());
                int patches = patchAllThrows(mmi);
                if (patches > 0) {
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                    classChanged = true;
                    totalPatches += patches;
                }
                newMethods.add(toAdd);
            }

            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }

        DexFile patched = new ImmutableDexFile(Opcodes.forApi(21), updated);
        DexFileFactory.writeDexFile(out, patched);
        System.out.println("antiTamperThrowsPatched=" + totalPatches);
    }

    /** Replaces every NEW_INSTANCE RuntimeException..THROW block with return-void. */
    static int patchAllThrows(MutableMethodImplementation mmi) {
        int patched = 0;
        boolean done = false;
        while (!done) {
            done = true;
            List<BuilderInstruction> insns = mmi.getInstructions();
            for (int i = 0; i < insns.size(); i++) {
                Instruction ins = insns.get(i);
                if (ins.getOpcode() != Opcode.NEW_INSTANCE) continue;
                BuilderInstruction21c ni = (BuilderInstruction21c) ins;
                if (!"Ljava/lang/RuntimeException;".equals(ni.getReference().toString())) continue;
                // Find THROW within next 5 instructions
                int throwIdx = -1;
                for (int j = i; j < insns.size() && j < i + 6; j++) {
                    if (insns.get(j).getOpcode() == Opcode.THROW) {
                        throwIdx = j;
                        break;
                    }
                }
                if (throwIdx == -1) continue;
                // Remove throwIdx..i (reverse), then insert return-void at i
                for (int j = throwIdx; j >= i; j--) {
                    mmi.removeInstruction(j);
                }
                mmi.addInstruction(i, new BuilderInstruction10x(Opcode.RETURN_VOID));
                patched++;
                done = false;
                break; // restart scan
            }
        }
        return patched;
    }
}
