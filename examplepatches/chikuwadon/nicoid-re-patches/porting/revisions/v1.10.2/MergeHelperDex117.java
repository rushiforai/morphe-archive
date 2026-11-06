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
        if (args.length != 4) throw new IllegalArgumentException("restored.mpe dev.dex version.dex output.mpe required");
        DexBackedDexFile restored = read(new File(args[0]));
        DexBackedDexFile development = read(new File(args[1]));
        DexBackedDexFile versions = read(new File(args[2]));
        Set<String> names = new HashSet<>();
        DexPool pool = new DexPool(restored.getOpcodes());
        int restoredCount = 0, developmentCount = 0, versionCount = 0;
        Set<String> versionTypes = new HashSet<>();
        for (ClassDef cls : versions.getClasses()) versionTypes.add(cls.getType());
        if (versionTypes.size() != 2 || !versionTypes.contains("Le/e/a/PatchVersion237;") || !versionTypes.contains("Le/e/a/ModernShorts;"))
            throw new IOException("Expected exactly two authoritative version classes, got " + versionTypes);
        for (ClassDef cls : restored.getClasses()) {
            if (versionTypes.contains(cls.getType())) continue;
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
        for (ClassDef cls : versions.getClasses()) {
            if (!names.add(cls.getType())) throw new IOException("Version-class collision: " + cls.getType());
            pool.internClass(cls); versionCount++;
        }
        if (versionCount != 2) throw new IOException("Missing version class overrides");
        if (restoredCount < 1500 || developmentCount < 25)
            throw new IOException("Unexpected helper class count: " + restoredCount + " + " + developmentCount);
        for (String needed : new String[]{"Dev111","Dev112","Dev115","Dev116","LegacyCacheCleanup113","StorageDiagnostics112"}) {
            if (!names.contains("Le/e/a/" + needed + ";"))
                throw new IOException("Mandatory helper missing: " + needed);
        }
        FileDataStore store = new FileDataStore(new File(args[3]));
        try { pool.writeTo(store); } finally { store.close(); }
        System.out.println("Merged helper classes: restored=" + restoredCount + " development=" + developmentCount + " compilerMarkersSkipped=" + skippedCompilerMarkers + " versionOverrides=" + versionCount + " total=" + names.size());
    }
}
