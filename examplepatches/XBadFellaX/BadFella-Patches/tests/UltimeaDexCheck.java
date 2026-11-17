import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.Method;

/** Uses tools/DexInventory.java to compare every original method after a FULL rebuild. */
public class UltimeaDexCheck {
    static Map<String, Method> methods(String path) throws Exception {
        var apk = DexFileFactory.loadDexContainer(new File(path), null);
        Map<String, Method> result = new TreeMap<>();
        for (var entry : apk.getDexEntryNames())
            for (var c : apk.getEntry(entry).getDexFile().getClasses())
                for (var m : c.getMethods()) result.put(DexInventory.id(m), m);
        return result;
    }

    public static void main(String[] args) throws Exception {
        var stock = methods(args[0]);
        var patched = methods(args[1]);
        var changed = new ArrayList<String>();
        for (var entry : stock.entrySet()) {
            var replacement = patched.get(entry.getKey());
            if (replacement == null) throw new AssertionError("Removed method: " + entry.getKey());
            var before = DexInventory.describe(entry.getValue(), Set.of());
            var after = DexInventory.describe(replacement, Set.of());
            if (!Objects.equals(before.get("body"), after.get("body"))) changed.add(entry.getKey());
        }
        System.out.println("Compared " + stock.size() + " original methods; changed: " + changed.size());
        changed.forEach(System.out::println);
        if (args.length > 2) {
            var allowed = new HashSet<>(java.nio.file.Files.readAllLines(java.nio.file.Path.of(args[2])));
            if (!allowed.equals(new HashSet<>(changed))) throw new AssertionError("Unexpected method changes");
        }
    }
}
