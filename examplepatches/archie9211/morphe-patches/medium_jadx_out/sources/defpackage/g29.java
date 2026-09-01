package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g29 {
    public String a;
    public mkd b;
    public yy4 c;
    public int d;
    public boolean e;
    public int f;
    public int g;
    public long h;
    public m73 i;
    public wq j;
    public boolean k;
    public long l;
    public s08 m;
    public b29 n;
    public ip6 o;
    public long p;
    public int q;
    public int r;
    public long s;

    public g29(String str, mkd mkdVar, yy4 yy4Var, int i, boolean z, int i2, int i3) {
        this.a = str;
        this.b = mkdVar;
        this.c = yy4Var;
        this.d = i;
        this.e = z;
        this.f = i2;
        this.g = i3;
        int i4 = h26.b;
        this.h = h26.a;
        this.l = 0L;
        if (!(true & true)) {
            d26.a("width and height must be >= 0");
        }
        this.p = h72.h(0, 0, 0, 0);
        this.q = -1;
        this.r = -1;
    }

    public static long g(g29 g29Var, long j, ip6 ip6Var) {
        mkd mkdVar = g29Var.b;
        s08 s08Var = g29Var.m;
        m73 m73Var = g29Var.i;
        m73Var.getClass();
        s08 s08VarO = gq7.o(s08Var, ip6Var, mkdVar, m73Var, g29Var.c);
        g29Var.m = s08VarO;
        return s08VarO.a(g29Var.g, j);
    }

    public final int a(int i, ip6 ip6Var) {
        int i2 = this.q;
        int i3 = this.r;
        if (i == i2 && i2 != -1) {
            return i3;
        }
        long jA = h72.a(0, i, 0, Integer.MAX_VALUE);
        if (this.g > 1) {
            jA = g(this, jA, ip6Var);
        }
        b29 b29VarE = e(ip6Var);
        long jO = bo.O(b29VarE.q(), this.d, jA, this.e);
        boolean z = this.e;
        int i4 = this.d;
        int i5 = this.f;
        int iG = jq7.g(new wq((ar) b29VarE, ((z || !(i4 == 2 || i4 == 4 || i4 == 5)) && i5 >= 1) ? i5 : 1, i4, jO).b());
        int i6 = f72.i(jA);
        if (iG < i6) {
            iG = i6;
        }
        this.q = i;
        this.r = iG;
        return iG;
    }

    public final boolean b(long j, ip6 ip6Var) {
        b29 b29Var;
        this.s = (this.s << 2) | 3;
        boolean z = true;
        long jG = this.g > 1 ? g(this, j, ip6Var) : j;
        wq wqVar = this.j;
        boolean z2 = false;
        if (wqVar != null && (b29Var = this.n) != null && !b29Var.a() && ip6Var == this.o && (f72.b(jG, this.p) || (f72.h(jG) == f72.h(this.p) && f72.j(jG) == f72.j(this.p) && f72.g(jG) >= wqVar.b() && !wqVar.d.d))) {
            if (!f72.b(jG, this.p)) {
                wq wqVar2 = this.j;
                wqVar2.getClass();
                this.l = h72.d(jG, (((long) jq7.g(Math.min(wqVar2.a.i.c(), wqVar2.d()))) << 32) | (((long) jq7.g(wqVar2.b())) & 4294967295L));
                if (this.d == 3 || (((int) (r12 >> 32)) >= wqVar2.d() && ((int) (4294967295L & r12)) >= wqVar2.b())) {
                    z = false;
                }
                this.k = z;
                this.p = jG;
            }
            return false;
        }
        b29 b29VarE = e(ip6Var);
        long jO = bo.O(b29VarE.q(), this.d, jG, this.e);
        boolean z3 = this.e;
        int i = this.d;
        int i2 = this.f;
        wq wqVar3 = new wq((ar) b29VarE, ((z3 || !(i == 2 || i == 4 || i == 5)) && i2 >= 1) ? i2 : 1, i, jO);
        this.p = jG;
        this.l = h72.d(jG, (((long) jq7.g(wqVar3.b())) & 4294967295L) | (((long) jq7.g(wqVar3.d())) << 32));
        if (this.d != 3 && (((int) (r1 >> 32)) < wqVar3.d() || ((int) (r1 & 4294967295L)) < wqVar3.b())) {
            z2 = true;
        }
        this.k = z2;
        this.j = wqVar3;
        return true;
    }

    public final void c() {
        this.j = null;
        this.n = null;
        this.o = null;
        this.q = -1;
        this.r = -1;
        if (!(true & true)) {
            d26.a("width and height must be >= 0");
        }
        this.p = h72.h(0, 0, 0, 0);
        this.l = 0L;
        this.k = false;
    }

    public final void d(m73 m73Var) {
        long jA;
        m73 m73Var2 = this.i;
        if (m73Var != null) {
            int i = h26.b;
            jA = h26.a(m73Var.b(), m73Var.U());
        } else {
            jA = h26.a;
        }
        if (m73Var2 == null) {
            this.i = m73Var;
            this.h = jA;
        } else if (m73Var == null || this.h != jA) {
            this.i = m73Var;
            this.h = jA;
            this.s = (this.s << 2) | 1;
            c();
        }
    }

    public final b29 e(ip6 ip6Var) {
        b29 arVar = this.n;
        if (arVar == null || ip6Var != this.o || arVar.a()) {
            this.o = ip6Var;
            String str = this.a;
            mkd mkdVarC = il7.C(this.b, ip6Var);
            m73 m73Var = this.i;
            m73Var.getClass();
            yy4 yy4Var = this.c;
            ey3 ey3Var = ey3.a;
            arVar = new ar(str, mkdVarC, ey3Var, ey3Var, yy4Var, m73Var);
        }
        this.n = arVar;
        return arVar;
    }

    public final void f(String str, mkd mkdVar, yy4 yy4Var, int i, boolean z, int i2, int i3) {
        this.a = str;
        this.b = mkdVar;
        this.c = yy4Var;
        this.d = i;
        this.e = z;
        this.f = i2;
        this.g = i3;
        this.s = (this.s << 2) | 2;
        c();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ParagraphLayoutCache(paragraph=");
        sb.append(this.j != null ? "<paragraph>" : "null");
        sb.append(", lastDensity=");
        sb.append((Object) h26.b(this.h));
        sb.append(", history=");
        return ev6.t(this.s, ", constraints=$)", sb);
    }
}
