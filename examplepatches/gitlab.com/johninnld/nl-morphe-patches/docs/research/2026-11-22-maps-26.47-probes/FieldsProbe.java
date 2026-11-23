import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/** FieldsProbe APK <fieldType> [methodName methodRet methodParams...] */
public class FieldsProbe {
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        String type = args[1];
        String meth = args.length > 2 ? args[2] : null;
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            boolean hasField = false;
            List<String> fieldNames = new ArrayList<>();
            for (Field f : cd.getFields()) if (f.getType().equals(type)) { hasField = true; fieldNames.add(f.getName()); }
            if (!hasField) continue;
            boolean hasMeth = true;
            if (meth != null) {
                hasMeth = false;
                for (Method m : cd.getMethods()) if (m.getName().equals(meth) && m.getParameterTypes().size() == 1 && m.getReturnType().equals("V")) hasMeth = true;
            }
            if (hasMeth) System.out.println(cd.getType() + "  fields=" + fieldNames + "  [" + d + "]");
        }
    }
}
