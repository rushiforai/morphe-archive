package g0;

/* loaded from: classes2.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f56741a;

    /* renamed from: b, reason: collision with root package name */
    public final long f56742b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f56743c;

    public w0(long j11, long j12, boolean z11) {
        this.f56741a = j11;
        this.f56742b = j12;
        this.f56743c = z11;
    }

    public final w0 a(w0 w0Var) {
        return new w0(h2.b.g(this.f56741a, w0Var.f56741a), Math.max(this.f56742b, w0Var.f56742b), this.f56743c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w0)) {
            return false;
        }
        w0 w0Var = (w0) obj;
        return h2.b.b(this.f56741a, w0Var.f56741a) && this.f56742b == w0Var.f56742b && this.f56743c == w0Var.f56743c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f56743c) + b.c0.d(Long.hashCode(this.f56741a) * 31, 31, this.f56742b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("MouseWheelScrollDelta(value=");
        sb2.append((Object) h2.b.i(this.f56741a));
        sb2.append(", timeMillis=");
        sb2.append(this.f56742b);
        sb2.append(", shouldApplyImmediately=");
        return a2.c.p(sb2, this.f56743c, ')');
    }
}
