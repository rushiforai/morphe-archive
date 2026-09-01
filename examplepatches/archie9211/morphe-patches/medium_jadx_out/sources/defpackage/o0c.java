package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import kotlinx.serialization.UnknownFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class o0c implements t75 {
    public static final o0c a;
    private static final xzb descriptor;

    @Override // defpackage.pj6
    public final xzb a() {
        return descriptor;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        q0c q0cVar = (q0c) obj;
        q0cVar.getClass();
        xzb xzbVar = descriptor;
        xtc xtcVarA = xtcVar.a(xzbVar);
        xtcVarA.n(xzbVar, 0, ut0.a, q0cVar.a);
        xtcVarA.n(xzbVar, 1, bj3.a, q0cVar.b);
        q46 q46Var = q46.a;
        xtcVarA.n(xzbVar, 2, q46Var, q0cVar.c);
        xtcVarA.n(xzbVar, 3, q46Var, q0cVar.d);
        xtcVarA.n(xzbVar, 4, ya7.a, q0cVar.e);
        xtcVarA.s(xzbVar);
    }

    @Override // defpackage.t75
    public final pj6[] c() {
        pj6 pj6VarJ = vc2.J(ut0.a);
        pj6 pj6VarJ2 = vc2.J(bj3.a);
        q46 q46Var = q46.a;
        return new pj6[]{pj6VarJ, pj6VarJ2, vc2.J(q46Var), vc2.J(q46Var), vc2.J(ya7.a)};
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVar = descriptor;
        f22 f22VarS = kw2Var.s(xzbVar);
        int i = 0;
        Boolean bool = null;
        Double d = null;
        Integer num = null;
        Integer num2 = null;
        Long l = null;
        boolean z = true;
        while (z) {
            int iE = f22VarS.e(xzbVar);
            if (iE == -1) {
                z = false;
            } else if (iE == 0) {
                bool = (Boolean) f22VarS.v(xzbVar, 0, ut0.a, bool);
                i |= 1;
            } else if (iE == 1) {
                d = (Double) f22VarS.v(xzbVar, 1, bj3.a, d);
                i |= 2;
            } else if (iE == 2) {
                num = (Integer) f22VarS.v(xzbVar, 2, q46.a, num);
                i |= 4;
            } else if (iE == 3) {
                num2 = (Integer) f22VarS.v(xzbVar, 3, q46.a, num2);
                i |= 8;
            } else {
                if (iE != 4) {
                    throw new UnknownFieldException(iE);
                }
                l = (Long) f22VarS.v(xzbVar, 4, ya7.a, l);
                i |= 16;
            }
        }
        f22VarS.m(xzbVar);
        return new q0c(i, bool, d, num, num2, l);
    }

    static {
        o0c o0cVar = new o0c();
        a = o0cVar;
        jb9 jb9Var = new jb9("com.google.firebase.sessions.settings.SessionConfigs", o0cVar, 5);
        jb9Var.i(pUlNWdybf.GgoGEKlUYRU, false);
        jb9Var.i("sessionSamplingRate", false);
        jb9Var.i("sessionTimeoutSeconds", false);
        jb9Var.i("cacheDurationSeconds", false);
        jb9Var.i("cacheUpdatedTimeSeconds", false);
        descriptor = jb9Var;
    }
}
