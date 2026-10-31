package kl;

import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class h0 implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f71597a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f71598b;

    public h0(List list, List list2) {
        this.f71597a = list;
        this.f71598b = list2;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new i0(this.f71597a.iterator(), this.f71598b.iterator());
    }
}
