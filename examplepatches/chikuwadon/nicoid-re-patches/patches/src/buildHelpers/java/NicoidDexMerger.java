package app.nicoid.patches;

import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.writer.io.FileDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * Adds newly compiled Java helpers to the checked-in helper DEX while keeping
 * support classes that are intentionally maintained in smali.
 */
public final class NicoidDexMerger {
    private static final String DYNAMIC_THEME = "Le/e/a/DynamicTheme;";
    private static final String DYNAMIC_THEME_REFRESH = "Le/e/a/DynamicTheme$Refresh;";
    private static final String MODERN_DEBUG = "Le/e/a/ModernDebug;";

    private NicoidDexMerger() { }

    public static void main(String[] args) throws IOException {
        if (args.length != 4) {
            throw new IllegalArgumentException("Expected generated.dex, existing.mpe, overrides.dex and output.dex");
        }

        DexBackedDexFile generated = readDex(new File(args[0]));
        DexBackedDexFile existing = readDex(new File(args[1]));
        DexBackedDexFile overrides = readDex(new File(args[2]));
        Set<String> overrideTypes = new HashSet<>();
        Set<String> generatedTypes = new HashSet<>();
        Set<String> mergedTypes = new HashSet<>();
        DexPool pool = new DexPool(generated.getOpcodes());

        // Reviewed smali overrides preserve changes recovered from the device-tested dev bundle.
        // Remove an override when its Java source becomes the canonical implementation.
        for (ClassDef classDef : overrides.getClasses()) {
            overrideTypes.add(classDef.getType());
            mergedTypes.add(classDef.getType());
            pool.internClass(classDef);
        }

        // Prefer freshly compiled versions for any classes present in both DEXes.
        for (ClassDef classDef : generated.getClasses()) {
            generatedTypes.add(classDef.getType());
            if (overridden(classDef.getType(), overrideTypes)) continue;
            mergedTypes.add(classDef.getType());
            pool.internClass(classDef);
        }

        // Keep DEX-only helpers (for example DynamicTheme and ModernDebug).
        for (ClassDef classDef : existing.getClasses()) {
            if (!generatedTypes.contains(classDef.getType()) && !overridden(classDef.getType(), overrideTypes)) {
                mergedTypes.add(classDef.getType());
                pool.internClass(classDef);
            }
        }

        if (!mergedTypes.contains(DYNAMIC_THEME) || !mergedTypes.contains(DYNAMIC_THEME_REFRESH)
                || !mergedTypes.contains(MODERN_DEBUG)) {
            throw new IllegalStateException("Existing helper DEX is missing required support classes");
        }

        File output = new File(args[3]);
        File parent = output.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IOException("Could not create merged DEX directory: " + parent);
        }
        FileDataStore store = new FileDataStore(output);
        try {
            pool.writeTo(store);
        } finally {
            store.close();
        }
    }

    private static boolean overridden(String type, Set<String> overrides) {
        if (overrides.contains(type)) return true;
        int nested = type.indexOf('$');
        return nested > 0 && overrides.contains(type.substring(0, nested) + ";");
    }

    private static DexBackedDexFile readDex(File file) throws IOException {
        try (BufferedInputStream input = new BufferedInputStream(new FileInputStream(file))) {
            return DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
        }
    }
}
