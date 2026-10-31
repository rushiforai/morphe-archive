package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.text.TextUtils;
import android.view.animation.PathInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class thx extends RelativeLayout {

    /* renamed from: dj, reason: collision with root package name */
    private TextView f23598dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f23599ea;
    private AnimatorSet fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f23600jc;

    /* renamed from: jw, reason: collision with root package name */
    private AnimatorSet f23601jw;

    /* renamed from: lt, reason: collision with root package name */
    private AnimatorSet f23602lt;
    private TextView lud;
    private ImageView sya;

    /* renamed from: ul, reason: collision with root package name */
    private AnimatorSet f23603ul;
    private ImageView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23604zb;

    public thx(Context context) {
        super(context);
        this.f23602lt = new AnimatorSet();
        this.f23603ul = new AnimatorSet();
        this.fby = new AnimatorSet();
        this.f23601jw = new AnimatorSet();
        this.f23599ea = 100;
        ycx(context);
    }

    public AnimatorSet getSlideUpAnimatorSet() {
        return this.f23602lt;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        zb();
    }

    public void setGuideText(String str) {
        TextView textView = this.f23598dj;
        if (textView != null) {
            textView.setText(str);
        }
    }

    public void setSlideText(String str) {
        if (this.lud != null) {
            if (TextUtils.isEmpty(str)) {
                this.lud.setText(b.f42142b);
            } else {
                this.lud.setText(str);
            }
        }
    }

    public void sya() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.ycx, "alpha", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.ycx, "alpha", 1.0f, 0.0f);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.ycx, "translationY", 0.0f, com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), -this.f23599ea));
        objectAnimatorOfFloat3.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(0, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23599ea));
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.thx.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                if (thx.this.sya != null) {
                    Integer num = (Integer) valueAnimator.getAnimatedValue();
                    RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) thx.this.sya.getLayoutParams();
                    layoutParams.height = num.intValue();
                    thx.this.sya.setLayoutParams(layoutParams);
                }
            }
        });
        valueAnimatorOfInt.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        ObjectAnimator objectAnimatorOfFloat4 = ObjectAnimator.ofFloat(this.sya, "alpha", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat5 = ObjectAnimator.ofFloat(this.sya, "alpha", 1.0f, 0.0f);
        ObjectAnimator objectAnimatorOfFloat6 = ObjectAnimator.ofFloat(this.f23604zb, "alpha", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat7 = ObjectAnimator.ofFloat(this.f23604zb, "alpha", 1.0f, 0.0f);
        ObjectAnimator objectAnimatorOfFloat8 = ObjectAnimator.ofFloat(this.f23604zb, "scaleX", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat9 = ObjectAnimator.ofFloat(this.f23604zb, "scaleY", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat10 = ObjectAnimator.ofFloat(this.f23604zb, "translationY", 0.0f, com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), -this.f23599ea));
        objectAnimatorOfFloat10.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        this.f23603ul.setDuration(50L);
        this.f23601jw.setDuration(a.f39430h);
        this.fby.setDuration(50L);
        this.f23603ul.playTogether(objectAnimatorOfFloat2, objectAnimatorOfFloat7, objectAnimatorOfFloat5);
        this.fby.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat6, objectAnimatorOfFloat8, objectAnimatorOfFloat9, objectAnimatorOfFloat4);
        this.f23601jw.playTogether(objectAnimatorOfFloat3, valueAnimatorOfInt, objectAnimatorOfFloat10);
        this.f23602lt.playSequentially(this.fby, this.f23601jw, this.f23603ul);
    }

    public void ycx(Context context) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.dj.ycx();
        }
        if ("5".equals(this.f23600jc)) {
            addView(com.bytedance.sdk.component.adexpress.sya.ycx.lt(context));
            this.f23599ea = (int) (this.f23599ea * 1.25d);
        } else {
            addView(com.bytedance.sdk.component.adexpress.sya.ycx.lud(context));
        }
        this.ycx = (ImageView) findViewById(2097610734);
        this.f23604zb = (ImageView) findViewById(2097610735);
        this.f23598dj = (TextView) findViewById(2097610730);
        this.sya = (ImageView) findViewById(2097610733);
        this.lud = (TextView) findViewById(2097610731);
    }

    public void zb() {
        try {
            AnimatorSet animatorSet = this.f23602lt;
            if (animatorSet != null) {
                animatorSet.cancel();
            }
            AnimatorSet animatorSet2 = this.fby;
            if (animatorSet2 != null) {
                animatorSet2.cancel();
            }
            AnimatorSet animatorSet3 = this.f23603ul;
            if (animatorSet3 != null) {
                animatorSet3.cancel();
            }
            AnimatorSet animatorSet4 = this.f23601jw;
            if (animatorSet4 != null) {
                animatorSet4.cancel();
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "aOIkkQaJefGJT8A=", "WO8jlgawWsuJTtJonDCuIVbvOZoR", 178);
            e3.getMessage();
        }
    }

    public thx(Context context, String str) {
        super(context);
        this.f23602lt = new AnimatorSet();
        this.f23603ul = new AnimatorSet();
        this.fby = new AnimatorSet();
        this.f23601jw = new AnimatorSet();
        this.f23599ea = 100;
        setClipChildren(false);
        this.f23600jc = str;
        ycx(context);
    }

    public void ycx() {
        sya();
        this.f23602lt.start();
        this.f23602lt.addListener(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.component.adexpress.lt.thx.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                thx.this.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.thx.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        thx.this.f23602lt.start();
                    }
                }, 200L);
            }
        });
    }
}
