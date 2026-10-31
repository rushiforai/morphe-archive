package v1;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class c implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public Object f91893a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f91894b;

    /* renamed from: c, reason: collision with root package name */
    public int f91895c;

    public c(Object obj, Map map) {
        this.f91893a = obj;
        this.f91894b = map;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f91895c < this.f91894b.size();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Object obj = this.f91893a;
        this.f91895c++;
        Object obj2 = this.f91894b.get(obj);
        if (obj2 != null) {
            this.f91893a = ((a) obj2).f91888b;
            return obj;
        }
        throw new ConcurrentModificationException("Hash code of an element (" + obj + ") has changed after it was added to the persistent set.");
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
