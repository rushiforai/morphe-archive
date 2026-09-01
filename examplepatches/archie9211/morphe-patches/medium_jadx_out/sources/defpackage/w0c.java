package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import kotlinx.serialization.UnknownFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class w0c implements t75 {
    public static final w0c a;
    private static final xzb descriptor;

    @Override // defpackage.pj6
    public final xzb a() {
        return descriptor;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        y0c y0cVar = (y0c) obj;
        y0cVar.getClass();
        xzb xzbVar = descriptor;
        xtc xtcVarA = xtcVar.a(xzbVar);
        String str = y0cVar.a;
        str.getClass();
        xtcVarA.f(xzbVar, 0);
        xtcVarA.r(str);
        String str2 = y0cVar.b;
        str2.getClass();
        xtcVarA.f(xzbVar, 1);
        xtcVarA.r(str2);
        int i = y0cVar.c;
        xtcVarA.f(xzbVar, 2);
        xtcVarA.j(i);
        xtcVarA.l(xzbVar, 3, y0cVar.d);
        xtcVarA.s(xzbVar);
    }

    @Override // defpackage.t75
    public final pj6[] c() {
        juc jucVar = juc.a;
        return new pj6[]{jucVar, jucVar, q46.a, ya7.a};
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVar = descriptor;
        f22 f22VarS = kw2Var.s(xzbVar);
        int i = 0;
        int iQ = 0;
        String strJ = null;
        String strJ2 = null;
        long jA = 0;
        boolean z = true;
        while (z) {
            int iE = f22VarS.e(xzbVar);
            if (iE == -1) {
                z = false;
            } else if (iE == 0) {
                strJ = f22VarS.j(xzbVar, 0);
                i |= 1;
            } else if (iE == 1) {
                strJ2 = f22VarS.j(xzbVar, 1);
                i |= 2;
            } else if (iE == 2) {
                iQ = f22VarS.q(xzbVar, 2);
                i |= 4;
            } else {
                if (iE != 3) {
                    throw new UnknownFieldException(iE);
                }
                jA = f22VarS.A(xzbVar, 3);
                i |= 8;
            }
        }
        f22VarS.m(xzbVar);
        return new y0c(i, strJ, strJ2, iQ, jA);
    }

    static {
        w0c w0cVar = new w0c();
        a = w0cVar;
        jb9 jb9Var = new jb9("com.google.firebase.sessions.SessionDetails", w0cVar, 4);
        jb9Var.i("sessionId", false);
        jb9Var.i("firstSessionId", false);
        jb9Var.i("sessionIndex", false);
        jb9Var.i(QFTsJPDEnO.zBgnenUB, false);
        descriptor = jb9Var;
    }
}
