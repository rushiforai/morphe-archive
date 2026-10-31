package jv;

/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f70000a;

    /* renamed from: b, reason: collision with root package name */
    public final long f70001b;

    /* renamed from: c, reason: collision with root package name */
    public final h2.c f70002c;

    public d0(long j11, long j12, h2.c cVar) {
        this.f70000a = j11;
        this.f70001b = j12;
        this.f70002c = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        d0 d0Var = (d0) obj;
        return h2.b.b(this.f70000a, d0Var.f70000a) && y3.m.a(this.f70001b, d0Var.f70001b) && this.f70002c.equals(d0Var.f70002c);
    }

    public final int hashCode() {
        return this.f70002c.hashCode() + b.c0.d(Long.hashCode(this.f70000a) * 31, 31, this.f70001b);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("CoordinateSnapshot(positionInWindow=", h2.b.i(this.f70000a), ", size=", y3.m.b(this.f70001b), ", boundsInWindow=");
        sbW.append(this.f70002c);
        sbW.append(")");
        return sbW.toString();
    }
}
