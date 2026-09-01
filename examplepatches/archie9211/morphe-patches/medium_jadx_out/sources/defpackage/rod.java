package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rod {
    public static final float a;
    public static final float b;
    public static final float c;
    public static final float d;
    public static final float e;

    static {
        nyd nydVar = e10.a;
        a = 64.0f;
        b = 64.0f;
        nyd nydVar2 = d10.a;
        c = 112.0f;
        d = 64.0f;
        nyd nydVar3 = c10.a;
        e = 152.0f;
    }

    public static m54 a(x12 x12Var) {
        vod vodVarH = a10.h(x12Var);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new e73(1);
            p65Var.j0(objM);
        }
        m45 m45Var = (m45) objM;
        wlc wlcVarN = ek7.N(i48.DefaultEffects, x12Var);
        xv2 xv2VarA = plc.a(x12Var);
        boolean zF = ((p65) x12Var).f(vodVarH) | ((p65) x12Var).f(m45Var);
        p65 p65Var2 = (p65) x12Var;
        boolean zF2 = zF | p65Var2.f(wlcVarN) | p65Var2.f(xv2VarA);
        Object objM2 = p65Var2.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = new m54(vodVarH, wlcVarN, xv2VarA, m45Var);
            p65Var2.j0(objM2);
        }
        return (m54) objM2;
    }

    public static zy6 b(x12 x12Var) {
        return new zy6(hk7.v(x12Var), ur7.h | 16);
    }

    public static qod c(long j, long j2, x12 x12Var, int i) {
        long j3 = (i & 2) != 0 ? uu1.h : j2;
        long j4 = uu1.h;
        fv1 fv1Var = (fv1) ((p65) x12Var).j(iv1.a);
        qod qodVar = fv1Var.c0;
        if (qodVar == null) {
            qod qodVar2 = new qod(iv1.c(fv1Var, f10.a), iv1.c(fv1Var, f10.c), iv1.c(fv1Var, f10.b), iv1.c(fv1Var, f10.e), iv1.c(fv1Var, f10.f), iv1.c(fv1Var, f10.d));
            fv1Var.c0 = qodVar2;
            qodVar = qodVar2;
        }
        long j5 = j != 16 ? j : qodVar.a;
        if (j3 == 16) {
            j3 = qodVar.b;
        }
        long j6 = j3;
        long j7 = j4 != 16 ? j4 : qodVar.c;
        long j8 = j4 != 16 ? j4 : qodVar.d;
        long j9 = j4 != 16 ? j4 : qodVar.e;
        if (j4 == 16) {
            j4 = qodVar.f;
        }
        return new qod(j5, j6, j7, j8, j9, j4);
    }
}
