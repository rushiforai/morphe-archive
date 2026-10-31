package mh;

import java.io.Serializable;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class e extends t implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparator f76328a;

    public e(Comparator comparator) {
        comparator.getClass();
        this.f76328a = comparator;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return this.f76328a.compare(obj, obj2);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof e) {
            return this.f76328a.equals(((e) obj).f76328a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f76328a.hashCode();
    }

    public final String toString() {
        return this.f76328a.toString();
    }
}
