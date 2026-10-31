package xk;

import java.util.Map;

/* loaded from: classes3.dex */
public final class h1 extends d1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i1 f95925d;

    public h1(i1 i1Var) {
        this.f95925d = i1Var;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f95925d.get(entry.getKey());
            if (obj2 != null && obj2.equals(entry.getValue())) {
                return true;
            }
        }
        return false;
    }

    @Override // xk.q0
    public final boolean h() {
        return this.f95925d.h();
    }

    @Override // xk.d1, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f95925d.hashCode();
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return c().listIterator(0);
    }

    @Override // xk.d1
    public final v0 p() {
        return new g1(this);
    }

    @Override // xk.d1
    public final boolean q() {
        this.f95925d.getClass();
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f95925d.f95935f.size();
    }
}
