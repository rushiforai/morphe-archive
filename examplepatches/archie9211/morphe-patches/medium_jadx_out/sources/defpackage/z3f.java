package defpackage;

import android.animation.ValueAnimator;
import android.os.Build;
import android.view.View;
import android.view.animation.PathInterpolator;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z3f implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ f4f a;
    public final /* synthetic */ z4f b;
    public final /* synthetic */ z4f c;
    public final /* synthetic */ int d;
    public final /* synthetic */ View e;

    public z3f(f4f f4fVar, z4f z4fVar, z4f z4fVar2, int i, View view) {
        this.a = f4fVar;
        this.b = z4fVar;
        this.c = z4fVar2;
        this.d = i;
        this.e = view;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float animatedFraction = valueAnimator.getAnimatedFraction();
        f4f f4fVar = this.a;
        e4f e4fVar = f4fVar.a;
        e4fVar.e(animatedFraction);
        float fC = e4fVar.c();
        PathInterpolator pathInterpolator = b4f.e;
        int i = Build.VERSION.SDK_INT;
        z4f z4fVar = this.b;
        n4f m4fVar = i >= 36 ? new m4f(z4fVar) : i >= 35 ? new l4f(z4fVar) : i >= 34 ? new k4f(z4fVar) : i >= 31 ? new j4f(z4fVar) : i >= 30 ? new i4f(z4fVar) : i >= 29 ? new h4f(z4fVar) : new g4f(z4fVar);
        for (int i2 = 1; i2 <= 512; i2 <<= 1) {
            int i3 = this.d & i2;
            w4f w4fVar = z4fVar.a;
            if (i3 == 0) {
                m4fVar.d(i2, w4fVar.i(i2));
            } else {
                b36 b36VarI = w4fVar.i(i2);
                b36 b36VarI2 = this.c.a.i(i2);
                float f = 1.0f - fC;
                m4fVar.d(i2, z4f.e(b36VarI, (int) (((double) ((b36VarI.a - b36VarI2.a) * f)) + 0.5d), (int) (((double) ((b36VarI.b - b36VarI2.b) * f)) + 0.5d), (int) (((double) ((b36VarI.c - b36VarI2.c) * f)) + 0.5d), (int) (((double) ((b36VarI.d - b36VarI2.d) * f)) + 0.5d)));
            }
        }
        b4f.h(this.e, m4fVar.b(), Collections.singletonList(f4fVar));
    }
}
