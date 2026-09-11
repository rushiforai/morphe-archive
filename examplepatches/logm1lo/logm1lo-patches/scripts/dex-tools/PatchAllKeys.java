import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31i;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * PatchAllKeys — stubs native <clinit>()V AND patches ALL 39 native XOR-key reads
 * to the values captured from a genuine install via Frida (2026-08-11).
 *
 * Also has a mode to patch VIP native getter call sites:
 *   --vip <dex> <out> : replace move-result after invoke-static l/ۨ᩸ܰ;->X()Z with const/4 0x1
 *
 * Usage: PatchAllKeys <in.dex> <out.dex>
 */
public class PatchAllKeys {
    // 39 key entries: class descriptor, field name, value
    static final List<String[]> KEYS = new ArrayList<>();
    static {
        // l.ۖ.֡᩵᩹ = 3472 (0xd90)
        KEYS.add(new String[]{"Ll/\u06d6;", "\u05a1\u1a75\u1a79", "3472"});
        // l.ۖۨ.ۧۙۜ = 3939 (0xf63)
        KEYS.add(new String[]{"Ll/\u06d6\u06e8;", "\u06e7\u06d9\u06dc", "3939"});
        // l.ۚۖ.۬ܽۗ = -2251 (0xfffff735)
        KEYS.add(new String[]{"Ll/\u06da\u06d6;", "\u06ec\u073d\u06d7", "-2251"});
        // l.ۚۘ.ܿܳۧ = -967 (0xfffffc39)
        KEYS.add(new String[]{"Ll/\u06da\u06d8;", "\u073f\u0733\u06e7", "-967"});
        // l.ۡ۫.۬ܽۜ = -8328 (0xffffdf78)
        KEYS.add(new String[]{"Ll/\u06e1\u06eb;", "\u06ec\u073d\u06dc", "-8328"});
        // l.ۢ۬.᩺᩷ۨ = 2647 (0xa57)
        KEYS.add(new String[]{"Ll/\u06e2\u06ec;", "\u1a7a\u1a77\u06e8", "2647"});
        // l.ۤۖ.۠᩶֫ = -2097 (0xfffff7cf)
        KEYS.add(new String[]{"Ll/\u06e4\u06d6;", "\u06e0\u1a76\u05ab", "-2097"});
        // l.ۤۘ.᩷ۤ᩹ = -7838 (0xffffe162)
        KEYS.add(new String[]{"Ll/\u06e4\u06d8;", "\u1a77\u06e4\u1a79", "-7838"});
        // l.ۤۚ.۟ܿܳ = 5505 (0x1581)
        KEYS.add(new String[]{"Ll/\u06e4\u06da;", "\u06df\u073f\u0733", "5505"});
        // l.ۚܶ.ۛۧۜ = -5911 (0xffffe8e9)
        KEYS.add(new String[]{"Ll/\u06da\u0736;", "\u06db\u06e7\u06dc", "-5911"});
        // l.۟᩹.ۨ֨ܺ = -9464 (0xffffdb08)
        KEYS.add(new String[]{"Ll/\u06df\u1a79;", "\u06e8\u05a8\u073a", "-9464"});
        // l.᩷.ܿۖᩴ = -247 (0xffffff09)
        KEYS.add(new String[]{"Ll/\u1a77;", "\u073f\u06d6\u1a74", "-247"});
        // l.ܰۙ.᩻ܺ֫ = 5745 (0x1671)
        KEYS.add(new String[]{"Ll/\u0730\u06d9;", "\u1a7b\u073a\u05ab", "5745"});
        // l.ܳۗ.ۚᩳ᩸ = -4190 (0xffffefa2)
        KEYS.add(new String[]{"Ll/\u0733\u06d7;", "\u06da\u1a73\u1a78", "-4190"});
        // l.ܳۘ.ܳۢ᩵ = 0 (0x0)
        KEYS.add(new String[]{"Ll/\u0733\u06d8;", "\u0733\u06e2\u1a75", "0"});
        // l.ܳܽ.ܰ᩻᩺ = 0 (0x0)
        KEYS.add(new String[]{"Ll/\u0733\u073d;", "\u0730\u1a7b\u1a7a", "0"});
        // l.ܳܿ.ۗ᩷᩵ = -5891 (0xffffe8fd)
        KEYS.add(new String[]{"Ll/\u0733\u073f;", "\u06d7\u1a77\u1a75", "-5891"});
        // l.ܺ۬.ۧۢۚ = -2384 (0xfffff6b0)
        KEYS.add(new String[]{"Ll/\u073a\u06ec;", "\u06e7\u06e2\u06da", "-2384"});
        // l.ܽ֫.ۨۤۙ = 0 (0x0)
        KEYS.add(new String[]{"Ll/\u073d\u05ab;", "\u06e8\u06e4\u06d9", "0"});
        // l.ܽ֫.۬ = 0 (0x0)
        KEYS.add(new String[]{"Ll/\u073d\u05ab;", "\u06ec", "0"});
        // l.ܽۛ.֡ۜܿ = 9004 (0x232c)
        KEYS.add(new String[]{"Ll/\u073d\u06db;", "\u05a1\u06dc\u073f", "9004"});
        // l.ܽۜ.֨᩹ۚ = -4772 (0xffffed5c)
        KEYS.add(new String[]{"Ll/\u073d\u06dc;", "\u05a8\u1a79\u06da", "-4772"});
        // l.ܽ۠.ۚۗ֨ = -5688 (0xffffe9c8)
        KEYS.add(new String[]{"Ll/\u073d\u06e0;", "\u06da\u06d7\u05a8", "-5688"});
        // l.ܽۡ.ܰᩳۗ = 6132 (0x17f4)
        KEYS.add(new String[]{"Ll/\u073d\u06e1;", "\u0730\u1a73\u06d7", "6132"});
        // l.ܽᩴ.᩻ܽ۫ = 7251 (0x1c53)
        KEYS.add(new String[]{"Ll/\u073d\u1a74;", "\u1a7b\u073d\u06eb", "7251"});
        // l.ᩴ᩶.᩻ܶ֡ = -4873 (0xffffecf7)
        KEYS.add(new String[]{"Ll/\u1a74\u1a76;", "\u1a7b\u0736\u05a1", "-4873"});
        // l.᩵۬.֨֨ۤ = -7291 (0xffffe385)
        KEYS.add(new String[]{"Ll/\u1a75\u06ec;", "\u05a8\u05a8\u06e4", "-7291"});
        // l.᩵᩶.ܿۧ۫ = -5944 (0xffffe8c8)
        KEYS.add(new String[]{"Ll/\u1a75\u1a76;", "\u073f\u06e7\u06eb", "-5944"});
        // l.᩵᩷.᩺ܶ᩵ = 3194 (0xc7a)
        KEYS.add(new String[]{"Ll/\u1a75\u1a77;", "\u1a7a\u0736\u1a75", "3194"});
        // l.᩵᩹.ܽۚۚ = 2642 (0xa52)
        KEYS.add(new String[]{"Ll/\u1a75\u1a79;", "\u073d\u06da\u06da", "2642"});
        // l.᩵᩺.ۙܳܳ = -4387 (0xffffeedd)
        KEYS.add(new String[]{"Ll/\u1a75\u1a7a;", "\u06d9\u0733\u0733", "-4387"});
        // l.᩵᩻.ᩳܳܶ = 1647 (0x66f)
        KEYS.add(new String[]{"Ll/\u1a75\u1a7b;", "\u1a73\u0733\u0736", "1647"});
        // l.᩸ۗ.᩻ۡ֨ = 731 (0x2db)
        KEYS.add(new String[]{"Ll/\u1a78\u06d7;", "\u1a7b\u06e1\u05a8", "731"});
        // l.᩹ۘ.ۜۤۢ = -7087 (0xffffe451)
        KEYS.add(new String[]{"Ll/\u1a79\u06d8;", "\u06dc\u06e4\u06e2", "-7087"});
        // l.᩺ܶ.۫ۚ᩻ = 4484 (0x1184)
        KEYS.add(new String[]{"Ll/\u1a7a\u0736;", "\u06eb\u06da\u1a7b", "4484"});
        // l.᩻᩵.۫۟ۜ = 9194 (0x23ea)
        KEYS.add(new String[]{"Ll/\u1a7b\u1a75;", "\u06eb\u06df\u06dc", "9194"});
        // l.᩻᩷.᩺ۛۖ = 1435 (0x59b)
        KEYS.add(new String[]{"Ll/\u1a7b\u1a77;", "\u1a7a\u06db\u06d6", "1435"});
        // l.ۤᩳ.ۨۘܿ = -6213 (0xffffe7bb)
        KEYS.add(new String[]{"Ll/\u06e4\u1a73;", "\u06e8\u06d8\u073f", "-6213"});
        // l.ᩳ.ۜۢۢ = -5250 (0xffffeb7e)
        KEYS.add(new String[]{"Ll/\u1a73;", "\u06dc\u06e2\u06e2", "-5250"});
    }

