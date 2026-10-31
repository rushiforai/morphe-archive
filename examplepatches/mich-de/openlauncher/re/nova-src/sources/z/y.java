package z;

import java.util.Map;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class y implements Map.Entry, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final Object f97864a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f97865b;

    public y(Object obj, Object obj2) {
        this.f97864a = obj;
        this.f97865b = obj2;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f97864a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f97865b;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
