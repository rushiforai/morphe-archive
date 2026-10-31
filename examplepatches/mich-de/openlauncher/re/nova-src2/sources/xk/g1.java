package xk;

import java.util.AbstractMap;

/* loaded from: classes3.dex */
public final class g1 extends v0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ h1 f95919c;

    public g1(h1 h1Var) {
        this.f95919c = h1Var;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        h1 h1Var = this.f95919c;
        return new AbstractMap.SimpleImmutableEntry(h1Var.f95925d.f95934e.f95860g.get(i5), h1Var.f95925d.f95935f.get(i5));
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f95919c.f95925d.f95935f.size();
    }
}
