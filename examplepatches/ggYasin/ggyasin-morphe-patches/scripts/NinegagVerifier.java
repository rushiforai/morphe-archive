/* Static DEX inspection helper for verify_ninegag.py. Requires the Morphe CLI
 * fat jar (dexlib2 and apksig) and JDK 21. Run through the Python entry point. */
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;
import com.android.apksig.ApkVerifier;

public class NinegagVerifier {
    static final Set<String> TARGETS = Set.of(
        "Ld44;->j(ILjava/lang/String;Z)Ljava/util/List;",
        "Ld44;->d(Ljava/lang/String;IIIZ)Lqy7;",
        "Lg3b;->f(Landroid/widget/FrameLayout;Li04;)V",
        "Lgb;->b(ZLo57;Lib;)Lfa;",
        "Lgb;->a(ZZLo57;ZLib;)Lfa;",
        "Lgb;->c()Lfa;",
        "Lgb;->d()Z",
        "Lja;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;");
    static String quote(String s) {
        StringBuilder b = new StringBuilder("\"");
        for (char c : s.toCharArray()) {
            if (c == '"' || c == '\\') b.append('\\').append(c);
            else if (c < 32) b.append(String.format("\\u%04x", (int)c));
            else b.append(c);
        }
        return b.append('"').toString();
    }
    static String json(Object o) {
        if (o == null) return "null";
        if (o instanceof Number || o instanceof Boolean) return o.toString();
        if (o instanceof Map<?,?> m) {
            List<String> out = new ArrayList<>();
            m.forEach((k,v) -> out.add(quote(k.toString()) + ":" + json(v)));
            return "{" + String.join(",", out) + "}";
        }
        if (o instanceof Iterable<?> xs) {
            List<String> out = new ArrayList<>();
            xs.forEach(x -> out.add(json(x)));
            return "[" + String.join(",", out) + "]";
        }
        return quote(o.toString());
    }
    static String id(MethodReference m) {
        return m.getDefiningClass() + "->" + m.getName() + "(" +
            String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }
    static Map<String,Object> instruction(Instruction i) throws Exception {
        Map<String,Object> out = new TreeMap<>();
        out.put("opcode", i.getOpcode().name());
        // Read operand interfaces, not dexbacked implementation addresses. This
        // stays stable across DEX pool reordering/repartitioning and re-encoding.
        Set<Class<?>> seen = new HashSet<>();
        Deque<Class<?>> todo = new ArrayDeque<>();
        todo.add(i.getClass());
        while (!todo.isEmpty()) {
            Class<?> c = todo.remove();
            if (!seen.add(c)) continue;
            todo.addAll(Arrays.asList(c.getInterfaces()));
            if (c.getSuperclass() != null) todo.add(c.getSuperclass());
            if (!c.isInterface() || !c.getPackageName().startsWith(
                    "com.android.tools.smali.dexlib2.iface.instruction")) continue;
            for (var getter : c.getDeclaredMethods()) {
                String n = getter.getName();
                if (!n.startsWith("get") || getter.getParameterCount() != 0 ||
                        n.equals("getOpcode") || n.equals("getCodeUnits")) continue;
                Object v = getter.invoke(i);
                out.put(n.substring(3), v instanceof Number ? v : String.valueOf(v));
            }
        }
        return out;
    }
    static String host(String s) {
        try {
            String h = URI.create(s.contains("://") ? s : "http://" + s).getHost();
            return h == null ? null : h.toLowerCase(Locale.ROOT);
        } catch (IllegalArgumentException e) { return null; }
    }
    static boolean relevant(String s, Set<String> blocked) {
        String h = host(s);
        if (h == null) return false;
        if (h.equals("0.0.0.0")) return true;
        while (true) {
            if (blocked.contains(h)) return true;
            if (!h.contains(".")) return false;
            h = h.substring(h.indexOf('.') + 1);
        }
    }
    public static void main(String[] args) throws Exception {
        Set<String> blocked = new HashSet<>(Files.readAllLines(Path.of(args[1])));
        Map<String,Integer> classes = new TreeMap<>();
        Map<String,Object> schemas = new TreeMap<>(), methods = new TreeMap<>();
        Map<String,String> strings = new TreeMap<>();
        int dexCount = 0;
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes([0-9]+)?\\.dex")) continue;
                dexCount++;
                var dex = DexBackedDexFile.fromInputStream(null,
                    new BufferedInputStream(zip.getInputStream(entry)));
                // Walk raw class_def entries, not a set that could hide dupes.
                for (int n = 0; n < dex.getClassSection().size(); n++) {
                    ClassDef c = dex.getClassSection().get(n);
                    classes.merge(c.getType(), 1, Integer::sum);
                    List<String> members = new ArrayList<>();
                    for (Field f : c.getFields()) {
                        members.add("F:" + f.getName() + ":" + f.getType() + ":" + f.getAccessFlags());
                        if (f.getInitialValue() instanceof StringEncodedValue s && relevant(s.getValue(), blocked))
                            strings.put(c.getType() + "->" + f.getName() + ":" + f.getType(), s.getValue());
                    }
                    for (Method m : c.getMethods()) {
                        String mid = id(m);
                        members.add("M:" + mid + ":" + m.getAccessFlags());
                        var impl = m.getImplementation();
                        if (impl == null) continue;
                        int stringOrdinal = 0;
                        List<Object> insns = new ArrayList<>();
                        for (Instruction i : impl.getInstructions()) {
                            if (TARGETS.contains(mid)) insns.add(instruction(i));
                            if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s) {
                                if (relevant(s.getString(), blocked)) strings.put(mid + "#string" + stringOrdinal, s.getString());
                                stringOrdinal++;
                            }
                        }
                        if (TARGETS.contains(mid)) {
                            List<Object> tries = new ArrayList<>();
                            for (var t : impl.getTryBlocks()) {
                                List<Object> handlers = new ArrayList<>();
                                for (var h : t.getExceptionHandlers()) handlers.add(Arrays.asList(h.getExceptionType(), h.getHandlerCodeAddress()));
                                tries.add(Arrays.asList(t.getStartCodeAddress(), t.getCodeUnitCount(), handlers));
                            }
                            methods.put(mid, Map.of("registers", impl.getRegisterCount(),
                                "access", m.getAccessFlags(), "instructions", insns, "tries", tries));
                        }
                    }
                    Collections.sort(members);
                    schemas.put(c.getType(), Arrays.asList(c.getAccessFlags(), c.getSuperclass(), c.getInterfaces(), members));
                }
            }
        }
        var signature = new ApkVerifier.Builder(new File(args[0])).build().verify();
        System.out.println(json(Map.of("classes", classes, "schemas", schemas,
            "methods", methods, "strings", strings, "dex_count", dexCount,
            "signature_verified", signature.isVerified(), "signature_errors", signature.getAllErrors().toString())));
    }
}
