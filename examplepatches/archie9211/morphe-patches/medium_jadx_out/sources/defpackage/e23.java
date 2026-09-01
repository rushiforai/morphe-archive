package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e23 extends AnimatorListenerAdapter {
    public final /* synthetic */ g23 a;
    public final /* synthetic */ View b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ blc d;
    public final /* synthetic */ c23 e;

    public e23(g23 g23Var, View view, boolean z, blc blcVar, c23 c23Var) {
        this.a = g23Var;
        this.b = view;
        this.c = z;
        this.d = blcVar;
        this.e = c23Var;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        animator.getClass();
        ViewGroup viewGroup = this.a.a;
        View view = this.b;
        viewGroup.endViewTransition(view);
        boolean z = this.c;
        blc blcVar = this.d;
        if (z) {
            flc flcVar = blcVar.a;
            view.getClass();
            flcVar.applyState(view);
        }
        this.e.d();
        if (f25.I(2)) {
            Log.v("FragmentManager", "Animator from operation " + blcVar + " has ended.");
        }
    }
}
