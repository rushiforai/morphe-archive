package mh;

import java.util.AbstractMap;

/* loaded from: classes3.dex */
public final class m extends j {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ n f76357c;

    public m(n nVar) {
        this.f76357c = nVar;
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object get(int i5) {
        n nVar = this.f76357c;
        return new AbstractMap.SimpleImmutableEntry(nVar.f76360d.f76363c.f76397f.get(i5), nVar.f76360d.f76364d.get(i5));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f76357c.f76360d.f76364d.size();
    }
}
