import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * StubAllNatives — removes ACC_NATIVE from ALL native methods in l.* classes
 * and gives them safe default implementations based on return type.
 * Skips <clinit> (already handled) and m43976 (registration driver).
 *
 * Usage: StubAllNatives <in.dex> <out.dex>
 */
public class StubAllNatives {
    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int stubCount = 0;

        for (ClassDef cls : dex.getClasses()) {
            // Only l.* classes
            if (!cls.getType().startsWith("Ll/")) {
                updated.add(cls);
                continue;
            }
            List<Method> newMethods = new ArrayList<>();
            boolean classChanged = false;

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                if ((m.getAccessFlags() & 0x100) != 0  // native
                        && !"<clinit>".equals(m.getName())) {
                    int flags = m.getAccessFlags() & ~0x100;
                    // Compute register count: parameters + 1 (for 'this' if not static)
                    int regCount = 0;
                    boolean isStatic = (flags & 0x8) != 0;
                    if (!isStatic) regCount++;
                    for (com.android.tools.smali.dexlib2.iface.MethodParameter p : m.getParameters()) {
                        regCount += 1;
                        if ("J".equals(p.getType()) || "D".equals(p.getType())) regCount++;
                    }
                    if (regCount == 0) regCount = 1;
                    // Wide returns need 2 registers for the wide value
                    if (("J".equals(m.getReturnType()) || "D".equals(m.getReturnType())) && regCount < 2) {
                        regCount = 2;
                    }
                    MutableMethodImplementation impl = new MutableMethodImplementation(regCount);
                    String rt = m.getReturnType();

                    if ("<init>".equals(m.getName())) {
                        // Native constructor: call super.<init>()V, store [B param into [B field if present, return
                        String superCls = cls.getSuperclass();
                        if (superCls != null) {
                            impl.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT,
                                    1, 0, 0, 0, 0, 0,
                                    new ImmutableMethodReference(superCls, "<init>",
                                            java.util.Collections.<String>emptyList(), "V")));
                        }
                        // If a [B field exists and first param is [B, store it
                        String bField = null;
                        for (com.android.tools.smali.dexlib2.iface.Field f : cls.getFields()) {
                            if ("[B".equals(f.getType())) { bField = f.getName(); break; }
                        }
                        boolean firstParamIsB = m.getParameters().size() > 0
                                && "[B".equals(m.getParameters().get(0).getType());
                        if (bField != null && firstParamIsB) {
                            // iput-object p1, p0, Lcls;-><field>:[B
                            impl.addInstruction(new BuilderInstruction22c(Opcode.IPUT_OBJECT, 1, 0,
                                    new ImmutableFieldReference(cls.getType(), bField, "[B")));
                        }
                        impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                    } else {
                        switch (rt) {
                            case "V":
                                impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                                break;
                            case "Z":
                            case "B":
                            case "S":
                            case "C":
                            case "I":
                                impl.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 0));
                                impl.addInstruction(new BuilderInstruction11x(Opcode.RETURN, 0));
                                break;
                            case "J":
                            case "D":
                                impl.addInstruction(new BuilderInstruction21s(Opcode.CONST_WIDE_16, 0, 0));
                                impl.addInstruction(new BuilderInstruction11x(Opcode.RETURN_WIDE, 0));
                                break;
                            default: // objects
                                impl.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 0));
                                impl.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
                                break;
                        }
                    }
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), flags,
                            m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                    stubCount++;
                    classChanged = true;
                }
                newMethods.add(toAdd);
            }

            updated.add(classChanged
                    ? new ImmutableClassDef(cls.getType(), cls.getAccessFlags(),
                            cls.getSuperclass(), cls.getInterfaces(), cls.getSourceFile(),
                            cls.getAnnotations(), cls.getFields(), newMethods)
                    : cls);
        }

        DexFile patched = new ImmutableDexFile(Opcodes.forApi(21), updated);
        DexFileFactory.writeDexFile(out, patched);
        System.out.println("nativeStubs=" + stubCount);
    }
}
