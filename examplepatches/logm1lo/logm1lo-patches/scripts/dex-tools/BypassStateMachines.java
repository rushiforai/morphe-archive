import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.immutable.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Generalized DEX state-machine bypass for MT Manager.
 *
 * For every class whose <clinit> contains:
 *   - a sput-object of a [S array field (the REAL setup work), AND
 *   - a sparse-switch (the anti-tamper state machine),
 * we keep the instructions up to and including the sput-object and append
 * return-void, truncating the rest of the state machine.
 *
 * This preserves the class's static field init while removing the keyed
 * anti-tamper loop. Also stubs all native <clinit>()V.
 *
 * Usage: BypassStateMachines <in.dex> <out.dex>
 */
public class BypassStateMachines {
    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int stubCount = 0, bypassCount = 0;

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

                // Bypass <clinit> state machine
                if ("<clinit>".equals(m.getName()) && m.getImplementation() != null
                        && (m.getAccessFlags() & 0x100) == 0) {
                    MethodImplementation mi = m.getImplementation();
                    // Does this clinit have a sparse-switch?
                    boolean hasSparse = false;
                    boolean hasArraySput = false;
                    int keepCount = 0;
                    for (Instruction insn : mi.getInstructions()) {
                        if (insn.getOpcode() == Opcode.SPARSE_SWITCH) {
                            hasSparse = true;
                            break;
                        }
                    }
                    if (hasSparse) {
                        // find the sput-object of [S
                        keepCount = 0;
                        for (Instruction insn : mi.getInstructions()) {
                            if (insn.getOpcode() == Opcode.SPUT_OBJECT) {
                                hasArraySput = true;
                                break;
                            }
                            keepCount++;
                        }
                    }
                    if (hasSparse && hasArraySput) {
                        keepCount++; // include the sput-object
                        MutableMethodImplementation impl =
                                new MutableMethodImplementation(mi.getRegisterCount());
                        int i = 0;
                        for (Instruction insn : mi.getInstructions()) {
                            if (i >= keepCount) break;
                            if (insn instanceof com.android.tools.smali.dexlib2.builder.BuilderInstruction) {
                                impl.addInstruction((com.android.tools.smali.dexlib2.builder.BuilderInstruction) insn);
                            }
                            i++;
                        }
                        impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                        toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                                m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                                m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                        bypassCount++; methodChanged = true;
                    }
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
        System.out.println("stubbed=" + stubCount + " bypassed=" + bypassCount);
    }
}
