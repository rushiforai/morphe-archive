package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wec {
    public static final wlc a = f76.P(0.0f, 0.0f, null, 7);

    public static final upc a(long j, tj4 tj4Var, String str, x12 x12Var, int i, int i2) {
        if ((i2 & 2) != 0) {
            tj4Var = a;
        }
        tj4 tj4Var2 = tj4Var;
        if ((i2 & 4) != 0) {
            str = "ColorAnimation";
        }
        String str2 = str;
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(uu1.e(j));
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            hud hudVar = new hud(fn.s, new ce(9, uu1.e(j)));
            p65Var.j0(hudVar);
            objM = hudVar;
        }
        return zu.c(new uu1(j), (hud) objM, tj4Var2, null, str2, p65Var, ((i << 3) & 896) | ((i << 6) & 57344), 8);
    }
}
