package a5;

import android.animation.ValueAnimator;
import android.os.Build;
import android.view.View;
import android.view.animation.PathInterpolator;
import androidx.core.graphics.Insets;
import java.util.Collections;

/* loaded from: classes2.dex */
public final class m1 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t1 f323a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h2 f324b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ h2 f325c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f326d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ View f327e;

    public m1(t1 t1Var, h2 h2Var, h2 h2Var2, int i5, View view) {
        this.f323a = t1Var;
        this.f324b = h2Var;
        this.f325c = h2Var2;
        this.f326d = i5;
        this.f327e = view;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float animatedFraction = valueAnimator.getAnimatedFraction();
        t1 t1Var = this.f323a;
        s1 s1Var = t1Var.f369a;
        s1Var.d(animatedFraction);
        h2 h2Var = this.f324b;
        f2 f2Var = h2Var.f296a;
        float fB = s1Var.b();
        PathInterpolator pathInterpolator = p1.f342e;
        int i5 = Build.VERSION.SDK_INT;
        y1 x1Var = i5 >= 30 ? new x1(h2Var) : i5 >= 29 ? new w1(h2Var) : new u1(h2Var);
        for (int i11 = 1; i11 <= 256; i11 <<= 1) {
            if ((this.f326d & i11) == 0) {
                x1Var.c(i11, f2Var.g(i11));
            } else {
                Insets insetsG = f2Var.g(i11);
                Insets insetsG2 = this.f325c.f296a.g(i11);
                float f11 = 1.0f - fB;
                x1Var.c(i11, h2.e(insetsG, (int) (((insetsG.left - insetsG2.left) * f11) + 0.5d), (int) (((insetsG.top - insetsG2.top) * f11) + 0.5d), (int) (((insetsG.right - insetsG2.right) * f11) + 0.5d), (int) (((insetsG.bottom - insetsG2.bottom) * f11) + 0.5d)));
            }
        }
        p1.g(this.f327e, x1Var.b(), Collections.singletonList(t1Var));
    }
}
