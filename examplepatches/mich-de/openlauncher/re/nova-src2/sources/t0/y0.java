package t0;

import c3.c3;
import kotlin.jvm.functions.Function1;
import p1.s2;

/* loaded from: classes.dex */
public final class y0 {
    public final p1.e1 A;
    public final p1.e1 B;

    /* renamed from: a, reason: collision with root package name */
    public f1 f88279a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.t1 f88280b;

    /* renamed from: c, reason: collision with root package name */
    public final c3 f88281c;

    /* renamed from: d, reason: collision with root package name */
    public final r3.i f88282d;

    /* renamed from: e, reason: collision with root package name */
    public r3.e0 f88283e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f88284f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f88285g;

    /* renamed from: h, reason: collision with root package name */
    public z2.y f88286h;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f88287i;

    /* renamed from: j, reason: collision with root package name */
    public m3.g f88288j;

    /* renamed from: k, reason: collision with root package name */
    public final p1.e1 f88289k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f88290l;

    /* renamed from: m, reason: collision with root package name */
    public final p1.e1 f88291m;
    public final p1.e1 n;
    public final p1.e1 o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f88292p;

    /* renamed from: q, reason: collision with root package name */
    public final p1.e1 f88293q;

    /* renamed from: r, reason: collision with root package name */
    public final u0 f88294r;

    /* renamed from: s, reason: collision with root package name */
    public final p1.e1 f88295s;

    /* renamed from: t, reason: collision with root package name */
    public final p1.e1 f88296t;

    /* renamed from: u, reason: collision with root package name */
    public Function1 f88297u;

    /* renamed from: v, reason: collision with root package name */
    public final x0 f88298v;

    /* renamed from: w, reason: collision with root package name */
    public final x0 f88299w;

    /* renamed from: x, reason: collision with root package name */
    public final x0 f88300x;

    /* renamed from: y, reason: collision with root package name */
    public final aa.m0 f88301y;

    /* renamed from: z, reason: collision with root package name */
    public long f88302z;

    public y0(f1 f1Var, p1.t1 t1Var, c3 c3Var) {
        this.f88279a = f1Var;
        this.f88280b = t1Var;
        this.f88281c = c3Var;
        r3.i iVar = new r3.i();
        m3.g gVar = m3.h.f75897a;
        long j11 = m3.o0.f75944b;
        r3.z zVar = new r3.z(gVar, j11, (m3.o0) null);
        iVar.f85444a = zVar;
        iVar.f85445b = new r3.j(gVar, zVar.f85472b);
        this.f88282d = iVar;
        Boolean bool = Boolean.FALSE;
        this.f88284f = androidx.compose.runtime.d.k(bool);
        this.f88285g = androidx.compose.runtime.d.k(new y3.f(0));
        this.f88287i = androidx.compose.runtime.d.k(null);
        this.f88289k = androidx.compose.runtime.d.k(k0.f88058a);
        this.f88290l = androidx.compose.runtime.d.k(bool);
        this.f88291m = androidx.compose.runtime.d.k(bool);
        this.n = androidx.compose.runtime.d.k(bool);
        this.o = androidx.compose.runtime.d.k(bool);
        this.f88292p = true;
        this.f88293q = androidx.compose.runtime.d.k(Boolean.TRUE);
        this.f88294r = new u0(c3Var);
        this.f88295s = androidx.compose.runtime.d.k(bool);
        this.f88296t = androidx.compose.runtime.d.k(bool);
        this.f88297u = new q20.c(28);
        this.f88298v = new x0(this, 0);
        this.f88299w = new x0(this, 1);
        this.f88300x = new x0(this, 2);
        this.f88301y = i2.r0.e();
        this.f88302z = i2.s.f61147m;
        this.A = androidx.compose.runtime.d.k(new m3.o0(j11));
        this.B = androidx.compose.runtime.d.k(new m3.o0(j11));
    }

    public final k0 a() {
        return (k0) ((s2) this.f88289k).getValue();
    }

    public final boolean b() {
        return ((Boolean) ((s2) this.f88284f).getValue()).booleanValue();
    }

    public final z2.y c() {
        z2.y yVar = this.f88286h;
        if (yVar == null || !yVar.isAttached()) {
            return null;
        }
        return yVar;
    }

    public final w1 d() {
        return (w1) ((s2) this.f88287i).getValue();
    }

    public final void e(long j11) {
        ((s2) this.B).setValue(new m3.o0(j11));
    }

    public final void f(long j11) {
        ((s2) this.A).setValue(new m3.o0(j11));
    }
}
