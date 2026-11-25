import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Resolves every Instagram -> extension reference in a patched APK and checks invoke register counts. */
public class DexCheck {
    static final String EXT = "Lcom/feurstagram/extension/";
    static final Map<String, Set<String>> METHODS = new HashMap<>(), FIELDS = new HashMap<>();
    static final Map<String, String> SUPERS = new HashMap<>();
    static int unresolved = 0;

    static String join(List<? extends CharSequence> types) { StringBuilder sb = new StringBuilder(); if (types != null) for (CharSequence c : types) sb.append(c); return sb.toString(); }
    static String key(MethodReference m) { return m.getName() + "(" + join(m.getParameterTypes()) + ")" + m.getReturnType(); }
    static int words(List<? extends CharSequence> types) { int n = 0; for (CharSequence t : types) { String s = t.toString(); n += (s.equals("J") || s.equals("D")) ? 2 : 1; } return n; }
    static String cls(String type) { return type.startsWith("L") && type.endsWith(";") ? type.substring(1, type.length() - 1).replace('/', '.') : null; }

    static Class<?> load(String type) {
        String c = cls(type); if (c == null) return null;
        try { return Class.forName(c, false, DexCheck.class.getClassLoader()); } catch (Throwable t) { return null; }
    }
    static boolean resolveMethod(String type, String key) {
        String name = key.substring(0, key.indexOf('(')), params = key.substring(key.indexOf('(') + 1, key.lastIndexOf(')'));
        for (String t = type; t != null;) {
            Set<String> ms = METHODS.get(t);
            if (ms != null) { if (ms.contains(key)) return true; t = SUPERS.get(t); continue; }
            // left the APK's classes: platform or library, by reflection
            Class<?> k = load(t);
            if (k == null) { unresolved++; System.out.println("  UNRESOLVED class " + t + " for " + key); return true; }
            List<Class<?>> ps = new ArrayList<>();
            for (int i = 0; i < params.length(); i++) {
                char ch = params.charAt(i);
                if (ch == 'L') { int e = params.indexOf(';', i); ps.add(load(params.substring(i, e + 1))); i = e; }
                else if (ch == '[') { return true; }
                else ps.add(primitive(ch));
            }
            for (Class<?> c = k; c != null; c = c.getSuperclass()) {
                for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                    if (!m.getName().equals(name) || m.getParameterCount() != ps.size()) continue;
                    boolean same = true;
                    for (int i = 0; i < ps.size() && same; i++) { if (ps.get(i) == null) same = false; else same = ps.get(i) == m.getParameterTypes()[i]; }
                    if (same) return true;
                }
            }
            return false;
        }
        return false;
    }
    static Class<?> primitive(char ch) {
        switch (ch) { case 'Z': return boolean.class; case 'B': return byte.class; case 'S': return short.class; case 'C': return char.class;
            case 'I': return int.class; case 'J': return long.class; case 'F': return float.class; case 'D': return double.class; default: return null; }
    }
    static boolean resolveField(String type, String key) {
        String name = key.substring(0, key.indexOf(':'));
        for (String t = type; t != null;) {
            Set<String> fs = FIELDS.get(t);
            if (fs != null) { if (fs.contains(key)) return true; t = SUPERS.get(t); continue; }
            Class<?> k = load(t);
            if (k == null) { unresolved++; System.out.println("  UNRESOLVED class " + t + " for field " + key); return true; }
            for (Class<?> c = k; c != null; c = c.getSuperclass()) { for (java.lang.reflect.Field f : c.getDeclaredFields()) if (f.getName().equals(name)) return true; }
            return false;
        }
        return false;
    }

    public static void main(String[] a) throws Exception {
        List<DexFile> dexes = new ArrayList<>();
        try (ZipFile zf = new ZipFile(new File(a[0]))) {
            List<? extends ZipEntry> entries = new ArrayList<>(Collections.list(zf.entries()));
            entries.sort(Comparator.comparing(ZipEntry::getName));
            for (ZipEntry e : entries) {
                if (!e.getName().matches("classes\\d*\\.dex")) continue;
                File tmp = File.createTempFile("dexc", ".dex"); tmp.deleteOnExit();
                try (InputStream in = zf.getInputStream(e); OutputStream out = new FileOutputStream(tmp)) { in.transferTo(out); }
                dexes.add(DexFileFactory.loadDexFile(tmp, Opcodes.getDefault()));
            }
        }
        int extClasses = 0;
        for (DexFile d : dexes) for (ClassDef c : d.getClasses()) {
            SUPERS.put(c.getType(), c.getSuperclass());
            if (c.getType().startsWith(EXT)) extClasses++;
            Set<String> ms = new HashSet<>(); for (Method m : c.getMethods()) ms.add(m.getName() + "(" + join(m.getParameterTypes()) + ")" + m.getReturnType());
            METHODS.put(c.getType(), ms);
            Set<String> fs = new HashSet<>(); for (Field f : c.getFields()) fs.add(f.getName() + ":" + f.getType());
            FIELDS.put(c.getType(), fs);
        }
        System.out.println("dex files: " + dexes.size() + ", classes: " + SUPERS.size() + ", extension classes: " + extClasses);
        int sites = 0, bad = 0;
        Map<String, Integer> perTarget = new TreeMap<>();
        for (DexFile d : dexes) for (ClassDef c : d.getClasses()) {
            if (c.getType().startsWith(EXT)) continue;
            for (Method m : c.getMethods()) {
                MethodImplementation impl = m.getImplementation(); if (impl == null) continue;
                int idx = 0;
                for (Instruction insn : impl.getInstructions()) {
                    idx++;
                    Reference ref = null; try { ref = ((ReferenceInstruction) insn).getReference(); } catch (Throwable t) {}
                    String op = insn.getOpcode().name;
                    if (ref instanceof MethodReference && ((MethodReference) ref).getDefiningClass().startsWith(EXT)) {
                        MethodReference r = (MethodReference) ref; sites++;
                        perTarget.merge(r.getDefiningClass(), 1, Integer::sum);
                        String k = key(r);
                        if (!resolveMethod(r.getDefiningClass(), k)) { bad++; System.out.println("  MISSING METHOD  " + c.getType() + "->" + m.getName() + " #" + idx + "  " + k); }
                        if (op.startsWith("INVOKE_")) {
                            int expected = words(r.getParameterTypes()) + (op.startsWith("INVOKE_STATIC") ? 0 : 1), got = -1;
                            if (insn instanceof RegisterRangeInstruction) got = ((RegisterRangeInstruction) insn).getRegisterCount();
                            else if (insn instanceof FiveRegisterInstruction) got = ((FiveRegisterInstruction) insn).getRegisterCount();
                            if (got != expected) { bad++; System.out.println("  ARG MISMATCH    " + c.getType() + "->" + m.getName() + " #" + idx + "  " + k + " needs " + expected + " registers, passes " + got); }
                        }
                    } else if (ref instanceof FieldReference && ((FieldReference) ref).getDefiningClass().startsWith(EXT)) {
                        FieldReference r = (FieldReference) ref; sites++;
                        perTarget.merge(r.getDefiningClass(), 1, Integer::sum);
                        if (!resolveField(r.getDefiningClass(), r.getName() + ":" + r.getType())) { bad++; System.out.println("  MISSING FIELD   " + c.getType() + "->" + m.getName() + " #" + idx + "  " + r); }
                    }
                }
            }
        }
        System.out.println("Instagram -> extension references: " + sites + "   problems: " + bad + "   unresolved platform classes: " + unresolved);
        for (Map.Entry<String, Integer> e : perTarget.entrySet()) System.out.println(String.format("  %-52s %3d", e.getKey(), e.getValue()));
        if (a.length > 1) {
            int missing = 0;
            for (int i = 1; i < a.length; i++) {
                String spec = a[i]; int semi = spec.indexOf(";->");
                String type = spec.substring(0, semi + 1), member = spec.substring(semi + 3);
                boolean ok = member.contains("(") ? resolveMethod(type, member) : resolveField(type, member);
                if (!ok) { missing++; System.out.println("  NOT SHIPPED: " + spec); }
            }
            System.out.println("expected new members: " + (a.length - 1) + "   missing: " + missing);
        }
    }
}
