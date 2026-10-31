package u1;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public class a implements Map.Entry, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final Object f90326a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f90327b;

    public a(Object obj, Object obj2) {
        this.f90326a = obj;
        this.f90327b = obj2;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        Map.Entry entry = obj instanceof Map.Entry ? (Map.Entry) obj : null;
        return entry != null && Intrinsics.b(entry.getKey(), this.f90326a) && Intrinsics.b(entry.getValue(), getValue());
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f90326a;
    }

    @Override // java.util.Map.Entry
    public Object getValue() {
        return this.f90327b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f90326a;
        int iHashCode = obj != null ? obj.hashCode() : 0;
        Object value = getValue();
        return (value != null ? value.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public Object setValue(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f90326a);
        sb2.append('=');
        sb2.append(getValue());
        return sb2.toString();
    }
}
