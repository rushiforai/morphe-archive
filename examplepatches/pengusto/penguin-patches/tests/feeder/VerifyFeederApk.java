import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Validate the extension against the actual R8-shrunk APK, not compile stubs. */
class VerifyFeederApk {
    static String PREFIX = "Lio/github/pengusto/patches/extension/feeder/";
    static final Map<String, ClassDef> classes = new HashMap<>();

    static boolean method(String type, MethodReference ref, Set<String> seen) {
        if (type == null || !seen.add(type)) return false;
        ClassDef c = classes.get(type);
        if (c == null) return framework(type) || (type.equals("Ljava/lang/Object;") &&
                Set.of("equals", "hashCode", "toString", "getClass", "clone", "finalize", "wait", "notify", "notifyAll").contains(ref.getName())) ||
                (type.equals("Ljava/lang/Enum;") && Set.of("ordinal", "name", "compareTo", "getDeclaringClass").contains(ref.getName()));
        for (Method m : c.getMethods()) {
            if (m.getName().equals(ref.getName()) && m.getReturnType().equals(ref.getReturnType()) &&
                    m.getParameterTypes().equals(ref.getParameterTypes())) return true;
        }
        if (method(c.getSuperclass(), ref, seen)) return true;
        for (String i : c.getInterfaces()) if (method(i, ref, seen)) return true;
        return false;
    }

    static boolean field(String type, FieldReference ref, Set<String> seen) {
        if (type == null || !seen.add(type)) return false;
        ClassDef c = classes.get(type);
        if (c == null) return false;
        for (Field f : c.getFields()) {
            if (f.getName().equals(ref.getName()) && f.getType().equals(ref.getType())) return true;
        }
        if (field(c.getSuperclass(), ref, seen)) return true;
        for (String i : c.getInterfaces()) if (field(i, ref, seen)) return true;
        return false;
    }

    static boolean framework(String type) {
        return type.startsWith("Ljava/") || type.startsWith("Ljavax/") ||
                type.startsWith("Landroid/") || type.startsWith("Ldalvik/") ||
                type.startsWith("Lorg/xml/") || type.startsWith("[");
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 1 || args.length > 2) throw new IllegalArgumentException("Pass the patched APK path and optional extension prefix");
        if (args.length == 2) PREFIX = args[1];
        var apk = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : apk.getDexEntryNames()) {
            for (ClassDef c : apk.getEntry(entry).getDexFile().getClasses()) {
                if (classes.put(c.getType(), c) != null) throw new AssertionError("Duplicate class: " + c.getType());
            }
        }
        Set<String> failures = new TreeSet<>();
        Set<String> references = new HashSet<>();
        int extensionClasses = 0;
        for (ClassDef c : classes.values()) {
            if (!c.getType().startsWith(PREFIX)) continue;
            extensionClasses++;
            for (Method m : c.getMethods()) {
                if (m.getImplementation() == null) continue;
                for (var i : m.getImplementation().getInstructions()) {
                    if (!(i instanceof ReferenceInstruction r)) continue;
                    var ref = r.getReference();
                    if (ref instanceof MethodReference mr && !framework(mr.getDefiningClass())) {
                        references.add(ref.toString());
                        if (!method(mr.getDefiningClass(), mr, new HashSet<>())) failures.add(ref.toString());
                    } else if (ref instanceof FieldReference fr && !framework(fr.getDefiningClass())) {
                        references.add(ref.toString());
                        if (!field(fr.getDefiningClass(), fr, new HashSet<>())) failures.add(ref.toString());
                    } else if (ref instanceof TypeReference tr && !framework(tr.getType())) {
                        if (!classes.containsKey(tr.getType())) failures.add(tr.getType());
                    }
                }
            }
        }
        if (extensionClasses == 0) throw new AssertionError("Extension missing: " + PREFIX);
        if (!failures.isEmpty()) throw new AssertionError("Unresolved shipped-APK APIs:\n" + String.join("\n", failures));
        System.out.println("PASS: " + extensionClasses + " extension classes, " + references.size() +
                " shipped-APK method/field references; no missing APIs or duplicate classes");
    }
}
