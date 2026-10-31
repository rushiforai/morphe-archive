package s50;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes.dex */
public final class f implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f86682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f86683b;

    public f(g gVar) {
        this.f86683b = gVar;
        this.f86682a = gVar.f86684a.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f86682a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return this.f86683b.f86685b.invoke(this.f86682a.next());
    }

    @Override // java.util.Iterator
    public final void remove() {
        this.f86682a.remove();
    }
}