    static int keyValueFor(FieldReference fr) {
        for (String[] e : KEYS) {
            if (e[0].equals(fr.getDefiningClass()) && e[1].equals(fr.getName())) {
                return (int) (long) Long.decode(e[2]);
            }
        }
        return Integer.MIN_VALUE; // not found
    }

    // 12 native-set boolean flags: class descriptor, field name, value (0/1)
    static final List<String[]> BOOLS = new ArrayList<>();
    static {
        // l/ۙۛ.۬ۧ᩻ = false
        BOOLS.add(new String[]{"Ll/\u06d9\u06db;", "\u06ec\u06e7\u1a7b", "0"});
        // l/۫.ۤ֨ۜ = true
        BOOLS.add(new String[]{"Ll/\u06eb;", "\u06e4\u05a8\u06dc", "1"});
        // l/ۛܰ.ۡ۫᩺ = true
        BOOLS.add(new String[]{"Ll/\u06db\u0730;", "\u06e1\u06eb\u1a7a", "1"});
        // l/ۤᩴ.ܶۘܰ = false
        BOOLS.add(new String[]{"Ll/\u06e4\u1a74;", "\u0736\u06d8\u0730", "0"});
        // l/ܺ۫.ۡ۟۠ = false
        BOOLS.add(new String[]{"Ll/\u073a\u06eb;", "\u06e1\u06df\u06e0", "0"});
        // l/᩸۠.ܽۡۨ = true
        BOOLS.add(new String[]{"Ll/\u1a78\u06e0;", "\u073d\u06e1\u06e8", "1"});
        // l/ۡ.ۤᩴۚ = false
        BOOLS.add(new String[]{"Ll/\u06e1;", "\u06e4\u1a74\u06da", "0"});
        // l/ᩴᩴ.۠ۖ᩹ = true
        BOOLS.add(new String[]{"Ll/\u1a74\u1a74;", "\u06e0\u06d6\u1a79", "1"});
        // l/ۗ᩶.ۖۚۙ = false
        BOOLS.add(new String[]{"Ll/\u06d7\u1a76;", "\u06d6\u06da\u06d9", "0"});
        // l/᩶۠.ۖۘ۬ = true
        BOOLS.add(new String[]{"Ll/\u1a76\u06e0;", "\u06d6\u06d8\u06ec", "1"});
        // l/۟᩷.᩸ۡ᩹ = false
        BOOLS.add(new String[]{"Ll/\u06df\u1a77;", "\u1a78\u06e1\u1a79", "0"});
        // l/ᩴᩳ.ۛ۫ۛ = true
        BOOLS.add(new String[]{"Ll/\u1a74\u1a73;", "\u06db\u06eb\u06db", "1"});
    }

