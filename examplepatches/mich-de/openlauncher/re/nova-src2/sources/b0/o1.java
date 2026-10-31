package b0;

/* loaded from: classes.dex */
public final class o1 {

    /* renamed from: a, reason: collision with root package name */
    public final c0.e f16198a;

    /* renamed from: b, reason: collision with root package name */
    public long f16199b;

    public o1(c0.e eVar, long j11) {
        this.f16198a = eVar;
        this.f16199b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o1)) {
            return false;
        }
        o1 o1Var = (o1) obj;
        return this.f16198a.equals(o1Var.f16198a) && y3.m.a(this.f16199b, o1Var.f16199b);
    }

    public final int hashCode() {
        return Long.hashCode(this.f16199b) + (this.f16198a.hashCode() * 31);
    }

    public final String toString() {
        return "AnimData(anim=" + this.f16198a + ", startSize=" + ((Object) y3.m.b(this.f16199b)) + ')';
    }
}
