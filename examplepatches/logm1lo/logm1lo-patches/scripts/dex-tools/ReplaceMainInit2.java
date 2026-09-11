import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.File;
import java.util.*;

/**
 * ReplaceMainInit2 — replaces bin.mt.plus.Main.<init> with a minimal valid init
 * using smali-text injection (addInstructions), which handles references correctly.
 *
 * Usage: ReplaceMainInit2 <in.dex> <out.dex>
 */
public class ReplaceMainInit2 {
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
                    MutableMethodImplementation mmi = new MutableMethodImplementation(4);
                    // Super class init: use the class's own superclass
                    String superCls = cls.getSuperclass();
                    mmi.addInstructions(0, "" +
                        "invoke-direct {p0}, " + superCls + "-><init>()V\n" +
                        "new-instance v0, Ljava/util/ArrayList;\n" +
                        "invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V\n" +
                        "iput-object v0, p0, " + MAIN_CLS + "->\u06e0\u0736:Ljava/util/ArrayList;\n" +
                        "new-instance v0, Ljava/util/LinkedList;\n" +
                        "invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V\n" +
                        "iput-object v0, p0, " + MAIN_CLS + "->\u06e7\u0736:Ljava/util/LinkedList;\n" +
                        "return-void\n");
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
