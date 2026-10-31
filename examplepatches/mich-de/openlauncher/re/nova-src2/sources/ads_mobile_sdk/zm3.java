package ads_mobile_sdk;

import ads_mobile_sdk.ym3;
import ads_mobile_sdk.zm3;
import b.f1;
import b.l1;
import b.nd;
import cl.m0;
import cl.r0;
import cl.w0;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class zm3 {

    /* renamed from: a, reason: collision with root package name */
    public final l1 f12591a;

    /* renamed from: b, reason: collision with root package name */
    public final b.l4 f12592b;

    /* renamed from: c, reason: collision with root package name */
    public final b.s4 f12593c;

    /* renamed from: d, reason: collision with root package name */
    public final vi3 f12594d;

    /* renamed from: e, reason: collision with root package name */
    public final b.g7 f12595e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f12596f;

    /* renamed from: g, reason: collision with root package name */
    public final long f12597g;

    /* renamed from: h, reason: collision with root package name */
    public final long f12598h;

    public zm3(l1 l1Var, b.l4 l4Var, b.s4 s4Var, vi3 vi3Var, b.g7 g7Var, boolean z11, long j11, long j12) {
        this.f12591a = l1Var;
        this.f12592b = l4Var;
        this.f12593c = s4Var;
        this.f12594d = vi3Var;
        this.f12595e = g7Var;
        this.f12596f = z11;
        this.f12597g = j11;
        this.f12598h = j12;
    }

    public final r0 a() {
        r0 r0VarR = r0.r(this.f12593c.a());
        b.e eVar = new b.e(1);
        m0 m0Var = m0.f20038a;
        cl.b bVarT = cl.c.t(r0VarR, Throwable.class, eVar, m0Var);
        l1 l1Var = this.f12591a;
        Objects.requireNonNull(l1Var);
        return w0.f(w0.e(bVarT, new f1(l1Var, 3), m0Var), new nd(this, 0), m0Var);
    }

    public final r0 c(final int i5) {
        yk0 yk0Var = yk0.EVENT_ID_PRIMARY_UPDATE_PROGRAM;
        r0 r0VarR = r0.r(this.f12592b.a());
        f1 f1Var = new f1(this, 4);
        m0 m0Var = m0.f20038a;
        cl.b bVarT = cl.c.t(cl.c.t(cl.c.t(w0.e(w0.f(w0.e(r0VarR, f1Var, m0Var), new nd(this, 1), m0Var), new b.e(7), m0Var), wm3.class, new b.e(8), m0Var), xm3.class, new b.e(9), m0Var), vm3.class, new vk.g() { // from class: b.od
            @Override // vk.g
            public final Object apply(Object obj) {
                zm3 zm3Var = this.f15969a;
                if (zm3Var.f12596f) {
                    int i11 = i5;
                    if (i11 < zm3Var.f12597g) {
                        zm3Var.f12595e.a(new ab.k(zm3Var, i11, 1), zm3Var.f12598h * ((long) Math.pow(2.0d, i11)));
                    }
                }
                return ym3.f12216f;
            }
        }, m0Var);
        this.f12594d.a(yk0Var, (r0) bVarT);
        return bVarT;
    }
}
