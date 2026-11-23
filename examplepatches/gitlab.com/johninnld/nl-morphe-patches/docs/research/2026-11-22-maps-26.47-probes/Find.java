import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;
import java.util.regex.Pattern;

/** Find classes by regex over "name(params)ret". Usage: Find APK 'regex' ... */
public class Find {
    static String desc(Method m) {
        StringBuilder b = new StringBuilder(m.getName()).append('(');
        for (CharSequence p : m.getParameterTypes()) b.append(p);
        return b.append(')').append(m.getReturnType()).toString();
    }
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        List<Pattern> pats = new ArrayList<>();
        for (int i = 1; i < args.length; i++) pats.add(Pattern.compile(args[i]));
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    String s = desc(m);
                    boolean all = true;
                    for (Pattern p : pats) if (!p.matcher(s).find()) { all = false; break; }
                    if (all) { System.out.println(cd.getType() + "  " + s + "  [" + d + "]"); break; }
                }
            }
        }
    }
}
