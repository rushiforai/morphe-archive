import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import java.io.File;
import java.util.*;

/**
 * ReplaceMainInit — replaces bin.mt.plus.Main.<init> with a minimal valid init:
 *   super.<init>()V
 *   init ArrayList + LinkedList fields
 *   return-void
 * Skips the state machine that loops on decrypt routing.
 *
 * Usage: ReplaceMainInit <in.dex> <out.dex>
 */
public class ReplaceMainInit {
    static final String MAIN_CLS = "Lbin/mt/plus/Main;";
    static final String SUPER_CLS = "Ll/\u06eb\u0736\u05a1;"; // l/۫ܶ֡
    static final String AL_FIELD = "\u06e0\u0736";   // ۠ܶ
    static final String LL_FIELD = "\u06e7\u0736";   // ۧܶ

    public static void main(String[] args) throws Exception {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();

        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(MAIN_CLS)) { updated.add(cls); continue; }
            List<Method> newMethods = new ArrayList<>();
            boolean changed = false;
            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if ("<init>".equals(m.getName())) {
                    MutableMethodImplementation mmi = new MutableMethodImplementation(4);
                    // invoke-direct {p0}, Ll/۫ܶ֡;-><init>()V
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT, 0,
                            new ImmutableMethodReference(SUPER_CLS, "<init>", "V",
                                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameterList.of())));
                    // new-instance v0, Ljava/util/ArrayList;
                    mmi.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, "Ljava/util/ArrayList;"));
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT, 0,
                            new ImmutableMethodReference("Ljava/util/ArrayList;", "<init>", "V",
                                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameterList.of())));
                    mmi.addInstruction(new BuilderInstruction22c(Opcode.IPUT_OBJECT, 0, 0,
                            new ImmutableFieldReference(MAIN_CLS, AL_FIELD, "Ljava/util/ArrayList;")));
                    // new-instance v0, Ljava/util/LinkedList;
                    mmi.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, "Ljava/util/LinkedList;"));
                    mmi.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT, 0,
                            new ImmutableMethodReference("Ljava/util/LinkedList;", "<init>", "V",
                                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameterList.of())));
                    mmi.addInstruction(new BuilderInstruction22c(Opcode.IPUT_OBJECT, 0, 0,
                            new ImmutableFieldReference(MAIN_CLS, LL_FIELD, "Ljava/util/LinkedList;")));
                    mmi.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));

                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
                    changed = true;
                }
                newMethods.add(toAdd);
            }
            updated.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                    cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                    cls.getAnnotations(), cls.getFields(), newMethods));
        }
        DexFileFactory.writeDexFile(out, new ImmutableDexFile(Opcodes.forApi(21), updated));
        System.out.println("replaced=" + (changed ? 1 : 0));
    }
}
