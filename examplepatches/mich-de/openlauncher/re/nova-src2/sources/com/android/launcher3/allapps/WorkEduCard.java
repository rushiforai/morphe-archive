package com.android.launcher3.allapps;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import com.teslacoilsw.launcher.NovaLauncher;
import kl.q0;
import kz.a;
import o9.k;
import o9.n1;

/* loaded from: classes2.dex */
public class WorkEduCard extends FrameLayout implements View.OnClickListener, Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final NovaLauncher f21072a;

    /* renamed from: b, reason: collision with root package name */
    public final Animation f21073b;

    /* renamed from: c, reason: collision with root package name */
    public int f21074c;

    public WorkEduCard(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f21074c = -1;
        Context context2 = getContext();
        q0 q0Var = n1.C0;
        this.f21072a = (NovaLauncher) k.Y(context2);
        Animation animationLoadAnimation = AnimationUtils.loadAnimation(context, 17432577);
        this.f21073b = animationLoadAnimation;
        animationLoadAnimation.setDuration(500L);
        animationLoadAnimation.setAnimationListener(this);
    }

    public final void a(int i5) {
        this.f21074c = i5;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        if (this.f21074c == -1) {
            if (getParent() != null) {
                ((ViewGroup) getParent()).removeView(this);
            }
        } else {
            a aVar = this.f21072a.V.g().f83833g;
            aVar.r().f83886f.remove(this.f21074c);
            aVar.getAdapter().notifyItemRemoved(this.f21074c);
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f21073b.reset();
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        startAnimation(this.f21073b);
        this.f21072a.getSharedPrefs().edit().putInt("showed_work_profile_edu", 1).apply();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f21073b.cancel();
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        findViewById(2131427405).setOnClickListener(this);
        ((ViewGroup.MarginLayoutParams) findViewById(2131429257).getLayoutParams()).width = this.f21072a.V.a().s();
    }
}
