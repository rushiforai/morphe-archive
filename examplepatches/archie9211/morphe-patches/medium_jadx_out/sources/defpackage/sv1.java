package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sv1 {
    public final k49 a;
    public final k49 b;
    public final k49 c;
    public final k49 d;
    public final k49 e;
    public final k49 f;
    public final k49 g;
    public final k49 h;
    public final k49 i;
    public final k49 j;
    public final k49 k;
    public final k49 l;
    public final k49 m;

    public sv1(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, long j11, long j12, boolean z) {
        uu1 uu1Var = new uu1(j);
        xsa xsaVar = xsa.h;
        this.a = new k49(uu1Var, xsaVar);
        this.b = new k49(new uu1(j2), xsaVar);
        this.c = new k49(new uu1(j3), xsaVar);
        this.d = new k49(new uu1(j4), xsaVar);
        this.e = new k49(new uu1(j5), xsaVar);
        this.f = new k49(new uu1(j6), xsaVar);
        this.g = new k49(new uu1(j7), xsaVar);
        this.h = new k49(new uu1(j8), xsaVar);
        this.i = new k49(new uu1(j9), xsaVar);
        this.j = new k49(new uu1(j10), xsaVar);
        this.k = new k49(new uu1(j11), xsaVar);
        this.l = new k49(new uu1(j12), xsaVar);
        this.m = new k49(Boolean.valueOf(z), xsaVar);
    }

    public final long a() {
        return ((uu1) this.e.getValue()).a;
    }

    public final long b() {
        return ((uu1) this.g.getValue()).a;
    }

    public final long c() {
        return ((uu1) this.k.getValue()).a;
    }

    public final long d() {
        return ((uu1) this.a.getValue()).a;
    }

    public final long e() {
        return ((uu1) this.f.getValue()).a;
    }

    public final boolean f() {
        return ((Boolean) this.m.getValue()).booleanValue();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Colors(primary=");
        sb.append((Object) uu1.h(d()));
        sb.append(", primaryVariant=");
        ev6.F(((uu1) this.b.getValue()).a, ", secondary=", sb);
        ev6.F(((uu1) this.c.getValue()).a, ", secondaryVariant=", sb);
        sb.append((Object) uu1.h(((uu1) this.d.getValue()).a));
        sb.append(", background=");
        sb.append((Object) uu1.h(a()));
        sb.append(", surface=");
        sb.append((Object) uu1.h(e()));
        sb.append(", error=");
        sb.append((Object) uu1.h(b()));
        sb.append(", onPrimary=");
        ev6.F(((uu1) this.h.getValue()).a, ", onSecondary=", sb);
        ev6.F(((uu1) this.i.getValue()).a, ", onBackground=", sb);
        sb.append((Object) uu1.h(((uu1) this.j.getValue()).a));
        sb.append(", onSurface=");
        sb.append((Object) uu1.h(c()));
        sb.append(", onError=");
        sb.append((Object) uu1.h(((uu1) this.l.getValue()).a));
        sb.append(", isLight=");
        sb.append(f());
        sb.append(')');
        return sb.toString();
    }
}
