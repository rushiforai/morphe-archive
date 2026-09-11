import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.File;
import java.util.*;

/**
 * ReplaceMainInit3 — replaces bin.mt.plus.Main.<init> with a minimal valid init.
 * Usage: ReplaceMainInit3 <in.dex> <out.dex>
 */
public class ReplaceMainInit3 {
    static final String MAIN_CLS = "Lbin/mt/plus/Main;";

    public static void main(String[] args) throws Exception {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int replaced = 0;

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(MAIN_CLS)) { updated.add(cls); continue; }
            List<Method> newMethods = new ArrayList<>();
            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if ("<init>".equals(m.getName())) {
                    String superCls = cls.getSuperclass();
                    MutableMethodImplementation mmi = new MutableMethodImplementation(4);
                    // invoke-direct {p0}, <super>-><init>()V
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT,
                            1, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference(superCls, "<init>",
                                    ImmutableMethodParameterList.of(), "V")));
                    // new-instance v0, Ljava/util/ArrayList;
                    mmi.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, "Ljava/util/ArrayList;"));
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT,
                            1, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference("Ljava/util/ArrayList;", "<init>",
                                    ImmutableMethodParameterList.of(), "V")));
                    mmi.addInstruction(new BuilderInstruction22c(Opcode.IPUT_OBJECT, 0, 0,
                            new ImmutableFieldReference(MAIN_CLS, "\u06e0\u0736", "Ljava/util/ArrayList;")));
                    // new-instance v0, Ljava/util/LinkedList;
                    mmi.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, "Ljava/util/LinkedList;"));
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT,
                            1, 0, 0, 0, 0, 0, 0,
                            new ImmutableMethodReference("Ljava/util/LinkedList;", "<init>",
                                    ImmutableMethodParameterList.of(), "V")));
                    mmi.addInstruction(new BuilderInstruction22c(Opcode.IPUT_OBJECT, 0, 0,
                            new ImmutableFieldReference(MAIN_CLS, "\u06e7\u0736", "Ljava/util/LinkedList;")));
                    mmi.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));

                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                    replaced++;
                }
                newMethods.add(toAdd);
            }
            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }
        DexFileFactory.writeDexFile(out, new ImmutableDexFile(Opcodes.forApi(21), updated));
        System.out.println("replaced=" + replaced);
    }
}
