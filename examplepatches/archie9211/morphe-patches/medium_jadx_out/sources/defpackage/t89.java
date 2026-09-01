package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t89 extends l2 implements Set, Collection, th6 {
    public static final t89 d;
    public final Object a;
    public final Object b;
    public final k89 c;

    static {
        fa4 fa4Var = fa4.j;
        d = new t89(fa4Var, fa4Var, k89.c);
    }

    public t89(Object obj, Object obj2, k89 k89Var) {
        this.a = obj;
        this.b = obj2;
        this.c = k89Var;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.c.containsKey(obj);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c.b;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new u75(this.a, this.c);
    }
}
