import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction12x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * PatchVip — forces MT Manager VIP native getters to return true at every call site.
 *
 * Pattern: invoke-static {}, Ll/ۨ᩸ܰ;->X()Z  then  move-result vN
 * We replace the move-result with const/4 vN, 0x1 (true).
 *
 * Usage: PatchVip <in.dex> <out.dex>
 */
public class PatchVip {
    static final String VIP_CLS = "Ll/\u06e8\u1a78\u0730;"; // l/ۨ᩸ܰ

    // The 7 native boolean getters to force true
    static final String[] GETTERS = {
        "\u05a1",  // ֡()Z
        "\u06d8",  // ۘ()Z
        "\u06e0",  // ۠()Z
        "\u0730",  // ܰ()Z
        "\u073a",  // ܺ()Z
        "\u1a76",  // ᩶()Z
        "\u1a77",  // ᩷()Z
    };

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];
        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int patchCount = 0;

        for (ClassDef cls : dex.getClasses()) {
            boolean classChanged = false;
            List<Method> newMethods = new ArrayList<>();

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                boolean methodChanged = false;
                if (m.getImplementation() != null) {
                    MutableMethodImplementation mmi =
                            new MutableMethodImplementation(m.getImplementation());
                    List<BuilderInstruction> insns = mmi.getInstructions();
                    // Iterate in reverse so indices stay valid after replacement
                    for (int i = insns.size() - 1; i >= 0; i--) {
                        Instruction insn = insns.get(i);
                        if (isVipCall(insn)) {
                            // Next instruction should be move-result
                            if (i + 1 < insns.size()) {
                                Instruction next = insns.get(i + 1);
                                if (next.getOpcode() == Opcode.MOVE_RESULT) {
                                    int reg = ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) next).getRegisterA();
                                    // Replace move-result with const/16 vN, 0x1 (handles all registers)
                                    mmi.replaceInstruction(i + 1,
                                            new BuilderInstruction21s(Opcode.CONST_16, reg, 1));
                                    patchCount++;
                                    methodChanged = true;
                                }
                            }
                        }
                    }
                    if (methodChanged) {
                        toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                                m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                                m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
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
        System.out.println("vipPatches=" + patchCount);
    }

    static boolean isVipCall(Instruction insn) {
        if (insn.getOpcode() != Opcode.INVOKE_STATIC &&
            insn.getOpcode() != Opcode.INVOKE_STATIC_RANGE) return false;
        MethodReference mr = null;
        if (insn.getOpcode() == Opcode.INVOKE_STATIC) {
            mr = (MethodReference) ((Instruction35c) insn).getReference();
        } else {
            mr = (MethodReference) ((Instruction3rc) insn).getReference();
        }
        if (!mr.getDefiningClass().equals(VIP_CLS)) return false;
        if (!"Z".equals(mr.getReturnType())) return false;
        for (String g : GETTERS) {
            if (mr.getName().equals(g)) return true;
        }
        return false;
    }
}
