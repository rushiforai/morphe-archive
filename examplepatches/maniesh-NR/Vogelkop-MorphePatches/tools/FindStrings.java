import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/** Finds where given substrings live in an APK's dex: static field initial
 *  values and/or const-string instructions. */
public final class FindStrings {
    public static void main(String[] args) throws Exception {
        String apk = args[0];
        com.android.tools.smali.dexlib2.iface.MultiDexContainer<? extends DexFile> container =
                com.android.tools.smali.dexlib2.DexFileFactory.loadDexContainer(
                        new File(apk), Opcodes.getDefault());
        List<String> needles = new ArrayList<>();
        for (int i = 1; i < args.length; i++) needles.add(args[i]);

        for (String dexName : container.getDexEntryNames()) {
            DexFile dex = container.getEntry(dexName).getDexFile();
            for (ClassDef cls : dex.getClasses()) {
                for (Field f : cls.getFields()) {
                    if (f.getInitialValue() instanceof StringEncodedValue) {
                        String v = ((StringEncodedValue) f.getInitialValue()).getValue();
                        for (String n : needles) {
                            if (v.contains(n)) {
                                System.out.printf("FIELD  %s %s->%s:%s  flags=0x%x  value=%s%n",
                                        dexName, cls.getType(), f.getName(), f.getType(),
                                        f.getAccessFlags(), shorten(v));
                            }
                        }
                    }
                }
                for (Method m : cls.getMethods()) {
                    if (m.getImplementation() == null) continue;
                    for (Instruction insn : m.getImplementation().getInstructions()) {
                        if (!(insn instanceof ReferenceInstruction)) continue;
                        if (((ReferenceInstruction) insn).getReference() instanceof StringReference) {
                            String v = ((StringReference) ((ReferenceInstruction) insn).getReference()).getString();
                            for (String n : needles) {
                                if (v.contains(n)) {
                                    System.out.printf("INSTR  %s %s->%s%s  const=%s%n",
                                            dexName, cls.getType(), m.getName(),
                                            m.getParameterTypes(), shorten(v));
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private static String shorten(String s) {
        return s.length() > 100 ? s.substring(0, 100) + "…" : s;
    }
}
