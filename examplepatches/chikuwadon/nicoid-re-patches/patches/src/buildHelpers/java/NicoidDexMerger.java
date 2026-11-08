package app.nicoid.patches;

import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.writer.io.FileDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.ArrayList;
import java.util.List;

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
        if (args.length != 5) {
            throw new IllegalArgumentException("Expected generated.dex, existing.mpe, overrides.dex, validated.zip and output.dex");
        }

        DexBackedDexFile generated = readDex(new File(args[0]));
        DexBackedDexFile existing = readDex(new File(args[1]));
        DexBackedDexFile overrides = readDex(new File(args[2]));
        DexBackedDexFile validated = readDex(new File(args[3]));
        Set<String> overrideTypes = new HashSet<>();
        Set<String> validatedTypes = new HashSet<>();
        Set<String> generatedTypes = new HashSet<>();
        Set<String> mergedTypes = new HashSet<>();
        DexPool pool = new DexPool(generated.getOpcodes());
        Set<String> providedTypes = new HashSet<>();
        List<ClassDef> selected = new ArrayList<>();
        for (ClassDef c : generated.getClasses()) providedTypes.add(c.getType());
        for (ClassDef c : existing.getClasses()) providedTypes.add(c.getType());
        for (ClassDef c : overrides.getClasses()) providedTypes.add(c.getType());
        for (ClassDef c : validated.getClasses()) {
            if (c.getType().startsWith("Le/e/a/BikeRun")) {
                validatedTypes.add(c.getType());
                providedTypes.add(c.getType());
            }
        }
        if (validatedTypes.size() != 22) throw new IllegalStateException("Validated compatibility class count mismatch");

        // Favor only the explicitly scoped locally validated classes. All other
        // generated and reviewed classes continue to come from the dev build.
        for (ClassDef classDef : validated.getClasses()) {
            if (!validatedTypes.contains(classDef.getType())) continue;
            mergedTypes.add(classDef.getType());
            pool.internClass(classDef);
            selected.add(classDef);
        }

        // Reviewed smali overrides preserve changes recovered from the device-tested dev bundle.
        // Remove an override when its Java source becomes the canonical implementation.
        for (ClassDef classDef : overrides.getClasses()) {
            if (overridden(classDef.getType(), validatedTypes)) continue;
            overrideTypes.add(classDef.getType());
            mergedTypes.add(classDef.getType());
            pool.internClass(classDef);
            selected.add(classDef);
        }

        // Prefer freshly compiled versions for any classes present in both DEXes.
        for (ClassDef classDef : generated.getClasses()) {
            generatedTypes.add(classDef.getType());
            if (overridden(classDef.getType(), overrideTypes) || overridden(classDef.getType(), validatedTypes)) continue;
            mergedTypes.add(classDef.getType());
            pool.internClass(classDef);
            selected.add(classDef);
        }

        // Keep DEX-only helpers (for example DynamicTheme and ModernDebug).
        for (ClassDef classDef : existing.getClasses()) {
            if (!overridden(classDef.getType(), generatedTypes) && !overridden(classDef.getType(), overrideTypes)
                    && !overridden(classDef.getType(), validatedTypes)) {
                mergedTypes.add(classDef.getType());
                pool.internClass(classDef);
                selected.add(classDef);
            }
        }

        if (!mergedTypes.contains(DYNAMIC_THEME) || !mergedTypes.contains(DYNAMIC_THEME_REFRESH)
                || !mergedTypes.contains(MODERN_DEBUG)) {
            throw new IllegalStateException("Existing helper DEX is missing required support classes");
        }

        // D8 may share a lambda across source families. A canonical override
        // can remove its generated owner while a Java-owned caller still uses
        // it. Reject that output before it becomes a runtime NoClassDefFoundError.
        for (ClassDef c : selected) {
            Set<String> references = new HashSet<>();
            references.add(c.getSuperclass());
            references.addAll(c.getInterfaces());
            for (Field field : c.getFields()) references.add(field.getType());
            for (Method method : c.getMethods()) {
                methodTypes(method, references);
                if (method.getImplementation() == null) continue;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if (!(instruction instanceof ReferenceInstruction)) continue;
                    Reference ref = ((ReferenceInstruction) instruction).getReference();
                    if (ref instanceof TypeReference) references.add(((TypeReference) ref).getType());
                    else if (ref instanceof MethodReference) methodTypes((MethodReference) ref, references);
                    else if (ref instanceof FieldReference) {
                        references.add(((FieldReference) ref).getDefiningClass());
                        references.add(((FieldReference) ref).getType());
                    }
                }
            }
            for (String type : references) {
                if (type == null) continue;
                while (type.startsWith("[")) type = type.substring(1);
                if (providedTypes.contains(type) && !mergedTypes.contains(type))
                    throw new IllegalStateException("Merged helper dependency is missing: " + c.getType() + " -> " + type);
            }
        }

        File output = new File(args[4]);
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

    private static void methodTypes(MethodReference method, Set<String> types) {
        types.add(method.getDefiningClass());
        types.add(method.getReturnType());
        for (CharSequence parameter : method.getParameterTypes()) types.add(parameter.toString());
    }

    private static boolean overridden(String type, Set<String> overrides) {
        if (overrides.contains(type)) return true;
        int nested = type.indexOf('$');
        return nested > 0 && overrides.contains(type.substring(0, nested) + ";");
    }

    private static DexBackedDexFile readDex(File file) throws IOException {
        if (file.getName().endsWith(".zip")) {
            try (java.util.zip.ZipFile archive = new java.util.zip.ZipFile(file)) {
                java.util.zip.ZipEntry entry = archive.getEntry("classes.dex");
                if (entry == null) throw new IOException("Compatibility archive has no DEX entry");
                try (BufferedInputStream input = new BufferedInputStream(archive.getInputStream(entry))) {
                    return DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
                }
            }
        }
        try (BufferedInputStream input = new BufferedInputStream(new FileInputStream(file))) {
            return DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
        }
    }
}
