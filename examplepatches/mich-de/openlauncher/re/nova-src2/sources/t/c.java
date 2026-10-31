package t;

import java.util.Map;

/* loaded from: classes.dex */
public final class c implements Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public final Object f87870a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f87871b;

    /* renamed from: c, reason: collision with root package name */
    public c f87872c;

    /* renamed from: d, reason: collision with root package name */
    public c f87873d;

    public c(Object obj, Object obj2) {
        this.f87870a = obj;
        this.f87871b = obj2;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f87870a.equals(cVar.f87870a) && this.f87871b.equals(cVar.f87871b);
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f87870a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f87871b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        return this.f87870a.hashCode() ^ this.f87871b.hashCode();
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        throw new UnsupportedOperationException("An entry modification is not supported");
    }

    public final String toString() {
        return this.f87870a + "=" + this.f87871b;
    }
}
