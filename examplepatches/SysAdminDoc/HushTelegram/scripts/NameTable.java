import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.Reference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.container.SpecTypePair;
import com.reandroid.arsc.model.ResourceEntry;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Writes the name table the patches read for one Telegram build (TelegramNames.kt): the names R8
 * gave org.telegram.messenger's top-level classes, methods and fields, keyed by the names the last
 * named build (13.1.1) used, then the build's resource ids.
 *
 * <p>Evidence for a match: strings unique to one method in both builds, and the reference streams
 * of methods already paired (kept-name classes first, then matched ones), aligned by LCS; inside a
 * matched class, left-over members with one compatible partner. A row matched by shape alone ends
 * in {@code w}.
 *
 * <p>When the table file already exists, every # block below its generated rows (the gap-fill and
 * the hand-added rows) is kept as it is, and a hand row replaces any generated row that names the
 * same member in either build; a hand class row that overrules the match takes the member rows
 * matched through the wrong pair with it. The resource block is rebuilt from the names a table already holds:
 * resources.arsc for everything it names, then assets/string_resource_ids.bin for strings.
 *
 * <p>Usage: {@code java -cp <morphe-desktop jar> NameTable.java <named.apk> <new.apk>
 * "<versionCode> <versionName> <package>" <table.txt> [<names-from table>]}. scripts/name-table.ps1
 * fills these in.
 */
public class NameTable {
    static final String PKG = "Lorg/telegram/messenger/";
    Map<String, ClassDef> O, N;
    Map<String, Method> oMeth = new HashMap<>(), nMeth = new HashMap<>();
    Map<String, Field> oFld = new HashMap<>(), nFld = new HashMap<>();
    Map<String, String> cls = new HashMap<>(), clsBack = new HashMap<>();
    Map<String, String> meth = new HashMap<>(), methBack = new HashMap<>();
    Map<String, String> fld = new HashMap<>(), fldBack = new HashMap<>();
    Map<String, Map<String, Double>> vCls = new HashMap<>(), vMeth = new HashMap<>(), vFld = new HashMap<>();
    Set<String> weak = new HashSet<>();

    static Map<String, ClassDef> load(String apk) throws Exception {
        MultiDexContainer<? extends DexFile> c = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        Map<String, ClassDef> m = new HashMap<>();
        for (String e : c.getDexEntryNames()) for (ClassDef d : c.getEntry(e).getDexFile().getClasses()) m.put(d.getType(), d);
        return m;
    }

    static boolean renamedPkg(String t) {
        return t.startsWith(PKG) && t.indexOf('/', PKG.length()) < 0;
    }

    static String base(String t) {
        int i = 0;
        while (i < t.length() && t.charAt(i) == '[') i++;
        return t.substring(i);
    }

    static String dims(String t) {
        int i = 0;
        while (i < t.length() && t.charAt(i) == '[') i++;
        return t.substring(0, i);
    }

    /** An old type whose name means the same in the new build. */
    boolean stable(String t) {
        String b = base(t);
        if (b.length() == 1) return true;
        if (!O.containsKey(b)) return true;
        if (renamedPkg(b)) return false;
        return N.containsKey(b);
    }

    /** The new build's name for an old type, or null while unknown. */
    String mapType(String t) {
        String b = base(t);
        if (stable(b)) return t;
        String m = cls.get(b);
        return m == null ? null : dims(t) + m;
    }

    boolean newIsFree(String nt) {
        String b = base(nt);
        if (b.length() == 1) return false;
        if (clsBack.containsKey(b)) return false;
        return !O.containsKey(b) || renamedPkg(b);
    }

    boolean typeCompat(String o, String n) {
        String m = mapType(o);
        if (m != null) return m.equals(n);
        return dims(o).equals(dims(n)) && newIsFree(n);
    }

    boolean protoCompat(List<? extends CharSequence> op, String or, List<? extends CharSequence> np, String nr) {
        if (op.size() != np.size()) return false;
        if (!typeCompat(or, nr)) return false;
        for (int i = 0; i < op.size(); i++) if (!typeCompat(op.get(i).toString(), np.get(i).toString())) return false;
        return true;
    }

    static String key(MethodReference r) {
        StringBuilder sb = new StringBuilder(r.getDefiningClass()).append("->").append(r.getName()).append('(');
        for (CharSequence p : r.getParameterTypes()) sb.append(p);
        return sb.append(')').append(r.getReturnType()).toString();
    }

    static String key(Method m) {
        StringBuilder sb = new StringBuilder(m.getDefiningClass()).append("->").append(m.getName()).append('(');
        for (CharSequence p : m.getParameterTypes()) sb.append(p);
        return sb.append(')').append(m.getReturnType()).toString();
    }

    static String key(FieldReference f) {
        return f.getDefiningClass() + "->" + f.getName() + ":" + f.getType();
    }

    static void vote(Map<String, Map<String, Double>> v, String o, String n, double w) {
        v.computeIfAbsent(o, k -> new HashMap<>()).merge(n, w, Double::sum);
    }

    static final class Ref {
        final Opcode op;
        final Reference ref;
        Ref(Opcode op, Reference ref) { this.op = op; this.ref = ref; }
    }

