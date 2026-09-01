package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lt82;", "Lu28;", "Lu82;", "coil-compose-core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class t82 extends u28 {
    public final rx5 b;
    public final gx5 c;
    public final z80 d;
    public final x45 e;
    public final x45 f;
    public final int g;
    public final xd h;
    public final w82 i;
    public final float j;
    public final bs0 k;
    public final boolean l;
    public final k90 m;
    public final String n;

    public t82(rx5 rx5Var, gx5 gx5Var, z80 z80Var, x45 x45Var, x45 x45Var2, int i, xd xdVar, w82 w82Var, float f, bs0 bs0Var, boolean z, k90 k90Var, String str) {
        this.b = rx5Var;
        this.c = gx5Var;
        this.d = z80Var;
        this.e = x45Var;
        this.f = x45Var2;
        this.g = i;
        this.h = xdVar;
        this.i = w82Var;
        this.j = f;
        this.k = bs0Var;
        this.l = z;
        this.m = k90Var;
        this.n = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t82)) {
            return false;
        }
        t82 t82Var = (t82) obj;
        return this.b.equals(t82Var.b) && g76.L(this.c, t82Var.c) && g76.L(this.d, t82Var.d) && g76.L(this.e, t82Var.e) && g76.L(this.f, t82Var.f) && this.g == t82Var.g && g76.L(this.h, t82Var.h) && g76.L(this.i, t82Var.i) && Float.compare(this.j, t82Var.j) == 0 && g76.L(this.k, t82Var.k) && this.l == t82Var.l && g76.L(this.m, t82Var.m) && g76.L(this.n, t82Var.n);
    }

    @Override // defpackage.u28
    public final q28 f() {
        z80 z80Var = this.d;
        gx5 gx5Var = this.c;
        rx5 rx5Var = this.b;
        a90 a90Var = new a90(gx5Var, rx5Var, z80Var);
        g90 g90Var = new g90(a90Var);
        g90Var.m = this.e;
        g90Var.n = this.f;
        g90Var.o = this.i;
        g90Var.p = this.g;
        g90Var.q = this.m;
        g90Var.k(a90Var);
        lfc lfcVar = rx5Var.q;
        return new u82(g90Var, this.h, this.i, this.j, this.k, this.l, this.n, lfcVar instanceof j72 ? (j72) lfcVar : null);
    }

    public final int hashCode() {
        int iHashCode = (this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31)) * 31)) * 31;
        x45 x45Var = this.f;
        int iP = km4.p(this.j, (this.i.hashCode() + ((this.h.hashCode() + ((((iHashCode + (x45Var == null ? 0 : x45Var.hashCode())) * 31) + this.g) * 31)) * 31)) * 31, 31);
        bs0 bs0Var = this.k;
        int iHashCode2 = (((iP + (bs0Var == null ? 0 : bs0Var.hashCode())) * 31) + (this.l ? 1231 : 1237)) * 31;
        k90 k90Var = this.m;
        int iHashCode3 = (iHashCode2 + (k90Var == null ? 0 : k90Var.hashCode())) * 31;
        String str = this.n;
        return iHashCode3 + (str != null ? str.hashCode() : 0);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        u82 u82Var = (u82) q28Var;
        long jH = u82Var.v.h();
        j72 j72Var = u82Var.u;
        z80 z80Var = this.d;
        gx5 gx5Var = this.c;
        rx5 rx5Var = this.b;
        a90 a90Var = new a90(gx5Var, rx5Var, z80Var);
        g90 g90Var = u82Var.v;
        g90Var.m = this.e;
        g90Var.n = this.f;
        w82 w82Var = this.i;
        g90Var.o = w82Var;
        g90Var.p = this.g;
        g90Var.q = this.m;
        g90Var.k(a90Var);
        boolean zA = dfc.a(jH, g90Var.h());
        u82Var.o = this.h;
        lfc lfcVar = rx5Var.q;
        u82Var.u = lfcVar instanceof j72 ? (j72) lfcVar : null;
        u82Var.p = w82Var;
        u82Var.q = this.j;
        u82Var.r = this.k;
        u82Var.s = this.l;
        String str = u82Var.t;
        String str2 = this.n;
        if (!g76.L(str, str2)) {
            u82Var.t = str2;
            dl7.u(u82Var);
        }
        boolean zL = g76.L(j72Var, u82Var.u);
        if (!zA || !zL) {
            gx1.M(u82Var);
        }
        wgf.y(u82Var);
    }

    public final String toString() {
        int i = this.g;
        String str = i == 0 ? "None" : i == 1 ? "Low" : i == 2 ? "Medium" : i == 3 ? "High" : "Unknown";
        StringBuilder sb = new StringBuilder("ContentPainterElement(request=");
        sb.append(this.b);
        sb.append(", imageLoader=");
        sb.append(this.c);
        sb.append(", modelEqualityDelegate=");
        sb.append(this.d);
        sb.append(", transform=");
        sb.append(this.e);
        sb.append(", onState=");
        sb.append(this.f);
        sb.append(", filterQuality=");
        sb.append(str);
        sb.append(", alignment=");
        sb.append(this.h);
        sb.append(", contentScale=");
        sb.append(this.i);
        sb.append(", alpha=");
        sb.append(this.j);
        sb.append(", colorFilter=");
        sb.append(this.k);
        sb.append(", clipToBounds=");
        sb.append(this.l);
        sb.append(", previewHandler=");
        sb.append(this.m);
        sb.append(", contentDescription=");
        return ka1.v(sb, this.n, ")");
    }
}
