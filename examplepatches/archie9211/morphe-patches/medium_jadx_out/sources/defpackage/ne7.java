package defpackage;

import android.view.View;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lne7;", "Lu28;", "Lpe7;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ne7 extends u28 {
    public final r00 b;
    public final oid c;
    public final ma9 d;

    public ne7(r00 r00Var, oid oidVar, ma9 ma9Var) {
        this.b = r00Var;
        this.c = oidVar;
        this.d = ma9Var;
    }

    public final boolean equals(Object obj) {
        return this == obj;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new pe7(this.b, this.c, this.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((((Float.floatToIntBits(Float.NaN) + km4.p(Float.NaN, (((Float.floatToIntBits(Float.NaN) + (this.b.hashCode() * 961)) * 31) + 1231) * 961, 31)) * 31) + 1231) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        pe7 pe7Var = (pe7) q28Var;
        float f = pe7Var.q;
        long j = pe7Var.s;
        float f2 = pe7Var.t;
        boolean z = pe7Var.r;
        float f3 = pe7Var.u;
        boolean z2 = pe7Var.v;
        ma9 ma9Var = pe7Var.w;
        View view = pe7Var.x;
        m73 m73Var = pe7Var.y;
        pe7Var.o = this.b;
        pe7Var.q = Float.NaN;
        pe7Var.r = true;
        pe7Var.s = 9205357640488583168L;
        pe7Var.t = Float.NaN;
        pe7Var.u = Float.NaN;
        pe7Var.v = true;
        pe7Var.p = this.c;
        ma9 ma9Var2 = this.d;
        pe7Var.w = ma9Var2;
        View viewU = guc.U(pe7Var);
        m73 m73Var2 = flb.v0(pe7Var).y;
        if (pe7Var.z != null) {
            iyb iybVar = qe7.a;
            if (((!Float.isNaN(Float.NaN) || !Float.isNaN(f)) && Float.NaN != f && !ma9Var2.b()) || 9205357640488583168L != j || !vj3.b(Float.NaN, f2) || !vj3.b(Float.NaN, f3) || true != z || true != z2 || !ma9Var2.equals(ma9Var) || !viewU.equals(view) || !g76.L(m73Var2, m73Var)) {
                pe7Var.J0();
            }
        }
        pe7Var.K0();
    }
}
