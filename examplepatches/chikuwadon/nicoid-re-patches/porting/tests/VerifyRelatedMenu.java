import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Inspect the rebuilt APK, including the related adapter's restricted (k=false) menu. */
public final class VerifyRelatedMenu {
    public static void main(String[] args) throws Exception {
        Map<String,ClassDef> classes = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses()) classes.put(c.getType(), c);
        ClassDef menu = Objects.requireNonNull(classes.get("Le/e/a/b0$a;"));
        int restrictedReads = 0, menuAdds = 0;
        Set<Integer> labels = new HashSet<>();
        for (Method m : menu.getMethods()) if (m.getName().equals("onClick")) {
            for (Instruction i : m.getImplementation().getInstructions()) {
                if (i instanceof NarrowLiteralInstruction) labels.add(((NarrowLiteralInstruction)i).getNarrowLiteral());
                if (i instanceof ReferenceInstruction) {
                    Object ref = ((ReferenceInstruction)i).getReference();
                    if (ref instanceof FieldReference) {
                        FieldReference f = (FieldReference)ref;
                        if (f.getDefiningClass().equals("Le/e/a/b0;") && f.getName().equals("k")) restrictedReads++;
                    }
                    if (ref instanceof MethodReference) {
                        MethodReference r = (MethodReference)ref;
                        if (r.getDefiningClass().equals("Landroid/view/Menu;") && r.getName().equals("add")) menuAdds++;
                    }
                }
            }
        }
        // Only playlist actions retain the k guard; popup/background must not read it.
        if (restrictedReads != 1) throw new AssertionError("Related playback still gated: k reads=" + restrictedReads);
        if (menuAdds != 7) throw new AssertionError("Missing menu construction paths: " + menuAdds);
        for (int id : new int[]{0x7f0f00d9,0x7f0f00d8,0x7f0f00d7,0x7f0f00d4,0x7f0f00d5})
            if (!labels.contains(id)) throw new AssertionError("Missing menu label: " + Integer.toHexString(id));
        System.out.println("Related menu: five labels, seven construction paths, only playlist guard retained");
    }
}
