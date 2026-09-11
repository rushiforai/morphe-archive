import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.immutable.*;
import java.io.File;
import java.util.*;

/**
 * EarlyReturn: patch the Application clinit (l/ᩴܿ֡) to return-void at the first
 * sparse-switch (after pool setup), skipping the state machine entirely.
 * Keeps the original pool setup instructions (with valid payloads).
 * Usage: EarlyReturn <in.dex> <out.dex>
 */
public class EarlyReturn {
    static final String APP_CLASS = "Ll/\u1a74\u073f\u05a1;";
    public static void main(String[] args) throws Exception {
        String in=args[0], out=args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int patched = 0;
        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(APP_CLASS)) { updated.add(cls); continue; }
            List<Method> newMethods = new ArrayList<>();
            boolean changed = false;
            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if ("<clinit>".equals(m.getName()) && m.getImplementation()!=null) {
                    MutableMethodImplementation mmi = new MutableMethodImplementation(m.getImplementation());
                    List<BuilderInstruction> insns = mmi.getInstructions();
                    int sputIdx = -1;
                    for (int i=0;i<insns.size();i++) {
                        if (insns.get(i).getOpcode()==Opcode.SPUT_OBJECT) { sputIdx=i; break; }
                    }
                    int ssIdx = -1;
                    for (int i=sputIdx+1;i<insns.size();i++) {
                        if (insns.get(i).getOpcode()==Opcode.SPARSE_SWITCH) { ssIdx=i; break; }
                    }
                    if (ssIdx != -1) {
                        mmi.replaceInstruction(ssIdx, new BuilderInstruction10x(Opcode.RETURN_VOID));
                        patched++; changed = true;
                    }
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                        m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                        m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                }
                newMethods.add(toAdd);
            }
            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                cls.getAnnotations(), cls.getFields(), newMethods));
        }
        DexFileFactory.writeDexFile(out, new ImmutableDexFile(Opcodes.forApi(21), updated));
        System.out.println("earlyReturnPatches="+patched);
    }
}
