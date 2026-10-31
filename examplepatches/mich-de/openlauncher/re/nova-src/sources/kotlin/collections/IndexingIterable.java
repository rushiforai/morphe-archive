package kotlin.collections;

import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Lkotlin/collections/IndexingIterable;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/collections/IndexedValue;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IndexingIterable<T> implements Iterable<IndexedValue<? extends T>>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f71737a;

    public IndexingIterable(Function0 function0) {
        this.f71737a = function0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new IndexingIterator((Iterator) this.f71737a.invoke());
    }
}
