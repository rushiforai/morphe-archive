package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class uv1 {
    public static final wv1 a = new wv1(qb8.c, z46.p);

    public static final wv1 a(j70 j70Var, yq0 yq0Var, x12 x12Var, int i) {
        if (j70Var.equals(qb8.c) && yq0Var.equals(z46.p)) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(-1446604504);
            p65Var.p(false);
            return a;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-1446550657);
        boolean z = true;
        boolean z2 = (((i & 14) ^ 6) > 4 && p65Var2.f(j70Var)) || (i & 6) == 4;
        if ((((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) <= 32 || !p65Var2.f(yq0Var)) && (i & 48) != 32) {
            z = false;
        }
        boolean z3 = z2 | z;
        Object objM = p65Var2.M();
        if (z3 || objM == w12.a) {
            objM = new wv1(j70Var, yq0Var);
            p65Var2.j0(objM);
        }
        wv1 wv1Var = (wv1) objM;
        p65Var2.p(false);
        return wv1Var;
    }
}