    static List<Ref> refs(Method m) {
        MethodImplementation impl = m.getImplementation();
        if (impl == null) return Collections.emptyList();
        List<Ref> out = new ArrayList<>();
        for (Instruction i : impl.getInstructions()) {
            if (i instanceof ReferenceInstruction) out.add(new Ref(i.getOpcode(), ((ReferenceInstruction) i).getReference()));
        }
        return out;
    }

    static int family(Opcode o) {
        switch (o) {
            case INVOKE_VIRTUAL: case INVOKE_VIRTUAL_RANGE: case INVOKE_DIRECT: case INVOKE_DIRECT_RANGE:
            case INVOKE_INTERFACE: case INVOKE_INTERFACE_RANGE: case INVOKE_SUPER: case INVOKE_SUPER_RANGE:
                return 1;
            case INVOKE_STATIC: case INVOKE_STATIC_RANGE: return 2;
            case IGET: case IGET_WIDE: case IGET_OBJECT: case IGET_BOOLEAN: case IGET_BYTE: case IGET_CHAR: case IGET_SHORT: return 3;
            case IPUT: case IPUT_WIDE: case IPUT_OBJECT: case IPUT_BOOLEAN: case IPUT_BYTE: case IPUT_CHAR: case IPUT_SHORT: return 4;
            case SGET: case SGET_WIDE: case SGET_OBJECT: case SGET_BOOLEAN: case SGET_BYTE: case SGET_CHAR: case SGET_SHORT: return 5;
            case SPUT: case SPUT_WIDE: case SPUT_OBJECT: case SPUT_BOOLEAN: case SPUT_BYTE: case SPUT_CHAR: case SPUT_SHORT: return 6;
            default: return 100 + o.ordinal();
        }
    }

    boolean compat(Ref a, Ref b) {
        if (family(a.op) != family(b.op)) return false;
        Reference x = a.ref, y = b.ref;
        if (x instanceof StringReference) return y instanceof StringReference && x.toString().equals(y.toString());
        if (x instanceof TypeReference) return y instanceof TypeReference && typeCompat(((TypeReference) x).getType(), ((TypeReference) y).getType());
        if (x instanceof MethodReference) {
            if (!(y instanceof MethodReference)) return false;
            MethodReference p = (MethodReference) x, q = (MethodReference) y;
            String po = p.getDefiningClass();
            if (!typeCompat(po, q.getDefiningClass())) return false;
            boolean ownerStable = stable(po) && !renamedPkg(base(po));
            if (ownerStable && !p.getName().equals(q.getName())) return false;
            if (!ownerStable) {
                String mk = meth.get(key(p));
                if (mk != null && !mk.equals(key(q))) return false;
                if (mk == null && methBack.containsKey(key(q))) return false;
            }
            return protoCompat(p.getParameterTypes(), p.getReturnType(), q.getParameterTypes(), q.getReturnType());
        }
        if (x instanceof FieldReference) {
            if (!(y instanceof FieldReference)) return false;
            FieldReference p = (FieldReference) x, q = (FieldReference) y;
            String po = p.getDefiningClass();
            if (!typeCompat(po, q.getDefiningClass())) return false;
            if (!typeCompat(p.getType(), q.getType())) return false;
            boolean ownerStable = stable(po) && !renamedPkg(base(po));
            if (ownerStable) return p.getName().equals(q.getName());
            String fk = fld.get(key(p));
            if (fk != null) return fk.equals(key(q));
            return !fldBack.containsKey(key(q));
        }
        return false;
    }

    void voteTypes(String o, String n, double w) {
        String b = base(o), nb = base(n);
        if (renamedPkg(b) && !stable(b) && dims(o).equals(dims(n)) && nb.length() > 1) vote(vCls, b, nb, w);
    }

    void voteAligned(Ref a, Ref b, double w) {
        if (a.ref instanceof MethodReference) {
            MethodReference p = (MethodReference) a.ref, q = (MethodReference) b.ref;
            voteTypes(p.getDefiningClass(), q.getDefiningClass(), w);
            voteTypes(p.getReturnType(), q.getReturnType(), w * 0.5);
            for (int i = 0; i < p.getParameterTypes().size(); i++)
                voteTypes(p.getParameterTypes().get(i).toString(), q.getParameterTypes().get(i).toString(), w * 0.5);
            if (renamedPkg(base(p.getDefiningClass()))) vote(vMeth, key(p), key(q), w);
        } else if (a.ref instanceof FieldReference) {
            FieldReference p = (FieldReference) a.ref, q = (FieldReference) b.ref;
            voteTypes(p.getDefiningClass(), q.getDefiningClass(), w);
            voteTypes(p.getType(), q.getType(), w * 0.5);
            if (renamedPkg(base(p.getDefiningClass()))) vote(vFld, key(p), key(q), w);
        } else if (a.ref instanceof TypeReference) {
            voteTypes(((TypeReference) a.ref).getType(), ((TypeReference) b.ref).getType(), w);
        }
    }

