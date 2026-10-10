import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;

/** Ensure long-press support forwards normal row taps to the owning list. */
public final class VerifyListClickRouting {
    public static void main(String[] args) throws Exception {
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses()) {
            if (!c.getType().equals("Le/e/a/ListActions;")) continue;
            boolean click = false, forward = false, longPress = false, bind = false;
            for (Method m : c.getMethods()) {
                if (m.getName().equals("bind")) bind = true;
                if (m.getImplementation() == null) continue;
                for (Instruction i : m.getImplementation().getInstructions()) {
                    if (!(i instanceof ReferenceInstruction) || !(((ReferenceInstruction)i).getReference() instanceof MethodReference)) continue;
                    MethodReference r = (MethodReference)((ReferenceInstruction)i).getReference();
                    if (r.getName().equals("setOnClickListener")) click = true;
                    if (r.getDefiningClass().equals("Landroid/widget/AdapterView;") && r.getName().equals("performItemClick")) forward = true;
                    if (r.getName().equals("setOnLongClickListener")) longPress = true;
                }
            }
            if (!bind || !click || !forward || !longPress) throw new AssertionError("Row taps are not forwarded alongside long-press actions");
            System.out.println("List click routing: tap and long-press handlers are both installed"); return;
        }
        throw new AssertionError("ListActions.bind is missing");
    }
}
