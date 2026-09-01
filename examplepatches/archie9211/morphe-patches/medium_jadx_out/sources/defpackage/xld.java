package defpackage;

import kotlinx.serialization.UnknownFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xld implements t75 {
    public static final xld a;
    private static final xzb descriptor;

    static {
        xld xldVar = new xld();
        a = xldVar;
        jb9 jb9Var = new jb9("com.google.firebase.sessions.Time", xldVar, 3);
        jb9Var.i("ms", false);
        jb9Var.i("us", true);
        jb9Var.i("seconds", true);
        descriptor = jb9Var;
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return descriptor;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        zld zldVar = (zld) obj;
        zldVar.getClass();
        xzb xzbVar = descriptor;
        xtc xtcVarA = xtcVar.a(xzbVar);
        long j = zldVar.a;
        long j2 = zldVar.c;
        long j3 = zldVar.b;
        xtcVarA.l(xzbVar, 0, j);
        if (xtcVarA.t(xzbVar) || j3 != j * 1000) {
            xtcVarA.l(xzbVar, 1, j3);
        }
        if (xtcVarA.t(xzbVar) || j2 != j / 1000) {
            xtcVarA.l(xzbVar, 2, j2);
        }
        xtcVarA.s(xzbVar);
    }

    @Override // defpackage.t75
    public final pj6[] c() {
        ya7 ya7Var = ya7.a;
        return new pj6[]{ya7Var, ya7Var, ya7Var};
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVar = descriptor;
        f22 f22VarS = kw2Var.s(xzbVar);
        int i = 0;
        long jA = 0;
        long jA2 = 0;
        long jA3 = 0;
        boolean z = true;
        while (z) {
            int iE = f22VarS.e(xzbVar);
            if (iE == -1) {
                z = false;
            } else if (iE == 0) {
                jA = f22VarS.A(xzbVar, 0);
                i |= 1;
            } else if (iE == 1) {
                jA2 = f22VarS.A(xzbVar, 1);
                i |= 2;
            } else {
                if (iE != 2) {
                    throw new UnknownFieldException(iE);
                }
                jA3 = f22VarS.A(xzbVar, 2);
                i |= 4;
            }
        }
        f22VarS.m(xzbVar);
        return new zld(i, jA, jA2, jA3);
    }
}
