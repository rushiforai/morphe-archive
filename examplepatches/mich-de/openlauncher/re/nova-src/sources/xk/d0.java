package xk;

import java.io.Serializable;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class d0 extends l2 implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparator f95890a;

    public d0(Comparator comparator) {
        comparator.getClass();
        this.f95890a = comparator;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return this.f95890a.compare(obj, obj2);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof d0) {
            return this.f95890a.equals(((d0) obj).f95890a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f95890a.hashCode();
    }

    public final String toString() {
        return this.f95890a.toString();
    }
}
