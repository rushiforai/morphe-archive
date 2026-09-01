package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import com.google.android.material.behavior.HideBottomViewOnScrollBehavior;
import com.google.android.material.behavior.HideViewOnScrollBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pj5 extends AnimatorListenerAdapter {
    public final /* synthetic */ int a;
    public final /* synthetic */ View b;
    public final /* synthetic */ Object c;

    public /* synthetic */ pj5(int i, View view, Object obj) {
        this.a = i;
        this.c = obj;
        this.b = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        int i = this.a;
        View view = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                HideBottomViewOnScrollBehavior hideBottomViewOnScrollBehavior = (HideBottomViewOnScrollBehavior) obj;
                hideBottomViewOnScrollBehavior.k = null;
                if (hideBottomViewOnScrollBehavior.j == 1 && view.getVisibility() == 0) {
                    view.setVisibility(4);
                    break;
                }
                break;
            case 1:
                HideViewOnScrollBehavior hideViewOnScrollBehavior = (HideViewOnScrollBehavior) obj;
                hideViewOnScrollBehavior.k = null;
                if (hideViewOnScrollBehavior.j == 1 && view.getVisibility() == 0) {
                    view.setVisibility(4);
                    break;
                }
                break;
            default:
                f4f f4fVar = (f4f) obj;
                f4fVar.a.e(1.0f);
                b4f.f(view, f4fVar);
                break;
        }
    }
}
