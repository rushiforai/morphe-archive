import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;
import java.util.regex.Pattern;
/** ClassHas APK 'regex' ... : classes where EACH pattern matches at least one method. */
public class ClassHas {
    static String desc(Method m) {
        StringBuilder b = new StringBuilder(m.getName()).append('(');
        for (CharSequence p : m.getParameterTypes()) b.append(p);
        return b.append(')').append(m.getReturnType()).toString();
    }
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        List<Pattern> pats = new ArrayList<>();
        for (int i = 1; i < args.length; i++) pats.add(Pattern.compile(args[i]));
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            boolean[] hit = new boolean[pats.size()];
            for (Method m : cd.getMethods()) {
                String s = desc(m);
                for (int k = 0; k < pats.size(); k++) if (!hit[k] && pats.get(k).matcher(s).find()) hit[k] = true;
            }
            boolean all = true;
            for (boolean h : hit) if (!h) all = false;
            if (all) System.out.println(cd.getType() + " [" + d + "]");
        }
    }
}
