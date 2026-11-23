import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.nio.file.*;
import java.util.*;

/**
 * NameAudit apk names.txt
 * For each name: does a class with that (obfuscated) name exist, and does any member use it?
 * Prints "MISSING <name>" only when neither a class nor a member carries the name, which is what a
 * stale 26.44 identifier looks like in a 26.47 build.
 */
public class NameAudit {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        Set<String> classes = new HashSet<>();
        Set<String> members = new HashSet<>();
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                String t = cd.getType();
                if (t.startsWith("L") && t.endsWith(";")) t = t.substring(1, t.length() - 1);
                classes.add(t);
                for (Method m : cd.getMethods()) members.add(m.getName());
                for (Field f : cd.getFields()) members.add(f.getName());
            }
        }
        int ok = 0, missing = 0;
        for (String raw : Files.readAllLines(Paths.get(a[1]))) {
            String n = raw.trim();
            if (n.isEmpty()) continue;
            boolean isClass = classes.contains(n) || classes.contains("L" + n + ";");
            boolean isMember = members.contains(n);
            if (isClass || isMember) { ok++; continue; }
            missing++;
            System.out.println("MISSING " + n);
        }
        System.out.println("checked=" + (ok + missing) + " present=" + ok + " missing=" + missing);
    }
}
