/* SPDX-License-Identifier: GPL-3.0-only */
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import java.io.File;
import java.util.*;
import java.util.zip.ZipFile;
import kotlin.jvm.functions.Function1;

/** Pin the complete original/patched owner, and preserve every other class and resource. */
class VerifyExport {
    private static final String OWNER = "Leu/kanade/tachiyomi/data/download/DownloadManager;";
    private static final String ORIGINAL = "5dd3e964a2130e4e0ca7bc40dad5167f8ecbf989d4ffc7a1ffe3e388ac3c4368";
    // Full canonical class, including helper, filter, operands, branch targets, flags and try blocks.
    private static final String PATCHED = "69de8fe6f750a81291ee976512fd72d7f7ce25e177dfb50e515fddd3f1364725";
    private static final java.lang.reflect.Method DIGEST;
    static {
        try {
            DIGEST = Class.forName("io.github.pengusto.patches.CodeDigestKt")
                .getDeclaredMethod("codeDigest", ClassDef.class, Function1.class);
        } catch (Exception e) { throw new ExceptionInInitializerError(e); }
    }
    private static String digest(ClassDef type) throws Exception {
        Function1<Method, Boolean> include = method -> true;
        return (String) DIGEST.invoke(null, type, include);
    }
    private static Map<String, ClassDef> classes(String path) throws Exception {
        var result = new TreeMap<String, ClassDef>();
        var apk = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        for (String entry : apk.getDexEntryNames())
            for (var type : apk.getEntry(entry).getDexFile().getClasses())
                if (result.put(type.getType(), type) != null) throw new AssertionError("Duplicate class");
        return result;
    }
    private static boolean serializedCodeOrSignature(String name) {
        return name.matches("classes[0-9]*\\.dex") || name.matches("META-INF/(MANIFEST.MF|[^/]+\\.(SF|RSA|DSA|EC))");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Original APK, exported APK required");
        var before = classes(args[0]); var after = classes(args[1]);
        if (!before.keySet().equals(after.keySet())) throw new AssertionError("Added or removed app/library classes");
        if (!digest(before.get(OWNER)).equals(ORIGINAL) || !digest(after.get(OWNER)).equals(PATCHED))
            throw new AssertionError("Original or patched deletion manager differs from the reviewed canonical class");
        for (var entry : before.entrySet()) {
            String name = entry.getKey();
            if (!name.equals(OWNER) && !digest(entry.getValue()).equals(digest(after.get(name))))
                throw new AssertionError("Unrelated code changed: " + name);
        }
        try (var x = new ZipFile(args[0]); var y = new ZipFile(args[1])) {
            for (var e : Collections.list(x.entries())) {
                String n = e.getName();
                if (serializedCodeOrSignature(n)) continue;
                if (y.getEntry(n) == null || !Arrays.equals(x.getInputStream(e).readAllBytes(), y.getInputStream(y.getEntry(n)).readAllBytes()))
                    throw new AssertionError("Unrelated resource/native entry changed: " + n);
            }
            for (var e : Collections.list(y.entries()))
                if (x.getEntry(e.getName()) == null && !serializedCodeOrSignature(e.getName()))
                    throw new AssertionError("Unexpected new APK entry: " + e.getName());
        }
        System.out.println("PASS: " + before.size() + " classes; only deletion fallback/helper changed; resources and native libraries retained");
    }
}
