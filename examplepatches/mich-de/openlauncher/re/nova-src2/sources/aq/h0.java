package aq;

import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/* loaded from: classes4.dex */
public final class h0 {

    /* renamed from: d, reason: collision with root package name */
    public static final ArrayList f15469d;

    /* renamed from: a, reason: collision with root package name */
    public final List f15470a;

    /* renamed from: b, reason: collision with root package name */
    public final ThreadLocal f15471b = new ThreadLocal();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f15472c = new LinkedHashMap();

    static {
        ArrayList arrayList = new ArrayList(5);
        f15469d = arrayList;
        arrayList.add(m0.f15502a);
        arrayList.add(m.f15499c);
        arrayList.add(g.f15458e);
        arrayList.add(g.f15457d);
        arrayList.add(i0.f15476a);
        arrayList.add(l.f15489d);
    }

    public h0(e0 e0Var) {
        ArrayList arrayList = e0Var.f15450a;
        int size = arrayList.size();
        ArrayList arrayList2 = f15469d;
        ArrayList arrayList3 = new ArrayList(arrayList2.size() + size);
        arrayList3.addAll(arrayList);
        arrayList3.addAll(arrayList2);
        this.f15470a = Collections.unmodifiableList(arrayList3);
    }

    public final r a(Type type, Set set) {
        return b(type, set, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v4, types: [aq.r] */
    public final r b(Type type, Set set, String str) {
        f0 f0Var;
        if (type == null) {
            throw new NullPointerException("type == null");
        }
        if (set == null) {
            throw new NullPointerException("annotations == null");
        }
        Type typeG = bq.e.g(bq.e.a(type));
        Object objAsList = set.isEmpty() ? typeG : Arrays.asList(typeG, set);
        synchronized (this.f15472c) {
            try {
                r rVar = (r) this.f15472c.get(objAsList);
                if (rVar != null) {
                    return rVar;
                }
                g0 g0Var = (g0) this.f15471b.get();
                if (g0Var == null) {
                    g0Var = new g0(this);
                    this.f15471b.set(g0Var);
                }
                ArrayDeque arrayDeque = g0Var.f15463b;
                ArrayList arrayList = g0Var.f15462a;
                int size = arrayList.size();
                int i5 = 0;
                while (true) {
                    if (i5 >= size) {
                        f0 f0Var2 = new f0(typeG, str, objAsList);
                        arrayList.add(f0Var2);
                        arrayDeque.add(f0Var2);
                        f0Var = null;
                        break;
                    }
                    f0Var = (f0) arrayList.get(i5);
                    if (f0Var.f15455c.equals(objAsList)) {
                        arrayDeque.add(f0Var);
                        ?? r12 = f0Var.f15456d;
                        if (r12 != 0) {
                            f0Var = r12;
                        }
                    } else {
                        i5++;
                    }
                }
                try {
                    if (f0Var != null) {
                        return f0Var;
                    }
                    try {
                        int size2 = this.f15470a.size();
                        for (int i11 = 0; i11 < size2; i11++) {
                            r rVarA = ((q) this.f15470a.get(i11)).a(typeG, set, this);
                            if (rVarA != null) {
                                ((f0) g0Var.f15463b.getLast()).f15456d = rVarA;
                                g0Var.b(true);
                                return rVarA;
                            }
                        }
                        throw new IllegalArgumentException("No JsonAdapter for " + bq.e.j(typeG, set));
                    } catch (IllegalArgumentException e3) {
                        throw g0Var.a(e3);
                    }
                } finally {
                    g0Var.b(false);
                }
            } finally {
            }
        }
    }

    public final r c(e eVar, Type type, Set set) {
        if (set == null) {
            throw new NullPointerException("annotations == null");
        }
        Type typeG = bq.e.g(bq.e.a(type));
        List list = this.f15470a;
        int iIndexOf = list.indexOf(eVar);
        if (iIndexOf == -1) {
            throw new IllegalArgumentException("Unable to skip past unknown factory " + eVar);
        }
        int size = list.size();
        for (int i5 = iIndexOf + 1; i5 < size; i5++) {
            r rVarA = ((q) list.get(i5)).a(typeG, set, this);
            if (rVarA != null) {
                return rVarA;
            }
        }
        throw new IllegalArgumentException("No next JsonAdapter for " + bq.e.j(typeG, set));
    }
}
