import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import java.io.File;
import java.util.*;

/** Reports injected CHECK_CASTs on parameter registers whose type differs from the declaration. */
public class EmittedParameterCasts {
  public static void main(String[] args) throws Exception {
    File apk = new File(args[0]);
    MultiDexContainer<?> c = DexFileFactory.loadDexContainer(apk, null);
    int casts = 0, mismatches = 0;
    for (String n : c.getDexEntryNames()) {
      DexFile d = c.getEntry(n).getDexFile();
      for (ClassDef cd : d.getClasses()) {
        for (Method m : cd.getMethods()) {
          if (m.getImplementation() == null) continue;
          boolean injected = false;
          for (Instruction i : m.getImplementation().getInstructions()) {
            if (i instanceof ReferenceInstruction) {
              String r = ((ReferenceInstruction) i).getReference().toString();
              if (r.contains("gboardpatches") || r.contains("morphe")) { injected = true; break; }
            }
          }
          if (!injected || cd.getType().startsWith("Ldev/jason/")) continue;
          int regs = m.getImplementation().getRegisterCount();
          List<? extends CharSequence> params = m.getParameterTypes();
          int pcount = params.size() + (m.getAccessFlags() != 0 ? 1 : 1); // instance/static handled below
          boolean isStatic = (m.getAccessFlags() & 0x8) != 0;
          int firstParam = regs - params.size() - (isStatic ? 0 : 1);
          int idx = -1;
          for (Instruction ins : m.getImplementation().getInstructions()) {
            idx++;
            if (!ins.getOpcode().toString().equals("CHECK_CAST")) continue;
            casts++;
            if (!(ins instanceof OneRegisterInstruction) || !(ins instanceof ReferenceInstruction)) continue;
            int reg = ((OneRegisterInstruction) ins).getRegisterA();
            String type = ((TypeReference) ((ReferenceInstruction) ins).getReference()).getType();
            int paramIdx = reg - firstParam;
            if (paramIdx < 0 || paramIdx >= params.size()) continue;
            String declared = params.get(paramIdx).toString();
            if (!declared.equals(type)) {
              mismatches++;
              if (mismatches <= 12) System.out.println("MISMATCH " + cd.getType() + "->" + m.getName()
                  + " insn#" + idx + " p" + (paramIdx + (isStatic ? 0 : 1))
                  + " declared=" + declared + " cast=" + type);
            }
          }
        }
      }
    }
    System.out.println("check-casts=" + casts + " mismatches=" + mismatches);
  }
}
