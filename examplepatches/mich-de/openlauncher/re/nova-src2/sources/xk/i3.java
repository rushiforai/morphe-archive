package xk;

import java.util.Iterator;

/* loaded from: classes3.dex */
public abstract class i3 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f95940a;

    public i3(Iterator it) {
        it.getClass();
        this.f95940a = it;
    }

    public abstract Object a(Object obj);

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f95940a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return a(this.f95940a.next());
    }

    @Override // java.util.Iterator
    public final void remove() {
        this.f95940a.remove();
    }
}
