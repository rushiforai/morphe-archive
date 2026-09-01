package defpackage;

import android.util.Log;
import android.view.View;
import android.view.animation.Animation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f23 implements Animation.AnimationListener {
    public final /* synthetic */ blc a;
    public final /* synthetic */ g23 b;
    public final /* synthetic */ View c;
    public final /* synthetic */ c23 d;

    public f23(blc blcVar, g23 g23Var, View view, c23 c23Var) {
        this.a = blcVar;
        this.b = g23Var;
        this.c = view;
        this.d = c23Var;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        animation.getClass();
        g23 g23Var = this.b;
        g23Var.a.post(new ss(g23Var, this.c, this.d, 6));
        if (f25.I(2)) {
            Log.v("FragmentManager", "Animation from operation " + this.a + " has ended.");
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
        animation.getClass();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
        animation.getClass();
        if (f25.I(2)) {
            Log.v("FragmentManager", "Animation from operation " + this.a + " has reached onAnimationStart.");
        }
    }
}
