import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;
import java.util.*;

/** Verify that a regular uploader continues creation instead of looping on redirect. */
public final class VerifyUploaderRouting {
    public static void main(String[] args) throws Exception {
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses()) {
            if (!c.getType().equals("Lcom/sauzask/nicoid/NicoidUserVideoListActivity;")) continue;
            for (Method m : c.getMethods()) if (m.getName().equals("onCreate")) {
                List<Instruction> code = new ArrayList<>();
                List<Integer> addresses = new ArrayList<>(); int address = 0;
                for (Instruction i : m.getImplementation().getInstructions()) {code.add(i); addresses.add(address); address += i.getCodeUnits();}
                for (int n = 0; n < code.size(); n++) {
                    Instruction i = code.get(n);
                    if (!(i instanceof ReferenceInstruction) || !(((ReferenceInstruction)i).getReference() instanceof MethodReference)) continue;
                    MethodReference r = (MethodReference)((ReferenceInstruction)i).getReference();
                    if (!r.getDefiningClass().equals("Le/e/a/ChannelPage;") || !r.getName().equals("redirect")) continue;
                    Instruction branch = code.get(n+2);
                    if (code.get(n+1).getOpcode()!=Opcode.MOVE_RESULT || branch.getOpcode()!=Opcode.IF_EQZ || code.get(n+3).getOpcode()!=Opcode.RETURN_VOID)
                        throw new AssertionError("Unexpected channel routing control flow");
                    int target = addresses.get(n+2)+((OffsetInstruction)branch).getCodeOffset();
                    if (target<=addresses.get(n+3) || !addresses.contains(target))
                        throw new AssertionError("Regular uploader loops or exits before creation: target="+target);
                    System.out.println("Uploader routing: regular uploader continues, channel redirect returns"); return;
                }
            }
        }
        throw new AssertionError("Uploader routing hook missing");
    }
}
