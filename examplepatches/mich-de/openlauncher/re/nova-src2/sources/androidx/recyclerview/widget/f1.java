package androidx.recyclerview.widget;

import android.graphics.Rect;
import android.view.View;

/* loaded from: classes.dex */
public abstract class f1 {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f14956a;

    /* renamed from: b, reason: collision with root package name */
    public int f14957b = Integer.MIN_VALUE;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f14958c = new Rect();

    public f1(z1 z1Var) {
        this.f14956a = z1Var;
    }

    public static f1 a(z1 z1Var, int i5) {
        if (i5 == 0) {
            return new d1(z1Var);
        }
        if (i5 == 1) {
            return new e1(z1Var);
        }
        throw new IllegalArgumentException("invalid orientation");
    }

    public abstract int b(View view);

    public abstract int c(View view);

    public abstract int d(View view);

    public abstract int e(View view);

    public abstract int f();

    public abstract int g();

    public abstract int h();

    public abstract int i();

    public abstract int j();

    public abstract int k();

    public abstract int l();

    public final int m() {
        if (Integer.MIN_VALUE == this.f14957b) {
            return 0;
        }
        return l() - this.f14957b;
    }

    public abstract int n(View view);

    public abstract int o(View view);

    public abstract void p(int i5);
}