    static int boolValueFor(FieldReference fr) {
        for (String[] e : BOOLS) {
            if (e[0].equals(fr.getDefiningClass()) && e[1].equals(fr.getName())) {
                return (int) (long) Long.decode(e[2]);
            }
        }
        return -1; // not found
    }

    public static void main(String[] args) throws IOException {
        String in = args[0], out = args[1];

        DexFile dex = DexFileFactory.loadDexFile(new File(in), Opcodes.forApi(21));
        List<ClassDef> updated = new ArrayList<>();
        int stubCount = 0, keyPatchCount = 0;

        for (ClassDef cls : dex.getClasses()) {
            boolean classChanged = false;
            List<Method> newMethods = new ArrayList<>();

            for (Method m : cls.getMethods()) {
                Method toAdd = m;
                boolean methodChanged = false;

                // Stub native <clinit> and the m43976 registration driver (l/᩹ܶ֡.ۛ᩶ۗ(I)V)
                boolean isRegDriver = "<clinit>".equals(m.getName())
                        ? false
                        : "ۛ᩶ۗ".equals(m.getName()) && "V".equals(m.getReturnType())
                            && (m.getAccessFlags() & 0x100) != 0
                            && m.getParameters().size() == 1
                            && "I".equals(m.getParameters().get(0).getType());
                if (("<clinit>".equals(m.getName()) && "V".equals(m.getReturnType())
                        && (m.getAccessFlags() & 0x100) != 0)
                        || isRegDriver) {
                    int flags = m.getAccessFlags() & ~0x100;
                    MutableMethodImplementation impl = new MutableMethodImplementation(1);
                    impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), flags,
                            m.getAnnotations(), m.getHiddenApiRestrictions(), impl);
                    stubCount++; methodChanged = true;
                }

                // Patch key reads in ALL methods
                if (m.getImplementation() != null) {
                    MutableMethodImplementation mmi =
                            new MutableMethodImplementation(m.getImplementation());
                    List<BuilderInstruction> insns = mmi.getInstructions();
                    for (int i = 0; i < insns.size(); i++) {
                        Instruction insn = insns.get(i);
                        if (insn.getOpcode() == Opcode.SGET) {
                            Instruction21c c = (Instruction21c) insn;
                            FieldReference fr = (FieldReference) c.getReference();
                            int val = keyValueFor(fr);
                            if (val != Integer.MIN_VALUE) {
                                int reg = c.getRegisterA();
                                mmi.replaceInstruction(i,
                                        new BuilderInstruction31i(Opcode.CONST, reg, val));
                                keyPatchCount++; methodChanged = true;
                            }
                        } else if (insn.getOpcode() == Opcode.SGET_BOOLEAN) {
                            Instruction21c c = (Instruction21c) insn;
                            FieldReference fr = (FieldReference) c.getReference();
                            int val = boolValueFor(fr);
                            if (val != -1) {
                                int reg = c.getRegisterA();
                                mmi.replaceInstruction(i,
                                        new BuilderInstruction21s(Opcode.CONST_16, reg, val));
                                keyPatchCount++; methodChanged = true;
                            }
                        }
                    }
                    toAdd = new ImmutableMethod(m.getDefiningClass(), m.getName(),
                            m.getParameters(), m.getReturnType(), m.getAccessFlags(),
                            m.getAnnotations(), m.getHiddenApiRestrictions(), mmi);
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
        System.out.println("stubbed=" + stubCount + " keyPatches=" + keyPatchCount);
    }
}
