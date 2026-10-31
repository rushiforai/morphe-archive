import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.*;

/** Actual output regression: only the reviewed SDK classes and telemetry methods change. */
class EmbyDexCheck {
    static Map<String, ClassDef> classes(String path) throws Exception {
        var result = new TreeMap<String, ClassDef>();
        var apk = DexFileFactory.loadDexContainer(new File(path), null);
        for (var entry : apk.getDexEntryNames()) for (var cls : apk.getEntry(entry).getDexFile().getClasses()) {
            if (result.put(cls.getType(), cls) != null) throw new AssertionError("Duplicate class");
        }
        return result;
    }
    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) throws Exception {
        var stock = classes(args[0]); var output = classes(args[1]);
        var removed = new TreeSet<String>();
        for (var name : stock.keySet()) if ((name.startsWith("Lcom/google/firebase/") ||
                name.startsWith("Lcom/google/android/datatransport/")) &&
                !name.equals("Lcom/google/firebase/Timestamp$$ExternalSyntheticApiModelOutline0;")) removed.add(name);
        require(removed.size() == 780, "SDK removal inventory drift");
        var expected = new TreeSet<>(stock.keySet()); expected.removeAll(removed);
        require(output.keySet().equals(expected), "Unexpected output class set");
        int changed = 0, verified = 0;
        for (var name : output.keySet()) {
            var originals = new TreeMap<String, Method>();
            for (var method : stock.get(name).getMethods()) originals.put(DexInventory.id(method), method);
            int count = 0;
            for (var method : output.get(name).getMethods()) {
                count++;
                var before = originals.get(DexInventory.id(method));
                require(before != null, "Unexpected method");
                boolean telemetry = (name.equals("Lcom/android/billingclient/api/zzdt;") &&
                        Set.of("<init>", "zza").contains(method.getName())) ||
                        (name.equals("Lcom/google/android/gms/internal/cast/zzh;") &&
                        Set.of("zzc", "zzd").contains(method.getName()));
                if (telemetry) {
                    var ops = new ArrayList<String>();
                    for (var instruction : method.getImplementation().getInstructions()) ops.add(instruction.getOpcode().name());
                    require(ops.equals(method.getName().equals("<init>") ?
                            List.of("INVOKE_DIRECT", "RETURN_VOID") : List.of("RETURN_VOID")), "Telemetry still executes");
                    changed++;
                } else {
                    require(DexInventory.describe(before, Set.of()).equals(DexInventory.describe(method, Set.of())),
                            "Unrelated method changed: " + DexInventory.id(method));
                    verified++;
                }
            }
            require(count == originals.size(), "Method removed");
        }
        require(changed == 4, "Telemetry target count drift");
        System.out.println("PASS: 780 SDK classes removed, 4 telemetry methods disabled, " + verified + " other methods unchanged");
    }
}
