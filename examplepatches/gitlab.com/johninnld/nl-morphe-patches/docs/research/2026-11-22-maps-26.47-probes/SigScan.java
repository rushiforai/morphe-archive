import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/**
 * SigScan apk methodName [param1 param2 ...] [->ret]
 * Prints every class declaring a method with exactly that name and parameter list (and return, when
 * given). This is how a renamed ABI member is found: by its signature, not its obfuscated name.
 */
public class SigScan {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        String name = a[1];
        List<String> want = new ArrayList<>();
        String ret = null;
        for (int i = 2; i < a.length; i++) {
            if (a[i].startsWith("->")) ret = a[i].substring(2); else want.add(a[i]);
        }
        int hits = 0;
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    if (!m.getName().equals(name)) continue;
                    List<String> p = new ArrayList<>();
                    for (CharSequence t : m.getParameterTypes()) p.add(t.toString());
                    if (!p.equals(want)) continue;
                    if (ret != null && !m.getReturnType().equals(ret)) continue;
                    hits++;
                    System.out.println(cd.getType() + " -> " + m + "   [" + d + "]");
                }
            }
        }
        System.out.println("hits=" + hits);
    }
}
