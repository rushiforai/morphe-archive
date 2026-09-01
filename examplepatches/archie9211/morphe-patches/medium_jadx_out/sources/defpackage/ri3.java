package defpackage;

import android.graphics.PointF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ri3 implements mqe {
    public static final ri3 a = new ri3();
    public static final hx4 b = hx4.d1("t", "f", "s", "j", "tr", "lh", "ls", "fc", "sc", "sw", "of", "ps", "sz");

    @Override // defpackage.mqe
    public final Object L0(id6 id6Var, float f) {
        pi3 pi3Var = pi3.CENTER;
        id6Var.m();
        String strQ = null;
        float fNextDouble = 0.0f;
        float fNextDouble2 = 0.0f;
        float fNextDouble3 = 0.0f;
        float fNextDouble4 = 0.0f;
        int iNextInt = 0;
        int iA = 0;
        int iA2 = 0;
        boolean zNextBoolean = true;
        String strQ2 = null;
        PointF pointF = null;
        PointF pointF2 = null;
        while (id6Var.hasNext()) {
            switch (id6Var.N(b)) {
                case 0:
                    strQ = id6Var.q();
                    break;
                case 1:
                    strQ2 = id6Var.q();
                    break;
                case 2:
                    fNextDouble = (float) id6Var.nextDouble();
                    break;
                case 3:
                    int iNextInt2 = id6Var.nextInt();
                    pi3 pi3Var2 = pi3.CENTER;
                    pi3Var = (iNextInt2 <= pi3Var2.ordinal() && iNextInt2 >= 0) ? pi3.values()[iNextInt2] : pi3Var2;
                    break;
                case 4:
                    iNextInt = id6Var.nextInt();
                    break;
                case 5:
                    fNextDouble2 = (float) id6Var.nextDouble();
                    break;
                case 6:
                    fNextDouble3 = (float) id6Var.nextDouble();
                    break;
                case 7:
                    iA = wd6.a(id6Var);
                    break;
                case 8:
                    iA2 = wd6.a(id6Var);
                    break;
                case 9:
                    fNextDouble4 = (float) id6Var.nextDouble();
                    break;
                case 10:
                    zNextBoolean = id6Var.nextBoolean();
                    break;
                case 11:
                    id6Var.f();
                    pointF = new PointF(((float) id6Var.nextDouble()) * f, ((float) id6Var.nextDouble()) * f);
                    id6Var.p();
                    break;
                case 12:
                    id6Var.f();
                    pointF2 = new PointF(((float) id6Var.nextDouble()) * f, ((float) id6Var.nextDouble()) * f);
                    id6Var.p();
                    break;
                default:
                    id6Var.Q();
                    id6Var.v();
                    break;
            }
        }
        id6Var.B();
        qi3 qi3Var = new qi3();
        qi3Var.a = strQ;
        qi3Var.b = strQ2;
        qi3Var.c = fNextDouble;
        qi3Var.d = pi3Var;
        qi3Var.e = iNextInt;
        qi3Var.f = fNextDouble2;
        qi3Var.g = fNextDouble3;
        qi3Var.h = iA;
        qi3Var.i = iA2;
        qi3Var.j = fNextDouble4;
        qi3Var.k = zNextBoolean;
        qi3Var.l = pointF;
        qi3Var.m = pointF2;
        return qi3Var;
    }
}
