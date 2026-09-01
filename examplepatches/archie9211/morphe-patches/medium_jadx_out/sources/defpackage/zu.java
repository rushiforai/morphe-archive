package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zu {
    public static final wlc a = f76.P(0.0f, 0.0f, null, 7);
    public static final wlc b;

    static {
        Map map = qwe.a;
        b = f76.P(0.0f, 0.0f, new vj3(0.4f), 3);
        Float.floatToRawIntBits(1.0f);
        Float.floatToRawIntBits(1.0f);
        Float.floatToRawIntBits(1.0f);
        Float.floatToRawIntBits(1.0f);
    }

    public static final upc a(float f, ww wwVar, String str, x12 x12Var, int i, int i2) {
        if ((i2 & 2) != 0) {
            wwVar = b;
        }
        ww wwVar2 = wwVar;
        if ((i2 & 4) != 0) {
            str = "DpAnimation";
        }
        return c(new vj3(f), d46.k, wwVar2, null, str, x12Var, ((i << 3) & 896) | ((i << 6) & 57344), 8);
    }

    public static final upc b(float f, tj4 tj4Var, String str, x12 x12Var, int i, int i2) {
        tj4 tj4Var2;
        if ((i2 & 8) != 0) {
            str = "FloatAnimation";
        }
        String str2 = str;
        if (tj4Var == a) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(1144115775);
            boolean z = (((i & 896) ^ 384) > 256 && p65Var.c(0.01f)) || (i & 384) == 256;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = f76.P(0.0f, 0.0f, Float.valueOf(0.01f), 3);
                p65Var.j0(objM);
            }
            p65Var.p(false);
            tj4Var2 = (wlc) objM;
        } else {
            p65 p65Var2 = (p65) x12Var;
            p65Var2.Y(1144225701);
            p65Var2.p(false);
            tj4Var2 = tj4Var;
        }
        int i3 = i << 3;
        return c(Float.valueOf(f), d46.i, tj4Var2, null, str2, x12Var, (i & 14) | (57344 & i3) | (i3 & 458752), 0);
    }

    public static final upc c(Object obj, hud hudVar, ww wwVar, Float f, String str, x12 x12Var, int i, int i2) {
        if ((i2 & 8) != 0) {
            f = null;
        }
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = qo7.u(null);
            p65Var.j0(objM);
        }
        l78 l78Var = (l78) objM;
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = new ou(obj, hudVar, f);
            p65Var.j0(objM2);
        }
        ou ouVar = (ou) objM2;
        l78 l78VarY = qo7.y(null, p65Var);
        if (f != null && (wwVar instanceof wlc)) {
            wlc wlcVar = (wlc) wwVar;
            if (!g76.L(wlcVar.c, f)) {
                wwVar = new wlc(wlcVar.a, wlcVar.b, f);
            }
        }
        l78 l78VarY2 = qo7.y(wwVar, p65Var);
        Object objM3 = p65Var.M();
        int i3 = 6;
        if (objM3 == uobVar) {
            objM3 = pwd.e(-1, 6, null);
            p65Var.j0(objM3);
        }
        wj1 wj1Var = (wj1) objM3;
        boolean zH = p65Var.h(wj1Var) | ((((i & 14) ^ 6) > 4 && p65Var.h(obj)) || (i & 6) == 4);
        Object objM4 = p65Var.M();
        if (zH || objM4 == uobVar) {
            objM4 = new n(wj1Var, i3, obj);
            p65Var.j0(objM4);
        }
        kyd.v((m45) objM4, p65Var);
        boolean zH2 = p65Var.h(wj1Var) | p65Var.h(ouVar) | p65Var.f(l78VarY2) | p65Var.f(l78VarY);
        Object objM5 = p65Var.M();
        if (zH2 || objM5 == uobVar) {
            yu yuVar = new yu(wj1Var, ouVar, l78VarY2, l78VarY, null, 0);
            p65Var.j0(yuVar);
            objM5 = yuVar;
        }
        kyd.k(p65Var, (b55) objM5, wj1Var);
        upc upcVar = (upc) l78Var.getValue();
        return upcVar == null ? ouVar.c : upcVar;
    }
}
