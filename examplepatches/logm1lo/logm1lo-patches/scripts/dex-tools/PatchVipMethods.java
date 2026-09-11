import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.immutable.*;
import java.io.File;
import java.util.*;

/**
 * PatchVipMethods: replace the 7 VIP boolean getter METHODS in l/ۨ᩸ܰ
 * with `const/4 v0, 0x1; return v0` (always true).
 * This makes EVERY call site see true — no move-result patching needed,
 * so the file-listing interaction can't break.
 */
public class PatchVipMethods {
    static final String VIP_CLS = "Ll/\u06e8\u1a78\u0730;";
    static final String[] GETTERS = {
        "\u05a1",  // ֡()Z
        "\u06d8",  // ۘ()Z
        "\u06e0",  // ۠()Z
        "\u0730",  // ܰ()Z
        "\u073a",  // ܺ()Z
        "\u1a76",  // ᩶()Z
        "\u1a77",  // ᩷()Z
    };
    public static void main(String[] args) throws Exception {
        String in=args[0], out=args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int patched = 0;
        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(VIP_CLS)) { updated.add(cls); continue; }
            List<Method> newMethods = new ArrayList<>();
            boolean changed = false;
            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                boolean isGetter = false;
                for (String g : GETTERS) {
                    if (m.getName().equals(g) && "Z".equals(m.getReturnType())
                            && m.getParameters().size() == 0) { isGetter = true; break; }
                }
                if (isGetter) {
                    MutableMethodImplementation impl = new MutableMethodImplementation(1);
                    impl.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 1));
                    impl.addInstruction(new BuilderInstruction11x(Opcode.RETURN, 0));
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                    patched++; changed = true;
                }
                newMethods.add(toAdd);
            }
            updated.add(changed
                ? new ImmutableClassDef(cls.getType(), cls.getAccessFlags(), cls.getSuperclass(),
                    cls.getInterfaces(), cls.getSourceFile(), cls.getAnnotations(), cls.getFields(), newMethods)
                : cls);
        }
        DexFileFactory.writeDexFile(out, new ImmutableDexFile(Opcodes.forApi(21), updated));
        System.out.println("vipMethodsPatched="+patched);
    }
}
