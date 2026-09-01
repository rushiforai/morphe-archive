package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m31 {
    public final pjd a;

    public m31(pjd pjdVar) {
        this.a = pjdVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m31)) {
            return false;
        }
        pjd pjdVar = this.a;
        mx mxVar = pjdVar.a;
        pjd pjdVar2 = ((m31) obj).a;
        return g76.L(mxVar, pjdVar2.a) && pjdVar.b.c(pjdVar2.b) && g76.L(pjdVar.c, pjdVar2.c) && pjdVar.d == pjdVar2.d && pjdVar.e == pjdVar2.e && pjdVar.f == pjdVar2.f && g76.L(pjdVar.g, pjdVar2.g) && pjdVar.h == pjdVar2.h && pjdVar.i == pjdVar2.i && f72.b(pjdVar.j, pjdVar2.j);
    }

    public final int hashCode() {
        pjd pjdVar = this.a;
        int iHashCode = pjdVar.a.hashCode() * 31;
        mkd mkdVar = pjdVar.b;
        skc skcVar = mkdVar.a;
        long j = skcVar.b;
        rkd[] rkdVarArr = qkd.b;
        int iN = ev6.n(j) * 31;
        d05 d05Var = skcVar.c;
        int i = (iN + (d05Var != null ? d05Var.a : 0)) * 31;
        zz4 zz4Var = skcVar.d;
        int i2 = (i + (zz4Var != null ? zz4Var.a : 0)) * 31;
        a05 a05Var = skcVar.e;
        int i3 = (i2 + (a05Var != null ? a05Var.a : 0)) * 31;
        az4 az4Var = skcVar.f;
        int iHashCode2 = (i3 + (az4Var != null ? az4Var.hashCode() : 0)) * 31;
        String str = skcVar.g;
        int iN2 = (ev6.n(skcVar.h) + ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31)) * 31;
        lo0 lo0Var = skcVar.i;
        int iFloatToIntBits = (iN2 + (lo0Var != null ? Float.floatToIntBits(lo0Var.a) : 0)) * 31;
        xid xidVar = skcVar.j;
        int iHashCode3 = (iFloatToIntBits + (xidVar != null ? xidVar.hashCode() : 0)) * 31;
        h67 h67Var = skcVar.k;
        int iHashCode4 = h67Var != null ? h67Var.a.hashCode() : 0;
        long j2 = skcVar.l;
        int i4 = uu1.i;
        int iHashCode5 = (mkdVar.b.hashCode() + lv8.g((iHashCode3 + iHashCode4) * 31, 961, j2)) * 31;
        bb9 bb9Var = mkdVar.c;
        int iHashCode6 = (pjdVar.i.hashCode() + ((pjdVar.h.hashCode() + ((pjdVar.g.hashCode() + ((((((wgd.p((iHashCode5 + (bb9Var != null ? bb9Var.hashCode() : 0) + iHashCode) * 31, 31, pjdVar.c) + pjdVar.d) * 31) + (pjdVar.e ? 1231 : 1237)) * 31) + pjdVar.f) * 31)) * 31)) * 31)) * 31;
        long j3 = pjdVar.j;
        return ((int) (j3 ^ (j3 >>> 32))) + iHashCode6;
    }
}
