import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction10x;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.google.common.collect.Lists;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Stubs all native <clinit>()V methods in classes.dex in-place (no smali
 * round-trip). Preserves all other dex content exactly.
 */
public class StubClinits {
    public static void main(String[] args) throws IOException {
        String in = args[0];
        String out = args[1];
        File dexFile = new File(in);

        DexFile dex = DexFileFactory.loadDexFile(dexFile, Opcodes.forApi(21));
        Set<? extends ClassDef> classes = dex.getClasses();

        int patched = 0;
        List<ClassDef> updated = new ArrayList<>();

        for (ClassDef cls : classes) {
            String clsName = cls.getType();
            List<Method> newMethods = new ArrayList<>();
            boolean changed = false;

            for (Method m : cls.getMethods()) {
                if ("<clinit>".equals(m.getName()) && m.getReturnType().equals("V")
                        && (m.getAccessFlags() & 0x100 /* ACC_NATIVE */) != 0) {
                    // Replace native clinit with return-void
                    int flags = m.getAccessFlags() & ~0x100; // clear ACC_NATIVE
                    MutableMethodImplementation impl = new MutableMethodImplementation(1);
                    impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                    ImmutableMethod nm = new ImmutableMethod(
                            m.getDefiningClass(),
                            m.getName(),
                            m.getParameters(),
                            m.getReturnType(),
                            flags,
                            m.getAnnotations(),
                            m.getHiddenApiRestrictions(),
                            impl
                    );
                    newMethods.add(nm);
                    changed = true;
                    patched++;
                } else {
                    newMethods.add(m);
                }
            }

            if (changed) {
                updated.add(new ImmutableClassDef(
                        cls.getType(), cls.getAccessFlags(), cls.getSuperclass(),
                        cls.getInterfaces(), cls.getSourceFile(), cls.getAnnotations(),
                        cls.getFields(), newMethods));
            } else {
                updated.add(cls);
            }
        }

        DexPool pool = new DexPool(Opcodes.forApi(21));
        for (ClassDef c : updated) {
            pool.internClass(c);
        }
        // Build an ImmutableDexFile from the updated classes and write it
        DexFile patchedDex = new com.android.tools.smali.dexlib2.immutable.ImmutableDexFile(
                Opcodes.forApi(21), updated);
        com.android.tools.smali.dexlib2.DexFileFactory.writeDexFile(out, patchedDex);
        System.out.println("Patched " + patched + " native <clinit> methods");
    }
}
