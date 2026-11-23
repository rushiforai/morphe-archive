import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;

/** Where apk Ltype;  -> lists dex entries that DEFINE the class, with method count */
public class Where {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                if (cd.getType().equals(a[1])) {
                    int n = 0;
                    for (Method m : cd.getMethods()) { n++; if (m.getName().equals("b")) System.out.println("   b " + m); }
                    System.out.println(d + " methods=" + n + " source=" + cd.getSourceFile() + " super=" + cd.getSuperclass());
                }
            }
        }
    }
}
