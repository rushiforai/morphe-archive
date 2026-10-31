package fe;

import android.net.Uri;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Collections;
import java.util.List;
import xk.r2;

/* loaded from: classes3.dex */
public final class y1 implements e {

    /* renamed from: q, reason: collision with root package name */
    public static final Object f55095q = new Object();

    /* renamed from: r, reason: collision with root package name */
    public static final Object f55096r = new Object();

    /* renamed from: s, reason: collision with root package name */
    public static final u0 f55097s;

    /* renamed from: b, reason: collision with root package name */
    public Object f55099b;

    /* renamed from: d, reason: collision with root package name */
    public long f55101d;

    /* renamed from: e, reason: collision with root package name */
    public long f55102e;

    /* renamed from: f, reason: collision with root package name */
    public long f55103f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f55104g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f55105h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f55106i;

    /* renamed from: j, reason: collision with root package name */
    public q0 f55107j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f55108k;

    /* renamed from: l, reason: collision with root package name */
    public long f55109l;

    /* renamed from: m, reason: collision with root package name */
    public long f55110m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public long f55111p;

    /* renamed from: a, reason: collision with root package name */
    public Object f55098a = f55095q;

    /* renamed from: c, reason: collision with root package name */
    public u0 f55100c = f55097s;

    static {
        m0 m0Var = new m0();
        xk.l0 l0Var = xk.v0.f96030b;
        r2 r2Var = r2.f96007e;
        List list = Collections.EMPTY_LIST;
        r2 r2Var2 = r2.f96007e;
        s0 s0Var = s0.f54981c;
        Uri uri = Uri.EMPTY;
        f55097s = new u0("com.google.android.exoplayer2.Timeline", new o0(m0Var), uri != null ? new r0(uri, null, list, r2Var2) : null, new q0(-9223372036854775807L, -9223372036854775807L, -9223372036854775807L, -3.4028235E38f, -3.4028235E38f), w0.G, s0Var);
    }

    public final boolean a() {
        wf.a.i(this.f55106i == (this.f55107j != null));
        return this.f55107j != null;
    }

    public final void b(Object obj, u0 u0Var, long j11, long j12, long j13, boolean z11, boolean z12, q0 q0Var, long j14, long j15, int i5, int i11, long j16) {
        this.f55098a = obj;
        this.f55100c = u0Var != null ? u0Var : f55097s;
        if (u0Var != null) {
            r0 r0Var = u0Var.f54994b;
        }
        this.f55099b = null;
        this.f55101d = j11;
        this.f55102e = j12;
        this.f55103f = j13;
        this.f55104g = z11;
        this.f55105h = z12;
        this.f55106i = q0Var != null;
        this.f55107j = q0Var;
        this.f55109l = j14;
        this.f55110m = j15;
        this.n = i5;
        this.o = i11;
        this.f55111p = j16;
        this.f55108k = false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !y1.class.equals(obj.getClass())) {
            return false;
        }
        y1 y1Var = (y1) obj;
        return wf.v.a(this.f55098a, y1Var.f55098a) && wf.v.a(this.f55100c, y1Var.f55100c) && wf.v.a(this.f55107j, y1Var.f55107j) && this.f55101d == y1Var.f55101d && this.f55102e == y1Var.f55102e && this.f55103f == y1Var.f55103f && this.f55104g == y1Var.f55104g && this.f55105h == y1Var.f55105h && this.f55108k == y1Var.f55108k && this.f55109l == y1Var.f55109l && this.f55110m == y1Var.f55110m && this.n == y1Var.n && this.o == y1Var.o && this.f55111p == y1Var.f55111p;
    }

    public final int hashCode() {
        int iHashCode = (this.f55100c.hashCode() + ((this.f55098a.hashCode() + Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE) * 31)) * 961;
        q0 q0Var = this.f55107j;
        int iHashCode2 = q0Var == null ? 0 : q0Var.hashCode();
        long j11 = this.f55101d;
        int i5 = (((iHashCode + iHashCode2) * 31) + ((int) (j11 ^ (j11 >>> 32)))) * 31;
        long j12 = this.f55102e;
        int i11 = (i5 + ((int) (j12 ^ (j12 >>> 32)))) * 31;
        long j13 = this.f55103f;
        int i12 = (((((((i11 + ((int) (j13 ^ (j13 >>> 32)))) * 31) + (this.f55104g ? 1 : 0)) * 31) + (this.f55105h ? 1 : 0)) * 31) + (this.f55108k ? 1 : 0)) * 31;
        long j14 = this.f55109l;
        int i13 = (i12 + ((int) (j14 ^ (j14 >>> 32)))) * 31;
        long j15 = this.f55110m;
        int i14 = (((((i13 + ((int) (j15 ^ (j15 >>> 32)))) * 31) + this.n) * 31) + this.o) * 31;
        long j16 = this.f55111p;
        return i14 + ((int) (j16 ^ (j16 >>> 32)));
    }
}
