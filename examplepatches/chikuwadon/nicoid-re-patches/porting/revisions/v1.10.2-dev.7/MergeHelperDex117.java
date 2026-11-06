package e.e.a;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.jf.dexlib2.Opcodes;
import org.jf.dexlib2.dexbacked.DexBackedDexFile;
import org.jf.dexlib2.iface.ClassDef;
import org.jf.dexlib2.writer.io.FileDataStore;
import org.jf.dexlib2.writer.pool.DexPool;

/** Build-time merger to preserve all restored Smali and Java/D8 helper classes. */
public final class MergeHelperDex117 {
    private MergeHelperDex117() { }
    private static DexBackedDexFile read(File path) throws IOException {
        try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(path))) {
            return DexBackedDexFile.fromInputStream(Opcodes.getDefault(), in);
        }
    }
    public static void main(String[] args) throws IOException {
        if (args.length != 3) throw new IllegalArgumentException("baseline.mpe dev.dex output.mpe required");
        DexBackedDexFile restored = read(new File(args[0]));
        DexBackedDexFile development = read(new File(args[1]));
        Set<String> names = new HashSet<>();
        DexPool pool = new DexPool(restored.getOpcodes());
        int restoredCount = 0, developmentCount = 0;
        for (ClassDef cls : restored.getClasses()) {
            if (!names.add(cls.getType())) throw new IOException("Duplicate restored class: " + cls.getType());
            pool.internClass(cls); restoredCount++;
        }
        int skippedCompilerMarkers = 0;
        for (ClassDef cls : development.getClasses()) {
            if (!names.add(cls.getType())) {
                // D8 generates identical internal marker classes in both inputs.
                // Never accept duplicates from our app-owned code or other libraries.
                if (cls.getType().startsWith("Lcom/android/tools/r8/annotations/")) {
                    skippedCompilerMarkers++;
                    continue;
                }
                throw new IOException("Duplicate development class: " + cls.getType());
            }
            pool.internClass(cls); developmentCount++;
        }
        if (restoredCount < 1500 || developmentCount < 25)
            throw new IOException("Unexpected helper class count: " + restoredCount + " + " + developmentCount);
        for (String needed : new String[]{"Dev111","Dev112","Dev115","Dev116","LegacyCacheCleanup113","StorageDiagnostics112"}) {
            if (!names.contains("Le/e/a/" + needed + ";"))
                throw new IOException("Mandatory helper missing: " + needed);
        }
        FileDataStore store = new FileDataStore(new File(args[2]));
        try { pool.writeTo(store); } finally { store.close(); }
        System.out.println("Merged helper classes: restored=" + restoredCount + " development=" + developmentCount + " compilerMarkersSkipped=" + skippedCompilerMarkers + " total=" + names.size());
    }
}
