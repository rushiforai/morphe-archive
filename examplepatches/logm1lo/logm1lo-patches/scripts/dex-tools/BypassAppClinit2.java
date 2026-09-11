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
 * BypassAppClinit2 — surgically replaces the Application clinit state machine
 * with: pool setup (const/new-array/fill-array-data/sput-object INCLUDING the
 * array payload) + return-void. Skips the anti-tamper/loop state machine.
 *
 * Usage: BypassAppClinit2 <in.dex> <out.dex>
 */
public class BypassAppClinit2 {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;"; // l/ᩴܿ֡

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int bypassCount = 0;

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(APP_CLASS)) {
                updated.add(cls);
                continue;
            }
            List<Method> newMethods = new ArrayList<>();
            boolean classChanged = false;

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if ("<clinit>".equals(m.getName()) && m.getImplementation() != null) {
                    MethodImplementation mi = m.getImplementation();
                    int regCount = mi.getRegisterCount();
                    List<Instruction> insns = new ArrayList<>();
                    for (Instruction ins : mi.getInstructions()) insns.add(ins);

                    // Find the sput-object that stores the [S pool
                    int sputIdx = -1;
                    for (int i = 0; i < insns.size(); i++) {
                        Instruction ins = insns.get(i);
                        if (ins.getOpcode() == Opcode.SPUT_OBJECT) {
                            sputIdx = i;
                            break;
                        }
                    }
                    if (sputIdx != -1) {
                        // Find the fill-array-data payload index (keep it so the link works)
                        int payloadIdx = -1;
                        for (int i = 0; i < insns.size(); i++) {
                            if (insns.get(i).getOpcode() == Opcode.ARRAY_PAYLOAD) {
                                payloadIdx = i;
                                break;
                            }
                        }
                        // Copy ALL instructions via MutableMethodImplementation(mi),
                        // then remove the state machine (4..payloadIdx-1), keep pool+payload.
                        MutableMethodImplementation impl = new MutableMethodImplementation(mi);
                        // Remove instructions from index payloadIdx-1 down to 4
                        // (the state machine between pool setup and the payload).
                        // Keep [0..3] (const/new-array/fill-array-data/sput-object),
                        // then [payloadIdx] (the array payload), then append return-void.
                        // Strategy: remove 4..payloadIdx-1 in reverse, then truncate
                        // everything after payloadIdx.
                        // First remove all after payloadIdx (in reverse):
                        for (int i = insns.size() - 1; i > payloadIdx; i--) {
                            impl.removeInstruction(i);
                        }
                        // Then remove 4..payloadIdx-1 (the state machine) in reverse:
                        for (int i = payloadIdx - 1; i >= 4; i--) {
                            impl.removeInstruction(i);
                        }
                        // Now impl = [0..3] + [payloadIdx-as-4] (array payload)
                        // Append return-void:
                        impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                        toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                                m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                                m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                        bypassCount++;
                        classChanged = true;
                        System.out.println("Bypass: kept 0..3 + payload of " + insns.size() + " insns");
                    }
                }
                newMethods.add(toAdd);
            }

            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }

        DexFile patched = new ImmutableDexFile(Opcodes.forApi(21), updated);
        DexFileFactory.writeDexFile(out, patched);
        System.out.println("bypass=" + bypassCount);
    }
}
