import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.File;
import java.util.*;

/** Verify all six blacklist cap/counter sites directly in an APK, including the previously missed multi-selection listener. */
class BlacklistLimitDexTest {
    public static void main(String[] args) throws Exception {
        Map<String,String> targets = Map.of("Les0;","a", "Lnf;","onClick", "Lpj;","invokeSuspend", "Lsr0;","onClick", "Lhj;","invoke", "Lox;","invoke");
        Set<String> verified = new HashSet<>();
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses()) {
                if (!targets.containsKey(cls.getType())) continue;
                for (Method method : cls.getMethods()) {
                    if (!method.getName().equals(targets.get(cls.getType()))) continue;
                    int thousand = 0;
                    int hundred = 0;
                    boolean newMessage = false;
                    for (Instruction instruction : method.getImplementation().getInstructions()) {
                        if (instruction instanceof NarrowLiteralInstruction literal) {
                            if (literal.getNarrowLiteral() == 1000) thousand++;
                            if (literal.getNarrowLiteral() == 100) hundred++;
                        }
                        if (instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof StringReference text) {
                            if (text.getString().equals(" (100/100)")) throw new AssertionError("Old message remains");
                            if (text.getString().equals(" (1000/1000)")) newMessage = true;
                        }
                    }
                    if (thousand != 1 || (!cls.getType().equals("Lhj;") && !cls.getType().equals("Lox;") && hundred != 0) || (cls.getType().equals("Lnf;") && !newMessage)) {
                        throw new AssertionError(cls.getType()+": new="+thousand+" old="+hundred);
                    }
                    if (!verified.add(cls.getType())) throw new AssertionError("Duplicate target class");
                    System.out.println("Verified 1000-app limit: " + cls.getType() + "->" + method.getName());
                }
            }
        }
        if (verified.size() != 6) throw new AssertionError("Missing blacklist target");
    }
}
