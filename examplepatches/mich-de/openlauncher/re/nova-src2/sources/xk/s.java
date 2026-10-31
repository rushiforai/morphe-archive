package xk;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class s extends g3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t f96010a;

    public s(t tVar) {
        this.f96010a = tVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        ((n0) this.f96010a).clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof e2) {
            j2 j2Var = (j2) ((e2) obj);
            if (j2Var.a() <= 0) {
                return false;
            }
            if (((n0) this.f96010a).f95973c.a(j2Var.b()) == j2Var.a()) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new p((n0) this.f96010a);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        if (obj instanceof e2) {
            j2 j2Var = (j2) ((e2) obj);
            Object objB = j2Var.b();
            int iA = j2Var.a();
            if (iA != 0) {
                n0 n0Var = (n0) this.f96010a;
                w20.e.e(iA, "oldCount");
                w20.e.e(0, "newCount");
                k2 k2Var = n0Var.f95973c;
                int iC = k2Var.c(objB);
                if (iC == -1) {
                    if (iA == 0) {
                        return true;
                    }
                } else if (k2Var.b(iC) == iA) {
                    k2Var.f(iC);
                    n0Var.f95974d -= iA;
                    return true;
                }
            }
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return ((n0) this.f96010a).f95973c.f95954c;
    }
}
