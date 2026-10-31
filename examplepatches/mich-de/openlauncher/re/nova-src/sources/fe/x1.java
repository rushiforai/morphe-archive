package fe;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class x1 implements e {

    /* renamed from: a, reason: collision with root package name */
    public Object f55075a;

    /* renamed from: b, reason: collision with root package name */
    public Object f55076b;

    /* renamed from: c, reason: collision with root package name */
    public int f55077c;

    /* renamed from: d, reason: collision with root package name */
    public long f55078d;

    /* renamed from: e, reason: collision with root package name */
    public long f55079e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f55080f;

    /* renamed from: g, reason: collision with root package name */
    public hf.b f55081g = hf.b.f59845f;

    public final long a(int i5, int i11) {
        hf.a aVarA = this.f55081g.a(i5);
        if (aVarA.f59838b != -1) {
            return aVarA.f59842f[i11];
        }
        return -9223372036854775807L;
    }

    public final int b(long j11) {
        hf.a aVarA;
        int i5;
        hf.b bVar = this.f55081g;
        long j12 = this.f55078d;
        int i11 = bVar.f59848a;
        if (j11 != Long.MIN_VALUE && (j12 == -9223372036854775807L || j11 < j12)) {
            int i12 = bVar.f59851d;
            while (i12 < i11 && ((bVar.a(i12).f59837a != Long.MIN_VALUE && bVar.a(i12).f59837a <= j11) || ((i5 = (aVarA = bVar.a(i12)).f59838b) != -1 && aVarA.a(-1) >= i5))) {
                i12++;
            }
            if (i12 < i11) {
                return i12;
            }
        }
        return -1;
    }

    public final int c(long j11) {
        hf.b bVar = this.f55081g;
        long j12 = this.f55078d;
        int i5 = bVar.f59848a - 1;
        while (i5 >= 0 && j11 != Long.MIN_VALUE) {
            long j13 = bVar.a(i5).f59837a;
            if (j13 != Long.MIN_VALUE) {
                if (j11 >= j13) {
                    break;
                }
                i5--;
            } else {
                if (j12 != -9223372036854775807L && j11 >= j12) {
                    break;
                }
                i5--;
            }
        }
        if (i5 >= 0) {
            hf.a aVarA = bVar.a(i5);
            int i11 = aVarA.f59838b;
            if (i11 != -1) {
                for (int i12 = 0; i12 < i11; i12++) {
                    int i13 = aVarA.f59841e[i12];
                    if (i13 != 0 && i13 != 1) {
                    }
                }
            }
            return i5;
        }
        return -1;
    }

    public final long d(int i5) {
        return this.f55081g.a(i5).f59837a;
    }

    public final int e(int i5, int i11) {
        hf.a aVarA = this.f55081g.a(i5);
        if (aVarA.f59838b != -1) {
            return aVarA.f59841e[i11];
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && x1.class.equals(obj.getClass())) {
            x1 x1Var = (x1) obj;
            if (wf.v.a(this.f55075a, x1Var.f55075a) && wf.v.a(this.f55076b, x1Var.f55076b) && this.f55077c == x1Var.f55077c && this.f55078d == x1Var.f55078d && this.f55079e == x1Var.f55079e && this.f55080f == x1Var.f55080f && wf.v.a(this.f55081g, x1Var.f55081g)) {
                return true;
            }
        }
        return false;
    }

    public final int f(int i5) {
        return this.f55081g.a(i5).a(-1);
    }

    public final boolean g(int i5) {
        return this.f55081g.a(i5).f59844h;
    }

    public final void h(Object obj, Object obj2, int i5, long j11, long j12, hf.b bVar, boolean z11) {
        this.f55075a = obj;
        this.f55076b = obj2;
        this.f55077c = i5;
        this.f55078d = j11;
        this.f55079e = j12;
        this.f55081g = bVar;
        this.f55080f = z11;
    }

    public final int hashCode() {
        Object obj = this.f55075a;
        int iHashCode = (Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE + (obj == null ? 0 : obj.hashCode())) * 31;
        Object obj2 = this.f55076b;
        int iHashCode2 = (((iHashCode + (obj2 != null ? obj2.hashCode() : 0)) * 31) + this.f55077c) * 31;
        long j11 = this.f55078d;
        int i5 = (iHashCode2 + ((int) (j11 ^ (j11 >>> 32)))) * 31;
        long j12 = this.f55079e;
        return this.f55081g.hashCode() + ((((i5 + ((int) (j12 ^ (j12 >>> 32)))) * 31) + (this.f55080f ? 1 : 0)) * 31);
    }
}
