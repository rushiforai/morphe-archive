import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/** SurfaceProbe APK [fieldType] : classes with a method taking a Surface and (optionally) fields of a type. */
public class SurfaceProbe {
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        String fieldType = args.length > 1 ? args[1] : null;
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            boolean takesSurface = false, returnsSurface = false;
            int arrayInt = 0;
            for (Method m : cd.getMethods()) {
                for (CharSequence p : m.getParameterTypes()) if (p.toString().equals("Landroid/view/Surface;")) takesSurface = true;
                if (m.getReturnType().equals("Landroid/view/Surface;")) returnsSurface = true;
                if (m.getReturnType().equals("[I")) arrayInt++;
            }
            if (!takesSurface && !returnsSurface) continue;
            if (fieldType != null) {
                boolean has = false;
                for (Field f : cd.getFields()) if (f.getType().equals(fieldType)) has = true;
                if (!has) continue;
            }
            List<String> flds = new ArrayList<>();
            for (Field f : cd.getFields()) flds.add(f.getName() + ":" + f.getType());
            System.out.println(cd.getType() + "  surface=" + (takesSurface ? "set" : "") + (returnsSurface ? "/get" : "")
                + " intArrays=" + arrayInt + "  fields=" + flds + " [" + d + "]");
        }
    }
}
