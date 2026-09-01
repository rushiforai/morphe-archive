package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nmb {
    public static final omb a = new omb(qb8.a, z46.m);

    public static final omb a(g70 g70Var, zq0 zq0Var, x12 x12Var, int i) {
        if (g70Var.equals(qb8.a) && g76.L(zq0Var, z46.m)) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(-1073830487);
            p65Var.p(false);
            return a;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-1073779616);
        boolean z = true;
        boolean z2 = (((i & 14) ^ 6) > 4 && p65Var2.f(g70Var)) || (i & 6) == 4;
        if ((((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) <= 32 || !p65Var2.f(zq0Var)) && (i & 48) != 32) {
            z = false;
        }
        boolean z3 = z2 | z;
        Object objM = p65Var2.M();
        if (z3 || objM == w12.a) {
            objM = new omb(g70Var, zq0Var);
            p65Var2.j0(objM);
        }
        omb ombVar = (omb) objM;
        p65Var2.p(false);
        return ombVar;
    }
}
