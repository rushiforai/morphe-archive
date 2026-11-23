import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
public class TwoFields {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            boolean vg=false, x=false, manyCtor=false;
            for (Field f : cd.getFields()) {
                if (f.getType().equals("Landroid/view/ViewGroup;")) vg=true;
                if (f.getType().equals(a[1])) x=true;
            }
            for (Method m : cd.getMethods()) if (m.getName().equals("<init>") && m.getParameterTypes().size()>40) manyCtor=true;
            if (vg && x && manyCtor) System.out.println(cd.getType()+" vg="+vg+" x="+x+" manyCtor="+manyCtor+" ["+d+"]");
        }
    }
}
