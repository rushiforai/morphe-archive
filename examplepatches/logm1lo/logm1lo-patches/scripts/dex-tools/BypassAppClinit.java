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
 * Stubs native <clinit>()V AND replaces the Application clinit's anti-tamper
 * state machine with a minimal body:
 *   const v?, N; new-array v?, [S; fill-array-data v?, :payload;
 *   sput-object v?, Ll/ᩴܿ֡;->ۤ᩻ۜ:[S; return-void
 *
 * We KEEP the original instructions for the array setup (indices 0-3) and
 * truncate everything after the sput-object, appending return-void.
 * The fill-array-data payload stays intact because we keep the reference.
 *
 * Usage: BypassAppClinit <in.dex> <out.dex>
 */
public class BypassAppClinit {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;"; // l/ᩴܿ֡

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

                // Replace Application clinit state machine with minimal body
                if (cls.getType().equals(APP_CLASS) && "<clinit>".equals(m.getName())
                        && m.getImplementation() != null) {
                    MethodImplementation mi = m.getImplementation();
                    int regCount = mi.getRegisterCount();
                    // Keep instructions up to and including the sput-object
                    // that stores the [S array field. Then return-void.
                    int keepCount = 0;
                    boolean foundSput = false;
                    for (Instruction insn : mi.getInstructions()) {
                        if (insn.getOpcode() == Opcode.SPUT_OBJECT) {
                            foundSput = true;
                            break;
                        }
                        keepCount++;
                    }
                    if (foundSput) {
                        // keep = [0 .. keepCount] inclusive (the sput-object)
                        keepCount++; // include the sput-object itself
                        MutableMethodImplementation impl = new MutableMethodImplementation(regCount);
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
        System.out.println("stubbed=" + stubCount + " bypass=" + bypassCount);
    }
}
