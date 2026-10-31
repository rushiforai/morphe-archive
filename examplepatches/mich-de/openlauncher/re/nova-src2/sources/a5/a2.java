package a5;

import android.view.WindowInsets;
import androidx.core.graphics.Insets;

/* loaded from: classes.dex */
public class a2 extends z1 {

    /* renamed from: m, reason: collision with root package name */
    public Insets f256m;

    public a2(h2 h2Var, WindowInsets windowInsets) {
        super(h2Var, windowInsets);
        this.f256m = null;
    }

    @Override // a5.f2
    public h2 b() {
        return h2.g(null, this.f395c.consumeStableInsets());
    }

    @Override // a5.f2
    public h2 c() {
        return h2.g(null, this.f395c.consumeSystemWindowInsets());
    }

    @Override // a5.f2
    public final Insets j() {
        if (this.f256m == null) {
            WindowInsets windowInsets = this.f395c;
            this.f256m = Insets.of(windowInsets.getStableInsetLeft(), windowInsets.getStableInsetTop(), windowInsets.getStableInsetRight(), windowInsets.getStableInsetBottom());
        }
        return this.f256m;
    }

    @Override // a5.f2
    public boolean o() {
        return this.f395c.isConsumed();
    }

    @Override // a5.f2
    public void u(Insets insets) {
        this.f256m = insets;
    }

    public a2(h2 h2Var, a2 a2Var) {
        super(h2Var, a2Var);
        this.f256m = null;
        this.f256m = a2Var.f256m;
    }
}
