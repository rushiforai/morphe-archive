package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ovd extends jud {
    public final /* synthetic */ int a;
    public final boolean b;

    public /* synthetic */ ovd(int i, boolean z) {
        this.a = i;
        this.b = z;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        switch (this.a) {
            case 0:
                if (gd6Var.p0() != jd6.NULL) {
                    return Double.valueOf(gd6Var.nextDouble());
                }
                gd6Var.a0();
                return null;
            default:
                if (gd6Var.p0() != jd6.NULL) {
                    return Float.valueOf((float) gd6Var.nextDouble());
                }
                gd6Var.a0();
                return null;
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        boolean z = this.b;
        switch (i) {
            case 0:
                Number number = (Number) obj;
                if (number != null) {
                    double dDoubleValue = number.doubleValue();
                    if (z) {
                        qvd.a(dDoubleValue);
                    }
                    yd6Var.j0(dDoubleValue);
                } else {
                    yd6Var.Q();
                }
                break;
            default:
                Number numberValueOf = (Number) obj;
                if (numberValueOf != null) {
                    float fFloatValue = numberValueOf.floatValue();
                    if (z) {
                        qvd.a(fFloatValue);
                    }
                    if (!(numberValueOf instanceof Float)) {
                        numberValueOf = Float.valueOf(fFloatValue);
                    }
                    yd6Var.z0(numberValueOf);
                } else {
                    yd6Var.Q();
                }
                break;
        }
    }
}
