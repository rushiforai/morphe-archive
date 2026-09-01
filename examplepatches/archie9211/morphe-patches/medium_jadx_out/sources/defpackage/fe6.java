package defpackage;

import java.util.Collection;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fe6 implements en1 {
    public static final n98 g;
    public static final mn1 h;
    public final c38 a;
    public final x45 b;
    public final u67 c;
    public static final /* synthetic */ fj6[] e = {n1b.a.g(new u4a(fe6.class, "cloneable", AEVqIoD.iLkUjaWuWN, 0))};
    public static final y3b d = new y3b(18);
    public static final y05 f = mnc.k;

    public fe6(x67 x67Var, c38 c38Var) {
        h06 h06Var = h06.f;
        this.a = c38Var;
        this.b = h06Var;
        this.c = new u67(x67Var, new a3(this, 11, x67Var));
    }

    @Override // defpackage.en1
    public final y28 a(mn1 mn1Var) {
        mn1Var.getClass();
        if (!mn1Var.equals(h)) {
            return null;
        }
        return (fn1) mk7.z(this.c, e[0]);
    }

    @Override // defpackage.en1
    public final Collection b(y05 y05Var) {
        y05Var.getClass();
        if (!y05Var.equals(f)) {
            return ny3.a;
        }
        return qo7.B((fn1) mk7.z(this.c, e[0]));
    }

    @Override // defpackage.en1
    public final boolean c(y05 y05Var, n98 n98Var) {
        y05Var.getClass();
        n98Var.getClass();
        return n98Var.equals(g) && y05Var.equals(f);
    }

    static {
        z05 z05Var = lnc.c;
        g = z05Var.g();
        y05 y05VarI = z05Var.i();
        h = new mn1(y05VarI.b(), y05VarI.a.g());
    }
}
