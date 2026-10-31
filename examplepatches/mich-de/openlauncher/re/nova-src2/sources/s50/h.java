package s50;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes.dex */
public final class h implements Map.Entry, KMutableMap.Entry {

    /* renamed from: a, reason: collision with root package name */
    public final Object f86688a;

    /* renamed from: b, reason: collision with root package name */
    public Object f86689b;

    public h(Object obj, Object obj2) {
        this.f86688a = obj;
        this.f86689b = obj2;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != null && (obj instanceof Map.Entry)) {
            Map.Entry entry = (Map.Entry) obj;
            if (Intrinsics.b(entry.getKey(), this.f86688a) && Intrinsics.b(entry.getValue(), this.f86689b)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f86688a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f86689b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f86688a;
        Intrinsics.d(obj);
        int iHashCode = obj.hashCode() + 527;
        Object obj2 = this.f86689b;
        Intrinsics.d(obj2);
        return obj2.hashCode() + iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f86689b = obj;
        return obj;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f86688a);
        sb2.append('=');
        sb2.append(this.f86689b);
        return sb2.toString();
    }
}
