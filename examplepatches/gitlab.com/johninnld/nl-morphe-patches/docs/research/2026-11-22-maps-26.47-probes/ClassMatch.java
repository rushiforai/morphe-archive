import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

public class ClassMatch {
    static class Feat {
        Set<String> refs = new HashSet<>();
        Set<String> strings = new HashSet<>();
        Set<String> shapes = new HashSet<>();
    }

    static boolean stable(String t) {
        if (t == null) return false;
        String p = t.startsWith("[") ? t.substring(t.lastIndexOf('[') + 1) : t;
        return p.startsWith("Landroid/") || p.startsWith("Ljava/") || p.startsWith("Ljavax/")
            || p.startsWith("Lkotlin/") || p.startsWith("Lkotlinx/") || p.startsWith("Lcom/google/android/gms/")
            || p.startsWith("Lcom/google/android/material/") || p.startsWith("Lcom/google/protobuf/")
            || p.startsWith("Lcom/google/common/") || p.startsWith("Landroidx/") || p.startsWith("Lorg/json/")
            || p.startsWith("Lio/") || p.startsWith("Lorg/") || p.startsWith("Ldagger/");
    }

    static Map<String, Feat> load(File apk) throws Exception {
        Map<String, Feat> map = new LinkedHashMap<>();
        var container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String dex : container.getDexEntryNames()) {
            for (ClassDef c : container.getEntry(dex).getDexFile().getClasses()) {
                Feat f = new Feat();
                for (Field fd : c.getFields()) f.shapes.add("F" + fd.getType());
                for (Method m : c.getMethods()) {
                    f.shapes.add("M" + m.getParameterTypes().size() + m.getReturnType());
                    MethodImplementation impl = m.getImplementation();
                    if (impl == null) continue;
                    for (Instruction ins : impl.getInstructions()) {
                        if (ins instanceof ReferenceInstruction) {
                            Reference r = ((ReferenceInstruction) ins).getReference();
                            if (r instanceof MethodReference) {
                                MethodReference mr = (MethodReference) r;
                                if (stable(mr.getDefiningClass()))
                                    f.refs.add(mr.getDefiningClass() + "->" + mr.getName() + mr.getParameterTypes() + mr.getReturnType());
                                if (stable(mr.getReturnType()) && mr.getReturnType().startsWith("L")) f.shapes.add("R" + mr.getReturnType());
                            } else if (r instanceof FieldReference) {
                                FieldReference fr = (FieldReference) r;
                                if (stable(fr.getDefiningClass()))
                                    f.refs.add(fr.getDefiningClass() + "->" + fr.getName() + ":" + fr.getType());
                            } else if (r instanceof StringReference) {
                                String s = ((StringReference) r).getString();
                                if (s != null && s.length() >= 4 && s.length() < 200) f.strings.add(s);
                            } else if (r instanceof TypeReference) {
                                String t = ((TypeReference) r).getType();
                                if (stable(t)) f.refs.add("T" + t);
                            }
                        } else if (ins instanceof WideLiteralInstruction) {
                            long v = ((WideLiteralInstruction) ins).getWideLiteral();
                            if (v > 1000 && v < 100000000L) f.shapes.add("N" + v);
                        }
                    }
                }
                map.put(c.getType(), f);
            }
        }
        return map;
    }

    static Map<String, List<String>> index(Map<String, Feat> m, java.util.function.Function<Feat, Set<String>> pick) {
        Map<String, List<String>> idx = new HashMap<>();
        for (var e : m.entrySet())
            for (String t : pick.apply(e.getValue()))
                idx.computeIfAbsent(t, k -> new ArrayList<>()).add(e.getKey());
        return idx;
    }

    static double jac(int inter, int a, int b) {
        if (a == 0 && b == 0) return 0;
        return (double) inter / (a + b - inter);
    }

    public static void main(String[] args) throws Exception {
        Map<String, Feat> oldM = load(new File(args[0]));
        Map<String, Feat> newM = load(new File(args[1]));
        System.err.println("old classes=" + oldM.size() + " new classes=" + newM.size());
        int sameName = 0;
        for (String n : oldM.keySet()) if (newM.containsKey(n)) sameName++;
        System.err.println("same-name classes=" + sameName);

        Map<String, List<String>> refIdx = index(newM, f -> f.refs);
        Map<String, List<String>> strIdx = index(newM, f -> f.strings);
        Map<String, List<String>> shapeIdx = index(newM, f -> f.shapes);

        // Map mode: all old classes -> best new class, when confident enough.
        if (args[2].equals("--map")) {
            for (var e : oldM.entrySet()) {
                String want = e.getKey();
                Feat q = e.getValue();
                Map<String, int[]> acc = new HashMap<>();
                List<String> cands = new ArrayList<>();
                accumulate(q.refs, refIdx, acc, cands, 0);
                accumulate(q.strings, strIdx, acc, cands, 1);
                accumulate(q.shapes, shapeIdx, acc, cands, 2);
                String best = null; double bestScore = 0;
                for (String c : cands) {
                    if (c.equals(want)) continue;
                    int[] v = acc.get(c);
                    Feat nf = newM.get(c);
                    double sc = 0.55 * jac(v[0], q.refs.size(), nf.refs.size())
                              + 0.30 * jac(v[1], q.strings.size(), nf.strings.size())
                              + 0.15 * jac(v[2], q.shapes.size(), nf.shapes.size());
                    if (sc > bestScore) { bestScore = sc; best = c; }
                }
                if (best != null && bestScore >= 0.45) System.out.printf("%s\t%s\t%.3f%n", want, best, bestScore);
            }
            return;
        }

        for (int i = 2; i < args.length; i++) {
            String want = args[i].endsWith(";") ? args[i] : "L" + args[i] + ";";
            Feat q = oldM.get(want);
            if (q == null) { System.out.println(want + "\tMISSING old class"); continue; }
            Map<String, int[]> acc = new HashMap<>();
            List<String> cands = new ArrayList<>();
            accumulate(q.refs, refIdx, acc, cands, 0);
            accumulate(q.strings, strIdx, acc, cands, 1);
            accumulate(q.shapes, shapeIdx, acc, cands, 2);
            Map<String, Double> scores = new HashMap<>();
            for (String c : cands) {
                if (c.equals(want)) continue;
                int[] v = acc.get(c);
                Feat nf = newM.get(c);
                double sc = 0.55 * jac(v[0], q.refs.size(), nf.refs.size())
                          + 0.30 * jac(v[1], q.strings.size(), nf.strings.size())
                          + 0.15 * jac(v[2], q.shapes.size(), nf.shapes.size());
                scores.put(c, sc);
            }
            System.out.println(want + (newM.containsKey(want) ? "  (name still present)" : ""));
            List<String> top = new ArrayList<>(scores.keySet());
            top.sort((a, b) -> Double.compare(scores.get(b), scores.get(a)));
            for (int k = 0; k < Math.min(5, top.size()); k++) {
                String c = top.get(k);
                int[] v = acc.get(c);
                Feat nf = newM.get(c);
                System.out.printf("   %-32s %.3f  refs %.2f  str %.2f  shape %.2f%n", c, scores.get(c),
                    jac(v[0], q.refs.size(), nf.refs.size()), jac(v[1], q.strings.size(), nf.strings.size()),
                    jac(v[2], q.shapes.size(), nf.shapes.size()));
            }
        }
    }

    static void accumulate(Set<String> toks, Map<String, List<String>> idx, Map<String, int[]> acc, List<String> seen, int pos) {
        for (String t : toks) {
            List<String> hit = idx.get(t);
            if (hit == null) continue;
            for (String c : hit) {
                int[] v = acc.get(c);
                if (v == null) { v = new int[3]; acc.put(c, v); seen.add(c); }
                v[pos]++;
            }
        }
    }
}
