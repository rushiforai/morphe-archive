package androidx.datastore.preferences.protobuf;

import java.util.Map;

/* loaded from: classes2.dex */
public final class c1 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f14300a;

    /* renamed from: b, reason: collision with root package name */
    public Object f14301b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b1 f14302c;

    public c1(b1 b1Var, Map.Entry entry) {
        this(b1Var, (Comparable) entry.getKey(), entry.getValue());
    }

    public final Comparable a() {
        return this.f14300a;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f14300a.compareTo(((c1) obj).f14300a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Comparable comparable = this.f14300a;
                if (comparable == null ? key == null : comparable.equals(key)) {
                    Object obj2 = this.f14301b;
                    Object value = entry.getValue();
                    if (obj2 == null ? value == null : obj2.equals(value)) {
                    }
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f14300a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f14301b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f14300a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f14301b;
        return (obj != null ? obj.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f14302c.b();
        Object obj2 = this.f14301b;
        this.f14301b = obj;
        return obj2;
    }

    public final String toString() {
        return this.f14300a + "=" + this.f14301b;
    }

    public c1(b1 b1Var, Comparable comparable, Object obj) {
        this.f14302c = b1Var;
        this.f14300a = comparable;
        this.f14301b = obj;
    }
}
