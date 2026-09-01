package defpackage;

import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lmgd;", "Lu28;", "Lpgd;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class mgd extends u28 {
    public final mx b;
    public final mkd c;
    public final yy4 d;
    public final x45 e;
    public final int f;
    public final boolean g;
    public final int h;
    public final int i;
    public final List j;
    public final x45 k;
    public final dv1 l;
    public final oh0 m;
    public final x45 n;

    public mgd(mx mxVar, mkd mkdVar, yy4 yy4Var, x45 x45Var, int i, boolean z, int i2, int i3, List list, x45 x45Var2, dv1 dv1Var, oh0 oh0Var, x45 x45Var3) {
        this.b = mxVar;
        this.c = mkdVar;
        this.d = yy4Var;
        this.e = x45Var;
        this.f = i;
        this.g = z;
        this.h = i2;
        this.i = i3;
        this.j = list;
        this.k = x45Var2;
        this.l = dv1Var;
        this.m = oh0Var;
        this.n = x45Var3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mgd)) {
            return false;
        }
        mgd mgdVar = (mgd) obj;
        return g76.L(this.l, mgdVar.l) && g76.L(this.b, mgdVar.b) && g76.L(this.c, mgdVar.c) && g76.L(this.j, mgdVar.j) && g76.L(this.d, mgdVar.d) && this.e == mgdVar.e && this.n == mgdVar.n && this.f == mgdVar.f && this.g == mgdVar.g && this.h == mgdVar.h && this.i == mgdVar.i && this.k == mgdVar.k;
    }

    @Override // defpackage.u28
    public final q28 f() {
        pgd pgdVar = new pgd();
        pgdVar.o = this.b;
        pgdVar.p = this.c;
        pgdVar.q = this.d;
        pgdVar.r = this.e;
        pgdVar.s = this.f;
        pgdVar.t = this.g;
        pgdVar.u = this.h;
        pgdVar.v = this.i;
        pgdVar.w = this.j;
        pgdVar.x = this.k;
        pgdVar.y = this.l;
        pgdVar.z = this.m;
        pgdVar.A = this.n;
        return pgdVar;
    }

    public final int hashCode() {
        int iHashCode = (this.d.hashCode() + b09.o(this.c, this.b.hashCode() * 31, 31)) * 31;
        x45 x45Var = this.e;
        int iHashCode2 = (((((((((iHashCode + (x45Var != null ? x45Var.hashCode() : 0)) * 31) + this.f) * 31) + (this.g ? 1231 : 1237)) * 31) + this.h) * 31) + this.i) * 31;
        List list = this.j;
        int iHashCode3 = (iHashCode2 + (list != null ? list.hashCode() : 0)) * 31;
        x45 x45Var2 = this.k;
        int iHashCode4 = (iHashCode3 + (x45Var2 != null ? x45Var2.hashCode() : 0)) * 961;
        dv1 dv1Var = this.l;
        int iHashCode5 = (iHashCode4 + (dv1Var != null ? dv1Var.hashCode() : 0)) * 31;
        x45 x45Var3 = this.n;
        return iHashCode5 + (x45Var3 != null ? x45Var3.hashCode() : 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0026  */
    @Override // defpackage.u28
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l(defpackage.q28 r15) {
        /*
            Method dump skipped, instruction units count: 292
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mgd.l(q28):void");
    }
}
