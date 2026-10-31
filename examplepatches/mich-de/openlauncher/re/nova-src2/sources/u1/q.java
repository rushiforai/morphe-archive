package u1;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public abstract class q implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public Object[] f90358a = p.f90353e.f90357d;

    /* renamed from: b, reason: collision with root package name */
    public int f90359b;

    /* renamed from: c, reason: collision with root package name */
    public int f90360c;

    public final void a(Object[] objArr, int i5, int i11) {
        this.f90358a = objArr;
        this.f90359b = i5;
        this.f90360c = i11;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f90360c < this.f90359b;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
