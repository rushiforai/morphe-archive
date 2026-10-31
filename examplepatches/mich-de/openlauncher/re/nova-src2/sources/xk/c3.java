package xk;

import java.io.Serializable;

/* loaded from: classes3.dex */
public final class c3 extends l2 implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final l2 f95887a;

    public c3(l2 l2Var) {
        this.f95887a = l2Var;
    }

    @Override // xk.l2
    public final l2 b() {
        return this.f95887a;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return this.f95887a.compare(obj2, obj);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof c3) {
            return this.f95887a.equals(((c3) obj).f95887a);
        }
        return false;
    }

    public final int hashCode() {
        return -this.f95887a.hashCode();
    }

    public final String toString() {
        return this.f95887a + ".reverse()";
    }
}
