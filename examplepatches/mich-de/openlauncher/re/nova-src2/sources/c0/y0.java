package c0;

/* loaded from: classes2.dex */
public final class y0 implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public final h2 f19011a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f19012b;

    /* renamed from: c, reason: collision with root package name */
    public final long f19013c;

    public y0(h2 h2Var, x0 x0Var, long j11) {
        this.f19011a = h2Var;
        this.f19012b = x0Var;
        this.f19013c = j11;
    }

    @Override // c0.m
    public final j2 a(i2 i2Var) {
        return new p2(this.f19011a.a(i2Var), this.f19012b, this.f19013c);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y0) {
            y0 y0Var = (y0) obj;
            if (y0Var.f19011a.equals(this.f19011a) && y0Var.f19012b == this.f19012b && y0Var.f19013c == this.f19013c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f19013c) + ((this.f19012b.hashCode() + ((this.f19011a.hashCode() + 155) * 31)) * 31);
    }
}
