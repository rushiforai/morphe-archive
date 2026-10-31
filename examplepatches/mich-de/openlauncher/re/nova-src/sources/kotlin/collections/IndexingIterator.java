package kotlin.collections;

import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Lkotlin/collections/IndexingIterator;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/collections/IndexedValue;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IndexingIterator<T> implements Iterator<IndexedValue<? extends T>>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f71738a;

    /* renamed from: b, reason: collision with root package name */
    public int f71739b;

    public IndexingIterator(Iterator iterator) {
        Intrinsics.g(iterator, "iterator");
        this.f71738a = iterator;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71738a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f71739b;
        this.f71739b = i5 + 1;
        if (i5 >= 0) {
            return new IndexedValue(i5, this.f71738a.next());
        }
        ul.b.e0();
        throw null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
