package xk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class v extends l2 implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final b2 f96028a;

    /* renamed from: b, reason: collision with root package name */
    public final l2 f96029b;

    public v(b2 b2Var, l2 l2Var) {
        this.f96028a = b2Var;
        this.f96029b = l2Var;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        b2 b2Var = this.f96028a;
        return this.f96029b.compare(b2Var.apply(obj), b2Var.apply(obj2));
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return this.f96028a.equals(vVar.f96028a) && this.f96029b.equals(vVar.f96029b);
    }

    public final int hashCode() {
        return ps.v.t(this.f96028a, this.f96029b);
    }

    public final String toString() {
        return this.f96029b + ".onResultOf(" + this.f96028a + ")";
    }
}
