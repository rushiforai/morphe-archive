package defpackage;

import defpackage.o96;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.AbstractCollection;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dh5 {
    public static final r05 p = r05.d;
    public static final qf4 q = qf4.IDENTITY;
    public static final umd r = umd.DOUBLE;
    public static final umd s = umd.LAZILY_PARSED_NUMBER;
    public static final o72 t;
    public static final mb6 u;
    public static final dh5 v;
    public static final List w;
    public final i44 a;
    public final xa7 b;
    public rf4 c;
    public final HashMap d;
    public final ArrayList e;
    public final ArrayList f;
    public boolean g;
    public final int h;
    public final int i;
    public final boolean j;
    public r05 k;
    public final boolean l;
    public final umd m;
    public final umd n;
    public final ArrayDeque o;

    static {
        o72 o72Var = new o72(Collections.EMPTY_MAP, true, Collections.EMPTY_LIST);
        t = o72Var;
        mb6 mb6Var = new mb6(o72Var);
        u = mb6Var;
        dh5 dh5Var = new dh5();
        v = dh5Var;
        w = dh5Var.a(o72Var, mb6Var);
    }

    public dh5(ch5 ch5Var) {
        this.a = i44.c;
        this.b = xa7.DEFAULT;
        this.c = q;
        HashMap map = new HashMap();
        this.d = map;
        ArrayList arrayList = new ArrayList();
        this.e = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.f = arrayList2;
        this.g = false;
        this.h = 2;
        this.i = 2;
        this.j = true;
        this.k = p;
        this.l = true;
        this.m = r;
        this.n = s;
        ArrayDeque arrayDeque = new ArrayDeque();
        this.o = arrayDeque;
        this.a = ch5Var.f;
        this.c = ch5Var.g;
        map.putAll(ch5Var.h);
        this.g = ch5Var.i;
        this.j = ch5Var.j;
        this.k = ch5Var.k;
        this.b = ch5Var.o;
        this.h = ch5Var.m;
        this.i = ch5Var.n;
        arrayList.addAll(ch5Var.p);
        arrayList2.addAll(ch5Var.q);
        this.l = ch5Var.l;
        this.m = ch5Var.r;
        this.n = ch5Var.s;
        arrayDeque.addAll(ch5Var.t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static List b(AbstractCollection abstractCollection) {
        if (abstractCollection.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        if (abstractCollection.size() == 1) {
            return Collections.singletonList(abstractCollection instanceof List ? ((List) abstractCollection).get(0) : abstractCollection.iterator().next());
        }
        return DesugarCollections.unmodifiableList(Arrays.asList(abstractCollection.toArray()));
    }

    public final List a(o72 o72Var, mb6 mb6Var) {
        dm8 dm8Var;
        fvd fvdVar;
        fvd fvdVar2;
        ArrayList arrayList = new ArrayList();
        arrayList.add(qvd.C);
        umd umdVar = umd.DOUBLE;
        int i = 1;
        umd umdVar2 = this.m;
        if (umdVar2 == umdVar) {
            dm8Var = um8.c;
        } else {
            dm8 dm8Var2 = um8.c;
            dm8Var = new dm8(i, umdVar2);
        }
        arrayList.add(dm8Var);
        arrayList.add(this.a);
        ArrayList arrayList2 = this.e;
        if (!arrayList2.isEmpty()) {
            ArrayList arrayList3 = new ArrayList(arrayList2);
            Collections.reverse(arrayList3);
            arrayList.addAll(arrayList3);
        }
        ArrayList arrayList4 = this.f;
        if (!arrayList4.isEmpty()) {
            ArrayList arrayList5 = new ArrayList(arrayList4);
            Collections.reverse(arrayList5);
            arrayList.addAll(arrayList5);
        }
        boolean z = emc.a;
        int i2 = 2;
        int i3 = 0;
        o96.b bVar = null;
        int i4 = this.h;
        int i5 = this.i;
        if (i4 != 2 || i5 != 2) {
            fvd fvdVar3 = new fvd(Date.class, new ly2(ky2.b, i4, i5), i3);
            if (z) {
                dmc dmcVar = emc.c;
                dmcVar.getClass();
                fvdVar2 = new fvd(dmcVar.a, new ly2(dmcVar, i4, i5), i3);
                dmc dmcVar2 = emc.b;
                dmcVar2.getClass();
                fvdVar = new fvd(dmcVar2.a, new ly2(dmcVar2, i4, i5), i3);
            } else {
                fvdVar = null;
                fvdVar2 = null;
            }
            arrayList.add(fvdVar3);
            if (z) {
                arrayList.add(fvdVar2);
                arrayList.add(fvdVar);
            }
        }
        arrayList.add(qvd.s);
        arrayList.add(qvd.g);
        arrayList.add(qvd.d);
        arrayList.add(qvd.e);
        arrayList.add(qvd.f);
        jud judVarA = this.b.a();
        arrayList.add(new gvd(Long.TYPE, Long.class, judVarA));
        arrayList.add(new gvd(Double.TYPE, Double.class, qvd.n));
        arrayList.add(new gvd(Float.TYPE, Float.class, qvd.m));
        umd umdVar3 = umd.LAZILY_PARSED_NUMBER;
        umd umdVar4 = this.n;
        arrayList.add(umdVar4 == umdVar3 ? fm8.b : new dm8(i3, new fm8(umdVar4)));
        arrayList.add(qvd.h);
        arrayList.add(qvd.i);
        Objects.requireNonNull(judVarA);
        arrayList.add(new fvd(AtomicLong.class, new hh5(judVarA, 3).a(), i3));
        arrayList.add(new fvd(AtomicLongArray.class, new hh5(judVarA, i2).a(), i3));
        arrayList.add(qvd.j);
        arrayList.add(qvd.o);
        arrayList.add(qvd.t);
        arrayList.add(qvd.u);
        arrayList.add(qvd.p);
        arrayList.add(qvd.q);
        arrayList.add(qvd.r);
        arrayList.add(qvd.v);
        arrayList.add(qvd.w);
        arrayList.add(qvd.y);
        arrayList.add(qvd.z);
        arrayList.add(qvd.B);
        arrayList.add(qvd.x);
        arrayList.add(qvd.b);
        arrayList.add(ly2.c);
        arrayList.add(qvd.A);
        try {
            n96 n96Var = o96.a;
            ((o96) ((pvd) o96.class.getDeclaredConstructor(null).newInstance(null))).getClass();
            bVar = o96.j;
        } catch (LinkageError | ReflectiveOperationException unused) {
        }
        if (bVar != null) {
            arrayList.add(bVar);
        }
        arrayList.addAll(emc.d);
        arrayList.add(f80.c);
        arrayList.add(qvd.a);
        arrayList.add(new it1(o72Var, i3));
        arrayList.add(new it1(o72Var, i));
        arrayList.add(mb6Var);
        arrayList.add(qvd.D);
        arrayList.add(new g2b(o72Var, this.c, this.a, mb6Var, b(this.o)));
        arrayList.trimToSize();
        return DesugarCollections.unmodifiableList(arrayList);
    }

    public final void c(Class cls, Object obj) {
        Objects.requireNonNull(cls);
        boolean z = obj instanceof ac6;
        if (!z && !(obj instanceof jud)) {
            ik4.i("Class ", obj.getClass().getName(), " does not implement any supported type adapter class or interface");
            return;
        }
        if (cls == Object.class) {
            ik4.h("Cannot override built-in adapter for ", cls);
            return;
        }
        ArrayList arrayList = this.e;
        if (z) {
            kxd<?> kxdVarB = kxd.b(cls);
            arrayList.add(new vsd(obj, kxdVarB, kxdVarB.d() == kxdVarB.c()));
        }
        if (obj instanceof jud) {
            fvd fvdVar = qvd.a;
            arrayList.add(new fvd(kxd.b(cls), (jud) obj, 2));
        }
    }

    public dh5() {
        this.a = i44.c;
        this.b = xa7.DEFAULT;
        this.c = q;
        this.d = new HashMap();
        this.e = new ArrayList();
        this.f = new ArrayList();
        this.g = false;
        this.h = 2;
        this.i = 2;
        this.j = true;
        this.k = p;
        this.l = true;
        this.m = r;
        this.n = s;
        this.o = new ArrayDeque();
    }
}
