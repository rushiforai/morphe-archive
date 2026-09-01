package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m55 extends g0 {
    public final /* synthetic */ n55 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m55(n55 n55Var) {
        super(n55Var.e);
        this.c = n55Var;
    }

    @Override // defpackage.g0, defpackage.zvd
    public final co1 a() {
        return this.c;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return true;
    }

    @Override // defpackage.z2
    public final Collection f() {
        List<mn1> listR;
        n55 n55Var = this.c;
        int i = n55Var.h;
        c65 c65Var = n55Var.g;
        y55 y55Var = y55.c;
        if (g76.L(c65Var, y55Var)) {
            listR = d46.Q(n55.l);
        } else if (g76.L(c65Var, z55.c)) {
            listR = d46.R(n55.m, new mn1(mnc.k, y55Var.a(i)));
        } else {
            b65 b65Var = b65.c;
            if (g76.L(c65Var, b65Var)) {
                listR = d46.Q(n55.l);
            } else {
                if (!g76.L(c65Var, a65.c)) {
                    int i2 = ab.a;
                    ygf.f("should not be called");
                    return null;
                }
                listR = d46.R(n55.m, new mn1(mnc.f, b65Var.a(i)));
            }
        }
        b38 b38VarH = ((xx8) n55Var.f).h();
        ArrayList arrayList = new ArrayList(cu1.k0(listR, 10));
        for (mn1 mn1Var : listR) {
            y28 y28VarF = d46.F(b38VarH, mn1Var);
            if (y28VarF == null) {
                rd6.o("Built-in class ", mn1Var, " not found");
                return null;
            }
            List listH1 = bu1.h1(y28VarF.n().getParameters().size(), n55Var.k);
            ArrayList arrayList2 = new ArrayList(cu1.k0(listH1, 10));
            Iterator it2 = listH1.iterator();
            while (it2.hasNext()) {
                arrayList2.add(new onc(((swd) it2.next()).T()));
            }
            uvd.b.getClass();
            arrayList.add(pwd.X(uvd.c, y28VarF, arrayList2));
        }
        return bu1.m1(arrayList);
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return this.c.k;
    }

    @Override // defpackage.z2
    public final uob h() {
        return uob.h;
    }

    @Override // defpackage.g0
    /* JADX INFO: renamed from: m */
    public final y28 a() {
        return this.c;
    }

    public final String toString() {
        return this.c.toString();
    }
}
