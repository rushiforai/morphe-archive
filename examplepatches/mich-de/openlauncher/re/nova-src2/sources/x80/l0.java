package x80;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public h0 f95522a;

    /* renamed from: b, reason: collision with root package name */
    public f0 f95523b;

    /* renamed from: d, reason: collision with root package name */
    public String f95525d;

    /* renamed from: e, reason: collision with root package name */
    public t f95526e;

    /* renamed from: g, reason: collision with root package name */
    public p0 f95528g;

    /* renamed from: h, reason: collision with root package name */
    public m0 f95529h;

    /* renamed from: i, reason: collision with root package name */
    public m0 f95530i;

    /* renamed from: j, reason: collision with root package name */
    public m0 f95531j;

    /* renamed from: k, reason: collision with root package name */
    public long f95532k;

    /* renamed from: l, reason: collision with root package name */
    public long f95533l;

    /* renamed from: m, reason: collision with root package name */
    public b90.e f95534m;

    /* renamed from: c, reason: collision with root package name */
    public int f95524c = -1;

    /* renamed from: f, reason: collision with root package name */
    public o2.h f95527f = new o2.h(1);

    public static void b(m0 m0Var, String str) {
        if (m0Var != null) {
            if (m0Var.f95559g != null) {
                throw new IllegalArgumentException(str.concat(".body != null").toString());
            }
            if (m0Var.f95560h != null) {
                throw new IllegalArgumentException(str.concat(".networkResponse != null").toString());
            }
            if (m0Var.f95561i != null) {
                throw new IllegalArgumentException(str.concat(".cacheResponse != null").toString());
            }
            if (m0Var.f95562j != null) {
                throw new IllegalArgumentException(str.concat(".priorResponse != null").toString());
            }
        }
    }

    public final m0 a() {
        int i5 = this.f95524c;
        if (i5 < 0) {
            throw new IllegalStateException(("code < 0: " + this.f95524c).toString());
        }
        h0 h0Var = this.f95522a;
        if (h0Var == null) {
            throw new IllegalStateException("request == null");
        }
        f0 f0Var = this.f95523b;
        if (f0Var == null) {
            throw new IllegalStateException("protocol == null");
        }
        String str = this.f95525d;
        if (str != null) {
            return new m0(h0Var, f0Var, str, i5, this.f95526e, this.f95527f.f(), this.f95528g, this.f95529h, this.f95530i, this.f95531j, this.f95532k, this.f95533l, this.f95534m);
        }
        throw new IllegalStateException("message == null");
    }

    public final void c(u headers) {
        Intrinsics.g(headers, "headers");
        this.f95527f = headers.d();
    }
}
