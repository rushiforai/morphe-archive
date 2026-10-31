package kotlin.collections;

import java.util.Iterator;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/collections/AbstractMap$keys$1$iterator$1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AbstractMap$keys$1$iterator$1 implements Iterator<Object>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Iterator f71717a;

    public AbstractMap$keys$1$iterator$1(Iterator it) {
        this.f71717a = it;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71717a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return ((Map.Entry) this.f71717a.next()).getKey();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
