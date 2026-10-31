package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* loaded from: classes2.dex */
public class zb extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private View f23631dj;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private Context f23632jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f23633jw;

    /* renamed from: lt, reason: collision with root package name */
    private View f23634lt;
    private View lud;
    private boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private ImageView f23635ul;
    private AnimatorSet ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ObjectAnimator f23636zb;

    public zb(Context context, int i5, int i11) {
        super(context);
        this.sya = false;
        this.ycx = new AnimatorSet();
        this.fby = i5;
        this.f23633jw = i11;
        this.f23632jc = context;
        sya();
        dj();
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23631dj, "scaleX", 1.0f, 2.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f23631dj, "scaleY", 1.0f, 2.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.lud, "scaleX", 1.0f, 2.5f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat4 = ObjectAnimator.ofFloat(this.lud, "scaleY", 1.0f, 2.5f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat5 = ObjectAnimator.ofFloat(this.f23634lt, "scaleX", 1.0f, 1.5f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat6 = ObjectAnimator.ofFloat(this.f23634lt, "scaleY", 1.0f, 1.5f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat7 = ObjectAnimator.ofFloat(this.f23635ul, "rotation", 0.0f, -20.0f, 0.0f);
        this.f23636zb = objectAnimatorOfFloat7;
        objectAnimatorOfFloat7.setDuration(1000L);
        this.ycx.setDuration(a.f39430h);
        this.ycx.setInterpolator(new AccelerateDecelerateInterpolator());
        this.ycx.play(objectAnimatorOfFloat).with(objectAnimatorOfFloat2).with(objectAnimatorOfFloat3).with(objectAnimatorOfFloat4).with(objectAnimatorOfFloat5).with(objectAnimatorOfFloat6);
        this.ycx.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.lt.zb.1
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
                zb.this.sya = true;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                if (zb.this.sya) {
                    return;
                }
                zb.this.f23636zb.start();
                zb.this.ycx.start();
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }
        });
    }

    private void sya() {
        View view = new View(this.f23632jc);
        this.f23631dj = view;
        view.setBackground(ycx("#1A7BBEFF", "#337BBEFF"));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) (this.fby * 0.45d), (int) (this.f23633jw * 0.45d));
        layoutParams.gravity = 17;
        this.f23631dj.setLayoutParams(layoutParams);
        addView(this.f23631dj);
        View view2 = new View(this.f23632jc);
        this.lud = view2;
        view2.setBackground(ycx("#337BBEFF", "#807BBEFF"));
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) (this.fby * 0.25d), (int) (this.f23633jw * 0.25d));
        layoutParams2.gravity = 17;
        this.lud.setLayoutParams(layoutParams2);
        addView(this.lud);
        View view3 = new View(this.f23632jc);
        this.f23634lt = view3;
        view3.setBackground(ycx("#807BBEFF", "#FF7BBEFF"));
        int i5 = this.fby;
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams((int) (i5 * 0.25d), (int) (i5 * 0.25d));
        layoutParams3.gravity = 17;
        this.f23634lt.setLayoutParams(layoutParams3);
        addView(this.f23634lt);
        ImageView imageView = new ImageView(this.f23632jc);
        this.f23635ul = imageView;
        imageView.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_blue_hand"));
        this.f23635ul.setScaleType(ImageView.ScaleType.FIT_CENTER);
        FrameLayout.LayoutParams layoutParams4 = new FrameLayout.LayoutParams((int) (this.fby * 0.62d), (int) (this.f23633jw * 0.53d));
        layoutParams4.gravity = 17;
        layoutParams4.topMargin = (layoutParams4.width / 2) - 5;
        layoutParams4.leftMargin = (layoutParams4.height / 2) - 5;
        this.f23635ul.setLayoutParams(layoutParams4);
        addView(this.f23635ul);
    }

    public void zb() {
        this.sya = true;
        ObjectAnimator objectAnimator = this.f23636zb;
        if (objectAnimator == null || this.ycx == null) {
            return;
        }
        objectAnimator.cancel();
        this.ycx.cancel();
    }

    private GradientDrawable ycx(String str, String str2) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(str));
        gradientDrawable.setStroke(1, Color.parseColor(str2));
        return gradientDrawable;
    }

    public void ycx() {
        this.sya = false;
        ObjectAnimator objectAnimator = this.f23636zb;
        if (objectAnimator == null || this.ycx == null) {
            return;
        }
        objectAnimator.start();
        this.ycx.start();
    }
}
