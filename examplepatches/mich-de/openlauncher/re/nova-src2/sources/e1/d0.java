package e1;

/* loaded from: classes2.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final t0.j0 f51275a;

    /* renamed from: b, reason: collision with root package name */
    public final long f51276b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f51277c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f51278d;

    public d0(t0.j0 j0Var, long j11, c0 c0Var, boolean z11) {
        this.f51275a = j0Var;
        this.f51276b = j11;
        this.f51277c = c0Var;
        this.f51278d = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        d0 d0Var = (d0) obj;
        return this.f51275a == d0Var.f51275a && h2.b.b(this.f51276b, d0Var.f51276b) && this.f51277c == d0Var.f51277c && this.f51278d == d0Var.f51278d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f51278d) + ((this.f51277c.hashCode() + b.c0.d(this.f51275a.hashCode() * 31, 31, this.f51276b)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SelectionHandleInfo(handle=");
        sb2.append(this.f51275a);
        sb2.append(", position=");
        sb2.append((Object) h2.b.i(this.f51276b));
        sb2.append(", anchor=");
        sb2.append(this.f51277c);
        sb2.append(", visible=");
        return a2.c.p(sb2, this.f51278d, ')');
    }
}
