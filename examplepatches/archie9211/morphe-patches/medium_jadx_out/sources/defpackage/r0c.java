package defpackage;

import java.util.Map;
import kotlinx.serialization.UnknownFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r0c implements t75 {
    public static final r0c a;
    private static final xzb descriptor;

    static {
        r0c r0cVar = new r0c();
        a = r0cVar;
        jb9 jb9Var = new jb9("com.google.firebase.sessions.SessionData", r0cVar, 3);
        jb9Var.i("sessionDetails", false);
        jb9Var.i("backgroundTime", true);
        jb9Var.i("processDataMap", true);
        descriptor = jb9Var;
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return descriptor;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        t0c t0cVar = (t0c) obj;
        t0cVar.getClass();
        xzb xzbVar = descriptor;
        xtc xtcVarA = xtcVar.a(xzbVar);
        vq6[] vq6VarArr = t0c.d;
        w0c w0cVar = w0c.a;
        y0c y0cVar = t0cVar.a;
        Map map = t0cVar.c;
        zld zldVar = t0cVar.b;
        xtcVarA.o(xzbVar, 0, w0cVar, y0cVar);
        if (xtcVarA.t(xzbVar) || zldVar != null) {
            xtcVarA.n(xzbVar, 1, xld.a, zldVar);
        }
        if (xtcVarA.t(xzbVar) || map != null) {
            xtcVarA.n(xzbVar, 2, (pj6) vq6VarArr[2].getValue(), map);
        }
        xtcVarA.s(xzbVar);
    }

    @Override // defpackage.t75
    public final pj6[] c() {
        return new pj6[]{w0c.a, vc2.J(xld.a), vc2.J((pj6) t0c.d[2].getValue())};
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVar = descriptor;
        f22 f22VarS = kw2Var.s(xzbVar);
        vq6[] vq6VarArr = t0c.d;
        y0c y0cVar = null;
        boolean z = true;
        int i = 0;
        zld zldVar = null;
        Map map = null;
        while (z) {
            int iE = f22VarS.e(xzbVar);
            if (iE == -1) {
                z = false;
            } else if (iE == 0) {
                y0cVar = (y0c) f22VarS.p(xzbVar, 0, w0c.a, y0cVar);
                i |= 1;
            } else if (iE == 1) {
                zldVar = (zld) f22VarS.v(xzbVar, 1, xld.a, zldVar);
                i |= 2;
            } else {
                if (iE != 2) {
                    throw new UnknownFieldException(iE);
                }
                map = (Map) f22VarS.v(xzbVar, 2, (pj6) vq6VarArr[2].getValue(), map);
                i |= 4;
            }
        }
        f22VarS.m(xzbVar);
        return new t0c(i, y0cVar, zldVar, map);
    }
}
