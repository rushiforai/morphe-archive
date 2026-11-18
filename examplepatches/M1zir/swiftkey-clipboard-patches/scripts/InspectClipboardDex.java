import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.io.File;

/** Local diagnostic: prints only the two clipboard methods changed by this patch. */
class InspectClipboardDex {
    public static void main(String[] args) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (var entry : container.getDexEntryNames()) {
            for (var cls : container.getEntry(entry).getDexFile().getClasses()) {
                if (!cls.getType().equals("Lu90/v;")) continue;
                for (var method : cls.getMethods()) {
                    if (!method.getName().equals("b") && !method.getName().equals("compareTo")) continue;
                    System.out.println(method + " registers=" + method.getImplementation().getRegisterCount());
                    int index = 0;
                    for (var i : method.getImplementation().getInstructions()) {
                        var s = new StringBuilder(index++ + " " + i.getOpcode());
                        if (i instanceof OneRegisterInstruction a) s.append(" v").append(a.getRegisterA());
                        if (i instanceof TwoRegisterInstruction b) s.append(",v").append(b.getRegisterB());
                        if (i instanceof ThreeRegisterInstruction c) s.append(",v").append(c.getRegisterC());
                        if (i instanceof ReferenceInstruction r) s.append(" ").append(r.getReference());
                        if (i instanceof WideLiteralInstruction l) s.append(" #").append(l.getWideLiteral());
                        if (i instanceof OffsetInstruction o) s.append(" offset=").append(o.getCodeOffset());
                        System.out.println(s);
                    }
                }
            }
        }
    }
}
