import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import java.io.File;
import java.util.zip.ZipFile;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class DumpMethod {
    public static void main(String[] a) throws Exception {
        String apk = a[0];
        String clsName = a[1];
        String mName = a[2];
        int from = Integer.parseInt(a[3]);
        int to = a.length > 4 ? Integer.parseInt(a[4]) : Integer.MAX_VALUE;
        ZipFile zf = new ZipFile(new File(apk));
        List<java.util.zip.ZipEntry> list = new ArrayList<>();
        java.util.Enumeration<? extends java.util.zip.ZipEntry> en = zf.entries();
        while (en.hasMoreElements()) {
            var e = en.nextElement();
            if (e.getName().matches("classes.*\\.dex")) list.add(e);
        }
        for (var entry : list) {
            File tmp = File.createTempFile("dexdumpx", ".dex");
            try (var in = zf.getInputStream(entry); var out = new FileOutputStream(tmp)) {
                in.transferTo(out);
            }
            DexFile dex;
            try { dex = DexFileFactory.loadDexFile(tmp, Opcodes.getDefault()); }
            catch (Throwable t) { tmp.delete(); continue; }
            ClassDef cls = null;
            for (ClassDef c : dex.getClasses()) { if (c.getType().equals(clsName)) { cls = c; break; } }
            if (cls == null) { tmp.delete(); continue; }
            System.out.println("class " + clsName + " found in " + entry.getName());
            for (Method m : cls.getMethods()) {
                if (!m.getName().equals(mName)) continue;
                List<Instruction> insns = new ArrayList<>();
                for (Instruction insn : m.getImplementation().getInstructions()) insns.add(insn);
                int n = insns.size();
                System.out.println(mName + " insns=" + n + " range " + from + ".." + Math.min(n, to));
                for (int i = from; i < Math.min(n, to); i++) {
                    Instruction insn = insns.get(i);
                    String regs = "";
                    if (insn instanceof OneRegisterInstruction) { regs = "v" + ((OneRegisterInstruction) insn).getRegisterA(); if (insn instanceof TwoRegisterInstruction) regs += ",v" + ((TwoRegisterInstruction) insn).getRegisterB(); }
                    else if (insn instanceof TwoRegisterInstruction) regs = "v" + ((TwoRegisterInstruction) insn).getRegisterA() + ",v" + ((TwoRegisterInstruction) insn).getRegisterB();
                    else if (insn instanceof FiveRegisterInstruction) {
                        FiveRegisterInstruction f = (FiveRegisterInstruction) insn;
                        int[] rr = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
                        StringBuilder sb = new StringBuilder();
                        for (int r = 0; r < f.getRegisterCount(); r++) sb.append("v").append(rr[r]).append(" ");
                        regs = sb.toString();
                    } else if (insn instanceof RegisterRangeInstruction) {
                        var rr = (RegisterRangeInstruction) insn;
                        regs = "v" + rr.getStartRegister() + "..v" + (rr.getStartRegister() + rr.getRegisterCount() - 1);
                    }
                    String ref = ""; if (insn instanceof com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction) ref = "literal=0x" + Integer.toHexString(((com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction) insn).getNarrowLiteral());
                    try { ref = ((ReferenceInstruction) insn).getReference().toString(); } catch (Throwable t2) {}
                    System.out.printf("%5d %-16s %-16s %s%n", i, insn.getOpcode().name(), regs, ref);
                }
            }
            tmp.delete();
            System.exit(0);
        }
        System.out.println("class not found");
    }
}
