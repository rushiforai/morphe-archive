package a5;

import android.view.WindowInsets;
import androidx.core.graphics.Insets;

/* loaded from: classes.dex */
public class d2 extends c2 {
    public Insets n;
    public Insets o;

    /* renamed from: p, reason: collision with root package name */
    public Insets f272p;

    public d2(h2 h2Var, WindowInsets windowInsets) {
        super(h2Var, windowInsets);
        this.n = null;
        this.o = null;
        this.f272p = null;
    }

    @Override // a5.f2
    public Insets i() {
        if (this.o == null) {
            this.o = Insets.toCompatInsets(this.f395c.getMandatorySystemGestureInsets());
        }
        return this.o;
    }

    @Override // a5.f2
    public Insets k() {
        if (this.n == null) {
            this.n = Insets.toCompatInsets(this.f395c.getSystemGestureInsets());
        }
        return this.n;
    }

    @Override // a5.f2
    public Insets m() {
        if (this.f272p == null) {
            this.f272p = Insets.toCompatInsets(this.f395c.getTappableElementInsets());
        }
        return this.f272p;
    }

    @Override // a5.z1, a5.f2
    public h2 n(int i5, int i11, int i12, int i13) {
        return h2.g(null, this.f395c.inset(i5, i11, i12, i13));
    }

    @Override // a5.a2, a5.f2
    public void u(Insets insets) {
    }

    public d2(h2 h2Var, d2 d2Var) {
        super(h2Var, d2Var);
        this.n = null;
        this.o = null;
        this.f272p = null;
    }
}
