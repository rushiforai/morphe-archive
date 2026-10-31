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
public class ry extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private AnimatorSet f23589dj;

    /* renamed from: lt, reason: collision with root package name */
    private TextView f23590lt;
    private boolean lud;
    private dj sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23591zb;

    public ry(Context context) {
        super(context);
        this.lud = true;
        this.ycx = context;
        this.f23589dj = new AnimatorSet();
        sya();
        dj();
        post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.ry.1
            @Override // java.lang.Runnable
            public void run() {
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) ry.this.f23591zb.getLayoutParams();
                layoutParams.topMargin = ((int) ((ry.this.sya.getMeasuredHeight() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.getContext(), 5.0f))) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.ycx, 20.0f));
                layoutParams.leftMargin = ((int) ((ry.this.sya.getMeasuredWidth() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.getContext(), 5.0f))) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.ycx, 20.0f));
                layoutParams.bottomMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.getContext(), 5.0f) + ((-ry.this.sya.getMeasuredHeight()) / 2.0f));
                layoutParams.rightMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(ry.this.getContext(), 5.0f) + ((-ry.this.sya.getMeasuredWidth()) / 2.0f));
                layoutParams.setMarginStart(layoutParams.leftMargin);
                layoutParams.setMarginEnd(layoutParams.rightMargin);
                ry.this.f23591zb.setLayoutParams(layoutParams);
            }
        });
    }

    public void setGuideText(String str) {
        this.f23590lt.setText(str);
    }

    public void setGuideTextColor(int i5) {
        this.f23590lt.setTextColor(i5);
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23591zb, "scaleX", 1.0f, 0.8f);
        objectAnimatorOfFloat.setDuration(1000L);
        objectAnimatorOfFloat.setRepeatMode(2);
        objectAnimatorOfFloat.setRepeatCount(-1);
        objectAnimatorOfFloat.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.lt.ry.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
                if (ry.this.lud) {
                    ry.this.sya.ycx();
                    ry.this.sya.setAlpha(1.0f);
                } else {
                    ry.this.sya.zb();
                    ry.this.sya.setAlpha(0.0f);
                }
                ry.this.lud = !r2.lud;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(ry.this.f23591zb, "alpha", 0.0f, 1.0f);
                objectAnimatorOfFloat2.setDuration(200L);
                objectAnimatorOfFloat2.setInterpolator(new LinearInterpolator());
                objectAnimatorOfFloat2.start();
                ry.this.f23591zb.setVisibility(0);
            }
        });
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f23591zb, "scaleY", 1.0f, 0.8f);
        objectAnimatorOfFloat2.setDuration(1000L);
        objectAnimatorOfFloat2.setRepeatMode(2);
        objectAnimatorOfFloat2.setRepeatCount(-1);
        this.f23589dj.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
    }

    private void sya() {
        this.sya = new dj(this.ycx);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f));
        layoutParams.gravity = 8388659;
        layoutParams.topMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 20.0f);
        int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 20.0f);
        layoutParams.leftMargin = iYcx;
        layoutParams.setMarginStart(iYcx);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        addView(this.sya, layoutParams);
        this.sya.ycx();
        this.f23591zb = new ImageView(this.ycx);
        ViewGroup.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f));
        this.f23591zb.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_hand"));
        addView(this.f23591zb, layoutParams2);
        TextView textView = new TextView(this.ycx);
        this.f23590lt = textView;
        textView.setTextColor(-1);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 81;
        layoutParams3.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 10.0f);
        addView(this.f23590lt, layoutParams3);
    }

    public void zb() {
        AnimatorSet animatorSet = this.f23589dj;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
        dj djVar = this.sya;
        if (djVar != null) {
            djVar.zb();
        }
    }

    public void ycx() {
        this.f23589dj.start();
    }
}
