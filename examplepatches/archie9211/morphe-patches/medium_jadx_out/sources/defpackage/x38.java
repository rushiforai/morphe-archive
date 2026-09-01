package defpackage;

import j$.util.DesugarCollections;
import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x38 {
    public static final ArrayList e;
    public final List a;
    public final int b;
    public final ThreadLocal c = new ThreadLocal();
    public final LinkedHashMap d = new LinkedHashMap();

    static {
        ArrayList arrayList = new ArrayList(5);
        e = arrayList;
        arrayList.add(vc2.r);
        arrayList.add(zr1.c);
        arrayList.add(o70.e);
        arrayList.add(o70.d);
        arrayList.add(uwa.a);
        arrayList.add(on1.d);
    }

    public x38(hz2 hz2Var) {
        ArrayList arrayList = hz2Var.a;
        int size = arrayList.size();
        ArrayList arrayList2 = e;
        ArrayList arrayList3 = new ArrayList(arrayList2.size() + size);
        arrayList3.addAll(arrayList);
        arrayList3.addAll(arrayList2);
        this.a = DesugarCollections.unmodifiableList(arrayList3);
        this.b = hz2Var.b;
    }

    public final jb6 a(Type type, Set set, String str) {
        jb6 jb6Var = null;
        if (type == null) {
            z72.c("type == null");
            return null;
        }
        if (set == null) {
            z72.c("annotations == null");
            return null;
        }
        Type typeG = yoe.g(yoe.a(type));
        Object objAsList = set.isEmpty() ? typeG : Arrays.asList(typeG, set);
        synchronized (this.d) {
            try {
                jb6 jb6Var2 = (jb6) this.d.get(objAsList);
                if (jb6Var2 != null) {
                    return jb6Var2;
                }
                w38 w38Var = (w38) this.c.get();
                if (w38Var == null) {
                    w38Var = new w38(this);
                    this.c.set(w38Var);
                }
                ArrayDeque arrayDeque = w38Var.b;
                ArrayList arrayList = w38Var.a;
                int size = arrayList.size();
                int i = 0;
                while (true) {
                    if (i >= size) {
                        v38 v38Var = new v38(typeG, str, objAsList);
                        arrayList.add(v38Var);
                        arrayDeque.add(v38Var);
                        break;
                    }
                    v38 v38Var2 = (v38) arrayList.get(i);
                    if (v38Var2.c.equals(objAsList)) {
                        arrayDeque.add(v38Var2);
                        jb6Var = v38Var2.d;
                        if (jb6Var == null) {
                            jb6Var = v38Var2;
                        }
                    } else {
                        i++;
                    }
                }
                try {
                    if (jb6Var != null) {
                        return jb6Var;
                    }
                    try {
                        int size2 = this.a.size();
                        for (int i2 = 0; i2 < size2; i2++) {
                            jb6 jb6VarA = ((ib6) this.a.get(i2)).a(typeG, set, this);
                            if (jb6VarA != null) {
                                ((v38) w38Var.b.getLast()).d = jb6VarA;
                                w38Var.b(true);
                                return jb6VarA;
                            }
                        }
                        throw new IllegalArgumentException("No JsonAdapter for " + yoe.j(typeG, set));
                    } catch (IllegalArgumentException e2) {
                        throw w38Var.a(e2);
                    }
                } finally {
                    w38Var.b(false);
                }
            } finally {
            }
        }
    }

    public final hz2 b() {
        hz2 hz2Var = new hz2(1);
        int i = 0;
        while (true) {
            List list = this.a;
            int i2 = this.b;
            if (i >= i2) {
                int size = list.size() - e.size();
                while (i2 < size) {
                    hz2Var.b((ib6) list.get(i2));
                    i2++;
                }
                return hz2Var;
            }
            ib6 ib6Var = (ib6) list.get(i);
            if (ib6Var == null) {
                ay0.e("factory == null");
                return null;
            }
            int i3 = hz2Var.b;
            hz2Var.b = i3 + 1;
            hz2Var.a.add(i3, ib6Var);
            i++;
        }
    }

    public final jb6 c(j8 j8Var, Type type, Set set) {
        if (set == null) {
            z72.c("annotations == null");
            return null;
        }
        Type typeG = yoe.g(yoe.a(type));
        List list = this.a;
        int iIndexOf = list.indexOf(j8Var);
        if (iIndexOf == -1) {
            ik4.h("Unable to skip past unknown factory ", j8Var);
            return null;
        }
        int size = list.size();
        for (int i = iIndexOf + 1; i < size; i++) {
            jb6 jb6VarA = ((ib6) list.get(i)).a(typeG, set, this);
            if (jb6VarA != null) {
                return jb6VarA;
            }
        }
        ay0.e("No next JsonAdapter for ".concat(yoe.j(typeG, set)));
        return null;
    }
}
