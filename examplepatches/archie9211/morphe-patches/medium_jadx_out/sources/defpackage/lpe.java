package defpackage;

import android.graphics.drawable.Animatable2;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lpe extends Animatable2.AnimationCallback {
    public final /* synthetic */ m45 a;
    public final /* synthetic */ m45 b;

    public lpe(m45 m45Var, m45 m45Var2) {
        this.a = m45Var;
        this.b = m45Var2;
    }

    @Override // android.graphics.drawable.Animatable2.AnimationCallback
    public final void onAnimationEnd(Drawable drawable) {
        m45 m45Var = this.b;
        if (m45Var != null) {
            m45Var.invoke();
        }
    }

    @Override // android.graphics.drawable.Animatable2.AnimationCallback
    public final void onAnimationStart(Drawable drawable) {
        m45 m45Var = this.a;
        if (m45Var != null) {
            m45Var.invoke();
        }
    }
}
