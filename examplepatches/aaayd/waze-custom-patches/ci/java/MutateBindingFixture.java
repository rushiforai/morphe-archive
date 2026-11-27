import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.rewriter.*;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

/** Synthetic obfuscation of the pinned 5.24.5.0 fixture. Never install or publish its output. */
public class MutateBindingFixture {
    static final Map<String, String> TYPES = Map.of(
        "Lcom/waze/resources/i;", "Lfixture/obfuscated/Resources;",
        "Lk/z;", "Lfixture/obfuscated/Services;",
        "Lcom/waze/settings/tree/f;", "Lfixture/obfuscated/Row;",
        "Lcom/waze/settings/de;", "Lfixture/obfuscated/Page;",
        "Lcom/waze/config/c;", "Lfixture/obfuscated/NumberConfig;",
        "Lcom/waze/config/b;", "Lfixture/obfuscated/BooleanConfig;",
        "Lcom/waze/config/f;", "Lfixture/obfuscated/Config;",
        "Lcom/waze/config/h;", "Lfixture/obfuscated/ConfigReader;",
        "Lcom/waze/MoodManager;", "Lfixture/obfuscated/Moods;");
    static final Set<String> seenTypes = new HashSet<>(), seenMethods = new HashSet<>();
    static String rename(MethodReference method) {
        String type = method.getDefiningClass(), name = method.getName();
        boolean change = type.equals("Lcom/waze/resources/i;") && !name.startsWith("<") ||
            type.equals("Lk/z;") && name.equals("j") ||
            type.equals("Lcom/waze/settings/tree/f;") && name.equals("k") ||
            type.equals("Lcom/waze/settings/tree/views/WazeSettingsView;") && Set.of("N", "P", "B").contains(name) ||
            Set.of("Lcom/waze/config/b;", "Lcom/waze/config/c;").contains(type) && name.equals("a") ||
            type.startsWith("Lcom/waze/config/") && name.equals("e") && method.getParameterTypes().isEmpty() && method.getReturnType().equals("I") ||
            type.equals("Lcom/waze/MoodManager;") && Set.of("canSetMood", "isBaby", "refreshMoodsList", "getUpScaledAddonDrawable").contains(name);
        if (change) seenMethods.add(type + "->" + name);
        return change ? "fixture_" + name : name;
    }
    static DexFile rewrite(DexFile dex, String mode) {
        var rewriter = new DexRewriter(new RewriterModule() {
            public Rewriter<String> getTypeRewriter(Rewriters rewriters) {
                return new TypeRewriter() {
                    protected String rewriteUnwrappedType(String type) {
                        if (TYPES.containsKey(type)) seenTypes.add(type);
                        return mode.equals("renamed") ? TYPES.getOrDefault(type, type) : type;
                    }
                };
            }
            public Rewriter<MethodReference> getMethodReferenceRewriter(Rewriters rewriters) {
                var delegate = new MethodReferenceRewriter(rewriters);
                return method -> {
                    var ref = delegate.rewrite(method);
                    return new ImmutableMethodReference(ref.getDefiningClass(), mode.equals("renamed") ? rename(method) : ref.getName(), ref.getParameterTypes(), ref.getReturnType());
                };
            }
            public Rewriter<Method> getMethodRewriter(Rewriters rewriters) {
                return new MethodRewriter(rewriters) {
                    public Method rewrite(Method method) {
                        return new RewrittenMethod(method) {
                            public String getName() { return mode.equals("renamed") ? rename(method) : method.getName(); }
                        };
                    }
                };
            }
        });
        DexFile result = rewriter.getDexFileRewriter().rewrite(dex);
        if (mode.equals("ambiguous")) {
            List<ClassDef> classes = new ArrayList<>(result.getClasses());
            for (var type : result.getClasses()) if (type.getType().equals("Lcom/waze/resources/i;")) {
                var duplicate = new DexRewriter(new RewriterModule() {
                    public Rewriter<String> getTypeRewriter(Rewriters rewriters) {
                        return name -> name.equals(type.getType()) ? "Lfixture/AmbiguousResources;" : name;
                    }
                }).getClassDefRewriter().rewrite(type);
                classes.add(duplicate);
            }
            return new ImmutableDexFile(dex.getOpcodes(), classes);
        }
        return result;
    }
    static byte[] apk(byte[] source, String mode) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var in = new ZipInputStream(new ByteArrayInputStream(source)); var out = new ZipOutputStream(bytes)) {
            ZipEntry entry;
            while ((entry = in.getNextEntry()) != null) {
                if (entry.getName().startsWith("META-INF/")) continue;
                out.putNextEntry(new ZipEntry(entry.getName()));
                byte[] data = in.readAllBytes();
                if (entry.getName().matches("classes[0-9]*\\.dex")) {
                    DexFile dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), new BufferedInputStream(new ByteArrayInputStream(data)));
                    var store = new MemoryDataStore();
                    DexPool.writeTo(store, rewrite(dex, mode));
                    data = store.getData();
                }
                out.write(data);
                out.closeEntry();
            }
        }
        return bytes.toByteArray();
    }
    public static void main(String[] args) throws Exception {
        if (!Set.of("renamed", "ambiguous").contains(args[2])) throw new IllegalArgumentException("Unknown mutation");
        try (var in = new ZipFile(args[0]); var out = new ZipOutputStream(Files.newOutputStream(Path.of(args[1])))) {
            var entries = in.entries();
            boolean base = false;
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                out.putNextEntry(new ZipEntry(entry.getName()));
                if (entry.getName().equals("base.apk")) {
                    out.write(apk(in.getInputStream(entry).readAllBytes(), args[2]));
                    base = true;
                } else in.getInputStream(entry).transferTo(out);
                out.closeEntry();
            }
            if (!base) throw new AssertionError("Pinned fixture base.apk missing");
        }
        if (args[2].equals("renamed") && (!seenTypes.equals(TYPES.keySet()) || seenMethods.size() < 15))
            throw new AssertionError("Fixture mutation did not cover expected targets: " + seenTypes + seenMethods);
        System.out.println("Synthetic " + args[2] + " fixture created; " + seenTypes.size() + " renamed types and " + seenMethods.size() + " methods");
    }
}
