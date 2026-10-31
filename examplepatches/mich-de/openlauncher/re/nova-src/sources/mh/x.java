package mh;

import java.io.Serializable;

/* loaded from: classes3.dex */
public final class x extends t implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final t f76398a;

    public x(t tVar) {
        this.f76398a = tVar;
    }

    @Override // mh.t
    public final t a() {
        return this.f76398a;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return this.f76398a.compare(obj2, obj);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof x) {
            return this.f76398a.equals(((x) obj).f76398a);
        }
        return false;
    }

    public final int hashCode() {
        return -this.f76398a.hashCode();
    }

    public final String toString() {
        return this.f76398a.toString().concat(".reverse()");
    }
}
