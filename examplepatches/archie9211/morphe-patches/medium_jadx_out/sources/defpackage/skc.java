package defpackage;

import com.drew.lang.RandomAccessStreamReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class skc implements ix {
    public final wid a;
    public final long b;
    public final d05 c;
    public final zz4 d;
    public final a05 e;
    public final az4 f;
    public final String g;
    public final long h;
    public final lo0 i;
    public final xid j;
    public final h67 k;
    public final long l;
    public final ohd m;
    public final i3c n;
    public final pxf o;

    public skc(long j, long j2, d05 d05Var, zz4 zz4Var, a05 a05Var, az4 az4Var, String str, long j3, lo0 lo0Var, xid xidVar, h67 h67Var, long j4, ohd ohdVar, i3c i3cVar, int i) {
        this((i & 1) != 0 ? uu1.h : j, (i & 2) != 0 ? qkd.c : j2, (i & 4) != 0 ? null : d05Var, (i & 8) != 0 ? null : zz4Var, (i & 16) != 0 ? null : a05Var, (i & 32) != 0 ? null : az4Var, (i & 64) != 0 ? null : str, (i & 128) != 0 ? qkd.c : j3, (i & 256) != 0 ? null : lo0Var, (i & 512) != 0 ? null : xidVar, (i & 1024) != 0 ? null : h67Var, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? uu1.h : j4, (i & 4096) != 0 ? null : ohdVar, (i & 8192) != 0 ? null : i3cVar);
    }

    public final boolean a(skc skcVar) {
        if (this == skcVar) {
            return true;
        }
        if (!qkd.a(this.b, skcVar.b) || !g76.L(this.c, skcVar.c) || !g76.L(this.d, skcVar.d) || !g76.L(this.e, skcVar.e) || !g76.L(this.f, skcVar.f) || !g76.L(this.g, skcVar.g) || !qkd.a(this.h, skcVar.h) || !g76.L(this.i, skcVar.i) || !g76.L(this.j, skcVar.j) || !g76.L(this.k, skcVar.k)) {
            return false;
        }
        long j = skcVar.l;
        int i = uu1.i;
        return ezd.a(this.l, j);
    }

    public final boolean b(skc skcVar) {
        return g76.L(this.a, skcVar.a) && g76.L(this.m, skcVar.m) && g76.L(this.n, skcVar.n) && g76.L(this.o, skcVar.o);
    }

    public final skc c(skc skcVar) {
        if (skcVar == null) {
            return this;
        }
        wid widVar = skcVar.a;
        return ukc.a(this, widVar.b(), widVar.e(), widVar.a(), skcVar.b, skcVar.c, skcVar.d, skcVar.e, skcVar.f, skcVar.g, skcVar.h, skcVar.i, skcVar.j, skcVar.k, skcVar.l, skcVar.m, skcVar.n, skcVar.o);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof skc)) {
            return false;
        }
        skc skcVar = (skc) obj;
        return a(skcVar) && b(skcVar);
    }

    public final int hashCode() {
        wid widVar = this.a;
        long jB = widVar.b();
        int i = uu1.i;
        int iN = ev6.n(jB) * 31;
        ez0 ez0VarE = widVar.e();
        int iFloatToIntBits = (Float.floatToIntBits(widVar.a()) + ((iN + (ez0VarE != null ? ez0VarE.hashCode() : 0)) * 31)) * 31;
        rkd[] rkdVarArr = qkd.b;
        int iN2 = (ev6.n(this.b) + iFloatToIntBits) * 31;
        d05 d05Var = this.c;
        int i2 = (iN2 + (d05Var != null ? d05Var.a : 0)) * 31;
        zz4 zz4Var = this.d;
        int i3 = (i2 + (zz4Var != null ? zz4Var.a : 0)) * 31;
        a05 a05Var = this.e;
        int i4 = (i3 + (a05Var != null ? a05Var.a : 0)) * 31;
        az4 az4Var = this.f;
        int iHashCode = (i4 + (az4Var != null ? az4Var.hashCode() : 0)) * 31;
        String str = this.g;
        int iN3 = (ev6.n(this.h) + ((iHashCode + (str != null ? str.hashCode() : 0)) * 31)) * 31;
        lo0 lo0Var = this.i;
        int iFloatToIntBits2 = (iN3 + (lo0Var != null ? Float.floatToIntBits(lo0Var.a) : 0)) * 31;
        xid xidVar = this.j;
        int iHashCode2 = (iFloatToIntBits2 + (xidVar != null ? xidVar.hashCode() : 0)) * 31;
        h67 h67Var = this.k;
        int iG = lv8.g((iHashCode2 + (h67Var != null ? h67Var.a.hashCode() : 0)) * 31, 31, this.l);
        ohd ohdVar = this.m;
        int i5 = (iG + (ohdVar != null ? ohdVar.a : 0)) * 31;
        i3c i3cVar = this.n;
        int iHashCode3 = (i5 + (i3cVar != null ? i3cVar.hashCode() : 0)) * 961;
        pxf pxfVar = this.o;
        return iHashCode3 + (pxfVar != null ? pxfVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SpanStyle(color=");
        wid widVar = this.a;
        sb.append((Object) uu1.h(widVar.b()));
        sb.append(", brush=");
        sb.append(widVar.e());
        sb.append(", alpha=");
        sb.append(widVar.a());
        sb.append(", fontSize=");
        sb.append((Object) qkd.e(this.b));
        sb.append(", fontWeight=");
        sb.append(this.c);
        sb.append(", fontStyle=");
        sb.append(this.d);
        sb.append(", fontSynthesis=");
        sb.append(this.e);
        sb.append(", fontFamily=");
        sb.append(this.f);
        sb.append(", fontFeatureSettings=");
        sb.append(this.g);
        sb.append(", letterSpacing=");
        sb.append((Object) qkd.e(this.h));
        sb.append(", baselineShift=");
        sb.append(this.i);
        sb.append(", textGeometricTransform=");
        sb.append(this.j);
        sb.append(", localeList=");
        sb.append(this.k);
        sb.append(", background=");
        ev6.F(this.l, ", textDecoration=", sb);
        sb.append(this.m);
        sb.append(", shadow=");
        sb.append(this.n);
        sb.append(", platformStyle=null, drawStyle=");
        sb.append(this.o);
        sb.append(')');
        return sb.toString();
    }

    public skc(wid widVar, long j, d05 d05Var, zz4 zz4Var, a05 a05Var, az4 az4Var, String str, long j2, lo0 lo0Var, xid xidVar, h67 h67Var, long j3, ohd ohdVar, i3c i3cVar, pxf pxfVar) {
        this.a = widVar;
        this.b = j;
        this.c = d05Var;
        this.d = zz4Var;
        this.e = a05Var;
        this.f = az4Var;
        this.g = str;
        this.h = j2;
        this.i = lo0Var;
        this.j = xidVar;
        this.k = h67Var;
        this.l = j3;
        this.m = ohdVar;
        this.n = i3cVar;
        this.o = pxfVar;
    }

    public skc(long j, long j2, d05 d05Var, zz4 zz4Var, a05 a05Var, az4 az4Var, String str, long j3, lo0 lo0Var, xid xidVar, h67 h67Var, long j4, ohd ohdVar, i3c i3cVar) {
        wid pv1Var;
        if (j != 16) {
            pv1Var = new pv1(j);
        } else {
            pv1Var = vid.a;
        }
        this(pv1Var, j2, d05Var, zz4Var, a05Var, az4Var, str, j3, lo0Var, xidVar, h67Var, j4, ohdVar, i3cVar, (pxf) null);
    }
}
