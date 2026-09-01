package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class u0 implements pj6 {
    @Override // defpackage.pj6
    public Object d(kw2 kw2Var) {
        return i(kw2Var);
    }

    public abstract Object e();

    public abstract int f(Object obj);

    public abstract Iterator g(Object obj);

    public abstract int h(Object obj);

    public final Object i(kw2 kw2Var) {
        Object objE = e();
        int iF = f(objE);
        f22 f22VarS = kw2Var.s(a());
        while (true) {
            int iE = f22VarS.e(a());
            if (iE == -1) {
                f22VarS.m(a());
                return l(objE);
            }
            j(f22VarS, iE + iF, objE);
        }
    }

    public abstract void j(f22 f22Var, int i, Object obj);

    public abstract Object k(Object obj);

    public abstract Object l(Object obj);
}
