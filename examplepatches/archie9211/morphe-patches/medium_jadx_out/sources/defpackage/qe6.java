package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qe6 implements zx8 {
    public final x67 a;
    public final c38 b;
    public i93 c;
    public final v67 d;

    public qe6(x67 x67Var, zm7 zm7Var, c38 c38Var) {
        this.a = x67Var;
        this.b = c38Var;
        this.d = x67Var.c(new z(2, this));
    }

    @Override // defpackage.zx8
    public final boolean a(y05 y05Var) {
        y05Var.getClass();
        v67 v67Var = this.d;
        Object obj = ((ConcurrentHashMap) v67Var.c).get(y05Var);
        return ((obj == null || obj == w67.COMPUTING) ? c(y05Var) : (wx8) v67Var.invoke(y05Var)) == null;
    }

    @Override // defpackage.zx8
    public final void b(y05 y05Var, ArrayList arrayList) {
        y05Var.getClass();
        Object objInvoke = this.d.invoke(y05Var);
        if (objInvoke != null) {
            arrayList.add(objInvoke);
        }
    }

    public final w01 c(y05 y05Var) {
        InputStream inputStreamA;
        y05Var.getClass();
        n98 n98Var = mnc.j;
        n98Var.getClass();
        if (y05Var.a.h(n98Var)) {
            r01.m.getClass();
            inputStreamA = y01.a(r01.a(y05Var));
        } else {
            inputStreamA = null;
        }
        if (inputStreamA != null) {
            return s42.N(y05Var, this.a, this.b, inputStreamA);
        }
        return null;
    }

    @Override // defpackage.zx8
    public final Collection k(y05 y05Var, x45 x45Var) {
        y05Var.getClass();
        return ny3.a;
    }
}
