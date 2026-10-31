package kl;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class i0 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f71600a;

    /* renamed from: b, reason: collision with root package name */
    public final Iterator f71601b;

    public i0(Iterator it, Iterator it2) {
        this.f71600a = it;
        this.f71601b = it2;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71600a.hasNext() || this.f71601b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        Iterator it = this.f71600a;
        return it.hasNext() ? it.next() : this.f71601b.next();
    }
}
