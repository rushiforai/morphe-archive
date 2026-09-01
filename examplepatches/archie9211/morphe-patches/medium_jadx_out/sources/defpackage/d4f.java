package defpackage;

import android.view.View;
import android.view.WindowInsetsAnimation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d4f extends e4f {
    public final WindowInsetsAnimation e;

    public d4f(WindowInsetsAnimation windowInsetsAnimation) {
        super(0, null, 0L);
        this.e = windowInsetsAnimation;
    }

    public static b36 f(WindowInsetsAnimation.Bounds bounds) {
        return b36.d(bounds.getUpperBound());
    }

    public static b36 g(WindowInsetsAnimation.Bounds bounds) {
        return b36.d(bounds.getLowerBound());
    }

    public static void h(View view, up1 up1Var) {
        view.setWindowInsetsAnimationCallback(up1Var != null ? new c4f(up1Var) : null);
    }

    @Override // defpackage.e4f
    public final float a() {
        return this.e.getAlpha();
    }

    @Override // defpackage.e4f
    public final long b() {
        return this.e.getDurationMillis();
    }

    @Override // defpackage.e4f
    public final float c() {
        return this.e.getInterpolatedFraction();
    }

    @Override // defpackage.e4f
    public final int d() {
        return this.e.getTypeMask();
    }

    @Override // defpackage.e4f
    public final void e(float f) {
        this.e.setFraction(f);
    }
}
