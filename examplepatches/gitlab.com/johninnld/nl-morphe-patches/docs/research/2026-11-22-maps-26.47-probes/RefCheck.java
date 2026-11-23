import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.nio.file.*;
import java.util.*;

/** RefCheck APK file-with-refs : each line "Ltype;->name:type" or "Ltype;->name(params)ret". */
public class RefCheck {
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        Map<String, ClassDef> byType = new HashMap<>();
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) byType.put(cd.getType(), cd);
        for (String line : Files.readAllLines(Paths.get(args[1]))) {
            line = line.trim();
            if (line.isEmpty()) continue;
            int arrow = line.indexOf("->");
            String owner = line.substring(0, arrow);
            String rest = line.substring(arrow + 2);
            ClassDef cd = byType.get(owner);
            if (cd == null) { System.out.println("MISSING CLASS  " + line); continue; }
            boolean ok;
            if (rest.contains("(")) {
                String name = rest.substring(0, rest.indexOf('('));
                String params = rest.substring(rest.indexOf('(') + 1, rest.indexOf(')'));
                String ret = rest.substring(rest.indexOf(')') + 1);
                ok = false;
                for (Method m : cd.getMethods()) {
                    if (!m.getName().equals(name) || !m.getReturnType().equals(ret)) continue;
                    StringBuilder b = new StringBuilder();
                    for (CharSequence p : m.getParameterTypes()) b.append(p);
                    if (b.toString().equals(params)) { ok = true; break; }
                }
            } else {
                String name = rest.substring(0, rest.indexOf(':'));
                String type = rest.substring(rest.indexOf(':') + 1);
                ok = false;
                for (Field f : cd.getFields()) if (f.getName().equals(name) && f.getType().equals(type)) { ok = true; break; }
            }
            System.out.println((ok ? "OK       " : "MISSING  ") + line);
        }
    }
}
