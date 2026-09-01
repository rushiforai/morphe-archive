package defpackage;

import com.drew.lang.RandomAccessStreamReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mkd {
    public static final mkd d = new mkd(0, 0, null, null, 0, 0, 0, null, 16777215);
    public final skc a;
    public final s29 b;
    public final bb9 c;

    /* JADX WARN: Illegal instructions before constructor call */
    public mkd(long j, long j2, d05 d05Var, az4 az4Var, long j3, int i, long j4, bb9 bb9Var, int i2) {
        long j5 = (i2 & 1) != 0 ? uu1.h : j;
        long j6 = (i2 & 2) != 0 ? qkd.c : j2;
        d05 d05Var2 = (i2 & 4) != 0 ? null : d05Var;
        az4 az4Var2 = (i2 & 32) != 0 ? null : az4Var;
        long j7 = (i2 & 128) != 0 ? qkd.c : j3;
        long j8 = uu1.h;
        int i3 = (32768 & i2) != 0 ? 0 : i;
        long j9 = (131072 & i2) != 0 ? qkd.c : j4;
        bb9 bb9Var2 = (i2 & 524288) != 0 ? null : bb9Var;
        this(new skc(j5, j6, d05Var2, null, null, az4Var2, null, j7, null, null, null, j8, null, null), new s29(i3, 0, j9, null, bb9Var2 != null ? bb9Var2.a : null, null, 0, 0, null), bb9Var2);
    }

    public static mkd a(mkd mkdVar, long j, long j2, d05 d05Var, zz4 zz4Var, az4 az4Var, long j3, long j4, i3c i3cVar, int i, long j5, bb9 bb9Var, lz6 lz6Var, int i2) {
        pxf pxfVar;
        int i3;
        int i4;
        i3c i3cVar2;
        long j6;
        long jB = (i2 & 1) != 0 ? mkdVar.a.a.b() : j;
        long j7 = (i2 & 2) != 0 ? mkdVar.a.b : j2;
        d05 d05Var2 = (i2 & 4) != 0 ? mkdVar.a.c : d05Var;
        zz4 zz4Var2 = (i2 & 8) != 0 ? mkdVar.a.d : zz4Var;
        skc skcVar = mkdVar.a;
        a05 a05Var = skcVar.e;
        az4 az4Var2 = (i2 & 32) != 0 ? skcVar.f : az4Var;
        String str = skcVar.g;
        long j8 = (i2 & 128) != 0 ? skcVar.h : j3;
        lo0 lo0Var = skcVar.i;
        xid xidVar = skcVar.j;
        long j9 = j7;
        h67 h67Var = skcVar.k;
        long j10 = (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? skcVar.l : j4;
        ohd ohdVar = (i2 & 4096) != 0 ? skcVar.m : ohd.c;
        i3c i3cVar3 = (i2 & 8192) != 0 ? skcVar.n : i3cVar;
        pxf pxfVar2 = skcVar.o;
        if ((i2 & 32768) != 0) {
            pxfVar = pxfVar2;
            i3 = mkdVar.b.a;
        } else {
            pxfVar = pxfVar2;
            i3 = i;
        }
        s29 s29Var = mkdVar.b;
        ohd ohdVar2 = ohdVar;
        int i5 = s29Var.b;
        if ((i2 & 131072) != 0) {
            i4 = i5;
            i3cVar2 = i3cVar3;
            j6 = s29Var.c;
        } else {
            i4 = i5;
            i3cVar2 = i3cVar3;
            j6 = j5;
        }
        yid yidVar = s29Var.d;
        bb9 bb9Var2 = (i2 & 524288) != 0 ? mkdVar.c : bb9Var;
        lz6 lz6Var2 = (i2 & 1048576) != 0 ? s29Var.f : lz6Var;
        int i6 = s29Var.g;
        int i7 = s29Var.h;
        zjd zjdVar = s29Var.i;
        lz6 lz6Var3 = lz6Var2;
        long jB2 = skcVar.a.b();
        int i8 = uu1.i;
        return new mkd(new skc(ezd.a(jB, jB2) ? skcVar.a : jB != 16 ? new pv1(jB) : vid.a, j9, d05Var2, zz4Var2, a05Var, az4Var2, str, j8, lo0Var, xidVar, h67Var, j10, ohdVar2, i3cVar2, pxfVar), new s29(i3, i4, j6, yidVar, bb9Var2 != null ? bb9Var2.a : null, lz6Var3, i6, i7, zjdVar), bb9Var2);
    }

    public static mkd e(mkd mkdVar, long j, long j2, long j3, ohd ohdVar, int i, long j4, int i2) {
        long j5 = (i2 & 1) != 0 ? uu1.h : j;
        long j6 = (i2 & 2) != 0 ? qkd.c : j2;
        long j7 = (i2 & 128) != 0 ? qkd.c : j3;
        long j8 = uu1.h;
        ohd ohdVar2 = (i2 & 4096) != 0 ? null : ohdVar;
        int i3 = (32768 & i2) != 0 ? 0 : i;
        long j9 = (i2 & 131072) != 0 ? qkd.c : j4;
        skc skcVarA = ukc.a(mkdVar.a, j5, null, Float.NaN, j6, null, null, null, null, null, j7, null, null, null, j8, ohdVar2, null, null);
        s29 s29VarA = t29.a(mkdVar.b, i3, 0, j9, null, null, null, 0, 0, null);
        return (mkdVar.a == skcVarA && mkdVar.b == s29VarA) ? mkdVar : new mkd(skcVarA, s29VarA);
    }

    public final long b() {
        return this.a.a.b();
    }

    public final boolean c(mkd mkdVar) {
        if (this != mkdVar) {
            return g76.L(this.b, mkdVar.b) && this.a.a(mkdVar.a);
        }
        return true;
    }

    public final mkd d(mkd mkdVar) {
        return (mkdVar == null || mkdVar.equals(d)) ? this : new mkd(this.a.c(mkdVar.a), this.b.a(mkdVar.b));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mkd)) {
            return false;
        }
        mkd mkdVar = (mkd) obj;
        return g76.L(this.a, mkdVar.a) && g76.L(this.b, mkdVar.b) && g76.L(this.c, mkdVar.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        bb9 bb9Var = this.c;
        return iHashCode + (bb9Var != null ? bb9Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TextStyle(color=");
        sb.append((Object) uu1.h(b()));
        sb.append(", brush=");
        skc skcVar = this.a;
        sb.append(skcVar.a.e());
        sb.append(", alpha=");
        sb.append(skcVar.a.a());
        sb.append(", fontSize=");
        sb.append((Object) qkd.e(skcVar.b));
        sb.append(", fontWeight=");
        sb.append(skcVar.c);
        sb.append(", fontStyle=");
        sb.append(skcVar.d);
        sb.append(", fontSynthesis=");
        sb.append(skcVar.e);
        sb.append(", fontFamily=");
        sb.append(skcVar.f);
        sb.append(", fontFeatureSettings=");
        sb.append(skcVar.g);
        sb.append(", letterSpacing=");
        sb.append((Object) qkd.e(skcVar.h));
        sb.append(", baselineShift=");
        sb.append(skcVar.i);
        sb.append(", textGeometricTransform=");
        sb.append(skcVar.j);
        sb.append(", localeList=");
        sb.append(skcVar.k);
        sb.append(", background=");
        ev6.F(skcVar.l, ", textDecoration=", sb);
        sb.append(skcVar.m);
        sb.append(", shadow=");
        sb.append(skcVar.n);
        sb.append(", drawStyle=");
        sb.append(skcVar.o);
        sb.append(", textAlign=");
        s29 s29Var = this.b;
        sb.append((Object) jgd.a(s29Var.a));
        sb.append(", textDirection=");
        sb.append((Object) qhd.a(s29Var.b));
        sb.append(", lineHeight=");
        sb.append((Object) qkd.e(s29Var.c));
        sb.append(", textIndent=");
        sb.append(s29Var.d);
        sb.append(", platformStyle=");
        sb.append(this.c);
        sb.append(", lineHeightStyle=");
        sb.append(s29Var.f);
        sb.append(", lineBreak=");
        sb.append((Object) bz6.a(s29Var.g));
        sb.append(", hyphens=");
        sb.append((Object) tt5.a(s29Var.h));
        sb.append(", textMotion=");
        sb.append(s29Var.i);
        sb.append(')');
        return sb.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public mkd(skc skcVar, s29 s29Var) {
        skcVar.getClass();
        pa9 pa9Var = s29Var.e;
        this(skcVar, s29Var, pa9Var == null ? null : new bb9(pa9Var));
    }

    public mkd(skc skcVar, s29 s29Var, bb9 bb9Var) {
        this.a = skcVar;
        this.b = s29Var;
        this.c = bb9Var;
    }
}
