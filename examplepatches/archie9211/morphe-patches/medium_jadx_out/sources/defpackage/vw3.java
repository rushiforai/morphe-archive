package defpackage;

import android.graphics.Rect;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vw3 {
    public int a;
    public final Object b;
    public final Object c;

    public vw3(sxa sxaVar) {
        this.a = Integer.MIN_VALUE;
        this.c = new Rect();
        this.b = sxaVar;
    }

    public static vw3 b(sxa sxaVar, int i) {
        if (i == 0) {
            return new iw8(sxaVar, 0);
        }
        int i2 = 1;
        if (i == 1) {
            return new iw8(sxaVar, i2);
        }
        ay0.e("invalid orientation");
        return null;
    }

    public abstract void a(anb anbVar);

    public abstract void c(anb anbVar);

    public abstract int d(View view);

    public abstract int e(View view);

    public abstract int f(View view);

    public abstract int g(View view);

    public abstract int h();

    public abstract int i();

    public abstract int j();

    public abstract int k();

    public abstract int l();

    public abstract int m();

    public abstract int n();

    public abstract int o(View view);

    public abstract int p(View view);

    public abstract void q(int i);

    public abstract void r(anb anbVar);

    public abstract void s(anb anbVar);

    public abstract void t(anb anbVar);

    public abstract void u(anb anbVar);

    public abstract hlb v(anb anbVar);

    public vw3(String str, int i, String str2) {
        this.a = i;
        this.b = str;
        this.c = str2;
    }

    public vw3(xw3 xw3Var) {
        this.a = 0;
        this.c = new cz2();
        this.b = xw3Var;
    }
}
