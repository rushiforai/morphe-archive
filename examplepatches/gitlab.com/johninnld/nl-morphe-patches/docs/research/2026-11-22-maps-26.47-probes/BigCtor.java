import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
public class BigCtor {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            for (Method m : cd.getMethods()) {
                if (!m.getName().equals("<init>") || m.getParameterTypes().size() <= 40) continue;
                boolean vg=false;
                for (CharSequence p : m.getParameterTypes()) if (p.toString().equals("Landroid/view/ViewGroup;")) vg=true;
                if (vg) System.out.println(cd.getType()+" n="+m.getParameterTypes().size()+" ["+d+"]");
            }
        }
    }
}
