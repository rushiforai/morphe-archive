import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;
public class TwoArrays {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            int arr=0, obj=0; boolean surf=false;
            for (Method m: cd.getMethods()) { if (m.getReturnType().equals("[I")) arr++;
                for (CharSequence p: m.getParameterTypes()) if (p.toString().equals("Landroid/view/Surface;")) surf=true; }
            for (Field f: cd.getFields()) if (f.getType().equals("Ljava/lang/Object;")) obj++;
            if (arr>=2 && (obj>=2 || surf)) {
                StringBuilder b=new StringBuilder();
                for (Field f: cd.getFields()) b.append(f.getName()).append(':').append(f.getType()).append(' ');
                System.out.println(cd.getType()+" arr="+arr+" obj="+obj+" surf="+surf+"  "+b+" ["+d+"]");
            }
        }
    }
}
