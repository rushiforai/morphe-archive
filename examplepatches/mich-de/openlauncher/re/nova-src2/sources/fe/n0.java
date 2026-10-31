package fe;

/* loaded from: classes3.dex */
public abstract class n0 implements e {

    /* renamed from: f, reason: collision with root package name */
    public static final ep.c f54930f;

    /* renamed from: a, reason: collision with root package name */
    public final long f54931a;

    /* renamed from: b, reason: collision with root package name */
    public final long f54932b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f54933c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f54934d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f54935e;

    static {
        new m0().a();
        f54930f = new ep.c(9);
    }

    public n0(m0 m0Var) {
        this.f54931a = m0Var.f54925a;
        this.f54932b = m0Var.f54926b;
        this.f54933c = m0Var.f54927c;
        this.f54934d = m0Var.f54928d;
        this.f54935e = m0Var.f54929e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n0)) {
            return false;
        }
        n0 n0Var = (n0) obj;
        return this.f54931a == n0Var.f54931a && this.f54932b == n0Var.f54932b && this.f54933c == n0Var.f54933c && this.f54934d == n0Var.f54934d && this.f54935e == n0Var.f54935e;
    }

    public final int hashCode() {
        long j11 = this.f54931a;
        int i5 = ((int) (j11 ^ (j11 >>> 32))) * 31;
        long j12 = this.f54932b;
        return ((((((i5 + ((int) ((j12 >>> 32) ^ j12))) * 31) + (this.f54933c ? 1 : 0)) * 31) + (this.f54934d ? 1 : 0)) * 31) + (this.f54935e ? 1 : 0);
    }
}
