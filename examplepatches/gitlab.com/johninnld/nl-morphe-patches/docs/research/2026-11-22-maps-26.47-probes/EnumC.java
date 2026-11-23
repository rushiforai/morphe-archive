import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/**
 * EnumC apk : finds a method `c(X)X` where X is an enum. That is the shape of Maps' distance-unit
 * converter, whose class name is obfuscated differently every release.
 */
public class EnumC {
    static boolean isEnum(Map<String, ClassDef> byType, String type) {
        for (ClassDef c = byType.get(type); c != null && c.getSuperclass() != null; ) {
            if ("Ljava/lang/Enum;".equals(c.getSuperclass())) return true;
            c = byType.get(c.getSuperclass());
        }
        return false;
    }

    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        Map<String, ClassDef> byType = new HashMap<>();
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) byType.put(cd.getType(), cd);
        int hits = 0;
        for (ClassDef cd : byType.values()) {
            for (Method m : cd.getMethods()) {
                if (!m.getName().equals(a.length > 1 ? a[1] : "c")) continue;
                if (m.getParameterTypes().size() != 1) continue;
                String p = m.getParameterTypes().iterator().next().toString();
                if (!p.equals(m.getReturnType())) continue;
                if (!isEnum(byType, p)) continue;
                hits++;
                System.out.println(cd.getType() + " -> " + m);
            }
        }
        System.out.println("hits=" + hits);
    }
}
