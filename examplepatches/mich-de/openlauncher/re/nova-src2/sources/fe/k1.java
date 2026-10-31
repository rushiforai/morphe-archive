package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class k1 implements e {

    /* renamed from: a, reason: collision with root package name */
    public final Object f54896a;

    /* renamed from: b, reason: collision with root package name */
    public final int f54897b;

    /* renamed from: c, reason: collision with root package name */
    public final u0 f54898c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f54899d;

    /* renamed from: e, reason: collision with root package name */
    public final int f54900e;

    /* renamed from: f, reason: collision with root package name */
    public final long f54901f;

    /* renamed from: g, reason: collision with root package name */
    public final long f54902g;

    /* renamed from: h, reason: collision with root package name */
    public final int f54903h;

    /* renamed from: i, reason: collision with root package name */
    public final int f54904i;

    public k1(Object obj, int i5, u0 u0Var, Object obj2, int i11, long j11, long j12, int i12, int i13) {
        this.f54896a = obj;
        this.f54897b = i5;
        this.f54898c = u0Var;
        this.f54899d = obj2;
        this.f54900e = i11;
        this.f54901f = j11;
        this.f54902g = j12;
        this.f54903h = i12;
        this.f54904i = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && k1.class == obj.getClass()) {
            k1 k1Var = (k1) obj;
            if (this.f54897b == k1Var.f54897b && this.f54900e == k1Var.f54900e && this.f54901f == k1Var.f54901f && this.f54902g == k1Var.f54902g && this.f54903h == k1Var.f54903h && this.f54904i == k1Var.f54904i && ps.v.q(this.f54896a, k1Var.f54896a) && ps.v.q(this.f54899d, k1Var.f54899d) && ps.v.q(this.f54898c, k1Var.f54898c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f54896a, Integer.valueOf(this.f54897b), this.f54898c, this.f54899d, Integer.valueOf(this.f54900e), Long.valueOf(this.f54901f), Long.valueOf(this.f54902g), Integer.valueOf(this.f54903h), Integer.valueOf(this.f54904i)});
    }
}