    /** LCS over two reference streams; votes for every aligned pair. Returns the aligned count. */
    int align(List<Ref> A, List<Ref> B, double w) {
        int n = A.size(), m = B.size();
        if (n == 0 || m == 0) return 0;
        if ((long) n * m > 4_000_000L) return 0;
        short[][] dp = new short[n + 1][m + 1];
        boolean[][] eq = new boolean[n][m];
        for (int i = 0; i < n; i++) for (int j = 0; j < m; j++) eq[i][j] = compat(A.get(i), B.get(j));
        for (int i = n - 1; i >= 0; i--)
            for (int j = m - 1; j >= 0; j--)
                dp[i][j] = eq[i][j] ? (short) (dp[i + 1][j + 1] + 1) : (short) Math.max(dp[i + 1][j], dp[i][j + 1]);
        int i = 0, j = 0, c = 0;
        while (i < n && j < m) {
            if (eq[i][j] && dp[i][j] == dp[i + 1][j + 1] + 1) {
                voteAligned(A.get(i), B.get(j), w);
                c++;
                i++;
                j++;
            } else if (dp[i + 1][j] >= dp[i][j + 1]) i++;
            else j++;
        }
        return c;
    }

    void index() {
        for (ClassDef c : O.values()) {
            for (Method m : c.getMethods()) oMeth.put(key(m), m);
            for (Field f : c.getFields()) oFld.put(key(f), f);
        }
        for (ClassDef c : N.values()) {
            for (Method m : c.getMethods()) nMeth.put(key(m), m);
            for (Field f : c.getFields()) nFld.put(key(f), f);
        }
    }

    void uniqueStrings() {
        Map<String, Object> os = strings(O), ns = strings(N);
        for (Map.Entry<String, Object> e : os.entrySet()) {
            Object ov = e.getValue(), nv = ns.get(e.getKey());
            if (!(ov instanceof String) || !(nv instanceof String)) continue;
            String om = (String) ov, nm = (String) nv;
            String oc = om.substring(0, om.indexOf("->")), nc = nm.substring(0, nm.indexOf("->"));
            if (!renamedPkg(oc)) continue;
            vote(vMeth, om, nm, 3);
            if (!stable(oc)) vote(vCls, oc, nc, 3);
        }
    }

    /** string -> the one method key holding it, or a marker when several do. */
    static Map<String, Object> strings(Map<String, ClassDef> d) {
        Map<String, Object> s = new HashMap<>();
        Object many = new Object();
        for (ClassDef c : d.values()) {
            for (Method m : c.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                String k = null;
                for (Instruction i : impl.getInstructions()) {
                    if (!(i instanceof ReferenceInstruction)) continue;
                    Reference r = ((ReferenceInstruction) i).getReference();
                    if (!(r instanceof StringReference)) continue;
                    String v = r.toString();
                    if (v.length() < 4) continue;
                    if (k == null) k = key(m);
                    Object prev = s.get(v);
                    if (prev == null) s.put(v, k);
                    else if (prev != many && !prev.equals(k)) s.put(v, many);
                }
            }
        }
        return s;
    }

    static String best(Map<String, Double> m, double minVotes, double ratio) {
        String b = null;
        double bv = 0, sv = 0;
        for (Map.Entry<String, Double> e : m.entrySet()) {
            if (e.getValue() > bv) { sv = bv; bv = e.getValue(); b = e.getKey(); }
            else if (e.getValue() > sv) sv = e.getValue();
        }
        if (bv < minVotes || bv < ratio * sv) return null;
        return b;
    }

    int resolve() {
        int added = 0;
        // classes: strongest first, injective
        List<Map.Entry<String, Map<String, Double>>> cl = new ArrayList<>(vCls.entrySet());
        cl.sort((a, b) -> Double.compare(total(b.getValue()), total(a.getValue())));
        for (Map.Entry<String, Map<String, Double>> e : cl) {
            if (cls.containsKey(e.getKey())) continue;
            String b = best(e.getValue(), 2, 3);
            if (b == null || clsBack.containsKey(b) || O.containsKey(b) && !renamedPkg(b)) continue;
            cls.put(e.getKey(), b);
            clsBack.put(b, e.getKey());
            added++;
        }
        for (Map.Entry<String, Map<String, Double>> e : vMeth.entrySet()) {
            if (meth.containsKey(e.getKey())) continue;
            String b = best(e.getValue(), 1, 2);
            if (b == null || methBack.containsKey(b)) continue;
            String oc = e.getKey().substring(0, e.getKey().indexOf("->")), nc = b.substring(0, b.indexOf("->"));
            String mc = mapType(oc);
            if (mc == null || !mc.equals(nc)) continue;
            Method om = oMeth.get(e.getKey()), nm = nMeth.get(b);
            if (om == null || nm == null) continue;
            if (!protoCompat(om.getParameterTypes(), om.getReturnType(), nm.getParameterTypes(), nm.getReturnType())) continue;
            meth.put(e.getKey(), b);
            methBack.put(b, e.getKey());
            added++;
        }
        for (Map.Entry<String, Map<String, Double>> e : vFld.entrySet()) {
            if (fld.containsKey(e.getKey())) continue;
            String b = best(e.getValue(), 1, 2);
            if (b == null || fldBack.containsKey(b)) continue;
            String oc = e.getKey().substring(0, e.getKey().indexOf("->")), nc = b.substring(0, b.indexOf("->"));
            String mc = mapType(oc);
            if (mc == null || !mc.equals(nc)) continue;
            if (!oFld.containsKey(e.getKey()) || !nFld.containsKey(b)) continue;
            fld.put(e.getKey(), b);
            fldBack.put(b, e.getKey());
            added++;
        }
        return added;
    }

