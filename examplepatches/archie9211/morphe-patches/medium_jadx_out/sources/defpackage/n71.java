package defpackage;

import android.animation.ValueAnimator;
import android.view.View;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n71 implements Runnable {
    public final /* synthetic */ int a = 1;
    public final Object b;
    public final Object c;
    public final Object d;
    public final Object e;

    public n71(File file, pkf pkfVar, f66 f66Var, rv8 rv8Var) {
        f66Var.getClass();
        rv8Var.getClass();
        this.b = file;
        this.c = pkfVar;
        this.d = f66Var;
        this.e = rv8Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Object obj = this.c;
        int i2 = 0;
        Object obj2 = this.e;
        Object obj3 = this.d;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                p71 p71Var = (p71) ((zg7) obj2).b;
                sx7 sx7Var = (sx7) obj;
                o71 o71Var = (o71) obj4;
                if (o71Var != null) {
                    p71Var.z = true;
                    o71Var.b.c(false);
                    p71Var.z = false;
                }
                if (sx7Var.isEnabled() && sx7Var.hasSubMenu()) {
                    ((lx7) obj3).q(sx7Var, null, 4);
                    break;
                }
                break;
            case 1:
                b4f.i((View) obj4, (f4f) obj, (mya) obj3);
                ((ValueAnimator) obj2).start();
                break;
            default:
                f66 f66Var = (f66) obj3;
                if (((File) obj4) != null) {
                    jq7.u(f66Var, (rv8) obj2, new v5f(i2, this));
                } else {
                    f49.K(f66Var, d66.WARN, e66.MAINTAINER, b18.r, null, false, 56);
                }
                break;
        }
    }

    public n71(zg7 zg7Var, o71 o71Var, sx7 sx7Var, lx7 lx7Var) {
        this.e = zg7Var;
        this.b = o71Var;
        this.c = sx7Var;
        this.d = lx7Var;
    }

    public n71(View view, f4f f4fVar, mya myaVar, ValueAnimator valueAnimator) {
        this.b = view;
        this.c = f4fVar;
        this.d = myaVar;
        this.e = valueAnimator;
    }
}
