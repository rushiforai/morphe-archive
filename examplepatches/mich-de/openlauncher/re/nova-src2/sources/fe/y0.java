package fe;

/* loaded from: classes3.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public final gf.w f55086a;

    /* renamed from: b, reason: collision with root package name */
    public final long f55087b;

    /* renamed from: c, reason: collision with root package name */
    public final long f55088c;

    /* renamed from: d, reason: collision with root package name */
    public final long f55089d;

    /* renamed from: e, reason: collision with root package name */
    public final long f55090e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f55091f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f55092g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f55093h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f55094i;

    public y0(gf.w wVar, long j11, long j12, long j13, long j14, boolean z11, boolean z12, boolean z13, boolean z14) {
        boolean z15 = true;
        wf.a.e(!z14 || z12);
        wf.a.e(!z13 || z12);
        if (z11 && (z12 || z13 || z14)) {
            z15 = false;
        }
        wf.a.e(z15);
        this.f55086a = wVar;
        this.f55087b = j11;
        this.f55088c = j12;
        this.f55089d = j13;
        this.f55090e = j14;
        this.f55091f = z11;
        this.f55092g = z12;
        this.f55093h = z13;
        this.f55094i = z14;
    }

    public final y0 a(long j11) {
        if (j11 == this.f55088c) {
            return this;
        }
        return new y0(this.f55086a, this.f55087b, j11, this.f55089d, this.f55090e, this.f55091f, this.f55092g, this.f55093h, this.f55094i);
    }

    public final y0 b(long j11) {
        if (j11 == this.f55087b) {
            return this;
        }
        return new y0(this.f55086a, j11, this.f55088c, this.f55089d, this.f55090e, this.f55091f, this.f55092g, this.f55093h, this.f55094i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && y0.class == obj.getClass()) {
            y0 y0Var = (y0) obj;
            if (this.f55087b == y0Var.f55087b && this.f55088c == y0Var.f55088c && this.f55089d == y0Var.f55089d && this.f55090e == y0Var.f55090e && this.f55091f == y0Var.f55091f && this.f55092g == y0Var.f55092g && this.f55093h == y0Var.f55093h && this.f55094i == y0Var.f55094i && wf.v.a(this.f55086a, y0Var.f55086a)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((((((((((((((this.f55086a.hashCode() + 527) * 31) + ((int) this.f55087b)) * 31) + ((int) this.f55088c)) * 31) + ((int) this.f55089d)) * 31) + ((int) this.f55090e)) * 31) + (this.f55091f ? 1 : 0)) * 31) + (this.f55092g ? 1 : 0)) * 31) + (this.f55093h ? 1 : 0)) * 31) + (this.f55094i ? 1 : 0);
    }
}