    static double total(Map<String, Double> m) {
        double t = 0;
        for (double v : m.values()) t += v;
        return t;
    }

    /** Within matched classes, pairs left-over members that have exactly one compatible partner. */
    int fill() {
        int added = 0;
        for (Map.Entry<String, String> e : new ArrayList<>(cls.entrySet())) {
            ClassDef oc = O.get(e.getKey()), nc = N.get(e.getValue());
            if (oc == null || nc == null) continue;
            added += fillClass(oc, nc);
        }
        for (ClassDef oc : O.values()) {
            if (!renamedPkg(oc.getType()) || !N.containsKey(oc.getType())) continue;
            added += fillClass(oc, N.get(oc.getType()));
        }
        return added;
    }

    static String opFamily(Opcode o) {
        String n = o.name;
        if (n.startsWith("invoke-")) return n.replace("/range", "");
        if (n.startsWith("const")) return n.startsWith("const-string") ? "const-string" : n.startsWith("const-class") ? "const-class" : "const";
        if (n.startsWith("move-result")) return "move-result";
        if (n.startsWith("move")) return "move";
        if (n.startsWith("goto")) return "goto";
        if (n.startsWith("return")) return "return";
        int dash = n.indexOf('-');
        if (n.startsWith("iget") || n.startsWith("iput") || n.startsWith("sget") || n.startsWith("sput") || n.startsWith("aget") || n.startsWith("aput"))
            return dash < 0 ? n : n.substring(0, dash);
        return n.replace("/2addr", "").replace("/lit8", "").replace("/lit16", "");
    }

    static List<String> ops(Method m) {
        MethodImplementation impl = m.getImplementation();
        if (impl == null) return Collections.emptyList();
        List<String> out = new ArrayList<>();
        for (Instruction i : impl.getInstructions()) {
            if (i.getOpcode() == Opcode.NOP) continue;
            out.add(opFamily(i.getOpcode()));
        }
        return out;
    }

