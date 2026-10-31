package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class em3 implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Iterator f2925a;

    public em3(Iterator delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f2925a = delegate;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f2925a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return this.f2925a.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
