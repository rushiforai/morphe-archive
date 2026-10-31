package ai;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class t0 {
    public Long A;
    public long B;
    public String C;
    public int D;
    public int E;
    public long F;
    public String G;
    public byte[] H;
    public int I;
    public long J;
    public long K;
    public long L;
    public long M;
    public long N;
    public long O;
    public long P;
    public String Q;
    public boolean R;
    public long S;
    public long T;

    /* renamed from: a, reason: collision with root package name */
    public final m1 f13310a;

    /* renamed from: b, reason: collision with root package name */
    public final String f13311b;

    /* renamed from: c, reason: collision with root package name */
    public String f13312c;

    /* renamed from: d, reason: collision with root package name */
    public String f13313d;

    /* renamed from: e, reason: collision with root package name */
    public String f13314e;

    /* renamed from: f, reason: collision with root package name */
    public String f13315f;

    /* renamed from: g, reason: collision with root package name */
    public long f13316g;

    /* renamed from: h, reason: collision with root package name */
    public long f13317h;

    /* renamed from: i, reason: collision with root package name */
    public long f13318i;

    /* renamed from: j, reason: collision with root package name */
    public String f13319j;

    /* renamed from: k, reason: collision with root package name */
    public long f13320k;

    /* renamed from: l, reason: collision with root package name */
    public String f13321l;

    /* renamed from: m, reason: collision with root package name */
    public long f13322m;
    public long n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f13323p;

    /* renamed from: q, reason: collision with root package name */
    public Boolean f13324q;

    /* renamed from: r, reason: collision with root package name */
    public long f13325r;

    /* renamed from: s, reason: collision with root package name */
    public ArrayList f13326s;

    /* renamed from: t, reason: collision with root package name */
    public String f13327t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f13328u;

    /* renamed from: v, reason: collision with root package name */
    public long f13329v;

    /* renamed from: w, reason: collision with root package name */
    public long f13330w;

    /* renamed from: x, reason: collision with root package name */
    public int f13331x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f13332y;

    /* renamed from: z, reason: collision with root package name */
    public Long f13333z;

    public t0(m1 m1Var, String str) {
        sg.w.h(m1Var);
        sg.w.e(str);
        this.f13310a = m1Var;
        this.f13311b = str;
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.D();
    }

    public final void A(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13329v != j11;
        this.f13329v = j11;
    }

    public final void B(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13330w != j11;
        this.f13330w = j11;
    }

    public final void C(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.B != j11;
        this.B = j11;
    }

    public final String D() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.C;
    }

    public final String E() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13311b;
    }

    public final String F() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13312c;
    }

    public final void G(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.f13312c, str);
        this.f13312c = str;
    }

    public final String H() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13313d;
    }

    public final void I(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        if (true == TextUtils.isEmpty(str)) {
            str = null;
        }
        this.R |= true ^ Objects.equals(this.f13313d, str);
        this.f13313d = str;
    }

    public final void J(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.f13314e, str);
        this.f13314e = str;
    }

    public final String K() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13315f;
    }

    public final void L(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.f13315f, str);
        this.f13315f = str;
    }

    public final void M(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13317h != j11;
        this.f13317h = j11;
    }

    public final void N(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13318i != j11;
        this.f13318i = j11;
    }

    public final String O() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13319j;
    }

    public final void P(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.f13319j, str);
        this.f13319j = str;
    }

    public final long Q() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13320k;
    }

    public final void R(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13320k != j11;
        this.f13320k = j11;
    }

    public final void S(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.f13321l, str);
        this.f13321l = str;
    }

    public final void T(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13322m != j11;
        this.f13322m = j11;
    }

    public final void a(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.n != j11;
        this.n = j11;
    }

    public final long b() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13325r;
    }

    public final void c(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13325r != j11;
        this.f13325r = j11;
    }

    public final void d(boolean z11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.o != z11;
        this.o = z11;
    }

    public final void e(long j11) {
        sg.w.c(j11 >= 0);
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.f13316g != j11;
        this.f13316g = j11;
    }

    public final void f(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.S != j11;
        this.S = j11;
    }

    public final void g(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.T != j11;
        this.T = j11;
    }

    public final void h(long j11) {
        m1 m1Var = this.f13310a;
        k1 k1Var = m1Var.f13139g;
        o0 o0Var = m1Var.f13138f;
        m1.l(k1Var);
        k1Var.D();
        long j12 = this.f13316g + j11;
        String str = this.f13311b;
        if (j12 > 2147483647L) {
            m1.l(o0Var);
            o0Var.f13193i.b(o0.L(str), "Bundle index overflow. appId");
            j12 = (-1) + j11;
        }
        long j13 = this.F + 1;
        if (j13 > 2147483647L) {
            m1.l(o0Var);
            o0Var.f13193i.b(o0.L(str), "Delivery index overflow. appId");
            j13 = 0;
        }
        this.R = true;
        this.f13316g = j12;
        this.F = j13;
    }

    public final void i(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.K != j11;
        this.K = j11;
    }

    public final void j(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.L != j11;
        this.L = j11;
    }

    public final void k(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.M != j11;
        this.M = j11;
    }

    public final void l(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.N != j11;
        this.N = j11;
    }

    public final void m(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.P != j11;
        this.P = j11;
    }

    public final void n(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.O != j11;
        this.O = j11;
    }

    public final boolean o() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.R;
    }

    public final void p(int i5) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.D != i5;
        this.D = i5;
    }

    public final void q(int i5) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.E != i5;
        this.E = i5;
    }

    public final void r(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.F != j11;
        this.F = j11;
    }

    public final String s() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.G;
    }

    public final int t() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.I;
    }

    public final void u(long j11) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= this.J != j11;
        this.J = j11;
    }

    public final String v() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        String str = this.Q;
        w(null);
        return str;
    }

    public final void w(String str) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        this.R |= !Objects.equals(this.Q, str);
        this.Q = str;
    }

    public final Boolean x() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13324q;
    }

    public final void y(List list) {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        if (Objects.equals(this.f13326s, list)) {
            return;
        }
        this.R = true;
        this.f13326s = list != null ? new ArrayList(list) : null;
    }

    public final boolean z() {
        k1 k1Var = this.f13310a.f13139g;
        m1.l(k1Var);
        k1Var.D();
        return this.f13328u;
    }
}