    static double lcsRatio(List<String> a, List<String> b) {
        int n = a.size(), m = b.size();
        if (n == 0 && m == 0) return 1;
        if (n == 0 || m == 0) return 0;
        if ((long) n * m > 2_000_000L) {
            Map<String, Integer> h = new HashMap<>();
            for (String s : a) h.merge(s, 1, Integer::sum);
            int common = 0;
            for (String s : b) { Integer c = h.get(s); if (c != null && c > 0) { common++; h.put(s, c - 1); } }
            return 2.0 * common / (n + m);
        }
        int[] prev = new int[m + 1], cur = new int[m + 1];
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++)
                cur[j] = a.get(i - 1).equals(b.get(j - 1)) ? prev[j - 1] + 1 : Math.max(prev[j], cur[j - 1]);
            int[] t = prev; prev = cur; cur = t;
        }
        return 2.0 * prev[m] / (n + m);
    }

    static Set<String> strs(Method m) {
        Set<String> s = new HashSet<>();
        MethodImplementation impl = m.getImplementation();
        if (impl == null) return s;
        for (Instruction i : impl.getInstructions())
            if (i instanceof ReferenceInstruction && ((ReferenceInstruction) i).getReference() instanceof StringReference)
                s.add(((ReferenceInstruction) i).getReference().toString());
        return s;
    }

    /** How alike two bodies are, 0 to 1: opcode shape, aligned references, shared strings. */
    double similarity(Method a, Method b) {
        List<String> oa = ops(a), ob = ops(b);
        double op = lcsRatio(oa, ob);
        List<Ref> ra = refs(a), rb = refs(b);
        double ref;
        if (ra.isEmpty() && rb.isEmpty()) ref = op;
        else {
            Map<String, Map<String, Double>> sc = vCls, sm = vMeth, sf = vFld;
            vCls = new HashMap<>(); vMeth = new HashMap<>(); vFld = new HashMap<>();
            int c = align(ra, rb, 0);
            vCls = sc; vMeth = sm; vFld = sf;
            ref = 2.0 * c / (ra.size() + rb.size());
        }
        Set<String> sa = strs(a), sb = strs(b);
        if (sa.isEmpty() && sb.isEmpty()) return 0.5 * op + 0.5 * ref;
        Set<String> u = new HashSet<>(sa); u.addAll(sb);
        Set<String> in = new HashSet<>(sa); in.retainAll(sb);
        double s = (double) in.size() / u.size();
        return 0.4 * op + 0.35 * ref + 0.25 * s;
    }

    int fillClass(ClassDef oc, ClassDef nc) {
        int added = 0;
        List<Method> om = new ArrayList<>(), nm = new ArrayList<>();
        for (Method m : oc.getMethods()) if (!meth.containsKey(key(m))) om.add(m);
        for (Method m : nc.getMethods()) if (!methBack.containsKey(key(m))) nm.add(m);
        // body similarity, mutual best with a margin
        Map<Method, Method> bestN = new HashMap<>();
        Map<Method, double[]> bestNS = new HashMap<>();
        Map<Method, Method> bestO = new HashMap<>();
        Map<Method, double[]> bestOS = new HashMap<>();
        for (Method m : om) {
            if (m.getImplementation() == null) continue;
            for (Method k : nm) {
                if (k.getImplementation() == null) continue;
                if (AccessFlags.STATIC.isSet(m.getAccessFlags()) != AccessFlags.STATIC.isSet(k.getAccessFlags())) continue;
                boolean ctor = m.getName().startsWith("<"), kctor = k.getName().startsWith("<");
                if (ctor != kctor || ctor && !m.getName().equals(k.getName())) continue;
                if (!protoCompat(m.getParameterTypes(), m.getReturnType(), k.getParameterTypes(), k.getReturnType())) continue;
                double s = similarity(m, k);
                double[] bs = bestNS.computeIfAbsent(m, x -> new double[]{-1, -1});
                if (s > bs[0]) { bs[1] = bs[0]; bs[0] = s; bestN.put(m, k); } else if (s > bs[1]) bs[1] = s;
                double[] bo = bestOS.computeIfAbsent(k, x -> new double[]{-1, -1});
                if (s > bo[0]) { bo[1] = bo[0]; bo[0] = s; bestO.put(k, m); } else if (s > bo[1]) bo[1] = s;
            }
        }
        for (Method m : om) {
            Method k = bestN.get(m);
            if (k == null || bestO.get(k) != m) continue;
            double[] bs = bestNS.get(m), bo = bestOS.get(k);
            double margin = Math.min(bs[0] - Math.max(bs[1], 0), bo[0] - Math.max(bo[1], 0));
            boolean only = bs[1] < 0 && bo[1] < 0;
            if (bs[0] >= 0.75 && (margin >= 0.08 || only) || bs[0] >= 0.5 && only) {
                if (meth.containsKey(key(m)) || methBack.containsKey(key(k))) continue;
                meth.put(key(m), key(k));
                methBack.put(key(k), key(m));
                if (bs[0] < 0.85 || !only && margin < 0.15) weak.add(key(m));
                added++;
            }
        }
        om.removeIf(x -> meth.containsKey(key(x)));
        nm.removeIf(x -> methBack.containsKey(key(x)));
        // bodiless methods: the one partner of the same shape, both ways
        for (Method m : om) {
            if (m.getImplementation() != null) continue;
            Method only = null;
            int cnt = 0;
            for (Method k : nm) {
                if (methBack.containsKey(key(k))) continue;
                boolean st = AccessFlags.STATIC.isSet(m.getAccessFlags()), kst = AccessFlags.STATIC.isSet(k.getAccessFlags());
                if (st != kst) continue;
                boolean ctor = m.getName().startsWith("<"), kctor = k.getName().startsWith("<");
                if (ctor != kctor || ctor && !m.getName().equals(k.getName())) continue;
                if (!protoCompat(m.getParameterTypes(), m.getReturnType(), k.getParameterTypes(), k.getReturnType())) continue;
                only = k;
                cnt++;
            }
            int back = 0;
            if (cnt == 1) {
                for (Method x : om) {
                    if (meth.containsKey(key(x))) continue;
                    if (AccessFlags.STATIC.isSet(x.getAccessFlags()) != AccessFlags.STATIC.isSet(only.getAccessFlags())) continue;
                    if (x.getName().startsWith("<") != only.getName().startsWith("<")) continue;
                    if (protoCompat(x.getParameterTypes(), x.getReturnType(), only.getParameterTypes(), only.getReturnType())) back++;
                }
            }
            if (cnt == 1 && back == 1) {
                meth.put(key(m), key(only));
                methBack.put(key(only), key(m));
                if (!m.getName().startsWith("<")) weak.add(key(m));
                added++;
            }
        }
        List<Field> of = new ArrayList<>(), nf = new ArrayList<>();
        for (Field f : oc.getFields()) if (!fld.containsKey(key(f))) of.add(f);
        for (Field f : nc.getFields()) if (!fldBack.containsKey(key(f))) nf.add(f);
        for (Field f : of) {
            Field only = null;
            int cnt = 0;
            for (Field k : nf) {
                if (fldBack.containsKey(key(k))) continue;
                if (AccessFlags.STATIC.isSet(f.getAccessFlags()) != AccessFlags.STATIC.isSet(k.getAccessFlags())) continue;
                if (!typeCompat(f.getType(), k.getType())) continue;
                only = k;
                cnt++;
            }
            int back = 0;
            if (cnt == 1) {
                for (Field x : of) {
                    if (fld.containsKey(key(x))) continue;
                    if (AccessFlags.STATIC.isSet(x.getAccessFlags()) != AccessFlags.STATIC.isSet(only.getAccessFlags())) continue;
                    if (typeCompat(x.getType(), only.getType())) back++;
                }
            }
            if (cnt == 1 && back == 1) {
                fld.put(key(f), key(only));
                fldBack.put(key(only), key(f));
                weak.add(key(f));
                added++;
            }
        }
        return added;
    }

    int alignRound() {
        int pairs = 0;
        // kept-name classes: same method name, compatible proto
        for (ClassDef oc : O.values()) {
            String t = oc.getType();
            ClassDef nc = N.get(t);
            if (nc == null || renamedPkg(t)) continue;
            Map<String, List<Method>> byName = new HashMap<>();
            for (Method m : nc.getMethods()) byName.computeIfAbsent(m.getName(), k -> new ArrayList<>()).add(m);
            for (Method m : oc.getMethods()) {
                if (m.getImplementation() == null) continue;
                List<Method> c = byName.get(m.getName());
                if (c == null) continue;
                Method only = null;
                int cnt = 0;
                for (Method k : c) if (protoCompat(m.getParameterTypes(), m.getReturnType(), k.getParameterTypes(), k.getReturnType())) { only = k; cnt++; }
                if (cnt != 1) continue;
                if (!touchesRenamed(m)) continue;
                align(refs(m), refs(only), 1);
                pairs++;
            }
        }
        for (Map.Entry<String, String> e : new ArrayList<>(meth.entrySet())) {
            Method om = oMeth.get(e.getKey()), nm = nMeth.get(e.getValue());
            if (om == null || nm == null) continue;
            align(refs(om), refs(nm), 1);
            // A matched pair's own signature names types too: getStorageQueue() hands out the
            // DispatchQueue, whatever R8 called it.
            voteTypes(om.getReturnType(), nm.getReturnType(), 1);
            if (om.getParameterTypes().size() == nm.getParameterTypes().size())
                for (int i = 0; i < om.getParameterTypes().size(); i++)
                    voteTypes(om.getParameterTypes().get(i).toString(), nm.getParameterTypes().get(i).toString(), 1);
            pairs++;
        }
        for (Map.Entry<String, String> e : new ArrayList<>(fld.entrySet())) {
            Field of = oFld.get(e.getKey()), nf = nFld.get(e.getValue());
            if (of != null && nf != null) voteTypes(of.getType(), nf.getType(), 1);
        }
        return pairs;
    }

    boolean touchesRenamed(Method m) {
        for (Ref r : refs(m)) {
            String o = null;
            if (r.ref instanceof MethodReference) o = ((MethodReference) r.ref).getDefiningClass();
            else if (r.ref instanceof FieldReference) o = ((FieldReference) r.ref).getDefiningClass();
            else if (r.ref instanceof TypeReference) o = ((TypeReference) r.ref).getType();
            if (o != null && renamedPkg(base(o))) return true;
        }
        return false;
    }

    static String desc(Method m) {
        StringBuilder sb = new StringBuilder("(");
        for (CharSequence p : m.getParameterTypes()) sb.append(p);
        return sb.append(')').append(m.getReturnType()).toString();
    }

    /** A class the patches can name: source classes start uppercase, R8's own names never do. */
    static boolean sourceNamed(String t) {
        if (!renamedPkg(t)) return true;
        if (t.startsWith(PKG + "R$")) return false;  // 13.2 inlines resource ids; no R class is left to match
        char c = t.charAt(PKG.length());
        return Character.isUpperCase(c);
    }

    /** R8 renames in place: a renamed-package class matched outside that package is a wrong match. */
    static boolean placed(String o, String n) {
        return !renamedPkg(o) || renamedPkg(n);
    }

    /** The c, m and f rows the match supports, sorted by kind and then by the named build's name. */
    List<String> rows() {
        List<String> lines = new ArrayList<>();
        Map<String, String> classes = new TreeMap<>(cls);
        // A class both builds hold under one name is itself: a manifest service R8 must keep. A
        // vote by shape for another class (72919 sent ContactsSyncAdapterService to its inner
        // sync adapter) is the wrong match, so the name wins.
        for (String t : O.keySet()) if (renamedPkg(t) && N.containsKey(t)) classes.put(t, t);
        for (Map.Entry<String, String> e : classes.entrySet()) {
            ClassDef oc = O.get(e.getKey()), nc = N.get(e.getValue());
            if (oc == null || nc == null || !sourceNamed(e.getKey()) || !placed(e.getKey(), e.getValue())) continue;
            lines.add("c " + e.getKey() + " " + e.getValue() + " " + oc.getSuperclass() + " " + nc.getSuperclass());
        }
        for (Map.Entry<String, String> e : new TreeMap<>(meth).entrySet()) {
            Method om = oMeth.get(e.getKey()), nm = nMeth.get(e.getValue());
            if (om == null || nm == null || om.getName().startsWith("<") || !sourceNamed(om.getDefiningClass())
                || !placed(om.getDefiningClass(), nm.getDefiningClass())) continue;
            if (om.getName().equals(nm.getName()) && desc(om).equals(desc(nm)) && om.getDefiningClass().equals(nm.getDefiningClass())) continue;
            lines.add("m " + om.getDefiningClass() + " " + om.getName() + " " + desc(om) + " " + nm.getDefiningClass() + " " + nm.getName() + " " + desc(nm) + (weak.contains(e.getKey()) ? " w" : ""));
        }
        for (Map.Entry<String, String> e : new TreeMap<>(fld).entrySet()) {
            Field of = oFld.get(e.getKey()), nf = nFld.get(e.getValue());
            if (of == null || nf == null || !sourceNamed(of.getDefiningClass())
                || !placed(of.getDefiningClass(), nf.getDefiningClass())) continue;
            if (of.getName().equals(nf.getName()) && of.getType().equals(nf.getType()) && of.getDefiningClass().equals(nf.getDefiningClass())) continue;
            lines.add("f " + of.getDefiningClass() + " " + of.getName() + " " + of.getType() + " " + nf.getDefiningClass() + " " + nf.getName() + " " + nf.getType() + (weak.contains(e.getKey()) ? " w" : ""));
        }
        return lines;
    }

    /** What a row names in the named build ([0]) and in this one ([1]), the way TelegramNames keys them; null for other lines. */
    static String[] sides(String row) {
        String[] p = row.split(" ");
        if (p.length == 0) return null;
        switch (p[0]) {
            case "c": return new String[]{"c " + p[1], "c " + p[2]};
            case "m": return new String[]{"m " + p[1] + "->" + p[2] + p[3], "m " + p[4] + "->" + p[5] + p[6]};
            case "f": return new String[]{"f " + p[1] + "->" + p[2], "f " + p[4] + "->" + p[5] + ":" + p[6]};
            default: return null;
        }
    }

    /** What a rerun keeps of a table: the lines of the # blocks above and below its resource block. */
    static final class Kept {
        final List<String> above = new ArrayList<>(), below = new ArrayList<>();
        boolean resources;
    }

    static Kept kept(File table) throws IOException {
        Kept k = new Kept();
        if (!table.isFile()) return k;
        List<String> lines = Files.readAllLines(table.toPath(), StandardCharsets.UTF_8);
        int i = 0;
        while (i < lines.size() && lines.get(i).startsWith("#")) i++;
        while (i < lines.size() && (lines.get(i).startsWith("build ") || lines.get(i).startsWith("dex "))) i++;
        while (i < lines.size() && !lines.get(i).startsWith("#")) i++;
        while (i < lines.size()) {
            String l = lines.get(i++);
            if (l.startsWith("# resource ids") && !k.resources) {
                k.resources = true;
                while (i < lines.size() && lines.get(i).startsWith("r ")) i++;
                continue;
            }
            (k.resources ? k.below : k.above).add(l);
        }
        return k;
    }

    /** type/name -> id for every resource the APK's resources.arsc holds. */
    static Map<String, Integer> arscIds(ZipFile zip) throws IOException {
        Map<String, Integer> ids = new HashMap<>();
        ZipEntry arsc = zip.getEntry(TableBlock.FILE_NAME);
        if (arsc == null) return ids;
        TableBlock table;
        try (InputStream in = new BufferedInputStream(zip.getInputStream(arsc))) {
            table = TableBlock.load(in, (read, total) -> { });
        }
        for (PackageBlock block : table.listPackages())
            for (SpecTypePair pair : block.listSpecTypePairs())
                for (Iterator<ResourceEntry> it = pair.getResources(); it.hasNext(); ) {
                    ResourceEntry r = it.next();
                    if (r != null && !r.isEmpty()) ids.putIfAbsent(r.getType() + "/" + r.getName(), r.getResourceId());
                }
        return ids;
    }

    /**
     * Key hash -> id from assets/string_resource_ids.bin, where Telegram looks its strings up by
     * name: an int32 count, then (id, String.hashCode() of the name) int32 pairs, little endian. A
     * hash two names share says nothing, so it is left out.
     */
    static Map<Integer, Integer> stringIds(ZipFile zip) throws IOException {
        Map<Integer, Integer> ids = new HashMap<>();
        ZipEntry e = zip.getEntry("assets/string_resource_ids.bin");
        if (e == null) return ids;
        ByteBuffer b;
        try (InputStream in = zip.getInputStream(e)) {
            b = ByteBuffer.wrap(in.readAllBytes()).order(ByteOrder.LITTLE_ENDIAN);
        }
        int count = b.getInt();
        Set<Integer> shared = new HashSet<>();
        for (int i = 0; i < count; i++) {
            int id = b.getInt(), hash = b.getInt();
            if (ids.put(hash, id) != null) shared.add(hash);
        }
        ids.keySet().removeAll(shared);
        return ids;
    }

    void writeTable(String newApk, File table, String build, File namesFrom) throws Exception {
        Kept k = kept(table);
        Set<String> handOld = new HashSet<>(), handNew = new HashSet<>(), handResources = new HashSet<>(), handClasses = new HashSet<>();
        for (List<String> block : List.of(k.above, k.below)) {
            for (String l : block) {
                String[] s = sides(l);
                if (s != null) { handOld.add(s[0]); handNew.add(s[1]); }
                String[] p = l.split(" ");
                if (p.length == 4 && p[0].equals("r")) handResources.add(p[1] + "/" + p[2]);
                if (p.length >= 3 && p[0].equals("c")) handClasses.add(p[1] + " " + p[2]);
            }
        }
        // A kept row is someone's correction, so a generated row that names either of its members goes.
        // A kept class row that disagrees with the match also takes the members matched through the wrong pair.
        List<String> generated = rows(), rows = new ArrayList<>();
        Set<String> wrongOld = new HashSet<>(), wrongNew = new HashSet<>();
        for (String l : generated) {
            String[] s = sides(l), p = l.split(" ");
            if (p[0].equals("c") && (handOld.contains(s[0]) || handNew.contains(s[1])) && !handClasses.contains(p[1] + " " + p[2])) {
                wrongOld.add(p[1]);
                wrongNew.add(p[2]);
            }
        }
        int replaced = 0;
        for (String l : generated) {
            String[] s = sides(l), p = l.split(" ");
            if (handOld.contains(s[0]) || handNew.contains(s[1])
                || !p[0].equals("c") && (wrongOld.contains(p[1]) || wrongNew.contains(p[4]))) replaced++;
            else rows.add(l);
        }

        List<String> dex = new ArrayList<>(), res = new ArrayList<>();
        Map<String, Integer> missing = new TreeMap<>();
        int strings = 0, drawables = 0;
        try (ZipFile z = new ZipFile(newApk)) {
            for (Enumeration<? extends ZipEntry> en = z.entries(); en.hasMoreElements(); ) {
                ZipEntry e = en.nextElement();
                if (!e.getName().matches("classes\\d*\\.dex")) continue;
                byte[] h;
                try (InputStream in = z.getInputStream(e)) { h = in.readNBytes(12); }
                int cs = (h[8] & 0xff) | (h[9] & 0xff) << 8 | (h[10] & 0xff) << 16 | (h[11] & 0xff) << 24;
                dex.add(e.getName() + " " + Integer.toHexString(cs));
            }
            Map<String, Integer> arsc = arscIds(z);
            Map<Integer, Integer> byHash = stringIds(z);
            Set<String> seen = new HashSet<>(handResources);
            if (namesFrom != null && namesFrom.isFile()) {
                for (String l : Files.readAllLines(namesFrom.toPath(), StandardCharsets.UTF_8)) {
                    String[] p = l.split(" ");
                    if (p.length != 4 || !p[0].equals("r") || !seen.add(p[1] + "/" + p[2])) continue;
                    Integer id = arsc.get(p[1] + "/" + p[2]);
                    if (id == null && p[1].equals("string")) id = byHash.get(p[2].hashCode());
                    if (id == null) { missing.merge(p[1], 1, Integer::sum); continue; }
                    res.add("r " + p[1] + " " + p[2] + " " + String.format("%08x", id));
                    if (p[1].equals("string")) strings++;
                    else if (p[1].equals("drawable")) drawables++;
                }
            }
        }
        Collections.sort(dex);

        // Written in the temp folder, so a failed run leaves nothing next to the tables the bundle ships.
        File tmp = Files.createTempFile(table.getName(), ".tmp").toFile();
        try {
            try (PrintWriter w = new PrintWriter(tmp, StandardCharsets.UTF_8)) {
                w.print("# Telegram " + build + ": the names R8 gave org.telegram.messenger, matched against the last named build.\n");
                w.print("# Generated by scripts/name-table.ps1, which keeps the # blocks below the generated rows when it runs again; c = class, m = method, f = field, w = matched by shape alone.\n");
                w.print("build " + build + "\n");
                for (String d : dex) w.print("dex " + d + "\n");
                for (String l : rows) w.print(l + "\n");
                for (String l : k.above) w.print(l + "\n");
                w.print("# resource ids: drawable, id and raw from resources.arsc, strings by key hash (assets/string_resource_ids.bin; "
                    + strings + " strings, " + drawables + " drawables)\n");
                for (String l : res) w.print(l + "\n");
                for (String l : k.below) w.print(l + "\n");
            }
            Files.move(tmp.toPath(), table.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(tmp.toPath());
        }
        System.out.println("table " + table + ": " + rows.size() + " generated rows (" + replaced + " left to kept rows), "
            + (k.above.size() + k.below.size()) + " kept lines, " + res.size() + " resource rows"
            + (missing.isEmpty() ? "" : ", not in this build " + missing));
        // A # line typed among the generated rows would keep every row after it as is, so say what was kept.
        for (List<String> block : List.of(k.above, k.below))
            for (String l : block) if (l.startsWith("#")) System.out.println("kept " + l);
    }

    public static void main(String[] a) throws Exception {
        if (a.length < 4) {
            System.err.println("usage: NameTable <named.apk> <new.apk> \"<versionCode> <versionName> <package>\" <table.txt> [<names-from table>]");
            System.exit(2);
        }
        NameTable t = new NameTable();
        t.O = load(a[0]);
        t.N = load(a[1]);
        t.index();
        t.uniqueStrings();
        for (int round = 0; round < 6; round++) {
            int r = t.resolve();
            int f = t.fill();
            System.out.println("round " + round + ": resolved " + r + ", filled " + f + "; classes " + t.cls.size() + ", methods " + t.meth.size() + ", fields " + t.fld.size());
            if (round < 5) {
                t.vCls.clear();
                t.vMeth.clear();
                t.vFld.clear();
                t.uniqueStrings();
                t.alignRound();
            }
        }
        File table = new File(a[3]);
        t.writeTable(a[1], table, a[2], a.length > 4 ? new File(a[4]) : table);
    }
}
