package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class syc extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private AnimatorSet f23595dj;

    /* renamed from: lt, reason: collision with root package name */
    private TextView f23596lt;
    private boolean lud;
    private wwx sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23597zb;

    public syc(Context context) {
        super(context);
        this.lud = true;
        this.ycx = context;
        this.f23595dj = new AnimatorSet();
        sya();
        dj();
        post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.syc.1
            @Override // java.lang.Runnable
            public void run() {
                int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.ycx, 50.0f);
                int iYcx2 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.ycx, 50.0f);
                if (syc.this.sya.getMeasuredHeight() > 0) {
                    iYcx = syc.this.sya.getMeasuredHeight();
                }
                if (syc.this.sya.getMeasuredWidth() > 0) {
                    iYcx2 = syc.this.sya.getMeasuredWidth();
                }
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) syc.this.f23597zb.getLayoutParams();
                layoutParams.topMargin = ((int) ((iYcx / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.getContext(), 5.0f))) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.ycx, 40.0f));
                layoutParams.leftMargin = ((int) ((iYcx2 / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.getContext(), 5.0f))) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.ycx, 20.0f));
                layoutParams.bottomMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.getContext(), 5.0f) + ((-iYcx) / 2.0f));
                layoutParams.rightMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(syc.this.getContext(), 5.0f) + ((-iYcx2) / 2.0f));
                layoutParams.setMarginStart(layoutParams.leftMargin);
                layoutParams.setMarginEnd(layoutParams.rightMargin);
                syc.this.f23597zb.setLayoutParams(layoutParams);
            }
        });
    }

    public void setGuideText(String str) {
        this.f23596lt.setVisibility(0);
        this.f23596lt.setText(str);
    }

    public void setGuideTextColor(int i5) {
        this.f23596lt.setTextColor(i5);
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23597zb, "scaleX", 1.0f, 1.0f, 1.0f, 0.9f);
        objectAnimatorOfFloat.setDuration(600L);
        objectAnimatorOfFloat.setRepeatMode(2);
        objectAnimatorOfFloat.setRepeatCount(-1);
        objectAnimatorOfFloat.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.lt.syc.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
                if (syc.this.lud) {
                    syc.this.sya.ycx();
                }
                syc.this.lud = !r2.lud;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(syc.this.f23597zb, "alpha", 0.0f, 1.0f);
                objectAnimatorOfFloat2.setDuration(200L);
                objectAnimatorOfFloat2.setInterpolator(new LinearInterpolator());
                objectAnimatorOfFloat2.start();
                syc.this.f23597zb.setVisibility(0);
            }
        });
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f23597zb, "scaleY", 1.0f, 1.0f, 1.0f, 0.9f);
        objectAnimatorOfFloat2.setDuration(600L);
        objectAnimatorOfFloat2.setRepeatMode(2);
        objectAnimatorOfFloat2.setRepeatCount(-1);
        this.f23595dj.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
    }

    private void sya() {
        this.sya = new wwx(this.ycx);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 50.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 50.0f));
        layoutParams.gravity = 8388659;
        layoutParams.topMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 40.0f);
        int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 20.0f);
        layoutParams.leftMargin = iYcx;
        layoutParams.setMarginStart(iYcx);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        addView(this.sya, layoutParams);
        this.f23597zb = new ImageView(this.ycx);
        ViewGroup.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 78.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 78.0f));
        this.f23597zb.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_hand"));
        addView(this.f23597zb, layoutParams2);
        TextView textView = new TextView(this.ycx);
        this.f23596lt = textView;
        textView.setTextColor(-1);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 81;
        layoutParams3.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 10.0f);
        addView(this.f23596lt, layoutParams3);
        this.f23596lt.setVisibility(8);
    }

    public void zb() {
        AnimatorSet animatorSet = this.f23595dj;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
        wwx wwxVar = this.sya;
        if (wwxVar != null) {
            wwxVar.zb();
        }
        ImageView imageView = this.f23597zb;
        if (imageView != null) {
            imageView.clearAnimation();
        }
    }

    public void ycx() {
        this.f23595dj.start();
    }
}
