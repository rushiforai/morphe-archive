package kotlin.collections;

import java.util.Enumeration;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/collections/CollectionsKt__IteratorsJVMKt$iterator$1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CollectionsKt__IteratorsJVMKt$iterator$1 implements Iterator<Object>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Enumeration f71730a;

    public CollectionsKt__IteratorsJVMKt$iterator$1(Enumeration enumeration) {
        this.f71730a = enumeration;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71730a.hasMoreElements();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return this.f71730a.nextElement();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
