package defpackage;

import java.io.Serializable;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ay6 implements cy6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Serializable c;
    public final /* synthetic */ Object d;

    public /* synthetic */ ay6(Object obj, Serializable serializable, Object obj2, int i) {
        this.a = i;
        this.b = obj;
        this.c = serializable;
        this.d = obj2;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        int i = this.a;
        Object obj = this.d;
        Serializable serializable = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ry6 ry6Var = (ry6) obj2;
                rya ryaVar = (rya) serializable;
                x45 x45Var = (x45) obj;
                int i2 = by6.a[ux6Var.ordinal()];
                if (i2 == 1) {
                    ryaVar.a = x45Var.invoke(ry6Var);
                    break;
                } else if (i2 == 2) {
                    zl0 zl0Var = (zl0) ryaVar.a;
                    if (zl0Var != null) {
                        zl0Var.a();
                    }
                    ryaVar.a = null;
                    break;
                }
                break;
            default:
                px7 px7Var = (px7) obj2;
                vx6 vx6Var = (vx6) serializable;
                ly7 ly7Var = (ly7) obj;
                px7Var.getClass();
                Runnable runnable = px7Var.a;
                CopyOnWriteArrayList copyOnWriteArrayList = px7Var.b;
                if (ux6Var == ux6.upTo(vx6Var)) {
                    copyOnWriteArrayList.add(ly7Var);
                    runnable.run();
                } else if (ux6Var == ux6.ON_DESTROY) {
                    px7Var.b(ly7Var);
                } else if (ux6Var == ux6.downFrom(vx6Var)) {
                    copyOnWriteArrayList.remove(ly7Var);
                    runnable.run();
                }
                break;
        }
    }
}
