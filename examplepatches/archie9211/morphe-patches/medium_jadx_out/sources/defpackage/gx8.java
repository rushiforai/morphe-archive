package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gx8 {
    public static final e32 a = new e32(new hb8(17));

    public static final fx8 a(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(282942128);
        fp fpVar = (fp) p65Var.j(a);
        if (fpVar == null) {
            p65Var.p(false);
            return null;
        }
        boolean zF = p65Var.f(fpVar);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            ep epVar = new ep(fpVar.a, fpVar.b, fpVar.c, fpVar.d);
            p65Var.j0(epVar);
            objM = epVar;
        }
        fx8 fx8Var = (fx8) objM;
        p65Var.p(false);
        return fx8Var;
    }
}
