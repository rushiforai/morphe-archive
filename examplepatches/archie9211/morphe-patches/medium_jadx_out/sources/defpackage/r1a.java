package defpackage;

import com.drew.metadata.mp4.Mp4BoxTypes;
import kotlinx.serialization.UnknownFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r1a implements t75 {
    public static final r1a a;
    private static final xzb descriptor;

    static {
        r1a r1aVar = new r1a();
        a = r1aVar;
        jb9 jb9Var = new jb9("com.google.firebase.sessions.ProcessData", r1aVar, 2);
        jb9Var.i("pid", false);
        jb9Var.i(Mp4BoxTypes.BOX_USER_DEFINED, false);
        descriptor = jb9Var;
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return descriptor;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        t1a t1aVar = (t1a) obj;
        t1aVar.getClass();
        xzb xzbVar = descriptor;
        xtc xtcVarA = xtcVar.a(xzbVar);
        int i = t1aVar.a;
        xtcVarA.f(xzbVar, 0);
        xtcVarA.j(i);
        String str = t1aVar.b;
        str.getClass();
        xtcVarA.f(xzbVar, 1);
        xtcVarA.r(str);
        xtcVarA.s(xzbVar);
    }

    @Override // defpackage.t75
    public final pj6[] c() {
        return new pj6[]{q46.a, juc.a};
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVar = descriptor;
        f22 f22VarS = kw2Var.s(xzbVar);
        String strJ = null;
        boolean z = true;
        int i = 0;
        int iQ = 0;
        while (z) {
            int iE = f22VarS.e(xzbVar);
            if (iE == -1) {
                z = false;
            } else if (iE == 0) {
                iQ = f22VarS.q(xzbVar, 0);
                i |= 1;
            } else {
                if (iE != 1) {
                    throw new UnknownFieldException(iE);
                }
                strJ = f22VarS.j(xzbVar, 1);
                i |= 2;
            }
        }
        f22VarS.m(xzbVar);
        return new t1a(i, iQ, strJ);
    }
}
