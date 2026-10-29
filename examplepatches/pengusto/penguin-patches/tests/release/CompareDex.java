/* SPDX-License-Identifier: GPL-3.0-only */
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import java.io.File;
import java.lang.reflect.Method;
import java.util.*;

/** Compare canonical code despite different DEX partitioning/serialization. */
class CompareDex {
    private static final Method DIGEST;

    static {
        try {
            DIGEST = Arrays.stream(Class.forName("io.github.pengusto.patches.CodeDigestKt").getDeclaredMethods())
                .filter(method -> method.getName().equals("codeDigest$default"))
                .findFirst().orElseThrow();
        } catch (ReflectiveOperationException error) {
            throw new ExceptionInInitializerError(error);
        }
    }

    private static Map<String, String> classes(String path) throws Exception {
        var result = new TreeMap<String, String>();
        var apk = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        for (String entry : apk.getDexEntryNames()) {
            for (var type : apk.getEntry(entry).getDexFile().getClasses()) {
                String digest = (String) DIGEST.invoke(null, type, null, 1, null);
                if (result.put(type.getType(), digest) != null) {
                    throw new AssertionError("Duplicate class: " + type.getType());
                }
            }
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Pass two exported APKs");
        var left = classes(args[0]);
        var right = classes(args[1]);
        var names = new TreeSet<>(left.keySet());
        names.addAll(right.keySet());
        var differences = new ArrayList<String>();
        for (String name : names) {
            if (!Objects.equals(left.get(name), right.get(name))) differences.add(name);
        }
        if (!differences.isEmpty()) throw new AssertionError("Semantic DEX differences: " + differences);
        System.out.println("PASS: all " + names.size() + " class digests equal across both APKs");
    }
}
