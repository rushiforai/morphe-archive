import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.File;
import java.util.regex.Pattern;

/** Inspect the actual shipped bytecode. No decompiler substitutions or guessed source names. */
public class DexInspect {
    public static void main(String[] args) throws Exception {
        boolean byClass = args[0].startsWith("class:");
        Pattern pattern = Pattern.compile(byClass ? args[0].substring(6) : args[0]);
        for (int n = 1; n < args.length; n++) {
            var container = DexFileFactory.loadDexContainer(new File(args[n]), Opcodes.getDefault());
            for (String entry : container.getDexEntryNames()) {
                for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses()) {
                    if (byClass && !pattern.matcher(cls.getType()).find()) continue;
                    for (Method method : cls.getMethods()) {
                        var code = method.getImplementation();
                        if (code == null) continue;
                        boolean match = byClass;
                        for (Instruction ins : code.getInstructions()) {
                            if (ins instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s
                                    && pattern.matcher(s.getString()).find()) match = true;
                        }
                        if (!match) continue;
                        System.out.println("\n" + args[n] + "!" + entry + " " + method + " registers=" + code.getRegisterCount());
                        int offset = 0;
                        for (Instruction ins : code.getInstructions()) {
                            StringBuilder text = new StringBuilder(String.format("%04x %s", offset, ins.getOpcode()));
                            if (ins instanceof FiveRegisterInstruction r) {
                                int[] registers = {r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};
                                text.append(" {");
                                for(int i=0;i<r.getRegisterCount();i++) text.append(i==0?"":",").append("v").append(registers[i]);
                                text.append("}");
                            } else if (ins instanceof RegisterRangeInstruction r) text.append(" {v").append(r.getStartRegister()).append(" .. count ").append(r.getRegisterCount()).append("}");
                            else if (ins instanceof ThreeRegisterInstruction r) text.append(" v").append(r.getRegisterA()).append(",v").append(r.getRegisterB()).append(",v").append(r.getRegisterC());
                            else if (ins instanceof TwoRegisterInstruction r) text.append(" v").append(r.getRegisterA()).append(",v").append(r.getRegisterB());
                            else if (ins instanceof OneRegisterInstruction r) text.append(" v").append(r.getRegisterA());
                            if (ins instanceof ReferenceInstruction r) text.append(" ").append(r.getReference());
                            if (ins instanceof WideLiteralInstruction l) text.append(" #").append(l.getWideLiteral());
                            if (ins instanceof OffsetInstruction o) text.append(String.format(" -> %04x",offset+o.getCodeOffset()));
                            System.out.println(text);
                            offset += ins.getCodeUnits();
                        }
                    }
                }
            }
        }
    }
}
