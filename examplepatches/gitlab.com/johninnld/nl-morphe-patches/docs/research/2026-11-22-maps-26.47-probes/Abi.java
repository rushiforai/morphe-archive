import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/**
 * Abi apk interface jobClass
 * Checks, for every class implementing the given listener interface, that a one-argument method
 * exists (the extension resolves it by shape, not by parameter class name), and the same for the
 * job's one-argument method.
 */
public class Abi {
    static int count(Iterable<?> it){int n=0;for(Object o:it)n++;return n;}
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        List<ClassDef> all = new ArrayList<>();
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) all.add(cd);

        String iface = a[1];
        Map<String, ClassDef> byType = new HashMap<>();
        for (ClassDef cd : all) byType.put(cd.getType(), cd);
        ClassDef i = byType.get(iface);
        System.out.println("interface " + iface + " methods=" + (i == null ? "MISSING" : count(i.getMethods())));

        int players = 0, bad = 0;
        for (ClassDef cd : all) {
            boolean implementsIt = cd.getInterfaces().contains(iface);
            for (ClassDef p = cd; !implementsIt && p.getSuperclass() != null; ) {
                p = byType.get(p.getSuperclass());
                if (p == null) break;
                implementsIt = p.getInterfaces().contains(iface);
            }
            if (!implementsIt) continue;
            players++;
            List<String> oneArg = new ArrayList<>();
            for (Method m : cd.getMethods()) {
                if (!m.getName().equals("d")) continue;
                if (m.getParameterTypes().size() == 1) oneArg.add(m.getParameterTypes().iterator().next().toString());
            }
            if (oneArg.isEmpty()) { bad++; System.out.println("NO 1-ARG d  " + cd.getType()); }
        }
        System.out.println("player implementers=" + players + " without one-arg d=" + bad);

        String job = a[2];
        ClassDef j = byType.get(job);
        if (j == null) { System.out.println("job " + job + " MISSING"); return; }
        List<String> jobE = new ArrayList<>();
        for (Method m : j.getMethods()) if (m.getName().equals("e") && m.getParameterTypes().size() == 1) jobE.add(m.getParameterTypes().iterator().next().toString());
        System.out.println("job " + job + " one-arg e=" + jobE);
    }
}
