package androidx.fragment.app;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.view.animation.Animation;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final Animation f14628a;

    /* renamed from: b, reason: collision with root package name */
    public final AnimatorSet f14629b;

    public n0(Animation animation) {
        this.f14628a = animation;
        this.f14629b = null;
    }

    public n0(Animator animator) {
        this.f14628a = null;
        AnimatorSet animatorSet = new AnimatorSet();
        this.f14629b = animatorSet;
        animatorSet.play(animator);
    }
}
