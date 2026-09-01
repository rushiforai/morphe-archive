package defpackage;

import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h03 implements cy6 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public h03(hy6 hy6Var) {
        this.a = 3;
        this.b = hy6Var;
        zn1 zn1Var = zn1.c;
        Class<?> cls = hy6Var.getClass();
        xn1 xn1Var = (xn1) zn1Var.a.get(cls);
        this.c = xn1Var == null ? zn1Var.a(cls, null) : xn1Var;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        int i = this.a;
        Object obj = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                f03 f03Var = (f03) obj;
                switch (g03.a[ux6Var.ordinal()]) {
                    case 1:
                        f03Var.onCreate(iy6Var);
                        break;
                    case 2:
                        f03Var.onStart(iy6Var);
                        break;
                    case 3:
                        f03Var.onResume(iy6Var);
                        break;
                    case 4:
                        f03Var.onPause(iy6Var);
                        break;
                    case 5:
                        f03Var.onStop(iy6Var);
                        break;
                    case 6:
                        f03Var.onDestroy(iy6Var);
                        break;
                    case 7:
                        ay0.e("ON_ANY must not been send by anybody");
                        break;
                    default:
                        ygf.a();
                        break;
                }
                cy6 cy6Var = (cy6) obj2;
                if (cy6Var != null) {
                    cy6Var.f(iy6Var, ux6Var);
                }
                break;
            case 1:
                if (ux6Var == ux6.ON_START) {
                    ((wx6) obj).b(this);
                    ((epb) obj2).d();
                }
                break;
            case 2:
                cq8 cq8Var = (cq8) obj;
                int i2 = hq8.a[ux6Var.ordinal()];
                if (i2 == 1) {
                    cq8Var.g(true);
                    break;
                } else if (i2 == 2) {
                    cq8Var.g(false);
                    break;
                } else if (i2 == 3) {
                    cq8Var.e();
                    ((wx6) obj2).b(this);
                    break;
                }
                break;
            default:
                hy6 hy6Var = (hy6) obj;
                HashMap map = ((xn1) obj2).a;
                xn1.a((List) map.get(ux6Var), iy6Var, ux6Var, hy6Var);
                xn1.a((List) map.get(ux6.ON_ANY), iy6Var, ux6Var, hy6Var);
                break;
        }
    }

    public /* synthetic */ h03(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public h03(cq8 cq8Var, iq8 iq8Var, wx6 wx6Var) {
        this.a = 2;
        this.b = cq8Var;
        this.c = wx6Var;
    }
}
