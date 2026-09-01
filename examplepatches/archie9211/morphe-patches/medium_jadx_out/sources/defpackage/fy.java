package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fy {
    public static final LinkedHashMap c;
    public final o72 a;
    public final ConcurrentHashMap b = new ConcurrentHashMap();

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (dy dyVar : dy.values()) {
            String javaTarget = dyVar.getJavaTarget();
            if (linkedHashMap.get(javaTarget) == null) {
                linkedHashMap.put(javaTarget, dyVar);
            }
        }
        c = linkedHashMap;
    }

    public fy(o72 o72Var) {
        this.a = o72Var;
    }

    public static ArrayList a(Object obj, boolean z) {
        yx yxVar = (yx) obj;
        yxVar.getClass();
        Map mapF = yxVar.f();
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : mapF.entrySet()) {
            bu1.n0((!z || g76.L((n98) entry.getKey(), de6.b)) ? j((f52) entry.getValue()) : ey3.a, arrayList);
        }
        return arrayList;
    }

    public static Object c(Object obj, y05 y05Var) {
        for (Object obj2 : e(obj)) {
            if (g76.L(d(obj2), y05Var)) {
                return obj2;
            }
        }
        return null;
    }

    public static y05 d(Object obj) {
        yx yxVar = (yx) obj;
        yxVar.getClass();
        return yxVar.e();
    }

    public static Iterable e(Object obj) {
        ly annotations;
        yx yxVar = (yx) obj;
        yxVar.getClass();
        y28 y28VarD = f93.d(yxVar);
        return (y28VarD == null || (annotations = y28VarD.getAnnotations()) == null) ? ey3.a : annotations;
    }

    public static boolean f(Object obj, y05 y05Var) {
        Iterable iterableE = e(obj);
        if ((iterableE instanceof Collection) && ((Collection) iterableE).isEmpty()) {
            return false;
        }
        Iterator it2 = iterableE.iterator();
        while (it2.hasNext()) {
            if (g76.L(d(it2.next()), y05Var)) {
                return true;
            }
        }
        return false;
    }

    public static List j(f52 f52Var) {
        if (!(f52Var instanceof g80)) {
            return f52Var instanceof r04 ? d46.Q(((r04) f52Var).c.c()) : ey3.a;
        }
        Iterable iterable = (Iterable) ((g80) f52Var).a;
        ArrayList arrayList = new ArrayList();
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            bu1.n0(j((f52) it2.next()), arrayList);
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0127  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.z96 b(defpackage.z96 r13, defpackage.ly r14) {
        /*
            Method dump skipped, instruction units count: 477
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fy.b(z96, ly):z96");
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public final wl8 g(Object obj, boolean z) {
        vl8 vl8Var;
        y05 y05VarD = d(obj);
        if (y05VarD == null) {
            return null;
        }
        h5b h5bVar = (h5b) ((z) this.a.d).invoke(y05VarD);
        if (h5bVar.isIgnore()) {
            return null;
        }
        if (ee6.k.contains(y05VarD)) {
            vl8Var = vl8.NOT_NULL;
        } else if (ee6.l.contains(y05VarD)) {
            vl8Var = vl8.NULLABLE;
        } else if (ee6.m.contains(y05VarD)) {
            vl8Var = vl8.FORCE_FLEXIBILITY;
        } else {
            if (!y05VarD.equals(ee6.g)) {
                return null;
            }
            String str = (String) bu1.y0(a(obj, false));
            if (str != null) {
                switch (str.hashCode()) {
                    case 73135176:
                        if (!str.equals("MAYBE")) {
                            return null;
                        }
                        vl8Var = vl8.NULLABLE;
                        break;
                    case 74175084:
                        if (!str.equals("NEVER")) {
                            return null;
                        }
                        vl8Var = vl8.NULLABLE;
                        break;
                    case 433141802:
                        if (!str.equals("UNKNOWN")) {
                            return null;
                        }
                        vl8Var = vl8.FORCE_FLEXIBILITY;
                        break;
                        break;
                    case 1933739535:
                        if (!str.equals("ALWAYS")) {
                            return null;
                        }
                        vl8Var = vl8.NOT_NULL;
                        break;
                    default:
                        return null;
                }
            } else {
                vl8Var = vl8.NOT_NULL;
            }
        }
        return new wl8(vl8Var, h5bVar.isWarning() || z);
    }

    public final h5b h(Object obj) {
        String str;
        be6 be6Var = (be6) this.a.c;
        h5b h5bVar = (h5b) be6Var.c.get(d(obj));
        if (h5bVar != null) {
            return h5bVar;
        }
        Object objC = c(obj, ee6.p);
        if (objC == null || (str = (String) bu1.y0(a(objC, false))) == null) {
            return null;
        }
        h5b h5bVar2 = be6Var.b;
        if (h5bVar2 != null) {
            return h5bVar2;
        }
        int iHashCode = str.hashCode();
        if (iHashCode == -2137067054) {
            if (str.equals("IGNORE")) {
                return h5b.IGNORE;
            }
            return null;
        }
        if (iHashCode == -1838656823) {
            if (str.equals("STRICT")) {
                return h5b.STRICT;
            }
            return null;
        }
        if (iHashCode == 2656902 && str.equals("WARN")) {
            return h5b.WARN;
        }
        return null;
    }

    public final Object i(Object obj) {
        Object objI;
        obj.getClass();
        if (!((be6) this.a.c).d) {
            if (bu1.p0(ee6.j, d(obj)) || f(obj, ee6.d)) {
                return obj;
            }
            if (f(obj, ee6.e)) {
                y28 y28VarD = f93.d((yx) obj);
                y28VarD.getClass();
                ConcurrentHashMap concurrentHashMap = this.b;
                Object obj2 = concurrentHashMap.get(y28VarD);
                if (obj2 != null) {
                    return obj2;
                }
                Iterator it2 = e(obj).iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        objI = null;
                        break;
                    }
                    objI = i(it2.next());
                    if (objI != null) {
                        break;
                    }
                }
                if (objI != null) {
                    Object objPutIfAbsent = concurrentHashMap.putIfAbsent(y28VarD, objI);
                    return objPutIfAbsent == null ? objI : objPutIfAbsent;
                }
            }
        }
        return null;
    }
}
