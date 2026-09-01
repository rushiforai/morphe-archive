package defpackage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class o4d {
    public static final f68 a;

    static {
        l24 l24Var = l24.a;
        gy3 gy3Var = new gy3(l24.b, mnc.f, 0);
        qn1 qn1Var = qn1.INTERFACE;
        n98 n98VarG = mnc.g.a.g();
        o67 o67Var = x67.e;
        f68 f68Var = new f68(gy3Var, qn1Var, n98VarG, o67Var);
        c28 c28Var = c28.ABSTRACT;
        if (c28Var == null) {
            f68.u0(6);
            throw null;
        }
        f68Var.h = c28Var;
        g93 g93Var = h93.e;
        if (g93Var == null) {
            f68.u0(9);
            throw null;
        }
        f68Var.i = g93Var;
        List listQ = d46.Q(twd.B0(f68Var, pqe.IN_VARIANCE, n98.e("T"), 0, o67Var));
        if (f68Var.k != null) {
            rd6.g("Type parameters are already set for ", f68Var.getName());
            return;
        }
        ArrayList arrayList = new ArrayList(listQ);
        f68Var.k = arrayList;
        f68Var.j = new wn1(f68Var, arrayList, f68Var.l, f68Var.m);
        Set set = Collections.EMPTY_SET;
        if (set == null) {
            f68.u0(13);
            throw null;
        }
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            ((zm1) ((s55) it2.next())).h = f68Var.T();
        }
        a = f68Var;
    }
}
