package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i58 {
    public mx a;
    public yy4 b;
    public int c;
    public boolean d;
    public int e;
    public int f;
    public List g;
    public oh0 h;
    public s08 i;
    public long j;
    public m73 k;
    public mkd l;
    public iq1 m;
    public ip6 n;
    public qjd o;
    public int p;
    public int q;
    public h58 r;
    public long s;

    public i58(mx mxVar, mkd mkdVar, yy4 yy4Var, int i, boolean z, int i2, int i3, List list, oh0 oh0Var) {
        this.a = mxVar;
        this.b = yy4Var;
        this.c = i;
        this.d = z;
        this.e = i2;
        this.f = i3;
        this.g = list;
        this.h = oh0Var;
        int i4 = h26.b;
        this.j = h26.a;
        this.l = mkdVar;
        this.p = -1;
        this.q = -1;
    }

    public final int a(int i, ip6 ip6Var) {
        int i2 = this.p;
        int i3 = this.q;
        if (i == i2 && i2 != -1) {
            return i3;
        }
        long jA = h72.a(0, i, 0, Integer.MAX_VALUE);
        if (this.f > 1) {
            jA = h(jA, ip6Var);
        }
        int iG = jq7.g(b(jA, ip6Var).e);
        int i4 = f72.i(jA);
        if (iG < i4) {
            iG = i4;
        }
        this.p = i;
        this.q = iG;
        return iG;
    }

    public final f58 b(long j, ip6 ip6Var) {
        iq1 iq1VarE = e(ip6Var);
        long jO = bo.O(iq1VarE.q(), this.c, j, this.d);
        boolean z = this.d;
        int i = this.c;
        int i2 = this.e;
        return new f58(iq1VarE, jO, ((z || !(i == 2 || i == 4 || i == 5)) && i2 >= 1) ? i2 : 1, i);
    }

    public final boolean c(long j, ip6 ip6Var) {
        this.s = (this.s << 2) | 3;
        long jH = this.f > 1 ? h(j, ip6Var) : j;
        qjd qjdVar = this.o;
        if (qjdVar != null) {
            f58 f58Var = qjdVar.b;
            pjd pjdVar = qjdVar.a;
            if (!f58Var.a.a()) {
                ip6 ip6Var2 = pjdVar.h;
                long j2 = pjdVar.j;
                if (ip6Var == ip6Var2 && (f72.b(jH, j2) || (f72.h(jH) == f72.h(j2) && f72.j(jH) == f72.j(j2) && f72.g(jH) >= f58Var.e && !f58Var.c))) {
                    qjd qjdVar2 = this.o;
                    qjdVar2.getClass();
                    if (f72.b(jH, qjdVar2.a.j)) {
                        return false;
                    }
                    qjd qjdVar3 = this.o;
                    qjdVar3.getClass();
                    this.o = g(ip6Var, jH, qjdVar3.b);
                    return true;
                }
            }
        }
        oh0 oh0Var = this.h;
        if (oh0Var != null) {
            this.n = ip6Var;
            long j3 = this.l.a.b;
            h58 h58Var = this.r;
            if (h58Var == null) {
                h58Var = new h58(this);
                this.r = h58Var;
            }
            float fP0 = h58Var.p0(oh0Var.c);
            float fP02 = h58Var.p0(oh0Var.a);
            float fP03 = h58Var.p0(oh0Var.b);
            float f = 2.0f;
            float f2 = (fP02 + fP03) / 2.0f;
            float f3 = fP03;
            float f4 = fP02;
            while (f3 - f4 >= fP0) {
                float f5 = f;
                float f6 = f3;
                if (oh0.a(h58Var.a(j, h58Var.J(f2)))) {
                    f3 = f2;
                } else {
                    f4 = f2;
                    f3 = f6;
                }
                f2 = (f4 + f3) / f5;
                f = f5;
            }
            float fFloor = (((float) Math.floor((f4 - fP02) / fP0)) * fP0) + fP02;
            float f7 = fP0 + fFloor;
            if (f7 <= fP03 && !oh0.a(h58Var.a(j, h58Var.J(f7)))) {
                fFloor = f7;
            }
            long J = h58Var.J(fFloor);
            if (qkd.d(J)) {
                J = j58.a(j3, J);
            }
            long j4 = J;
            h58 h58Var2 = this.r;
            if (h58Var2 == null) {
                h58Var2 = new h58(this);
                this.r = h58Var2;
            }
            qjd qjdVar4 = h58Var2.a;
            if (qjdVar4 != null) {
                pjd pjdVar2 = qjdVar4.a;
                if (qkd.a(j4, pjdVar2.b.a.b) && pjdVar2.f == this.c) {
                    this.o = qjdVar4;
                    return true;
                }
            }
            f(mkd.a(this.l, 0L, j4, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777213));
        }
        this.o = g(ip6Var, jH, b(jH, ip6Var));
        return true;
    }

    public final void d(m73 m73Var) {
        long jA;
        m73 m73Var2 = this.k;
        if (m73Var != null) {
            int i = h26.b;
            jA = h26.a(m73Var.b(), m73Var.U());
        } else {
            jA = h26.a;
        }
        if (m73Var2 == null) {
            this.k = m73Var;
            this.j = jA;
            return;
        }
        if (m73Var == null || this.j != jA) {
            this.k = m73Var;
            this.j = jA;
            this.s = (this.s << 2) | 1;
            this.m = null;
            this.o = null;
            this.q = -1;
            this.p = -1;
            this.r = null;
        }
    }

    public final iq1 e(ip6 ip6Var) {
        iq1 iq1Var = this.m;
        if (iq1Var == null || ip6Var != this.n || iq1Var.a()) {
            this.n = ip6Var;
            mx mxVar = this.a;
            mkd mkdVarC = il7.C(this.l, ip6Var);
            m73 m73Var = this.k;
            m73Var.getClass();
            yy4 yy4Var = this.b;
            List list = this.g;
            if (list == null) {
                list = ey3.a;
            }
            iq1Var = new iq1(mxVar, mkdVarC, list, m73Var, yy4Var);
        }
        this.m = iq1Var;
        return iq1Var;
    }

    public final void f(mkd mkdVar) {
        boolean zC = mkdVar.c(this.l);
        this.l = mkdVar;
        if (zC) {
            return;
        }
        this.s <<= 2;
        this.m = null;
        this.o = null;
        this.q = -1;
        this.p = -1;
    }

    public final qjd g(ip6 ip6Var, long j, f58 f58Var) {
        float fMin = Math.min(f58Var.a.q(), f58Var.d);
        mx mxVar = this.a;
        mkd mkdVar = this.l;
        List list = this.g;
        if (list == null) {
            list = ey3.a;
        }
        int i = this.e;
        boolean z = this.d;
        int i2 = this.c;
        m73 m73Var = this.k;
        m73Var.getClass();
        return new qjd(new pjd(mxVar, mkdVar, list, i, z, i2, m73Var, ip6Var, this.b, j), f58Var, h72.d(j, (((long) jq7.g(fMin)) << 32) | (((long) jq7.g(f58Var.e)) & 4294967295L)));
    }

    public final long h(long j, ip6 ip6Var) {
        s08 s08Var = this.i;
        mkd mkdVar = this.l;
        m73 m73Var = this.k;
        m73Var.getClass();
        s08 s08VarO = gq7.o(s08Var, ip6Var, mkdVar, m73Var, this.b);
        this.i = s08VarO;
        return s08VarO.a(this.f, j);
    }

    public final String toString() {
        pjd pjdVar;
        StringBuilder sb = new StringBuilder("MultiParagraphLayoutCache(textLayoutResult=");
        Object f72Var = "null";
        sb.append(this.o != null ? "<TextLayoutResult>" : "null");
        sb.append(", lastDensity=");
        sb.append((Object) h26.b(this.j));
        sb.append(", history=");
        sb.append(this.s);
        sb.append(", constraints=");
        qjd qjdVar = this.o;
        if (qjdVar != null && (pjdVar = qjdVar.a) != null) {
            f72Var = new f72(pjdVar.j);
        }
        sb.append(f72Var);
        sb.append(')');
        return sb.toString();
    }
}
