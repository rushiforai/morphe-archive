package a5;

import android.view.View;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;

/* loaded from: classes.dex */
public final class e2 extends d2 {

    /* renamed from: q, reason: collision with root package name */
    public static final h2 f277q = h2.g(null, WindowInsets.CONSUMED);

    public e2(h2 h2Var, WindowInsets windowInsets) {
        super(h2Var, windowInsets);
    }

    @Override // a5.z1, a5.f2
    public final void d(View view) {
    }

    @Override // a5.z1, a5.f2
    public Insets g(int i5) {
        return Insets.toCompatInsets(this.f395c.getInsets(g2.a(i5)));
    }

    @Override // a5.z1, a5.f2
    public Insets h(int i5) {
        return Insets.toCompatInsets(this.f395c.getInsetsIgnoringVisibility(g2.a(i5)));
    }

    @Override // a5.z1, a5.f2
    public boolean q(int i5) {
        return this.f395c.isVisible(g2.a(i5));
    }

    public e2(h2 h2Var, e2 e2Var) {
        super(h2Var, e2Var);
    }
}
