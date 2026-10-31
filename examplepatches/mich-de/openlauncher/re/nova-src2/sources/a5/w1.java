package a5;

import android.view.WindowInsets;
import androidx.core.graphics.Insets;

/* loaded from: classes.dex */
public class w1 extends y1 {

    /* renamed from: c, reason: collision with root package name */
    public final WindowInsets.Builder f381c;

    public w1() {
        this.f381c = v1.e();
    }

    @Override // a5.y1
    public h2 b() {
        a();
        h2 h2VarG = h2.g(null, this.f381c.build());
        h2VarG.f296a.r(this.f383b);
        return h2VarG;
    }

    @Override // a5.y1
    public void d(Insets insets) {
        this.f381c.setMandatorySystemGestureInsets(insets.toPlatformInsets());
    }

    @Override // a5.y1
    public void e(Insets insets) {
        this.f381c.setStableInsets(insets.toPlatformInsets());
    }

    @Override // a5.y1
    public void f(Insets insets) {
        this.f381c.setSystemGestureInsets(insets.toPlatformInsets());
    }

    @Override // a5.y1
    public void g(Insets insets) {
        this.f381c.setSystemWindowInsets(insets.toPlatformInsets());
    }

    @Override // a5.y1
    public void h(Insets insets) {
        this.f381c.setTappableElementInsets(insets.toPlatformInsets());
    }

    public w1(h2 h2Var) {
        WindowInsets.Builder builderE;
        super(h2Var);
        WindowInsets windowInsetsF = h2Var.f();
        if (windowInsetsF != null) {
            builderE = a4.a.f(windowInsetsF);
        } else {
            builderE = v1.e();
        }
        this.f381c = builderE;
    }
}
