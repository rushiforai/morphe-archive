package f1;

/* loaded from: classes2.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public final p1.e1 f53967a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f53968b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f53969c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f53970d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f53971e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f53972f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f53973g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.e1 f53974h;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f53975i;

    /* renamed from: j, reason: collision with root package name */
    public final p1.e1 f53976j;

    /* renamed from: k, reason: collision with root package name */
    public final p1.e1 f53977k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f53978l;

    /* renamed from: m, reason: collision with root package name */
    public final p1.e1 f53979m;

    public t0(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22, long j23, boolean z11) {
        i2.s sVar = new i2.s(j11);
        p1.g1 g1Var = p1.g1.f81425e;
        this.f53967a = androidx.compose.runtime.d.j(sVar, g1Var);
        this.f53968b = androidx.compose.runtime.d.j(new i2.s(j12), g1Var);
        this.f53969c = androidx.compose.runtime.d.j(new i2.s(j13), g1Var);
        this.f53970d = androidx.compose.runtime.d.j(new i2.s(j14), g1Var);
        this.f53971e = androidx.compose.runtime.d.j(new i2.s(j15), g1Var);
        this.f53972f = androidx.compose.runtime.d.j(new i2.s(j16), g1Var);
        this.f53973g = androidx.compose.runtime.d.j(new i2.s(j17), g1Var);
        this.f53974h = androidx.compose.runtime.d.j(new i2.s(j18), g1Var);
        this.f53975i = androidx.compose.runtime.d.j(new i2.s(j19), g1Var);
        this.f53976j = androidx.compose.runtime.d.j(new i2.s(j21), g1Var);
        this.f53977k = androidx.compose.runtime.d.j(new i2.s(j22), g1Var);
        this.f53978l = androidx.compose.runtime.d.j(new i2.s(j23), g1Var);
        this.f53979m = androidx.compose.runtime.d.j(Boolean.valueOf(z11), g1Var);
    }

    public static t0 a(t0 t0Var, long j11, long j12, int i5) {
        long jF = (i5 & 1) != 0 ? t0Var.f() : j11;
        long j13 = ((i2.s) ((p1.s2) t0Var.f53968b).getValue()).f61148a;
        long jG = t0Var.g();
        long j14 = ((i2.s) ((p1.s2) t0Var.f53970d).getValue()).f61148a;
        long jB = t0Var.b();
        long jH = t0Var.h();
        long jC = (i5 & 64) != 0 ? t0Var.c() : j12;
        long jD = t0Var.d();
        long j15 = ((i2.s) ((p1.s2) t0Var.f53975i).getValue()).f61148a;
        long j16 = ((i2.s) ((p1.s2) t0Var.f53976j).getValue()).f61148a;
        long jE = t0Var.e();
        long j17 = ((i2.s) ((p1.s2) t0Var.f53978l).getValue()).f61148a;
        boolean zI = t0Var.i();
        t0Var.getClass();
        return new t0(jF, j13, jG, j14, jB, jH, jC, jD, j15, j16, jE, j17, zI);
    }

    public final long b() {
        return ((i2.s) ((p1.s2) this.f53971e).getValue()).f61148a;
    }

    public final long c() {
        return ((i2.s) ((p1.s2) this.f53973g).getValue()).f61148a;
    }

    public final long d() {
        return ((i2.s) ((p1.s2) this.f53974h).getValue()).f61148a;
    }

    public final long e() {
        return ((i2.s) ((p1.s2) this.f53977k).getValue()).f61148a;
    }

    public final long f() {
        return ((i2.s) ((p1.s2) this.f53967a).getValue()).f61148a;
    }

    public final long g() {
        return ((i2.s) ((p1.s2) this.f53969c).getValue()).f61148a;
    }

    public final long h() {
        return ((i2.s) ((p1.s2) this.f53972f).getValue()).f61148a;
    }

    public final boolean i() {
        return ((Boolean) ((p1.s2) this.f53979m).getValue()).booleanValue();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Colors(primary=");
        sb2.append((Object) i2.s.h(f()));
        sb2.append(", primaryVariant=");
        sb2.append((Object) i2.s.h(((i2.s) ((p1.s2) this.f53968b).getValue()).f61148a));
        sb2.append(", secondary=");
        sb2.append((Object) i2.s.h(g()));
        sb2.append(", secondaryVariant=");
        sb2.append((Object) i2.s.h(((i2.s) ((p1.s2) this.f53970d).getValue()).f61148a));
        sb2.append(", background=");
        sb2.append((Object) i2.s.h(b()));
        sb2.append(", surface=");
        sb2.append((Object) i2.s.h(h()));
        sb2.append(", error=");
        sb2.append((Object) i2.s.h(c()));
        sb2.append(", onPrimary=");
        sb2.append((Object) i2.s.h(d()));
        sb2.append(", onSecondary=");
        com.google.android.gms.internal.measurement.k2.v(((i2.s) ((p1.s2) this.f53975i).getValue()).f61148a, ", onBackground=", sb2);
        sb2.append((Object) i2.s.h(((i2.s) ((p1.s2) this.f53976j).getValue()).f61148a));
        sb2.append(", onSurface=");
        sb2.append((Object) i2.s.h(e()));
        sb2.append(", onError=");
        sb2.append((Object) i2.s.h(((i2.s) ((p1.s2) this.f53978l).getValue()).f61148a));
        sb2.append(", isLight=");
        sb2.append(i());
        sb2.append(')');
        return sb2.toString();
    }
}
