package a5;

import androidx.core.graphics.Insets;

/* loaded from: classes.dex */
public abstract class y1 {

    /* renamed from: a, reason: collision with root package name */
    public final h2 f382a;

    /* renamed from: b, reason: collision with root package name */
    public Insets[] f383b;

    public y1() {
        this(new h2((h2) null));
    }

    public final void a() {
        Insets[] insetsArr = this.f383b;
        if (insetsArr != null) {
            Insets insetsG = insetsArr[0];
            Insets insetsG2 = insetsArr[1];
            h2 h2Var = this.f382a;
            if (insetsG2 == null) {
                insetsG2 = h2Var.f296a.g(2);
            }
            if (insetsG == null) {
                insetsG = h2Var.f296a.g(1);
            }
            g(Insets.max(insetsG, insetsG2));
            Insets insets = this.f383b[fg.a.C(16)];
            if (insets != null) {
                f(insets);
            }
            Insets insets2 = this.f383b[fg.a.C(32)];
            if (insets2 != null) {
                d(insets2);
            }
            Insets insets3 = this.f383b[fg.a.C(64)];
            if (insets3 != null) {
                h(insets3);
            }
        }
    }

    public abstract h2 b();

    public void c(int i5, Insets insets) {
        if (this.f383b == null) {
            this.f383b = new Insets[9];
        }
        for (int i11 = 1; i11 <= 256; i11 <<= 1) {
            if ((i5 & i11) != 0) {
                this.f383b[fg.a.C(i11)] = insets;
            }
        }
    }

    public void d(Insets insets) {
    }

    public abstract void e(Insets insets);

    public void f(Insets insets) {
    }

    public abstract void g(Insets insets);

    public void h(Insets insets) {
    }

    public y1(h2 h2Var) {
        this.f382a = h2Var;
    }
}
