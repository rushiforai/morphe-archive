package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mub implements c55 {
    public final /* synthetic */ boolean a;

    public mub(boolean z) {
        this.a = z;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long j;
        long j2 = ((uu1) obj).a;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            if (this.a) {
                p65Var.Y(1503126528);
                j = ((zo7) p65Var.j(kt7.b)).n;
                p65Var.p(false);
            } else {
                p65Var.Y(1503215870);
                j = ((zo7) p65Var.j(kt7.b)).o;
                p65Var.p(false);
            }
            qv5.b(vn7.J(R.drawable.ic_search_24, 0, p65Var), null, bgf.N(o28.b, "icon"), ((uu1) wec.a(j, null, "Search icons color", p65Var, 384, 10).getValue()).a, p65Var, 440, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
